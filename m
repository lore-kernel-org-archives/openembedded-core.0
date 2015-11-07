Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC7D77029
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 08:30:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA78UDY6006630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 7 Nov 2015 00:30:13 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 7 Nov 2015 00:30:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jeffrey.honig@windriver.com>
Date: Sat, 7 Nov 2015 16:30:07 +0800
Message-ID: <cover.1446884806.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1]cpan_build/bbclass: add perl to DEPENDS with target override
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
X-List-Received-Date: Sat, 07 Nov 2015 08:30:13 -0000
Content-Type: text/plain

Build libhtml-tree-perl from a fresh environment, there was a failure:
...
| tmp/work/corei7-64-wrs-linux/libhtml-tree-perl/5.03-r0/temp/do_configure/
run.do_configure.156882: line 112: tmp/sysroots/intel-x86-64/usr/lib64/
perl/config.sh: No such file or directory
...

The config.sh was provided by perl.

//Hongxu

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/perl

Hongxu Jia (1):
  cpan_build/bbclass: add perl to DEPENDS with target override

 meta/classes/cpan_build.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


