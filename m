Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0C00177240
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:48:07 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y143so22798656pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=zz9TAilGoZ7TxmTrSH/loHRkAl4igBLKDlUey2YVz/4=;
	b=EzPqRssDE8zVE/HcgpGz5TPmPs23liUYDVVKKKHCbuyhMtcCmmj7b3wm0jwQOl0K7r
	hVg+QnY8fFz4RxoSqxjiTbQZiP7veqwNsbtzm8y+UzGGpYqZOd+ssP2HOBWpR85gDWke
	W81XpXvAFpKVEulopFGtqmS0fLAVVYj6YIJgCyCGZaR8Wu25CC9ie+Kf1fuo+IZsdjx6
	43vtwtRGMiu7uliv97qUr3axPtRef/xkoC7ZG0YXIJaS+fgVRk8bNFwmtp6kki0WkIa5
	kScan1T0vNQqi+DDsJoFcO57mg5gMBKMAuunO3EoN2cHSbRw2HgrWFjrFvCpIb/LGAYZ
	vbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=zz9TAilGoZ7TxmTrSH/loHRkAl4igBLKDlUey2YVz/4=;
	b=iE/oxf2r/PuD/zx7UGoFmqD3fJMuM9L5YJRDvB8VzFk7PYn/cHUBPYTNLFrHEhg+TQ
	tY7MKIub9FZyyfYqek2eLB8Fl/RHGUdD/yMqVt3fIm/jGttsXExLxV/LXkEeYiVfFYmG
	quAikmaTDMkkJxGqZrFPxgOKdInqkAHYY8i0RyW4wiGSZvW+LNyMoC3J41dxpEos0RCP
	PmXtfXbHCA8vINCRZ2ha4rA8x3/w0VA6v0ZTWhvpp87FVa21zMhiX/gMsifrHoBr4bgZ
	TjT23B7uy3Al/vanwSxqiueNw0vyduChSwUV7qLnjHx5vOzV6AwZ/v/TzV/NM3y6QiwE
	h2Ew==
X-Gm-Message-State: AIkVDXKEjgBESuctEY7S3j2dzdwKBb8veJ02DcKaa+foWPtiUxEB5DOTzOZ+NgLE+GWEPQ==
X-Received: by 10.99.178.89 with SMTP id t25mr22164342pgo.183.1485762487591;
	Sun, 29 Jan 2017 23:48:07 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	d69sm29673194pfd.11.2017.01.29.23.48.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:48:07 -0800 (PST)
Date: Mon, 30 Jan 2017 17:47:45 +1000
Message-Id: <20170130074745.584-3-nathan@nathanrossi.com>
In-Reply-To: <20170130074745.584-0-nathan@nathanrossi.com>
References: <20170130074745.584-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 3/4] libgcrypt.inc: Add PACKAGECONFIG for 'capabilities'
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
X-List-Received-Date: Mon, 30 Jan 2017 07:48:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add PACKAGECONFIG options for 'capabilities' which enables the libcap
dependency.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index c8a48623b4..84c1cc018b 100644
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
+EXTRA_OECONF = "--disable-asm"
+
+PACKAGECONFIG ??= "capabilities"
+PACKAGECONFIG[capabilities] = "--with-capabilities,--without-capabilities,libcap"
 
 do_configure_prepend () {
 	# Else this could be used in preference to the one in aclocal-copy
-- 
2.11.0


