Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 31549782D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 08:39:38 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 00:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,426,1515484800"; d="scan'208";a="34665525"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga004.fm.intel.com with ESMTP; 05 Mar 2018 00:39:38 -0800
Date: Mon, 5 Mar 2018 10:42:49 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Message-ID: <20180305084249.GB32533@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
	<eaeb3198cf033c5960fb0c5db7cbec630d79d69d.1520219828.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <eaeb3198cf033c5960fb0c5db7cbec630d79d69d.1520219828.git.timothy.t.orling@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] maintainers.inc: self-assign recipes from recipes-extended/perl
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
X-List-Received-Date: Mon, 05 Mar 2018 08:39:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 04, 2018 at 07:25:18PM -0800, Tim Orling wrote:
> In prior round, the perl module recipes in recipes-extended/perl
> were inadvertantly overlooked.
> 
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 1e7517ac9a..1bd5fbd61e 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -321,7 +321,7 @@ RECIPE_MAINTAINER_pn-libcgroup = "Alexander Kanavin <alexander.kanavin@intel.com
>  RECIPE_MAINTAINER_pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-libclass-isa-perl = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-libcomps = "Alexander Kanavin <alexander.kanavin@intel.com>"
> -RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Maxin B. John <maxin.john@intel.com>"
> +RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@intel.com>"
>  RECIPE_MAINTAINER_pn-libcroco = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-libdaemon = "Alexander Kanavin <alexander.kanavin@intel.com>"
>  RECIPE_MAINTAINER_pn-libdmx = "Armin Kuster <akuster@mvista.com>"
> @@ -394,9 +394,9 @@ RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-libsolv = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-libsoup-2.4 = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-libtasn1 = "Maxin B. John <maxin.john@intel.com>"
> -RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@intel.com>"
> +RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alexander.kanavin@intel.com>"
> -RECIPE_MAINTAINER_pn-libtimedate-perl = "Maxin B. John <maxin.john@intel.com>"
> +RECIPE_MAINTAINER_pn-libtimedate-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libtirpc = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
> @@ -430,11 +430,11 @@ RECIPE_MAINTAINER_pn-libxi = "Armin Kuster <akuster@mvista.com>"
>  RECIPE_MAINTAINER_pn-libxinerama = "Armin Kuster <akuster@mvista.com>"
>  RECIPE_MAINTAINER_pn-libxkbcommon = "Armin Kuster <akuster@mvista.com>"
>  RECIPE_MAINTAINER_pn-libxkbfile = "Armin Kuster <akuster@mvista.com>"
> -RECIPE_MAINTAINER_pn-libxml-namespacesupport-perl = "Maxin B. John <maxin.john@intel.com>"
> +RECIPE_MAINTAINER_pn-libxml-namespacesupport-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libxml-parser-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libxml-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
> -RECIPE_MAINTAINER_pn-libxml-sax-base-perl = "Maxin B. John <maxin.john@intel.com>"
> -RECIPE_MAINTAINER_pn-libxml-sax-perl = "Maxin B. John <maxin.john@intel.com>"
> +RECIPE_MAINTAINER_pn-libxml-sax-base-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
> +RECIPE_MAINTAINER_pn-libxml-sax-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libxml-simple-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libxml2 = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-libxmu = "Armin Kuster <akuster@mvista.com>"
> -- 

FWIW,
Acked-by: Maxin B. John <maxin.john@intel.com>

Best Regards,
Maxin

