Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2QEn-0005A0-HM
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:44:45 +0100
Received: by wyb40 with SMTP id 40so7633120wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:42:54 -0700 (PDT)
Received: by 10.216.4.83 with SMTP id 61mr7458467wei.67.1300894974244;
	Wed, 23 Mar 2011 08:42:54 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m2sm3403500wer.37.2011.03.23.08.42.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 08:42:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1300894797.3018.7.camel@rex>
Date: Wed, 23 Mar 2011 16:42:52 +0100
Message-Id: <EEB43C23-7673-4F6B-86BA-B3C15C52C744@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<1300894797.3018.7.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Wed, 23 Mar 2011 15:44:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt 2011, om 16:39 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-03-23 at 08:19 -0700, Khem Raj wrote:
>> On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> Hi,
>>>=20
>>> I'd like to import the EFL recipes Martin did from meta-shr into the =
meta-openembedded repo. Before I go bothering Martin about it, what =
would be the best place to put them?
>>>=20
>>> Inside meta-oe:
>>>=20
>>> meta-openembedded/
>>>       meta-oe/
>>>               recipes-efl
>>=20
>> Can efl we layered directly on top of oe-core  ? i.e. without needing =
meta-oe
>> in that case its better to be an independent layer. otherwise I would =
say put
>> them under recipes-efl
>=20
> I'd hope that it would be possible to run it on top of oe-core, at =
least
> for its basic components. If its not possible, I'd like to understand
> why so we can see if its possible to fix it.
>=20
> Ultimately, we need to add some kind of layer dependency information
> although we don't have an implementation of that yet.

I;m currently usng a low-tech README for that:

http://gitorious.org/angstrom/angstrom-layers/blobs/master/README

would be nice to come up with something machine parse-able.

regards,

Koen=


