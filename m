Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id C933875A52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:17:22 +0000 (UTC)
Received: by iodv82 with SMTP id v82so35639073iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Qp+ZWYD5GWNqLJIcAlZ2tOISQnw7kzBnx6i3zUUlDsk=;
	b=bBNSnNGhgYKGf9whMvkfwIgyPCsKhevjhQoBwuKk0/q44jfcXPJZ4CUQJGSmx0/6Aa
	FmA+V1tGiIz3TaRMMD4/XBTCIlZ5f4+EgH3laUnxRthMS4srAWtANq5UajQZr/H5ok2z
	PGJEUfMtgy2XDAcHvLwZI4IHpLwTAxLHmVlhLSAnnt6iPjix7kaZcqOnQQjHZEb47YM6
	RO9+iQ9+dpGL6ACIPrEtVtm9Ute90RFstXfmB9tSJolESI86dZ7UxMYTrUUBjUd46hUp
	iYYsB/EYHnrtmI4xybCmEzbZxIrYotr2QSZZukn2w1zmZQgS3uoiia2xPHGxKSGODoRK
	I3tw==
X-Received: by 10.107.137.106 with SMTP id l103mr172691iod.112.1444771042827; 
	Tue, 13 Oct 2015 14:17:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 13 Oct 2015 14:16:53 -0700 (PDT)
In-Reply-To: <20151013140016.32f79928@seebs-worktop>
References: <20151013140016.32f79928@seebs-worktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Oct 2015 14:16:53 -0700
Message-ID: <CAMKF1sou00wtaW=5R4srchBMEswv4NZEJXfqT-rpoyV61p94xg@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc: 0041-handle-target-sysroot-multilib.patch maybe doesn't work for n32?
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
X-List-Received-Date: Tue, 13 Oct 2015 21:17:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 12:00 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> So, we have this shiny new patch which appears to correct paths for MIPS,=
 but
> when I try it with an n32 multilib, I get Very Strange failures.
>
> The actual failing line, from gcc -v:
>
> /msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec/mips64-=
oe-linux/gcc/mips64-oe-linux/5.2.0/collect2
> -plugin /msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec=
/mips64-oe-linux/gcc/mips64-oe-linux/5.2.0/liblto_plugin.so -plugin-opt=3D/=
msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec/mips64-oe-=
linux/gcc/mips64-oe-linux/5.2.0/lto-wrapper -plugin-opt=3D-fresolution=3D/t=
mp/ccSLbHqX.res -plugin-opt=3D-pass-through=3D-lgcc -plugin-opt=3D-pass-thr=
ough=3D-lgcc_s -plugin-opt=3D-pass-through=3D-lc -plugin-opt=3D-pass-throug=
h=3D-lgcc -plugin-opt=3D-pass-through=3D-lgcc_s --sysroot=3D/msp-lpggp22/se=
ebs/oemips/sysroots/mips32r2-oe-linux --build-id --eh-frame-hdr --hash-styl=
e=3Dsysv -EB -mips64 -dynamic-linker /lib64/ld.so.1 -melf32btsmipn32 -o h /=
msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32/crt1=
.o /msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32/=
crti.o /msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../li=
b32/mips64-oe-linux/5.2.0/32/crtbegin.o -L/msp-lpggp22/seebs/oemips/sysroot=
s/mips32r2-oe-linux/lib64/../lib32 -L/msp-lpggp
>  22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32/mips64-oe-=
linux/5.2.0/32 -L/msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/l=
ib64/mips64-oe-linux/5.2.0/32 -L/msp-lpggp22/seebs/oemips/sysroots/mips32r2=
-oe-linux/usr/lib64/../lib32 -L/msp-lpggp22/seebs/oemips/sysroots/x86_64-oe=
sdk-linux/usr/lib/mips64-oe-linux/gcc/mips64-oe-linux/5.2.0 -L/msp-lpggp22/=
seebs/oemips/sysroots/mips32r2-oe-linux/lib64 -L/msp-lpggp22/seebs/oemips/s=
ysroots/mips32r2-oe-linux/usr/lib64/mips64-oe-linux/5.2.0 -L/msp-lpggp22/se=
ebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64 /tmp/ccIHCMJV.o -lgcc --as-=
needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed =
/msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32/mip=
s64-oe-linux/5.2.0/32/crtend.o /msp-lpggp22/seebs/oemips/sysroots/mips32r2-=
oe-linux/usr/lib64/../lib32/crtn.o
> /msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec/mips64-=
oe-linux/gcc/mips64-oe-linux/5.2.0/real-ld: /msp-lpggp22/seebs/oemips/sysro=
ots/mips32r2-oe-linux/usr/lib64/../lib32/mips64-oe-linux/5.2.0/32/crtbegin.=
o: ABI is incompatible with that of the selected emulation
> [... and many more errors related to this
>
> So, looking around, I see three crtbegin.o in the sysroot:
> /usr/lib/mips-oe-linux/5.2.0/crtbegin.o
> /usr/lib64/mips64-oemllib64-linux/5.2.0/crtbegin.o
> /usr/lib32/mips64-oemllibn32-linux-gnun32/5.2.0/crtbegin.o
>
> And presumably, I want the gnun32 library. But what it actually picked wa=
s:
> /usr/lib64/../lib32/mips64-oe-linux/5.2.0/32/crtbegin.o
>
> And that's the 32-bit (base library) crtbegin.o.
>
> I am pretty sure that the gcc patch 0041 affects this but I honestly don'=
t
> entirely understand it.

also look at 0013-64-bit-multilib-hack.patch
this should not even look at bitness directories. I wonder why thats happen=
ing.

>
> -s
> --
> Listen, get this.  Nobody with a good compiler needs to be justified.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

