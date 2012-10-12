Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TMjqn-0001HJ-P2
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 20:20:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Oct 2012 11:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,577,1344236400"; d="scan'208";a="203829416"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by azsmga001.ch.intel.com with ESMTP; 12 Oct 2012 11:07:32 -0700
Message-ID: <50785C63.5060303@linux.intel.com>
Date: Fri, 12 Oct 2012 11:07:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1349962030-9309-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1349962030-9309-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] local.conf.sample: add PATH to SSTATE_MIRRORS comments
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
X-List-Received-Date: Fri, 12 Oct 2012 18:20:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2012 06:27 AM, Paul Eggleton wrote:
> The shared state cache as pointed to by SSTATE_DIR by default now has
> two-character subdirectories to prevent there being an issue with too
> many files in the same directory; also, native sstate packages will go
> into a subdirectory named using the distro ID string. If you copy the
> newly structured sstate cache to a mirror location (either local or
> remote) and then point to it in SSTATE_MIRRORS, you need to append
> "PATH" to the end of the mirror URL so that the path used by bitbake
> before the mirror substitution is appended to the path used to access
> the mirror.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/conf/local.conf.sample |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 04d947f..d181e75 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -194,9 +194,12 @@ PATCHRESOLVE = "noop"
>   # would contain the sstate-cache results from previous builds (possibly from other
>   # machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
>   # cache locations to check for the shared objects.
> +# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
> +# at the end as shown in the examples below. This will be substituted with the
> +# correct path within the directory structure.
>   #SSTATE_MIRRORS ?= "\
> -#file://.* http://someserver.tld/share/sstate/ \n \
> -#file://.* file:///some/local/dir/sstate/"
> +#file://.* http://someserver.tld/share/sstate/PATH \n \
> +#file://.* file:///some/local/dir/sstate/PATH"
>
>   # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
>   # track the version of this file when it was generated. This can safely be ignored if
>

I think this is really a Poky File, so should go to the 
poky@yoctoproject.org!

Sau!



