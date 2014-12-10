Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08950723D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:45:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBA5jb5k002955
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Dec 2014 21:45:38 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Dec 2014 21:45:37 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Dec 2014 13:43:54 +0800
Message-ID: <cover.1418190010.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/3] use single variable to set baud rate
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
X-List-Received-Date: Wed, 10 Dec 2014 05:45:39 -0000
Content-Type: text/plain

Change since V2:
don't change SERIAL_CONSOLE default value and add console.bbclass to get
port, tty and baud rate from SERIAL_CONSOLE.

The following changes since commit ec6377bcf52d105cd23ac6bbbeddd38fee9337e4:

  bitbake: bitbake-user-manual-metadata.xml: Updated do_package_write example (2014-12-09 22:25:36 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/baudrate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/baudrate

Chong Lu (3):
  console.bbclass: add class which can be used to set serial console and
    baud rate
  syslinux.bbclass: use single variable to set baud rate
  grub-efi.bbclass: use single variable to set baud rate

 meta/classes/console.bbclass  | 23 +++++++++++++++++++++++
 meta/classes/grub-efi.bbclass |  5 +++--
 meta/classes/syslinux.bbclass |  5 +++--
 3 files changed, 29 insertions(+), 4 deletions(-)
 create mode 100644 meta/classes/console.bbclass

-- 
1.9.1


