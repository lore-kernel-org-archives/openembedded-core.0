Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOHzD-00072h-CR
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 02:27:35 +0200
Received: by lagw12 with SMTP id w12so1240507lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2012 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=pnGSiUt26ifIhJzeN9eK8otOBRu1vS+M0gYZIsqRCn8=;
	b=sA/S7crNT9OCqbONtgFwiXVcalB/cr96nBQkD+p3J5eN/2FtW4iquZ3ciU6veifklu
	kRNR/VF0r7NBL4pPWp40XNXzeIQerqte1y5mN0ghuU2UM4RlX0vUfmyK6phcYw9LtKYE
	HhcYok+Tf9m5bOFZ4lu77OBbJJSZIQ8mL+tIveHR+gtMjf9/xpoRAt20So2HPCt/dypM
	eDJc2Onr06/pfcnbdXVY7m73dHf6h6z/131dAaJbmYyJ/ujfnBx+6MgRQ9OcYGEedtns
	+sokV6c3HdNtZBNgJmoNqFf304aXhnnM0U8GDk1exjKJYVY1qPeYDFm0giG73wZ9qnzt
	0pag==
Received: by 10.152.111.198 with SMTP id ik6mr15382019lab.38.1335658675364;
	Sat, 28 Apr 2012 17:17:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 17:17:24 -0700 (PDT)
In-Reply-To: <20120426080523.GB3646@jama.jama.net>
References: <20120426080523.GB3646@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 17:17:24 -0700
Message-ID: <CAMKF1soM0ywKpxNKB_9OEeE2q7PV8khLzY8txu2UhF6T+D5fpw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Busybox complaining about missing applets
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
X-List-Received-Date: Sun, 29 Apr 2012 00:27:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2012 at 1:05 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> -mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40029000
> -set_tls(0x400294c0, 0x40029b98, 0x400e5048, 0x400294c0, 0x400e5048) =3D =
0
> -mprotect(0x4029f000, 8192, PROT_READ) =C2=A0 =3D 0
> -mprotect(0x40176000, 4096, PROT_READ) =C2=A0 =3D 0
> -mprotect(0x400e4000, 4096, PROT_READ) =C2=A0 =3D 0
> -munmap(0x40101000, 23779) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 0
> +mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40005000
> +set_tls(0x400054c0, 0x40005b98, 0x4006d048, 0x400054c0, 0x4006d048) =3D =
0
> +mprotect(0x401e5000, 8192, PROT_READ) =C2=A0 =3D 0
> +mprotect(0x4006c000, 4096, PROT_READ) =C2=A0 =3D 0
> +munmap(0x40033000, 23779) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 0
> =C2=A0getuid32() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0

thats where things start going south that one mprotect is failing


