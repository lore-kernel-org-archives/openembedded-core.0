Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAeel-0005Uz-LD
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 10:50:07 +0100
Received: by wera1 with SMTP id a1so1648675wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 02:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GYnE86vScCv0pusmN1uPFS+TRseav9XcDvTI/ruEVqg=;
	b=eVStMgbim0GczRVQO6CY0B+zgsgQMJ2fHPszdAekG8A8fA8gWYwCJBKXIOsOphJlkv
	j4MRXlvEjCZXXGRpa5nv+VnDB2AVC+rPf2OYQzOEA80P3iIEehnlQCS1J8p1M2FL4AiC
	rtzdeSFTGleE+y1P4msJoBslOaOStcSbt4qe9Ar9Oi9ADLWNyHoNIgj/GJiFWULJpP95
	TI/LEjTdkNo1grD9sYd5Dl9VYEMQIntVuU9Nx0KtpPJEdMUrOEqYt7rthV9YayDwWZjf
	EmKWiyisifccTjznMHL4x5G3ZMQTrOOBySP657ps2Wa0xf1YjfI7Hh4IobAyGSD/wMdE
	WwxQ==
MIME-Version: 1.0
Received: by 10.180.80.9 with SMTP id n9mr3539295wix.4.1332409273086; Thu, 22
	Mar 2012 02:41:13 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 02:41:12 -0700 (PDT)
In-Reply-To: <CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
	<CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 10:41:12 +0100
Message-ID: <CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 09:50:07 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/22 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 22 mrt. 2012, om 09:48 heeft Samuel Stirtzel het volgende geschreven:
>
>> 2012/3/21 Koen Kooi <koen@dominion.thruhere.net>:
>>>
>>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>>>
>>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>>>>> * This move will allow the testing of meta-kde for users without meta-openembedded.
>>>>>
>>>> So what other layers are using giflib?
>>>>
>>>> Your suggesting that we need to have it in oe-core so people don't need to add the meta-openembedded layer when using meta-kde?
>>>>
>>>> I am just trying to get more data before making a decision.
>>>
>>> Let's put everything in oe-core!
>>
>> Otherwise it would require to maintain a redundant copy of giflib in meta-kde.
>
> I don't think you get the concept of layers and keeping non-core stuff out of oe-core.

How can it be that libpng is core stuff and libgif is not?

>
>> Alternative suggestions are welcome.
>>
>>
>> A grep shows that not many recipes depend on giflib:
>> -
>> samuel@s-stirtzel-linux:/work/oe-core/setup-scripts/sources$ grep -r 'giflib' *
>> meta-java/recipes-core/openjdk/openjdk-6-common.inc:DEPENDS = "giflib
>> libpng jpeg cups \
>> meta-java/recipes-core/icedtea/icedtea6-native.inc:
>> freetype-native zlib-native giflib-native jpeg-native \
>> meta-kde/recipes-kde-base/kdelibs4_git.bb:DEPENDS = "automoc4-native
>> strigi libdbusmenu-qt soprano shared-desktop-ontologies dbus giflib
>> attica jpeg libpng bzip2 libpcre perl-native"
>> meta-openembedded/meta-efl/recipes-efl/efl/evas.inc:DEPENDS = "librsvg
>> eina eet freetype jpeg libpng virtual/libx11 libxext libxrender
>> fontconfig libfribidi giflib"
>> -
>>
>> Any reason against the move?
>
> The whole layering concept
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Regards
Samuel


