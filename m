Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15D7F6E85F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 08:33:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s348XSmu016087
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 01:33:28 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 4 Apr 2014 01:33:27 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Apr 2014 16:33:25 +0800
Message-ID: <cover.1396600342.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] kernelshark/trace-cmd: fix syntax error of shell
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
X-List-Received-Date: Fri, 04 Apr 2014 08:33:31 -0000
Content-Type: text/plain

The following changes since commit a5775abb1951ec6cdc7afacd1ae87189e398cff8:

  bitbake: user-manual-metadata.xml: Added new section on mapping functions. (2014-04-02 14:15:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/kernelshark
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/kernelshark

Chong Lu (1):
  kernelshark/trace-cmd: fix syntax error of shell

 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |  3 ++-
 .../kernelshark-fix-syntax-error-of-shell.patch    | 30 ++++++++++++++++++++++
 .../trace-cmd-fix-syntax-error-of-shell.patch      | 30 ++++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |  1 +
 4 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch

-- 
1.8.1.2


