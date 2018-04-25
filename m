Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55CC371AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:52:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3P7qAfM031036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 00:52:10 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 25 Apr 2018 00:52:09 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 15:23:16 +0800
Message-ID: <cover.1524640773.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH v2 0/8] gstreamer1.0: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 07:52:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* Update patch format of out-of-tree-build.patch
* Do add and remove patches which are moved from -bad to -base in 2 seperate commits

The following changes since commit da3625c52e1ab8985fba4fc3d133edf92142f182:

  build-appliance-image: Update to sumo head revision (2018-04-23 17:54:32 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/gstreamer1.14
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gstreamer1.14

Kai Kang (8):
  gstreamer1.0: 1.12.4 -> 1.14.0
  gstreamer1.0-plugins-base: 1.12.4 -> 1.14.0
  gstreamer1.0-plugins-bad: 1.12.4 -> 1.14.0
  gstreamer1.0-plugins-ugly: 1.12.4 -> 1.14.0
  gstreamer1.0-plugins-good: 1.12.4 -> 1.14.0
  gstreamer1.0-libav: 1.12.4 -> 1.14.0
  gst-validate: 1.12.4 -> 1.14.0
  gstreamer1.0: upgrade other packages to 1.14.0

 .../gstreamer/gst-validate/out-of-tree-build.patch | 28 ++++++++++
 ...t-validate_1.12.4.bb => gst-validate_1.14.0.bb} |  8 ++-
 ...a.c-Fix-build-by-Including-libavcodec-hev.patch | 33 -----------
 .../remove-host-contamination.patch                | 22 ++++++++
 ...ibav_1.12.4.bb => gstreamer1.0-libav_1.14.0.bb} |  6 +-
 ....0-omx_1.12.4.bb => gstreamer1.0-omx_1.14.0.bb} |  4 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 21 -------
 ...-don-t-hardcode-libtool-name-when-running.patch | 34 +-----------
 ...y-Use-ifdef-for-platform-specific-defines.patch | 37 -------------
 ...n-Use-the-generated-version-of-vkconfig.h.patch | 64 ----------------------
 ....12.4.bb => gstreamer1.0-plugins-bad_1.14.0.bb} |  9 +--
 .../gstreamer/gstreamer1.0-plugins-base.inc        | 13 ++++-
 ...-don-t-hardcode-libtool-name-when-running.patch | 32 ++++++-----
 ...-up-GstVideo-1.0.gir-from-local-build-dir.patch | 46 ++++++++++++++++
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  4 +-
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 54 ++++++++++--------
 ...t-need_segment-after-sink-pad-received-GS.patch |  8 ++-
 .../0009-glimagesink-Downrank-to-marginal.patch    |  0
 .../link-with-libvchostif.patch                    | 16 ++++--
 ...make-gio_unix_2_0-dependency-configurable.patch |  4 +-
 ...12.4.bb => gstreamer1.0-plugins-base_1.14.0.bb} | 10 +++-
 .../gstreamer/gstreamer1.0-plugins-good.inc        | 15 ++++-
 ...12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} |  4 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  5 +-
 ...12.4.bb => gstreamer1.0-plugins-ugly_1.14.0.bb} |  4 +-
 ...hon_1.12.4.bb => gstreamer1.0-python_1.14.0.bb} |  4 +-
 ....12.4.bb => gstreamer1.0-rtsp-server_1.14.0.bb} |  4 +-
 ...aapi_1.12.4.bb => gstreamer1.0-vaapi_1.14.0.bb} |  5 +-
 ...treamer1.0_1.12.4.bb => gstreamer1.0_1.14.0.bb} |  4 +-
 29 files changed, 227 insertions(+), 271 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate/out-of-tree-build.patch
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.12.4.bb => gst-validate_1.14.0.bb} (81%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/remove-host-contamination.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.12.4.bb => gstreamer1.0-libav_1.14.0.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.12.4.bb => gstreamer1.0-omx_1.14.0.bb} (69%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.4.bb => gstreamer1.0-plugins-bad_1.14.0.bb} (59%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad => gstreamer1.0-plugins-base}/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad => gstreamer1.0-plugins-base}/0009-glimagesink-Downrank-to-marginal.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad => gstreamer1.0-plugins-base}/link-with-libvchostif.patch (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.12.4.bb => gstreamer1.0-plugins-base_1.14.0.bb} (64%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.12.4.bb => gstreamer1.0-plugins-ugly_1.14.0.bb} (76%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.12.4.bb => gstreamer1.0-python_1.14.0.bb} (57%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.12.4.bb => gstreamer1.0-rtsp-server_1.14.0.bb} (44%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.12.4.bb => gstreamer1.0-vaapi_1.14.0.bb} (43%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.12.4.bb => gstreamer1.0_1.14.0.bb} (71%)

-- 
2.14.1


