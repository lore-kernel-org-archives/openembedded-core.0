Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0CE71A82
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:36:49 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k61so3152788wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 01:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=u0TVapY77dfARRlfNWw5ygryib/2N8kEAEplfsyoK08=;
	b=QcIqkEtOuufSb6WxkER7mKcnh5PN/TdQ8MwlsZ/qRRYkH9cSn0fqtRTiDjQlo50J2R
	HlhLh5BqalEFXyL2mWtBcGT02nyQei7DKgyOWJOOpYe0F3X/0S1iJZqVVkSy9UagVFPG
	03Frnj0clAjOorE2tNiziROBGE/25lYJsN2/wL370jb72rydw9kOsY/pipNsixyOQJFV
	RsrmsB2lryZBIkAJfBpegfwifKAztI577EfeP1s8EPlGM3vcpTbwSO9ZjYdksj9fa9HY
	zei8ao7rJGFpe8lbzjFqTWQZwvkCXL/RxZJBQ23IQ90zDMaP52ccxch5zdg1xfmM5l8+
	lNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u0TVapY77dfARRlfNWw5ygryib/2N8kEAEplfsyoK08=;
	b=J4MwE8SZrfYReadxEJkt6+1Iu1/sf6y1fe7ekRB+VYs1pW/owfMlFqbimnwpfb4js+
	18idqd5Qf+OktMjhgrC1PY+9mVkR1N29SJhEdPeNx+L65p478Ijxrz3Gt7tLZdBLtQz3
	2dYFXU7vmEgVzwC7P68Xm3u6mlM4UIF9T40OGgp01tyBn7KnaldWT2gqu2sxYT9i5DPS
	RXfkaISd3Cdrvcm6hDYLsY8w7WfAO1ZdVt7CnvX/jtzFdYSJvijmRLFgjhp2F5yQj6AQ
	9dEYtSwqHSeslzo6qDSMzW7yHjhj0zAQiMBP6tDM73QGcyXLTeySZKWv53/7Q4fg3aSV
	q9Cg==
X-Gm-Message-State: AKGB3mKDNomkyw6LFPRFW8ipBkbA6EAMU2n+4wPPPCxHGdmMoExzWTkK
	gCp0vIKoIN6DISpwOsUoh74+5yg=
X-Google-Smtp-Source: AGs4zMZAddjD3dnTB+d6zRgCTyfXEBrisRbGweVpPqkbjJUjvEGSKyf/0Ot1+HzIgmqq17zZl6eGFA==
X-Received: by 10.223.200.138 with SMTP id k10mr2400275wrh.222.1512553010860; 
	Wed, 06 Dec 2017 01:36:50 -0800 (PST)
Received: from pohly-desktop.fritz.box (p54BD5190.dip0.t-ipconnect.de.
	[84.189.81.144])
	by smtp.gmail.com with ESMTPSA id a5sm2364260wra.87.2017.12.06.01.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 01:36:50 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 10:36:46 +0100
Message-Id: <cover.4ddd15858ebb94110d175c9765f74daa1d0d74a8.1512552961.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/1] qemu: use upstream swtpm support
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
X-List-Received-Date: Wed, 06 Dec 2017 09:36:50 -0000

This aligns TPM support in OE with the approach accepted and merged
upstream.

An update for swtpm in meta-security was already sent
("[meta-security][PATCH 1/1] swtpm/libtpm: update to latest master").

Patrick Ohly (1):
  qemu: use upstream swtpm support

 meta/recipes-devtools/qemu/qemu/0001-Provide-support-for-the-CUSE-TPM.patch                     |  870 +-----------------------------------------------------------
 meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch              |  154 ++++++++++-
 meta/recipes-devtools/qemu/qemu/0002-Introduce-condition-to-notify-waiters-of-completed-c.patch |   86 +------
 meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch               |  121 ++++++++-
 meta/recipes-devtools/qemu/qemu/0003-Introduce-condition-in-TPM-backend-for-notification.patch  |   79 +-----
 meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch |   75 +++++-
 meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch   |  719 +-------------------------------------------------
 meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch   |  417 ++++++++++++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch |  185 +++++++++++++-
 meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch      |  284 +++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch      |  293 ++++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch |  140 ++++++++++-
 meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch          |  182 ++++++++++++-
 meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch                   | 1059 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch                  |   43 +++-
 meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch |   67 +++++-
 meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch               |  227 +++++++++++++++-
 meta/recipes-devtools/qemu/qemu_2.10.0.bb                                                       |   17 +-
 18 files changed, 3260 insertions(+), 1758 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-Provide-support-for-the-CUSE-TPM.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-Introduce-condition-to-notify-waiters-of-completed-c.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-Introduce-condition-in-TPM-backend-for-notification.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch

base-commit: 3b413a80578caacd9a7f405f3c51a3921d78a60d
-- 
git-series 0.9.1

