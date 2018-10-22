Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 435C079BD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o17-v6so9750333wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=q0sU3h5xLOVUIvSu7ufN4IxikdDML8PtEI/3K5ss/NQ=;
	b=WG5fu4igJ26Zsz9yeZnCCrVcbIh7/dXtM57ooY1lEY7cftp4kJ0OzjGlPih8QbvlgB
	ObqRE0G71Q2Jqe3rK/Ql+ngtvDFVRS6Se/pbLiS91U/G6qevI0c6c9rHG/HCvBz69i0B
	8JqtwNM2AIVFDrHAeH5IheGAApOephRslmtQ/0w4BMvW2a8Pf4PZxN0Rfxjg9eI0NB42
	BNpergqWsVFjDJX0MC56tqol/E4NHdgH4Of1ntI8S3mjE7T6N0u380lM7Y6RyMbOjTJJ
	c+ae5IhZTLPe6OHeQNxQb8BqnqLOFpfT5IB3XeivjFxwp0MQ2Ya7+haSldae4XsXbgCu
	6JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q0sU3h5xLOVUIvSu7ufN4IxikdDML8PtEI/3K5ss/NQ=;
	b=OLv8HZBcLWicvmlCHyNj5rZJtI5FyMcN9+qwnYp4vHs+g8VeusMd2ghkrECJ3pHMt8
	PznoZPo5aLufGkb/aJpx08EPN3CEAo02jyXttDMW68OGpJIpQOmMbVw+Qis6KqxTS1RX
	e/2fhIrJ/bxojsm+GfDrwe4de5c8qhBMBpz3kU7wMwQVbUNpIWxG8xYHwIvuE2E2giCc
	uhsBP0JNSY264zjiYRqijQ9B/CpPD3Gf5aBrPgCdwZuFDztBCIB3sHhtEf5JrwBwvYYD
	jIdIebbeI8eABQ8MvnU1eTThqn0zc0uhE855Ate/lIHESpLcSmQjR915EZpLKa7qW0Hd
	FXgA==
X-Gm-Message-State: ABuFfoiMgGRj9wJuTyqZLHZAV6oac1cHZJ6KS/kOjR4Y6kIFzp1nj9Tj
	MnEv3T1NNGrNeNBUnlHx+BhUb6NYPno=
X-Google-Smtp-Source: ACcGV63kmF3gDLrB8n8jY472syrBntF5piYuxuvfKtPr3EaRoX1IFK+f04nYrVAcjO7IGFPWFouY6w==
X-Received: by 2002:a1c:950f:: with SMTP id
	x15-v6mr15604008wmd.3.1540217125889; 
	Mon, 22 Oct 2018 07:05:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:03 +0100
Message-Id: <1540217112-24479-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 04/13] libpcre2: update to 10.32
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:25 -0000

LIC_FILES_CHKSUM changed do to typo fixes and tidies for 10.32

see: https://www.pcre.org/changelog.txt

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libpcre/{libpcre2_10.31.bb => libpcre2_10.32.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.31.bb => libpcre2_10.32.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.31.bb b/meta/recipes-support/libpcre/libpcre2_10.32.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.31.bb
rename to meta/recipes-support/libpcre/libpcre2_10.32.bb
index a10c312..3a0aa53 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.31.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.32.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=f5e4bde9fd0493d0967b4dba9899590f"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=cf66d307bf03bae65d413eb7a8e603a0"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "e0b91c891a3c49050f7fd15de33d0ba4"
-SRC_URI[sha256sum] = "e07d538704aa65e477b6a392b32ff9fc5edf75ab9a40ddfc876186c4ff4d68ac"
+SRC_URI[md5sum] = "8a096287153fb994970df3570e90fcb5"
+SRC_URI[sha256sum] = "f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.7.4


