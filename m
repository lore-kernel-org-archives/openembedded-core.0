Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5F67F230
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:24:35 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id y13so201034vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VhObq4lkYrUEEt+CAPn7nzG6i+uX36ep6urAI8nbvn0=;
	b=gEDbetMv8o3PvuYkOAf+JB2DyqwhlMvfgnjjXo7wZosNPqXmpvX+6hDI2d3zknJxat
	uGmb0vqjeW4xUk34RMiIqRi8x/PWsk1qi3CRTLcPBWJv/ejzq1FYDt4aM0Z+A94b8Gfd
	Z8tgDIrmcNpxEUp8hi5HUZamNbQni3qSdkw/DkW0Tee78Nsa2Bo/4yXoBFH3ssAsnP+W
	0gvK4KQrrtIn/J+8cQDELKrqpyRUzMYF+PJMcGpZ1FpOMCHRqTkQdeBVTG+v09MU689A
	4nsdDfpskFoXkQKJOQ5bFPXGw3MT1Y0jWpWKqEzxb8jyezp0qwLe5QhatUxZ7q1Pb9lz
	M4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VhObq4lkYrUEEt+CAPn7nzG6i+uX36ep6urAI8nbvn0=;
	b=q8ZoGJfeDKwjs7ZkkcpCDJf133jIQWfhL6M4C1sgr7mv2KpBE2u5k4uZMt2lwIitHi
	BhvEs8eix/G+qWQi31LwfhElC2wCLw6wsJ3YwhvTnKlJERffHkGYZYscL7r9vo9RTtmn
	dxVbAjzA7c9QTyjWWE5vlaeARWxXCVDJrf7NlaNZiSZWoANKZNBRjiF7ULEffiCuu3rm
	LajnARNfZLzjH8Pnqbu4Nw+534j+aABeHQ/6Aq+0QtNrXfKtMPcuDCBu0qZf5vzFGWfV
	e56KclIn/+Ofl3v5TstlL8QdtV7DjfYoCpBNC+YrSrvO1WXtcDj8+gIgLND8+CrBicPe
	1dmA==
X-Gm-Message-State: APjAAAXIgmyB+jn01t04C8GQtZ0oG9GKeg67CLFvGDYI29TUxm3VVHv3
	+XjL2syYQxYhbPpXHJmJUyoAgpYbLbVDf9kdcBo=
X-Google-Smtp-Source: APXvYqwtzhR+/Yd31uAdhj2W55uhsL5Nja8rI/ZBbqhCq1ORGm4cqfJf6gL0KuF8PTiY1blG6VJrBxly23hvg5E0Hww=
X-Received: by 2002:a05:6102:d1:: with SMTP id
	u17mr5454722vsp.23.1575303876209; 
	Mon, 02 Dec 2019 08:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-13-alex.kanavin@gmail.com>
	<be94e0da-16b3-d525-98db-81078737be37@intel.com>
	<e11afd07-d8f1-456d-27fb-8f614f9f3d89@intel.com>
In-Reply-To: <e11afd07-d8f1-456d-27fb-8f614f9f3d89@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2019 17:24:24 +0100
Message-ID: <CANNYZj-BSOYKjQKE-X6G=N13gnFaKz_4GbXhSbpwhCKL7159gg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/15] libffi: update to 3.3 final
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
X-List-Received-Date: Mon, 02 Dec 2019 16:24:35 -0000
Content-Type: multipart/alternative; boundary="000000000000f4706d0598bb0356"

--000000000000f4706d0598bb0356
Content-Type: text/plain; charset="UTF-8"

Thanks, will add this patch now and test.

Alex

On Mon, 2 Dec 2019 at 17:21, Ross Burton <ross.burton@intel.com> wrote:

> On 02/12/2019 16:19, Ross Burton wrote:
> > Fails for ppc:
> >
> > In file included from ../libffi-3.3/src/powerpc/ffi_sysv.c:35:
> > ../libffi-3.3/src/powerpc/ffi_powerpc.h:65:9: error: '__int128' is not
> > supported on this target
> >     65 | typedef __int128 float128;
> >        |         ^~~~~~~~
>
>
> https://github.com/libffi/libffi/commit/01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd
>
> Ross
>

--000000000000f4706d0598bb0356
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, will add this patch now and test.</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 2 Dec 2019 at 17:21, Ross Burton &lt;=
<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 02/12/2019=
 16:19, Ross Burton wrote:<br>
&gt; Fails for ppc:<br>
&gt; <br>
&gt; In file included from ../libffi-3.3/src/powerpc/ffi_sysv.c:35:<br>
&gt; ../libffi-3.3/src/powerpc/ffi_powerpc.h:65:9: error: &#39;__int128&#39=
; is not <br>
&gt; supported on this target<br>
&gt;=C2=A0 =C2=A0=C2=A0 65 | typedef __int128 float128;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~<br>
<br>
<a href=3D"https://github.com/libffi/libffi/commit/01a75ed76ea7e57f1b7a5c18=
3e2b1e890e6aa0fd" rel=3D"noreferrer" target=3D"_blank">https://github.com/l=
ibffi/libffi/commit/01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd</a><br>
<br>
Ross<br>
</blockquote></div>

--000000000000f4706d0598bb0356--
