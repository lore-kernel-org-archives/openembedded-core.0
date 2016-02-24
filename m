Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3CCEE77330
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 20:46:25 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l127so65502076iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=AQnG6Ow9t3z7Tot5Mp03O6oOpGFy0CtXiJglY3mf2ng=;
	b=Kj/pMQtbM3RO6K5RHMlGATojUY8MUdcadw2a7dEQ+pC8BgFVNHLgJqDR8o3zBuMnTr
	RpAkTHLixeWcfYzwrDcPaza9VSlRZa0XSa1fapxZAQP34gOqbOuUMSND/RkeuXDrYNCW
	vkK/goWaFOk5m3cbRTjzS9b22xtRGvphAsak7yGtxUN5z2EYTCAkHL56NoiqHxgq3Fh6
	Q99a/xC+aFF7ilkOmc4gAdFPcldO6rVPhEsYplSJ2wMBWWkWlPQ5NGYtjBomrR8fZgpc
	xxjkfwlliEb+iCbEwoZc2d8ZBduR4XOynJJmPl7til9VYSsFxJjNLXfQ5Th2CKIxXuMM
	JhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=AQnG6Ow9t3z7Tot5Mp03O6oOpGFy0CtXiJglY3mf2ng=;
	b=RdDdbkd/8wApM7qcUvZI22qDpeO1almfIh1AQfVgGuCcC8tYrUJJQ9yxjxlTOR3Ptz
	BmvDi8OR9r72KQ/vnaFmOZuhaCJ02v4EWwO9NzfAx0SGgTzPMjz9opDixKPgX62oX+kW
	RIkCyp3JVQRftY38CzfQQ5H96sRu1lpH0oI6bmumJgQOKj6LugnMIICUmbkAv6lboszd
	TmtpsftLqq7v3LE2csOuPPRxXeXBOY0e172l4mBCe5tW41kEfOIvuvAXP0ri7uglEx9P
	bFwY+7b3+AeG6ySwqM+x8zBTI8VkA5KkilFP+NYCENEpJPEHXH4bzrynmGGpwSWrPJax
	RJuA==
X-Gm-Message-State: AG10YORgwU9pxmESBfY1MVcoOFUHhq6/FuS3GkuL7PZtE2Gp8/Mhdac6uKcoRut39YzPKejBUDTyEuX3NVi9bg==
X-Received: by 10.107.14.66 with SMTP id 63mr42613755ioo.150.1456346786324;
	Wed, 24 Feb 2016 12:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
In-Reply-To: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 24 Feb 2016 20:46:16 +0000
Message-ID: <CABcZAN=RefHwBnF+8oEu6uDmxe-LCMoVs94XK=MOEsr7VmJ6xw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	openembedded-core@lists.openembedded.org
Subject: Re: what is the priority of wildcarded .bbappend files?
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
X-List-Received-Date: Wed, 24 Feb 2016 20:46:27 -0000
Content-Type: multipart/alternative; boundary=001a113fe1bede66f4052c8a28de

--001a113fe1bede66f4052c8a28de
Content-Type: text/plain; charset=UTF-8

All appends that apply to a given recipe will be applied to that recipe.
Order is determined solely by layer priority.

On Wed, Feb 24, 2016 at 1:38 PM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>    didn't immediately see this in the documentation anywhere, so what would
> happen in the following situation? say i have a layer that has three
> different versions of a recipe:
>
> * recipe-1.0.bb
> * recipe-1.1.bb
> * recipe-1.2.bb
>
>    if i want, i can extend each one with a .bbappend file:
>
> * recipe-1.0.bbappend
> * recipe-1.1.bbappend
> * recipe-1.2.bbappend
>
>    or if the same .bbappend file applies to all of them, i can just create
> the wildcard file "recipe-1.%.bbappend". but can i do this?
>
> * recipe-1.1.bbappend
> * recipe-1.%.bbappend
>
> such that the more specific match takes precedence, so that the 1.1
> bbappend
> file is used for that version, and the wildcard version is used for
> all others?
> is this written down somewhere that i just missed it?
>
> rday
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113fe1bede66f4052c8a28de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All appends that apply to a given recipe will be applied t=
o that recipe. Order is determined solely by layer priority.</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Feb 24, 2016 at 1:38 PM Robe=
rt P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcours=
e.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 =C2=A0di=
dn&#39;t immediately see this in the documentation anywhere, so what would<=
br>
happen in the following situation? say i have a layer that has three<br>
different versions of a recipe:<br>
<br>
* <a href=3D"http://recipe-1.0.bb" rel=3D"noreferrer" target=3D"_blank">rec=
ipe-1.0.bb</a><br>
* <a href=3D"http://recipe-1.1.bb" rel=3D"noreferrer" target=3D"_blank">rec=
ipe-1.1.bb</a><br>
* <a href=3D"http://recipe-1.2.bb" rel=3D"noreferrer" target=3D"_blank">rec=
ipe-1.2.bb</a><br>
<br>
=C2=A0 =C2=A0if i want, i can extend each one with a .bbappend file:<br>
<br>
* recipe-1.0.bbappend<br>
* recipe-1.1.bbappend<br>
* recipe-1.2.bbappend<br>
<br>
=C2=A0 =C2=A0or if the same .bbappend file applies to all of them, i can ju=
st create<br>
the wildcard file &quot;recipe-1.%.bbappend&quot;. but can i do this?<br>
<br>
* recipe-1.1.bbappend<br>
* recipe-1.%.bbappend<br>
<br>
such that the more specific match takes precedence, so that the 1.1 bbappen=
d<br>
file is used for that version, and the wildcard version is used for<br>
all others?<br>
is this written down somewhere that i just missed it?<br>
<br>
rday<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a113fe1bede66f4052c8a28de--
