Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
	[209.85.221.178])
	by mail.openembedded.org (Postfix) with ESMTP id F1B536152C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 16:02:14 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id o187so276342vka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 08:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2P8mL+iXkGCz/Vuwl4M6RShRn3HzwbKnZr405omkINA=;
	b=Ac/+5RVXTDoUY9FOoddxb+Lf7AycUP8tlkt92YCfXB1V1Oekt3tHN9kQok0nzQqOCV
	wJkJ71Khoi9PNKzV3yo6PeHEj0ESoYvryoselXK+PJSWyiG+bcc8T/eqEZOhseDz1l6H
	J7ATr9jSX/fMJKERgH6z1910ZTNahOPLFod3Get7TEdBj6SsYPyOhFT7w6AYEvH6rERs
	phuiY21LkGi7qO61Hu8vnb62bX6m8eAmhhVCcJ5+8A5DnYB2n8PsWr7by2VnV1zU2oS2
	/KojagE0oim13RBJpPYKLq0jVNVSDAcgJVPQSufiRN+M1HqpbCMBLXORh3Q4qmPx0J6x
	cTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2P8mL+iXkGCz/Vuwl4M6RShRn3HzwbKnZr405omkINA=;
	b=dlpQGeudcdRjvZWFa/cgA11GdUPKgl4MePRGRev2VEffMaROx47zlpqaIiG80Br2i3
	NnwW9+WS6uIpjnaJIl1DLkn8e612enz2ZP3zszpfClZrVG2r75zANTueIkSyI5NM2Sox
	/OzbslXdQxPcX1zesuReaOnGz3of4psW+mFOzeoCrWvmrbxTZkg4CDJ/4wYXO5KEgGLh
	O0DOyYcMVBst1Oc/A8Uz4lhmLzDhOXt+lCzTlj6Yu1/Bd8oumDZm51ynhSNaQe/goazs
	JR9/dUNi3QSESP95J5R2tyAEKTXJ5kYl1K7Ide6neQGyeW+eHpkj20pqP0E5aEC6T4qa
	8zyg==
X-Gm-Message-State: APjAAAUkhzCyx8o5yDmnvwDcaTYq333o8j1qxmpO8N0dEI7mJLu4X+v1
	OsGGIGF8+6juN4tbf8a3S0YiMKgSrrMH+qJfCfY=
X-Google-Smtp-Source: APXvYqznQwlvgs9HY7p9Jlx7nzEjPL23w8z4Ejm+/iHvKXRHKiPHeGvWw2wpD1Ywos/VYltDLivi2lxAALdaBBhK7zg=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr10946086vkq.49.1582128133865; 
	Wed, 19 Feb 2020 08:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
	<CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
	<20200219152720.GM17818@joraj-alpa>
	<143f590b688ed8166a702873275c16f3c7217d52.camel@linuxfoundation.org>
	<20200219155626.GN17818@joraj-alpa>
In-Reply-To: <20200219155626.GN17818@joraj-alpa>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2020 17:02:37 +0100
Message-ID: <CANNYZj9t2+ugT15XbYrqkgA23MHEQxy_9t=PnutoCQr2f0AA-A@mail.gmail.com>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Wed, 19 Feb 2020 16:02:15 -0000
Content-Type: multipart/alternative; boundary="000000000000688402059eefe9ab"

--000000000000688402059eefe9ab
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2020 at 16:56, Jonathan Rajotte-Julien <
jonathan.rajotte-julien@efficios.com> wrote:

> > There are some things where the namespaces are quite specific (python
> > vs python3, gtk(+) 2/3/4, qt) but they're fairly few and far between.
> >
> > If babeltrace2 will replace babeltrace and become babeltrace, we
> > probably want to keep PN as babeltrace. If it will be known as
> > babeltrace2 always, we probably change PN.
>
> Babeltrace 2 executable will be forever named babeltrace2.
>
> Hope this clear up this part a bit.
>

Right, then I'm fine with naming the recipe babeltrace2.

Alex

--000000000000688402059eefe9ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 19 Feb 2020 at 16:56, Jonathan Ra=
jotte-Julien &lt;<a href=3D"mailto:jonathan.rajotte-julien@efficios.com">jo=
nathan.rajotte-julien@efficios.com</a>&gt; wrote:<br></div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex">&gt; There are some things where the namespaces=
 are quite specific (python<br>
&gt; vs python3, gtk(+) 2/3/4, qt) but they&#39;re fairly few and far betwe=
en.<br>
&gt; <br>
&gt; If babeltrace2 will replace babeltrace and become babeltrace, we<br>
&gt; probably want to keep PN as babeltrace. If it will be known as<br>
&gt; babeltrace2 always, we probably change PN.<br>
<br>
Babeltrace 2 executable will be forever named babeltrace2.<br>
<br>
Hope this clear up this part a bit.<br></blockquote><div><br></div><div>Rig=
ht, then I&#39;m fine with naming the recipe babeltrace2.</div><div><br></d=
iv><div>Alex=C2=A0</div></div></div>

--000000000000688402059eefe9ab--
