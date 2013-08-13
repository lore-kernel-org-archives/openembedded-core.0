Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7365F6B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:09:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7D79BYW000416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 00:09:11 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 00:09:10 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 03:09:08 -0400
Message-ID: <cover.1376377523.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] oe/path.py: call /bin/cp directly
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
X-List-Received-Date: Tue, 13 Aug 2013 07:09:10 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This avoids running cp with interactive mode on some hosts if defined:
    
        alias cp='cp -i'

The following changes since commit 16d522bcd1f1b7741577fa31fab7e2129da0cae9:

  maintainers.inc: reassign maintainers, remove obsolete recipes (2013-08-12 13:13:05 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/fix_alias_cp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix_alias_cp

Wenzong Fan (1):
  oe/path.py: call /bin/cp directly

 meta/lib/oe/path.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


