Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E8D5961011
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 20:52:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Sep 2013 13:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,910,1371106800"; d="scan'208";a="295151139"
Received: from unknown (HELO [10.255.14.132]) ([10.255.14.132])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Sep 2013 13:52:12 -0700
Message-ID: <52361DFB.5090506@linux.intel.com>
Date: Sun, 15 Sep 2013 13:52:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1379132723.git.hongxu.jia@windriver.com>
	<9bafb39aaaf33a7a3eee1e20ca2beca8378df3c8.1379132723.git.hongxu.jia@windriver.com>
In-Reply-To: <9bafb39aaaf33a7a3eee1e20ca2beca8378df3c8.1379132723.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python: fix failures of LSB python-runtime tests
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
X-List-Received-Date: Sun, 15 Sep 2013 20:52:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2013 09:31 PM, Hongxu Jia wrote:
> It has been fixed in:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=e261c1760d8a660c13cd00039a4812d51f47f3df
>
> But there is a typo in:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb
> It missed to remove an extra "--with-wctype-functions" in EXTRA_OECONF
>
> [YOCTO #5154]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-devtools/python/python.inc | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
> index 80609a8..fcfeda5 100644
> --- a/meta/recipes-devtools/python/python.inc
> +++ b/meta/recipes-devtools/python/python.inc
> @@ -25,7 +25,6 @@ EXTRA_OECONF = "\
>     --with-cyclic-gc \
>     --without-cxx \
>     --with-signal-module \
> -  --with-wctype-functions \
I think this needs to be protected with a linuxstdbase check.

Sau!

>     --enable-shared \
>     --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
>     ${PYTHONLSBOPTS} \
>

