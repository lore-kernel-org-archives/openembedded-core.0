Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE7F8606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 08:30:04 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a16so2755047pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XY/BBSqsojiEkQ0EbiP2iRimajYMVOPX3HsDAskxNdM=;
	b=I3XRQDkL71/PTR9soYion9VHgUUGSqwnTPQGXfSyQp8J2COSHEuAkXajNXDvYSN0n9
	RjIe6q8FDQwPR5/x+Qw2+Vj1hUf8CS/c8FCg93LpK0AVDbQ3aRjR8v7977gXr1quAXmY
	wBTiTaW8pkz+8rTezzebjvbQkigfoHLDt+c81Jqu7Ac6Ks0Pz3UUXXpm4gGkW3UAws5p
	3Y3+SSSUJXS94QmzNhNpyEt0Qwz6rPEeBJC/vAb6DS5w/ev6KmlgxHznYg6e+SKTI/ta
	SdO4Y6ZjQAiYGIOPInBcflwa3CbPJR11Q/3Y6vVm3M7aQN8w8g8WobeGZJaS59x8J42O
	tnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XY/BBSqsojiEkQ0EbiP2iRimajYMVOPX3HsDAskxNdM=;
	b=qdnPcUvV3upCvOVWLAJMUe8eYxmjvvkDoxmTNCS8rjUusk+Huon17wZ4ZvVw2Mnego
	6/oh7+HD8KVWdo/KSG8HKqPeg/u/KW1c4ysx+pJFjErUomHTWdq3Sr0COlaErBaKvkTZ
	eBWfHFjsacPbCOLNqaXEXOD94TpVVCNHJwsok1watUZiFhNOf+mr+EqKGOO4+2HKy2DJ
	VgRTLxyGmjTfi4AO8ygG1/QT4Yy7hT3yNyx1Jde475cpeEXpxgD+rON8BUhfwecVdQqI
	DN+gawUjFkQUD/gxTk3DLpHnjjzxv4Ssp8jQedoGgIKejco15TkZM/8BYHmdfBDypxEU
	4WXw==
X-Gm-Message-State: AElRT7HGkbNOEPCrg8OBhfYuiyJqIP4nsv/CgillHastmCKOE+7NLobk
	/T7MkVuhvIdZhrF2hmbbA8gg8A==
X-Google-Smtp-Source: AIpwx48Ap6m17GEW1wyYZtPn6kdrYw2W79meua6McJr1YX6CLR7wNXaTFsPWn3IsXDOEXrvVz8wKBA==
X-Received: by 10.101.101.204 with SMTP id y12mr4928188pgv.142.1522312205713; 
	Thu, 29 Mar 2018 01:30:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	s7sm10280508pgq.48.2018.03.29.01.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Mar 2018 01:30:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 01:29:57 -0700
Message-Id: <20180329082957.44741-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH] mmc-utils: Fix string overflow error
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
X-List-Received-Date: Thu, 29 Mar 2018 08:30:05 -0000

The SRCREV change bring another patch from upstream

b4fe0c8 fix ENH_START_ADDR overflow

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 8977a87962..37a4755234 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,11 +4,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "7bcad171173fd9a9401e7ce81906605bd6f4eddc"
+SRCREV = "b4fe0c8c0e57a74c01755fa9362703b60d7ee49d"
 
 PV = "0.1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
+           file://0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch \
+           "
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.16.3


