Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6DEA27FB9A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 11:03:23 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id c25so1877800uap.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9mzmGyE9oLXpLNp5+oaRDUrgFyhkDqtpGfqox+75BQY=;
	b=QqsLRlZJHFsqKTFSpK622X7soFCwsJbAeurvZaGtMQ13E/SXgpq5H2M6qeybmcJu9e
	p1uLAarLiPgraPAI0bcGBZqSk/X8vvyVJT2pbZuNnmqv6UZ3HzwC+pb1TMkPM+0VQXzw
	vYF2V2QcG6xKGDOJFSwCTGOJtYTBUtNQM0NQ0mUuU0gHVzeDZ9e1ZMG1K9sYjKaEtG2W
	EI8Lk3NVKa2vJjjQcyguE5wiLf6W6l5P7MYAgLqYQjQ9mIjMCiJByLlfsiIQbF2v5NyL
	hbMSpqnXCtC0eEpz97EwhO33z9CASJ9o9IYd6ktV5EuXKBt2byfAp4Jszl7Js04/lK5O
	AbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9mzmGyE9oLXpLNp5+oaRDUrgFyhkDqtpGfqox+75BQY=;
	b=DAie1JIhcQ1DqrJM30BM2T8KEA9Kwyw2tGwWO3vSMOcs3And3XVxpBJf+42rOhDDmX
	5ZNV+KUOpWngUn1IEk6tdQx6TCEllOEyEcIIiSZ0ZMdatCaTxfp7yxedJs8wsKF/XIgH
	vEl4eKuDTURf8tlBtwebD45tmAOc1Oa6M1GShnNXkSru3YDzlnsJeeMVTaQHh7U85u2w
	82j1s0mWqcEt+IzJbnK/cHPWXc16W5uUH7j1oq2DTUlIyaAjQ+MKXW8fJ385zd2KV04c
	uqgrdppEIZPg9zxFzJo411JGfPVHFJ2P5VZyRhMlj5y6x9Gf5fdegf/e89lAXpEr87l1
	AOdA==
X-Gm-Message-State: APjAAAV8d/jdDBJvzjGa6XIUwWyV2Nz5XRf3ObU9mQj41GqP0NEMxyJc
	nAGbKEwgdMY2dIy4gaP/keBSAlZ3Bpe352u4YT0=
X-Google-Smtp-Source: APXvYqxpeRJrv1Qevy+KcCvIdfxpf2MGuaVnD20onR3RhCTUhSX76FY1aP7uXAXyC0o+S2ZLivQoPXs71rWMLk6G0sU=
X-Received: by 2002:ab0:2907:: with SMTP id v7mr2791669uap.89.1572174204357;
	Sun, 27 Oct 2019 04:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <ee102dfc-af38-5a75-0b64-0c6bb13bb106@gmail.com>
In-Reply-To: <ee102dfc-af38-5a75-0b64-0c6bb13bb106@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 27 Oct 2019 12:03:12 +0100
Message-ID: <CANNYZj_PpuXczLf7SPcXdukZNjeCAWMXu1y9ENFUt-sYxdZv=g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of stable warrior in Core/bitbake/YP layers
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
X-List-Received-Date: Sun, 27 Oct 2019 11:03:24 -0000
Content-Type: multipart/alternative; boundary="000000000000f9cff00595e2546c"

--000000000000f9cff00595e2546c
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Oct 2019 at 09:13, akuster808 <akuster808@gmail.com> wrote:

> Of the past month the warrior stable branch has been plagued with a
> build failure on FedoraCore30 regarding qemu virgl tests. This has
> caused the slip of the next dot release to occur after Thud's.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13543
>
> The error message was this:
>
> runqemu - ERROR - Failed to run qemu: libEGL warning: MESA-LOADER:
> failed to open swrast (search paths /usr/lib64/dri)
> libEGL warning: MESA-LOADER: failed to open swrast (search paths
> /usr/lib64/dri)
>
> qemu-system-i386: egl: eglInitialize failed
> qemu-system-i386: OpenGL is not supported by the display
>
> What has fixed this error is updating libdrm to 2.4.99 from 2.4.97. What
> I can not tell is what commit(s) in those updates fixed the above error
>
> https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.html
> https://lists.x.org/archives/xorg-announce/2019-April/002992.html
>
> Has anyone seen the above error and might have an idea what commits
> would solve this issue?
>

The DRI modules loaded from the host (swrast particularly) may try to
resolve a symbol in libdrm-native that doesn't exist.

I remember debugging a similar problem when TLS got accidentally switched
off in mesa-native, what helped was tracing symbol
resolution with the help of environment variables described in 'man ld.so'
(can't remember off the top of my head what was the exact one).

Alex

--000000000000f9cff00595e2546c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 27 Oct 2019 at 09:13, akuster808 =
&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gm=
ail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Of the past month the warrior stable bran=
ch has been plagued with a<br>
build failure on FedoraCore30 regarding qemu virgl tests. This has<br>
caused the slip of the next dot release to occur after Thud&#39;s.<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13543" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13543</a><br>
<br>
The error message was this:<br>
<br>
runqemu - ERROR - Failed to run qemu: libEGL warning: MESA-LOADER:<br>
failed to open swrast (search paths /usr/lib64/dri)<br>
libEGL warning: MESA-LOADER: failed to open swrast (search paths<br>
/usr/lib64/dri)<br>
<br>
qemu-system-i386: egl: eglInitialize failed<br>
qemu-system-i386: OpenGL is not supported by the display<br>
<br>
What has fixed this error is updating libdrm to 2.4.99 from 2.4.97. What<br=
>
I can not tell is what commit(s) in those updates fixed the above error<br>
<br>
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2019-July/22506=
9.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/=
archives/dri-devel/2019-July/225069.html</a><br>
<a href=3D"https://lists.x.org/archives/xorg-announce/2019-April/002992.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://lists.x.org/archives/xorg-a=
nnounce/2019-April/002992.html</a><br>
<br>
Has anyone seen the above error and might have an idea what commits<br>
would solve this issue?<br></blockquote><div><br></div><div>The DRI modules=
 loaded from the host (swrast particularly) may try to resolve a symbol in =
libdrm-native that doesn&#39;t exist.</div><div><br></div><div>I remember d=
ebugging a similar problem when TLS got accidentally switched off in mesa-n=
ative, what helped was tracing symbol</div><div>resolution with the help of=
 environment variables described in &#39;man ld.so&#39; (can&#39;t remember=
 off the top of my head what was the exact one).<br></div><div><br></div><d=
iv>Alex<br></div></div></div>

--000000000000f9cff00595e2546c--
