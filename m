Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIl78-00086F-CY
	for openembedded-core@lists.linuxtogo.org;
	Fri, 13 Apr 2012 20:20:54 +0200
Received: by lagw12 with SMTP id w12so2477358lag.6
	for <openembedded-core@lists.linuxtogo.org>;
	Fri, 13 Apr 2012 11:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=dcJIOZgjBcP+yVWIFfkgYHmZ8Bga71kZfxV3tb7xE2g=;
	b=iMBDEbMvCDl/dpiIvfh12B1blufChFhIbM7MHTtSEKwZo+Kwngwzb7h6YEUR8WDKvB
	MrUv+YwZSebEbAF7hoaXKarpLQ8l9pI6TDZ6a0VpewCv0sfDJgH0dI5G0d6rtOLiDR9p
	zXXRipQXwUZblMpqdcv36kwW7jnjGk0xPjRqFnhVnZpu29qN2xWJ/ZoktG+3RlRHjn1G
	APaRpw72m5Zja09vNTLk1dv61/MDPNvCqyEcX61cswYO7C8TISDDPexPagsB8ZFFu+Ar
	se/H6iEVw+Wo2gp9yH3y3S4508BKxgRfdXQEXMQ+VskU6c5Tm30lxObqSxIr1AehUg0+
	hNcA==
Received: by 10.152.111.198 with SMTP id ik6mr2294567lab.38.1334340692736;
	Fri, 13 Apr 2012 11:11:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 11:11:02 -0700 (PDT)
In-Reply-To: <20120413173704.GG2880@linaro.org>
References: <20120413173704.GG2880@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 11:11:02 -0700
Message-ID: <CAMKF1srwijBorqM1e8Ck=PaV82GoPABpqsjnvpevEXYinQ+6YQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Subject: ARM hard-float linker path - consensus
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
X-List-Received-Date: Fri, 13 Apr 2012 18:20:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

FYI this will impact us in coming time. If someone has questions
please bring it up

---------- Forwarded message ----------
From: Steve McIntyre <steve.mcintyre@linaro.org>
Date: Fri, Apr 13, 2012 at 10:37 AM
Subject: ARM hard-float linker path - consensus
To: cross-distro@lists.linaro.org
Cc: libc-ports@sourceware.org, gcc-patches@gcc.gnu.org


Hi folks,

As promised, here's minutes from the call we had this
afternoon. Spoiler: the result we've agreed is

=C2=A0/lib/ld-linux-armhf.so.3

And here's a transcription of the minutes from

=C2=A0https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Meeting: 13th April 2012, 15:00 UTC

Agenda
------

=C2=A0* Debian/Ubuntu have so far built using /lib/arm-linux-gnueabihf/ld-l=
inux.so.3
=C2=A0* Some other distros (Fedora, OpenSUSE) are still using
/lib/ld-linux.so.3 option which matches the older soft-float ABI
=C2=A0* Some people are proposing /libhf/ld-linux.so.3 or
/libhfp/ld-linux.so.3 (multilib)
=C2=A0* Some people proposed /lib/ld-arm-linux-gnueabihf.so.3 (similar to
x86_64, libs still in /lib, from Michael Hope)
=C2=A0* What should we do as a community?

Present
-------

Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Affiliations

Steve McIntyre =C2=A0 =C2=A0 ARM, Debian, Linaro
Wookey =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARM, Debian, Linaro
Richard Earnshaw =C2=A0 ARM, gcc
Jeff Law =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fedora, Red Hat, gcc, glibc
Jon Masters =C2=A0 =C2=A0 =C2=A0 =C2=A0Fedora, Red Hat
Andrew Haley =C2=A0 =C2=A0 =C2=A0 Fedora, Red Hat, gcc
Andreas Jaeger =C2=A0 =C2=A0 SUSE, openSUSE, glibc
Carlos O'Donnell =C2=A0 Mentor, gcc
Steve Langasek =C2=A0 =C2=A0 Canonical, Ubuntu, Debian
Dann Frazier =C2=A0 =C2=A0 =C2=A0 Canonical, Ubuntu, Debian
Adam Conrad =C2=A0 =C2=A0 =C2=A0 =C2=A0Canonical, Ubuntu, Debian
Matthias Klose =C2=A0 =C2=A0 Canonical, Ubuntu, Debian
Mike Frysinger =C2=A0 =C2=A0 Gentoo
Dennis Gilmore =C2=A0 =C2=A0 Fedora, Red Hat

Discussion
----------

We started with a couple of questions up front to establish the
grounds for discussion:

=C2=A0* We believed that decision makers were present for all the important
=C2=A0 parties, i.e. all the arm hard-float distros, plus toolchain
=C2=A0 developers. This meant that a decision taken at the meeting could
=C2=A0 be implemented without needing further arguments/negotiations.

=C2=A0* All the people present understood the importance of cross-distro
=C2=A0 binary compatibility, and they all wanted it. This led to agreement
=C2=A0 that we needed to agree on a standard path for the runtime linker
=C2=A0 for ARM hard-float Linux binaries.

