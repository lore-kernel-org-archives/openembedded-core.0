Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1zgL-0008HE-H2 for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 13:27:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RCJW1o027013
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:19:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26721-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:19:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RCJM54027007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:19:23 GMT
Message-ID: <1330345164.4593.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 12:19:24 +0000
In-Reply-To: <CALbNGRQU7BDK5WGYgaXbCwmki922wk_EBkBqZadLL5G=5pCPQA@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
	<CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
	<CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
	<6DB1E138-F4A8-432A-AB83-793B911CE68A@dominion.thruhere.net>
	<CALbNGRQU7BDK5WGYgaXbCwmki922wk_EBkBqZadLL5G=5pCPQA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q1RCJW1o027013
Subject: Re: [oe] gcc-cross-initial patching fails
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
X-List-Received-Date: Mon, 27 Feb 2012 12:27:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-27 at 12:37 +0100, Andreas M=C3=BCller wrote:
> On Thu, Feb 23, 2012 at 8:18 PM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
> >
> > Op 22 feb. 2012, om 22:39 heeft Andreas M=C3=BCller het volgende gesc=
hreven:
> >
> >> On Wed, Feb 22, 2012 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrot=
e:
> >>> On Wed, Feb 22, 2012 at 12:15 PM, McClintock Matthew-B29882
> >>> <B29882@freescale.com> wrote:
> >>>>> Applying patch gcc45-no-add-needed.patch
> >>>>> patching file gcc/config/alpha/elf.h
> >>>>> patching file gcc/config/ia64/linux.h
> >>>>> patching file gcc/config/linux.h
> >>>>> Hunk #1 succeeded at 89 (offset -12 lines).
> >>>>> patching file gcc/config/rs6000/sysv4.h
> >>>>> Hunk #1 FAILED at 908.
> >>>>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4=
.h
> >>>>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
> >>>>> ERROR: Function failed: patch_do_patch
> >>>>> ERROR: Logfile of failure stored in:
> >>>>> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr18=
1733/temp/log.do_patch.5367
> >>>>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch=
: Failed
> >>>>> ERROR: Task 2829
> >>>>> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/r=
ecipes-devtools/gcc/gcc-cross-initial_4.5.bb,
> >>>>> do_patch) failed with exit code '1'
> >>>>>
> >>>>> git log does not help me much -  what goes wrong?
> >>>>
> >>>> Which actual patch is it failing on? Is there a conflict between
> >>>> oe-core and meta-oe patch set against gcc?
> >>>
> >>> gcc45-no-add-needed.patch is the patch in question. I dont see
> >>> anything wrong with it.
> >>> Can you do bitbake -ccleanall gcc-cross-initial and redo bitbake
> >>> gcc-cross-initial -cpatch ?
> >>>
> >> FYI: I removed the line which came in by the commits I mentioned abo=
ve
> >>
> >> should_apply[vardepsexclude] +=3D "PN"
> >>
> >> in openembedded-core/meta/recipes-devtools/gcc/gcc-common.inc
> >>
> >> and build from scratch works without issues.
> >
> > I received reports of the same problem and I handed your fix to them,=
 I'm waiting to hear back.
> >
> Having some experience to this problem now, I have the feeling that
> there is some race condition on patching. I think gcc-cross-initial /
> gcc-cross-intermediate / gcc-runtime share same source directory -
> correct me if I am wrong. In case all start patching about the same
> time, the patches don't match for those being late. This theory is
> encouraged by the fact that the following sequence helps when building
> from scratch:
>=20
> 1. bitbake gcc-cross-initial
> 2. bitbake gcc-cross-intermediate
> 3. bitbake gcc-runtime
> 4. bitbake <my-image>

Does gcc-4.5 have different patch sets for any of the above?

Its now being assumed there is one good patch set shared by all the
recipes (since we're sharing the source directory). If that were not the
case it would explain the issues some people are reporting...

Cheers,

Richard



