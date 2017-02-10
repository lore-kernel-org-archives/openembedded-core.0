Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F24A9772E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:37:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3b3vT009663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Feb 2017 19:37:04 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:37:03 -0800
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
	<20170210032952.9310.93404@do.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ae8b6c74-9d74-c116-a7b2-015078ce3666@windriver.com>
Date: Fri, 10 Feb 2017 11:37:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20170210032952.9310.93404@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFBhY2thZ2VzIHVwZ3JhZGU=?=
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
X-List-Received-Date: Fri, 10 Feb 2017 03:37:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Here is the patch content, I didn't add any new patches, is there anything
wrong with test_signed_off_by_presence, please ?

Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Thu Feb 9 08:14:50 2017 +0000

     libpcre: 8.39 -> 8.40

     The LIC_FILES_CHKSUM is changed because the date is changed, here is
     diff result:
     < Copyright (c) 1997-2017 University of Cambridge
     ---
     > Copyright (c) 1997-2016 University of Cambridge
     39c39
     < Copyright(c) 2010-2017 Zoltan Herczeg
     ---
     > Copyright(c) 2010-2016 Zoltan Herczeg
     50c50
     < Copyright(c) 2009-2017 Zoltan Herczeg
     ---
     > Copyright(c) 2009-2016 Zoltan Herczeg

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-support/libpcre/libpcre_8.39.bb 
b/meta/recipes-support/libpcre/libpcre_8.40.bb
similarity index 92%
rename from meta/recipes-support/libpcre/libpcre_8.39.bb
rename to meta/recipes-support/libpcre/libpcre_8.40.bb
index 2d4668b52de..6396872d80c 100644
--- a/meta/recipes-support/libpcre/libpcre_8.39.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.40.bb
@@ -6,7 +6,7 @@ SUMMARY = "Perl Compatible Regular Expressions"
  HOMEPAGE = "http://www.pcre.org"
  SECTION = "devel"
  LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b8221cbf43c5587f90ccf228f1185cc2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=60da32d84d067f53e22071c4ecb4384d"
  SRC_URI = 
"ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.bz2 \
             file://pcre-cross.patch \
             file://fix-pcre-name-collision.patch \
@@ -14,8 +14,8 @@ SRC_URI = 
"ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.
             file://Makefile \
  "

-SRC_URI[md5sum] = "e3fca7650a0556a2647821679d81f585"
-SRC_URI[sha256sum] = 
"b858099f82483031ee02092711689e7245586ada49e534a06e678b8ea9549e8b"
+SRC_URI[md5sum] = "41a842bf7dcecd6634219336e2167d1d"
+SRC_URI[sha256sum] = 
"00e27a29ead4267e3de8111fcaa59b132d0533cdfdbdddf4b0604279acbcf4f4"

  S = "${WORKDIR}/pcre-${PV}"

// Robert

On 02/10/2017 11:29 AM, Patchwork wrote:
> == Series Details ==
>
> Series: Packages upgrade
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/5250/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Patch            [05/10] libpcre: 8.39 -> 8.40
>  Issue             Patch is missing Signed-off-by [test_signed_off_by_presence]
>   Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>

