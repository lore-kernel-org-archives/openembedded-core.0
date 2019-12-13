Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15EB17F83B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 13:22:04 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id d8so759763uak.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5dQSKwZ97hMt8C98LjNnFkWTBnQ0qIeyxTQZ794njUo=;
	b=bE/bNv8DE5IIRYxSG6P+gDM6fQDpPsrwmUyCawBdfqPSaay6Yfl4uwGNH+FZa79QII
	OEe3CSSjKIYu/wHfeX4vkAwUboKTcC4hWVzKXYS+dpYoR6lbgF1hIylTQ1lvxZG/EbDX
	+4al/QXi0BnWAPMfHeyoqm0nabWOYVm9aly+xOqtNWfXjb2Vz12xGtKAty1orEyw5yeR
	93ilS6M8CQFMHAZdTxnCxZhJxapw03RK8L7lgGcnXB3iJpts0SVLdVStu6392KRnXHuB
	h370JVqHkQm26xVjX9o6tTbiLYpZUYJx5a3p04Ns+UHC1bo336ggdnRPraBuXmE/M64W
	QJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5dQSKwZ97hMt8C98LjNnFkWTBnQ0qIeyxTQZ794njUo=;
	b=TImU5/vB14JfAPzbHrSYG6NlF493j0NR4iyEzMOzYbTuHHu+kXgu9dznogLewq7YE9
	kh0q/uxTj5EFe7gLa1RWwSwRiuqhkHSkyyCdTF6SNtAp/6cvbmCSetNZR2BtwGdzDffD
	Y4OMiN09lwU2MByZMKXZ5+jZNWLDreLz7fESx1hHqPfgxIZa78CSSTZQmrNO0m4X5J4S
	ATYkxqGKWAyVOUj9RmO3O1ESLljDy0w6gRfwaoeuXUyIMNFyZ+u6AQbL6ht87bOgB9sD
	jMCAeD06o97lDp1e8j7uOvCIpcO3jgQqMKDaZHxjwT/h1eJaFCbAXfVgiXCV+EvXbyYx
	aIVg==
X-Gm-Message-State: APjAAAV1JVciTRiMFTTaq1XGvKzzVnu3UmHoFaSt1fsalbNs+YFN3qNR
	KtN+gUO9ZSlBWsNoPMuQhkRzBIsVxWffdNTBA70=
X-Google-Smtp-Source: APXvYqyADVKRc0oKfd1Xmsrl2MrYQwrhnILzhjvKSHMv9aG1fKHKM46/gPTINBGveur6CPjjs0TogCFTC6cwr0M9knI=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr13294613uar.100.1576243325661;
	Fri, 13 Dec 2019 05:22:05 -0800 (PST)
MIME-Version: 1.0
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
	<699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
In-Reply-To: <699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Dec 2019 14:21:51 +0100
Message-ID: <CANNYZj8u8ZkM1ZbbKnXpnUL8LtUwChAtJRi3pfsfeek3BzEa8Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denys@ti.com>, Jon Mason <Jon.Mason@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Fri, 13 Dec 2019 13:22:05 -0000
Content-Type: multipart/alternative; boundary="0000000000008175b7059995bfcc"

--0000000000008175b7059995bfcc
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2019 at 19:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2019-12-04 at 07:09 -0800, Wang Mingyu wrote:
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} (98%)
>
> Fails on beaglebone:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1327
>

I had a look into this: the issue is that new versions of nss require
hardware crypto capabilities on ARM (both 32 and 64 bit).
This means we have to disable the recipe when that is not the case; a quick
fix would be:

COMPATIBLE_HOST_armv7a = 'null'

but I would like to hear other ideas too :)

Alex

--0000000000008175b7059995bfcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Dec 2019 at 19:00, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2019-12-04 at 07:09 =
-0800, Wang Mingyu wrote:<br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com=
" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/nss/{<a href=3D"http://nss_3.45.bb" rel=3D"=
noreferrer" target=3D"_blank">nss_3.45.bb</a> =3D&gt; <a href=3D"http://nss=
_3.47.1.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.47.1.bb</a>} | 4 ++-=
-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-support/nss/{<a href=3D"http://nss_3.45.bb" =
rel=3D"noreferrer" target=3D"_blank">nss_3.45.bb</a> =3D&gt; <a href=3D"htt=
p://nss_3.47.1.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.47.1.bb</a>} =
(98%)<br>
<br>
Fails on beaglebone:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/1327" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/65/builds/1327</a><br></blockquote><div><br></div=
><div>I had a look into this: the issue is that new versions of nss require=
 hardware crypto capabilities on ARM (both 32 and 64 bit).</div><div>This m=
eans we have to disable the recipe when that is not the case; a quick fix w=
ould be:</div><div><br></div><div>COMPATIBLE_HOST_armv7a =3D &#39;null&#39;=
</div><div><br></div><div>but I would like to hear other ideas too :)</div>=
<div><br></div><div>Alex<br></div><div> <br></div></div></div>

--0000000000008175b7059995bfcc--
