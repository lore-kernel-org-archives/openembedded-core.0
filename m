Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfDnB-0003Cb-S5
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 19:25:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2012 10:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180099640"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 10:14:29 -0700
Message-ID: <4FDA1BF5.2000005@linux.intel.com>
Date: Thu, 14 Jun 2012 10:14:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Khem Raj <raj.khem@gmail.com>
References: <1339575975-22078-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1339575975-22078-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: gcc-configure-common: Use build time sysroot for target gcc
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
X-List-Received-Date: Thu, 14 Jun 2012 17:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/13/2012 01:26 AM, Bogdan Marinescu wrote:
> From: Khem Raj<raj.khem@gmail.com>
>
> Otherwise it assumes / as sysroot on build host and starts
> searching for directories in there.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> index 1ee7504..5bca2b7 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> @@ -1,4 +1,6 @@
>   require gcc-configure-common.inc
>
>   EXTRA_OECONF_PATHS = " \
> +    --with-sysroot \

I can't seem to find the reply to this, but RP added a "=" to the
end of this and that seems to have re-introduced the problem we were 
attempting to fix.

Apparently this is a bug in the configure script then also.

Sau!

> +    --with-build-sysroot=${STAGING_DIR_TARGET} \
>       --with-gxx-include-dir=${includedir}/c++/"
> --
> cgit v0.9.0.2-39-g756e
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


