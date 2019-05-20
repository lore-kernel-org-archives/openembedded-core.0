Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B96FA7E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e15so14807778wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i3XHOkztN77p4HC7OxZvSCYxfHm6G/rqhxlYabHQsAU=;
	b=OiWk77gnBF9fyDXMSZvdzcTKEhX3gh80adhASBM0bd6f3mhMb5K0A73L1KD/lkidvW
	6AAOvNBUQ3Y0OUBYpul68UgCPDe7LacE2xcgySUz4UmuXMk1E2WxYVvgxUCweHG435d1
	mPwkE/jq2b4e7+FRzMrCHBkPdssQqTOxUyAVle1m8VwFp3PSvnZP2yjm25Cx+lr+W9BK
	7o2MkX6UsDqMl6uNsCEQdcXtluBtaXQNn9zM60eVKokD+RPu6dC8N9a8/0IDaB88TQCu
	isj39h1Rb1Y6BDVicg2+5pHacqfwOEh9Z/g5cWUDfBFnO47kvpsczh4sVEbWgeRZct0y
	eFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i3XHOkztN77p4HC7OxZvSCYxfHm6G/rqhxlYabHQsAU=;
	b=C+7fD0Ut7jBjyIsPCPrIPS9cunp6hyZKw3xCLxSD24Fw13mD+COVcje9vLH7/bv5+y
	Dc4nNSxcyK3jeRalDSDL7jb08S7o9S5dw2QPYogCQF8UAhTUfrLCH/1g7S7bxNEMtPkX
	jdUt677ssr/kYHxiXYuvyPd5RPATB/jIDDgold31LyiVMvMagmivOgMM5hxdMJiHXYXM
	SY4gFxF/nrtcAZmZdPaZ0l0LCIYI3eg97QAjKVocogWFMJx8AAenjEO0jsR4ilt6DYkN
	9kgZHXNvQoSBfA/BdsCbF3GdmBNmNYAflSCMblMkkdbuwwEY4/mCIPvjmtWjRfSbUOiA
	JALw==
X-Gm-Message-State: APjAAAWpm0jaMYm0pyncCHGpIFy3EJ0g8N32RrvIBOTRcH8MTQHNl8SD
	lLef2uUHoVwN4uyJuaqyiwomM6ML
X-Google-Smtp-Source: APXvYqwMKbPSTe31Omd3u5rNkblnRl1wTqdpdvb3Ux33Tr1vdvPOxalV9VWGqk9gJ+EMYILCurwILg==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr715511wru.183.1558361519509;
	Mon, 20 May 2019 07:11:59 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:10 +0200
Message-Id: <20190520141125.10805-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 27/42] libsoup-2.4: upgrade 2.66.1 -> 2.66.2
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
X-List-Received-Date: Mon, 20 May 2019 14:11:59 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup-2.4_2.66.1.bb => libsoup-2.4_2.66.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.66.1.bb => libsoup-2.4_2.66.2.bb} (90%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
similarity index 90%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index f0043f80b3e..c4715a04125 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -12,8 +12,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
            "
-SRC_URI[md5sum] = "5f04c09a06f6dbe4c4d3f003992145ce"
-SRC_URI[sha256sum] = "4a2cb6c1174540af13661636035992c2b179dfcb39f4d3fa7bee3c7e355c43ff"
+SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
+SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.17.1


