Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SS6Om-0000OI-KY
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 14:53:44 +0200
Received: by dalh21 with SMTP id h21so240429dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=rYwtAup6RpmxyvBXqrizWsXoHcW2bJdc0pq6DfWBa8o=;
	b=gBmuSzAj0/d2H+9yMOIT5SsmK60PaAAtgDPIUa0IUMT85CtT3cVt0koZTx3G5gQtup
	wTUDJe6JOlohEJ0ms+HV+x257rB3VFAh70Kr6wQkRGd8+e7vRUS7a6q1SYpduEukYOZR
	5Zu6h4G2mjTV15PtwJ4M+BZIy1TCdIIrmRi/t/MhSBZaeLhK7C/EqFhYl68i7k3t8+7J
	30zxw5j1X0rKdmy3E1Ewu4qlEw3v2fff2bplNY6s6DDCMO3wz6flIlMaHEcXIZYiE//k
	sOUHXZ8q032552VNrYCMwKnk23rdmp8h7w2aGxD8jtmzxx3aRjGmRWOl2FVKLidTgbPt
	+cAg==
MIME-Version: 1.0
Received: by 10.68.226.163 with SMTP id rt3mr8995696pbc.41.1336567431003; Wed,
	09 May 2012 05:43:51 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Wed, 9 May 2012 05:43:50 -0700 (PDT)
In-Reply-To: <20120509105803.GC12898@jama.jama.net>
References: <20120508151411.C836310218@opal>
	<20120509105803.GC12898@jama.jama.net>
Date: Wed, 9 May 2012 08:43:50 -0400
Message-ID: <CADkTA4MdYMfAiPbkkmNCHx+xc1Nyy5PR5ZyDJq3mfz9QXpP3Hg@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 May 2012 12:53:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 6:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, May 08, 2012 at 03:14:10PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 043871d7e5d2d19c2ff43e54d2ff180c09e8903e
>> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dc=
ommit;h=3D043871d7e5d2d19c2ff43e54d2ff180c09e8903e
>>
>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Date: =A0 Mon Apr 30 00:02:17 2012 -0400
>>
>> kern-tools: integrate minor fixes
>>
>> Updating the SRCREV to pick up two minor fixes:
>>
>> 1/2:
>> =A0 =A0 kgit-init: correct spelling of createme
>>
>> =A0 =A0 kgit-init copies the kern-tools scripts and intends to copy crea=
teme.
>>
>> =A0 =A0 The typo is in the usage() of updateme as well.
>>
>> =A0 =A0 Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
>>
>> 2/2:
>> =A0 =A0 kconf_check: fix bad quoting around missing_required.cfg
>>
>> =A0 =A0 missing_required.cfg won't have it's path truncated (if applicab=
le), since
>> =A0 =A0 the quoting it wrong.
>>
>> =A0 =A0 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> =A0 =A0 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> No idea if this is new issue or just old issue now revealed by those
> fixes, but linux-yocto-3.2 now fails to build for qemux86-64 (at
> least here).

It's an old issue, but the second patch I sent last night is the fix.

Bruce

>
> NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7efbcc=
fcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Starte=
d
> ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/qemux8=
6_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03=
827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.do_=
patch.32134 for further information)
> ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/qemux86=
_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f038=
27b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.do_p=
atch.32134
> Log data follows:
> | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/qemu=
x86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f=
03827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.d=
o_patch.32134 for further information)
> | WARNING: addon feature "features/netfilter" was not found
> | WARNING: addon feature "features/taskstats" was not found
> | WARNING: addon feature "cfg/sound" was not found
> | ERROR: required features were not found. aborting
> | ERROR. Could not update standard/default/common-pc-64/base
> NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7efbcc=
fcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Failed
>
> Cheers,
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


