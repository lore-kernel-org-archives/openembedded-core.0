Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SVPiw-00054d-JF
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 18:08:14 +0200
Received: by eekd49 with SMTP id d49so850389eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=MmNLTesZRCQMuYnIxlnMMiYm5ALV7Eizfr1fftN2xUI=;
	b=jIy/O1WaeZ/3FyO1SARH8+yhW1w0YACzaFkIer2ti3wbolWTlrFQLnbrx3DM8varPB
	/dUv7XfFkuqnA0kSzWMdPjyNObaISXB+FUH6BvmywNIb8MoQiCf6d/PHGs0Eglz2mve+
	vvzbRNV3rHAyKFmOBF2h5y3aaW/uBUYFqk4ruex7uh3TS3i/eK6L22F5fM5UCVIlkKJl
	ROGk/8R148XYoCZP0ZlNYAq/Wbntu5CKci6ll5576SL2XOmq12MaS0zAmuM6Jb0+Legi
	6BJD/CC1qbBFweF3YLppO51NMbGYnfoOBmk2zh5k4G9KoNWbT3vBuLr7QOBj2G0dZwR7
	RFxg==
Received: by 10.213.9.140 with SMTP id l12mr3088904ebl.91.1337356690706; Fri,
	18 May 2012 08:58:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Fri, 18 May 2012 08:57:40 -0700 (PDT)
In-Reply-To: <lyfwaxfrf8.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyfwaxfrf8.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 May 2012 08:57:40 -0700
Message-ID: <CAMKF1srKRC+URZX8MEvTDx90224CLZCSuQ7NwMz_7QQsC=jD8Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gold and -flto option
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
X-List-Received-Date: Fri, 18 May 2012 16:08:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2012 at 8:19 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Hi,
>
> after enabling gold linker (ld-is-gold DISTRO_FEATURE), the '-flto
> -fuse-linker-plugin' build options do not work anymore as with the old
> bfd linker. =C2=A0I am using the toolchain layer of oe-meta.
>
> Is this expected or just some issue with our gcc?
>
>
> Enrico
>
> ---- with ld-is-gold ----
> $ arm-linux-gnueabi-gcc -flto -fuse-linker-plugin /tmp/x.c
> .../4.7.1/arm-linux-gnueabi-ld: -plugin: unknown option
> .../4.7.1/arm-linux-gnueabi-ld: use the --help option for usage informati=
on
>
> $ arm-linux-gnueabi-gcc --version
> arm-linux-gnueabi-gcc (GCC) 4.7.1 20120421 (prerelease)
> ...
>
> $ arm-linux-gnueabi-ld --version
> GNU gold (GNU Binutils 2.22) 1.11
>
>
> ---- without ld-is-gold ----
> $ arm-linux-gnueabi-gcc -flto -fuse-linker-plugin /tmp/x.c
> $
>
> $ arm-linux-gnueabi-ld --version
> GNU ld (GNU Binutils) 2.22
>

you need something like
https://lists.yoctoproject.org/pipermail/poky/2012-January/007488.html

this needs to go into OE-Core in some form.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


