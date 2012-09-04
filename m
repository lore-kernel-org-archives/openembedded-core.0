Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8uf4-0003s2-7v
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 17:03:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2012 07:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="196547764"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2012 07:51:07 -0700
Message-ID: <5046155A.8040401@linux.intel.com>
Date: Tue, 04 Sep 2012 07:51:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1346672409-15640-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1346672409-15640-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tclibc-eglibc.inc: add PREFERRED_PROVIDER_virtual/nativesdk-libintl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 15:03:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2012 04:40 AM, Martin Jansa wrote:
> * fixes warning:
>    NOTE: multiple providers are available for virtual/nativesdk-libintl (nativesdk-eglibc, nativesdk-gettext)
>    NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/nativesdk-libintl
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/conf/distro/include/tclibc-eglibc.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
> index 1c9e7e9..cb4965d 100644
> --- a/meta/conf/distro/include/tclibc-eglibc.inc
> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> @@ -11,6 +11,7 @@ OVERRIDES .= "${LIBCOVERRIDE}"
>   PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
>   PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
>   PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
>   PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
>   PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
>   PREFERRED_PROVIDER_virtual/libc-locale ?= "eglibc-locale"
>

Merged Khem's version which included uclibc also.

Thanks for this though!

Sau!



