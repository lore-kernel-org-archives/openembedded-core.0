Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2392F60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 06:39:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2013 23:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,767,1367996400"; d="scan'208";a="378136519"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2013 23:39:45 -0700
Message-ID: <51F60E30.5030200@linux.intel.com>
Date: Sun, 28 Jul 2013 23:39:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
References: <51F15115.3040008@linux.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C0F03E@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C0F03E@IRSMSX105.ger.corp.intel.com>
Subject: Re: Thoughts about bluez4 and bluez5
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
X-List-Received-Date: Mon, 29 Jul 2013 06:39:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2013 11:34 PM, Iorga, Cristian wrote:
> Back from the past!!
>
> -----Original Message-----
> From: Iorga, Cristian
> Sent: Friday, July 26, 2013 8:51 AM
> To: 'Saul Wold'; 'Patches and discussions about the oe-core layer'; Burton, Ross
> Subject: RE: Thoughts about bluez4 and bluez5
>
> Hi Saul, Ross,
>
> I think that for the time being libasound-module-bluez should be libasound-module-bluez5.
> We will get back to it after 1.5, when all components will be ready for BlueZ 5.
This can not wait until after 1.5, it's a note and needs to be addressed 
now. Martin has also reported this issue to you as well.

> On the second issue, can you please go into details? I am not following exactly.

It's possible for new version of ofono or connman to want to use bluez5, 
via the PACKAGECONFIG settings, we need to allow that to happen with out 
having to embed bluez4 vs bluez5 in the recipe, this can be done with a 
virtual/bluez style of declartion you can see examples of this for 
virtual/libc and in the meta/conf/distro/include/default-providers.inc file

Sau!

> Regards,
> Cristian
>
> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Thursday, July 25, 2013 7:24 PM
> To: 'Patches and discussions about the oe-core layer'; Iorga, Cristian; Burton, Ross
> Subject: Thoughts about bluez4 and bluez5
>
>
>
> Cristi, Ross:
>
> There is currently a PREFERRED_PROVIDER issue with bluez4 and bluez5 and I am beginning to think we need to distinguish the libasound-module-bluez with libasound-module-bluez5.
>
> I am also seeing some areas where we might need a virtual/bluez to allow recipes to enable features in places like connman and ofono
>
> Thoughts?
>
>
>

