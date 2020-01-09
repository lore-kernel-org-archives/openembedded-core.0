Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id EF3CD7FE5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 13:47:20 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id w67so1977566vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UfuhxppJxQZm2f/2JfEk93PsV8EOx/80nJzfcCd1/Bs=;
	b=TlQT6mJUEZxcIN/hNkPb+7kJxNX6cDJdHbxu3Se6SMpU1E/9FlXdqV01zPQI78AXO+
	9vPD0oO70RPHiz6unvX+Y+34XK2tmafRcB72GDHsIj+NBf6oLAYo5rW/ydNwypM1gDLV
	KCVlhkBtsRIt5m22izn6EtYV6QIpkD62YwufZzk/l9uzlJJj4P9y+FV9tyaCMgYZuBPk
	F1H8We3e5fyN80hbmNhpmrO+LPu3KM1nZXilAkNgWNGK15vHkMKUuo2C3gMx6rrtbr0w
	SE6gecuRtRTA7wO1Sm0VcHBRuwV+fQZcC4f0yiV1U/TeH2MKVc4HtVVBnVirR0D+Cus5
	e1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UfuhxppJxQZm2f/2JfEk93PsV8EOx/80nJzfcCd1/Bs=;
	b=CSfffSauvxgATpxtBgaE6YRGv+i+c7QvacMJEHR4spXuydSJmcjY8XIX5g39EQM5IO
	PUINUS9d0/cxSmnZaGdsRXMjIoLo/Mrd5XZcIc5jEG8QqMegaz4LPEEcsQ4tJObqO5tS
	1q4KT7jTHms2tKcg/Mw7jmu2PelW/bSw/FDLqhmesyDj5wVlCzAyoYVuDc0pCAKR2lf/
	LoZyq4QBsqHlDWLwt+v8oDKU2BnuTnuZkUx5tEfx2gE4uHFXxmZJWlueOHe9Ewxx4Wis
	3PQXesVG+KZuJ15CAE7+2lkEbeBzSeEkvBPndHTLqvpk0WRbnwO6AyQAPDRREolokbEL
	Vixw==
X-Gm-Message-State: APjAAAU7M5Jnr+TUuE4vSCAgNQ61JeEUAIbTmadyjuNmDyRzVYZggkeq
	qX+o6xNiwOERoXAJbnpqoLl4pn4Y8/Ca5ZutmSTJlOKd
X-Google-Smtp-Source: APXvYqwgiRfv3WeO93aF16CXD96FrH71mlXd+KcMEA0JLzFFAuX1QADeqSpySFQXtrpdq6QQkRrPNiLW9xd8ie5oiuU=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr6885452vkc.29.1578577641688; 
	Thu, 09 Jan 2020 05:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
In-Reply-To: <15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 14:47:10 +0100
Message-ID: <CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 13:47:21 -0000
Content-Type: multipart/alternative; boundary="000000000000955239059bb53f50"

--000000000000955239059bb53f50
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2020 at 22:23, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch as
> > it is difficult to rebase and not clear if still necessary.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...efn-fix-inverted-checks-for-loopback.patch | 403 ----------------
> > --
> >  ...{ifupdown_0.8.22.bb => ifupdown_0.8.35.bb} |  11 +-
> >  2 files changed, 5 insertions(+), 409 deletions(-)
> >  delete mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn-
> > fix-inverted-checks-for-loopback.patch
> >  rename meta/recipes-core/ifupdown/{ifupdown_0.8.22.bb =>
> > ifupdown_0.8.35.bb} (83%)
>
>
> http://errors.yoctoproject.org/Errors/Details/305656/
>

I had a closer look at how and where ifupdown recipe is used, and from what
I see it isn't:
every configuration is relying on busybox to provide the same utilities.
That's why the failure is seen only in world builds :)

Should we drop the ifupdown recipe?

Alex

--000000000000955239059bb53f50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 8 Jan 2020 at 22:23, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2020-01-08 at 14:27 =
+0100, Alexander Kanavin wrote:<br>
&gt; Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch as<br>
&gt; it is difficult to rebase and not clear if still necessary.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...efn-fix-inverted-checks-for-loopback.patch | 403 ------------=
----<br>
&gt; --<br>
&gt;=C2=A0 ...{<a href=3D"http://ifupdown_0.8.22.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ifupdown_0.8.22.bb</a> =3D&gt; <a href=3D"http://ifupdown_0.=
8.35.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a>} |=C2=
=A0 11 +-<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 409 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn=
-<br>
&gt; fix-inverted-checks-for-loopback.patch<br>
&gt;=C2=A0 rename meta/recipes-core/ifupdown/{<a href=3D"http://ifupdown_0.=
8.22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</a> =3D&gt=
;<br>
&gt; <a href=3D"http://ifupdown_0.8.35.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ifupdown_0.8.35.bb</a>} (83%)<br>
<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/305656/" rel=3D"no=
referrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/3=
05656/</a><br></blockquote><div><br></div><div>I had a closer look at how a=
nd where ifupdown recipe is used, and from what I see it isn&#39;t:</div>ev=
ery configuration is relying on busybox to provide the same utilities. That=
&#39;s why the failure is seen only in world builds :)<br></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Should we drop the if=
updown recipe?</div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">Alex<br></div></div>

--000000000000955239059bb53f50--
