Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id BD0A47D9D5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:24:16 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id h13so993536vkn.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QzCU+SXpgUZ+y09GqoyhxuyBYtmLBfv6V/ZUKN25xMs=;
	b=TQwaJEpusJDX3QROH/OB43aVRmCillbIl/9BSS/n6KYniu3QduYl7zEdP1qMwvjPZ8
	JE0Sf4tJRd3e76P00Qb+gF1yk7tqTNB/+SC+FrBcJAFtHtqKVDkdeydlpOaTJzM+cHE9
	DneH07iLA+U6hBFBfZHlaKhjNfi7CHiOzCPraBV3XMVNPb8+gmVVd0OTxd5VDhABSYYg
	Viy/5j7Vt4Iv2LTh1ryCA8EczzVKS9MgQKVptQir/01E8gP31qavzNHdY0F4ME8EdC+/
	SWUqKE56zkA7qsMXc7et+xv6hxVLosgw0zZelmuSGKZWKR+mXBDD28UCm+i3BWrXfdtj
	zq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QzCU+SXpgUZ+y09GqoyhxuyBYtmLBfv6V/ZUKN25xMs=;
	b=B/zRH/EgxJEvDWaf5CJZX8IxTRAvSL6EhAxUxD0MbFJj5AtnRYjo2oNpNccFw1baR0
	OZD25wDAuXHLU3pqxqP5EHQUVaGTqwo/IkTxzob95F3ZA1vW0UH4RIkFOI6zpfgyEynp
	oLDMjaiKeRejzE8YAFG+CnEfST+AyH4tdVz3dlD1IV+jNJoQ74XYDVdi/xrYSrHHKrvt
	UKXGEcmLXj+yGcdgJIXYAmdK4y1+p49V8rX5F11zdm8taJqfmk8/7LqNTJKjyugOIYR5
	1QMDE8o2cKLUkiA2o6IIiJU50C4w4O0s6H0NAyGgXOfwOHLYn86kEhmCLxpacgSbaxGP
	fcrg==
X-Gm-Message-State: APjAAAUO8WloPk2hRIqpDjiCP/+4zKcgrb/Oo1xwVVFYJEUorI6ysEy5
	/ZY98pGjrmqcKIJyIAJBPyLKmCDcCgLSg222FYw=
X-Google-Smtp-Source: APXvYqxGhBToNNkoQZkGdZX2aL0+1tFYAP9nHgVOB6i/ZfRmfe7+WYdnvCkqONQYcANEgP4Ez8sJ11ox2xA1tg+AMGQ=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr21182259vkq.49.1576430657558; 
	Sun, 15 Dec 2019 09:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-20-alex.kanavin@gmail.com>
	<e4288403d08c96589c285bcb3fb5ccda219809a1.camel@linuxfoundation.org>
	<CANNYZj_Fj1KZoTDxsVzyJ_4Ya9KHOys9LsY1OQgm4UogC_xd-A@mail.gmail.com>
	<CADkTA4MyfWZfd-a9jqhTOHtFyM0RW2Mo5aDa48zy817=1g0WXQ@mail.gmail.com>
	<CANNYZj8x+iQmMAhHkv4yNu8dWfv7VgoE4jW2D-8HnjVeOwYPgQ@mail.gmail.com>
	<afbc6e41d1dd42e39b715bdc48a135f3a93ceb1c.camel@linuxfoundation.org>
In-Reply-To: <afbc6e41d1dd42e39b715bdc48a135f3a93ceb1c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 18:24:06 +0100
Message-ID: <CANNYZj8vMukHUWvJ96Q8R7fFtQ2Z=C-R4XorH7-KuZyedoyRVA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/30] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Dec 2019 17:24:17 -0000
Content-Type: multipart/alternative; boundary="0000000000005b5e0f0599c15dfc"

--0000000000005b5e0f0599c15dfc
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Dec 2019 at 18:16, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2019-12-15 at 17:45 +0100, Alexander Kanavin wrote:
> > On Sun, 15 Dec 2019 at 17:28, Bruce Ashfield <
> > bruce.ashfield@gmail.com> wrote:
> > > > Another problem is that devtool isn't able to upgrade the main
> > > variant properly with this included. I'd rather split it it into a
> > > different recipe, if someone confirms the need.
> > >
> > > It is definitely needed.
> >
> > Right, then I'll rework this patch to split the dev version into a
> > separate recipe with a shared .inc.
>
> Can we teach devtool to be able to handle this?
>
> In the back of my mind I'd still like to get poky-bleeding back running
> to try and get earlier warning of upstream breakage.
>
> This sets a precedent of disallowing devupstream in recipes which I
> don't really like the idea of :/
>

Maybe a quick fix would be to tell devtool to ignore devupstream, I'll take
a look tomorrow.

Alex

--0000000000005b5e0f0599c15dfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Dec 2019 at 18:16, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2019-12-15 at 17:45=
 +0100, Alexander Kanavin wrote:<br>
&gt; On Sun, 15 Dec 2019 at 17:28, Bruce Ashfield &lt;<br>
&gt; <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.as=
hfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Another problem is that devtool isn&#39;t able to upgrade th=
e main<br>
&gt; &gt; variant properly with this included. I&#39;d rather split it it i=
nto a<br>
&gt; &gt; different recipe, if someone confirms the need.<br>
&gt; &gt; <br>
&gt; &gt; It is definitely needed.<br>
&gt; <br>
&gt; Right, then I&#39;ll rework this patch to split the dev version into a=
<br>
&gt; separate recipe with a shared .inc.<br>
<br>
Can we teach devtool to be able to handle this?<br>
<br>
In the back of my mind I&#39;d still like to get poky-bleeding back running=
<br>
to try and get earlier warning of upstream breakage. <br>
<br>
This sets a precedent of disallowing devupstream in recipes which I<br>
don&#39;t really like the idea of :/<br></blockquote><div><br></div><div>Ma=
ybe a quick fix would be to tell devtool to ignore devupstream, I&#39;ll ta=
ke a look tomorrow.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000005b5e0f0599c15dfc--
