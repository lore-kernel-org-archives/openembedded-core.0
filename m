Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Smq2R-0003OB-UY
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:40:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jul 2012 10:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188834890"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2012 10:29:16 -0700
Message-ID: <4FF5CEEB.1050901@linux.intel.com>
Date: Thu, 05 Jul 2012 10:29:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207031620150.30734@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207031620150.30734@oneiric>
Subject: Re: prexport.bbclass: Fix typo in warning: "AUROPR" -> "AUTOPR".
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
X-List-Received-Date: Thu, 05 Jul 2012 17:40:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 01:21 PM, Robert P. J. Day wrote:
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>    i'm *assuming* this is the correct fix.
>
> diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
> index 2b16a66..b990c2b 100644
> --- a/meta/classes/prexport.bbclass
> +++ b/meta/classes/prexport.bbclass
> @@ -21,7 +21,7 @@ python prexport_handler () {
>               bb.fatal("prexport_handler: export failed!")
>           (metainfo, datainfo) = retval
>           if not datainfo:
> -            bb.warn("prexport_handler: No AUROPR values found for %s" % ver)
> +            bb.warn("prexport_handler: No AUTOPR values found for %s" % ver)
>               return
>           oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
>       elif isinstance(e, bb.event.ParseStarted):
>

Merged into OE-Core

Thanks
	Sau!


