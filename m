Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAs2l-0002hj-Uw
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 01:07:48 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1B007HC99YUOC0@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:58:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0A2A7202A6; Thu,
	22 Mar 2012 19:58:46 -0400 (EDT)
Date: Thu, 22 Mar 2012 19:58:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CAAQYJAtjfhhckJOTo1dxit4S72wFQ5Jt+r4MMfN6-Qu-Bw=DOg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120322235845.GD13495@denix.org>
MIME-version: 1.0
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
	<CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
	<CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
	<4F6B4C0B.3030504@linux.intel.com>
	<CAAQYJAtjfhhckJOTo1dxit4S72wFQ5Jt+r4MMfN6-Qu-Bw=DOg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Fri, 23 Mar 2012 00:07:48 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Fri, Mar 23, 2012 at 12:27:07AM +0100, Andrea Adami wrote:
> On Thu, Mar 22, 2012 at 4:58 PM, Saul Wold <sgw@linux.intel.com> wr=
ote:
> > On 03/22/2012 02:41 AM, Samuel Stirtzel wrote:
> >>
> >> 2012/3/22 Koen Kooi<koen@dominion.thruhere.net>:
> >>>
> >>>
> >>> Op 22 mrt. 2012, om 09:48 heeft Samuel Stirtzel het volgende ge=
schreven:
> >>>
> >>>> 2012/3/21 Koen Kooi<koen@dominion.thruhere.net>:
> >>>>>
> >>>>>
> >>>>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschr=
even:
> >>>>>
> >>>>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
> >>>>>>>
> >>>>>>> * This move will allow the testing of meta-kde for users wi=
thout
> >>>>>>> meta-openembedded.
> >>>>>>>
> >>>>>> So what other layers are using giflib?
> >>>>>>
> >>>>>> Your suggesting that we need to have it in oe-core so people=
 don't
> >>>>>> need to add the meta-openembedded layer when using meta-kde?
> >>>>>>
> >>>>>> I am just trying to get more data before making a decision.
> >>>>>
> >>>>>
> >>>>> Let's put everything in oe-core!
> >>>>
> >>>>
> >>>> Otherwise it would require to maintain a redundant copy of gif=
lib in
> >>>> meta-kde.
> >>>
> >>>
> >>> I don't think you get the concept of layers and keeping non-cor=
e stuff
> >>> out of oe-core.
> >>
> >>
> >> How can it be that libpng is core stuff and libgif is not?
> >>
> > libpng is in oe-core because it is used by other parts of oe-core=
 (Sato,
> > GTK+, Gthumb, Cups, ...). =A0PNG is also more common that GIF bec=
ause GIF had
> > licensing issues in the past.
>=20
> All this seems to me unsatisfactory being that the above mentioned
> 'parts of OE' should not even be in oe-core.
> About the specific .gif, .png , etc. libs, those should be in a
> meta-graphics layer or whatever you want to call it.
>=20
> Finally, nobody should feel guilty if not including meta-oe.
> Developing a BSP is much easier with oe-core only (and no, the BSP
> layers should not depend on meta-oe).

Ha, BSP layers _should not_, but sometimes they _have to_ depend on m=
eta-oe:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/README

There's been extensive thread lately about this on meta-ti list...

--=20
Denys


> > Finally, as stated in other emails meta-kde has other dependencie=
s on
> > meta-oe, it's just the base bits that need giflib.
> >
> > So, no we will not move libgif into oe-core, please use the Layer=
s as they
> > are intended.
> >
> > Thanks
> > =A0 =A0 =A0 =A0Sau!
> >
> >
> >>>
> >>>> Alternative suggestions are welcome.
> >>>>
> >>>>
> >>>> A grep shows that not many recipes depend on giflib:
> >>>> -
> >>>> samuel@s-stirtzel-linux:/work/oe-core/setup-scripts/sources$ g=
rep -r
> >>>> 'giflib' *
> >>>> meta-java/recipes-core/openjdk/openjdk-6-common.inc:DEPENDS =
=3D "giflib
> >>>> libpng jpeg cups \
> >>>> meta-java/recipes-core/icedtea/icedtea6-native.inc:
> >>>> freetype-native zlib-native giflib-native jpeg-native \
> >>>> meta-kde/recipes-kde-base/kdelibs4_git.bb:DEPENDS =3D "automoc=
4-native
> >>>> strigi libdbusmenu-qt soprano shared-desktop-ontologies dbus g=
iflib
> >>>> attica jpeg libpng bzip2 libpcre perl-native"
> >>>> meta-openembedded/meta-efl/recipes-efl/efl/evas.inc:DEPENDS =
=3D "librsvg
> >>>> eina eet freetype jpeg libpng virtual/libx11 libxext libxrende=
r
> >>>> fontconfig libfribidi giflib"
> >>>> -
> >>>>
> >>>> Any reason against the move?
> >>>
> >>>
> >>> The whole layering concept
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core
> >>
> >>
> >>
> >>
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re



