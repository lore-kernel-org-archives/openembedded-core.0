Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78B566A4F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 09:21:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4T9L2pL005762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 02:21:02 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 29 May 2013 02:21:02 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 05:20:59 -0400
Message-ID: <cover.1369818931.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass: fixup extra hardcoded paths
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
X-List-Received-Date: Wed, 29 May 2013 09:21:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We need this since we have a script in the sstate-cache that has a hard
coded path into the multilib toolchain directory and that isn't
automatically relocated like it should be, so add this extra logic.

--
The following changes since commit 8f5bc47729edb8cb051d81e9ff1680cb8d2eca25:

  dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:30 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_multilib_image_0529_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_multilib_image_0529_1

Jackie Huang (1):
  sstate.bbclass: fixup extra hardcoded paths

 meta/classes/sstate.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
1.7.9.5


