Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5E6731A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:16:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u042GMkd004558
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jan 2016 18:16:22 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 3 Jan 2016 18:16:21 -0800
Message-ID: <5689D5CE.7000600@windriver.com>
Date: Mon, 4 Jan 2016 10:15:42 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1451873095.git.hongxu.jia@windriver.com>
	<06cb4a38d169505b4c7432a8e6208016863efad4.1451873095.git.hongxu.jia@windriver.com>
In-Reply-To: <06cb4a38d169505b4c7432a8e6208016863efad4.1451873095.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] dbus: support large-file for stat64
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
X-List-Received-Date: Mon, 04 Jan 2016 02:16:24 -0000
X-Groupsio-MsgNum: 75352
Content-Type: multipart/mixed; boundary="------------060302030306080803080304"

--------------060302030306080803080304
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



--------------060302030306080803080304
Content-Type: text/x-patch; name="0000-cover-letter.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0000-cover-letter.patch"

Subject: [PATCH 0/1] dbus: support large-file for stat64

Test steps:
1. Build with qemux86 and start qemu with nfs as rootfs.

2. Build with qemux86-64 and start qemu with nfs as rootfs.

//Hongxu

The following changes since commit 2cd061a29a94fdcdfec86732e6bcbb71c12c4afc:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/dbus-lfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/dbus-lfs

Hongxu Jia (1):
  dbus: support large-file for stat64

 ...onfigure.ac-support-large-file-for-stat64.patch | 53 ++++++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.8.20.bb              |  3 ++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch

-- 
1.9.1


--------------060302030306080803080304--
