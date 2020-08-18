Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.60233.1597726421182640826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 21:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XQcOMbK2ihxQnApQeR0DZ7szgXgmNFX86ched/4LmqD02x8R3tO9Ni62jilWKc34/Aep/NzevP
 pf1HQrVYTEuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152249956"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="152249956"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:40 -0700
IronPort-SDR: SwAz0DSH7fzmohmIY8KeGT3wS8Kt6NA96peRcxIKz4gUJZ+wIVwcVMluf39BcxMsEdwCFpkEfr
 ao5JRHNjBtyA==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="319960835"
Received: from ychiew-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.25])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:38 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] harfbuzz: upgrade 2.6.8 -> 2.7.1
Date: Tue, 18 Aug 2020 12:53:31 +0800
Message-Id: <20200818045334.121647-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_2.6.8.bb => harfbuzz_2.7.1.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.6.8.bb => harfbuzz_2.7.1.bb} (92%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.8.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
similarity index 92%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.6.8.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
index 3c4a5b5a2b..08c8f83239 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.8.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
@@ -11,8 +11,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c8d4f2aeed6e576bd42f9dc6def1b1ae"
-SRC_URI[sha256sum] = "6648a571a27f186e47094121f0095e1b809e918b3037c630c7f38ffad86e3035"
+SRC_URI[sha256sum] = "e95ee43b6bd0d3d1307e2aacf0f9c0050e5baceb21988b367b833028114aa569"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.26.2

