Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmRlu-0001mo-Ll
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 16:41:10 +0200
Received: by wwi14 with SMTP id 14so3893133wwi.0
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 07:36:55 -0700 (PDT)
Received: by 10.227.198.73 with SMTP id en9mr142239wbb.0.1311863814869;
	Thu, 28 Jul 2011 07:36:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p49sm733686weq.31.2011.07.28.07.36.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 07:36:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPcSpELL=VJEdcO+0m1goAQdgV8PkjGqmZ9+3U_SZRTed=Yu-A@mail.gmail.com>
Date: Thu, 28 Jul 2011 16:36:51 +0200
Message-Id: <F5078022-9A0A-4728-8D9A-814BD5EF1564@dominion.thruhere.net>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
	<CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
	<CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
	<CACW_hTYaTBDZjfwHo=fYaZZ72KqEHVKS1DYaxDgeEVOkArmjEw@mail.gmail.com>
	<CAPcSpELL=VJEdcO+0m1goAQdgV8PkjGqmZ9+3U_SZRTed=Yu-A@mail.gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
X-Mailer: Apple Mail (2.1244.3)
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 14:41:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 16:29 heeft Ben Gardiner het volgende geschreven:

> On Thu, Jul 28, 2011 at 10:24 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>>=20
>>=20
>> 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>>>=20
>>>=20
>>> Well, I would not submit _this_ patch for pull-request. I was hoping
>>> to get this version of raptor included and then submit a =
pull-request
>>> for a cherry-pick of the patch to add libxml2 to DEPENDS.
>>=20
>> Ah, missed that you also added libxml2.
>> Not sure about the policies of the maintenance branch, but I suspect =
the
>> proper way would be to fix and test in openembedded then submit a =
pull
>> request.
>> Then again maybe the policies for the maintenance branch are =
different.
>=20
> :) They are. AFAICT I need to get this recipe (including libxml2 dep
> update) into oe-core or its layers :)

I ask again, what makes you think that? Pretty much all of the recent =
maintenance commits are from .dev.

As for getting it in meta-oe, you need to test it first in that layer =
before sending a patch.=


