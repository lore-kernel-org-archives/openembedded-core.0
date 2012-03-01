Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S36Iw-0006Vt-7I
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 14:44:22 +0100
Received: by wgbdr12 with SMTP id dr12so483895wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 05:35:52 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.87.100 as permitted sender)
	client-ip=10.180.87.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.87.100 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.87.100])
	by 10.180.87.100 with SMTP id w4mr10636187wiz.22.1330608952746
	(num_hops = 1); Thu, 01 Mar 2012 05:35:52 -0800 (PST)
Received: by 10.180.87.100 with SMTP id w4mr8519198wiz.22.1330608952676;
	Thu, 01 Mar 2012 05:35:52 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id er8sm9973062wib.1.2012.03.01.05.35.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 05:35:51 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGiJk9cJa7MoHjpTGB0xVbOrcHS=m95PShuHheKaoAYhGrcRdQ@mail.gmail.com>
Date: Thu, 1 Mar 2012 14:35:50 +0100
Message-Id: <BFD998F2-6D5D-4E7D-8006-C133F0DF9C98@dominion.thruhere.net>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<CAGiJk9cJa7MoHjpTGB0xVbOrcHS=m95PShuHheKaoAYhGrcRdQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQns4+8q9hZtSAL3pOGdQbCGlmHCo8FY1D5Za1oqmSzf13hOQSyuwT38BfIkbhql28DaSS4s
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 01 Mar 2012 13:44:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 14:24 heeft Samuel Stirtzel het volgende geschreven:

> Just to let you know that I'm still working on this.
>=20
> The git repository (at [1]) shows what was currently done, since
> kdelibs builds now it could  be possible to port other programs that
> depend on it.
>=20
>=20
> The good and the bad news:
> Good:
> * Most things will compile and install
> * Workarounds should be easy to understand
> Bad:
> * There are workarounds for cruel hard-coded "where to find and
> install" strings in CMake files
> * My popularity as KDE developer decreases every time I ask "Why does
> package <XYZ> installs it's CMake files into the libdir?"
> * ^ Of course this is a joke, but some really do..
> * The user has to install kdelibsX-dev (X is either version 4 or 5)
> since KDE (like Koen already stated) needs to execute KDE/Qt programs
> that depend on the whole KDE stack again in a native flavor.

Can we just build them natively and put them in the host sysroot?

>=20
>=20
>=20
> About the current status:
> The main dependency kdelibs builds but in do_package there is a
> ominous QA error:
> ERROR: QA Issue: kdelibs4 rdepends on kdelibs4-dev
> Since this error message is important, it will not help (me) much to
> resolve the error.
> In other words is there any way to debug this?

No testlab in oe-core, but buildhistory pretty much does the same: =
http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again

regards,

Koen=


