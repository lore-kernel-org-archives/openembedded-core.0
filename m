Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2Q6E-0005ZQ-Hf
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:35:55 +0100
Received: by wwb17 with SMTP id 17so9088917wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:33:59 -0700 (PDT)
Received: by 10.227.36.209 with SMTP id u17mr6548920wbd.117.1300894439646;
	Wed, 23 Mar 2011 08:33:59 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	y29sm3861902wbd.21.2011.03.23.08.33.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 08:33:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
Date: Wed, 23 Mar 2011 16:33:58 +0100
Message-Id: <F4596E6F-7714-4DC4-B5C5-C647CCFFAC26@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 15:35:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt 2011, om 16:19 heeft Khem Raj het volgende geschreven:

> On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Hi,
>>=20
>> I'd like to import the EFL recipes Martin did from meta-shr into the =
meta-openembedded repo. Before I go bothering Martin about it, what =
would be the best place to put them?
>>=20
>> Inside meta-oe:
>>=20
>> meta-openembedded/
>>        meta-oe/
>>                recipes-efl
>=20
> Can efl we layered directly on top of oe-core  ? i.e. without needing =
meta-oe
> in that case its better to be an independent layer. otherwise I would =
say put
> them under recipes-efl

I think that's a misleading heuristic, I would like to give people the =
option to opt-in for extra recipes (parse time, legal sign-off, etc), =
instead of stuffing 5k recipes into meta-oe.
If the person looking after efl* wants it in meta-oe, so be it, it's the =
maintainers call.

regards,

Koen=


