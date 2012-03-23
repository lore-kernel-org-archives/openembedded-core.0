Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAzYP-0002ar-1J
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 09:08:57 +0100
Received: by wera1 with SMTP id a1so2460687wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 01:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=iGiOqnWoZwcBk9dOn0VZrNozj53L9MUJThmWXjFGB/A=;
	b=oIXfe+xQxAOHrdJvuplYf7HR6sY9bqtJHow5rbq1Ayi3rgjugsOhWrRgY2v5Zc3sR2
	9G25Ehapr21b35muPO886RuB3Cg+ulihdRvJ2mLwBEGvuU+Ryw/WJezRdvG6ufpqZNKa
	ZHjWzNJhp4F5Ro6AtOQ25ALY5DOBwU0IDRFpue3T6gkoCr28WDTRwyShe2vvDUD5Ys6U
	jG1/1S0xzg/UHC52zmej2d+tkavdueXp2QOxeY9jzFHrgrjz80SOXCP89SLtRRYAjpus
	Vp+/DB819GgtWyKwlQ60olxjA1FHoVKqXMZvWllNfxgbGnkVRuSSdF6CDGqbg7XLAsGq
	ZnRw==
MIME-Version: 1.0
Received: by 10.216.135.26 with SMTP id t26mr6427032wei.83.1332489601071; Fri,
	23 Mar 2012 01:00:01 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Fri, 23 Mar 2012 01:00:00 -0700 (PDT)
In-Reply-To: <CAAQYJAtjfhhckJOTo1dxit4S72wFQ5Jt+r4MMfN6-Qu-Bw=DOg@mail.gmail.com>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
	<CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
	<CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
	<4F6B4C0B.3030504@linux.intel.com>
	<CAAQYJAtjfhhckJOTo1dxit4S72wFQ5Jt+r4MMfN6-Qu-Bw=DOg@mail.gmail.com>
Date: Fri, 23 Mar 2012 09:00:00 +0100
Message-ID: <CAGiJk9evph+E_CzqN9iOAqAD9ypkcDvV9xj2LrkD1O05Dv=CbA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Mar 2012 08:08:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/23 Andrea Adami <andrea.adami@gmail.com>:
> On Thu, Mar 22, 2012 at 4:58 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 03/22/2012 02:41 AM, Samuel Stirtzel wrote:
>>>
>>> 2012/3/22 Koen Kooi<koen@dominion.thruhere.net>:
>>>>
>>>>
>>>> Op 22 mrt. 2012, om 09:48 heeft Samuel Stirtzel het volgende geschreve=
n:
>>>>
>>>>> 2012/3/21 Koen Kooi<koen@dominion.thruhere.net>:
>>>>>>
>>>>>>
>>>>>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>>>>>>
>>>>>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>>>>>>>>
>>>>>>>> * This move will allow the testing of meta-kde for users without
>>>>>>>> meta-openembedded.
>>>>>>>>
>>>>>>> So what other layers are using giflib?
>>>>>>>
>>>>>>> Your suggesting that we need to have it in oe-core so people don't
>>>>>>> need to add the meta-openembedded layer when using meta-kde?
>>>>>>>
>>>>>>> I am just trying to get more data before making a decision.
>>>>>>
>>>>>>
>>>>>> Let's put everything in oe-core!
>>>>>
>>>>>
>>>>> Otherwise it would require to maintain a redundant copy of giflib in
>>>>> meta-kde.
>>>>
>>>>
>>>> I don't think you get the concept of layers and keeping non-core stuff
>>>> out of oe-core.
>>>
>>>
>>> How can it be that libpng is core stuff and libgif is not?
>>>
>> libpng is in oe-core because it is used by other parts of oe-core (Sato,
>> GTK+, Gthumb, Cups, ...). =C2=A0PNG is also more common that GIF because=
 GIF had
>> licensing issues in the past.
>
> All this seems to me unsatisfactory being that the above mentioned
> 'parts of OE' should not even be in oe-core.
> About the specific .gif, .png , etc. libs, those should be in a
> meta-graphics layer or whatever you want to call it.

There is a layer called meta-multimedia, would giflib, libpng and the
others fit into it?

>
> Finally, nobody should feel guilty if not including meta-oe.
> Developing a BSP is much easier with oe-core only (and no, the BSP
> layers should not depend on meta-oe).
>
> Just my 2 cents
>
> Andrea
>
>>
>> Finally, as stated in other emails meta-kde has other dependencies on
>> meta-oe, it's just the base bits that need giflib.
>>
>> So, no we will not move libgif into oe-core, please use the Layers as th=
ey
>> are intended.
>>
>> Thanks
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>>
>>
>>>>
>>>>> Alternative suggestions are welcome.
>>>>>
>>>>>
>>>>> A grep shows that not many recipes depend on giflib:
>>>>> -
>>>>> samuel@s-stirtzel-linux:/work/oe-core/setup-scripts/sources$ grep -r
>>>>> 'giflib' *
>>>>> meta-java/recipes-core/openjdk/openjdk-6-common.inc:DEPENDS =3D "gifl=
ib
>>>>> libpng jpeg cups \
>>>>> meta-java/recipes-core/icedtea/icedtea6-native.inc:
>>>>> freetype-native zlib-native giflib-native jpeg-native \
>>>>> meta-kde/recipes-kde-base/kdelibs4_git.bb:DEPENDS =3D "automoc4-nativ=
e
>>>>> strigi libdbusmenu-qt soprano shared-desktop-ontologies dbus giflib
>>>>> attica jpeg libpng bzip2 libpcre perl-native"
>>>>> meta-openembedded/meta-efl/recipes-efl/efl/evas.inc:DEPENDS =3D "libr=
svg
>>>>> eina eet freetype jpeg libpng virtual/libx11 libxext libxrender
>>>>> fontconfig libfribidi giflib"
>>>>> -
>>>>>
>>>>> Any reason against the move?
>>>>
>>>>
>>>> The whole layering concept
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Regards
Samuel


