Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R5aVM-0001t0-2u
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 11:51:12 +0200
Received: by wwf27 with SMTP id 27so6100862wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 02:45:56 -0700 (PDT)
Received: by 10.216.163.135 with SMTP id a7mr2476625wel.56.1316425556082;
	Mon, 19 Sep 2011 02:45:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j18sm551053wbo.6.2011.09.19.02.45.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Sep 2011 02:45:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
Date: Mon, 19 Sep 2011 11:45:50 +0200
Message-Id: <DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1244.3)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Mon, 19 Sep 2011 09:51:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 sep. 2011, om 15:11 heeft Otavio Salvador het volgende geschreven:

> On Fri, Sep 16, 2011 at 09:22, Eric B=E9nard <eric@eukrea.com> wrote:
>> We could also say that qt 4.7.4 fix many qt 4.7.3 bugs and integrate =
the
>> patch fixing this one and in the end get an improvement.
>=20
> It has a patch available that fixes the issue, so seems fine for me to
> merge it and put this patch too.
>=20
> Personally I also agree that getting this into the release ought to be
> better; specially since it has the fix available on the bug tracking
> already.

So what about this:

Send a patch that adds 4.7.4 with DEFAULT_PREFERENCE =3D -1, but leaves =
4.7.3 intact.

That way people can migrate their bbappends without needing a flag day =
and it also allows people to test 4.7.4 more easily before it gets made =
the default.

As you might have noticed I have serious misgivings about using 'git mv' =
to manage qt updates.

regards,

Koen=


