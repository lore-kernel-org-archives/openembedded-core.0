Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEE273177
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 05:18:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F5ILso032532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 14 Jan 2016 21:18:21 -0800
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 21:18:20 -0800
To: <ross.burton@intel.com>
References: <cover.1452826805.git.dengke.du@windriver.com>
	<13d1f0fbaf650975b460b42e72bcdde74e7b97a7.1452826805.git.dengke.du@windriver.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <56988115.3020200@windriver.com>
Date: Fri, 15 Jan 2016 13:18:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <13d1f0fbaf650975b460b42e72bcdde74e7b97a7.1452826805.git.dengke.du@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ncurses: 5.9 0 -> 6.0
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
X-List-Received-Date: Fri, 15 Jan 2016 05:18:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Drop it , use the newer patch, because I specifiy the error remote.
Sorry for inconvenience.

On 2016年01月15日 11:07, Dengke Du wrote:
> To be compatible with ncurses 5, add option '--with-abi-version=5' to EXTRA_OECONF
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   .../recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/config.cache | 0
>   .../ncurses/{ncurses-5.9 => ncurses-6.0}/tic-hang.patch            | 0
>   meta/recipes-core/ncurses/ncurses.inc                              | 1 -
>   meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb}       | 7 +++----
>   4 files changed, 3 insertions(+), 5 deletions(-)
>   rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/config.cache (100%)
>   rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/tic-hang.patch (100%)
>   rename meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb} (59%)
>
> diff --git a/meta/recipes-core/ncurses/ncurses-5.9/config.cache b/meta/recipes-core/ncurses/ncurses-6.0/config.cache
> similarity index 100%
> rename from meta/recipes-core/ncurses/ncurses-5.9/config.cache
> rename to meta/recipes-core/ncurses/ncurses-6.0/config.cache
> diff --git a/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch b/meta/recipes-core/ncurses/ncurses-6.0/tic-hang.patch
> similarity index 100%
> rename from meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
> rename to meta/recipes-core/ncurses/ncurses-6.0/tic-hang.patch
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 27815b8..fbe74d5 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
>   SECTION = "libs"
>   DEPENDS = "ncurses-native"
>   DEPENDS_class-native = ""
> -INC_PR = "r15"
>   
>   BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config"
>   
> diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_6.0.bb
> similarity index 59%
> rename from meta/recipes-core/ncurses/ncurses_5.9.bb
> rename to meta/recipes-core/ncurses/ncurses_6.0.bb
> index 22c6230..8587287 100644
> --- a/meta/recipes-core/ncurses/ncurses_5.9.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.0.bb
> @@ -1,12 +1,11 @@
>   require ncurses.inc
>   
> -REVISION = "20150329"
> -
> -PR = "${INC_PR}.1"
> +REVISION = "20151024"
>   
>   SRC_URI += "file://tic-hang.patch \
>               file://config.cache \
>   "
>   # commit id corresponds to the above listed REVISION
> -SRCREV = "6286e14dac28811dbfd325b8d4c23f0d4e37eaf0"
> +SRCREV = "c6b034b4d69f8c9092c2a1b5d5bb718282b2a522"
>   S = "${WORKDIR}/git"
> +EXTRA_OECONF += "--with-abi-version=5"


