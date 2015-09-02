Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id B2CF677032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:37 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so17208804igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TusmevZ6YEMxgy41OBND9tg8KjM+uf/6jSUXOU3efWc=;
	b=gTYrD6gCFsVape1+IoODT7RkxVNT42flTrDt/D1XrqONaC04QqGJMx0bP9cwb5Q72c
	jMYg+8O9S4ocnSmIhSjNVKKSnkrj9zL/lfkotjucdnqa/wUyBJwMrDjh5QnnDq3w+8jK
	1HneowBCplbHzn/MkPCx+rr3SAbF/MuLvuY4MZGmuwI5S97PuY154KUmQKhpR/s9UUaz
	rqywyLVTdel3yFO6N7RQN4Gl/NBBWLm+p7cDGtlSzGfQ5+k4R/SiRCyToEH6wskIzeuD
	u3o8pkuNFabQFriGjum4gcYrNlZH4KHWl7hVgJsuOg3Rdnu5oITUy7eJ4wXzvRo0xMJJ
	+KvQ==
X-Gm-Message-State: ALoCoQlqYLTXZxVEW7jQ/T0IBxzA2uzLTM/CUA5uSkxU0JDUH1KxIjOQ9rdQ8i+H3H36YoX7S4BG
X-Received: by 10.50.80.13 with SMTP id n13mr3944344igx.6.1441208917965;
	Wed, 02 Sep 2015 08:48:37 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:37 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:43 +0200
Message-Id: <afc60106e7f435f8639fd0755d14d93c6bbba3f0.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 07/10] image-vm.bbclass: avoid duplicating syslinux default values
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:37 -0000

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


