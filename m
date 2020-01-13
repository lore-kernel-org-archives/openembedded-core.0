Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 461F87FCDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 14:15:12 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id t129so2564978vkg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 06:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C1UvxVAtGxBNI7GbNp7mqDDAPVWvyA0oOwyISSmJZB4=;
	b=EQLdewOffmQIvNj9BMBAFOyZnEaZLePycM682BmJjRfc+NNCK2EZJafN/OB/I+S/9q
	tYqX7k2I+XbWMCtjdl/wx9Lt+0SlrkFRQTu/XFFYixCTuqiBbyXH2ShCbzNH+mDm+H4j
	pPSeUjTZ9481YFPwdpzPuZffnGS47j4qAY6gB2dPuSUC4X/12zfCrctShGXlOUp5cDS5
	sJqtzvgL9of27HZ1ezfU9VMG0CmdbJIX/oU++kGmpfmsU6++SvQi8LPKBF1ZvlPydSwI
	NeYTI61bKCHwNyx2ltwVC+K22u1xDNXmMG6V6PahcU/iTQ1jraPMsbaPgwRuytkTydSq
	Vv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C1UvxVAtGxBNI7GbNp7mqDDAPVWvyA0oOwyISSmJZB4=;
	b=aNZrXIPZfUcYJFUOJz/jj6/Ck9i1t+ts1Ky3p8rMIMMTpxCimaGLrBNdMloFY1L2Fp
	p7HYBlk6xf4KkPuBxQNhHpIt4S3OT63y3s8xXavX8Y4SV2+tOyK/n0CBI5QTKVdaHAYz
	aA/YSQCqp0yYbo+EjtmbSktrrUJuwIJNowaw1+BK1+NBCd/PT+jyXHn+Q4TOKtvKGR7T
	Sdrg7jvYhLXMOA7Ab6sMDxG5UCA6j/PSD2e4Y5Fexqa57mgP6x441bQ4DxkOZeufh7Bz
	XFWYJ1LDV0KJbTi5uj0UjgnQgK7MVPf6xP1WGOr57DaGTVyF24ueYifjkB8iEgWdVNwR
	116A==
X-Gm-Message-State: APjAAAVpGWMjZyWp6o/gIHSDMNWtEp9KEAUWKWfZL4zPwPkNesBQLu2Z
	b3EZ1sj05JRsUY6gV4vHA/qDSAhRr8zFBoy398ZiLg==
X-Google-Smtp-Source: APXvYqxvhMYy22T1PSfucsQ01p48JraCHDjD+hT67a5sJ33IBlCUfyldZRZrwuI/QDIbJXFkgIymSNypSLXAeE9XLdc=
X-Received: by 2002:a1f:fe45:: with SMTP id l66mr10659596vki.9.1578924913018; 
	Mon, 13 Jan 2020 06:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
	<b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
	<CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
	<bdc3d78fb086561f839d8a6a41d2ed336ef5a793.camel@linuxfoundation.org>
In-Reply-To: <bdc3d78fb086561f839d8a6a41d2ed336ef5a793.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2020 15:15:02 +0100
Message-ID: <CANNYZj-MWCDrwtWDgb5YYUSAY0oxMjKvnA3B=K-b151+mQ51oQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Jan 2020 14:15:12 -0000
Content-Type: multipart/alternative; boundary="000000000000914e1f059c061a90"

--000000000000914e1f059c061a90
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2020 at 23:14, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-01-09 at 20:49 +0100, Alexander Kanavin wrote:
> > The problem is, I couldn't reproduce this locally at all. Random
> > glitch?
>
> No, its happened on multiple workers and there should be a pattern, we
> just don't understand it yet :(. I don't have ideas right now although
> the build user is 1000 on many machines, 6000 is a minority.
>

I guess we'll have to save the build folder on next failure and inspect
that.

Alex

--000000000000914e1f059c061a90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 23:14, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2020-01-09 at 20:49 =
+0100, Alexander Kanavin wrote:<br>
&gt; The problem is, I couldn&#39;t reproduce this locally at all. Random<b=
r>
&gt; glitch?<br>
<br>
No, its happened on multiple workers and there should be a pattern, we<br>
just don&#39;t understand it yet :(. I don&#39;t have ideas right now altho=
ugh<br>
the build user is 1000 on many machines, 6000 is a minority.<br></blockquot=
e><div><br></div><div>I guess we&#39;ll have to save the build folder on ne=
xt failure and inspect that.</div><div><br></div><div>Alex<br></div></div><=
/div>

--000000000000914e1f059c061a90--
