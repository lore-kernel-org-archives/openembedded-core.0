Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21AB765FE5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 07:18:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s717IGtT022713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 00:18:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 1 Aug 2014 00:18:16 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Aug 2014 15:15:05 +0800
Message-ID: <cover.1406876955.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] oelint.bbclass: make oelint bbclass work
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
X-List-Received-Date: Fri, 01 Aug 2014 07:18:21 -0000
Content-Type: text/plain

In conf/local.conf, add 'INHERIT += "oelint"' to test.
We can get many warnings, like following:

WARNING: diffutils: HOMEPAGE is not set
WARNING: sed: DESCRIPTION is not set
WARNING: perl: DESCRIPTION is not set
WARNING: perl: debian/cpan_definstalldirs.diff doesn't have Signed-off-by
WARNING: perl: debian/cpan_definstalldirs.diff doesn't have Upstream-Status

The following changes since commit 2d1660112e54653f7bb763939d0416472c49fe01:

  populate_sdk_base: Fix grep command usage on old hosts (2014-07-29 09:58:27 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/oelint
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/oelint

Chong Lu (3):
  oelint.bbclass: make oelint bbclass work
  oelint.bbclass: add patch checking
  oelint.bbclass: Check for ${PN} or ${P} usage

 meta/classes/oelint.bbclass | 251 ++++++++++++++------------------------------
 1 file changed, 81 insertions(+), 170 deletions(-)

-- 
1.9.1


