Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3EB06F8AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 09:24:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2O9OIHZ029198
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 02:24:19 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 24 Mar 2014 02:24:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 05:24:16 -0400
Message-ID: <cover.1395653020.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: build setpriv requires libcap-ng
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
X-List-Received-Date: Mon, 24 Mar 2014 09:24:21 -0000
Content-Type: text/plain

The following changes since commit 4a47c943a76e79af82d47d8fa83c6687e0d915a0:

  busybox: disable fsck.minix and mkfs.minix (2014-03-23 09:08:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/util-linux
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/util-linux

Robert Yang (1):
  util-linux: build setpriv requires libcap-ng

 meta/recipes-core/util-linux/util-linux.inc |    3 +++
 1 file changed, 3 insertions(+)

-- 
1.7.10.4


