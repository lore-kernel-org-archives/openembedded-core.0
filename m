Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36FA0713A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 10:09:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAEA9N1n014078
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 02:09:24 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 02:09:23 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 05:09:21 -0500
Message-ID: <cover.1415959483.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 0/1] shadow: fix pam configs for chpasswd, newusers
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
X-List-Received-Date: Fri, 14 Nov 2014 10:09:28 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v2 changes:
* correct signature info

The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:

  bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/shadow-pam
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/shadow-pam

Hu (1):
  shadow: fix pam configs for chpasswd, newusers

 meta/recipes-extended/shadow/files/pam.d/chpasswd |    2 ++
 meta/recipes-extended/shadow/files/pam.d/newusers |    2 ++
 2 files changed, 4 insertions(+)

-- 
1.7.9.5


