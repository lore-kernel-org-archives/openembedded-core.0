Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
	[209.85.221.180])
	by mail.openembedded.org (Postfix) with ESMTP id C10A77EC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:58:04 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id t136so323478vkt.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WKKBJWndiaISMAWY3gbBKp+bXjASYZuDn4SwZT7AQo8=;
	b=nZjGehnAbMBpOZLWWHahIt56isEUkViRt4kPHLrdOHzIoJWiuLf8ZcBmN1YeIimu2b
	n7mw3rQIW7wUuzDOZcwMJVT49J2ZZsKpANGXLefsUaRrniUVKY8fU5o3lny/Mjt4yf4e
	mDqIpIpAkbYpiv+nWdok8/LRoZm3wRueUcIABsBJ6u/Vl27ZDJHgFuQSB5P43Ma2jv4t
	TRO2+NK7dIMcISSu6fMDXYlDHDSIW5JHL4+wixeREcbSt1trW112nrHRzFVzaW3vCR3u
	YxZTVnmp2wVFlqKIncAaz9RnCJECu1r+SzlatfVfeFYjqvGzEKJg8Wq7XtlgkNirgJ7n
	Nu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WKKBJWndiaISMAWY3gbBKp+bXjASYZuDn4SwZT7AQo8=;
	b=IeSE4yKLaq5tmhXM/f2Mb8+HL9Rrj5EypuaWr7v4eyYKp5rgWk+NPBsRcNDGHPsvlJ
	EmHPFd8bdezsk9gg4rpryGnOZ//B8v9AVlOGirGWYu9YLX7v//w9JQXZAR2kanSN77en
	plHwQ3YVbQ3RJmreWvaClukySj5hUCjRcX3j/0sWsH2vIHhcqvjyC17ZCrAEAh7rxXXY
	zcp+vR1e2Itb4rLsblNr9EtGLWf9Rv6AGM20zuIfzj1jKpaE71Epkmhv+mAu+FR0ahSr
	Ir3wrGxXNl+UTsMAnI2D9z23oqqdc8/juAcgnJemdJERk6j+Oa/rB+8aIDtpBoF2IBXZ
	xOow==
X-Gm-Message-State: APjAAAXG8EggBXVH+4EezJfixupGfoCPY/r/7BQ77taDq3kS2gtXlyyu
	9vEBhHPXXX474EjkThIVo40YIoxGm6YD0kjPMrc=
X-Google-Smtp-Source: APXvYqxurc8vDrz7ZuQSLNPUFZhLgRE99SEZJKbefCouwNvqF89k2YDB+7dwNFGaFxwdZIrpy9/ouR+XyP17PfFr+4A=
X-Received: by 2002:ac5:c290:: with SMTP id h16mr3383380vkk.59.1567025885458; 
	Wed, 28 Aug 2019 13:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
	<d37172d226a0570d66859adf37c18b3212d6e4bf.camel@linuxfoundation.org>
In-Reply-To: <d37172d226a0570d66859adf37c18b3212d6e4bf.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2019 22:57:54 +0200
Message-ID: <CANNYZj88ktNJ1TZQ2-yZ5YZOJCpJ-R3+CA8QznmG7qxdVD8EDg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 20:58:05 -0000
Content-Type: multipart/alternative; boundary="00000000000041bcaf059133a517"

--00000000000041bcaf059133a517
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2019 at 22:12, <richard.purdie@linuxfoundation.org> wrote:

> > Yocto 3.0 ships and supports Python 2.7, so there is no urgent need
> > for
> > last-minute Python 2 -> 3 changes.
>
> Removal of 2.X dependencies where we can was an objective of 3.0 and
> 2.X is EOL and will expire in the lifetime of 3.0. I'd say this is
> therefore quite in keeping with that...
>

I just sent the ltp patch, the last remaining target piece. What remains is
eliminating the undercover usage of host python2 at build time (I am now
running test builds to determine what needs fixing), and then dropping py2
from self-hosted packagegroup and HOSTTOOLS. Once we're there, we can
remove py2 recipes from oe-core (which will probably happen after 3.0 is
out).

Alex

--00000000000041bcaf059133a517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 28 Aug 2019 at 22:12, &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Yocto 3.0 ships =
and supports Python 2.7, so there is no urgent need<br>
&gt; for <br>
&gt; last-minute Python 2 -&gt; 3 changes.<br>
<br>
Removal of 2.X dependencies where we can was an objective of 3.0 and<br>
2.X is EOL and will expire in the lifetime of 3.0. I&#39;d say this is<br>
therefore quite in keeping with that...<br>
</blockquote><div><br></div><div>I just sent the ltp patch, the last remain=
ing target piece. What remains is eliminating the undercover usage of host =
python2 at build time (I am now running test builds to determine what needs=
 fixing), and then dropping py2 from self-hosted packagegroup and HOSTTOOLS=
. Once we&#39;re there, we can remove py2 recipes from oe-core (which will =
probably happen after 3.0 is out).</div><div><br></div><div>Alex<br></div><=
/div></div>

--00000000000041bcaf059133a517--
