Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 01B1A7FDC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so5416030wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YT4k5Hdr/36LWb8aKgAVjq2LQnqwqWopUyWx9XOyyW8=;
	b=CN9NBtHrYM05ytrY0h3DryqPtyMKt5J6XW5W2QAJKyDi6+be51iOBthJwVs1w2NH3p
	Kv5wS0JhWY8CBACWsmiAWopAkvPmT3lRN023idcgCVKiv9iZFoBYnuF9qK3vJo8KJ5NX
	McBbFAM3m9H+B5C/cdUU1mwyZjzpbzKUA64O++pwMLm6dp9X7KTmNeO1o97EkVKHWnjy
	HqcIf8WfhYk8PEsY1ZxtDkgECYi2a0ba5OrgnIZtnxfxoN5jg2vcxAcMGMS4c40L9P6q
	/sre8gR8zcZzx20VE1la5razvaIzeN/MiQWVJpi+VFpYys+1Axnsz8a1XdmqadJZXlV1
	bzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YT4k5Hdr/36LWb8aKgAVjq2LQnqwqWopUyWx9XOyyW8=;
	b=c/VPjckw2Ga0sdm08NaCyU1UgWexv3f4iCjbjV8PLhDd3EsdyEoAnQENUyju6EOJn2
	WSh2pt1ZwiMLrSd9xY5umH7U3+wrhM8ME3LfQCuhWtVBCwohtb7xEkBeFHTsZ4ca0mLl
	lNz9fRg8SR/VGUONwWPp27MpO8Z+dgw8uMR+I6c99ofU4s/ZB2wEcN0wWZZYrHYkP85U
	ZXd2q2k6CS2e6H5+cIJ7Uk69ad1tIzNT/JIzGFVnWqG/Du1HyFS2d32OykJZw/tsogb0
	MKuzQixnbZsGbmRlybQIhKG8XDkiD++schapvatmmPuHvw61kv1Rt+BRmcjJP6/1ejN4
	dA3w==
X-Gm-Message-State: APjAAAWpaIr18tYt5fLW6Ljfe6X3c0tkU8XZEyBYd5I4B/9xcWe4r2uw
	FBZpe4sLRfomTabez0Iozoee+Klj6iQ=
X-Google-Smtp-Source: APXvYqwuR4thmvYsbAum1yOY8Tut8K8NLdwCi63vMK183i2lZ7IgzvqbLW0qejRU5ntfVHC8azuA6A==
X-Received: by 2002:a1c:5a0a:: with SMTP id o10mr9754888wmb.114.1576761800488; 
	Thu, 19 Dec 2019 05:23:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:52 +0100
Message-Id: <20191219132301.80034-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/16] libcomps: upgrade 0.1.12 -> 0.1.14
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libcomps/libcomps_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 34881bba372..40b60159bcd 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.12"
-SRCREV = "d0c8aa312dcab75c265ed6123f8afe0d7c8e91db"
+PV = "0.1.14"
+SRCREV = "5a0e04286f3462e3308f2a332eb0f90a66920218"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


