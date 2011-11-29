Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVJxa-0003tn-UG
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 10:26:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 01:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81037094"
Received: from unknown (HELO envy.home) ([10.255.12.98])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 01:19:55 -0800
Message-ID: <4ED4A3BF.1040003@linux.intel.com>
Date: Tue, 29 Nov 2011 01:19:59 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
	<4ED01D59.8020301@linux.intel.com>
	<4ED491CF.4020807@linux.intel.com>
	<29FCBED2-0BFC-420A-988F-B11490D51CC1@dominion.thruhere.net>
	<4ED49EAA.7040707@linux.intel.com>
	<40550206-9942-4151-9DF5-D1A01F125AF0@dominion.thruhere.net>
In-Reply-To: <40550206-9942-4151-9DF5-D1A01F125AF0@dominion.thruhere.net>
X-Enigmail-Version: 1.3.3
Cc: Josef Ahmad <josef.ahmad@intel.com>, Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/5] grub-efi-native: New recipe to build GRUB EFI images
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
X-List-Received-Date: Tue, 29 Nov 2011 09:26:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 11/29/2011 01:16 AM, Koen Kooi wrote:
> 
> Op 29 nov. 2011, om 09:58 heeft Darren Hart het volgende
> geschreven:
> 
>> 
>> 
>> On 11/29/2011 12:22 AM, Koen Kooi wrote:
>>> 
>>> Op 29 nov. 2011, om 09:03 heeft Darren Hart het volgende
>>> geschreven:
>>> 
>>>> On 11/25/2011 02:57 PM, Darren Hart wrote:
>>>>> 
>>>>> 
>>>>> On 11/24/2011 12:05 AM, Darren Hart wrote:
>>>>>> Add a recipe to build the GRUB efi images. This recipe is
>>>>>> written as a native recipe as the resulting GRUB utils
>>>>>> are required to assemble the final image. Rather than
>>>>>> build a native and a target recipe (and increase build
>>>>>> times), this recipe builds the utils for the host and 
>>>>>> passes an appropriate --target argument to the GRUB
>>>>>> configure script to build the modules for the target
>>>>>> arch. The only output of this recipe is an EFI image in
>>>>>> the deploy directory.
>>>>> 
>>>>> The grub-help list came through with an alternative
>>>>> approach:
>>>>> 
>>>>> "./configure CC=powerpc-linux-gcc  --host=ppc-linux-gnu
>>>>> --target=i386 --with-platform=pc TARGET_CC=i386-linux-gcc"
>>>>> 
>>>>> This would allow for building on a host of arch ppc for a
>>>>> target of arch i386.
>>>>> 
>>>>> Would it be preferable then to build this as a target
>>>>> package and manipuate the configure flags to use the
>>>>> BUILD_CC ? I presume a similar PN rename would be desirable
>>>>> to account for the HOST component of the build as I used
>>>>> here for the TARGET on the -native version?
>>>> 
>>>> I have been working on trying to get this working as a target
>>>> recipe. I've resolved a number of issues, but something is
>>>> still biting me and I haven't been able to sort out what. I
>>>> would really appreciate a few more sets of eyes on this.
>>>> 
>>>> I have pushed my dvhart/efi/dev branch to poky-contrib for
>>>> reference:
>>>> 
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=dvhart/efi/dev
>>>>
>>>>
>>>> 
When building this recipe
>>> 
>>> This is against poky, so I can't build it. If it was against 
>>> OE-core, like one would expect on the OE-core mailing list, I
>>> could build it.
>> 
>> OK, fair enough.
>> 
>> git://git.infradead.org/srv/git/users/dvhart/oe-core.git
>> dvhart/efi/dev
> 
> I get:
> 
> $ git fetch
> git://git.infradead.org/srv/git/users/dvhart/oe-core.git fatal: The
> remote end hung up unexpectedly
> 

Grmble... too late... too rushed... too many copy buffers. Sorry about
that:

git://git.infradead.org/users/dvhart/oe-core.git dvhart/efi/dev

- -- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO1KO/AAoJEKbMaAwKp364F3QH/iwqj6yfAuMfX1XNWFmvC+Pr
yreEjQMz6n7LjN47svDZb0vTjiUTufdE6peIez1j2WZV5riXA4qePwXHa562zN1e
bsBYH3pjJ87CYZ9Hyg2jdGX7VSeJGpX+dkKggucg0VwzU5MJOM1E0cwKIhfyG3Ja
ytqDhQQXlTQfwHqFkKI1yp7usXDjLZc/OS/nOgNan5x2RVBnfXug33E02Y7yhldW
yRIa0aoCk8LdKGj+PdOVAiHMjXA67KxO16P0Moqk4K3lSV34GBZmSNYT9Mmpk9AV
nFoaxIKYZdaBqLg7i6wyM/g8U0qVajdE3koAj2Hy/KPHXaU/nhiUx9vYg09yyw8=
=e2h9
-----END PGP SIGNATURE-----


