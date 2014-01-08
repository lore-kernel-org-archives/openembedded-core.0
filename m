Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAC76D120
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 10:00:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s08A0qPO002395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jan 2014 02:00:52 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 02:00:52 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jan 2014 17:59:39 +0800
Message-ID: <cover.1389173902.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] tcl: enable ptest support
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
X-List-Received-Date: Wed, 08 Jan 2014 10:00:51 -0000
Content-Type: text/plain

The following changes since commit e93a345fae7c21652547bec501fcb1f3b6c6427d:

  sstate: add do_package to the noexec list in setscene_depvalid (2014-01-07 13:58:32 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/tcl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/tcl

Chong Lu (1):
  tcl: enable ptest support

 meta/recipes-devtools/tcltk/tcl/run-ptest |  8 ++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb  | 13 ++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/run-ptest

-- 
1.8.1.2


