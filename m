Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.17081.1627890806830162900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002112"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655036"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:26 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 26/37] bitbake.conf: change GNOME_MIRROR to new one
Date: Mon,  2 Aug 2021 15:52:13 +0800
Message-Id: <03660a42836d650a6d4f9d4c255c764925cbea22.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

URI has been permanently moved and returns HTTP 301.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a3a85d54af38a30f6de5f6d23e432afa26859888)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 385fc7dd55..5b52e9307e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -638,7 +638,7 @@ APACHE_MIRROR = "https://archive.apache.org/dist"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
-GNOME_MIRROR = "https://ftp.gnome.org/pub/GNOME/sources"
+GNOME_MIRROR = "https://download.gnome.org/sources/"
 GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
-- 
2.31.1

