Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 329C87FA9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:02:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e14so4313242qto.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TlJyAD/cWs2VCeE8gTRGc7fL/xyl/LkIovn6yk5TYVg=;
	b=jt6/08nYqsty6EjAdeM2PR9WyKLIql9rJk7rBmeOMc9R/HsaLl1WBIMTnuMVDEoZab
	tRYKODTXvxedEz2+YO48ztgpLjUJRicXqya8k4JtzMPWwi43lzJEP9/IBngi55r8JA6v
	gaHDnYCQvuqc8GM5zv6471cnKKaqX8zQBMUCpbxWP5hG4lfCAwQwlIKk4G53cxSRnzC+
	MM53aXP7H0sWhJF9o5tIuMGQgA3XZAXwo7ZD6ksACIP7Uz1ln4D4A+ApCdTx/fkC+yBG
	ovirb41Qmy0fL8wywuh/Bo3nVFNhaDYnDF8OKJYb5tyxUvlasIe8DiwhIre4TR8RdsNl
	URTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TlJyAD/cWs2VCeE8gTRGc7fL/xyl/LkIovn6yk5TYVg=;
	b=XtUY+t7Y3f1GaFf2h8N392+vxBY4tPGaOj4s9n6lWcZ1NoAPjLSdb5jN6wjSpVl9jD
	L/ydvkgkr/QQeDn9YHi/ddtyJQ0Dxh89mFhtw9+vBxsL/eYlqSWxz1Qma99nubfdfCAw
	v8ZQWoNPLXoXXAy3Wnpf9KM+eTyX7tqgBkWRB9XlGOq8dTZMkk4rqrXTNZ2Rk3wvYJ7Z
	nr3phiiXW6FKJWtM8yA5JfSq4ON9yNjoG+Fdy4Fdu82v41C0CRgK8fPIeflIKXux1g2W
	5vhqSw8COdVZDrvCwQoB+DsVfNaEb8KJVQQAZZo/KvmeWWBD/fxtUq898Iq+Hr6VHVTC
	9vdA==
X-Gm-Message-State: APjAAAVx7DLjHcqYWVIYFo75aRtdJ84RtWQbAkzt7OJ1NeTsHmSnHQJJ
	WWG3y/jB9uIvN2IyIrWjFZXGSLXyQPdYzqTbOw4=
X-Google-Smtp-Source: APXvYqzqp6uY5WIau6OUctFDdVRKt5OjstZQbLlfg5b6LHpJKWg8p8PaosnR2v5FIk9KzJ1f1aBWfeTb08D2XOjDKnY=
X-Received: by 2002:aed:2724:: with SMTP id n33mr4104456qtd.194.1572022925686; 
	Fri, 25 Oct 2019 10:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3> <20191025134458.GA22739@linux-uys3>
In-Reply-To: <20191025134458.GA22739@linux-uys3>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 18:01:54 +0100
Message-ID: <CAMKF1soqoREE7p+XoaEzNpfVQPi=7e+w4ujvbRJ2gMaVB7_rqQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 17:02:05 -0000
Content-Type: multipart/alternative; boundary="000000000000107ad90595bf1c24"

--000000000000107ad90595bf1c24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 2:45 PM Trevor Woerner <twoerner@gmail.com> wrote:

> On Fri 2019-10-25 @ 09:22:04 AM, Trevor Woerner wrote:
> > On Thu 2019-10-24 @ 04:05:10 PM, Khem Raj wrote:
> > > perhaps you need to add -pthread to LDFLAGS
> >
> > I'll set up a test build.
>
> Yes, adding the following line fixes it:
>
>         LDFLAGS_append_class-native =3D " -lpthread"
>
> (unless there's a distro-override way of doing it...?)
>
 There is no need to make it disto specific it should work always and I
think it=E2=80=99s better to use -pthread so gcc driver can decide where to=
 add the
pthread library in link order

--000000000000107ad90595bf1c24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 25, 2019 at 2:45 PM Trevor Woerner &lt;<a href=
=3D"mailto:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Fri 2019-10-25 @ 09:22:04 AM, Trevor Woern=
er wrote:<br>
&gt; On Thu 2019-10-24 @ 04:05:10 PM, Khem Raj wrote:<br>
&gt; &gt; perhaps you need to add -pthread to LDFLAGS<br>
&gt; <br>
&gt; I&#39;ll set up a test build.<br>
<br>
Yes, adding the following line fixes it:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LDFLAGS_append_class-native =3D &quot; -lpthrea=
d&quot;<br>
<br>
(unless there&#39;s a distro-override way of doing it...?)<br>
</blockquote></div></div><div dir=3D"auto">=C2=A0There is no need to make i=
t disto specific it should work always and I think it=E2=80=99s better to u=
se -pthread so gcc driver can decide where to add the pthread library in li=
nk order=C2=A0</div>

--000000000000107ad90595bf1c24--
