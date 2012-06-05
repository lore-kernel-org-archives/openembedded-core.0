Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SbiXM-0008En-Ok
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 03:26:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2012 18:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174805781"
Received: from unknown (HELO [10.255.12.127]) ([10.255.12.127])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2012 18:15:53 -0700
Message-ID: <4FCD5DC9.5020809@linux.intel.com>
Date: Mon, 04 Jun 2012 18:15:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FCD1B48.8040708@palm.com>
In-Reply-To: <4FCD1B48.8040708@palm.com>
Subject: Re: Minor documentation.conf patch...
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
X-List-Received-Date: Tue, 05 Jun 2012 01:26:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I know this is a minor patch, but we like to have Signed-off-by on all 
patches, also the subject should be something like

documentation.conf: fix definition of P

Thanks
	Sau!


On 06/04/2012 01:32 PM, Rich Pixley wrote:
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 004a16c..1d57044 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -64,7 +64,7 @@ PV[doc] = "PV holds the version of the package
> (Package Version). The default va
> retrieved from the bitbake-file filename but can be changed."
> PR[doc] = "PR is the revision of the package (Package Revision). By
> default it is set to r0."
> PF[doc] = "Package name - Package version - Package revision (PN-PV-PR)"
> -P[doc] = "Package name - Package version (PN-PF)"
> +P[doc] = "Package name - Package version (PN-PV)"
> S[doc] = "Directory that holds the sources to build, WORKDIR/PN-PV by
> default. The 'make' or equivalent command is run from this directory."
> SECTION[doc] = "Section of the packages e.g. console/networking"
> PRIORITY[doc] = "Importance of package, default values are 'optional' or
> 'needed'."
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


