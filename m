Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 525E57647D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 05:27:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 30 Jul 2015 22:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,582,1432623600"; d="scan'208";a="533505641"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.9.176])
	([10.252.9.176])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2015 22:27:57 -0700
Message-ID: <1438320476.10150.47.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 08:27:56 +0300
In-Reply-To: <1438318361-18428-1-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1438318361-18428-1-git-send-email-tanu.kaskinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Subject: Re: [PATCH] libvorbis: 1.3.4 -> 1.3.5
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
X-List-Received-Date: Fri, 31 Jul 2015 05:27:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-31 at 07:52 +0300, Tanu Kaskinen wrote:
> The change in COPYING was just a year update in a copyright notice.
> 
> Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
> ---
>  .../libvorbis/libvorbis_1.3.4.bb                   | 25 ----------------------
>  .../libvorbis/libvorbis_1.3.5.bb                   | 25 ++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 25 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
>  create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb

For some reason git send-email didn't detect the file renaming. Here's
the output from "git diff --find-renames" for easier review:

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
similarity index 78%
rename from meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
rename to meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
index 0788c94..c2765c3 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -6,14 +6,14 @@ HOMEPAGE = "http://www.vorbis.com/"
 BUGTRACKER = "https://trac.xiph.org"
 SECTION = "libs"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ca77c6c3ea4d29cb68dce8ef5ab0d897 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "55f2288055e44754275a17c9a2497391"
-SRC_URI[sha256sum] = "2f05497d29195dc23ee952a24ee3973a74e6277569c4c2eca0ec5968e541f372"
+SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
+SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
 
 inherit autotools pkgconfig


