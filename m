Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QLzVX-0006wI-My
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 17:14:55 +0200
Received: by gxk3 with SMTP id 3so1665014gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=RQIR809IQptI7cEPeemqP3KVDwbkgWCju2Nfi9jpopE=;
	b=nhUBJC4Jl0gHXbrjrDwDsR9ffh3rfZFDRq5JdohhBK9bMAyChELWR22wHQwxxqWyHp
	SIkcx4dxOve0+Lf5GivzT+F7clyceIyvN8NMNt80DS74ItrboyWpowjFPlnEtKS+vMUY
	lZHU3eTb0e2XYYmrrTz3wFbQ6AEn7b3yAzwsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fuYDD/Odl73taMCP8+8meOiKzVToq7Lo0Uh3VXGnPClWX2Pjcm414Qk6DDr1IABKJf
	iLzkDfjld5dEwjQnOqMslsDSE41l70YoyKBb+41sdqyIAnAfWVH2JD1ke0rGku1Q/7HB
	7ifSfLbtL/810wC0kmrUVOcGAMyeZkD74Ygao=
MIME-Version: 1.0
Received: by 10.91.43.1 with SMTP id v1mr3402999agj.130.1305558722875; Mon, 16
	May 2011 08:12:02 -0700 (PDT)
Received: by 10.90.7.20 with HTTP; Mon, 16 May 2011 08:12:02 -0700 (PDT)
In-Reply-To: <BANLkTi==buTZVpyhU3Kjf6ZTsNCL0XxAww@mail.gmail.com>
References: <BANLkTi==buTZVpyhU3Kjf6ZTsNCL0XxAww@mail.gmail.com>
Date: Mon, 16 May 2011 11:12:02 -0400
Message-ID: <BANLkTi=jFriBV+W=AFREdyo8nk0kYamBDA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Usage of linux (instead of linux-yocto) recipes
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
X-List-Received-Date: Mon, 16 May 2011 15:14:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 10:45 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> Is someone using =A0regular linux recipes with oe-core (or meta-oe)?

As far as I know, there's plenty of these, but they are in other layers
that are specific to other boards/distros/platforms.

Cheers,

Bruce

>
> --
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


