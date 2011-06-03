Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSISx-0008K1-Pc
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:42:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2011 17:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; d="scan'208";a="11167273"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2011 17:39:03 -0700
Message-ID: <4DE82D28.6010505@linux.intel.com>
Date: Thu, 02 Jun 2011 17:39:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307016744.2529.182.camel@phil-desktop>
In-Reply-To: <1307016744.2529.182.camel@phil-desktop>
Subject: Re: [PATCH] libc-package: fix typo causing annoying diagnostic
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
X-List-Received-Date: Fri, 03 Jun 2011 00:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2011 05:12 AM, Phil Blundell wrote:
> We don't package /etc/rpc and do_install() makes some effort to remove
> that file so as to avoid the "installed but not shipped" diagnostic.  But,
> due to a typo in the command line, the file wasn't actually being removed
> and the diagnostic continued to be issued.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/classes/libc-package.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> index 047464e..55e3d48 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -98,7 +98,7 @@ do_install() {
>   		grep -v $i ${WORKDIR}/SUPPORTED>  ${WORKDIR}/SUPPORTED.tmp
>   		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
>   	done
> -	rm -f ${D}{sysconfdir}/rpc
> +	rm -f ${D}${sysconfdir}/rpc
>   	rm -rf ${D}${datadir}/zoneinfo
>   	rm -rf ${D}${libexecdir}/getconf
>   }
Merged into oe-core

Thanks
	Sau!


