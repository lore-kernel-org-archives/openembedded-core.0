Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QH1S3-0000EE-Fe
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 00:18:47 +0200
Received: by eye27 with SMTP id 27so1888840eye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 15:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=sNRnY2VxsyTNLWvdCOkXXOSL+BVQtRbiQ1UAsVJzkZU=;
	b=GQzpLlNsHnan6FLHgxv3vNaUIrnZlpHaXaIeuHZT33krD13HpfA5iDiipJ5DfcClv+
	L816+lgefoEqcFgn8u3ckSuIe0zcaRKjNOfRN4ZnOExdo2TG/VMifjtkbPX13S33MP9x
	MDt7N5p3YxX0p33qj3EhPcg6e3iOIliVzw6cQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Ai9n+BbGtRtA8ZXLEsGRFwDGPCXUEuGakIH46nrxcu67MRG0SfMiRrAkIJD7HyZ/qy
	6OtupHvtbh0wjzPxFzVeCNfPhtw92Pn8NAaRRSVfii/s6mo7+LKf8phFU51GyVspjBAn
	WeZVL6CPe3ENSTzYA6ONObQC2acImkV6/z2DM=
Received: by 10.14.34.88 with SMTP id r64mr3513028eea.77.1304374569349; Mon,
	02 May 2011 15:16:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Mon, 2 May 2011 15:15:39 -0700 (PDT)
In-Reply-To: <BANLkTinyr-cj4BEWQ553AkSH4uoCmfETpA@mail.gmail.com>
References: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
	<BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
	<BANLkTimvDmHUpEHEVJ4oS4N9RUX0n8ndLA@mail.gmail.com>
	<BANLkTinyr-cj4BEWQ553AkSH4uoCmfETpA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2011 15:15:39 -0700
Message-ID: <BANLkTinbvBtPZ-8e9bycgTrkbhyi5pyaUg@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 May 2011 22:18:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 1, 2011 at 10:31 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sun, May 1, 2011 at 11:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sun, May 1, 2011 at 7:40 PM, Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
>>> On Sun, May 1, 2011 at 9:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> Hi
>>>>
>>>> I am trying to test this patch
>>>>
>>>> http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch
>>>>
>>>> to fix the build using gcc 4.6.0 but the kernel patching for yocto is
>>>> not as usual as other recipes
>>>> since it uses entire set of tooling around it.
>>>>
>>>> I tried to look around for documentation and few references I found
>>>>
>>>> https://wiki.pokylinux.org/wiki/Wind_River_Kernel
>>>>
>>>> discourages putting patches in metadata. and in another document it
>>>> says it uses git to do patching but does not explain how.
>>>>
>>>> So if someone can explain in simple terms how to patch a linux-yocto
>>>> would be really helpful from a
>>>> developer POV or any documentation will be helpful.
>>>>
>>>> How do people develop/test patches on linux-yocto I understand
>>>> eventually they are desired to be part
>>>> of linux-yocto git but that comes after they are tried and tested loca=
lly
>>>>
>>>> I would have preferred to have the usual SRC_URI patching atleast for
>>>> local testing. As of now
>>>> it seems not to use normal OE recipe procedures.
>>>
>>> Are you actually not =C2=A0seeing this work ? I put in place compatibil=
ity
>>> with existing patching via the SRC_URI for just this reason. A patch
>>> specified in the SRC_URI will be picked up by the tools and applied
>>> to the end of the BSP branch during the patching phase.
>>>
>>
>> if it worked. I would not be writing this email :)
>
> :) you never know, I didn't see your error message so I didn't want
> to presume.
>
> But I spoke too soon earlier, I had a bbappend in my layers that
> meant I was modifying the wrong SRC_URI to have your patch
> applied.
>
> When I modified the right SRC_URI like so:
>
> +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=3Dgi=
t;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perf-tool-Fix-gcc-4.6.0-issue=
s.patch"
>
> (i.e. the obvious way)
>
> I see the patch applied to the end of my BSP branch:
>
>> git branch
> =C2=A0master
> =C2=A0meta
> =C2=A0yocto/base
> =C2=A0yocto/eg20t
> =C2=A0yocto/emgd
> =C2=A0yocto/gma500
> =C2=A0yocto/standard/arm-versatile-926ejs
> =C2=A0yocto/standard/base
> =C2=A0yocto/standard/beagleboard
> =C2=A0yocto/standard/common-pc-64/base
> =C2=A0yocto/standard/common-pc-64/jasperforest
> =C2=A0yocto/standard/common-pc-64/sugarbay
> =C2=A0yocto/standard/common-pc/atom-pc
> * yocto/standard/common-pc/base
>
> commit 2500f7dc4d6c0d8b2f5ddad6369ee4541456533a
> Author: Kyle McMartin <kyle@mcmartin.ca>
> Date: =C2=A0 Mon May 2 01:26:49 2011 -0400
>
> =C2=A0 =C2=A0commit fb7d0b3cefb80a105f7fd26bbc62e0cbf9192822 upstream.
>
> =C2=A0 =C2=A0GCC 4.6.0 in Fedora rawhide turned up some compile errors in=
 tools/perf
> =C2=A0 =C2=A0due to the -Werror=3Dunused-but-set-variable flag.
>
> =C2=A0 =C2=A0I've gone through and annotated some of the assignments that=
 had side
> =C2=A0 =C2=A0effects (ie: return value from a function) with the __used a=
nnotation,
> =C2=A0 =C2=A0and in some cases, just removed unused code.
>
> =C2=A0 =C2=A0In a few cases, we were assigning something useful, but not =
using it in
> =C2=A0 =C2=A0later parts of the function.
>
> =C2=A0 =C2=A0kyle@dreadnought:~/src% gcc --version
> =C2=A0 =C2=A0gcc (GCC) 4.6.0 20110122 (Red Hat 4.6.0-0.3)
>
> =C2=A0 =C2=A0Cc: Ingo Molnar <mingo@redhat.com>
> =C2=A0 =C2=A0LKML-Reference: <20110124161304.GK27353@bombadil.infradead.o=
rg>
> =C2=A0 =C2=A0Signed-off-by: Kyle McMartin <kyle@redhat.com>
> =C2=A0 =C2=A0[ committer note: Fixed up the annotation fixes, as that cod=
e
> moved recently ]
> =C2=A0 =C2=A0Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> =C2=A0 =C2=A0[Backported to 2.6.38.2 by deleting unused but set variables=
]
> =C2=A0 =C2=A0Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
> =C2=A0 =C2=A0Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> =C2=A0 =C2=A0[Backported to linux-yocto kernel git version]
> =C2=A0 =C2=A0Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I did modify the patch format slightly, since git am needs to be able to
> grok the patch for it to apply.
>
> Did you get any sort of error message when your patch didn't apply ?
>

yes it would not apply the patch and instead complained it could not
checkout a branch because tree was dirty
I dont have exact message handy. I will see if I can reproduce it

> Cheers,
>
> Bruce
>
>>
>>> It has definitely worked during all the development cycles, so if you
>>> are seeing it not work, it's a bug and I'll fix it.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>>
>>>> Thanks
>>>> -Khem
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


