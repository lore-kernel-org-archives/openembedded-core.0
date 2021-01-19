Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8244.1611038799087798389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PWHu11VVdvb33m1K8EQLoKoRrUzRp/B48XVtR7UdIaS8P07RgwyDN9t7LqrAf05eSMwdxhx586
 Dhp1oXjIpqlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035652"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035652"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:25 -0800
IronPort-SDR: NzB4m0cjW/AgyYUTa9NoDWWxdJ0yxyWsuhEO0hgy2k9jR+MVuoWFc+JIBE5KZTuL5JU5mSXdWm
 d3br33hHdqng==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441799"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/30] gcr: upgrade 3.38.0 -> 3.38.1
Date: Tue, 19 Jan 2021 14:45:44 +0800
Message-Id: <20210119064552.115692-22-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-gnome/gcr/{gcr_3.38.0.bb => gcr_3.38.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_3.38.0.bb => gcr_3.38.1.bb} (91%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.38.0.bb b/meta/recipes-gnome/gcr/gcr_3.38.1.bb
similarity index 91%
rename from meta/recipes-gnome/gcr/gcr_3.38.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.38.1.bb
index 49e8f1848b..40e67f23ae 100644
--- a/meta/recipes-gnome/gcr/gcr_3.38.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.38.1.bb
@@ -17,7 +17,7 @@ inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "a64cc7b65757fc2cd16de1708d132a16d05cd1f62c6eba436d56fe45d4ba27e1"
+SRC_URI[archive.sha256sum] = "17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.29.2

