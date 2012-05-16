Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUj2w-00033A-9j
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:35:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2012 11:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141380328"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 11:23:58 -0700
Message-ID: <4FB3F0BE.5090108@linux.intel.com>
Date: Wed, 16 May 2012 21:23:58 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336581863-23833-1-git-send-email-philip@balister.org>
In-Reply-To: <1336581863-23833-1-git-send-email-philip@balister.org>
Subject: Re: Add option to oe-buildenv-internal script to change bitbake location.
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
X-List-Received-Date: Wed, 16 May 2012 18:36:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 07:44 PM, Philip Balister wrote:
> Having bitbake inside the oe-core is annoying to some people. This commit
> adds a second option to the oe-init-build-env script.
>
> Run like this:
>
> . ./oe-init-build-env ../build ../bitbake
>
> for example. Without the second option, the old behavior is preserved.
>
> Signed-off-by: Philip Balister<philip@balister.org>
> ---
>   scripts/oe-buildenv-internal |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 9de7b05..05c6cd8 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -54,7 +54,11 @@ else
>   fi
>   unset BDIR
>
> -BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
> +if [ "x$2" = "x" ]; then
> +    BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
> +else
> +    BITBAKEDIR="$2"
> +fi
>
>   BITBAKEDIR=`readlink -f "$BITBAKEDIR"`
>   BUILDDIR=`readlink -f "$BUILDDIR"`

Merged into OE-Core

Thanks
	Sau!


