Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TlCEC-0002Xo-Cg
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 06:30:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 21:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,313,1355126400"; d="scan'208";a="259460229"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.45])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 21:15:16 -0800
Message-ID: <50D14D64.80507@linux.intel.com>
Date: Tue, 18 Dec 2012 21:15:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1355879668-22733-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1355879668-22733-1-git-send-email-sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] lsbinitscripts: Don't compile
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
X-List-Received-Date: Wed, 19 Dec 2012 05:30:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


really 1/1 some randomness happened and 2/2 never made it to the list!

Sau!

On 12/18/2012 05:14 PM, Saul Wold wrote:
> Only functions macros is installed, so no need to configure or compile
>
> [YOCTO #3584]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> index eac4ebb..e32a50c 100644
> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> @@ -19,7 +19,10 @@ ALTERNATIVE_PRIORITY = "100"
>   ALTERNATIVE_${PN} = "functions"
>   ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>
> +# Since we are only taking the patched version of functions, no need to
> +# configure or compile anything so do not execute these
>   do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
>
>   do_install(){
>   	install -d ${D}${sysconfdir}/init.d/
>


