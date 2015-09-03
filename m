Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 151F577027
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:18 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so68803817ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TusmevZ6YEMxgy41OBND9tg8KjM+uf/6jSUXOU3efWc=;
	b=ipx0wV3PMxg20wHkziQc/NP0umM58XiveqWgVduqSF1LopyGweOHIYuknsXPXC6yVx
	ZfT0Mwp33xCh3FPiGj/bnXCPXkbVQ0+MoEj7gw9Q0dszxquebV4dblpnDZqWYe4VkHJ2
	azI0hYJVyxQcM6HGz8wMkiIyFGUWP4s6CXaQC70Bd8BWSLLAC137ekE/3NNHH92NFuhI
	0GiTrXTHw0bFbVgBxT/5kkzBAOZyhhroMd5abPv570a/RKvDVVTquSheVNSUWFDbga3j
	qdjOMZynlXuT6UbQpM1h8mUQBK81mKFBavPm5cCh5hdowaGaU+m49pqflUocPgIb8yWl
	7jTg==
X-Gm-Message-State: ALoCoQnKBkneGt2c5qZG7BOmoCnty3qH9JUd50dNqLjMps9lRkIjrFrLuwAhH5FqNKr/rRq64Zky
X-Received: by 10.107.165.202 with SMTP id o193mr946584ioe.179.1441305739061; 
	Thu, 03 Sep 2015 11:42:19 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id cr1sm166136igb.15.2015.09.03.11.42.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:30 +0200
Message-Id: <4ca14e7091a077bf3102084125fe83ad245c39dc.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441305437.git.patrick.ohly@intel.com>
References: <cover.1441305437.git.patrick.ohly@intel.com>
Subject: [PATCH 5/8] image-vm.bbclass: avoid duplicating syslinux default values
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:21 -0000

Some of the SYSLINUX defaults are the same as in the underlying
syslinux.bbclass. Let's not duplicate them, because that makes
changing the default harder.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-vm.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index bc0503b..3df2c36 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -1,7 +1,5 @@
 
-SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_PROMPT ?= "0"
-SYSLINUX_TIMEOUT ?= "10"
 SYSLINUX_LABELS = "boot"
 LABELS_append = " ${SYSLINUX_LABELS} "
 
-- 
2.1.4


