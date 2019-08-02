Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id C90557F382
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 16:36:22 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id b200so15454298vkf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=AQzn7STgaNeYoZjUkZt69mYhkVlu2LL8wcUm/ySXaf0=;
	b=b87yxp8/IEi6IZhTfr0ogzyE3RzDx9rbpLdkvorJ4rlElsLtCfsz8mN8YNfpqE9TCa
	bctUwTc/pw7m+e1hv9iLy3QRXhkd+7DcYd52/cGVE4u843u8GSIluTXD9muFLHLz5sOk
	xGgj65JSFVTEw3ZoMnpgvWneewlIcP/EPt09uJyYbLLtwjWjU/MEdnp/Jx8kFrEVKRPy
	OvtAej5HDyLqB+E7UL52SEBeDv2HLrbLrfRZ22rMi2RTzUAtNp3qNAXKq5bsGBWm/Zp0
	BSDWR3cgcFXQ63WJ6XJJ7HkwTKITPRQfMxo/Iq1qzUrZ9Otoo1H9hICyiwksQc8lxxsi
	AQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=AQzn7STgaNeYoZjUkZt69mYhkVlu2LL8wcUm/ySXaf0=;
	b=axFYIjeR+GktKo8CHxwYVmH0OeOlneqgO7sSaERfG8dF85tp1Asvi1tCk44HJkWNuY
	4lav7d5zfbV+mxqgHYQFPsEOPJ554oBjmZoDR5ANE63UjZarMVbjrGYYaBqrZYerRmGO
	yCSlI4b9znDhNjDRjgwQAr1Tz0BGamaAjSQ+CnMxeOvd/pmsA9wL6fXIeG+TsbmGjEML
	Rsr+PdEUoSs2xVQ2fBqNJ4meOiyFnv940tgVF4ayQoBqpZIEXSlpzMEO3j8rdffxCmgG
	1e5Garnc/jsb2BvyldJ8q21af8MwEZXrMpI/Uy2D+u0/WpjIPpEj3ooteWvq6u5LBp7T
	BR6w==
X-Gm-Message-State: APjAAAX2RjG5MbaqZCTJ0n1dD/2oSF7kDFpwL6dQ1WJOL8BanaLLT1X3
	yEwAVep6S4VwOTR+0sS7ak4tnGb6sU22loGGikhhlQIe
X-Google-Smtp-Source: APXvYqwNzHTv8wEfq3xmOy+/e+9YK+8z9cQaXStlNIuWHwdU/w7dcLIgQWiBvgrcVr0xM29kW/IgDgsputaAGBJRsFM=
X-Received: by 2002:a1f:8bc4:: with SMTP id n187mr53181852vkd.32.1564763783450;
	Fri, 02 Aug 2019 09:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190802155747.9285-1-alex.kanavin@gmail.com>
	<20190802163146.2330.96644@do>
In-Reply-To: <20190802163146.2330.96644@do>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Aug 2019 18:36:12 +0200
Message-ID: <CANNYZj8-cG0YqcBQMLRtyYSHqaGUXsErphQSotecAdS_OkCihw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc29uOiBhZGQgYSBiYWNrcG9ydGVkIHBhdGNoIHRvIGFkZHJlc3MgdmFsYSBjcm9zcy1jb21waWxhdGlvbiBlcnJvcnM=?=
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
X-List-Received-Date: Fri, 02 Aug 2019 16:36:23 -0000
Content-Type: multipart/alternative; boundary="0000000000007853ed058f24f58a"

--0000000000007853ed058f24f58a
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Aug 2019 at 18:31, Patchwork <patchwork@patchwork.openembedded.org>
wrote:

>
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at fc634c41e4)
>

This is intended; the patch is sent on top of meson patches already in
master-next.

Alex

--0000000000007853ed058f24f58a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 2 Aug 2019 at 18:31, Patchwork &l=
t;<a href=3D"mailto:patchwork@patchwork.openembedded.org">patchwork@patchwo=
rk.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not appl=
y on top of target branch [test_series_merge_on_head] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at fc634c41e4)<br></blockquo=
te><div><br></div><div>This is intended; the patch is sent on top of meson =
patches already in master-next.</div><div><br></div><div>Alex<br></div></di=
v></div>

--0000000000007853ed058f24f58a--
