Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>)
	id 1SImfD-0001aJ-2v; Fri, 13 Apr 2012 22:00:11 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0M2F00BYTOG99FZ1@vms173011.mailsrvcs.net>; Fri,
	13 Apr 2012 14:50:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DE62C20137; Fri,
	13 Apr 2012 15:50:32 -0400 (EDT)
Date: Fri, 13 Apr 2012 15:50:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CAMKF1srwijBorqM1e8Ck=PaV82GoPABpqsjnvpevEXYinQ+6YQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120413195032.GJ13291@denix.org>
MIME-version: 1.0
References: <20120413173704.GG2880@linaro.org>
	<CAMKF1srwijBorqM1e8Ck=PaV82GoPABpqsjnvpevEXYinQ+6YQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: ARM hard-float linker path - consensus
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
X-List-Received-Date: Fri, 13 Apr 2012 20:00:11 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Fri, Apr 13, 2012 at 11:11:02AM -0700, Khem Raj wrote:
> FYI this will impact us in coming time. If someone has questions
> please bring it up

While it's a slightly unexpected outcome (/lib/ld-linux-armhf.so.3) i=
t's still=20
good to see some agreement here.

Do we want to make the necessary toolchain changes right away, or wai=
t for=20
them to propagate from upstream?

--=20
Denys


> ---------- Forwarded message ----------
> From: Steve McIntyre <steve.mcintyre@linaro.org>
> Date: Fri, Apr 13, 2012 at 10:37 AM
> Subject: ARM hard-float linker path - consensus
> To: cross-distro@lists.linaro.org
> Cc: libc-ports@sourceware.org, gcc-patches@gcc.gnu.org
>=20
>=20
> Hi folks,
>=20
> As promised, here's minutes from the call we had this
> afternoon. Spoiler: the result we've agreed is
>=20
> =A0/lib/ld-linux-armhf.so.3
>=20
> And here's a transcription of the minutes from
>=20
> =A0https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2=
012
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Meeting: 13th April 2012, 15:00 UTC
>=20
> Agenda
> ------
>=20
> =A0* Debian/Ubuntu have so far built using /lib/arm-linux-gnueabihf=
/ld-linux.so.3
> =A0* Some other distros (Fedora, OpenSUSE) are still using
> /lib/ld-linux.so.3 option which matches the older soft-float ABI
> =A0* Some people are proposing /libhf/ld-linux.so.3 or
> /libhfp/ld-linux.so.3 (multilib)
> =A0* Some people proposed /lib/ld-arm-linux-gnueabihf.so.3 (similar=
 to
> x86_64, libs still in /lib, from Michael Hope)
> =A0* What should we do as a community?
>=20
> Present
> -------
>=20
> Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 Affiliations
>=20
> Steve McIntyre =A0 =A0 ARM, Debian, Linaro
> Wookey =A0 =A0 =A0 =A0 =A0 =A0 ARM, Debian, Linaro
> Richard Earnshaw =A0 ARM, gcc
> Jeff Law =A0 =A0 =A0 =A0 =A0 Fedora, Red Hat, gcc, glibc
> Jon Masters =A0 =A0 =A0 =A0Fedora, Red Hat
> Andrew Haley =A0 =A0 =A0 Fedora, Red Hat, gcc
> Andreas Jaeger =A0 =A0 SUSE, openSUSE, glibc
> Carlos O'Donnell =A0 Mentor, gcc
> Steve Langasek =A0 =A0 Canonical, Ubuntu, Debian
> Dann Frazier =A0 =A0 =A0 Canonical, Ubuntu, Debian
> Adam Conrad =A0 =A0 =A0 =A0Canonical, Ubuntu, Debian
> Matthias Klose =A0 =A0 Canonical, Ubuntu, Debian
> Mike Frysinger =A0 =A0 Gentoo
> Dennis Gilmore =A0 =A0 Fedora, Red Hat
>=20
> Discussion
> ----------
>=20
> We started with a couple of questions up front to establish the
> grounds for discussion:
>=20
> =A0* We believed that decision makers were present for all the impo=
rtant
> =A0 parties, i.e. all the arm hard-float distros, plus toolchain
> =A0 developers. This meant that a decision taken at the meeting cou=
ld
> =A0 be implemented without needing further arguments/negotiations.
>=20
> =A0* All the people present understood the importance of cross-dist=
ro
> =A0 binary compatibility, and they all wanted it. This led to agree=
ment
> =A0 that we needed to agree on a standard path for the runtime link=
er
> =A0 for ARM hard-float Linux binaries.
>=20
> Debian and Ubuntu had so far been using the "multi-arch" path of
> /lib/arm-linux-gnueabihf/ld-linux.so.3. Fedora and OpenSUSE were th=
us
> far using /lib/ld-linux.so.3, the same as the soft-float ABI. Other=
s
> had proposed alternative paths such as /libhf/ld-linux.so.3 or
> /libhfp/ld-linux.so.3 (multilib) or
> /lib/ld-arm-linux-gnueabihf.so.3. Discussion showed that none of th=
ese
> were found to be universally acceptable.
>=20
> Two parties were likely to be soon affected by an agreement here:
>=20
> 1. Ubuntu 12.04 (releasing with armhf in ~2 weeks)
>=20
> Adam/Steve L agreed that all efforts would be put in to switch the
> compilers in Ubuntu to a new path before release. Default things li=
ke
> gcc would be correct, but less common tools might still be targetti=
ng
> the old path /lib/arm-linux-gnueabihf/ld-linux.so. at release. They
> could be fixed in the longer term and would not stop progress here.
>=20
> 2. Mentor (Codebench due for release in ~1 week)
>=20
> Carlos mentioned this - Codebench has been using /lib/ld-linux.so.3
> for hard-float binaries for some time and it was too late to change
> that for this upcoming release. Next release due in October. Sugges=
ted
> and accepted that this should be mentioned in release notes: if peo=
ple
> want to use Codebench on some systems (Debian/Ubuntu and derivative=
s),
> they'll need to tweak their system setup. He may be able to do the
> linker change and rebuild in a point release in a few weeks.
>=20
> It was briefly suggested that the soft-float linker should be renam=
ed
> away from /lib/ld-linux.so.3 as well at this time, but that idea wa=
s
> quickly shot down.
>=20
> Proposal #1: /lib/ld-armhf.so.3 =A0 =A0 =A0 (not generally liked)
>=20
> Proposal #2: /lib/ld-linux-armhf.so.3 (not favourite, but considere=
d
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 an acceptable compromise by all)
>=20
> No need to go any further.
>=20
> Conclusion
> ----------
>=20
> All the people in the meeting agreed: the new runtime linker path f=
or
> ARM hard-float Linux binaries was to be
>=20
> /lib/ld-linux-armhf.so.3
>=20
> ACTION: People at the meeting to present this decision to their
> =A0 =A0 =A0 =A0companies / communities and get the appropriate chan=
ges made.
>=20
> Further discussion
> ------------------
>=20
> General unhappiness with the mess that led to this meeting. Future
> planning needs to be better between the various groups for the next
> time we have a new CPU/ABI/whatever.
>=20
> ACTION: Jon Masters to talk to the Linux Foundation about setting u=
p a
> =A0 =A0 =A0 =A0forum for such discussions.
>=20
> In the meantime, strong consensus to use the
> cross-distro@lists.linaro.org mailing list for any more conversatio=
ns
> now we have people in contact.
>=20
> ACTION: Steve McIntyre to write up the minutes and circulate. Inclu=
de
> =A0 =A0 =A0 =A0an updated linker path patch for gcc to match the de=
cision
> =A0 =A0 =A0 =A0made here.
>=20
> More discussion about triplets and naming, but nothing came of it i=
n
> the end. Distro folks have already decided what they're using and h=
ave
> patched various software to build appropriately. Richard wants to m=
ove
> gcc's config.guess to use arm-linux-gnueabihf; no strong objections=
 to
