Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Tm1-0008WT-6S
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:08:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 13:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135534245"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 13:56:04 -0700
Message-ID: <502EAFE4.4040209@linux.intel.com>
Date: Fri, 17 Aug 2012 13:56:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Fri, 17 Aug 2012 21:08:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 07:27 AM, Constantin Musca wrote:
> The set contains package upgrades compiled successfully on all architectures
> and tested using the xorg-server.
>
> Constantin Musca (3):
>    pixman: upgrade to 0.27.2
>    glproto: upgrade to 1.4.16
>    dri2proto: upgrade to 2.8
>
>   .../{pixman_0.26.2.bb => pixman_0.27.2.bb}         |    4 ++--
>   .../{dri2proto_2.6.bb => dri2proto_2.8.bb}         |    4 ++--
>   .../{glproto_1.4.15.bb => glproto_1.4.16.bb}       |    4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
>   rename meta/recipes-graphics/xorg-lib/{pixman_0.26.2.bb => pixman_0.27.2.bb} (86%)
>   rename meta/recipes-graphics/xorg-proto/{dri2proto_2.6.bb => dri2proto_2.8.bb} (76%)
>   rename meta/recipes-graphics/xorg-proto/{glproto_1.4.15.bb => glproto_1.4.16.bb} (77%)
>
Merged these into OE-Core

In the future when making multiple updates if you can use the 
create-pull-request script and use a branch in poky-contrib that would 
be very useful to me as then I can pull all your changes in on branch.

Thanks
	Sau!



