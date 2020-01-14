Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 313F17FA18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 22:18:55 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id v12so9290499vsv.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TZVDVoMk+SFtciZALYKVQS04xsuHxtyfsuH6+WWesaY=;
	b=UvpNwYc+HLOwOYFlSb/nz5yZBiGRheiYVFNIEkNISEzwI6xloZxpHbrCF+Xf6L9P4k
	IS7c90MRWNbWnTFBbAa3ivoUUP7ZItvJ39c9bxuYO8Dd1ZpOIzTjnDb0b5LxkjgpTQBb
	ugLKxLIt1j3o9vPbLOiDxFQJSwrk48XNdmDhpIPlPsBIupTh92w0QshOXrc691Qn7+oG
	hvmvE173+5yWFROwBKRQ0CR026Y9n7NZBJFfhfegLHW9XgFXwmb0wXPQBOevOQ5NW5vC
	qJWySQEnLqMz5BKdsLDnoq4CfzhBhc9HJ3Zqq/U7RLBEHzul2WDz7Ykl11T5m5fxcnkv
	oBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TZVDVoMk+SFtciZALYKVQS04xsuHxtyfsuH6+WWesaY=;
	b=Bhm6TPcSEtUEcQhgn7d5EZmBsHUN0zVel6i0/dI2SNml4l0yOqjlPgxmk8Loh5s3ka
	sYQ+u4/v5MhFE70oHM2i0fhccT9SzhuqpHqqZma1cGudTxhmDNKZ7T25QzGmjMotjXeU
	Cb2SRz3pSEtSC4tZqdYjEo9AnX/06KI0CIfrb+MQYHMEiw25JJlSm9l4iWp/LP8aYvO1
	s7jHKGREA9g5vqiPWxxhFhIzMHeX66LeKjGl1Le19WaJNt8vPsjc3DZJtQk1Cm+fb2Vf
	oePig9VHgrjDubv5oB6UAuuB4Q6JU95rbb++chjlOrRlTnDmolc4GoUCxziDuDHyu3tO
	7EMA==
X-Gm-Message-State: APjAAAV6+RMEUZUlMlKHnWm9SWfK+fFYnZUkeHv9mdI6/hY8LaT+yPm4
	1/eDMLcplNG9z4bcaT6tE4dyCc/Q5/tSTz6qLGvwo93ekr0=
X-Google-Smtp-Source: APXvYqyhVsxQi8dlooAJiJzHVMcIv5ia6iMIV5WtSjdtFDR3KVxSCjqAvKkhRLQkOcdFAmzO35dRFFNyEtt62gtpHm4=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr2551551vsq.94.1579040336035; 
	Tue, 14 Jan 2020 14:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
	<13AD08C4-930D-479F-81E7-3B6405C3BD94@gmail.com>
	<e0a7cf43-7d0b-5318-22de-9009d702061f@windriver.com>
In-Reply-To: <e0a7cf43-7d0b-5318-22de-9009d702061f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2020 23:18:44 +0100
Message-ID: <CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: update from 8.1.1518 to 8.2.0110
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
X-List-Received-Date: Tue, 14 Jan 2020 22:18:55 -0000
Content-Type: multipart/alternative; boundary="00000000000050c7a3059c20fa65"

--00000000000050c7a3059c20fa65
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2020 at 21:10, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Oleg is getting started using Yocto so I'll reply on his behalf since
> I asked him to update vim as his first commit.
>
> I'm not sure what you mean by 8.2. Are you talking about calling the
> recipe:
>     vim_8.2.bb
> instead of vim_8.2.0110.bb?
>
> Vim tags on a daily or more frequent basis. Are you saying that we
> should keep the
> same SRCREV for 8.2.0110 but use a different name?
>
> I looked at:
>     git log v8.2.0000..v8.2.0118
> and all the commits seem to fix bugs so I prefer to take this tested
> v8.2.0110
> update and update vim every month or two so that we get the latest fixes.
>

Vim adds a tag for every single commit they make, fixes or not, so this
approach would in effect be updating to random development snapshots. I
would rather have a more conservative update strategy, and update to the
original 8.2 release. If you look at the homepage, 8.2 is the version they
announced as the new release: https://www.vim.org/

That's also what 'devtool latest-version vim' should currently report and
'devtool upgrade' upgrade to: I purposely cut off the point releases and
left only the major.minor part there.

Alex

--00000000000050c7a3059c20fa65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 14 Jan 2020 at 21:10, Randy MacLe=
od &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriv=
er.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Oleg is getting started using Yocto so I&#=
39;ll reply on his behalf since<br>
I asked him to update vim as his first commit.<br>
<br>
I&#39;m not sure what you mean by 8.2. Are you talking about calling the re=
cipe:<br>
=C2=A0=C2=A0=C2=A0 <a href=3D"http://vim_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">vim_8.2.bb</a><br>
instead of <a href=3D"http://vim_8.2.0110.bb" rel=3D"noreferrer" target=3D"=
_blank">vim_8.2.0110.bb</a>?<br>
<br>
Vim tags on a daily or more frequent basis. Are you saying that we <br>
should keep the<br>
same SRCREV for 8.2.0110 but use a different name?<br>
<br>
I looked at:<br>
=C2=A0=C2=A0=C2=A0 git log v8.2.0000..v8.2.0118<br>
and all the commits seem to fix bugs so I prefer to take this tested <br>
v8.2.0110<br>
update and update vim every month or two so that we get the latest fixes.<b=
r></blockquote><div><br></div><div>Vim adds a tag for every single commit t=
hey make, fixes or not, so this approach would in effect be updating to ran=
dom development snapshots. I would rather have a more conservative update s=
trategy, and update to the original 8.2 release. If you look at the homepag=
e, 8.2 is the version they announced as the new release: <a href=3D"https:/=
/www.vim.org/">https://www.vim.org/</a></div><div><br></div><div>That&#39;s=
 also what &#39;devtool latest-version vim&#39; should currently report and=
 &#39;devtool upgrade&#39; upgrade to: I purposely cut off the point releas=
es and left only the major.minor part there.<br></div><div><br></div><div>A=
lex<br></div></div></div>

--00000000000050c7a3059c20fa65--
