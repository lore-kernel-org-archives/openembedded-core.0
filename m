Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2174F6008D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:47:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Aug 2013 14:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,962,1367996400"; d="scan'208";a="351909468"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2013 14:47:04 -0700
Message-ID: <521BCCD8.6080804@linux.intel.com>
Date: Mon, 26 Aug 2013 14:47:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <1377542924-1605-1-git-send-email-andrei.gherzan@windriver.com>
In-Reply-To: <1377542924-1605-1-git-send-email-andrei.gherzan@windriver.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc: nscd support depends on OPTION_EGLIBC_INET
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
X-List-Received-Date: Mon, 26 Aug 2013 21:47:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2013 11:48 AM, Andrei Gherzan wrote:
> Add --disable-nscd if DISTRO_FEATURES does not contain ipv4. This features is
> mapped to OPTION_EGLIBC_INET.
> The default behavior is to activate nscd (if --disable-nscd is not passed to
> configure script). But nscd depends on OPTION_EGLIBC_INET, so compilation will
> fail if this option is not activated.
>
Does this also need the Package to be set for ALLOW_EMPTY?

Sau!

> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>   meta/recipes-core/eglibc/eglibc_2.18.bb |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
> index 17b651f..771f3e7 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.18.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
> @@ -79,6 +79,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                   --without-selinux \
>                   --enable-obsolete-rpc \
>                   --with-kconfig=${STAGING_BINDIR_NATIVE} \
> +                ${@base_contains('DISTRO_FEATURES', 'ipv4', '', '--disable-nscd', d)} \
>                   ${GLIBC_EXTRA_OECONF}"
>
>   EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
>

