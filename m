Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63A9F6F5DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 09:14:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s279Enrh018481
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Mar 2014 01:14:49 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 7 Mar 2014 01:14:48 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 04:14:46 -0500
Message-ID: <cover.1394183376.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] dmidecode: add powerpc to compatible host
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
X-List-Received-Date: Fri, 07 Mar 2014 09:14:49 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

1) 'bitbake dmidecode' works;
2) dmidecode works on a powerpc 32bit target.

The following changes since commit e9554464d42e5972a483ec992c912e6f98c4e090:

  bitbake: runqueue: Fix typo (2014-03-06 22:35:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/dmidecode
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/dmidecode

Wenzong Fan (1):
  dmidecode: add powerpc to compatible host

 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


