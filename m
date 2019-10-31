Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 68F5C7F951
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:37:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e11so5436670wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KvqAovypxngzEACLW9oYEv6MVM0PMcZfg3jSy59+lCc=;
	b=tqL4rbDmUf2Z9/WQfx7L4SF1+MMlBKkb/yDd641H9W2eqYNoLfRNNQpZ04+5vSKLQq
	jODQd1Q//35Zsutgsw2nq0dqziTGqEl46wPMiFpHs4452pmFypdcctBYiJaN1J7Bu712
	jTa0dqfMLjJixyu/Oz9N2RO5FDMJ08mEIhzkxzPLOfgeUoX95KJuAgf1gycB34J0t54g
	WA6G/LcADNibfUUZ/zrvDZ6JGuR9VSFGfxTLAqLIa/WjwTf022DZyA8ykkpkl/LobVa+
	QHDDncylyZBBQNEWruNkXpluT3b6NHDoLDpJDrFWIyCmYSZZ7kbXnW26M1eleBv74GD1
	Jx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KvqAovypxngzEACLW9oYEv6MVM0PMcZfg3jSy59+lCc=;
	b=RGtKF1HQ8BiQXvMam/GzT/tl9pVDXhb3ElyKKzz/DG5/CxpvripbCcDvjDdXWAuSAb
	jc5VOQMA8uZ8fIblMv2lpzVp92zsXncwKoCqwge2DxyvQykpIgorF+sO469imIdzTg3u
	Mt4+XEfenP4MJwVIHzDN1HOsfL6PMzEcSj8xIXOKh3grMWt7YNR2Baj4Tnpi/3lXNzBl
	GXBH6O6St9zckk/5sE0Owgjo9RjqEVlD2apKvs21DaZ50vhMwLY1tIzQJYHyqsdqWfD4
	fRlXtfbOIo54MfAy7orpTE6dFHWamyi29KKr4CgKMyP6GR+eCPhI1w6uiu9J3b0DvxTM
	22gw==
X-Gm-Message-State: APjAAAWjinl8DZV5M1GHcFlhtXVySvinTMfl1JPoGImDrLvJNa1pXTyI
	k8yEI2qMBE7dEyMl+FT/SymQJ5csj4o=
X-Google-Smtp-Source: APXvYqzkIFJatw9cDDR5o2m8z/ho7ys7AXw6vqlEdEIL9yuHmw2MEuu9veGc/oVtLsA7o33dEhe21A==
X-Received: by 2002:adf:dc81:: with SMTP id r1mr1152642wrj.84.1572514628857;
	Thu, 31 Oct 2019 02:37:08 -0700 (PDT)
Received: from localhost.localdomain ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	b186sm2950263wmb.21.2019.10.31.02.37.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 02:37:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:36:54 +0100
Message-Id: <20191031093655.14852-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031093655.14852-1-alex.kanavin@gmail.com>
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/6] btrfs-tools: update to 5.3
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
X-List-Received-Date: Thu, 31 Oct 2019 09:37:08 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.2.2.bb => btrfs-tools_5.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.2.2.bb => btrfs-tools_5.3.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
index 6b73c01dccb..12b5c4562dc 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "55a8c9626fb906c20c3206f8fd39b9a8fb259b79"
+SRCREV = "de7856cee5907938441f765ebab7cc106b7faf70"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


