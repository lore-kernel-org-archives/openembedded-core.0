Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3E16A71A84
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 18:13:06 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id z128so25389604pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 10:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0jxJOj4qsLjr2A5UMECsdOALVnUC77Zhtxsov5N0oWE=;
	b=lHpIpBLOhbota9K8cdTznNexX7ltfeJbTNZbZog4dKakSJytpH8PxmWEDxf3HtMsR4
	KDk2eMGUPTfXU2fVsjZYSYYW+iYClNmLYxqkB7hX3RDemxxZwMZlo9pg82UMx+HaB5ro
	FxlfO/32cy5zZf/V2WWjyBow7JmHAjqFxpA7yCZQP757ebxIzwGYh9XLgf2Pb+hRkbwt
	eF7RNiq+7hgBFqc6DZ5L7ev/y0wU/qDaEa+huviTUgtc8u1rqAOy48yGhCBRTgW0R60P
	ZwDjJ1im7Q3AsxxsUuPcAYEw1AohhRj4z4dGxo1CsmMeVCS0btJOoseAhw2bEYunrNAq
	XZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0jxJOj4qsLjr2A5UMECsdOALVnUC77Zhtxsov5N0oWE=;
	b=KK11Ely3iEOXrQNbYYafhj2V2PZdvB2azxvV9c37tVKaTVP/+FMYlxjkRd9ybuWR+T
	iP+7zZrVc50szIMPRtgsDYGe/Q5hc6vOMBrkY84mNwKLxZ15aWxq27/1EgfPSusVJruv
	+g15Q2zhVx7LODhSKpb28nf64mx7nr1iDV2OxoLqgNoV0ycrm9Z1W0NmHI53mP8fg22C
	yehY4nftapa0AtHS8OELi4EohMYrXQ2FSw+oBv5PbirLOAPu/XgUGEDHa8PxgrLKak/H
	ZN3HvfewLGHoEzrSt6qxZURDValFy9ITlrxOXa6aa/Hdg0uYPa0Xj/qucsSeunp9ed6w
	8J7A==
X-Gm-Message-State: AMke39nWuAlLcr6iCfxsDbWyfrqgSrFU9l/vZOlex4iLg2JIJk7LMuVOsFVbt28GfntTbA==
X-Received: by 10.84.224.131 with SMTP id s3mr12627384plj.162.1488046388262;
	Sat, 25 Feb 2017 10:13:08 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c124sm21818988pga.43.2017.02.25.10.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Feb 2017 10:13:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2017 10:12:58 -0800
Message-Id: <cover.1488046239.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH 0/4] Add golang basic infrastructure
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
X-List-Received-Date: Sat, 25 Feb 2017 18:13:07 -0000

This patchset adds go to core, the bits has been fused from
oe-meta-go and meta-virtualtization layers with additional
changes needed for it to fit into oe-core

The following changes since commit 65cfc8aca3ff7e39453977a0215a350d13cb85ef:

  libva: Find the correct wayland-scanner (2017-02-23 12:29:21 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/go
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/go

Khem Raj (4):
  go: Add recipes for golang compilers and tools
  go-examples: Add an example, helloworld written in go
  go: Fix go cross build with rss
  go: Use CC for CC_FOR_TARGET and CXX for CXX_FOR_TARGET

 meta/classes/go.bbclass                            |  74 +++++++
 meta/classes/goarch.bbclass                        |  46 +++++
 meta/recipes-devtools/go/go-1.4.inc                |  15 ++
 .../go/go-1.4/016-armhf-elf-header.patch           |  24 +++
 ...ckport-cmd-link-support-new-386-amd64-rel.patch | 225 +++++++++++++++++++++
 meta/recipes-devtools/go/go-1.4/syslog.patch       |  62 ++++++
 meta/recipes-devtools/go/go-1.6.inc                |  19 ++
 .../go/go-1.6/armhf-elf-header.patch               |  23 +++
 .../go/go-1.6/fix-cc-handling.patch                |  50 +++++
 .../go/go-1.6/fix-target-cc-for-build.patch        |  17 ++
 meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 +++
 .../go/go-1.6/split-host-and-target-build.patch    |  63 ++++++
 meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ++++++
 meta/recipes-devtools/go/go-1.7.inc                |  19 ++
 .../go/go-1.7/armhf-elf-header.patch               |  23 +++
 .../go/go-1.7/fix-cc-handling.patch                |  50 +++++
 .../go/go-1.7/fix-target-cc-for-build.patch        |  17 ++
 meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 +++
 .../go/go-1.7/split-host-and-target-build.patch    |  62 ++++++
 meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ++++++
 meta/recipes-devtools/go/go-common.inc             |  21 ++
 meta/recipes-devtools/go/go-cross.inc              |  10 +
 meta/recipes-devtools/go/go-cross_1.7.bb           |   5 +
 meta/recipes-devtools/go/go-native.inc             |  54 +++++
 meta/recipes-devtools/go/go-native_1.4.bb          |   2 +
 meta/recipes-devtools/go/go.inc                    |  76 +++++++
 meta/recipes-devtools/go/go_1.6.bb                 |   4 +
 meta/recipes-devtools/go/go_1.7.bb                 |   2 +
 .../go-examples/files/helloworld.go                |  10 +
 meta/recipes-extended/go-examples/go-examples.inc  |  10 +
 .../go-examples/go-helloworld_0.1.bb               |  15 ++
 31 files changed, 1182 insertions(+)
 create mode 100644 meta/classes/go.bbclass
 create mode 100644 meta/classes/goarch.bbclass
 create mode 100644 meta/recipes-devtools/go/go-1.4.inc
 create mode 100644 meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
 create mode 100644 meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch
 create mode 100644 meta/recipes-devtools/go/go-1.4/syslog.patch
 create mode 100644 meta/recipes-devtools/go/go-1.6.inc
 create mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
 create mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
 create mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
 create mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
 create mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
 create mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
 create mode 100644 meta/recipes-devtools/go/go-1.7.inc
 create mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
 create mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
 create mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
 create mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
 create mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
 create mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
 create mode 100644 meta/recipes-devtools/go/go-common.inc
 create mode 100644 meta/recipes-devtools/go/go-cross.inc
 create mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
 create mode 100644 meta/recipes-devtools/go/go-native.inc
 create mode 100644 meta/recipes-devtools/go/go-native_1.4.bb
 create mode 100644 meta/recipes-devtools/go/go.inc
 create mode 100644 meta/recipes-devtools/go/go_1.6.bb
 create mode 100644 meta/recipes-devtools/go/go_1.7.bb
 create mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
 create mode 100644 meta/recipes-extended/go-examples/go-examples.inc
 create mode 100644 meta/recipes-extended/go-examples/go-helloworld_0.1.bb

-- 
2.11.1


