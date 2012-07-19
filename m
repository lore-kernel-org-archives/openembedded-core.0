Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrtHV-0007Wy-J8
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:08:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 08:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="174324597"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2012 08:57:26 -0700
Message-ID: <50082E64.5010603@linux.intel.com>
Date: Thu, 19 Jul 2012 08:57:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342577756-11891-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1342577756-11891-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] slang: add header to patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 16:08:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 07:15 PM, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> Add description, Signed-off-by and Upstream-Status to
> change-char-type-to-signed-char-in-macros.patch
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   ...change-char-type-to-signed-char-in-macros.patch |   16 ++++++++++++++++
>   1 files changed, 16 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
> index 18dea13..2ea1ffd 100644
> --- a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
> +++ b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
> @@ -1,3 +1,19 @@
> +slang: change char type to signed char in macros
> +
> +C language has 3 distinct char types:
> +         char
> +         unsigned char
> +         signed char
> +A char has the same range of values as signed char on X86,
> +but same as unsigned char on ARM which made Slang's typecast()
> +and array_sort() unable to work for char value on ARM, since
> +Slang is assuming "char" as "signed char".
> +
> +Now we change "char" as "signed char" explicitly in
> +util/mkslarith2.sl, and use it to regenerate src/slarith2.inc
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>   ---
>    src/slarith2.inc       |   72 ++++++++++++++++++++++++-------------------------
>    src/util/mkslarith2.sl |    2 -
>

Merged into OE-Core

Thanks
	Sau!


