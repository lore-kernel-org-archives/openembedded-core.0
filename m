Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAkXU-0006z3-7N
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:07:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2012 08:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="123913023"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2012 08:58:04 -0700
Message-ID: <4F6B4C0B.3030504@linux.intel.com>
Date: Thu, 22 Mar 2012 08:58:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
	<CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
	<CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
In-Reply-To: <CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 16:07:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/22/2012 02:41 AM, Samuel Stirtzel wrote:
> 2012/3/22 Koen Kooi<koen@dominion.thruhere.net>:
>>
>> Op 22 mrt. 2012, om 09:48 heeft Samuel Stirtzel het volgende geschreven:
>>
>>> 2012/3/21 Koen Kooi<koen@dominion.thruhere.net>:
>>>>
>>>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>>>>
>>>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>>>>>> * This move will allow the testing of meta-kde for users without meta-openembedded.
>>>>>>
>>>>> So what other layers are using giflib?
>>>>>
>>>>> Your suggesting that we need to have it in oe-core so people don't need to add the meta-openembedded layer when using meta-kde?
>>>>>
>>>>> I am just trying to get more data before making a decision.
>>>>
>>>> Let's put everything in oe-core!
>>>
>>> Otherwise it would require to maintain a redundant copy of giflib in meta-kde.
>>
>> I don't think you get the concept of layers and keeping non-core stuff out of oe-core.
>
> How can it be that libpng is core stuff and libgif is not?
>
libpng is in oe-core because it is used by other parts of oe-core (Sato, 
GTK+, Gthumb, Cups, ...).  PNG is also more common that GIF because GIF 
had licensing issues in the past.

Finally, as stated in other emails meta-kde has other dependencies on 
meta-oe, it's just the base bits that need giflib.

So, no we will not move libgif into oe-core, please use the Layers as 
they are intended.

Thanks
	Sau!

>>
>>> Alternative suggestions are welcome.
>>>
>>>
>>> A grep shows that not many recipes depend on giflib:
>>> -
>>> samuel@s-stirtzel-linux:/work/oe-core/setup-scripts/sources$ grep -r 'giflib' *
>>> meta-java/recipes-core/openjdk/openjdk-6-common.inc:DEPENDS = "giflib
>>> libpng jpeg cups \
>>> meta-java/recipes-core/icedtea/icedtea6-native.inc:
>>> freetype-native zlib-native giflib-native jpeg-native \
>>> meta-kde/recipes-kde-base/kdelibs4_git.bb:DEPENDS = "automoc4-native
>>> strigi libdbusmenu-qt soprano shared-desktop-ontologies dbus giflib
>>> attica jpeg libpng bzip2 libpcre perl-native"
>>> meta-openembedded/meta-efl/recipes-efl/efl/evas.inc:DEPENDS = "librsvg
>>> eina eet freetype jpeg libpng virtual/libx11 libxext libxrender
>>> fontconfig libfribidi giflib"
>>> -
>>>
>>> Any reason against the move?
>>
>> The whole layering concept
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>


