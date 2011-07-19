Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QiyHm-0002Xv-TL
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:35:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2011 17:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,225,1309762800"; d="scan'208";a="31832301"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2011 17:31:36 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 19 Jul 2011 08:30:23 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Tue, 19 Jul 2011 08:30:22 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 19 Jul 2011 08:30:21 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2011 08:30:21 +0800
Thread-Topic: [OE-core] [PATCH 3/4] udev: Change hard coded /usr/lib to
	support multilib
Thread-Index: AcxFX46U6k24AkHaQqCIwn4mNgpr3AASyf7g
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6DF8A02@shsmsx501.ccr.corp.intel.com>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
	<c4ca6242b49eddc218fa3c0f58d172efc1601c84.1310969462.git.dongxiao.xu@intel.com>
	<FE823AAC-2695-4FB2-9E90-BCD2ED38771B@dominion.thruhere.net>
	<281DBDA2-688D-4559-8191-276A44DEDF70@dominion.thruhere.net>
	<4E245054.4000303@windriver.com> <4E245163.4000809@windriver.com>
In-Reply-To: <4E245163.4000809@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] udev: Change hard coded /usr/lib to	support multilib
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
X-List-Received-Date: Tue, 19 Jul 2011 00:35:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Monday, July 18, 2011 11:30 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 3/4] udev: Change hard coded /usr/lib to su=
pport
> multilib
>=20
> Replying to myself.. sorry, I misunderstood the concern.. see below for a=
 new
> explanation..
>=20
> On 7/18/11 10:25 AM, Mark Hatle wrote:
> > On 7/18/11 7:32 AM, Koen Kooi wrote:
> >>
> >> Op 18 jul 2011, om 09:08 heeft Koen Kooi het volgende geschreven:
> >>
> >>>
> >>> Op 18 jul 2011, om 08:13 heeft Dongxiao Xu het volgende geschreven:
> >>>
> >>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> >>>> ---
> >>>> meta/recipes-core/udev/udev-164/makefile.patch |   16
> ++++++++++++++++
> >>>> meta/recipes-core/udev/udev-new.inc            |    1 +
> >>>> meta/recipes-core/udev/udev_164.bb             |    2 +-
> >>>> 3 files changed, 18 insertions(+), 1 deletions(-) create mode
> >>>> 100644 meta/recipes-core/udev/udev-164/makefile.patch
> >>>>
> >>>> diff --git a/meta/recipes-core/udev/udev-164/makefile.patch
> >>>> b/meta/recipes-core/udev/udev-164/makefile.patch
> >>>> new file mode 100644
> >>>> index 0000000..c46ff4b
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-core/udev/udev-164/makefile.patch
> >>>> @@ -0,0 +1,16 @@
> >>>> +Upstream-Status: Inappropriate [configuration]
> >>>
> >>> Could you explain why it's inappropriate for upstream but why we do n=
eed it
> here?
> >>
> >> I asked the udev maintainer:
> >>
> >> 14:25 < koen> kay: the udev Makefile.am has 'ln -sf $(libexecdir)/udev=
-acl
> $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck', any reason fo=
r not
> using ${libdir} over ${prefix}/lib ?
> >> 14:29 < kay> koen: libdir is /usr/lib64 here, can't use that
> >>
> >> So upstream is aware of multilib, but wants to put these scripts in a
> non-multilib dir. Since I don't have any experience with the fedora/opens=
use
> way of multilib nor the new oe-core one, could you please explain why oe-=
core
> needs this patch, but fedora/opensuse don't?
> >
> > This is likely a problem with the multilib fix.  "libexecdir" is often
> > /usr/lib on many distribuions.. however as your other email
> > mentioned.. setting it to
> > /usr/lib64 is a mistake.  It should be /usr/libexec or /usr/lib64.
> > All of the associated multilib packages should work correctly and no
> > conflicts introduced with this package (file contents should be
> > identical.)
> >
> > It should be permissible for libexecdir to be changed in the
> > configuration if someone really wants it to be.  By default (in bitbake=
.conf) it
> is:
> >
> > export libexecdir =3D "${exec_prefix}/libexec"
>=20
> > +-	mkdir -p $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d
> > +-	ln -sf $(libexecdir)/udev-acl
> $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck
> > ++	mkdir -p $(DESTDIR)$(libdir)/ConsoleKit/run-seat.d
> > ++	ln -sf $(libexecdir)/udev-acl
> > ++$(DESTDIR)$(libdir)/ConsoleKit/run-seat.d/udev-acl.ck
>=20
> I see libexecdir CAN be changed.. so the above is already possible..
>=20
> The part they had hard coded is "/usr/lib/ConsoleKit"...  There is only o=
ne
> location in the system for ConsoleKit configuration files/scripts.. and t=
hat is
> distro specific.  Assuming the oe based distributions use
> $(PREFIX)/lib/ConsoleKit.. then the previous was correct.
>=20
> The point being it doesn't matter if it's 32-bit, 64-bit or 24-bit...  on=
ly one
> ConsoleKit per system should exist.  (There are potentially other files o=
n the
> system like this.  I know a recent RPM patch went in that separated
> /usr/lib/rpm and /usr/lib64/rpm..  this is also a similar mistake, I just=
 haven't
> had time to get a patch out to revert that chunk.)

So for multilib system, we have /usr/lib32 and /usr/lib64 to contain only *=
.so files, while there is still /usr/lib directory which contains other typ=
es of files, right?

Thanks,
Dongxiao

>=20
> --Mark
>=20
> > --Mark
> >
> >> regards,
> >>
> >> Koen
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


