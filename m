Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9E772440
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 05:48:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB85mpqS020047
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Dec 2014 21:48:52 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 7 Dec 2014 21:48:51 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 13:47:18 +0800
Message-ID: <cover.1418017596.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] use single variable to set baud rate
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
X-List-Received-Date: Mon, 08 Dec 2014 05:48:54 -0000
Content-Type: text/plain

The following changes since commit b813bdebb36501500e86fea5f7e15b4b15ea0902:

  qemu/libc-package: Fix qemu option handling (2014-12-05 18:01:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/baudrate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/baudrate

Chong Lu (2):
  syslinux.bbclass: use single variable to set baud rate
  grub-efi.bbclass: use single variable to set baud rate

 meta/classes/grub-efi.bbclass | 5 +++--
 meta/classes/syslinux.bbclass | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.9.1


