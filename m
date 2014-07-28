Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 625AA701D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 09:35:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S9ZgSB002753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 02:35:42 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.155]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Mon, 28 Jul 2014 02:35:41 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] alsa-lib: remove non PN based -dev packages
Thread-Index: AQHPqi1rKIyvdfCz3EaH61lhnxGUrJu1CjrggACZFgD//5EyIA==
Date: Mon, 28 Jul 2014 09:35:41 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCAC0697@ALA-MBA.corp.ad.wrs.com>
References: <1406282736-30238-1-git-send-email-jackie.huang@windriver.com>
	<FE5CD361-F77F-4383-B608-E216734EDB6E@dominion.thruhere.net>
	<1B858668EC6A94408DCA5225FDFA85AABCAC0413@ALA-MBA.corp.ad.wrs.com>
	<3EFC00D1-B81F-4618-AC38-B3557430D4EE@dominion.thruhere.net>
In-Reply-To: <3EFC00D1-B81F-4618-AC38-B3557430D4EE@dominion.thruhere.net>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.142]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: remove non PN based -dev packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jul 2014 09:35:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>=20
> Op 28 jul. 2014, om 08:49 heeft Huang, Jie (Jackie) <Jackie.Huang@windriv=
er.com> het volgende
> geschreven:
>=20
> >
> >
> >> -----Original Message-----
> >> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> >> Sent: Monday, July 28, 2014 2:30 PM
> >> To: Huang, Jie (Jackie)
> >> Cc: OE-core; Richard Purdie
> >> Subject: Re: [OE-core] [PATCH] alsa-lib: remove non PN based -dev
> >> packages
> >>
> >>
> >> Op 25 jul. 2014, om 12:05 heeft jackie.huang@windriver.com het volgend=
e geschreven:
> >>
> >>> From: Jackie Huang <jackie.huang@windriver.com>
> >>>
> >>> All dev related items should be packaged in the core PN-dev package
> >>> not in seperate packages.
> >>
> >> What's the upgrade path here for image and users that have 'alsa-dev'
> >> installed? Looks like there are
> >
> > My patch is removing 'alsa-dev' and all related files goes into
> > '${PN}-dev' (PN=3Dalsa-lib here), so users need to install alsa-lib-dev=
 instead of alsa-dev.
>=20
> *sigh* So you have no upgrade path for situations where 'alsa-dev' is alr=
eady installed or listed in a
> packagegroup or image. Worse, you don't even understand the problem :/

I see your point, I did grep on oe-core and meta-oe and didn't find any evi=
dence that 'alsa-dev' is installed or listed
In a packagegroup or image, so I thought it's safe to remove without RREPLA=
CES/RPROVIDES in place, sorry that I did
a wrong assumption, I will add a RPROVIDES for this, thanks!

Thanks,
Jackie

>=20
> >
> >> now 2 conflicting packages, 'alsa-dev' in the feeds and
> >> 'alsa-lib-dev' on OE, without and
> >
> > Only 'alsa-lib-dev' now with my patch, so no conflicts.
>=20
> Hahahahahaha you are really funny.

