Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC4C46B6B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:33:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5XM1c024322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:33:23 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:33:22 -0800
Message-ID: <54E6C721.7060505@windriver.com>
Date: Fri, 20 Feb 2015 13:33:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1424230079.git.liezhi.yang@windriver.com>
	<eceff7d5f3e72ad90a818f7c8b42270f4c8ccb9b.1424230079.git.liezhi.yang@windriver.com>
In-Reply-To: <eceff7d5f3e72ad90a818f7c8b42270f4c8ccb9b.1424230079.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/4] gettext 0.16.1: disable native
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
X-List-Received-Date: Fri, 20 Feb 2015 05:33:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Any comments on the two patches, please ?

// Robert

On 02/18/2015 11:28 AM, Robert Yang wrote:
> ERROR: The recipe gettext-native is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>     sysroots/x86_64-linux/usr/share/gettext/config.rpath
>   Matched in manifest-x86_64-gettext-minimal-native.populate_sysroot
>   sysroots/x86_64-linux/usr/share/gettext/po/remove-potcdate.sin
>   Matched in manifest-x86_64-gettext-minimal-native.populate_sysroot
>   sysroots/x86_64-linux/usr/share/gettext/po/Makefile.in.in
>   Matched in manifest-x86_64-gettext-minimal-native.populate_sysroot
> Please verify which recipe should provide the above files.
>
> We have 0.19.4, so disable it rather than fix.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-core/gettext/gettext_0.16.1.bb |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
> index 892194c..97acf7b 100644
> --- a/meta/recipes-core/gettext/gettext_0.16.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
> @@ -7,9 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ea3144f04c41cd2eada5d3f472e6ea5"
>
>   PR = "r6"
>   DEPENDS = "virtual/libiconv"
> -DEPENDS_class-native = ""
>   PROVIDES = "virtual/libintl virtual/gettext"
> -PROVIDES_class-native = ""
>
>   SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>              file://gettext-vpath.patch \
> @@ -106,4 +104,4 @@ remove_sysroot_m4_macros () {
>       rm -r "${SYSROOT_DESTDIR}${datadir}/aclocal"
>   }
>
> -BBCLASSEXTEND = "native nativesdk"
> +BBCLASSEXTEND = "nativesdk"
>

