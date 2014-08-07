Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEDC70A33
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:41:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s77Df0N7026630
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 06:41:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 06:41:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 06:40:53 -0700
Message-ID: <cover.1407418718.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/7] fix rebuild error
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
X-List-Received-Date: Thu, 07 Aug 2014 13:41:03 -0000
Content-Type: text/plain

The following changes since commit 1fafe7ccc563d5ac9e41f5c1de93d2736745b512:

  ghostscript: Remove bogus gsfonts reference from DESCRIPTION (2014-08-06 11:14:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rebuild
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rebuild

Robert Yang (7):
  libnewt: fix recompile error
  trace-cmd: fix recompile error
  logrotate: fix recompile error
  kexec-tools: fix recompile error
  kernelshark: fix recompile error
  u-boot-mkimage: fix recompile error
  syslinux: fix reinstall error

 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  |    3 +++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    4 ++++
 meta/recipes-extended/logrotate/logrotate_3.8.7.bb |    5 +++++
 meta/recipes-extended/newt/libnewt_0.52.17.bb      |    5 +++++
 meta/recipes-kernel/kexec/kexec-tools.inc          |   11 +++++++++++
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    5 +++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    5 +++++
 7 files changed, 38 insertions(+)

-- 
1.7.9.5


