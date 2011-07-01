Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcfP7-0007iE-5U
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:13:13 +0200
Received: by wyg30 with SMTP id 30so2556502wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 08:09:28 -0700 (PDT)
Received: by 10.216.81.8 with SMTP id l8mr3014990wee.46.1309532968409;
	Fri, 01 Jul 2011 08:09:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h22sm1682879wes.8.2011.07.01.08.09.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 08:09:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309532106.2633.74.camel@phil-desktop>
Date: Fri, 1 Jul 2011 17:09:25 +0200
Message-Id: <40ABB402-FEC2-4DB8-9C94-67F5CF1F832C@dominion.thruhere.net>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<201106301633.48933.paul.eggleton@linux.intel.com>
	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
	<1309532106.2633.74.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Fri, 01 Jul 2011 15:13:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 16:55 heeft Phil Blundell het volgende geschreven:

> On Thu, 2011-06-30 at 17:49 +0200, Koen Kooi wrote:
>> It's a white list, so:
>>=20
>> # 0 - non dev contains .so
>> # 5 - .la contains installed=3Dyes or reference to the workdir
>> # 7 - the desktop file is not valid
>> # 8 - .la contains reference to the workdir
>> # 9 - LDFLAGS ignored
>>=20
>> Are warnings and
>>=20
>> # 1 - package contains a dangerous RPATH
>> # 2 - package depends on debug package
>> # 3 - non dbg contains .so
>> # 4 - wrong architecture
>> # 6 - .pc contains reference to /usr/include or workdir
>> # 10 - Build paths in binaries
>> # 11 - package depends on devel package
>>=20
>> Are fatal errors. The splits seems arbitrary to me, but it that's how =
it was last year before RP disabled all fatal errors.
>=20
> I guess the split does make some sense as it is, although I can't see
> any reason for #8 not to be in the fatal set.  #5 also seems like it
> would belong there except that, as far as I can tell, that test =
doesn't
> actually exist in the code so it's a bit academic how the results are
> treated.
>=20
> #7 is, in the scheme of things, a relatively minor infringement (and
> usually an upstream bug anyway) so probably oughtn't to make a package
> unshippable.  #9 is potentially a nuisance but in most cases doesn't
> cause any actual problems, so again I think it's fair for this to be a
> warning.=20
>=20
> Incidentally, it seems that the description for #6 is a bit wrong: it
> doesn't actually do any checking for /usr/include.  And #3 should
> obviously be talking about .debug not .so.

I use #9 as a red flag for broken buildsystems, so having it fatal has =
helped me a lot. But with RPs insane rework I can easily override the =
set from DISTRO.conf or local.conf=


