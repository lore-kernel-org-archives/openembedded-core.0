Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWauL-0006Uk-Tm
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:12:22 +0200
Received: by wwb17 with SMTP id 17so5297863wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:08:55 -0700 (PDT)
Received: by 10.227.199.207 with SMTP id et15mr29282wbb.56.1308085735462;
	Tue, 14 Jun 2011 14:08:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm5340488wbb.67.2011.06.14.14.08.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 14:08:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308082816.10825.38.camel@elmorro>
Date: Tue, 14 Jun 2011 23:08:52 +0200
Message-Id: <DD2AB20F-4D4A-4C8A-A2E4-0159FDBB98DF@dominion.thruhere.net>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex>
	<BA4956B5-23B8-4590-8B23-A9837D6A11EA@dominion.thruhere.net>
	<1308082816.10825.38.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Tue, 14 Jun 2011 21:12:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 22:20 heeft Tom Zanussi het volgende geschreven:

> On Tue, 2011-06-14 at 00:40 -0700, Koen Kooi wrote:
>> Op 13 jun 2011, om 23:30 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Mon, 2011-06-13 at 22:36 +0200, Koen Kooi wrote:
>>>> Op 13 jun 2011, om 22:28 heeft Saul Wold het volgende geschreven:
>>>>=20
>>>>> On 06/13/2011 11:31 AM, Koen Kooi wrote:
>>>>>> Hi,
>>>>>>=20
>>>>>> Khem was asking if I could reproduce the recent x86 breakage he =
was seeing[1] and I ran into another bug:
>>>>>>=20
>>>>>> koen@dominion:/OE/tentacle/sources/meta-intel$ git blame =
meta-n450/conf/machine/n450.conf  | grep atom
>>>>>> 158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require =
conf/machine/atom-pc.conf
>>>>>>=20
>>>>> meta-yocto seems to be the place you need to look!
>>>>>=20
>>>>> I hope that the layering tools can help to detect and inform folks =
of this like of dependency.
>>>>=20
>>>> Isn't meta-yocto supposed to a the integration layer with no new
>>>> parts? I can't use meta-yocto since it has conflicting beagleboard
>>>> stuff in it, which means that meta-intel is now broken for me as =
well.
>>>> That surely isn't the intended plan?!?!
>>>=20
>>> The plan on public record is that atom-pc moves to meta-intel as =
soon as
>>> the layer tooling comes online and meta-yocto becomes its own repo
>>> (which at present its not but its certainly the intent).
>>=20
>> So can someone at least put that in the meta-intel or meta-n450 =
README? Most layers now have a README with the dependency info (e.g. =
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dblob;f=3Dmeta-=
palm/README;h=3D200a3c83ff11ad790fe4e03e93a26520ec0c6714;hb=3DHEAD ) It =
would be nice if the ones on yocto-project.org had somethign similar :)
>> _
>=20
> Would something like this do the trick for now (if so, I can do =
similar
> for the other meta-intel bsps)?

I'd put it in README, but yeah, it's an improvement.=


