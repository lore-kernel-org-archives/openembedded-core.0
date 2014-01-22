Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD6C8600AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 04:55:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0M4taeH005976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 20:55:36 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 20:55:35 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 12:55:33 +0800
Message-ID: <cover.1390366473.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] gawk: enable ptest support
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
X-List-Received-Date: Wed, 22 Jan 2014 04:55:35 -0000
Content-Type: text/plain

The following changes since commit 6e7047434fc1570146ebc94254412b99b1c4cab4:

  poky.ent: Fixed broken OE_LISTS_URL. (2014-01-21 21:58:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/gawk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/gawk

Chong Lu (1):
  gawk: enable ptest support

 meta/recipes-extended/gawk/gawk-4.0.2/run-ptest | 10 ++++++++++
 meta/recipes-extended/gawk/gawk_4.0.2.bb        | 13 ++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gawk/gawk-4.0.2/run-ptest

-- 
1.8.1.2


