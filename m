Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THain-0005bW-Sg for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:35:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDMEZO010431;
	Fri, 28 Sep 2012 14:22:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10054-05; Fri, 28 Sep 2012 14:22:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDM5Ts010425
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 14:22:07 +0100
Message-ID: <1348838527.15753.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Fri, 28 Sep 2012 14:22:07 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6B48F3@039-SN1MPN1-001.039d.mgd.msft.net>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
	<E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
	<C4E52DF7-ECBD-4411-9DA6-5E7F920FE747@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B43AC@039-SN1MPN1-001.039d.mgd.msft.net>
	<C0194970-81E1-4713-A8EF-5BB842370C25@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B462F@039-SN1MPN1-001.039d.mgd.msft.net>
	<FBB69FDD-BE5F-4BAD-9FE3-59A5283722E6@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B48F3@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q8SDMEZO010431
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: perl install error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 13:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-09-28 at 05:04 +0000, McClintock Matthew-B29882 wrote:
> On Thu, Sep 27, 2012 at 11:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sep 27, 2012, at 9:23 PM, McClintock Matthew-B29882 <B29882@freesc=
ale.com> wrote:
> >
> >> On Thu, Sep 27, 2012 at 11:18 PM, Khem Raj <raj.khem@gmail.com> wrot=
e:
> >>>
> >>> On Sep 27, 2012, at 8:52 PM, McClintock Matthew-B29882 <B29882@free=
scale.com> wrote:
> >>>
> >>>> On Thu, Sep 27, 2012 at 10:43 PM, Khem Raj <raj.khem@gmail.com> wr=
ote:
> >>>>>
> >>>>> On Sep 27, 2012, at 8:40 PM, McClintock Matthew-B29882 <B29882@fr=
eescale.com> wrote:
> >>>>>
> >>>>>> Khem,
> >>>>>>
> >>>>>> I'm just not looking at a similiar issue. Do this:
> >>>>>>
> >>>>>
> >>>>>
> >>>>> just 'not' or just 'now' ?
> >>>>>
> >>>>>> cat tmp/sstate-control/manifest-* | grep usr/lib/perl5
> >>>>>>
> >>>>>> And see which recipe is making this folder. It should be the per=
l
> >>>>>> recipe, first not some other recipe=E2=80=A6
> >>>>>
> >>>>>
> >>>>> cat sstate-control/manifest-* | grep usr/lib/perl5
> >>>>>
> >>>>> return nothing
> >>>>
> >>>> Maybe this is not the same root cause then.
> >>>
> >>> reverting that commit fixed it. before that I tried to cleans state=
 clean all perl and perl-native
> >>> to no avail.
> >>
> >> OK, well we got the same error and ours was from another sstate-cach=
e
> >> installing files in /usr/lib/perl5 before perl installed it's own
> >> symlink. cleaning cache for perl did not help either.
> >>
> >> Reverting that patch could have causes rebuilds and change of orderi=
ng
> >> (possibly) that might mask the error a little longer. If ours are
> >> related.
> >
> >
> > Does it mean that if I invalidate whole state it will work ?
> > thats kind of gross
>=20
> I think just making sure perl is deployed to sysroot first fixes this
> issue. For us we were simply missing a 'DEPENDS =3D perl' for a recipe
> which installed stuff in /usr/lib/perl5 - if perl is deployed to
> sysroot first the symlink is always in place properly.

Please try the latest perl patch I've posted which should hopefully
address this problem once and for all. The sstate business is a red
herring as far as I can tell.

Cheers,

Richard



