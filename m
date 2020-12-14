Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Re+2p1y6f9TgBhm2Ch9k4vCMG325jIuKxOEtimStkKkBJdhKb6onBG/YXPQCN12rHF4FABZP1s
 3gkncE342jBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752365"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752365"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:29 -0800
IronPort-SDR: BlN7ooNSpfI+13jOAAONpmC+3msqMA5Vpg92Usi45h0y39p9wxNHenStZK7LstHsiyBIJ/qOYL
 gnkuYj55wP4A==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670756"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/19] oeqa/devtool: use Yocto mirror for pv-1.5.3 tarball
Date: Mon, 14 Dec 2020 11:35:03 +0800
Message-Id: <bae9a74f4fb86d91721b493e97da5a5034c62828.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Some of the selftests failed over the weekend with "access denied" errors
fetching this tarball.  Instead of relying on upstream when fetching the
tarball, use the Yocto source mirrors instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 988e0ff4131f46dfed14516ff5f61d72b9fb6941)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d3d2e04c20..b8edc89768 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -269,7 +269,7 @@ class DevtoolAddTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         pn = 'pv'
         pv = '1.5.3'
-        url = 'http://www.ivarch.com/programs/sources/pv-1.5.3.tar.bz2'
+        url = 'http://downloads.yoctoproject.org/mirror/sources/pv-1.5.3.tar.bz2'
         result = runCmd('wget %s' % url, cwd=tempdir)
         result = runCmd('tar xfv %s' % os.path.basename(url), cwd=tempdir)
         srcdir = os.path.join(tempdir, '%s-%s' % (pn, pv))
-- 
2.29.2

