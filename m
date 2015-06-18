Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2B473306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 09:10:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5I9A4m1013947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 02:10:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 18 Jun 2015 02:10:04 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 17:02:41 +0800
Message-ID: <cover.1434618027.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Backport patches of qemu to fix CVE issues
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
X-List-Received-Date: Thu, 18 Jun 2015 09:10:06 -0000
Content-Type: text/plain

The following changes since commit 1675ff6fff53dda89fa8d4f3a2c292c23fd346d7:

  bitbake: tests/data: Add new data tests (2015-06-12 00:02:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/qemu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemu

Kai Kang (1):
  qemu: backport patches to fix CVE issues

 ...f-modified-PCI-CFG-contents-CVE-2015-4103.patch | 140 +++++++++++
 ...o-control-MSI-mask-register-CVE-2015-4104.patch | 194 +++++++++++++++
 ...-MSI-X-limit-error-messages-CVE-2015-4105.patch |  90 +++++++
 ...s-through-of-enable-bit-mod-CVE-2015-4106.patch |  76 ++++++
 ...date-PM-capability-emu_mask-CVE-2015-4106.patch |  86 +++++++
 ...rectly-handle-PM-status-bit-CVE-2015-4106.patch |  38 +++
 ...ulation-of-throughable-mask-CVE-2015-4106.patch | 265 +++++++++++++++++++++
 ...e-capability-bits-read-only-CVE-2015-4106.patch |  38 +++
 ...-in-PCI-config-space-fields-CVE-2015-4106.patch |  94 ++++++++
 ...ig-space-field-descriptions-CVE-2015-4106.patch |  77 ++++++
 ...e-fields-should-be-readonly-CVE-2015-4106.patch | 137 +++++++++++
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           |  13 +-
 12 files changed, 1247 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/01-xen-properly-gate-host-writes-of-modified-PCI-CFG-contents-CVE-2015-4103.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/02-xen-dont-allow-guest-to-control-MSI-mask-register-CVE-2015-4104.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/03-xen-MSI-X-limit-error-messages-CVE-2015-4105.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/04-xen-MSI-dont-open-code-pass-through-of-enable-bit-mod-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/05-xen-pt-consolidate-PM-capability-emu_mask-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/07-xen-pt-split-out-calculation-of-throughable-mask-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/08-xen-pt-mark-all-PCIe-capability-bits-read-only-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch

-- 
1.9.1


