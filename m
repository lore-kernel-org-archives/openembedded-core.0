Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CB6EE78763
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:03:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r78so6498113wme.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 03:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9qcefIO44rJUL0ucNhx3hWCAD/QlzOnXZXev2ZBEWdU=;
	b=a3ysqQBSf/IY0pgxj7SL32lGx2CNVd8E1AfdSKuOiHmkInnkhytzucyyZwp0fH+7eW
	do2UUmxHMgDJYkYnYsu1ZdX9JuTP9k/dkzXxR0NrWC6dkYriYoFLMbqf9Dm373JVTPrX
	m2w6hfBaTtbVX6piyKbZ5vNsf212xrlARu7mmt43YPGAYCkMN2q6dgNWrkb7wTTh/f3R
	rkvBNAw1B0wdfackZMIn0X/eaxYc5/fTfX3U6vFwbeLAkoGJO4Fxq5Fsq1GGPEI/jPJY
	nrNluo3kgUCxR0voT19hzIXIzag0cG6mzavDss4X0lJ6fz891I6MV2bwk1YIK70S+1hK
	Yq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9qcefIO44rJUL0ucNhx3hWCAD/QlzOnXZXev2ZBEWdU=;
	b=kJBVfOwmPYCv5rYvvUu2XVqpsPxwhFWXWRVz+/PNDAC2giYzk+UuE/lhLiG3nc3M2N
	jr6DT3Bpc5CzP78SNzJ30icdP56u4cSROrj32lkp0jM31NGKSR9lpQSgL/Qi/ZbSWlze
	wn2HbRtdYy2xVc4NQUz9QTCJ8eEGrzVp6M2YfrfKNCtvxMRCG7QF47+BmOEz17QqUaRw
	2e9AG44hYOXzQ1F9fli0dwFXjtaA/p+vbBxPGwNeP4DEEFkHwvPSYbhl9QbTVv7m78XD
	O54JsKN4T7gQfEmzFas+F9pvFyPv/w/n52AgNp+5EjMcwcGrKsTg0X0wM/3UsO6jexUr
	hLlQ==
X-Gm-Message-State: AKGB3mLdPougPl0b2ffLugH1al2od7b5nZk3nEcBHQeh0VUHVUFUFE9i
	mRsAl6km7YhMo1/8+c6N2jzcjlQ=
X-Google-Smtp-Source: AGs4zMZ8lGc6jcnXIVM1xUDtZe3LZCI48FPYnPsht7EG2smeUqXDfot9tPjjwxhTB5cDaE8R/4u4Ag==
X-Received: by 10.28.165.130 with SMTP id o124mr8320218wme.124.1512558215308; 
	Wed, 06 Dec 2017 03:03:35 -0800 (PST)
Received: from pohly-desktop.fritz.box (p54BD5190.dip0.t-ipconnect.de.
	[84.189.81.144]) by smtp.gmail.com with ESMTPSA id
	p81sm2381883wrc.61.2017.12.06.03.03.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 03:03:34 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 12:03:31 +0100
Message-Id: <cover.995d0a3042910e89952613df0a5e7186c2c44f78.1512558198.git-series.patrick.ohly@intel.com>
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
X-List-Received-Date: Wed, 06 Dec 2017 11:03:35 -0000

This aligns TPM support in OE with the approach accepted and merged
upstream.

An update for swtpm in meta-security was already sent
("[meta-security][PATCH 1/1] swtpm/libtpm: update to latest master").

Changes:
  -v2: rebased

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
 meta/recipes-devtools/qemu/qemu_2.10.1.bb                                                       |   17 +-
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

base-commit: a7cd9d1183be603777fc9c8c448281fe01224f7b
-- 
git-series 0.9.1

