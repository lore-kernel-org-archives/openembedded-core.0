Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 45FF67F9DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:26:51 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id t12so11023633vso.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wk7cKelmZva15ENPT8CyipiVcf+O2zQ9+kh7LJCev6Q=;
	b=Qot9fityNmOhNQxX+n0WHYrZEsklQKn890AJRzbT1ZXHoSu6aeI40VSApo1hs7VrDt
	893CSnruYw3I6UsKWj9ghJGUmWbgKS9ajfxIgvc/5JkoR+HcNCn7Rhc54GiDn4FOsZ2P
	kj080ugLeCjK0A3hM8eqFU0lslu1j3wSiFZlZMWikUGJfhTUhovVy8ezAsJDX3V+hxz+
	vjNOE/acOdsjq7YJZS/ivy73eUePBdEUSMvRRQoj8cao2GFNvlTML53Me8vfiyysK2ye
	gDn2/AWkGElYDH0a3vSDwGMOG9zCnaC/X9eBHZFtgzQTLyT8gZ6VYfC0tmv1L0Q9HKUj
	F73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wk7cKelmZva15ENPT8CyipiVcf+O2zQ9+kh7LJCev6Q=;
	b=jXzfhQ60P0vnqey5ec7jbjWbvTwz0NgjmP9vuZR9B1VbeROPo9mO97o61uplqsBf0N
	8W8ZlUQmsUfpQOTXtt0nPoIIuWYTIxHmMFKzJz6bMoQATxljd4xeX43M+49UVnxUZwAT
	Yw3XFisOCWdOgU9tX8NCfaIVvichpKurj9qY3qzIbfjlV4/T+9EpUoGH1d2V2YQ3hA7D
	qPsSQz6EfHrB6ogixaigO+OyHVwL9iYaQkUFiZbIat2FmlaGvR37d+EW3OYDnWQkOrkR
	BZDoUfM0SGnO1eO0Yy7OGbuPDscUmKnx3HHPnRcOvJrmsu7GO8VnNkPMWSjkuwOv6tBt
	vrNQ==
X-Gm-Message-State: APjAAAUcU06wcajSa1KAYuB1JY/kuJNGq9L6k6jwTXK10f6okcg1SPSF
	rHIKXXEQOe/Mx3j8FqjYQgoPhTdpHH7Yr4o06XsDeDVT
X-Google-Smtp-Source: APXvYqwz/YbEj5by7wfXKic7t8B1wtbXUzHjfFhhmiFDpZZlOxYqmbSiQ6tUOY820ydaZfIA7hYTl6LSxqhARstuffs=
X-Received: by 2002:a05:6102:3213:: with SMTP id
	r19mr5362540vsf.83.1579112812104; 
	Wed, 15 Jan 2020 10:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
	<b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
	<CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
	<bdc3d78fb086561f839d8a6a41d2ed336ef5a793.camel@linuxfoundation.org>
	<CANNYZj-MWCDrwtWDgb5YYUSAY0oxMjKvnA3B=K-b151+mQ51oQ@mail.gmail.com>
	<9ebe5e019aa41e1c79cae9f0657b044687701759.camel@linuxfoundation.org>
	<CANNYZj8JaWrOctDzoG7gXxWUa4TZUBSLo-S-8Xk=xSzin_egMw@mail.gmail.com>
	<f0c8a17ce2765737f45f6b4b07910cb27d59b1b8.camel@linuxfoundation.org>
In-Reply-To: <f0c8a17ce2765737f45f6b4b07910cb27d59b1b8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jan 2020 19:26:41 +0100
Message-ID: <CANNYZj8wVGSVRHrgyeXUKT-E0OJLKgCqzaunXN8kg7rOgQ1M9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Wed, 15 Jan 2020 18:26:51 -0000
Content-Type: multipart/alternative; boundary="00000000000039d251059c31da9b"

