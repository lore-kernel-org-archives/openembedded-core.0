Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 561567964F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:47 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id f38-v6so8480935edd.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LiAsloVV2MPnbz84ZWsHAykl/C9HEXcGuDgpLqoih3M=;
	b=cXoneKs5XD324cQa+NVWDvSLQsHS2dRAVqoigCbYjiF3p4/5sqp3fBSKJqNXJDMFYB
	TKSWORqPnJl2ZQkarbJr9i1tR8Z7gSaHmU4Gw6VZuxSbV5Wmn8OC1xVS4WMssh44HStk
	b8p2ALRIE14gPpvFidWxLpLBRBr3Mx+DJc2zfW3l0h71+uq5yPXGqQrE3auriGQmPSIn
	bjdWE4RuD1RKdeTZqEGvEG6jJZPzjFGYcRmD7scWWlNnSrFr3F/nH3cRiSrvmmwxQXmW
	YuaVqg2jm2aarAcDTi90+7RgGp2Pj0GVpoWQW8pjbHwY6ThS9RBdCRpLXgP05h2tb2pN
	QX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LiAsloVV2MPnbz84ZWsHAykl/C9HEXcGuDgpLqoih3M=;
	b=eMgFmuIuMjxRD0ewWHTmxPq516BLLB2OVXePOPGF/kMg6qQ62mn9evD6FTHhoqfbt+
	jyf/WYFGaWock2VG+nqqP4aPq6ZClEBiwYpo5IhV7v9jcUMsg/lMj77/QetwsrUjwyTb
	9VFYVwNH8fx14bcpH+WiM922Ya3h7VMPbmQZYuO6NbcgQ8X0AL3vBHcNgOyDjVZLZF7b
	E7ybxyCZJUj+drVc/tKTr0Lz4fsbfdT4JCYYXaSvSDL9jt9RxCJYCAGHFm8UETa+j+M+
	G+mM+AiNJfnjJPhfJyhyZ3B9jeNn+kAG8TN4kg/yPkma3d+fNrvDpBUhm5Kbq2w/Bwki
	6QBw==
X-Gm-Message-State: APzg51C6JS2FhQItjmiJwPvrCZ7kwx3oUvGkrsWjOfMW5rLbVJWu4Hjt
	tQsr9de8vtdGO6EA1mP61aOZp74Mt/A=
X-Google-Smtp-Source: ANB0VdaWJQ8IYA4Nz/cLCgIlE5byXkFGujLfEtpyTNMAC33rE16+vfMtpj2ts4QzL3X0Dp7ukQCstw==
X-Received: by 2002:aa7:c441:: with SMTP id n1-v6mr2766892edr.55.1536230448008;
	Thu, 06 Sep 2018 03:40:48 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:24 +0200
Message-Id: <1536230436-30342-9-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 09/21] btrfs-tools: update to 4.17.1
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:48 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_4.17.bb => btrfs-tools_4.17.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.17.bb => btrfs-tools_4.17.1.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
index a3690d6..6b53fbcd 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "33d16ffc0d176ff4a217a0491378d20ad34e0a90"
+SRCREV = "7faaca0d9f78f7162ae603231f693dd8e1af2a41"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
-- 
2.7.4


