Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E04816AE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 15:16:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBAFGMLW012172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Dec 2013 07:16:22 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 07:16:21 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 10 Dec 2013 10:16:14 -0500
Message-ID: <cover.1386688151.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto: static -dev SRCREVs and -headers for klibc
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
X-List-Received-Date: Tue, 10 Dec 2013 15:16:27 -0000
Content-Type: text/plain

Richard/Saul,

Here are a couple of changes that I've been testing locally for a week now,
with nothing (obvious) breaking.

The linux-yocto-dev kernel change is to allow integration into master under
test, so our dev kernels can be exercised directly before they become the
kernel for a release. With this change, a layer can now create an optional
include file, set a couple of variables and have a set of static REVs used
rather than the default of AUTOREV. 

The linux-libc-headers change fixes a klibc mips build failure issue found
by Andrea Adami. This is fixed in the latest kernels, so we'll backport
the change to the 3.10 based headers and drop it when I next uprev the
kernel and headers.

Cheers,

Bruce

cc: Andrea Adami <andrea.adami@gmail.com>


The following changes since commit fc1bbe3654a3d456dfeb904f4c9752a03e3c48d6:

  linux-yocto-dev: allow static SRCREVs via include (2013-12-10 10:06:09 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-libc-headers: fix MIPS klibc build error

 ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch | 34 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.10.bb  |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch

-- 
1.8.1.2


