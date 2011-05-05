Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QHmKF-0000VU-17
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 02:21:51 +0200
Received: by gwb11 with SMTP id 11so652973gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 17:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=KAk8nu5JZ4TXfEbLP/GjaXMkypH71qn0/Oi37JdkeZU=;
	b=fQlh88zMTmT6bDCo2ycMqHGT4m7zzkvzU0B9I/PZ4TZgUOA7etq4kN1tGvVaUlQeGJ
	PVE44ZXEUrnip9KTq9CxJJ/Y2byTVd3TU3S85CFGZvg4Sv7eMlZxwJ2bAsk5+aycyaUC
	Jl18VwzR+v8vOfPBfaYRe59Ci5Y9SRnYoLatY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gksMUCZIyeLojed/vjvPa6PyruuNUMXqvIYqyBGzjUM5bkTCLo+Y/bv61xlMeRelyO
	gIO6XihbWpXNPfUOtguYAABwdxn68KBffNb00j7rdT+JWlLBX44rZbMzOvnpX+z49mR3
	cWyJyyppD/HP5IMWQ+Updmj/SxUUaQ4HXqufM=
MIME-Version: 1.0
Received: by 10.91.93.16 with SMTP id v16mr1381865agl.4.1304554751070; Wed, 04
	May 2011 17:19:11 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Wed, 4 May 2011 17:19:11 -0700 (PDT)
In-Reply-To: <20110504225617.GB9750@sakrah.homelinux.org>
References: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
	<BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
	<BANLkTimvDmHUpEHEVJ4oS4N9RUX0n8ndLA@mail.gmail.com>
	<BANLkTinyr-cj4BEWQ553AkSH4uoCmfETpA@mail.gmail.com>
	<20110504225617.GB9750@sakrah.homelinux.org>
Date: Wed, 4 May 2011 20:19:11 -0400
Message-ID: <BANLkTinBpNCWC4=V8xFPFd04LRwNRgpSvQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to patch yocto kernel
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
X-List-Received-Date: Thu, 05 May 2011 00:21:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2011 at 6:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (02/05/11 01:31), Bruce Ashfield wrote:
>> On Sun, May 1, 2011 at 11:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Sun, May 1, 2011 at 7:40 PM, Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
>> >> On Sun, May 1, 2011 at 9:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>> Hi
>> >>>
>> >>> I am trying to test this patch
>> >>>
>> >>> http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch
>> >>>
>> >>> to fix the build using gcc 4.6.0 but the kernel patching for yocto i=
s
>> >>> not as usual as other recipes
>> >>> since it uses entire set of tooling around it.
>> >>>
>> >>> I tried to look around for documentation and few references I found
>> >>>
>> >>> https://wiki.pokylinux.org/wiki/Wind_River_Kernel
>> >>>
>> >>> discourages putting patches in metadata. and in another document it
>> >>> says it uses git to do patching but does not explain how.
>> >>>
>> >>> So if someone can explain in simple terms how to patch a linux-yocto
>> >>> would be really helpful from a
>> >>> developer POV or any documentation will be helpful.
>> >>>
>> >>> How do people develop/test patches on linux-yocto I understand
>> >>> eventually they are desired to be part
>> >>> of linux-yocto git but that comes after they are tried and tested lo=
cally
>> >>>
>> >>> I would have preferred to have the usual SRC_URI patching atleast fo=
r
>> >>> local testing. As of now
>> >>> it seems not to use normal OE recipe procedures.
>> >>
>> >> Are you actually not =A0seeing this work ? I put in place compatibili=
ty
>> >> with existing patching via the SRC_URI for just this reason. A patch
>> >> specified in the SRC_URI will be picked up by the tools and applied
>> >> to the end of the BSP branch during the patching phase.
>> >>
>> >
>> > if it worked. I would not be writing this email :)
>>
>> :) you never know, I didn't see your error message so I didn't want
>> to presume.
>>
>> But I spoke too soon earlier, I had a bbappend in my layers that
>> meant I was modifying the wrong SRC_URI to have your patch
>> applied.
>>
>> When I modified the right SRC_URI like so:
>>
>> +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=3Dg=
it;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta\
>> + =A0 =A0 =A0 =A0 =A0 file://perf-tool-Fix-gcc-4.6.0-issues.patch"
>>
>> (i.e. the obvious way)
>>
>> I see the patch applied to the end of my BSP branch:
>>
>> > git branch
>> =A0 master
>> =A0 meta
>> =A0 yocto/base
>> =A0 yocto/eg20t
>> =A0 yocto/emgd
>> =A0 yocto/gma500
>> =A0 yocto/standard/arm-versatile-926ejs
>> =A0 yocto/standard/base
>> =A0 yocto/standard/beagleboard
>> =A0 yocto/standard/common-pc-64/base
>> =A0 yocto/standard/common-pc-64/jasperforest
>> =A0 yocto/standard/common-pc-64/sugarbay
>> =A0 yocto/standard/common-pc/atom-pc
>> * yocto/standard/common-pc/base
>>
>> commit 2500f7dc4d6c0d8b2f5ddad6369ee4541456533a
>> Author: Kyle McMartin <kyle@mcmartin.ca>
>> Date: =A0 Mon May 2 01:26:49 2011 -0400
>>
>> =A0 =A0 commit fb7d0b3cefb80a105f7fd26bbc62e0cbf9192822 upstream.
>>
>> =A0 =A0 GCC 4.6.0 in Fedora rawhide turned up some compile errors in too=
ls/perf
>> =A0 =A0 due to the -Werror=3Dunused-but-set-variable flag.
>>
>> =A0 =A0 I've gone through and annotated some of the assignments that had=
 side
>> =A0 =A0 effects (ie: return value from a function) with the __used annot=
ation,
>> =A0 =A0 and in some cases, just removed unused code.
>>
>> =A0 =A0 In a few cases, we were assigning something useful, but not usin=
g it in
>> =A0 =A0 later parts of the function.
>>
>> =A0 =A0 kyle@dreadnought:~/src% gcc --version
>> =A0 =A0 gcc (GCC) 4.6.0 20110122 (Red Hat 4.6.0-0.3)
>>
>> =A0 =A0 Cc: Ingo Molnar <mingo@redhat.com>
>> =A0 =A0 LKML-Reference: <20110124161304.GK27353@bombadil.infradead.org>
>> =A0 =A0 Signed-off-by: Kyle McMartin <kyle@redhat.com>
>> =A0 =A0 [ committer note: Fixed up the annotation fixes, as that code
>> moved recently ]
>> =A0 =A0 Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>> =A0 =A0 [Backported to 2.6.38.2 by deleting unused but set variables]
>> =A0 =A0 Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
>> =A0 =A0 Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
>> =A0 =A0 [Backported to linux-yocto kernel git version]
>> =A0 =A0 Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> I did modify the patch format slightly, since git am needs to be able to
>> grok the patch for it to apply.
>>
>> Did you get any sort of error message when your patch didn't apply ?
>
> When I did a build from scratch then it worked fine. Have you already
> taken this patch in ? if not what needs to be done ?

Great! I haven't merged it, since I was more concerned that you were
potentially having trouble with the patching.

Now that we know it is sane and you aren't having trouble, I'll do the
merge and it will appear shortly. Nothing else from you should be
required.

Cheers,

Bruce

>
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


