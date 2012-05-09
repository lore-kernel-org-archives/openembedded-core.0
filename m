Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SS6ib-0002KF-30
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 15:14:13 +0200
Received: by dalh21 with SMTP id h21so259908dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gIOzHr+ew1TKEyK8v9RUqkrZTlIhUlU7ekz+FKyTrjw=;
	b=jP33Izc6JnvFP3hf/nKUgj9EIExLFl/dHtddGmZ0T6y/M+62NDpbcNFJrIs7K/8X2H
	X1q/BoRM6xb/8D3hKZoQg2xr44Hyqm49bfOW7e/hF2/tgd+1jbCItesar55eQNK6JdaH
	oh2A1i6K2gOUWNYzAkUz9hQ3FrsR+jFAcZcnQvU0DJLvnMek/JPsTsVpRxZpOM/kz6vt
	fnINN5za5t4QgGQYDNZBAqpScynglO2qnNZZ3CeYzojNcIi7z0ztcegFyOGkIMGiJp64
	PK+eSlxaZWiLlegsULPKwvezKM7hTqoPH6aWh8FoLGGtgD135y9Gd7VVSf+rZr2oMN8t
	MaGw==
MIME-Version: 1.0
Received: by 10.68.241.37 with SMTP id wf5mr8781721pbc.104.1336568659392; Wed,
	09 May 2012 06:04:19 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Wed, 9 May 2012 06:04:19 -0700 (PDT)
In-Reply-To: <20120509125548.GE12898@jama.jama.net>
References: <20120508151411.C836310218@opal>
	<20120509105803.GC12898@jama.jama.net>
	<CADkTA4MdYMfAiPbkkmNCHx+xc1Nyy5PR5ZyDJq3mfz9QXpP3Hg@mail.gmail.com>
	<20120509125548.GE12898@jama.jama.net>
Date: Wed, 9 May 2012 09:04:19 -0400
Message-ID: <CADkTA4O=UxyQ8+KOWXNaXHU2dVBvds=aTeo7jcjyRNWaAPug6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: integrate minor fixes
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
X-List-Received-Date: Wed, 09 May 2012 13:14:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, May 09, 2012 at 08:43:50AM -0400, Bruce Ashfield wrote:
>> On Wed, May 9, 2012 at 6:58 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > On Tue, May 08, 2012 at 03:14:10PM +0000, git@git.openembedded.org wro=
te:
>> >> Module: openembedded-core.git
>> >> Branch: master
>> >> Commit: 043871d7e5d2d19c2ff43e54d2ff180c09e8903e
>> >> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3D043871d7e5d2d19c2ff43e54d2ff180c09e8903e
>> >>
>> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> Date: =A0 Mon Apr 30 00:02:17 2012 -0400
>> >>
>> >> kern-tools: integrate minor fixes
>> >>
>> >> Updating the SRCREV to pick up two minor fixes:
>> >>
>> >> 1/2:
>> >> =A0 =A0 kgit-init: correct spelling of createme
>> >>
>> >> =A0 =A0 kgit-init copies the kern-tools scripts and intends to copy c=
reateme.
>> >>
>> >> =A0 =A0 The typo is in the usage() of updateme as well.
>> >>
>> >> =A0 =A0 Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
>> >>
>> >> 2/2:
>> >> =A0 =A0 kconf_check: fix bad quoting around missing_required.cfg
>> >>
>> >> =A0 =A0 missing_required.cfg won't have it's path truncated (if appli=
cable), since
>> >> =A0 =A0 the quoting it wrong.
>> >>
>> >> =A0 =A0 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> >> =A0 =A0 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >>
>> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >
>> > No idea if this is new issue or just old issue now revealed by those
>> > fixes, but linux-yocto-3.2 now fails to build for qemux86-64 (at
>> > least here).
>>
>> It's an old issue, but the second patch I sent last night is the fix.
>
> This one?
> http://patchwork.openembedded.org/patch/27337/

Yep. I built several hundred (no exaggeration) qemu* builds with the series=
 in
place, and of course, my meta SRCREV always matches the head of the
meta branch, so that never triggered.

A clean build works here for all boards with that in place.

If that doesn't fix it for you .. I'll definitely want to hear.

Bruce

>
> Thanks
>
>>
>> Bruce
>>
>> >
>> > NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7ef=
bccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Sta=
rted
>> > ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/qem=
ux86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3=
f03827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.=
do_patch.32134 for further information)
>> > ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/qemu=
x86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f=
03827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.d=
o_patch.32134
>> > Log data follows:
>> > | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/q=
emux86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649=
f3f03827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/lo=
g.do_patch.32134 for further information)
>> > | WARNING: addon feature "features/netfilter" was not found
>> > | WARNING: addon feature "features/taskstats" was not found
>> > | WARNING: addon feature "cfg/sound" was not found
>> > | ERROR: required features were not found. aborting
>> > | ERROR. Could not update standard/default/common-pc-64/base
>> > NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7ef=
bccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Fai=
led
>> >
>> > Cheers,
>> >
>> > --
>> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


