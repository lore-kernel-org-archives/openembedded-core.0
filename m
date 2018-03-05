Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9E41A78A5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:04 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k9so18076304wre.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vZdE154/7wPn8H8rQgnBuhkJa7JcChIb8mRgjrOaf6Y=;
	b=oTD1u+vLc8Z3amZR6/iDUVSUho9K9DOBnFCwkRKvpdgvnCjG5vm4dbTgQHDeqnubjv
	xRnZnkVMpaaZYlIPS0xgCo5qMUB+41TXcMB4czIi9y50xBHteO3D0YvAAUDPT1dapbe1
	U3Z9xDjEMeY4AunwlmdSppgiDA65h5WvFnc3xF9ee6YzydoDFMQrIqeW0J9s3ko5As3L
	/mJLYEjW8h8a4ZoMw/Vm1dAW/vP1El73z7OOAklFeAN+EssylhNEHtwWj1L+fgtNwtn6
	jKpvt9SIUb0WHLxFM//exNsPLlFNdrzPX+rOGBNepJV0eF2sf79FWu9uGR/0Y2xYjypH
	0Bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vZdE154/7wPn8H8rQgnBuhkJa7JcChIb8mRgjrOaf6Y=;
	b=YO62hYhAnDABjbul+OgYoWOcUUyv6CMJDkZsoSC9OeS/zTszCHZH+YlOY4dhp864Mz
	B+9gbq7LJ9edHG0ZLrg9xhfX/eZnZhR80y4snmThntV/kYUuRZd5XQ88SCe/vLwfWslz
	cNit+/t4cNjh2lI7Ninv24hj2fILkJeTUo104DwjOzWZfCGeU0qBcCTlUU7mqmuFnbSv
	Zr9baAgGreznRlYbuL7I1AD32IcK5FVw7JgokO9Yni3w2CqS+yR9/OgcawJ/qWjz/XRJ
	aPCVIbwd55lhq2Y9aAeaEMZpVGvqCWmD6/g5i/827l5Y73K/Mfwd1BvFwdgSpoJW0Qia
	9BVg==
X-Gm-Message-State: APf1xPAwQgu56VXb3WhJC+b8KqmagROrM9KwezgX+N3o3gKXg97tuqGW
	6RsJxhqJ2SwnolC23PXsEpylSMS6
X-Google-Smtp-Source: AG47ELvvhYT+ep8Ul9rKHI3UyyRyGDfTc73mv/KfBKgUUJR8F15s3YRoHH/oRyhI8YH5bWh3zsrRoQ==
X-Received: by 10.223.139.144 with SMTP id o16mr12833093wra.279.1520270465572; 
	Mon, 05 Mar 2018 09:21:05 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:31 +0000
Message-Id: <20180305172046.21729-14-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 14/29] flex: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:04 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
index 032833ae7a9..29792efee87 100644
--- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
+++ b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
@@ -2,11 +2,11 @@ Upstream-Status: Inappropriate (embedded specific)
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 
-Index: flex-2.5.37/doc/Makefile.am
+Index: flex-2.6.0/doc/Makefile.am
 ===================================================================
---- flex-2.5.37.orig/doc/Makefile.am	2012-07-21 04:18:27.000000000 +0300
-+++ flex-2.5.37/doc/Makefile.am	2013-07-30 17:57:09.834834531 +0300
-@@ -2,7 +2,7 @@
+--- flex-2.6.0.orig/doc/Makefile.am
++++ flex-2.6.0/doc/Makefile.am
+@@ -2,7 +2,7 @@ help2man = @HELP2MAN@
  
  info_TEXINFOS =	flex.texi
  dist_man_MANS = flex.1
@@ -14,4 +14,4 @@ Index: flex-2.5.37/doc/Makefile.am
 +EXTRA_DIST= flex.pdf
  
  CLEANFILES = \
- 	flex.hks \
+ 	flex.aux \
-- 
2.11.0


