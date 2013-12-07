Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFC16D586
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 18:08:35 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so831469eek.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2013 10:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ST0dYJ3STv/T2fNbF6T8IT5DMVB+BnmpdOU2eHkhQH4=;
	b=fxNerM320n7FT6152xg9gsm0e8waN2RqvH1SvlteybhypeLViv9qg/WJ8kCEzCvJmG
	qMJtDyC4mw2cVAyXJ6np0nk34NnZ/2VAVLdtwuRdNCrnvmVjmkUDHTo+6TaNjjUwb6De
	hGwfrp09eaFZliTWYJPIAABlulVJ4b8+XolcUuq7F0tTFe0y22hKxZ2h7tcP5EhXBOZh
	Ukzjvx+diYVc5yk7eMemdaTwOQaG56WH5c91LPM1yG4dM3FQABKyX409Obr4SkXZxqNg
	ylrrzZJFev4t1MHdpDWOGWvKBEJX+ERkLCzaqLnDljCTdtDkWcxbcLfUXpK1M0eDpJba
	E6GQ==
X-Gm-Message-State: ALoCoQmJQSp/8bDN707486ZIibXKX7CyzG604T9s1E3eGlkgzaCbwG6jBr78C+NjbJd7jufcqzGa
X-Received: by 10.14.205.201 with SMTP id j49mr434202eeo.85.1386439714262;
	Sat, 07 Dec 2013 10:08:34 -0800 (PST)
Received: from localhost.localdomain (5-13-147-220.residential.rdsnet.ro.
	[5.13.147.220])
	by mx.google.com with ESMTPSA id h48sm8811035eev.3.2013.12.07.10.08.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Dec 2013 10:08:33 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2013 20:08:27 +0200
Message-Id: <1386439707-10416-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH V2 1/1] libav: Use "BP" and "libav" patch directory
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
X-List-Received-Date: Sat, 07 Dec 2013 18:08:35 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../{libav-0.8.9 => libav}/0001-configure-enable-pic-for-AArch64.patch  | 0
 meta/recipes-multimedia/libav/libav_0.8.9.bb                            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libav/{libav-0.8.9 => libav}/0001-configure-enable-pic-for-AArch64.patch (100%)

diff --git a/meta/recipes-multimedia/libav/libav-0.8.9/0001-configure-enable-pic-for-AArch64.patch b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
similarity index 100%
rename from meta/recipes-multimedia/libav/libav-0.8.9/0001-configure-enable-pic-for-AArch64.patch
rename to meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
diff --git a/meta/recipes-multimedia/libav/libav_0.8.9.bb b/meta/recipes-multimedia/libav/libav_0.8.9.bb
index 065a6d2..ce8b1ef 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.9.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.9.bb
@@ -1,6 +1,6 @@
 require libav.inc
 
-SRC_URI = "http://libav.org/releases/libav-0.8.9.tar.xz \
+SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
            file://0001-configure-enable-pic-for-AArch64.patch"
 
 SRC_URI[md5sum] = "7c0e5743cd5c4d4b1bcafd02a2e82e09"
-- 
1.8.1.4


