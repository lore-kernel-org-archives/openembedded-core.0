Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 53ED67F948
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 23:24:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:14 -0800
X-IronPort-AV: E=Sophos;i="5.68,318,1569308400"; d="scan'208";a="195955423"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.20.29])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 07:23:30 +0800
Message-Id: <20191117232337.5635-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [zeus][PATCH 0/7] zeus pull request
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
X-List-Received-Date: Sun, 17 Nov 2019 23:24:13 -0000
Content-Transfer-Encoding: 8bit

a-full passing on autobuilder. Patches can be pulled from anujm/zeus.

Thanks,

Anuj

Adrian Bunk (1):
  iputils: Whitelist CVE-2000-1213 CVE-2000-1214

Chen Qi (1):
  python: fix CVE-2019-16935

Peter Kjellerstedt (2):
  sysstat: Correct our systemd unit file
  sysstat: Correct when to use the package provided systemd unit files

Ross Burton (1):
  wpa-supplicant: fix CVE-2019-16275

Trevor Gamblin (2):
  binutils: fix CVE-2019-17450
  binutils: fix CVE-2019-17451

 ...re-management-frame-from-unexpected-.patch |  82 ++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 .../binutils/binutils-2.32.inc                |   2 +
 .../binutils/binutils/CVE-2019-17450.patch    |  99 +++++++++++++++++
 .../binutils/binutils/CVE-2019-17451.patch    |  51 +++++++++
 ...cape-the-server-title-of-DocXMLRPCSe.patch | 101 ++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb |   1 +
 .../iputils/iputils_s20190709.bb              |   4 +
 meta/recipes-extended/sysstat/sysstat.inc     |  10 +-
 .../sysstat/sysstat/sysstat.service           |   2 +-
 10 files changed, 348 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch

-- 
2.21.0


