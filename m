Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGqu2-0001Sx-CZ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 13:35:14 +0200
Received: by eyd9 with SMTP id 9so2691465eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 04:29:22 -0700 (PDT)
Received: by 10.14.2.82 with SMTP id 58mr1339032eee.219.1319110161933;
	Thu, 20 Oct 2011 04:29:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x45sm24619931eeh.11.2011.10.20.04.29.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 04:29:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319109715.16061.4.camel@ted>
Date: Thu, 20 Oct 2011 13:29:19 +0200
Message-Id: <46567209-1B97-42F5-B5DF-E34B823F6BF7@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
	<1317239461.12332.55.camel@ted>
	<CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
	<67E90C92-F94E-4FF2-ADA5-A5295C4F1279@dominion.thruhere.net>
	<1319109715.16061.4.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Thu, 20 Oct 2011 11:35:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 13:21 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-10-20 at 08:23 +0200, Koen Kooi wrote:
>> Op 28 sep. 2011, om 22:04 heeft Otavio Salvador het volgende =
geschreven:
>>=20
>>> On Wed, Sep 28, 2011 at 16:50, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> This patch improves the current situation and I don't foresee the
>>>>> autoPR code working soon
>>>>=20
>>>> Which is why we need to switch to that model and shake out the =
issues
>>>> sooner than later. Enough is enough with the PR madness and we need =
to
>>>> get to grips and fix it.
>>>=20
>>> I fully agree this is the way to go but this doesn't mean we ought =
to
>>> hold this patch until all this happens. This patch allows the =
removal
>>> of the kernel.bbclass from meta-oe so reducing the delta between
>>> oe-core and meta-oe.
>>=20
>> So a month later and no sign of the mythical working
>> auto-PR-incrementer or work on it.
>=20
> A month where we were stabilising for a release. Its on the 1.2 =
feature
> list and as it happens I've been hearing questions about what is =
needed
> here.
>=20
>> So can this patch go in? It would mean we can drop kernel.bbclass
>> from meta-oe.
>=20
> I *HATE* this PR bumping stuff. I've just been told we likely need to
> bump the PR for anything using libGL which once again shows that build
> system basically failing to automate building things.
>=20
> So I'm drawing a line here and no, we can't take this. If its fine to
> expect people to bump PR values manually for lib* changes, its fine =
for
> kernels too. I'd suggest you do drop this from meta-oe and we start
> building up pressure for the problem to get fixed properly rather than
> letting people wallpaper over the cracks.

I have products to ship, so treating meta-oe as a plaything and break =
this for the sake of breaking it is unacceptable. I'll let oe-core have =
the monopoly on high-qualitily, but broken metadata.








