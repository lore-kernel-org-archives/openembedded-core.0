Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1307845E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 11:20:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 04:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,372,1498546800"; d="scan'208";a="1003362653"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 14 Aug 2017 04:20:09 -0700
Date: Mon, 14 Aug 2017 14:21:52 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Message-ID: <20170814112152.GA26694@mbabyjoh-desk.ger.corp.intel.com>
References: <1502552968-13361-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1502552968-13361-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] curl: upgrade to 7.55.0
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
X-List-Received-Date: Mon, 14 Aug 2017 11:20:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, Aug 12, 2017 at 05:49:28PM +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.0.bb} (94%)
> 
> diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.55.0.bb
> similarity index 94%
> rename from meta/recipes-support/curl/curl_7.54.1.bb
> rename to meta/recipes-support/curl/curl_7.55.0.bb
> index f42582a..9284666 100644

1. Subject line is a bit misleading (curl is in oe-core, so we don't need to mention meta-oe there)
2. For curl, the latest released version is 7.55.1. It will be nice if we choose that version.
    https://curl.haxx.se/changes.html

> --- a/meta/recipes-support/curl/curl_7.54.1.bb
> +++ b/meta/recipes-support/curl/curl_7.55.0.bb
> @@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>  #
>  SRC_URI += " file://configure_ac.patch"
>  
> -SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
> -SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
> +SRC_URI[md5sum] = "90cd4d6b20fa7655d2b75efe09fd7bfe"
> +SRC_URI[sha256sum] = "af1d69ec6f15fe70a2cabaa98309732bf035ef2a735e4e1a3e08754d2780e5b1"
>  
>  CVE_PRODUCT = "libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
> --

Best Regards,
Maxin

