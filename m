Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E22F16F641
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:39:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s276dTlQ014262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:39:29 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:39:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:39:24 -0500
Message-ID: <cover.1394174229.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/3] [dora] 3 fixes for dora
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
X-List-Received-Date: Fri, 07 Mar 2014 06:39:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit 18f34944696a8098daf33a94bc2f532deb217d0a:

  gnutls: fix failure during do_compile (2014-03-06 10:31:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib robert/dora-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=robert/dora-next

Chen Qi (1):
  iproute2: de-bash its scripts to remove the bash dependency

Ming Liu (1):
  grub: move xz to DEPENDS list from RDEPENDS list

Sébastien Mennetrier (1):
  libomxil: Fix link issue for gst-omx

 meta/recipes-bsp/grub/grub_2.00.bb                 |    4 +-
 .../iproute2/0001-iproute2-de-bash-scripts.patch   |   64 ++++++++++++++++++++
 .../iproute2/iproute2_3.10.0.bb                    |    1 +
 .../libomxil-0.9.3/dynamicloader-linking.patch     |   20 ++++++
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    3 +-
 5 files changed, 89 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch

-- 
1.7.10.4


