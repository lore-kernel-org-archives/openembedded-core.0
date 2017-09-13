Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 980507865A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:33:39 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id r131so4412840itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PJ+2++2iRjPcqV867Y2fvdyS4IlhxbD/q9lta1BQEw8=;
	b=JPiQOjFBHZoTdHSxNoDCBwwW3prcgwKGHu3W3dJF/JAtCUWVhu0jy4zH6/dbVZP5kA
	6yHlcmeh3DkwCaUvvzo76GIqzrlUB7AWnzToB451bqzXhdizcb4txCKL5+Epkalkl6/t
	K3WC5jXL0oq8OdWA5DQ4WANeg1ej/zDR8vjKz/EMmPjkiXj2ZD9MyT5D+01+/MHseXUZ
	nvcmT26jCKu39eysSC7uQP7kzjqHAP25eZAtSSjginw8qjCmESOt7HoAnxQxsZARX5/B
	RSSDOggyKnE24gmcj3RwQwExtVUTm9CwdYGR84o+YdxG+zfYh3Gv+hObD0709x05/5R/
	Un4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PJ+2++2iRjPcqV867Y2fvdyS4IlhxbD/q9lta1BQEw8=;
	b=sPme2JoEJ6GAjYUmXIaYkKtRomiAXlJUVIj2khuv0UfpXY+Ch+/h8ywWjP0n89JooW
	g3WTrWwF+tDiRCnKx2Cz8ojKkwOX4mehv0AUxvgrfJtbCL0pbeI1813ufKZZR0cHh/zW
	TkuVDEt5yhiRpDdnrgBFl9LPV92OAJBUySsPhdozRROJU+Hu4uhkTC9Jus1QuFxcZOvM
	9dcC1dX1Y4DqI0nVOVldHPd8Hrz7jbvNKrYrSGqcEuvtJaeELDNjGWHLsm9TXuyk1Q2Z
	3gkPWO9cBzWFpvFhrV3GWAmJeam2zXdaP37kBqpj2ESp/RCGKn+K7fQsgkD1xNNZdWfe
	LJaA==
X-Gm-Message-State: AHPjjUjkAnkIXAEQssKYiXjTIS7QZ0m2cwLX0i3orj4O9Nyg2eqvzF68
	+HAf9KjSCUcv/Z/sZwIQMIP2uY7c2YFNZ3I9e/rH+w==
X-Google-Smtp-Source: AOwi7QC9D0VNsJmQ5eZNbZ+IfR6ciIqBn68qE6h645s2QpMg/2BWIlHH8e8f8zJszfKdbbZ4fAOepFUtgVrI9Myor+U=
X-Received: by 10.36.181.73 with SMTP id j9mr536566iti.6.1505313220445; Wed,
	13 Sep 2017 07:33:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 13 Sep 2017 07:33:19 -0700 (PDT)
In-Reply-To: <df4d255a017af31c177f2f6d19cf5724@iwavesystems.com>
References: <df4d255a017af31c177f2f6d19cf5724@iwavesystems.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Sep 2017 15:33:19 +0100
Message-ID: <CAJTo0LZ7G2easoj9mgdv7VjsE40_Zp8bF6WeMNnitYr2vGBexw@mail.gmail.com>
To: anjalik@iwavesystems.com
Cc: john@iwavesystems.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Matchbox in 240x320 LCD Display
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
X-List-Received-Date: Wed, 13 Sep 2017 14:33:39 -0000
Content-Type: multipart/alternative; boundary="f403045d9e42c7e6510559130b02"

--f403045d9e42c7e6510559130b02
Content-Type: text/plain; charset="UTF-8"

The default theme, fonts, padding etc all assume the screen has a higher
resolution than you have.  At one point there used to be a qvga theme but
that was dropped several years ago.  Making the font a lot smaller will
solve most of your problems, then you'll have to fix the remaining problems
one by one: as you can see the window decoration theme (the green bar) is
far too big at QVGA.

Ross

On 13 September 2017 at 15:15, <anjalik@iwavesystems.com> wrote:

> Hi,
>
>   Hope I m at the right place asking a query about matchbox in yocto.
>
>   I am using Yocto 1.8 which is working fine in a 640x480 LCD display
>
>   But I have few issues when the same BSP used in a 240x320 LCD display.
> All the images and fonts are enlarged .
>
>  Attaching few screnschots along with this mail.
>
>  Is there any constraints for matchbox to work on 240x320 display ?
>
>
>
> Awaiting for valuable suggestions.
>
> Thanks & Regards,
>
> Anjali
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--f403045d9e42c7e6510559130b02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The default theme, fonts, padding etc all assume the scree=
n has a higher resolution than you have.=C2=A0 At one point there used to b=
e a qvga theme but that was dropped several years ago.=C2=A0 Making the fon=
t a lot smaller will solve most of your problems, then you&#39;ll have to f=
ix the remaining problems one by one: as you can see the window decoration =
theme (the green bar) is far too big at QVGA.<div><br></div><div>Ross</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 13 Septe=
mber 2017 at 15:15,  <span dir=3D"ltr">&lt;<a href=3D"mailto:anjalik@iwaves=
ystems.com" target=3D"_blank">anjalik@iwavesystems.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div style=3D"font-size:10pt;font-famil=
y:Verdana,Geneva,sans-serif">
<p>Hi,</p>
<p>=C2=A0 Hope I m at the right place asking a query about matchbox in yoct=
o.</p>
<p>=C2=A0 I am using Yocto 1.8 which is working fine in a 640x480 LCD displ=
ay</p>
<p>=C2=A0 But I have few issues when the same BSP used in a 240x320 LCD dis=
play. All the images and fonts are enlarged .</p>
<p>=C2=A0Attaching few screnschots along with this mail.</p>
<p>=C2=A0Is there any constraints for matchbox to work on 240x320 display ?=
</p>
<p>=C2=A0</p>
<p>Awaiting for valuable suggestions.</p>
<p>Thanks &amp; Regards,</p>
<p>Anjali</p>
<div>=C2=A0</div>
</div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--f403045d9e42c7e6510559130b02--