> that.
>=20
> Linker path patch for gcc
> -------------------------
>=20
> Adapted from earlier work by Dann Frazier <dann.frazier@canonical.c=
om>
> and Michael Hope <michael.hope@linaro.org>
>=20
> 2012-04-13 Steve McIntyre <steve.mcintyre@linaro.org>
>=20
> =A0 =A0 =A0 * config/arm/linux-eabi.h (GLIBC_DYNAMIC_LINKER_HARD_FL=
OAT): Define.
> =A0 =A0 =A0 (GLIBC_DYNAMIC_LINKER): Redefine to use the hard float =
path.
>=20
> diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eab=
i.h
> index 80bd825..8c9d2e7 100644
> --- a/gcc/config/arm/linux-eabi.h
> +++ b/gcc/config/arm/linux-eabi.h
> @@ -62,7 +62,11 @@
> =A0/* Use ld-linux.so.3 so that it will be possible to run "classic=
"
> =A0 =A0GNU/Linux binaries on an EABI system. =A0*/
> =A0#undef =A0GLIBC_DYNAMIC_LINKER
> -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.3"
> +#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> +#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> +#define GLIBC_DYNAMIC_LINKER \
> + =A0 "%{mfloat-abi=3Dhard:" GLIBC_DYNAMIC_LINKER_HARD_FLOAT "} \
> + =A0 =A0%{!mfloat-abi=3Dhard:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "}"
>=20
> =A0/* At this point, bpabi.h will have clobbered LINK_SPEC. =A0We w=
ant to
> =A0 =A0use the GNU/Linux version, not the generic BPABI version. =
=A0*/
>=20
>=20
> Post-meeting on IRC
> -------------------
>=20
> Suggested that Richard should push the change into gcc trunk
> ASAP. Steve McIntyre agreed to work on that with Richard.
>=20
> Also suggested that we want to get a patch into glibc too to change
> the installation path for ARM hard-float. Andrew agreed to push gli=
bc
> upstream for that.
>=20
> Cheers,
> --
> Steve McIntyre =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0steve.mcintyre@linaro.org
> <http://www.linaro.org/> Linaro.org | Open source software for ARM =
SoCs
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re



