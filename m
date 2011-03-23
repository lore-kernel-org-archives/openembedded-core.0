Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2Dyd-0006mF-2Q
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 03:39:15 +0100
Received: by fxm19 with SMTP id 19so7147645fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 19:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=NwjByF2lIv7sfdtrQsspSq1HQCuuIMOt8MIjYZwGBcc=;
	b=heQA+8cBdzRH3C/T8EfdOyL/Q7z48Tz0HhP7JKgh9NJRJqgeN3Jrw+ykxxdNDVpdre
	y0KKoaq27owWihzAc/3lb39o7g8yO3cg1dyh1POxZXO+jUjx/2vr3XJNoiie5gTh4vy5
	o4PteC5HlTN8TIswIEjsWZvqyZO/1jThll9yw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=aPtxwXl/etnaWHCaZjAN7OvDYDecCr9up3TAayRCwf0koO+P6CD3Zy03CrnFPIg0RG
	hF3VbSa/Siw3hIiH1qeZ4FXQ09NCkqQQv8/LnMD5XPGXBi/A7HlGsnp2/Gh2QxcR1pEn
	SzDl/KIgkUmeBpxNgyQKzNdeXKBgWSt41A1Rs=
Received: by 10.223.110.4 with SMTP id l4mr15288fap.125.1300846006142; Tue, 22
	Mar 2011 19:06:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Tue, 22 Mar 2011 19:06:15 -0700 (PDT)
In-Reply-To: <4D893C24.5060002@intel.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
	<1300730833.30423.3993.camel@rex> <4D893C24.5060002@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Mar 2011 19:06:15 -0700
Message-ID: <AANLkTi=BbD-3bwqxf1CHj3UZP0USyWAf625gKBz6CJjn@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Upgrade qemu to 0.14.0
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
X-List-Received-Date: Wed, 23 Mar 2011 02:39:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 5:17 PM, Zhai, Edwin <edwin.zhai@intel.com> wrote:
>
>
> Richard Purdie wrote:
>>
>> On Thu, 2011-03-17 at 11:52 -0700, Khem Raj wrote:
>> > This patchset upgrades qemu in oe-core to 0.14.0
>> > The script fixes are done to cope for a bug in 0.14.0
>> > as well as to get past a console spawning problem for non-nfs image
>> > boots
>> >
>> >
>> > Pull URL: git://git.openembedded.org/openembedded-core-contrib
>> > =C2=A0 Branch: kraj/qemu-update
>> > =C2=A0 Browse:
>> > http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dkraj/qemu-update
>> >
>> > Thanks,
>> > =C2=A0 =C2=A0 Khem Raj <raj.khem@gmail.com>
>> > ---
>> >
>> >
>> > Khem Raj (5):
>> > =C2=A0 qemu: Upgrade 0.13.0 -> 0.14.0
>>
>> With this change, I'm just doing some checks that certain things work,
>> its still in my pending queue.
>>
>
> Khem,
> Thanks for your works on qemu upgrade!
> Following patches are dropped. 2&3 exist for a pretty long time, I'm not
> sure. But any reason to drop ppc-hack.patch?
> qemu-ppc-hack.patch

This has been fixed upstream a bit differently.

> fix-dirent.patch

Its already applied upstream

> workaround_bad_futex_headers.patch

this is already applied upstream if you see then currently we apply it
so we have the values defined twice

>
> For new added patches, it's better to have a simple description including
> upstream commit log if have.
> larger_default_ram_size.patch: Why pick up 384? 256 or 512 seems to be mo=
re
> reasonable.
>

these are patches I took from debian/ubuntu only larger_default_ram_size.pa=
tch
does not have description others have references. Probably we can drop
this patch
Its there if we want to boot fully blown images like desktop distros
do 128M is little
less. 384 is still minimum since people might not have that much ram to spa=
re
on host machines I guess.

> I assume simple tests across all platform(x86/x86-64/arm/ppc/mips) was do=
ne,
> right:)

yes I booted all qemu  images.

>
>
>> > =C2=A0 qemu.inc: Add sh4,sh4eb,mips64,mips64el targets
>>
>> For this, I'd like to make the list of targets a separate variable. I'm
>> happy with your default for OECore, I might take out some of the arches
>> for Yocto/Poky.
>>
>> > =C2=A0 lib/oe/patch.py: Cosmetic change to avoid bitbake warning
>> > =C2=A0 scripts/poky-qemu-internal: Pass -m <mem_size> always on comman=
dline
>> > =C2=A0 scripts/poky-qemu-internal: Add rw to KERNCMDLINE for non nfs b=
oots
>>
>> I merged these, thanks.
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


