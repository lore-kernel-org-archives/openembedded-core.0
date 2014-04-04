Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4346A9C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 03:21:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s343Lmxi012663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Apr 2014 20:21:48 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 3 Apr 2014 20:21:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Apr 2014 23:21:44 -0400
Message-ID: <cover.1396581547.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [dora] [PATCH 0/2] two fixes for dora
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
X-List-Received-Date: Fri, 04 Apr 2014 03:21:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi RP,

Here are two fixes which are sent by Mats Karrman and Valentin Popa for dora.

// Robert

The following changes since commit ec8ae16e35fd7db6a5bb12412d50ab6f355b0f6e:

  image_types.bbclass: use 4096 instead of 8192 bytes-per-inode (2014-03-26 09:43:52 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib robert/dora-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=robert/dora-next

Mats Kärrman (1):
  eglibc 2.18: powerpc: Fix time related syscalls

Valentin Popa (1):
  mesa: build fix for gallium-egl

 .../ppc-fix-time-related-syscalls.patch            |  227 +++++++++++++
 meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
 ...01-Add-MESA_EGL_NO_X11_HEADERS-to-defines.patch |   41 +++
 ...ate-NativeDisplayType-depending-on-config.patch |  359 --------------------
 meta/recipes-graphics/mesa/mesa_9.1.6.bb           |   10 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |   10 +-
 6 files changed, 287 insertions(+), 361 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-syscalls.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Add-MESA_EGL_NO_X11_HEADERS-to-defines.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch

-- 
1.7.10.4


