Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjIIX-0002Bx-97
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 23:57:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2011 14:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,230,1309762800"; d="scan'208";a="29571257"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 14:53:42 -0700
Message-ID: <4E25FCE5.90507@linux.intel.com>
Date: Tue, 19 Jul 2011 14:53:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Sean_Hudson@Dell.com
References: <4E25AFA8.9060300@linux.intel.com>
	<29DBC3569520F84F926B5007AB6045A9418707D8@AUSX7MCPS303.AMER.DELL.COM>
In-Reply-To: <29DBC3569520F84F926B5007AB6045A9418707D8@AUSX7MCPS303.AMER.DELL.COM>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [RFC] Removing directdisk image creation
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
X-List-Received-Date: Tue, 19 Jul 2011 21:57:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2011 10:38 AM, Sean_Hudson@Dell.com wrote:
> Saul,
>
>    I apologize for my ignorance, but I'm not familiar with the "directdisk" images.
>
>    What are they and what is involved with removing them?
>
Directdisk images are images that can be directly dd'ed to a raw 
harddrive and booted from.  They are different from "live" image which 
can be booted from usbstick.

currently the -directdisk images are broken in that they use a fixed 
partition table in a file and you end up with bad partition sizes.

To remove them, we just delete some recipes and infrastructre for them, 
look for anything ending with -directdisk in the reciple or class name.

Sau!

> Regards,
>       Sean
>
>
>> -----Original Message-----
>> From: poky-bounces@yoctoproject.org [mailto:poky-
>> bounces@yoctoproject.org] On Behalf Of Saul Wold
>> Sent: Tuesday, July 19, 2011 11:24 AM
>> To: 'Patches and discussions about the oe-core layer';
>> poky@yoctoproject.org
>> Subject: [poky] [RFC] Removing directdisk image creation
>>
>>
>> Folks,
>>
>> I am working on converting the live image creation into an IMAGE_FSTYPE
>> and wanted to see if anyone was still using the directdisk images?
>>
>> I propose removing the directdisk images.
>>
>> I am cross-posting to get ensure a larger audience for this.
>>
>> Thanks
>> --
>>       Sau!
>>
>> Saul Wold
>> Yocto Component Wrangler @ Intel
>> Yocto Project / Poky Build System
>>
>> _______________________________________________
>> poky mailing list
>> poky@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/poky
>


