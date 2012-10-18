Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwmF-0005xs-TN
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:33:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Oct 2012 13:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="229398822"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2012 13:19:48 -0700
Message-ID: <50806463.7000905@linux.intel.com>
Date: Thu, 18 Oct 2012 13:19:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1349991029.4470.74.camel@x121e.pbcl.net>
In-Reply-To: <1349991029.4470.74.camel@x121e.pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-doc.bbclass: Run gtkdocize in ${S} not ${B}
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
X-List-Received-Date: Thu, 18 Oct 2012 20:33:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2012 02:30 PM, Phil Blundell wrote:
> Otherwise it will fail if these two directories are not the same.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/classes/gtk-doc.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
> index 59063b0..eaa1385 100644
> --- a/meta/classes/gtk-doc.bbclass
> +++ b/meta/classes/gtk-doc.bbclass
> @@ -15,5 +15,5 @@ EXTRA_OECONF_append = "\
>   "
>
>   do_configure_prepend () {
> -	gtkdocize
> +	( cd ${S} && gtkdocize )
>   }
>
Merged into OE-Core

Thanks
	Sau!



