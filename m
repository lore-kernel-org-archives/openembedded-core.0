Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C8D516C052
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:58:37 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Sep 2013 08:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="358480418"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 10 Sep 2013 08:58:38 -0700
Received: from [10.237.108.34] (apalalax-mobl.ger.corp.intel.com
	[10.237.108.34])
	by linux.intel.com (Postfix) with ESMTP id ADEE56A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 08:58:36 -0700 (PDT)
Message-ID: <522F41AD.9080305@linux.intel.com>
Date: Tue, 10 Sep 2013 18:58:37 +0300
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Organization: Intel OTC
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1378807330-15606-1-git-send-email-b28495@freescale.com>
In-Reply-To: <1378807330-15606-1-git-send-email-b28495@freescale.com>
Subject: Re: [PATCH v2] libcroco: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Tue, 10 Sep 2013 15:58:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/2013 1:02 PM, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>
> When trying to build on my Centos 5.5 machine, got below error:
> | checking for gtkdoc-mkpdf... no
> | checking whether to build gtk-doc documentation... no
> | checking for CROCO... yes
> | checking if gcc supports "-Wl,-Bsymbolic-functions" flag...
> | configure: error: -Bsymbolic requested but not supported by ld. Use --disable-Bsymbolic to disable
> | Configure failed. The contents of all config.log files follows to aid debugging
> |
> | configure: exit 1
> | ERROR: oe_runconf failed
>
> Set --enable_Bsymbolic=auto to disable it when it is not suppported.
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>   meta/recipes-support/libcroco/libcroco_0.6.8.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
> index 3c5dc9a..fe1a42d 100644
> --- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
> +++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
>   SECTION = "x11/utils"
>   DEPENDS = "glib-2.0 libxml2 zlib"
>   BBCLASSEXTEND = "native"
> -
> +EXTRA_OECONF += "--enable_Bsymbolic=auto"

I think that the correct parameter would be --enalbe-Bsymbolic (no 
underscore as Ross already mentioned)

>   PR = "r1"
>
>   inherit autotools pkgconfig gnomebase
>

Best,

-- 
Alexandru Palalau

