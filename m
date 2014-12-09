Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 60B1F724CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 08:27:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB98RPvK005205
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Dec 2014 00:27:25 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Dec 2014 00:27:24 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 16:25:46 +0800
Message-ID: <cover.1418113325.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/3] use single variable to set baud rate
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
X-List-Received-Date: Tue, 09 Dec 2014 08:27:31 -0000
Content-Type: text/plain

Change since V1:
Set default value for SERIAL_CONSOLE.

The following changes since commit b813bdebb36501500e86fea5f7e15b4b15ea0902:

  qemu/libc-package: Fix qemu option handling (2014-12-05 18:01:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/baudrate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/baudrate

Chong Lu (3):
  bitbake.conf: Set default value for SERIAL_CONSOLE
  syslinux.bbclass: use single variable to set baud rate
  grub-efi.bbclass: use single variable to set baud rate

 meta/classes/grub-efi.bbclass | 5 +++--
 meta/classes/syslinux.bbclass | 4 ++--
 meta/conf/bitbake.conf        | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
1.9.1


