Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U1FDx-0004gP-4e
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 12:56:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2013 03:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="251371682"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2013 03:40:19 -0800
Message-ID: <510BA9A2.3070907@intel.com>
Date: Fri, 01 Feb 2013 13:40:18 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LZ3tvB6t13utWrzXhqE7mx58ypkFosUdtwj=XuMbPXRNw@mail.gmail.com>
	<510B9749.6040801@intel.com>
	<CAJTo0LZCJuRomHysD9b6CfYfsHJpQBBXsZNWVUEo5_en_ju2KA@mail.gmail.com>
In-Reply-To: <CAJTo0LZCJuRomHysD9b6CfYfsHJpQBBXsZNWVUEo5_en_ju2KA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 11:56:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 02/01/2013 12:27 PM, Burton, Ross wrote:
> On 1 February 2013 10:22, Radu Moisan <radu.moisan@intel.com> wrote:
>> I did change that manually because I assumed it was a typo. However it make
>> sense to add consolekit as a runtime dependency, but the documentation
>> specifically says PACKAGECONFIG will add to DEPENDS. How is it different in
>> this patch? The PACKAGECONFIG[systemd] is clearly specifying a build time
>> dependency, why the PACKAGECONFIG[consolekit] is specifying a runtime
>> dependency? How can I discriminate in this context?
> I spoke to Radu online already, but I'll repeat again here in case
> anyone else is confused by PACKAGECONFIG.
>
> The latest documentation is here:
> http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-P
>
> The key point is that the 3rd argument is DEPENDS, and the fourth is
> RDEPENDS.  Many instances of PACKAGECONFIG will leave out the fourth,
> but in this case the third is empty (note the extra commas) so
> consolekit is added as a runtime dependency.
>
> Ross

Thanks guys for the clarification. Very useful info, I didn't notice the 
extra comma.

Radu


