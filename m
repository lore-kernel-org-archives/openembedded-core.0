Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrBcT-0003gB-Ha
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:31:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2012 10:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169467717"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 17 Jul 2012 10:20:12 -0700
Message-ID: <50059ECC.1060700@linux.intel.com>
Date: Tue, 17 Jul 2012 10:20:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342177287-4348-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1342177287-4348-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] base.bbclass: add GNUmakefile to the list of possible makefile names
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
X-List-Received-Date: Tue, 17 Jul 2012 17:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2012 04:01 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/base.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 08065c6..f691799 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -280,7 +280,7 @@ base_do_configure() {
>   addtask compile after do_configure
>   do_compile[dirs] = "${S} ${B}"
>   base_do_compile() {
> -	if [ -e Makefile -o -e makefile ]; then
> +	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
>   		oe_runmake || die "make failed"
>   	else
>   		bbnote "nothing to compile"
>

Merged into OE-Core

Thanks
	Sau!


