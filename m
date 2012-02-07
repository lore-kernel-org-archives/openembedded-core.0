Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RupKp-0003zn-8m
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:00:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 09:49:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122070826"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 09:49:55 -0800
Message-ID: <4F316443.9020508@linux.intel.com>
Date: Tue, 07 Feb 2012 09:49:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<d311646dbcb0be12596125a5cf8c97e713741182.1328510189.git.raj.khem@gmail.com>
In-Reply-To: <d311646dbcb0be12596125a5cf8c97e713741182.1328510189.git.raj.khem@gmail.com>
Subject: Re: [PATCH 20/20] mirrors.bbclass: Add yp.org and oe.org to fallback mirrors
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
X-List-Received-Date: Tue, 07 Feb 2012 18:00:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2012 10:40 PM, Khem Raj wrote:
> This should improve the fetching errors users see
> when upstream src_uri is unavailable
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/classes/mirrors.bbclass |   21 ++++++++++++++++++++-
>   1 files changed, 20 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index 2146087..69f44cd 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -52,5 +52,24 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/adm
>   ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
>   ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
>   http://www.apache.org/dist  http://archive.apache.org/dist \n \
> +cvs://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +svn://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +git://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +hg://.*/.*      http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +bzr://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +svk://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +p4://.*/.*      http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +osc://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +https?$://.*/.* http://autobuilder.yoctoproject.org/pub/sources/ \n \
> +ftp://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \

Please use: http://downloads.yoctoproject.org/mirror/sources

That makes it clearer.

Thanks
	Sau!

> +cvs://.*/.*     http://sources.openembedded.org/ \n \
> +svn://.*/.*     http://sources.openembedded.org/ \n \
> +git://.*/.*     http://sources.openembedded.org/ \n \
> +hg://.*/.*      http://sources.openembedded.org/ \n \
> +bzr://.*/.*     http://sources.openembedded.org/ \n \
> +svk://.*/.*     http://sources.openembedded.org/ \n \
> +p4://.*/.*      http://sources.openembedded.org/ \n \
> +osc://.*/.*     http://sources.openembedded.org/ \n \
> +https?$://.*/.* http://sources.openembedded.org/ \n \
> +ftp://.*/.*     http://sources.openembedded.org/ \n \
>   "
> -


