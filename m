Return-Path: <alexander.j.kube@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0916A7F9C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 18:13:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id r141so3512404wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pPfhx8OizSlDcUMFaaMh1FQw2Ze4Z2C7IEDwVK88YBE=;
	b=YQYIXHiNYNrswZa8PAQAhOtbnfWu6T53up+6Bpmxu4eTLkCuZrcCIiwJoz1rWTZuNY
	kUi3BOoJpqtHSicwSaTdPaKmgTw4J4sdODPxwQhXCKX6EUDwDya1O3QBwC+Fx7skz1WB
	fK12st2rbjOgL0Whyh2aJjdIfZXyRigfXsWfyZ93FrgCbVhVxcVhR4kn3Xx2YinV65f9
	lnxIqrd9d0ovnpneh3KH0HVHEHOwLOPn2P4fnogSDPaBA2ONu/rWy8oZbrBZ/W5maXdS
	9UpRQ31e9zjGdRyWR2qczECc0SzkS6nO+OhvqXzluROv+waFQ8szPsBBGx0lx9R3R2YO
	qG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pPfhx8OizSlDcUMFaaMh1FQw2Ze4Z2C7IEDwVK88YBE=;
	b=CKmn2n9+ecWscf0bfXs4rHqxfH4lJpnHfLk9uHHEfw+O+Miqb2CHM0MZuXWJWZhO3Z
	JllQgtNtZdG4TB6wzxcPUM2dOuZ8khLFYg1TDckZLEI7HA7IgA4lZlpBb8tC9hxoINEq
	gqdgePuBHOIEjn1qxXnhpOVDFjfkck3KVTbIaTCzoIR5UJJt+2MmzaVkH24gFmy3NIe8
	J0Uj/bkUGEbSf1dHeWyYP+xbFxH08jvTosI33JLAMzmpAvGpsKq9MCSGok4AtCYLddU0
	N0EwU2gvw4paGMKsmEAnOdpg3Sjo7VnNdp/0W/RUUqIn2dqPQUuT9NfTzqY0shX86zRg
	d5dw==
X-Gm-Message-State: APjAAAX+YJglC6cVQTWCUnRU3O0E+lAGHYhDKwf8ua8Ho6wBaxkiT1TC
	AKLwOWYe8C5tnGWgbtLVwapNApuamNR11jQiO6A=
X-Google-Smtp-Source: APXvYqyrgZA30r3+ieSumvAylpzLA6XAyJZk8yadMb4G09PMLlPhUSKeKmNyEGGswWB7adFuftmhSuOP+uTkrbY7E70=
X-Received: by 2002:a7b:c10f:: with SMTP id w15mr6020829wmi.171.1571940834616; 
	Thu, 24 Oct 2019 11:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
	<7d5b190d3a523f973ce6788d0234be31fe8cb631.camel@linuxfoundation.org>
In-Reply-To: <7d5b190d3a523f973ce6788d0234be31fe8cb631.camel@linuxfoundation.org>
From: Alexander Kube <alexander.j.kube@gmail.com>
Date: Thu, 24 Oct 2019 22:43:17 +0430
Message-ID: <CAO7qD-ub_B9++9vEAW---OJsc8PdTfTd94q9T2sLp9G-6ckVig@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add recipes for Go v1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 18:13:54 -0000
Content-Type: multipart/alternative; boundary="0000000000000e2ec30595abfff7"

--0000000000000e2ec30595abfff7
Content-Type: text/plain; charset="UTF-8"

From the release notes, there are no intentionally breaking
language changes between 1.12 and 1.13; however, 1.13
changes the behavior of tools for go modules that are
provided with the default language installation that may
break workflows that rely on the previous behavior.

The time required to migrate really depends on the project.
go projects that depend on private modules will require a
reworking of their bitbake recipe to indicate to the tools that
they should not attempt to use the default module mirrors to
download and authenticate the private modules.

For projects that do not use private go modules, it looks like
 the changes to the tooling should be largely transparent,
although the release notes don't 100% guarantee that.

On Thu, Oct 24, 2019 at 10:07 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-10-24 at 21:59 +0430, Alexander Kube wrote:
> > This patch set adds various go-1.13 recipes and changes the
> > poky GOVERSION to 1.13%. It leaves the existing go-1.12
> > recipes untouched and available for existing users of
> > those recipes.
>
> Thanks for these patches. How compatible is 1.13 with 1.12 and do we
> still need the 1.12 recipes? I'm wondering how hard it will be for
> people to migrate...
>
> Cheers,
>
> Richard
>
>

--0000000000000e2ec30595abfff7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From the release notes, there are no intentionally breakin=
g=C2=A0<div>language changes between 1.12 and 1.13; however, 1.13=C2=A0</di=
v><div>changes the behavior of tools for go modules that are=C2=A0</div><di=
v>provided with the default language installation that may=C2=A0</div><div>=
break workflows that rely on the previous behavior.</div><div><br></div><di=
v>The time required to migrate really depends on the project.=C2=A0</div><d=
iv>go projects that depend on private modules will require a=C2=A0</div><di=
v>reworking of their bitbake recipe to indicate to the tools that=C2=A0</di=
v><div>they should not attempt to use the default module mirrors to=C2=A0</=
div><div>download and authenticate the private modules.</div><div><br></div=
><div>For projects that do not use private go modules, it looks like</div><=
div>=C2=A0the changes to the tooling should be largely transparent,=C2=A0</=
div><div>although the release notes don&#39;t 100% guarantee that.</div><di=
v></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Oct 24, 2019 at 10:07 PM Richard Purdie &lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, 2019-10-24 at 21:59 +0430, Alexander Kube wrote:<br>
&gt; This patch set adds various go-1.13 recipes and changes the<br>
&gt; poky GOVERSION to 1.13%. It leaves the existing go-1.12<br>
&gt; recipes untouched and available for existing users of<br>
&gt; those recipes.<br>
<br>
Thanks for these patches. How compatible is 1.13 with 1.12 and do we<br>
still need the 1.12 recipes? I&#39;m wondering how hard it will be for<br>
people to migrate...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000000e2ec30595abfff7--
