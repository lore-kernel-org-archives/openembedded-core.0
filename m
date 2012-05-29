Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SZTbP-0004GG-L8
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 23:05:15 +0200
Received: by yenl13 with SMTP id l13so2548235yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=awmGFu1GkxmyCh5766DS/Y1qj6WIOD5vjE8u6S/+q4c=;
	b=K+1ZPbLPGdiYp0QsP38ya6zNmaj8dWJTEeFHwrPA0Ef/a1CWY6WBsjfw12Bxq0h+ou
	wxyJfp3h2iDV4icak7td5jexwAKH+1pCYfFu7n5quIKEyTz2jbVpnCeWYDmO7ZoqoK7x
	B2O/hNkLHI4e+KlQ+17nfGypnMoYMyZknBItB5PVHeo2xuhWy8jZScY6HkQr7RDK+IBl
	SI8iM1WWPnuW9qDHMFC5qyTum/wjm+8K24SAotZBesItH0ykqWUhUn/1VHjBghpj+jQn
	or4KukI4cI5TaOzFt9sfOGY1ev5gMkZSL3gGK7PrWFSW114fEzK0aVqep/aUO4NauPNo
	3RzQ==
MIME-Version: 1.0
Received: by 10.50.6.197 with SMTP id d5mr8305223iga.44.1338324896976; Tue, 29
	May 2012 13:54:56 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Tue, 29 May 2012 13:54:56 -0700 (PDT)
In-Reply-To: <10E43685-CA73-4A70-8890-E8CC780CD034@gmail.com>
References: <10E43685-CA73-4A70-8890-E8CC780CD034@gmail.com>
Date: Tue, 29 May 2012 15:54:56 -0500
Message-ID: <CAAB-1yxMsokKyO-EDfsboGW6Zdp3TakzRqQj6mWUTLAXq25dVA@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: meta-xilinx: Which version of the linux kernel?
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
X-List-Received-Date: Tue, 29 May 2012 21:05:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

The kernel version used at the time that I verify that everything was
working out off box
was 2.6.37, set in recipe

PV =3D "2.6.37+git-${SRCPV}"

I will recheck that later, since now there is newer kernel versions availab=
le
from git.xilinx.com

Regards

On Tue, May 29, 2012 at 3:45 PM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> Hi Adrian,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Could you please tell me which ver=
sion of the linux kernel, the meta-xilinx layer was tested against, using I=
SE 12.1?
>
> At the moment I get an error because no version number is specified for t=
he kernel recipe, so I think I have to rename it to something like say linu=
x-xilinx-3.2.bb or linux-xilinx-2.6.38.bb.
>
> Here is an output of the errors that I get when trying to bitbake meta-to=
olchain:
>
> $ bitbake meta-toolchain
> Pseudo is not present but is required, building this first before the mai=
n build
> NOTE: Error expanding variable pkg_postinst_kernel-base =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| ETA: =A0--:--:--
> NOTE: Error during finalise of /tool/yocto/meta-xilinx/recipes-kernel/lin=
ux/linux-xilinx_git.bb
> ERROR: Failure expanding variable KERNEL_PRIORITY, expression was ${@int(=
d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 + =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int(d.getVar('PV',1).split('-')[=
0].split('+')[0].split('.')[1]) * 100 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1]=
)} which triggered exception ValueError: invalid literal for int() with bas=
e 10: 'git'
> ERROR: Command execution failed: Traceback (most recent call last):
> =A0File "/tool/yocto/poky/bitbake/lib/bb/command.py", line 84, in runAsyn=
cCommand
> =A0 =A0self.cooker.updateCache()
> =A0File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1202, in update=
Cache
> =A0 =A0if not self.parser.parse_next():
> =A0File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1671, in parse_=
next
> =A0 =A0self.virtuals +=3D len(result)
> UnboundLocalError: local variable 'result' referenced before assignment
>
>
> Best regards,
>
> Elvis Dowson



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com


