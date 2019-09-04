Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id E8B807F291
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 14:52:20 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id i128so13976565vsc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4VPJYwROrqrs62y+IY+8tI9bDCU6iw3dC/Ww8cDRvIw=;
	b=dJFlsZfUs/VuQLwKeovkLijO4o86qdck0/p7PF9uWnIyZDK49LlKLHGCyR0DPEkO/t
	THJq7b0ssLpxBmKhD+fBTo605XsD/woPrniO2GAW9+Be7Oc93Govs3PMvy6jB8iEGql3
	dJ/09VpH8lnLRgSHUNrejLBHjH8+o+PXUY1V97l4r3EUGJV1rIYfRpI2iUUvGTHzHmqm
	Ev6Rn7ME8soppLjfBhnQgEaaE/BCOQ79lxfXsV2e8swdP1dNV6/vSqVFI4hYUR+K6GRP
	7WDiVuhem0V8TFUoRWhSTNQqPH70KYBKbsJ+JrbgOAnG3HTwxgbN8no//0WNSYNIylVn
	7MmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4VPJYwROrqrs62y+IY+8tI9bDCU6iw3dC/Ww8cDRvIw=;
	b=hM+x0ZIQcITsJYB4Fka14dtk2XNoLypRwIisWSsEEfsYTQ91rHlEkhjYPXsFXR6qWP
	WLHl/dnI9G6IPQysdSpTbFI5j51xBrTAIPwUwJpHegu/8/ZSuFBmpOyPWoV2BhdRINd9
	IbxPQoeNCbF3T8LXnTHx7ysJRrvE5FLc5Gl0sHIi1VH9k+2nz9Fzvs9egP8UqhV9f+7i
	6H7VzttljuEGXoj7DU5Ub5X6kxuKmsti5+ceJ6L42JjcYaJvrWrKYuqO2t5fPw/1AlUV
	t8fa3um138LkUrtHUzh3tUDzHqy9PQ4fqCy94cHSH2gsNow8KnMZx76gvIsPw85JDkms
	mbaA==
X-Gm-Message-State: APjAAAXpVn7PXESEZKfu5vpNB3xc2myTJVCPBEME8f57Ms2SbUIlL6fe
	WdbfOA4QU3B5U3idnjv79SYHIbBgxgoQ4PUlqxfGdg==
X-Google-Smtp-Source: APXvYqy3GTLurhgzEPdc0huhcgSx2rOhGPx3f5WmKM7trBz6ONGCOaNoxVeiLWS1TJFv6oEaiD+yowkMX2b5zwU119A=
X-Received: by 2002:a67:7087:: with SMTP id l129mr5314448vsc.83.1567608741811; 
	Wed, 04 Sep 2019 07:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190903163241.87739-1-alex.kanavin@gmail.com>
	<20190904073239.rlk6spusid6m2zbd@qschulz>
	<CANNYZj_ZFESLDrUxU9XjjdTQXEp-awnq+-EJEavE32SqJOZSXA@mail.gmail.com>
	<20190904125538.c6f6mz6cwcz56ebr@qschulz>
In-Reply-To: <20190904125538.c6f6mz6cwcz56ebr@qschulz>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 16:52:10 +0200
Message-ID: <CANNYZj_N9hz-mwKPofSUY7Lrf-L9B2Ep+z1sbCcL9wdhtBP0Gw@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Wed, 04 Sep 2019 14:52:21 -0000
Content-Type: multipart/alternative; boundary="00000000000033d89d0591bb5af8"

--00000000000033d89d0591bb5af8
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sep 2019 at 14:55, Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> So we just need to invert the logic actually.
>
> matched = False
> for pattern in private_libs:
>         if fnmatch.fnmatch(this_soname, pattern)]) == 0:
>                 matched = True
>                 break
>
> if not matched:
>         sonames.add(prov)
>

I think you are looking for the "for...else" feature in Python :) Still,
the original code is not adding any lines at all while yours adds eight so
I'd just keep the patch as it is.

Alex

--00000000000033d89d0591bb5af8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Sep 2019 at 14:55, Quentin Schu=
lz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz=
@streamunlimited.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">So we just need to invert th=
e logic actually.<br>
<br>
matched =3D False<br>
for pattern in private_libs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if fnmatch.fnmatch(this_soname, pattern)]) =3D=
=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 matched =3D True<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
<br>
if not matched:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sonames.add(prov)<br></blockquote><div><br></di=
v><div>I think you are looking for the &quot;for...else&quot; feature in Py=
thon :) Still, the original code is not adding any lines at all while yours=
 adds eight so I&#39;d just keep the patch as it is.<br></div><div><br></di=
v><div>Alex<br></div></div></div>

--00000000000033d89d0591bb5af8--
