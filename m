Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D65460C14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 06:43:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0H6hVYQ011422
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 22:43:31 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 16 Jan 2014 22:43:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 14:43:21 +0800
Message-ID: <cover.1389940146.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] sstate.bbclass: remove previous version's stamp
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
X-List-Received-Date: Fri, 17 Jan 2014 06:43:31 -0000
Content-Type: text/plain

* V2: (Fix RP's comments)
  - Use STAMPCLEAN instead of STAMP
  - Respect to the extrainf

// Robert

The following changes since commit e81f2a5d7c45ad4056154d748cb28a00626e96a5:

  local.conf.sample.extended: update for the archiver (2014-01-16 15:33:42 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/clean_stamp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/clean_stamp

Robert Yang (1):
  sstate.bbclass: remove previous version's stamp

 meta/classes/sstate.bbclass | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
1.8.3.1


