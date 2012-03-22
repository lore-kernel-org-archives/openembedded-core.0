Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAdpJ-0005kV-Bq
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 09:56:57 +0100
Received: by wibhm17 with SMTP id hm17so378395wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 01:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=EfgH10draUpugOyEQzmgFVTlke07L6KkMVRxRT8ZPeY=;
	b=XYZ6eDMLitLd+pP4X9PGxSahXMeB6ympsWp6/JM8+K0/BseA6ZtwJXmQUrtU+mBRZQ
	lna+K1XWvcFzFCiYdvr5OEEWt+g6CNVBDN2YBnx27uVEv4pHUhZGf+MwnKhdM1ZBmhqw
	+KOU2k9ZhApseE8NfePQrnzulKNocq8Sir9sn6eLnCXH0zQcsTxYjaqqvh6wUB1+94pW
	R9SX/wI6BlTEPNR7D6CMzac7lLu3v5QX1/bKjfii3lcJjylor8BS54pUjmGEioLRYOgP
	/DAu0sSA2Y2HpINnWciihqUZYwQHpJT8XVxhkmm9RaHxgLXJ2Z/qTFbepzmIRocYr3rG
	/i5A==
MIME-Version: 1.0
Received: by 10.216.132.140 with SMTP id o12mr4016291wei.67.1332406082776;
	Thu, 22 Mar 2012 01:48:02 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 01:48:02 -0700 (PDT)
In-Reply-To: <FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 09:48:02 +0100
Message-ID: <CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 08:56:57 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/21 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>
>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>>> * This move will allow the testing of meta-kde for users without meta-openembedded.
>>>
>> So what other layers are using giflib?
>>
>> Your suggesting that we need to have it in oe-core so people don't need to add the meta-openembedded layer when using meta-kde?
>>
>> I am just trying to get more data before making a decision.
>
> Let's put everything in oe-core!

Otherwise it would require to maintain a redundant copy of giflib in meta-kde.
Alternative suggestions are welcome.


A grep shows that not many recipes depend on giflib:
-
samuel@s-stirtzel-linux:/work/oe-core/setup-scripts/sources$ grep -r 'giflib' *
meta-java/recipes-core/openjdk/openjdk-6-common.inc:DEPENDS = "giflib
libpng jpeg cups \
meta-java/recipes-core/icedtea/icedtea6-native.inc:
freetype-native zlib-native giflib-native jpeg-native \
meta-kde/recipes-kde-base/kdelibs4_git.bb:DEPENDS = "automoc4-native
strigi libdbusmenu-qt soprano shared-desktop-ontologies dbus giflib
attica jpeg libpng bzip2 libpcre perl-native"
meta-openembedded/meta-efl/recipes-efl/efl/evas.inc:DEPENDS = "librsvg
eina eet freetype jpeg libpng virtual/libx11 libxext libxrender
fontconfig libfribidi giflib"
-

Any reason against the move?

-- 
Regards
Samuel


