Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U3aRN-0002hj-TX
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:00:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Feb 2013 14:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,625,1355126400"; d="scan'208";a="199882391"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2013 14:43:43 -0800
Message-ID: <51142E1F.1020404@linux.intel.com>
Date: Thu, 07 Feb 2013 14:43:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1360247634-10957-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1360247634-10957-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpfm4: exclude from world
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
X-List-Received-Date: Thu, 07 Feb 2013 23:00:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2013 06:33 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
> index 460029f..438dbc3 100644
> --- a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
> +++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
> @@ -24,3 +24,6 @@ S = "${WORKDIR}/libpfm-${PV}"
>   do_install () {
>   	oe_runmake install
>   }
> +
> +# oprofile depends on it only for ppc* and it fails to build on arm
> +EXCLUDE_FROM_WORLD = "1"
>

Should it be EXCLUDE_FROM_WORLD or

COMPATIBLE_MACHINE= "(*ppc*|mpc*)"

Since for a ppc world build it would be valid.

Sau!



