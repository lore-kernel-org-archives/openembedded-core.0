Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EBE9961F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:32:28 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 May 2013 02:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="246068722"
Received: from unknown (HELO helios.localnet) ([10.255.12.195])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2013 02:32:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ionut Radu <ionutx.radu@intel.com>
Date: Fri, 24 May 2013 10:32:28 +0100
Message-ID: <2384153.4ZHV9FFNJO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <b03438668613cd856b4993a5cfaa4faadb17fd62.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<b03438668613cd856b4993a5cfaa4faadb17fd62.1369386157.git.ionutx.radu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] freetype: Updated from 2.4.11 to 2.4.12
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
X-List-Received-Date: Fri, 24 May 2013 09:32:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ionut,

On Friday 24 May 2013 12:18:06 Ionut Radu wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
> 
> freetype: no-hardcode.patch does not apply to 2.4.12 version because
> hardcode_libdir_flag_spec variable is set to '' in 2.4.12
> 
> ---
>  .../{freetype-2.4.11 => freetype-2.4.12}/no-hardcode.patch  |    0
>  .../freetype/{freetype_2.4.11.bb => freetype_2.4.12.bb}     |   11
> ++++------- 2 files changed, 4 insertions(+), 7 deletions(-)
>  rename meta/recipes-graphics/freetype/{freetype-2.4.11 =>
> freetype-2.4.12}/no-hardcode.patch (100%) rename
> meta/recipes-graphics/freetype/{freetype_2.4.11.bb => freetype_2.4.12.bb}
> (83%)
> 
> diff --git
> a/meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
> b/meta/recipes-graphics/freetype/freetype-2.4.12/no-hardcode.patch
> similarity index 100%
> rename from meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
> rename to meta/recipes-graphics/freetype/freetype-2.4.12/no-hardcode.patch
> diff --git a/meta/recipes-graphics/freetype/freetype_2.4.11.bb
> b/meta/recipes-graphics/freetype/freetype_2.4.12.bb similarity index 83%
> rename from meta/recipes-graphics/freetype/freetype_2.4.11.bb
> rename to meta/recipes-graphics/freetype/freetype_2.4.12.bb
> index 53fde1d..36817a6 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.4.11.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.4.12.bb
> @@ -7,19 +7,16 @@ HOMEPAGE = "http://www.freetype.org/"
>  BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
> 
>  LICENSE = "FreeType | GPLv2+"
> -LIC_FILES_CHKSUM =
> "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39 \
> +LIC_FILES_CHKSUM =
> "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56 \
> file://docs/FTL.TXT;md5=d479e83797f699fe873b38dadd0fcd4c \
> file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"

If you change LIC_FILES_CHKSUM you need to explain exactly why in the commit 
message.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

