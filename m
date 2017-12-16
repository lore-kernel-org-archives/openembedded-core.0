Return-Path: <wildman279@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E23060777
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Dec 2017 18:57:04 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id m20so657320lfi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Dec 2017 10:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=yptSU1R1BZ27dyllyOD2RiyefSgWhJkjmahTCfa+I1Q=;
	b=rYTALX1xeMEM7hPtOzDlt1JjNcMGGk7gQKAY9hFUTZgOveAVNkS35gVpdyNb9WiGNs
	s3PiLGWl+TU3q900+w8NAZeIVlLyANf+4xIPtTnaJaHX0wy5/eIrBdRbOSUJGm0I/1Hm
	0KqvMs8huoq9FJzdszM978squ5yYVaRF/hICrKvgNBU776PKdH+r6HoveJI3fHHwGwPJ
	QkXOoagwPHDlYceUR+A0lsD0TJejM8X4fd6mwQYOphKH23cCgeOSCeUsk9ofhjKmYjNm
	VkuoKWn50+/mqPWLFDqPZVZ0SHBTDx5dnxzBpwJSRS1DGYbyov1Reg5TPowh8T0j4rfE
	tSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=yptSU1R1BZ27dyllyOD2RiyefSgWhJkjmahTCfa+I1Q=;
	b=mVPdKcxmMFNVJWaNYQ90ZL5EVqpC1ckUacVg02My4P9NPJuKGzrEtPVdh7FiT+EF9e
	tT1y4ks4Ntkkeh191jPTLV6ltGcqXhB/KYY1WrEkhw3V1IIdIOAhwX2vjaPcC2gC7uw7
	QSwas4IVbJYWoEE0Gz+5/DDuGe5cBj4EuwpQ6VEdi78b6GiG5FrXYGVXpq8ISVL8cPvN
	+a8U7ONVGmR/m0cooFSfqCdsyX6l6jVCz/C5oocPntYdJ5mjV2WWQ4UfaRVZBQ7o/pT+
	Z/YthdBEmRtevqk2b8kaynl0vnxiryKmamA+rd9Vqb60QauOiqHq3Vcjp7f1ib0q8b2N
	S9xg==
X-Gm-Message-State: AKGB3mKPtiIx+5XezgtNq7wKuUSaAhx9Hjb6TlWmbeIGocKVCRVlK+lC
	N5R3r7B270e99aEZIcIDaTDShvOCMxbksbFiDZk=
X-Google-Smtp-Source: ACJfBothMcergEKPr1ZKA3YnW3vw6024jK71woC+fLIb2j6QoQS7OhSLwNEStPIcVP42DRrRCiHzdnCsWTYCB+va+eg=
X-Received: by 10.46.89.129 with SMTP id g1mr8800479ljf.12.1513450625592; Sat,
	16 Dec 2017 10:57:05 -0800 (PST)
MIME-Version: 1.0
Sender: wildman279@gmail.com
Received: by 10.179.26.109 with HTTP; Sat, 16 Dec 2017 10:57:05 -0800 (PST)
In-Reply-To: <CAJTo0LaCuoNPtTeKGqcvCsCMHqvLNq3w0U-RvhSg-dM-dmitTg@mail.gmail.com>
References: <20171212024917.14550-1-allenwild93@gmail.com>
	<1513068908.30397.2.camel@andred.net>
	<CAN33hf_0Y1=fCKmFYeCCZdVcEGyMjeUZHSkMzMiZP0z1VC5jmA@mail.gmail.com>
	<CAN33hf9ntsO=MfoRExd==qHBTV5h0tgkAZqZTzr9R-yQK5ZcUQ@mail.gmail.com>
	<CAJTo0LaCuoNPtTeKGqcvCsCMHqvLNq3w0U-RvhSg-dM-dmitTg@mail.gmail.com>
From: Allen Wild <allenwild93@gmail.com>
Date: Sat, 16 Dec 2017 13:57:05 -0500
X-Google-Sender-Auth: yb9krZLWx-5crNZtlBpbYuEyMjk
Message-ID: <CAN33hf9qNwzWRRayMQ-t_PqEceGZJpULEP-_UBUe-1xnbYJAUw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux: always use the BFD linker
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Dec 2017 18:57:05 -0000
Content-Type: multipart/alternative; boundary="001a114b37e0ec7195056079ae93"

--001a114b37e0ec7195056079ae93
Content-Type: text/plain; charset="UTF-8"

>   LD='${LD} -fuse-ld=bfd"

This doesn't work because the -fuse-ld option is only relevant when using
gcc as a wrapper for the linker.  The Makefile calls x86_64-oe-linux-ld
directly (which is a hardlink of x86_64-oe-linux-ld.gold or
x86_64-oe-linux-ld.bfd) so when the linker starts up it's already Gold,
rather than letting gcc call ld automatically.

