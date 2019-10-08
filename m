Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id CC1AE7F38A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:49 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id h195so10934785pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lJ7iB77HC4ezTdGxTD5wjOUkbSu9SaTnYjd6z3frq8Q=;
	b=nIuSui3zia7Ajz7sZ1VmX3gi8uw9zMAffCeeGjCcetMk2w588ZSARS/QGaSSlfpeXE
	PykPfQzSFE/lm35+JzlVHROtsgYXZ8OZB3qjrTQNBne08DvyvzysKEMc5pr2N+MhgC/R
	wH+XfqcfCnzDCOJWCJYkZUl1b/3w6xKamUjqWLTbAaIMJg0zA5TEfrSiPsu9ayOkR9kR
	c0JStfyT4pBSvqLZ8kJP2c7+zr8aRFEcs5r7FMXG57mbkfmwb8w6lJjEh6ZhaY6gW/jT
	nEU0RBb3vbxwHAqw6gXMwgUfaf2fFTNxg0/aSKGd0ujvPyP3Ws4+9uql7HZ3ADCCZkfa
	GOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lJ7iB77HC4ezTdGxTD5wjOUkbSu9SaTnYjd6z3frq8Q=;
	b=ip2tSGfW/DXM5j0r544d/w68PsoGLb/5+dl6UdRryhDhpyyusyL8Yc1hfWfuxeo4/8
	+pYy59SdboBunwuHhZcziHWqkp10ksnc8cjDlkgPqf+/LnR/dIGhQbexLwW8YqwXnstx
	qgyp+B6JOWqwzFyGrOehDisFO0dTokL+miEo+UuA7mToawIyJbJr+qMUIYZRU4dgaeHO
	qViJ2k57Nw4Ch1z8kac/03cb2jK+lBIX2yZZWyEDpCQ/DCFeM3JPsn4wsXND2nuVezmO
	cXx6O1aBhst39YA6xxtcoLGeBGzQUrpRZJ7yXfkbzPx7b0opmcdv396VMQ4k+CSCAsJ9
	s13Q==
X-Gm-Message-State: APjAAAV1mxdaMmBte+bsGVB/0YFjrWfzh6dtKLAhiDAJeukHy4WuNKZk
	QxvsBP4tmzsHsmyQI3laPWWJs6F6gC8=
X-Google-Smtp-Source: APXvYqywFZR/SUD6uvQU6Fu32DWOtTvzH1faBFEjEZoFhOEUziJczwqc00MpxAU3GCUcnznsYrhD4A==
X-Received: by 2002:a63:1553:: with SMTP id 19mr9753575pgv.368.1570547090463; 
	Tue, 08 Oct 2019 08:04:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:34 -0700
Message-Id: <8b9703454cb2a8a0aa6b7942498f191935d547ea.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
Subject: [warrior 07/10] systemd: update SRCREV for systemd v241-stable
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:49 -0000

From: Jan Klare <jan.klare@bisdn.de>

Currently systemd 241 does break for kernels 5.2+ with the error described here:
* https://github.com/systemd/systemd/issues/12784

The issue has been fixed in master and will be fixed in the release 243. The
necessary patches have been backported to systemd/systemd-stable in the branch
v241-stable, but currently in warrior an old version of that branch is pulled
in.

This patch updates the SRCREV to the latest commit from that branch and
therefore pulls in the needed fix to run systemd 241 on 5.2+ kernels.

Signed-off-by: Jan Klare <jan.klare@bisdn.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 5bd88ed..2b9c291 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
+SRCREV = "511646b8ac5c82f210b16920044465756913d238"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.7.4


