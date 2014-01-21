Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C4A3F60144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:09:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 14:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442529498"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 14:09:16 -0800
Message-ID: <52DEF00C.20608@linux.intel.com>
Date: Tue, 21 Jan 2014 14:09:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1390306673-9822-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1390306673-9822-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] conf/bitbake.conf: default HOMEPAGE to blank instead of unknown
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
X-List-Received-Date: Tue, 21 Jan 2014 22:09:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2014 04:17 AM, Paul Eggleton wrote:
> The default value for HOMEPAGE of "unknown" has been in place since the
> early OE-Classic days, but it doesn't really make sense - "unknown" is
> not a valid URL and it just means we have to explicitly check for this
> hardcoded string if we're displaying the value in some form of UI, such
> as Toaster. There is some code in the unmaintained oelint.bbclass to
> check for this value, presumably on the assumption that the recipe will
> explicitly set it to "" if there really isn't a homepage, but looking at
> recipes in OE-Core and meta-oe suggests that we haven't been using this
> convention for some time (with one exception in the latter) and it's
> rather uncommon these days to have no URL to associate with a recipe.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 57668e1..4fb6a1c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -241,7 +241,7 @@ This package contains documentation."
>
>   LICENSE = "INVALID"
>   MAINTAINER = "OE-Core Developers <openembedded-core@lists.openembedded.org>"
> -HOMEPAGE = "unknown"
> +HOMEPAGE = ""
>

This seems to have caused a couple of problems with shadow-securetty, 
updaterc and depmodwrapper.

There may be more.

I will look to see what I can do to fix those recipes.

Sau!

>   # Package dependencies and provides.
>
>

