Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjEtk-0007Qq-9O
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:20:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2011 11:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="32169635"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2011 11:15:53 -0700
Message-ID: <4E25C9D9.7040103@linux.intel.com>
Date: Tue, 19 Jul 2011 11:15:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310575274.2378.32.camel@phil-desktop>
In-Reply-To: <1310575274.2378.32.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] gcc-4.6: update to 4.6.1 release
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
X-List-Received-Date: Tue, 19 Jul 2011 18:20:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2011 09:41 AM, Phil Blundell wrote:
> Set SRCREV to match the point at which 4.6.1 was released, update PV appropriately.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-devtools/gcc/gcc-4.6.inc |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index 56064b5..8af5369 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r8"
> +PR = "r0"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -8,7 +8,7 @@ PR = "r8"
>   # on branch then PV should be incremented to 4.6.1+svnr${SRCPV}
>   # to reflect that change
>
> -PV = "4.6.0+svnr${SRCPV}"
> +PV = "4.6.1+svnr${SRCPV}"
>
>   # BINV should be incremented after updating to a revision
>   # after a minor gcc release (e.g. 4.6.1 or 4.6.2) has been made
> @@ -18,7 +18,7 @@ PV = "4.6.0+svnr${SRCPV}"
>
>   BINV = "4.6.1"
>
> -SRCREV = 175150
> +SRCREV = 175454
>   BRANCH = "gcc-4_6-branch"
>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
>
Merged into oe-core

Thanks
	Sau!


