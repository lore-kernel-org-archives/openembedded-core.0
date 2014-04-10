Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A30865E2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:29:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3A1TcpC027541
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Apr 2014 18:29:40 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 9 Apr 2014 18:29:38 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2014 09:29:36 +0800
Message-ID: <cover.1397093236.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/1] kernelshark/trace-cmd: fix syntax error of shell
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
X-List-Received-Date: Thu, 10 Apr 2014 01:29:43 -0000
Content-Type: text/plain

Changes since V1:
Remove Upstream-Status, it's a general problem.

The following changes since commit a5775abb1951ec6cdc7afacd1ae87189e398cff8:

  bitbake: user-manual-metadata.xml: Added new section on mapping functions. (2014-04-02 14:15:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/kernelshark
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/kernelshark

Chong Lu (1):
  kernelshark/trace-cmd: fix syntax error of shell

 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |  3 ++-
 .../kernelshark-fix-syntax-error-of-shell.patch    | 28 ++++++++++++++++++++++
 .../trace-cmd-fix-syntax-error-of-shell.patch      | 28 ++++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |  1 +
 4 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch

-- 
1.8.1.2


