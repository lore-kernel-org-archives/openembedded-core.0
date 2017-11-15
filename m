Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 124FC78507
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 02:23:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAF2N8Mm028802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Nov 2017 18:23:11 -0800
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 14 Nov 2017 18:23:08 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
	<5a5cb4d84589268dcb65daa80ee86ba3094f777d.1510595883.git.liezhi.yang@windriver.com>
	<CAJTo0LYaO3G6cura1G029Bq5p0NMFpkDwXYUa+ru2pPP5wnyUA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <201022d6-ecad-eb4e-3658-77974caddb98@windriver.com>
Date: Wed, 15 Nov 2017 10:22:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYaO3G6cura1G029Bq5p0NMFpkDwXYUa+ru2pPP5wnyUA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] debianutils: 4.8.1.1 -> 4.8.3
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
X-List-Received-Date: Wed, 15 Nov 2017 02:23:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/14/2017 08:27 PM, Burton, Ross wrote:
> On 13 November 2017 at 17:58, Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
>     -SRC_URI =
>     "http://snapshot.debian.org/archive/debian/20170402T211732Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz
>     <http://snapshot.debian.org/archive/debian/20170402T211732Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz>"
>     +SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
>       # the package is taken from snapshots.debian.org
>     <http://snapshots.debian.org>; that source is static and goes stale
>       # so we check the latest upstream from a directory that does get updated
>       UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
> 
> Don't use DEBIAN_MIRROR as files are removed when they're not in an active 
> debian release anymore.  Please continue to use snapshot.debian.org 
> <http://snapshot.debian.org> but update the full URL.

Sorry, but I couldn't find debianutils_4.8.3 on snapshot.debian.org when I
updated the recipe on Friday, but I found it today since there is a
20171113T125547Z (created on 2017.11.13) now.

Updated in the repo.

commit 511b83d32ce9442a4cf767c38196a275b6514260
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Mon Nov 13 10:13:51 2017 +0800

     debianutils: 4.8.1.1 -> 4.8.3

     Update LIC_FILES_CHKSUM because it changed http:// to https://.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb 
b/meta/recipes-support/debianutils/debianutils_4.8.3.bb
similarity index 86%
rename from meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.3.bb
index 1857d4b..9a36511 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.3.bb
@@ -3,13 +3,15 @@ SECTION = "base"
  LICENSE = "GPLv2 & SMAIL_GPL"
  LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"

-SRC_URI = 
"http://snapshot.debian.org/archive/debian/20170402T211732Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = 
"http://snapshot.debian.org/archive/debian/20171113T125547Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
  # the package is taken from snapshots.debian.org; that source is static and 
goes stale
  # so we check the latest upstream from a directory that does get updated
  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"

-SRC_URI[md5sum] = "ee5fcecaab071bd0c93e8a0cee65d6c4"
-SRC_URI[sha256sum] = 
"06446cd4c0d309fd31a0682c5c2f07f7613fb867f769414b9cc51f155ad73172"
+S = "${WORKDIR}/${BPN}"
+
+SRC_URI[md5sum] = "f09fb52093f799c72de04a7ede1b7411"
+SRC_URI[sha256sum] = 
"7102246d1c35260ed7f0458a9886acf655c379d14908415574494cdea45e28fb"

  inherit autotools update-alternatives

// Robert

> 
> Ross

