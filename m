Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UBVio-00013z-44
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 20:34:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2013 11:16:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="269721324"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2013 11:17:57 -0800
Message-ID: <5130FEE4.7050207@linux.intel.com>
Date: Fri, 01 Mar 2013 11:17:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
References: <1362157892-22060-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <1362157892-22060-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] btrfs-tools: added PV to git package recipe
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
X-List-Received-Date: Fri, 01 Mar 2013 19:34:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2013 09:11 AM, Emilia Ciobanu wrote:
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>   .../btrfs-tools/btrfs-tools_git.bb                 |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> index e963a74..df216b1 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> @@ -17,6 +17,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;p
>
>   S = "${WORKDIR}/git"
>
> +PV = "0.19+git${SRCPV}"
> +
See my previous email, since we are currently beyond the 0.20-rc1 we 
should indicated that in the version info as 0.20~rc1.

Sau!

>   PR = "r6"
>
>   SRC_URI += " file://fix_use_of_gcc.patch \
>


