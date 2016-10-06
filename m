Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72137606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:46:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p138so2882481wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gAnwXnlsuIuBAhvr9SdbIs4ijdDULNQxFblLgzexTmI=;
	b=iqKj4qY2KH3pmdoR87mY3lJsJVPCraVer2adK0apuon5rGDb1irPvO+ytb1R92LDd3
	hY3ChqoL4HiMiFRNvJffUFfg2H7t6gxVub+NWbGr83ODyQeFtaiPiXSt+r1w7awcnwAJ
	46sgRVFnxy7bNujiJ6seaMvPnTzAkXRKUP3dJCQnrklQI/ffvicZ6yAEvh/sn6vGLm+H
	lRBOdUasfn5Itw0rf3jdy5+617wHf2ebbX6L2DfKVHXx0iqcf0GrXkHp2BTLoUlpCIlo
	u/j2pWXWoDa5VpXaU3A4nwF3cx5vUJ23cwSsBBt3x2UKsijqRyZkUkEbw41MHQb5n+Yq
	Sjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gAnwXnlsuIuBAhvr9SdbIs4ijdDULNQxFblLgzexTmI=;
	b=bMlbJ4mLolRkYe655P6x8tfvDGad+0coG8UE7900REyvLyZkD4tbLR8mmv3r0zkkHf
	DQqaXB8Xx0Ckb9r8Ih+sk6CbejXFGNs7Yzbmqp2FOq12pyANNb0w4IjhnoWnSvyx9obY
	ZWbJ0UoqEOjZaMW6HzXFtGLqGGSKO/+kZckhoVpiMv7ONVltaYoxukVsAeAsVQfNo23J
	XQEu5sM1TwfVl4806BvwvSUhYs/sreoamf7itG1mNqFj+JuIW28tuvHdJlSf30w4cicd
	sqPh89Xd6e5bV9mXHGQYYqXvkDPdI36bfPBU6UiT5e3xIa0iiypArsBfZcsQDfNEVLR7
	mXzQ==
X-Gm-Message-State: AA6/9RlVfxPwjnS4hXVcN6wULvrGtc9UeomVhA2OVRnQZrrl8g7sk5Luafz8LJ1iEQ6XvnQHJ43p3P+fveag3Q==
X-Received: by 10.28.41.131 with SMTP id p125mr7887524wmp.15.1475750819293;
	Thu, 06 Oct 2016 03:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Thu, 6 Oct 2016 03:46:58 -0700 (PDT)
In-Reply-To: <1475750706.30475.539.camel@linuxfoundation.org>
References: <20161006082332.29189-1-Martin.Jansa@gmail.com>
	<1475750706.30475.539.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Oct 2016 12:46:58 +0200
Message-ID: <CA+chaQeh3Y2jYm97R6cWw3OvuQrTqHQn1NMWaUfGjFRQN4okEQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] binutils: fix AR issue when opkg is unpacking IPKs containing empty entries
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
X-List-Received-Date: Thu, 06 Oct 2016 10:46:58 -0000
Content-Type: multipart/alternative; boundary=001a114e262e5c6f03053e3003bf

--001a114e262e5c6f03053e3003bf
Content-Type: text/plain; charset=UTF-8

Strange,

it's included here:
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/krogoth-backports

until next rebase it's this commit SHA:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/krogoth-backports&id=9d56d74bc2f42cbd6ee6ad1dbddb378a020bbe93

Thanks for quick reply

On Thu, Oct 6, 2016 at 12:45 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2016-10-06 at 10:23 +0200, Martin Jansa wrote:
> > ++    # This commmand used to fail with: "Malformed archive".
> > ++    set got [binutils_run $AR "-t $archive"]
> > ++    if ![string match "empty
> > " $got] {
> > ++    fail $testname
> > ++    return
> > ++    }
> > ++
> > ++    pass $testname
>
> The patch fails to apply due to the above corruption (line not starting
> ++). Could you resend or point to a branch with the patch on please?
>
> Cheers,
>
> Richard
>

--001a114e262e5c6f03053e3003bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Strange,<div><br></div><div>it&#39;s included here:</div><=
div><a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=
=3Djansa/krogoth-backports">http://git.openembedded.org/openembedded-core-c=
ontrib/log/?h=3Djansa/krogoth-backports</a><br></div><div><br></div><div>un=
til next rebase it&#39;s this commit SHA:</div><div><a href=3D"http://git.o=
penembedded.org/openembedded-core-contrib/commit/?h=3Djansa/krogoth-backpor=
ts&amp;id=3D9d56d74bc2f42cbd6ee6ad1dbddb378a020bbe93">http://git.openembedd=
ed.org/openembedded-core-contrib/commit/?h=3Djansa/krogoth-backports&amp;id=
=3D9d56d74bc2f42cbd6ee6ad1dbddb378a020bbe93</a><br></div><div><br></div><di=
v>Thanks for quick reply</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Thu, Oct 6, 2016 at 12:45 PM, Richard Purdie <span di=
r=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D"">On Thu, 2016-10-06 at 10:23 +0=
200, Martin Jansa wrote:<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0# This commmand used to fail with: &quot;Mal=
formed archive&quot;.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0set got [binutils_run $AR &quot;-t $archive&=
quot;]<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0if ![string match &quot;empty<br>
&gt; &quot; $got] {<br>
&gt; ++=C2=A0 =C2=A0 fail $testname<br>
&gt; ++=C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0pass $testname<br>
<br>
</span>The patch fails to apply due to the above corruption (line not start=
ing<br>
++). Could you resend or point to a branch with the patch on please?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--001a114e262e5c6f03053e3003bf--