--00000000000039d251059c31da9b
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2020 at 19:37, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> The autobuilder failed with this again, I went in and the first bit of
> debugging I added was to say which file its failing on. Answer was:
>
> WARNING: python3-3.8.1-r0 do_package:
> ./package/usr/libx32/python3.8/__pycache__/_bootlocale.cpython-38.opt-2.pyc
>
> so for some reason the ownership of the pyc file (or files) is suspect.
>
> I did a quick inspection of the pseudo database and its only this one
> file. That leads me to suspect its a race in how its being
> generated/owned...
>

I started looking into this - the likely culprit is this commit
https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a41504
which introduces parallel .pyc compilation. Previously (in 3.7) the
bootlocale.py file was compiled only once, and now I am seeing this in
log.do_install:

/home/alexander/development/poky/build-x86-64/tmp/hosttools/install -c -m
644 ../Python-3.8.1/Lib/_bootlocale.py /usr/lib/python3.8
Compiling
'/home/alexander/development/poky/build-x86-64/tmp/work/core2-64-poky-linux/python3/3.8.1-r0/image/usr/lib/python3.8/_bootlocale.py'...
Compiling
'/home/alexander/development/poky/build-x86-64/tmp/work/core2-64-poky-linux/python3/3.8.1-r0/image/usr/lib/python3.8/_bootlocale.py'...
Compiling
'/home/alexander/development/poky/build-x86-64/tmp/work/core2-64-poky-linux/python3/3.8.1-r0/image/usr/lib/python3.8/_bootlocale.py'...

I don't yet know how this file ends up being compiled several times, or
whether they indeed race.

Also I am still unsure how it ends up with the wrong ownership. Hints?

Alex

--00000000000039d251059c31da9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 14 Jan 2020 at 19:37, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
The autobuilder failed with this again, I went in and the first bit of<br>
debugging I added was to say which file its failing on. Answer was:<br>
<br>
WARNING: python3-3.8.1-r0 do_package: ./package/usr/libx32/python3.8/__pyca=
che__/_bootlocale.cpython-38.opt-2.pyc<br>
<br>
so for some reason the ownership of the pyc file (or files) is suspect.<br>
<br>
I did a quick inspection of the pseudo database and its only this one<br>
file. That leads me to suspect its a race in how its being<br>
generated/owned...<br>
</blockquote><div><br></div><div>I started looking into this - the likely c=
ulprit is this commit</div><div><a href=3D"https://github.com/python/cpytho=
n/commit/1a2dd82f56bd813aacc570e172cefe55a8a41504">https://github.com/pytho=
n/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a41504</a></div><div>whi=
ch introduces parallel .pyc compilation. Previously (in 3.7) the bootlocale=
.py file was compiled only once, and now I am seeing this in log.do_install=
:</div><div><br></div>/home/alexander/development/poky/build-x86-64/tmp/hos=
ttools/install -c -m 644 ../Python-3.8.1/Lib/_bootlocale.py /usr/lib/python=
3.8<br>Compiling &#39;/home/alexander/development/poky/build-x86-64/tmp/wor=
k/core2-64-poky-linux/python3/3.8.1-r0/image/usr/lib/python3.8/_bootlocale.=
py&#39;...<br>Compiling &#39;/home/alexander/development/poky/build-x86-64/=
tmp/work/core2-64-poky-linux/python3/3.8.1-r0/image/usr/lib/python3.8/_boot=
locale.py&#39;...<br>Compiling &#39;/home/alexander/development/poky/build-=
x86-64/tmp/work/core2-64-poky-linux/python3/3.8.1-r0/image/usr/lib/python3.=
8/_bootlocale.py&#39;...</div><div class=3D"gmail_quote"><br><div>I don&#39=
;t yet know how this file ends up being compiled several times, or whether =
they indeed race.<br></div><div><br></div><div>Also I am still unsure how i=
t ends up with the wrong ownership. Hints?<br></div><div><br></div><div>Ale=
x<br></div></div></div>

--00000000000039d251059c31da9b--
