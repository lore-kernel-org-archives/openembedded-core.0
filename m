Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id CB72D61424
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:47:05 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id p14so7753363pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3z+0mrKkRVR+rfwWSdjm8HOgbJSjZg1UH4s3euUQi3o=;
	b=tWByhiOz/XJS2thfm935WfJ6i6bKErqOhSBXEyAPpnCozupeaTYmzTt5F+1o8/ehUg
	YGphsUUq5n7yAGAMG61+V6hlvBPUGjZxJpKKOFFGSKtLpkE+iz8CP4CeryPg9nY4mwzw
	mgMol0zVLJ30pUhhWhCM09BoLRzxHMbiLnsw6x3fYFxb/GUx8SEkCgsXjeUXWmJ5xrn9
	8iqyspJ+z0xFbiaqfg9tX1P+zAqXpen7Q82XRgu9CVeN8dVpJtCU5VZYcNu2dFOxoQLw
	xyoytrcT1joV/n6BadFhl+UbzsG/P3AQ3GJIsKB3k9CiAyXMIZkTHwAy6DYbAbh9X/Sv
	imFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3z+0mrKkRVR+rfwWSdjm8HOgbJSjZg1UH4s3euUQi3o=;
	b=Kj3NW9ceDyms2Ft5h2ftKXijErjun0yevokO9CjEGvzcOlZqc41y48GNx75Fk9tfGg
	MauATKyFye2HTXpFombHJUzq1kvYmeIdLTYFe3LylDpENSNCbXdHIdnkIV1MvTxdu2vY
	bCLcgm4ln3Uoqd5lhX6bsgOnIdyrfHEzjv6YIVHPl60FjHsCxqjXVmRe/z1h0sMaHWP0
	BcDrGUP6K9JSDMe7n6SMG+99R+/SIYccUPFjz6aGWxjXb/o1PVYiYsGzUmD9kTNhG+ac
	eIT7PSbuTQ0wT+jlHQbCxpEyax3igdrSziOtQGLrHPgq3SrPZLYnacPtnlq2tIlavRqX
	Blow==
X-Gm-Message-State: APjAAAUeyq0HCR1BAR+9Z0S+OJ2FnOMNZ1R9k1b9WZmD7zMwXlrNi0uU
	jIRVi3sztuPgf/9mLoKUlnQnzaMZC5k=
X-Google-Smtp-Source: APXvYqy/icFbJJ2Yarx2USOaEhzzvMOliRPBFqS6zvgkdBgW4xpEQsiSv12lBYpHnsbR+O0qAmENqA==
X-Received: by 2002:a65:43cb:: with SMTP id n11mr14112212pgp.65.1581886026376; 
	Sun, 16 Feb 2020 12:47:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	m12sm13877924pfh.37.2020.02.16.12.47.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 12:47:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 12:47:04 -0800
Message-Id: <20200216204708.7179-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216204708.7179-1-raj.khem@gmail.com>
References: <20200216204708.7179-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/7] joe: Inherit mime-xdg
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
X-List-Received-Date: Sun, 16 Feb 2020 20:47:06 -0000
Content-Transfer-Encoding: 8bit

Fixes
joe-4.6: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: joe path '/work/aarch64-yoe-linux/joe/4.6-r0/packages-split/joe/usr/share/applications/jpico.desktop'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/joe/joe_4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/joe/joe_4.6.bb b/meta-oe/recipes-support/joe/joe_4.6.bb
index b79e028f30..674736a68a 100644
--- a/meta-oe/recipes-support/joe/joe_4.6.bb
+++ b/meta-oe/recipes-support/joe/joe_4.6.bb
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
 PACKAGECONFIG ??= "curses"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-terminfo"
 
-inherit autotools-brokensep
+inherit autotools-brokensep mime-xdg
 
 SRC_URI[md5sum] = "9017484e6116830d846678b625ea5c43"
 SRC_URI[sha256sum] = "495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de"
-- 
2.25.0


