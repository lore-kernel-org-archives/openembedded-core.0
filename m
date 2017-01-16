Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BD2D471C7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:47 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e4so3922794pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=GdIC+QwnoCdB+cstFLjynaucfVcYiaSn2839/kGnG2k=;
	b=G81J7noAnlPSN/6LnGrMCzbWEr35NI4VU/bzwf7nxqpemVZreG8N/CF00TFVpPe+lG
	M7+kl8++yW2fBirpTNGeeg8fQqt5UNapFLmlzX+YTFL8+HwvCwsgND/zuozxfthrjrDl
	qBQSacRh2v9Ov2HrUsOU8HctGRlKsj9dt7In6B7FQEcJtEprB7HaqYPLRZsZoR81jWmV
	JoHGKaKxKRgBaCvML1WrPZtiKHAXzU5Pcs+gsmFjE/n/Fgcd83O2AV+maTmmnp0o/kgr
	w/rjPxLoD8M88WA8QkmNlVaQuQoWw35Z+SMdiO2+w/x3c/wdqAZqddLZkY/nbyeiNvKi
	JGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=GdIC+QwnoCdB+cstFLjynaucfVcYiaSn2839/kGnG2k=;
	b=Nw9xDJ1rIT4kVjYVjnSJAZw53fYfuSREB2y8hLXd+2qpQ2Z1kZi9acVk/GaM588gwc
	N4EUMBVh5XHwxjAHaJDOObzJcd204kRU0nFkdfNrcsYaAWYKGhYwJBV1coRYkD4pn+Sh
	Gl393r2/18Gk1ikGMZFaKAnPVmJFgZ3PVzATtNmhxgVAV62aWqptEY2YkDfwG7SuCkvS
	O83HyPtscQt1hfIYZV5GCop7GTxI99vkS+VTVLXMU/jVV7s1g4W8Bx08ED+sX71itR3+
	LO1HHhE5ivhBy53UDxZDe+MZKjYSBIBQ8s5vizxBiUsYo3VDcetlodPJNNVjr3lk4XrE
	TIbg==
X-Gm-Message-State: AIkVDXI6RVwKR+k4ihEICBiq5r2TZnaToD8A7cfw58W27HKERPvE1cHj0wB4Rg2T5rsyEQ==
X-Received: by 10.84.143.233 with SMTP id 96mr32937612plz.124.1484576268327;
	Mon, 16 Jan 2017 06:17:48 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	e189sm223578pfg.64.2017.01.16.06.17.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:47 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-25-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 25/30] libgcrypt.inc: Enable use of binconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2017 14:17:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Due to pkg-config support for libgcrypt being un-available for upstream
libgcrypt, some packages that depend on libgcrypt rely on the use of
libgcrypt-config (e.g. QEMU).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 3ef02ee994..1677a908d1 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -25,7 +25,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo binconfig pkgconfig
 
 PACKAGECONFIG ??= "capabilities"
 PACKAGECONFIG_remove_mingw32 = "capabilities"
-- 
2.11.0


