Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: D7jzY8c0tRDo0bs6VLCkcPaBn3O9GpED2h3z56rZQ9+Bts6J4N2bpjAnQhtTGEcJU/nGBfU8l3
 A3JiRUwcE9Tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247060"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247060"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:20 -0800
IronPort-SDR: 2v2ibk7ZE83OOKin6vior+kd2Qb2TESvqmf2QJbef/svxUfhL01x5p5Uv6mSfocrcv9uRob1zw
 8eZFwAlpYmMg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825387"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/27] libevdev: upgrade 1.10.1 -> 1.11.0
Date: Wed, 17 Feb 2021 13:51:47 +0800
Message-Id: <20210217055210.22019-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: change to MIT.

See:
https://lists.freedesktop.org/archives/input-tools/2021-February/001557.html

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libevdev/{libevdev_1.10.1.bb => libevdev_1.11.0.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.10.1.bb => libevdev_1.11.0.bb} (54%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.10.1.bb b/meta/recipes-support/libevdev/libevdev_1.11.0.bb
similarity index 54%
rename from meta/recipes-support/libevdev/libevdev_1.10.1.bb
rename to meta/recipes-support/libevdev/libevdev_1.11.0.bb
index 353ded6f28..96179e18e8 100644
--- a/meta/recipes-support/libevdev/libevdev_1.10.1.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.11.0.bb
@@ -2,13 +2,13 @@ SUMMARY = "Wrapper library for evdev devices"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libevdev/"
 SECTION = "libs"
 
-LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
-                    file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
+                    "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
            file://determinism.patch"
-SRC_URI[sha256sum] = "0330fe8357ece915db9366c1b9a6648941aea6f724b73ad6e71401127aa08932"
+SRC_URI[sha256sum] = "63f4ea1489858a109080e0b40bd43e4e0903a1e12ea888d581db8c495747c2d0"
 
 inherit autotools pkgconfig
 
-- 
2.29.2

