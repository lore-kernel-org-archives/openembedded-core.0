Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSwT0-0004sO-O0
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 20:57:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2011 11:50:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="78935918"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2011 11:50:46 -0800
Message-ID: <4ECBFD16.3020406@linux.intel.com>
Date: Tue, 22 Nov 2011 11:50:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321568900-19406-1-git-send-email-msm@freescale.com>
In-Reply-To: <1321568900-19406-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 22 Nov 2011 19:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2011 02:28 PM, Matthew McClintock wrote:
> Without this simply changing the number of threads via
> PARALLEL_MAKE can invalidate sstate-cache
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta/recipes-core/eglibc/eglibc.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index fe9f8ba..272fcb6 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -40,6 +40,7 @@ ARM_INSTRUCTION_SET = "arm"
>   # eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
>   # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
>   EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
> +EXTRA_OEMAKE[vardepsexclude] += "EGLIBCPARALLELISM"
>   EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
>   PARALLEL_MAKE = ""
>

When possible, please include the recipe or file you are changing as 
part of the patch subject.

For example this would be:

eglibc.inc: Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE

Thanks
	Sau!