Syslinux calls LD directly to use a custom linker script and avoids linking
with system libraries (not uncommon for bare-metal programs like a
bootloader). The -nostdlib gcc option can be used to get the same effect
when linking with gcc as a wrapper, but doing that involves patching many
syslinux makefiles to prefix LDFLAGS options with -Wl.

I have a working version of a patch that does this (19 changes in 15
makefiles), I can submit it here after some more testing if others think
it's an acceptable fix. I ignored the EFI targets for now, but such a patch
could be upstreamed after updating and testing the EFI code too.

>That's a terrible implementation of "install"

I agree, and I think that the fact that libgpl.elf and ldlinux.elf are
getting rebuilt at all means the current recipe violates upstream's "don't
recompile the bootloader itself" wishes in doc/distrib.txt. The tarball we
use includes shipped versions of those elf files and a bunch of c32 files,
but for some reason make is deciding to rebuild them from source when we
run make install. I haven't been able to determine why that's the case.

Allen

On Wed, Dec 13, 2017 at 6:53 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 13 December 2017 at 02:42, Allen Wild <allenwild93@gmail.com> wrote:
>
>> Oops, forgot mail the list when sending my first reply.
>>
>> I tried appending LDFLAGS, but it doesn't work for syslinux. It's
>> during do_install, not do_compile, that $(LD) is called directly to
>> link libutil.elf, libcom32.elf, libgpl.elf, and ldlinux.elf.
>>
>
> That's a terrible implementation of "install" and it should be using
> LDFLAGS, so that's an upstreamable patch.  As Andre says, adding the flag
> to LD directly should work.
>
> Ross
>

--001a114b37e0ec7195056079ae93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>&gt; =C2=A0 LD=3D&#39;${LD} -fuse-ld=
=3Dbfd&quot;<br><br></div>This doesn&#39;t work=20
because the -fuse-ld option is only relevant when using gcc as a wrapper
 for the linker.=C2=A0 The Makefile calls x86_64-oe-linux-ld directly (whic=
h=20
is a hardlink of x86_64-oe-linux-ld.gold or x86_64-oe-linux-ld.bfd) so when=
 the linker starts up=20
it&#39;s already Gold, rather than letting gcc call ld automatically.</div>=
<div><br></div>Syslinux
 calls LD directly to use a custom linker script and avoids linking with=20
system libraries (not uncommon for bare-metal programs like a=20
bootloader). The -nostdlib gcc option can be used to get the same effect=20
when linking with gcc as a wrapper, but doing that involves patching many s=
yslinux makefiles to prefix LDFLAGS options with -Wl.</div><div><br></div><=
div>I have a working version of a patch that does this (19 changes in 15 ma=
kefiles), I can submit it here after some more testing if others think it&#=
39;s an acceptable fix. I ignored the EFI targets for now, but such a patch=
 could be upstreamed after updating and testing the EFI code too.<br></div>=
<div><br></div><div>&gt;That&#39;s a terrible implementation of &quot;insta=
ll&quot;<br></div><br></div>I agree, and I think that the fact that libgpl.=
elf and ldlinux.elf are getting rebuilt at all means the current recipe vio=
lates upstream&#39;s &quot;don&#39;t recompile the bootloader itself&quot; =
wishes in doc/distrib.txt. The tarball we use includes shipped versions of =
those elf files and a bunch of c32 files, but for some reason make is decid=
ing to rebuild them from source when we run make install. I haven&#39;t bee=
n able to determine why that&#39;s the case.<br><div><div><br></div><div>Al=
len<br></div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Wed, Dec 13, 2017 at 6:53 AM, Burton, Ross <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><span class=3D"gmail-">On 13 December 2017 at 02:42, Allen=
 Wild <span dir=3D"ltr">&lt;<a href=3D"mailto:allenwild93@gmail.com" target=
=3D"_blank">allenwild93@gmail.com</a>&gt;</span> wrote:<br></span><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"gmail-"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Oops, forgot mail the list when =
sending my first reply.<br>
<br>
I tried appending LDFLAGS, but it doesn&#39;t work for syslinux. It&#39;s<b=
r>
during do_install, not do_compile, that $(LD) is called directly to<br>
link libutil.elf, libcom32.elf, libgpl.elf, and ldlinux.elf.<br></blockquot=
e><div><br></div></span><div>That&#39;s a terrible implementation of &quot;=
install&quot; and it should be using LDFLAGS, so that&#39;s an upstreamable=
 patch.=C2=A0 As Andre says, adding the flag to LD directly should work.</d=
iv><span class=3D"gmail-HOEnZb"><font color=3D"#888888"><div><br></div><div=
>Ross=C2=A0</div></font></span></div></div></div>
</blockquote></div><br></div></div></div></div>

--001a114b37e0ec7195056079ae93--
