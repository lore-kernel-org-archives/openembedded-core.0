Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 640CB60232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 08:33:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA28XWCe014426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Nov 2015 00:33:33 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 2 Nov 2015 00:33:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>
Date: Mon, 2 Nov 2015 16:33:26 +0800
Message-ID: <cover.1446453113.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] logrotate: do not move binary logrotate to /usr/bin
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
X-List-Received-Date: Mon, 02 Nov 2015 08:33:36 -0000
Content-Type: text/plain

The following changes since commit 370a2916c4559c17952392b872322e8e490b124c:

  build-appliance-image: Update to jethro head revision (2015-10-29 22:20:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/logrotate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/logrotate

Hongxu Jia (1):
  logrotate: do not move binary logrotate to /usr/bin

 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


