Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4842F6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:24:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 24 Feb 2016 08:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="53937127"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2016 06:07:58 -0800
Date: Wed, 24 Feb 2016 16:11:43 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: winiston@futuraautomation.com
Message-ID: <20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
MIME-Version: 1.0
In-Reply-To: <AB28D54196164B23BA942EBCF3204741@RD3>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: How to integrate third party application software to yocto image
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
X-List-Received-Date: Wed, 24 Feb 2016 16:24:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Winiston,

On Wed, Feb 24, 2016 at 06:20:14PM +0530, winiston@futuraautomation.com wrote:

> -- 
>Hi,
> 
> I can build yocto image for arm based product like AM437x-evm using yocto project. I want to add third party software(Navit) to my image.
>  
> How can I add the third party software to my image ?. Can you provide me the steps to integrate third party software with yocto image ?

Please read this documentation:
http://www.yoctoproject.org/docs/1.4.2/dev-manual/dev-manual.html#usingpoky-extend-addpkg

>   Note: Navit is a navigation software and it supports arm based product like AM437x. 
>    

In the case of Navit, recipe is already available in meta-oe layer:
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-navigation/navit/navit_svn.bb?h=master

>    Host system: Ubuntu 14.04
>    Target system : AM437x-evm
>     
>      
>      Regards,
>      Winiston.P
>      Futura Automation Pvt Ltd.

Best Regards,
Maxin

