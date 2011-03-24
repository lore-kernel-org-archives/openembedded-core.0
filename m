Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2hMe-0001xq-VV
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 11:02:00 +0100
Received: by wyb40 with SMTP id 40so8494258wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:00:08 -0700 (PDT)
Received: by 10.227.177.13 with SMTP id bg13mr1042592wbb.92.1300960807766;
	Thu, 24 Mar 2011 03:00:07 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	w25sm4232949wbd.56.2011.03.24.03.00.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:00:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110324074926.GR2224@xora-desktop.xora.org.uk>
Date: Thu, 24 Mar 2011 11:00:05 +0100
Message-Id: <796DCDF9-6969-47DB-8C00-7137FCD9B7B9@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
	<1300896184.3488.17.camel@scimitar>
	<20110323175229.GN2224@xora-desktop.xora.org.uk>
	<1300921337.3018.45.camel@rex>
	<20110323235316.GQ2224@xora-desktop.xora.org.uk>
	<4D8A88FF.8070600@balister.org> <1300926448.3018.69.camel@rex>
	<20110324074926.GR2224@xora-desktop.xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
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
X-List-Received-Date: Thu, 24 Mar 2011 10:02:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 mrt 2011, om 08:49 heeft Graeme Gregory het volgende geschreven:

> On Thu, Mar 24, 2011 at 12:27:28AM +0000, Richard Purdie wrote:
>> Have either of you ever tried to explain some of the concepts we're
>> dealing with to people who aren't deeply engaged engineers?
>>=20
> Yes, everytime I apply for a new job/contract getting quite used to
> explaining it.
>=20
>> Having a model showing the kinds of things layers can do is extremely
>> helpful in explaining the concept to people.
>>=20
>> Part of OE's problem and the number one complaint about it is that =
its
>> hard to understand. If as I/others try and put things into terms that
>> others can understand get undermined with this kind of response its =
just
>> going to further the impression that OE is nice but never going to be
>> useful in the real world.
>>=20
>> As for whether that diagram is practical, I actually believe it is in
>> some cases, like the one I described above. Certainly not all but its
>> worth trying to strive to simplify and make things fit simpler models
>> if/when we can. If we don't even bother trying, there is no chance
>> things will improve.
>>=20
>=20
> You miss my point, Joshua's email reads to me like "our goal is to =
make OE
> like this diagram" which if true would cripple OE to being incredibly =
simple
> and non flexible.
>=20
> My vision of a seperated out OE is to seperate components out into =
logical
> boxes. Ie the gnome box, the kde box, the xorg box. Then like we used =
to do
> with our lego or mecheno sets. When we want to build something we know =
what
> components we want so we select the boxes that contain those =
components.

What I would like is to have a tool that can parse the READMEs and =
generate:

digraph depends {
    node [shape=3Dplaintext]
meta_oe -> openembedded_core
meta_efl -> openembedded_core
meta_efl -> meta_oe
meta_angstrom -> openembedded_core
meta_angstrom -> meta_oe
angstrom_layers -> meta_angstrom
angstrom_layers -> meta_oe
angstrom_layers -> openembedded_core
}

Sample output:

http://dominion.thruhere.net/koen/angstrom/layers.png

That for the layers I currently have configured

regards,

Koen=


