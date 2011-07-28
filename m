Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmRv7-0001u4-9f
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 16:50:41 +0200
Received: by wwi18 with SMTP id 18so2152691wwi.12
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 07:46:25 -0700 (PDT)
Received: by 10.227.197.21 with SMTP id ei21mr80131wbb.107.1311864385632;
	Thu, 28 Jul 2011 07:46:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m38sm736084weq.45.2011.07.28.07.46.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 07:46:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPcSpEJLMsg+HkPbtu=6L=QEr=S7+bb34xzSKgYAwa2Qq_mnPA@mail.gmail.com>
Date: Thu, 28 Jul 2011 16:46:21 +0200
Message-Id: <DB1D5A60-CC02-493E-B6E0-9246AC19F47D@dominion.thruhere.net>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
	<CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
	<CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
	<CACW_hTYaTBDZjfwHo=fYaZZ72KqEHVKS1DYaxDgeEVOkArmjEw@mail.gmail.com>
	<CAPcSpELL=VJEdcO+0m1goAQdgV8PkjGqmZ9+3U_SZRTed=Yu-A@mail.gmail.com>
	<F5078022-9A0A-4728-8D9A-814BD5EF1564@dominion.thruhere.net>
	<CAPcSpEJLMsg+HkPbtu=6L=QEr=S7+bb34xzSKgYAwa2Qq_mnPA@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Jul 2011 14:50:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 16:43 heeft Ben Gardiner het volgende geschreven:

> Hi Koen,
>=20
> On Thu, Jul 28, 2011 at 10:36 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 28 jul. 2011, om 16:29 heeft Ben Gardiner het volgende geschreven:
>>=20
>>> On Thu, Jul 28, 2011 at 10:24 AM, Frans Meulenbroeks
>>> <fransmeulenbroeks@gmail.com> wrote:
>>>>=20
>>>>=20
>>>> 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>>>>>=20
>>>>>=20
>>>>> Well, I would not submit _this_ patch for pull-request. I was =
hoping
>>>>> to get this version of raptor included and then submit a =
pull-request
>>>>> for a cherry-pick of the patch to add libxml2 to DEPENDS.
>>>>=20
>>>> Ah, missed that you also added libxml2.
>>>> Not sure about the policies of the maintenance branch, but I =
suspect the
>>>> proper way would be to fix and test in openembedded then submit a =
pull
>>>> request.
>>>> Then again maybe the policies for the maintenance branch are =
different.
>>>=20
>>> :) They are. AFAICT I need to get this recipe (including libxml2 dep
>>> update) into oe-core or its layers :)
>>=20
>> I ask again, what makes you think that? Pretty much all of the recent =
maintenance commits are from .dev.
>=20
> I'm sorry I guess my previous reply got lost in the noise. I think
> that because I read it from Tom. If it is at all possible to
> circumvent this requirement

What did you exactly read and why do you think it's a requirement? =46rom =
http://wiki.openembedded.org/index.php/2011.03-maintenance:

"Changes may reside in either the openembedded 'master' repository OR a =
relevant public layer in the oe-core / meta-oe / etc universe"=


