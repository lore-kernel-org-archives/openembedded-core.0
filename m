Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD9C6002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:45:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0MAjMQu013364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:45:23 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 22 Jan 2014 02:45:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 18:45:41 +0800
Message-ID: <cover.1390387510.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: check required perl modules
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
X-List-Received-Date: Wed, 22 Jan 2014 10:45:23 -0000
Content-Type: text/plain

The following changes since commit 6e7047434fc1570146ebc94254412b99b1c4cab4:

  poky.ent: Fixed broken OE_LISTS_URL. (2014-01-21 21:58:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/perl

Robert Yang (1):
  sanity.bbclass: check required perl modules

 meta/classes/sanity.bbclass | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
1.8.3.1


