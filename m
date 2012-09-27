Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1TH9bB-0005qU-H3
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 10:37:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8R8OeiO001786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 01:24:40 -0700 (PDT)
Received: from usp-ub1204-32.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 27 Sep 2012 01:24:39 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 16:23:36 +0800
Message-ID: <cover.1348734058.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] autotools.bbclass: using relative paths for acpaths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 08:37:33 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix autotools.bbclass to use relative paths for acpaths instead of
absolute ones. Since absolute paths may cause potential autoreconf
error like:

    Can't exec "/bin/sh": Argument list too long ...

This error occurs while building coreutils with long TMPDIR, because
it has bunch of m4 files need to be expanded.

[YOCTO #2766]

The following changes since commit 0b09e50810162a07ef0aecee91ee32b4a36334a3:

  busybox: Fix misplaced quote (2012-09-26 18:28:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/2766
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2766

Wenzong Fan (1):
  autotools.bbclass: using relative paths for acpaths

 meta/classes/autotools.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.9.5



