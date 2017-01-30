Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C002A77225
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:48:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so22798771pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=NOz7uOEYV1dZXgOUdt4BsMcyZqQtUjiJSTwPhl69iJ8=;
	b=HJNPbLNfiQRqT2Oqixkty/DRvLWQR/xhNId1JbxsIgD7mC8z0K+QlrQKt/gdgy8Hou
	QU8mn8jS5n0MBd6VX1ys72jkuxp+6F0tsaI0DOHO766PYDlYk6wUF+J7udWKAC1CNNwb
	JfCXZgrVLeEdNYuOzeBkS99WBLJnn9yJgzL8fn4O8o+CbdjqPp8lcYg2XJ3L2wzUsnq5
	yEaMvSly7zRt/YSCrJc79+5Ey6g4NRfkBKQNK22Kpo7nLFJKQTBWmrjDSgZI3plY1OY7
	r6so+IbFw34v3fvQQ+UYxzwd8YJhYqKF6hSPD1Ud4o9tS0xzAOeE8q2LNoVR1vxGJO8A
	wJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=NOz7uOEYV1dZXgOUdt4BsMcyZqQtUjiJSTwPhl69iJ8=;
	b=NsVMnxxAY6q2m1f1Z9/MvItIDInZPNGrT5yBJFVZBz5m9nX7Ct4jvw6TQGHCRcLa5J
	HahoKj9hdCTQmj56Xcz2THmuJI5kQxx+/z7adlb/55gJlQ9mZU/y85B3E4Iq70HvLc6I
	JkCSC5LYV0q8V2lehCh/hMB1qDNE18SryReO+1E0RZOp/Z6htAy733u0N3RV9KvGWJph
	p6RAJtAkDDDvrz+n9vKqkESEiLMYqb/dSuSZhNCd1ttmHx6jIMKkhwYe+oioyJ6fzlbm
	59dWSwkxG2UXZJQRCCucZeXrVuScjsAxdkjOXz8xt+D09pvM135StRcxMJEhg8eMsBOv
	Y34g==
X-Gm-Message-State: AIkVDXK4wByPTa4YbeIEulElMi7GjGt1CjvD37G1TJXvFeKIOj9inqUBOsOx0CeO2FYN4g==
X-Received: by 10.84.217.18 with SMTP id o18mr30002207pli.51.1485762492207;
	Sun, 29 Jan 2017 23:48:12 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	j28sm29670133pfj.2.2017.01.29.23.48.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:48:11 -0800 (PST)
Date: Mon, 30 Jan 2017 17:47:45 +1000
Message-Id: <20170130074745.584-4-nathan@nathanrossi.com>
In-Reply-To: <20170130074745.584-0-nathan@nathanrossi.com>
References: <20170130074745.584-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 4/4] libgcrypt.inc: Enable use of binconfig
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
X-List-Received-Date: Mon, 30 Jan 2017 07:48:11 -0000
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
index 84c1cc018b..a1a9066097 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-asm"
 
-- 
2.11.0


