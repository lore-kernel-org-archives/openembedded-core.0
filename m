Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SArY4-0001uU-C0
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 00:36:04 +0100
Received: by pbcum15 with SMTP id um15so1816540pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 16:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yNB4qNlKaC/EJgHt//illFY5OSSt3Z/yfLmIBDt38Cs=;
	b=g2topYAlhN4Z8P48RzrObG3QCTwRVgmgRQbIbOYbzZKAoJCyLchP0mmMpmAD/Kr+PA
	ru6qP/BoUK1DAQAkWVJd70MssHTjUkzI/F4NhToFb9ogaAHVO5T0X/MSnCHAfY1W47E9
	9GDvS0T/Xu4hY28z5mBmU25pxp3w4UgGkcEya5jM/PWmLhjxV5Zupf2oYTlTl2CyymIG
	oK/yXpakHDfakT+bObCXwVujO15snWOcSvLqr5LBCpc/o6+mbqdWf9mV+Xph888cQ6Ge
	YbSl9ewZu34duOS9wYF3JiN/9Z7BaK1JLHfN5ZPPMVYTgNjmCJE+l9WTQx6m5369aPCL
	takg==
MIME-Version: 1.0
Received: by 10.68.217.201 with SMTP id pa9mr4723208pbc.73.1332458827782; Thu,
	22 Mar 2012 16:27:07 -0700 (PDT)
Received: by 10.143.165.10 with HTTP; Thu, 22 Mar 2012 16:27:07 -0700 (PDT)
In-Reply-To: <4F6B4C0B.3030504@linux.intel.com>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
	<CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
	<CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
	<4F6B4C0B.3030504@linux.intel.com>
Date: Fri, 23 Mar 2012 00:27:07 +0100
Message-ID: <CAAQYJAtjfhhckJOTo1dxit4S72wFQ5Jt+r4MMfN6-Qu-Bw=DOg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 23:36:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 4:58 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 03/22/2012 02:41 AM, Samuel Stirtzel wrote:
>>
>> 2012/3/22 Koen Kooi<koen@dominion.thruhere.net>:
>>>
>>>
>>> Op 22 mrt. 2012, om 09:48 heeft Samuel Stirtzel het volgende geschreven=
:
>>>
>>>> 2012/3/21 Koen Kooi<koen@dominion.thruhere.net>:
>>>>>
>>>>>
>>>>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>>>>>
>>>>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>>>>>>>
>>>>>>> * This move will allow the testing of meta-kde for users without
>>>>>>> meta-openembedded.
>>>>>>>
>>>>>> So what other layers are using giflib?
>>>>>>
>>>>>> Your suggesting that we need to have it in oe-core so people don't
>>>>>> need to add the meta-openembedded layer when using meta-kde?
>>>>>>
>>>>>> I am just trying to get more data before making a decision.
>>>>>
>>>>>
>>>>> Let's put everything in oe-core!
>>>>
>>>>
>>>> Otherwise it would require to maintain a redundant copy of giflib in
>>>> meta-kde.
>>>
>>>
>>> I don't think you get the concept of layers and keeping non-core stuff
>>> out of oe-core.
>>
>>
>> How can it be that libpng is core stuff and libgif is not?
>>
> libpng is in oe-core because it is used by other parts of oe-core (Sato,
> GTK+, Gthumb, Cups, ...). =A0PNG is also more common that GIF because GIF=
 had
> licensing issues in the past.

All this seems to me unsatisfactory being that the above mentioned
'parts of OE' should not even be in oe-core.
About the specific .gif, .png , etc. libs, those should be in a
meta-graphics layer or whatever you want to call it.

Finally, nobody should feel guilty if not including meta-oe.
Developing a BSP is much easier with oe-core only (and no, the BSP
layers should not depend on meta-oe).

Just my 2 cents

Andrea

>
> Finally, as stated in other emails meta-kde has other dependencies on
> meta-oe, it's just the base bits that need giflib.
>
> So, no we will not move libgif into oe-core, please use the Layers as the=
y
> are intended.
>
> Thanks
> =A0 =A0 =A0 =A0Sau!
>
>
>>>
>>>> Alternative suggestions are welcome.
>>>>
>>>>
>>>> A grep shows that not many recipes depend on giflib:
>>>> -
>>>> samuel@s-stirtzel-linux:/work/oe-core/setup-scripts/sources$ grep -r
>>>> 'giflib' *
>>>> meta-java/recipes-core/openjdk/openjdk-6-common.inc:DEPENDS =3D "gifli=
b
>>>> libpng jpeg cups \
>>>> meta-java/recipes-core/icedtea/icedtea6-native.inc:
>>>> freetype-native zlib-native giflib-native jpeg-native \
>>>> meta-kde/recipes-kde-base/kdelibs4_git.bb:DEPENDS =3D "automoc4-native
>>>> strigi libdbusmenu-qt soprano shared-desktop-ontologies dbus giflib
>>>> attica jpeg libpng bzip2 libpcre perl-native"
>>>> meta-openembedded/meta-efl/recipes-efl/efl/evas.inc:DEPENDS =3D "librs=
vg
>>>> eina eet freetype jpeg libpng virtual/libx11 libxext libxrender
>>>> fontconfig libfribidi giflib"
>>>> -
>>>>
>>>> Any reason against the move?
>>>
>>>
>>> The whole layering concept
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


