Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 222156B6A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 09:16:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0H9GwXx013665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 01:16:58 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 17 Jan 2014 01:16:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 17:16:50 +0800
Message-ID: <cover.1389950168.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] tcl: fix the TCL_INCLUDE_SPEC
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
X-List-Received-Date: Fri, 17 Jan 2014 09:17:00 -0000
Content-Type: text/plain

The following changes since commit 981567c4dfef59be08373f124b36739449a546a1:

  sstate.bbclass: remove previous version's stamp (2014-01-17 13:02:49 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/tcl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/tcl

Robert Yang (1):
  tcl: fix the TCL_INCLUDE_SPEC

 .../tcltk/tcl/alter-includedir.patch               | 60 ++++++++++++++++------
 1 file changed, 45 insertions(+), 15 deletions(-)

-- 
1.8.3.1


