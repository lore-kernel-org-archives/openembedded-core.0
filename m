Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcSS-0007Ve-JI
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:08:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 May 2012 10:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148041384"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 10:58:06 -0700
Message-ID: <4FBE76AE.7050108@linux.intel.com>
Date: Thu, 24 May 2012 10:58:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337641752-1521-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1337641752-1521-1-git-send-email-kergoth@gmail.com>
Subject: Re: [PATCH 1/3] tcmode-external-csl: preferred external-csl-toolchain's gdbserver
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
X-List-Received-Date: Thu, 24 May 2012 18:08:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2012 04:09 PM, Christopher Larson wrote:
> Signed-off-by: Christopher Larson<kergoth@gmail.com>
> ---
>   meta/conf/distro/include/tcmode-external-csl.inc |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
> index 731780b..0fa2ee1 100644
> --- a/meta/conf/distro/include/tcmode-external-csl.inc
> +++ b/meta/conf/distro/include/tcmode-external-csl.inc
> @@ -34,6 +34,7 @@ PREFERRED_PROVIDER_virtual/libintl = "external-csl-toolchain"
>   PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
>   PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
>   PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
> +PREFERRED_PROVIDER_gdbserver ??= "external-csl-toolchain"
>
>   # No need to re-compile the locale files
>   GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"

Merged this series of 3 into OE-Core

Thanks
	Sau!


