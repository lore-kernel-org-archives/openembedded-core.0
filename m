Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ruksx-0004br-PW
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 14:15:03 +0100
Received: by wgbdr13 with SMTP id dr13so6515260wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 05:07:01 -0800 (PST)
Received: by 10.180.81.66 with SMTP id y2mr33698510wix.20.1328620021827;
	Tue, 07 Feb 2012 05:07:01 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q7sm32051498wix.5.2012.02.07.05.07.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 05:07:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxFPfknw2GFTaK1oh2tqLKvyyTOFfj=3pPoJe=gjeqH+tg@mail.gmail.com>
Date: Tue, 7 Feb 2012 14:06:53 +0100
Message-Id: <C7894645-45A1-40AF-8F77-0C84D50B26AC@dominion.thruhere.net>
References: <1328613869-19250-1-git-send-email-andrei@gherzan.ro>
	<F229F287-890C-429C-BE74-8E38AB5E0C25@dominion.thruhere.net>
	<CAK18fxFPfknw2GFTaK1oh2tqLKvyyTOFfj=3pPoJe=gjeqH+tg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/3] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Tue, 07 Feb 2012 13:15:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 7 feb. 2012, om 14:04 heeft Andrei Gherzan het volgende geschreven:

> On Tue, Feb 7, 2012 at 14:12, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>=20
> Op 7 feb. 2012, om 12:24 heeft Andrei Gherzan het volgende geschreven:
>=20
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > Signed-off-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
> > ---
> > meta/recipes-support/nspr/files/nspr.pc |   11 +++++++++
> > meta/recipes-support/nspr/nspr_4.8.9.bb |   36 =
+++++++++++++++++++++++++++++++
> > 2 files changed, 47 insertions(+), 0 deletions(-)
> > create mode 100644 meta/recipes-support/nspr/files/nspr.pc
> > create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb
> >
> > diff --git a/meta/recipes-support/nspr/files/nspr.pc =
b/meta/recipes-support/nspr/files/nspr.pc
> > new file mode 100644
> > index 0000000..c3aed84
> > --- /dev/null
> > +++ b/meta/recipes-support/nspr/files/nspr.pc
> > @@ -0,0 +1,11 @@
> > +os_libs=3D-lpthread -ldl
> > +prefix=3D/usr
> > +exec_prefix=3D/usr
> > +libdir=3D/usr/lib
> > +includedir=3D/usr/include
>=20
> The above hardcodes an fs layout that isn't true for e.g. micro
>=20
>=20
> A pc was the only way to make js "see" nspr.  Actually it was Jin's =
idea and i found it accurate for my use-case.=20
> Koen, on micro how these hardcodes should look like?

You will problably need to replace them with OEPREFIX/OELIBDIR and do =
sed -i s:OEPREFIX:${prefix}:g *.pc in do_install_append.

regards,

Koen=


