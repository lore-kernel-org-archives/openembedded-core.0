Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECD9D72EB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:52:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3P7qLQd022965
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 00:52:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 25 Apr 2018 00:52:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 15:23:24 +0800
Message-ID: <66bb698dd192267a3977bb4b5a0547724d002f0b.1524640773.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524640773.git.kai.kang@windriver.com>
References: <cover.1524640773.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 8/8] gstreamer1.0: upgrade other packages to 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 07:52:20 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade following packages from 1.12.4 to 1.14.0:
* gstreamer1.0-omx
* gstreamer1.0-python
* gstreamer1.0-rtsp-server
* gstreamer1.0-vaapi

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{gstreamer1.0-omx_1.12.4.bb => gstreamer1.0-omx_1.14.0.bb}       | 4 ++--
 .../{gstreamer1.0-python_1.12.4.bb => gstreamer1.0-python_1.14.0.bb} | 4 ++--
 ...r1.0-rtsp-server_1.12.4.bb => gstreamer1.0-rtsp-server_1.14.0.bb} | 4 ++--
 .../{gstreamer1.0-vaapi_1.12.4.bb => gstreamer1.0-vaapi_1.14.0.bb}   | 5 +++--
 4 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.12.4.bb => gstreamer1.0-omx_1.14.0.bb} (69%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.12.4.bb => gstreamer1.0-python_1.14.0.bb} (57%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.12.4.bb => gstreamer1.0-rtsp-server_1.14.0.bb} (44%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.12.4.bb => gstreamer1.0-vaapi_1.14.0.bb} (43%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
index 7f7eae3708..45f0345b77 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "eb8d5ae3b69cfeed9dc77c592106247e"
-SRC_URI[sha256sum] = "a025fa24242ec868fe0ff1e66d806a1070bcbc7c14a987a89cdc3395d0d56d5f"
+SRC_URI[md5sum] = "2bca3bd68540a97122450d78576ad2be"
+SRC_URI[sha256sum] = "4d43c354087cb77924982943e34e0d47294b5570304db11fd8b268b53bcff693"
 
 S = "${WORKDIR}/gst-omx-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.0.bb
similarity index 57%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.0.bb
index faec3566c4..8392839c6a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.0.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-python.inc
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f1fd046ea781736a794f9f552d77c50d"
-SRC_URI[sha256sum] = "20ce6af6615c9a440c1928c31259a78226516d06bf1a65f888c6d109826fa3ea"
+SRC_URI[md5sum] = "97782b2fde877f1d1d68c64f7db4f735"
+SRC_URI[sha256sum] = "e0b98111150aa3fcdeb6e228cd770995fbdaa8586fc02ec9b3273d4ae83399e6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
similarity index 44%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
index da68dcba20..ef8caa1907 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
@@ -1,6 +1,6 @@
 require gstreamer1.0-rtsp-server.inc
 
-SRC_URI[md5sum] = "ad70a9735f58da21d0f5cedf48ccadd3"
-SRC_URI[sha256sum] = "7660112ebd59838f1054796b38109dcbe32f0a040e3a252a68a81055aeaa56a9"
+SRC_URI[md5sum] = "8a505c88f7469c3a0d1e9f4e9a315e53"
+SRC_URI[sha256sum] = "6b65a077bed815f6d3157ebea503cc9f3c32d289af2756b7ff7e3958744d9756"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
similarity index 43%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
index 1df2301792..b42164aee8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
@@ -1,5 +1,6 @@
 require gstreamer1.0-vaapi.inc
-SRC_URI[md5sum] = "2149982cdb348139bca946bb63766f4c"
-SRC_URI[sha256sum] = "1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9"
+
+SRC_URI[md5sum] = "248c3aafab59814e71eb4a6c334cb261"
+SRC_URI[sha256sum] = "e4e31f085ef289bf1049398f641345979d20a1b11a80285744bba98504991df2"
 
 DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.14.1


