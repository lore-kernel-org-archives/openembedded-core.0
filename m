Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E11BC6F8A0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 08:09:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Apr 2014 01:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,778,1389772800"; d="scan'208";a="513081634"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2014 01:08:03 -0700
Date: Wed, 2 Apr 2014 11:08:02 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Message-ID: <20140402080802.GF29926@lpalcu-linux>
References: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: image.bbclass: USE_DEVFS is now useless
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Apr 2014 08:09:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthieu,

On Wed, Feb 26, 2014 at 11:11:28AM +0000, Matthieu CRAPET wrote:
> Hi,
> 
>  
> 
> Since :
> 
> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/
> image.bbclass?id=a83144bac8d67704ff66f5dc0fc56f5b63979694
> 
>  
> 
> USE_DEVFS is not considered anymore.
> 
>  
> 
> Setting IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES to empty string in an image
> recipe works (makedevs is not called)
> 
>  
> 
> Should be we drop USE_DEVFS variable (meta/classes/image.bbclass) or (re)add
> check in meta/lib/oe/rootfs.py?
> 
> I can propose a patch.
Please do. It looks like I totally missed the USE_DEVFS check...

laurentiu
> 
>  
> 
> Regards,
> 
> Matthieu
> 

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


