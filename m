Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCvbr-00062z-GJ
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 18:20:31 +0200
Received: by lagw12 with SMTP id w12so1397225lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 09:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=T6ujQrgDUMO4FPMex16QbpK8kbRJra7Min7CYyMT93Y=;
	b=mzcPP7c9pXCy+LJD0VcbOko7I7ETCcJ6MMyKQT5WEWr1IZpkOT3nh9g6LEv586bzKA
	2DYGV6LEQXYstLWNVA3gYbPeCeVZhOD0gxxhoNdIBUw24TSj8SfjiaaDS2fiHaHtRZNa
	p/qyvTygl2d/dCmvxMbzRS40IMz5NiMuw3PboGZtRnfBHNqeu4ulM7kvEn/GhwbfEaO/
	cPdLLYdbwhMWqZrZF5PD8NBvqw8Ep3lgwOZAA1qCLlEXrF1XGg+UWsgdd12TeUzMdCcs
	Eyx/vGTGpU8gAfCOizamA47cYVm1Ad0ikXd83aMKY/FBnFqXtJmywYQWLdWoISDndwp9
	DbnQ==
Received: by 10.152.131.66 with SMTP id ok2mr23845438lab.10.1332951089101;
	Wed, 28 Mar 2012 09:11:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Wed, 28 Mar 2012 09:10:57 -0700 (PDT)
In-Reply-To: <20120328143347.GF4004@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted> <20120323131701.GF3879@jama.jama.net>
	<20120324022639.GF4604@jama.jama.net>
	<CAMKF1souotjH46PYsQYC8LKDfa2ABD4FsrpxEUvCPqic3PnW1A@mail.gmail.com>
	<20120328143347.GF4004@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Mar 2012 09:10:57 -0700
Message-ID: <CAMKF1sqr0RtpNny_aLEkrnLQYsCGPsZL4ZVK51tCoATHFKLKrQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] eglibc-2.15: Update SRCREV
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
X-List-Received-Date: Wed, 28 Mar 2012 16:20:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 7:33 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Mar 28, 2012 at 07:15:32AM -0700, Khem Raj wrote:
>> On Fri, Mar 23, 2012 at 7:26 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Fri, Mar 23, 2012 at 02:17:02PM +0100, Martin Jansa wrote:
>> >> On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
>> >> > On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
>> >> > > Get new patches and remove the one that got merged upstream
>> >> > >
>> >> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> > > ---
>> >> > > =C2=A0.../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch =C2=A0 =C2=
=A0| =C2=A0108 ++++++++++++++++++++
>> >> > > =C2=A0.../eglibc-2.15/armv4-eabi-compile-fix.patch =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 25 -----
>> >> > > =C2=A0.../eglibc/eglibc-2.15/initgroups_keys.patch =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 20 ++++
>> >> > > =C2=A0meta/recipes-core/eglibc/eglibc_2.15.bb =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +-
>> >> > > =C2=A04 files changed, 131 insertions(+), 27 deletions(-)
>> >> > > =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLR=
O_dl_debug_mask.patch
>> >> > > =C2=A0delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/arm=
v4-eabi-compile-fix.patch
>> >> > > =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ini=
tgroups_keys.patch
>> >> >
>> >> > Since 2.15 isn't the default I'm tempted to merge this despite the =
point
>> >> > we're at in the release cycle. I'd like to give anyone using this t=
he
>> >> > opportunity to comment first though.
>> >>
>> >> I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
>> >> x86-64) and will report tomorrow.
>> >
>> > Doesn't look related to this change, but I got interesing error on oth=
er
>> > buildhost (on mine everything seems fine sofar including tests on
>> > target), I don't have log from armv4t build on mine, because it's on t=
mpfs
>> > and there was unexpected reboot when I wasn't home :/.
>>
>> Hi Martin
>>
>> Does it look good for your testing ?
>
> Seems fine in runtime any hint about that build issue?
>
> Today I got another one :/
>
> "build-x86_64-oe-linux/shlib.lds:127: syntax error
> while building eglibc
>
> I had reports about this before, but wasn't able to reproduce it on my
> machine, today I got it for first time (maybe because of building with
> -j8 instead of -j4), so I've created simple testcase to compare interim
> outputs from shlib.lds creation:
> http://build.shr-project.org/tests/jama/shlib-issue/
>

yes I am aware of this problem. Somehow tokens in linker script
gets eaten up which results in unbalanced parens. I havent tracked
it down. I have seen this with eglibc 2.13 as well.

Are you using gold by any chance.

> Cheers,
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


