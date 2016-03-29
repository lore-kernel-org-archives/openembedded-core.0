Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 93E0C65CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:59:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2T7xAwE019077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 00:59:10 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 00:59:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Mar 2016 00:59:06 -0700
Message-ID: <cover.1459238263.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3] Remove bootimg.bbclass and boot-directdisk.bbclass
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
X-List-Received-Date: Tue, 29 Mar 2016 07:59:09 -0000
Content-Type: text/plain

The following changes since commit a3e254992444b0cc92e182151fefba7e3324ad55:

  build-appliance-image: Update to master head revision (2016-03-28 17:02:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/image
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3148e125ec883b341b1bbbc8bb3f8845bde01eb2

Robert Yang (3):
  boot-directdisk.bbclass: merge it into image-vm.bbclass
  bootimg.bbclass: merge it into image-live.bbclass
  image-live.bbclass/image-vm.bbclass: remove duplicated code

 meta/classes/boot-directdisk.bbclass | 190 ----------------------
 meta/classes/bootimg.bbclass         | 304 -----------------------------------
 meta/classes/gummiboot.bbclass       |   2 +-
 meta/classes/image-live.bbclass      | 266 +++++++++++++++++++++++++++++-
 meta/classes/image-vm.bbclass        | 167 ++++++++++++++++---
 meta/classes/image.bbclass           |  46 ++++++
 6 files changed, 456 insertions(+), 519 deletions(-)
 delete mode 100644 meta/classes/boot-directdisk.bbclass
 delete mode 100644 meta/classes/bootimg.bbclass

-- 
2.7.4


