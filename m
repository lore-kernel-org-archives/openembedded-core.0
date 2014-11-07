Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1AAA65CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:45:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA78jTNA008446
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 00:45:30 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 00:45:29 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Nov 2014 16:47:18 +0800
Message-ID: <cover.1415349978.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nfs-utils: change owner/group of directories in do_install
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
X-List-Received-Date: Fri, 07 Nov 2014 08:45:37 -0000
Content-Type: text/plain

The following changes since commit d7a277b35bcc67050046c76fb70412101679a545:

  docbook-xsl-stylesheets: add perl to RDEPENDS (2014-11-04 10:20:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/nfs-utils-rpcuser
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/nfs-utils-rpcuser

Chen Qi (1):
  nfs-utils: change owner/group of directories in do_install

 .../nfs-utils/nfs-utils/nfscommon                  | 27 ----------------------
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  7 ++++--
 2 files changed, 5 insertions(+), 29 deletions(-)

-- 
1.9.1


