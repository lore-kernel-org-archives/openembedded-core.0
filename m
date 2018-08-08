Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 563A778875
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:33 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id f14-v6so1358490pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xqZoWAcpZ2/Zg7wEVg1dgya9WLpijnFSV3FLRuxyybo=;
	b=edhBxA6LQSijQjMNk98ojZbvmiDpYE2UWN5dxT0YzyFeJ2kqbwO+A5HD/moJymUQnO
	0FCcDokKYpxlPKv2ZRAOmo0tDJIaVLEQx8cl0T9LwIh+WYzfkav9vPIJY+h4SexFEzPp
	pMwVUh6qj5EtpEQnydYHD8ADL1BgdHXi+CpSKWylKmLLRza73LQyFyAmkdKOmgu4VhlP
	xCWw00F0Goo7GT2xJTHHrQ6QjBP5x2+SoZF9xKkb1kxtz+Z3R8MJXDw/K1Ib/u9nPLw9
	BRehYrvr/IFO3f75xJ7ZYQlwnPt5QbgIPvvHP9oTeYAq+197uINuA00Retou0iNRSSSK
	+UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xqZoWAcpZ2/Zg7wEVg1dgya9WLpijnFSV3FLRuxyybo=;
	b=p8aV7oZz1060lq633ByHSSELD+ZdDza0wHkZkNG9ka8FPxjUBqKWo5QJ0t1+HbZ3DX
	PFMq+8qC1+vp465wz0mJgiCvmPZQcgxvDm9aS7Nh0wkmuoxlWTJA7P52sZ700uEOMW86
	MswJuQRlX5Bf3p5u4VsDnFZ6OD7w/n7FB8DVdMUOa64WSr/02Fxqf8H+1iZfni3IW4lT
	yeHV9yqrWXCClACYrBGY3RRQRoLu5ebAIUNFzc12tdB09SN/d07uIlO4z5pppVhW7kNV
	I8lnK//ZlqFzEDM/m+uUSqaZwkBE0qX3rc8WYWGq5PYmHk9APv8VXSzexqGEiB5yRWN4
	d7vQ==
X-Gm-Message-State: AOUpUlEHX00Gu3A6YG8oyXDVy1+QgoQH5Va3cDlmdVLu8rv3KGnM489p
	btT8Q2hXsi4QGzhSCiliBB1uADmx
X-Google-Smtp-Source: AA+uWPyjAkwejUZxR4XvRmWR5AyrLRaexzCmWZW+uwuw4w5lspDqdeFWhQiWtwDOhAOhAB5P65gYQw==
X-Received: by 2002:a63:b256:: with SMTP id
	t22-v6mr3416462pgo.101.1533747874127; 
	Wed, 08 Aug 2018 10:04:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:19 -0700
Message-Id: <9bd9cf4b0a3e3028f6654f54b20bfd367f08cca0.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
Subject: [PATCH 2/8] cross-localedef-native: Update to build with glibc 2.28
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.28.bb b/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
index 0992e0285d..a05b94e3b3 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
@@ -22,7 +22,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
 SRCREV_glibc ?= "3c03baca37fdcb52c3881e653ca392bba7a99c2b"
-SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
+SRCREV_localedef ?= "c328777219ccc480be3112cf807217ca6b570b64"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
-- 
2.18.0


