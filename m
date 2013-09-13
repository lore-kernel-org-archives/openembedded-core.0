Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E58BC610EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:23:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8D8NuY9004050
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:23:56 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 01:23:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 04:23:51 -0400
Message-ID: <cover.1379054099.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] linux-libc-headers: do_install: fix "Argument list too long" error
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
X-List-Received-Date: Fri, 13 Sep 2013 08:23:54 -0000
Content-Type: text/plain

Hi Saul and Bruce,

This patch is only for linux-libc-headers, the linux-yocto also has the
file Makefile.headersinst, but we don't use it when build linux-yocto,
so it works well, I'm not sure whether we should apply this to
linux-yocto.

// Robert

The following changes since commit c6dc3cb329428e92cb035be504e044c1c3c0e939:

  icu-native: do_install: Segmentation fault (2013-09-12 05:29:07 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/linux_headers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/linux_headers

Robert Yang (1):
  linux-libc-headers: do_install: fix "Argument list too long" error

 ...cripts-Makefile.headersinst-args-too-long.patch |   36 ++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.10.bb  |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch

-- 
1.7.10.4


