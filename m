Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id A68B97EC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:06:54 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id n9so17035462vsa.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 07:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QqMbcQNhn6Jdvli072tgZ7nwCV7iojC24IwsBKILIzI=;
	b=knys/tyQYIcoYghMTzwsZzjZylXTj6BRhlhC25whKTRVTRG3NHgUy9YrRhvovnwNgO
	0L84/hqqNbfKJCjilizEfi0w2MTSNFw16i/BqhDgnouvhDij9W8BxdAlfszHfpblZM5v
	rLWBfot726K8cwlSCJ6jTtqlMMmCj4RuzZyEUZu6o/lsmsSeBSP9a598iTQ/nbqWIb1+
	E1OI+nT6m2N0sWuaHZ3hqW3i7WsVmQuuuzbeavIOUuG+pxgZcvtpK/8Mgp0VnffpxFPt
	NnAtWWgHRzPzg8Q4C1qbb23d7DJHPBehmgPaS4dlt8QcBmw/YN/WlRtlsjDq1VR5ZrR/
	ALcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QqMbcQNhn6Jdvli072tgZ7nwCV7iojC24IwsBKILIzI=;
	b=md1YeMwJ+aSPu0+QQCjzuLA2DLfDFCtynnVSfK17C6qCgXiwwfuJXt8OjF/L985A0X
	w5RXYAfSfrXR8zQ+JXCCKH0WVnMwGOiZNpoKi0o81GCzdqiY3X449erLoI8N4L+eDYev
	NkSCgLxgu0+4RIf8Owicwym8e6i4/Li4j+2uWKflrBuL7IrthDKtbIx8bU8IrSPpvaZ7
	5+uoRiV8q2F9LlouXV9j/Q+NMvJh7tpLngPpjCO7xHlUjZo69oye4nf77vnnTS+wRjpy
	w/ZDv7Zr7FcPJYrCGWcVMH6h9MxovsnGbSYnrtRKKzVBg19r+M0zv3d1nmqMwnlBzgAb
	puuQ==
X-Gm-Message-State: APjAAAVAw5IXOiDBdECyadQ5k9C3teRhpU7I5YXEKQiUxE4Nr5kEcA+O
	WoJGXlgOpiaQnbiO2FoJjP1qvpTCtwjpktbBUHc97YT6z9k=
X-Google-Smtp-Source: APXvYqxcwAJ6JtB5FZml/1EVW+5wXbAs1EcOjRRGEF8NaQrtygY9umDyJIGj8AkVbONT1LB+pJwDS838SRbCe6H4lCg=
X-Received: by 2002:a67:efd2:: with SMTP id s18mr1924494vsp.94.1574262415524; 
	Wed, 20 Nov 2019 07:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<20191120125602.GZ19317@bill-the-cat>
	<CANNYZj-EUQb2gjw923rv-fMDOaGn+fe59AnA7B9oSkgk6de_xQ@mail.gmail.com>
	<20191120135008.GA19317@bill-the-cat>
In-Reply-To: <20191120135008.GA19317@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 16:06:44 +0100
Message-ID: <CANNYZj8nfXL1DOqvRSwdKxizfFiNRNuA0hFgHDa-LS47UTo+KQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Wed, 20 Nov 2019 15:06:54 -0000
Content-Type: multipart/alternative; boundary="0000000000000f87eb0597c88822"

--0000000000000f87eb0597c88822
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 14:50, Tom Rini <trini@konsulko.com> wrote:

> Well, the release is scheduled for January 6th.  I'd really like to see
> more testing in no-python2 environment.  I believe the Fedora folks have
> confirmed things are good now but it would be good to see OE do it too,
> especially on master and not too close to branching out another release.
>

I made a few patches to do that, and can confirm that various flavours of
u-boot recipe build without issues.

If someone else wants to test a py2-less poky with their builds, here it is:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/drop-python2

Alex

--0000000000000f87eb0597c88822
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 14:50, Tom Rini &l=
t;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Well, the release is scheduled for January 6th.=C2=A0 I&#39;d re=
ally like to see<br>
more testing in no-python2 environment.=C2=A0 I believe the Fedora folks ha=
ve<br>
confirmed things are good now but it would be good to see OE do it too,<br>
especially on master and not too close to branching out another release.<br=
></blockquote><div><br></div><div>I made a few patches to do that, and can =
confirm that various flavours of u-boot recipe build without issues.</div><=
div><br></div><div>If someone else wants to test a py2-less poky with their=
 builds, here it is:</div><div><a href=3D"http://git.yoctoproject.org/cgit.=
cgi/poky-contrib/log/?h=3Dakanavin/drop-python2">http://git.yoctoproject.or=
g/cgit.cgi/poky-contrib/log/?h=3Dakanavin/drop-python2</a></div><div><br></=
div><div></div><div>Alex<br></div></div></div>

--0000000000000f87eb0597c88822--
