Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U5ujD-0006p2-1y
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 10:03:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Feb 2013 00:47:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,662,1355126400"; d="scan'208";a="256835631"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 14 Feb 2013 00:47:34 -0800
Message-ID: <511CA4B2.1090307@intel.com>
Date: Thu, 14 Feb 2013 10:47:46 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <511BB265.8030505@windriver.com>
In-Reply-To: <511BB265.8030505@windriver.com>
Subject: Re: systemd services in the rootfs
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
X-List-Received-Date: Thu, 14 Feb 2013 09:03:40 -0000
X-List-Received-Date: Thu, 14 Feb 2013 09:03:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 02/13/2013 05:33 PM, Florin Sarbu wrote:
> Hi all,
> following the transition of the systemd.bbclass from meta-openembedded 
> to oe-core, I stumbled upon on what seems to me a missing feature that 
> has not been brought along in the new systemd.bbclass in oe-core. 
> Seems that if one does not explicitly specify the inclusion of the 
> packages containing the systemd services in a packagegroup or image 
> recipe or use some other mechanism that will determine the addition of 
> these packages in the final rootfs, then the root filesystem will not 
> contain the systemd services. Even though 
> DISTRO_FEATURES_INITMAN="systemd" is set. The meta-openembedded 
> systemd.bbclass, needed no additional adding of the systemd related 
> packages, just RRECOMMENDED and things worked as expected. Shouldn't 
> the DISTRO_FEATURES_INITMAN do just that? Is it something that still 
> needs to be done on the systemd.bbclass or would you suggest that from 
> now on we will have to manually add the systemd packages in 
> packagegroups, image recipes etc?
>

Each recipe should install it's service files in the appropriate 
location, like ${D}${systemd-unitdir}/system (check out searchpaths in 
systemd.bbclass)

For reference you can check on my branch enabling patches
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd-ross&id=38dfb4ec00aa87ab20065de7b391572f19679ca8

Radu


