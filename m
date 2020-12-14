Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.28836.1607910784316673259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 17:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: B/WbuGITFFESStclkd1NdmBnO4622zuOTginDTGorXbpk/zCPE3dvw9zVETbZzQigw8YI3Wr5E
 PykbfSgFljiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="154453740"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="154453740"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 17:53:03 -0800
IronPort-SDR: hkZa3ATb+eT6wUBcRSG4tmPk0pdR+4shgmutSBkNECKq1nuJBeWy5suWkoYtIafCMSPuhmL2hA
 qOi7wu6gGQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="381151806"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2020 17:53:02 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][gatesgarth] go: 1.15.2 -> 1.15.6
Date: Mon, 14 Dec 2020 09:53:01 +0800
Message-Id: <1607910781-88071-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

update minor version to 1.15.6

go-1.15.3 includes fixes to cgo, the compiler, runtime, the go command, and the bytes, plugin, and testing packages.
go-1.15.4 includes fixes to cgo, the compiler, linker, runtime, and the compress/flate, net/http, reflect, and time packages.
go-1.15.5 includes security fixes to the go command and the math/big package.
go-1.15.6 includes fixes to the compiler, linker, runtime, the go command, and the io package.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-28362
https://nvd.nist.gov/vuln/detail/CVE-2020-28366
https://nvd.nist.gov/vuln/detail/CVE-2020-28367
https://golang.org/doc/devel/release.html#go1.15.minor

Updates includes fix for:
CVE-2020-28362
CVE-2020-28366
CVE-2020-28367

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/recipes-devtools/go/go-1.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index 97d748b..c5e3fe0 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-GO_MINOR = ".2"
+GO_MINOR = ".6"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d"
+SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
-- 
2.7.4

