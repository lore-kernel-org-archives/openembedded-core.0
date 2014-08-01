Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7F9706FD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:06:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7196kGK006457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 02:06:47 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 1 Aug 2014 02:06:46 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Aug 2014 17:03:35 +0800
Message-ID: <cover.1406883469.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3][V2] oelint.bbclass: make oelint bbclass work
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
X-List-Received-Date: Fri, 01 Aug 2014 09:06:52 -0000
Content-Type: text/plain

Change since V1:
fix output and non-standard syntax.

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


