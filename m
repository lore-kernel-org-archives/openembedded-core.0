Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9046E78711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:47:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Mar 2018 07:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,365,1517904000"; d="scan'208";a="45385954"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2018 07:47:00 -0700
To: Armin Kuster <akuster808@gmail.com>, akuster@mvista.com,
	openembedded-core@lists.openembedded.org,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1521989435.git.akuster@mvista.com>
	<917fba1ddf9aabf3aebf25ccd9def83808ac8a4c.1521989435.git.akuster@mvista.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <849d5550-fa4a-3378-461d-71acc30ff504@linux.intel.com>
Date: Mon, 26 Mar 2018 17:40:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <917fba1ddf9aabf3aebf25ccd9def83808ac8a4c.1521989435.git.akuster@mvista.com>
Subject: Re: [PATCH 11/21] libshmfence: update to 1.3
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
X-List-Received-Date: Mon, 26 Mar 2018 14:47:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/26/2018 05:30 PM, Armin Kuster wrote:
> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> index 4cc9e05..461fe83 100644
> --- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> @@ -4,14 +4,16 @@ AC_USE_SYSTEM_EXTENSIONS to get that defined.
>   Upstream-Status: Submitted
>   Signed-off-by: Ross Burton <ross.burton@intel.com>
>   
> -diff --git a/configure.ac b/configure.ac
> -index 0c98875..ebf4dee 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
> - AC_CONFIG_HEADERS([config.h])
> +Index: libxshmfence-1.3/configure.ac
> +===================================================================
> +--- libxshmfence-1.3.orig/configure.ac
> ++++ libxshmfence-1.3/configure.ac
> +@@ -30,6 +30,8 @@ AC_CONFIG_HEADERS([config.h])
> +
> + AC_USE_SYSTEM_EXTENSIONS
>    
>   +AC_USE_SYSTEM_EXTENSIONS
>   +
>    # Initialize Automake
>    AM_INIT_AUTOMAKE([foreign dist-bzip2])
> +

When devtool refreshes a patch, you do need to read the outcome to check 
that it is, indeed, applied correctly. Especially suspicious are the 
patches that are backports or 'Submitted'.

In this case, a duplicate line is inserted due to patch fuzz - harmless 
I guess, but unnecessary.


Alex

