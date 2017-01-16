Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6FA71BA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:31 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so5489345pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=7jcrEqeXaSMWpi+HUDCcVmOXIdcq/X8iTpHqSEW30ww=;
	b=LcTTjdi6xGOBe5Xtll4MGOyQLOhpUCDYOva14hSBirthL+aCy+bHY/Y16Mr1qoZWIf
	qm/3xfBKnnl/9OTocB6b/Sv5/7lnumVJgUJnU0EyM4KXU4f/zblTjOJBEDzYPaCEiWxE
	TlX0sBxM58/+DvD15ZRzwM+8+NGivAsGapBUi3viMK9NhAzWGyZK3Vw1Vu/vmCaoulEk
	xkZVwMkAY04P/l5nSmNID7Ui2AUosI5h4l18EXjZXJf02RWuD0dqVZkj52JngkaFBc7C
	UZsrLcwnvHegSQ/Afuur5XAgWy/KSudouptSSzAsbt7dU4whqjcnNxEQDSuZxDUr1C/o
	CLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=7jcrEqeXaSMWpi+HUDCcVmOXIdcq/X8iTpHqSEW30ww=;
	b=oRrw5BiNlGuHtGW452BdYO9mZA80jXxNrx+2vsU9I/24KWsKrOg46crlSfIb30sBnb
	azVthDMsbbBUm99R4fT+QmWjgkFeIdHklaqb+prXZVzwQ+wfKu/cibk6/GYzI7ZywBoZ
	J7cC2eMi1D7PzEwVWdR7vGFvNOR2DC8tC7/4927fpm8vAviNAfU2dQGNZeE/56PFMhQI
	W4WsYZ2AgwVkRx/z4K1fohsJzEWeN4YzaAzJI4ofuZSkPWsjMXqGWTfTSX7jFMT2TIej
	s5te6iwchnsWDsQQ94xNOUnazaKDccv/UA7dXBM7gL5JiHWdzMN643vKEvr3YguhSpfe
	FhxQ==
X-Gm-Message-State: AIkVDXIPfFi4ZSzLoPtWr3llYMteVt5fyyIEdpur5Qrh5wz7IGn7kK3yzlKM7s9OcpNWrQ==
X-Received: by 10.84.231.205 with SMTP id g13mr48714976pln.118.1484576251593; 
	Mon, 16 Jan 2017 06:17:31 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	c15sm48261006pfd.36.2017.01.16.06.17.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:31 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-22-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 22/30] libgcrypt.inc: Add PACKAGECONFIG for 'capabilities' and 'asm'
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add PACKAGECONFIG options for 'capabilities' and 'asm'. The
'capabilities' option implies the libcap dependency.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index c8a48623b4..7464637acd 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -12,7 +12,7 @@ LICENSE_dumpsexp-dev = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
 
-DEPENDS = "libgpg-error libcap"
+DEPENDS = "libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
@@ -26,7 +26,10 @@ BINCONFIG = "${bindir}/libgcrypt-config"
 
 inherit autotools texinfo binconfig-disabled pkgconfig
 
-EXTRA_OECONF = "--disable-asm --with-capabilities"
+PACKAGECONFIG ??= "capabilities"
+
+PACKAGECONFIG[asm] = "--enable-asm,--disable-asm"
+PACKAGECONFIG[capabilities] = "--with-capabilities,,libcap"
 
 do_configure_prepend () {
 	# Else this could be used in preference to the one in aclocal-copy
-- 
2.11.0


