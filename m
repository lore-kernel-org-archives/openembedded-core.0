Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QUh9U-0002Rr-US
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:28:09 +0200
Received: by ywg8 with SMTP id 8so939949ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=IBCzp6JzLSexBAdbfZaKd+PRcBi/Hucv/1tNE9DKZ/w=;
	b=rGlWUcendS3+rPnGQMVw3H+jRr6siYzHJpfwOLPbC0rd0CJ1nX95CrePo9o0maAD7e
	a5A3m4Ofpqs7rstBpjErbl7Vy1NKgjerVdLN8BAYsTpAf4qrKfLAEuARsKWn/YpM4YGv
	EZFNtz3J6+sipPF+wFAnXLUqY26+ctgL3MUyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xa5cLXm4CnBu4JN0PGZYJqnpUim2fr69Y30hJdqUWwF+YFwlxCKNnIcC21Y6pm43vk
	Tg4eorVopfKtTlX3DYeMEj86vxkRm7F8lK1XfxdPLo2t2mURMjL0iTU2ObTv7u5JSPeP
	ycoUUcJ+vLZmXyd6C53uXBJNqnMqwwtHpPCCE=
MIME-Version: 1.0
Received: by 10.90.139.17 with SMTP id m17mr2112116agd.51.1307633087407; Thu,
	09 Jun 2011 08:24:47 -0700 (PDT)
Received: by 10.90.96.1 with HTTP; Thu, 9 Jun 2011 08:24:47 -0700 (PDT)
In-Reply-To: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
References: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
Date: Thu, 9 Jun 2011 11:24:47 -0400
Message-ID: <BANLkTik3Th6hbkg9jjipYOmjp83cWmssKw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: List of bbappends without matching recipes
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
X-List-Received-Date: Thu, 09 Jun 2011 15:28:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 9, 2011 at 11:15 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Hey,
>
> I ran bitbake layers on a stock angstrom setup and it reported a lot of '=
broken' bbappends:
>
> meta-intel:
> =A0/OE/tentacle/sources/meta-intel/meta-sugarbay/../common/recipes-core/i=
nitrdscripts/initramfs-live-install_1.0.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-crownbay/../common/recipes-core/i=
nitrdscripts/initramfs-live-install_1.0.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-jasperforest/../common/recipes-co=
re/initrdscripts/initramfs-live-install_1.0.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/lin=
ux-yocto_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/lin=
ux-yocto_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linu=
x-yocto_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/li=
nux-yocto_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux=
/linux-yocto_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-y=
octo_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/lin=
ux-yocto-stable_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linu=
x-yocto-stable_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/li=
nux-yocto-stable_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux=
/linux-yocto-stable_git.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-y=
octo-stable_git.bbappend

Don't these match the -stable (soon to be 2.6.34) kernel recipe ?

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/lin=
ux/linux-yocto-stable_git.bb

or maybe I'm just missing something, you did have 'broken' in
quotes :)

Cheers,

Bruce


> =A0/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-=
poky-standalone-gmae-sdk-target.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-graphics/xor=
g-xserver/xserver-xf86-dri-lite_1.9.3.bbappend
> =A0/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-=
poky-sdk-gmae.bbappend
>
> meta-smartphone:
> =A0/OE/tentacle/sources/meta-smartphone/meta-nokia/recipes-bsp/udev/udev_=
168.bbappend
>
> meta-nslu2:
> =A0/OE/tentacle/sources/meta-nslu2/recipes-core/images/slugos-image.bbapp=
end
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


