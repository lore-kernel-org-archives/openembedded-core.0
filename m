Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D4E6074D2B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 12:41:01 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id o11-v6so52989wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ruLuvRtiKMwcIgPqPAYWKkewGKD+zKRpMowXW2wrXaQ=;
	b=sqreJUAUBRD+TZNWUDSZl4wOdmoNISMJ+OLRoe7rSIbh7T+oeHtp9U9zgUdLdYtQ7u
	kaowCH+7rVvpKlJm7Z6OREKgyaI9AYS9i4WyXooO+aAFrOYsw0DmE/jiXV7VfPa9BTPs
	7CKP2gr1/mj6o+rfvSneT7J2uCyJihwyEujPdIEV1pP2dfGdC+o8bR6hYTtyaQx27SbS
	e4ut7f41UdIu3rKvHswonqd8QTpDRaEBOMILkycIxXl0SGIwz/eps4NgCAIpYUfFCwRb
	qZBG6R5NIY9L5Y4Uk1Q6g1FFb13ToG/w1WktRH8rmS5MwLUd6mQ88Sanah9NyVbGEkYO
	Sdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ruLuvRtiKMwcIgPqPAYWKkewGKD+zKRpMowXW2wrXaQ=;
	b=nIVyoMVlF1tjS7CobzjqsLNlqe6aOsHQXqWng1ufXmXFlKpqol9DJyP+W9M8epewQe
	qNvVhKxh7MlB3yMQe1kMRRaVp4c1AikngJsnvf5D0UEPCzzbO4ohS6VmLAMJvsUH7Cud
	Vs3Tl13FP4VZglm8LjWWN6Rm6TTv8QBs2pICc4UzAooJcbgopTVJE2yjA6iSstFUqwS2
	cW9X3tRPpu/ja9J/LAU8wo/4xROpaDByR0H7MIm5AaMUzpJPVVObQBxYWHxk1QkbsY58
	GPc3R8UzHrVvmK9vw291SewQ56yjtAIXf1EIagUcSYyxIkshs8tp/31QPRKjyL3s9PRt
	IGog==
X-Gm-Message-State: AOUpUlER9PwF7QuYuAKgJbXXRYdHtfcoBt4aaKg9Ndg/yHK//3Wymgqq
	bNL3HSsM8M7e27ijXpgnwKYiw7WzLuv6uAeZCiE=
X-Google-Smtp-Source: AA+uWPwvL2Xs34rdy87exsOdR6Xt1v5vxjQ349ZbOzgowtMr6Bb6vMq+0zFr5IbQTtUV1unqLa+FpIa0SvqZCYlkNa8=
X-Received: by 2002:a1c:b484:: with SMTP id
	d126-v6mr1540684wmf.17.1533818462403; 
	Thu, 09 Aug 2018 05:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0EZ05doNyBhkT6v3K4ibTVp5wtXJ2zY9YwYWGri_n5QOw@mail.gmail.com>
In-Reply-To: <CADySD0EZ05doNyBhkT6v3K4ibTVp5wtXJ2zY9YwYWGri_n5QOw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Aug 2018 14:40:53 +0200
Message-ID: <CA+chaQc0jpZx+43G-1SGQuahPksikGQteo4c=c9dDTsspBQM9w@mail.gmail.com>
To: ankur.tyagi85@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to upgrade Qt modules in daisy branch
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
X-List-Received-Date: Thu, 09 Aug 2018 12:41:02 -0000
Content-Type: multipart/alternative; boundary="0000000000009a02500572fff030"

--0000000000009a02500572fff030
Content-Type: text/plain; charset="UTF-8"

For daisy you probably don't have support for PACKAGECONFIG_CONFARGS which
was added in Yocto 2.1 krogoth.

Read the meta-qt5 commit about PACKAGECONFIG_CONFARGS.

It's relatively easy to fix (I was also using older OE with newer Qt5), but
it's unsupported, so you're on your own and you need to figure out the
details yourself.

Cheers,

On Thu, Aug 9, 2018 at 12:10 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:

> Hi,
>
> Our product is based upon 'daisy' branch (I know it's pretty old !) and
> now we have a need to support BLE in it (typical business case).
>
> My inner-self says it's the right time to upgrade everything but from
> business unit point of view, best would be to upgrade "just enough" to get
> BLE working.
>
> So I upgraded Bluez4.101 to Bluez5.46 which went well but when I started
> upgrading QtConnectivity from v5.4.1 to v5.11.0 then things started falling
> apart.
>
> It seems from v5.8 onward, Qt adopted new configuration system which is
> causing configuration and compilation failures when building QtConnectivity.
> Following change in recipe doesn't work.
>
> -PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,bluez4"
> +PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,bluez5"
>
>
> Is there a way I can upgrade QtConnectivity to v5.11 while staying on
> daisy branch ? Or is it just not possible to do so ?
>
> Any help is appreciated.
>
> Thanks
> Ankur
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009a02500572fff030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For daisy you probably don&#39;t have support for=C2=A0PAC=
KAGECONFIG_CONFARGS which was added in Yocto 2.1 krogoth.<div><br></div><di=
v>Read the meta-qt5 commit about=C2=A0PACKAGECONFIG_CONFARGS.</div><div><br=
></div><div>It&#39;s relatively easy to fix (I was also using older OE with=
 newer Qt5), but it&#39;s unsupported, so you&#39;re on your own and you ne=
ed to figure out the details yourself.</div><div><br></div><div>Cheers,</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Aug 9, 2018=
 at 12:10 PM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ank=
ur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:arial,helvetica,sans-serif">Our product is based upon &#3=
9;daisy&#39; branch (I know it&#39;s pretty old !) and now we have a need t=
o support BLE in it (typical business case).</div><div class=3D"gmail_defau=
lt" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">My inne=
r-self says it&#39;s the right time to upgrade everything but from business=
 unit point of view, best would be to upgrade &quot;just enough&quot; to ge=
t BLE working.</div><div class=3D"gmail_default" style=3D"font-family:arial=
,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font=
-family:arial,helvetica,sans-serif">So I upgraded Bluez4.101 to Bluez5.46 w=
hich went well but when I started upgrading QtConnectivity from v5.4.1 to v=
5.11.0 then things started falling apart.</div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"g=
mail_default" style=3D"font-family:arial,helvetica,sans-serif">It seems fro=
m v5.8 onward, Qt adopted new configuration system which is causing configu=
ration and compilation failures when building QtConnectivity.</div><div cla=
ss=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Follo=
wing change in recipe doesn&#39;t work.=C2=A0</div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif"><pre style=3D"white-s=
pace:pre-wrap;color:rgb(0,0,0)">-PACKAGECONFIG[bluez] =3D &quot;CONFIG+=3DO=
E_BLUEZ_ENABLED,,bluez4&quot;
+PACKAGECONFIG[bluez] =3D &quot;-feature-bluez,-no-feature-bluez,bluez5&quo=
t;</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"><br></pre></di=
v><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-se=
rif">Is there a way I can upgrade QtConnectivity to v5.11 while staying on =
daisy branch ? Or is it just not possible to do so ?</div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif">=C2=A0=C2=A0<b=
r></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif">Any help is appreciated.</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">Thanks</div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Ank=
ur</div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000009a02500572fff030--