Debian and Ubuntu had so far been using the "multi-arch" path of
/lib/arm-linux-gnueabihf/ld-linux.so.3. Fedora and OpenSUSE were thus
far using /lib/ld-linux.so.3, the same as the soft-float ABI. Others
had proposed alternative paths such as /libhf/ld-linux.so.3 or
/libhfp/ld-linux.so.3 (multilib) or
/lib/ld-arm-linux-gnueabihf.so.3. Discussion showed that none of these
were found to be universally acceptable.

Two parties were likely to be soon affected by an agreement here:

1. Ubuntu 12.04 (releasing with armhf in ~2 weeks)

Adam/Steve L agreed that all efforts would be put in to switch the
compilers in Ubuntu to a new path before release. Default things like
gcc would be correct, but less common tools might still be targetting
the old path /lib/arm-linux-gnueabihf/ld-linux.so. at release. They
could be fixed in the longer term and would not stop progress here.

2. Mentor (Codebench due for release in ~1 week)

Carlos mentioned this - Codebench has been using /lib/ld-linux.so.3
for hard-float binaries for some time and it was too late to change
that for this upcoming release. Next release due in October. Suggested
and accepted that this should be mentioned in release notes: if people
want to use Codebench on some systems (Debian/Ubuntu and derivatives),
they'll need to tweak their system setup. He may be able to do the
linker change and rebuild in a point release in a few weeks.

It was briefly suggested that the soft-float linker should be renamed
away from /lib/ld-linux.so.3 as well at this time, but that idea was
quickly shot down.

Proposal #1: /lib/ld-armhf.so.3 =C2=A0 =C2=A0 =C2=A0 (not generally liked)

Proposal #2: /lib/ld-linux-armhf.so.3 (not favourite, but considered
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 an acceptable c=
ompromise by all)

No need to go any further.

Conclusion
----------

All the people in the meeting agreed: the new runtime linker path for
ARM hard-float Linux binaries was to be

/lib/ld-linux-armhf.so.3

ACTION: People at the meeting to present this decision to their
=C2=A0 =C2=A0 =C2=A0 =C2=A0companies / communities and get the appropriate =
changes made.

Further discussion
------------------

General unhappiness with the mess that led to this meeting. Future
planning needs to be better between the various groups for the next
time we have a new CPU/ABI/whatever.

ACTION: Jon Masters to talk to the Linux Foundation about setting up a
=C2=A0 =C2=A0 =C2=A0 =C2=A0forum for such discussions.

In the meantime, strong consensus to use the
cross-distro@lists.linaro.org mailing list for any more conversations
now we have people in contact.

ACTION: Steve McIntyre to write up the minutes and circulate. Include
=C2=A0 =C2=A0 =C2=A0 =C2=A0an updated linker path patch for gcc to match th=
e decision
=C2=A0 =C2=A0 =C2=A0 =C2=A0made here.

More discussion about triplets and naming, but nothing came of it in
the end. Distro folks have already decided what they're using and have
patched various software to build appropriately. Richard wants to move
gcc's config.guess to use arm-linux-gnueabihf; no strong objections to
that.

Linker path patch for gcc
-------------------------

Adapted from earlier work by Dann Frazier <dann.frazier@canonical.com>
and Michael Hope <michael.hope@linaro.org>

2012-04-13 Steve McIntyre <steve.mcintyre@linaro.org>

=C2=A0 =C2=A0 =C2=A0 * config/arm/linux-eabi.h (GLIBC_DYNAMIC_LINKER_HARD_F=
LOAT): Define.
=C2=A0 =C2=A0 =C2=A0 (GLIBC_DYNAMIC_LINKER): Redefine to use the hard float=
 path.

diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
index 80bd825..8c9d2e7 100644
--- a/gcc/config/arm/linux-eabi.h
+++ b/gcc/config/arm/linux-eabi.h
@@ -62,7 +62,11 @@
=C2=A0/* Use ld-linux.so.3 so that it will be possible to run "classic"
=C2=A0 =C2=A0GNU/Linux binaries on an EABI system. =C2=A0*/
=C2=A0#undef =C2=A0GLIBC_DYNAMIC_LINKER
-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.3"
+#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
+#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
+#define GLIBC_DYNAMIC_LINKER \
+ =C2=A0 "%{mfloat-abi=3Dhard:" GLIBC_DYNAMIC_LINKER_HARD_FLOAT "} \
+ =C2=A0 =C2=A0%{!mfloat-abi=3Dhard:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "}"

=C2=A0/* At this point, bpabi.h will have clobbered LINK_SPEC. =C2=A0We wan=
t to
=C2=A0 =C2=A0use the GNU/Linux version, not the generic BPABI version. =C2=
=A0*/


Post-meeting on IRC
-------------------

Suggested that Richard should push the change into gcc trunk
ASAP. Steve McIntyre agreed to work on that with Richard.

Also suggested that we want to get a patch into glibc too to change
the installation path for ARM hard-float. Andrew agreed to push glibc
upstream for that.

Cheers,
--
Steve McIntyre =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0steve.mcintyre@linaro.o=
rg
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs


