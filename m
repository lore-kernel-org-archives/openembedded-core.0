Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
	[209.85.221.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB6D60FC9;
	Tue, 11 Feb 2020 18:07:08 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id b69so3238948vke.9;
	Tue, 11 Feb 2020 10:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4bLPkB9/Glm16caGkjtr0N4MQlaxMzW8rfhQttXFqw4=;
	b=fgtTXZSjF4O5DZxTwjJD5yq7u9VF6JJYgayH29NT00qaR4QINUgLEnf1FQJL7ZXo4a
	Q/7Rjj3YkvnsyY3k9A4k0C6qYn1gWAINyoIx+qWdXFMefCOXO94LiMPXP74+lT1SsIwX
	hjK6n86aQVcsbcyB8zktxGDlpDGnXLw4puYbDcXuO0kRNqBzKseX5Gvv28fDAWh2MC4h
	tU/MstCOR18p4Bu74z2DiR3nalbRRuGHaUyq7JgOOoyKL9SLh9MCrqsfy0/FBVNP7ixC
	DDa121tGi2gphklMK1j4oWdJvRU0T2H3lDZehcHnzK/4JrEmlVKyCguNKFrH25VzLht6
	3xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4bLPkB9/Glm16caGkjtr0N4MQlaxMzW8rfhQttXFqw4=;
	b=e7yEQbkq9RukOvFOfe/tDGCEIiWKm0sQj8hCpSrxRZjSgCXhuxH+iZagHU6oez/UmN
	ZX8nq6OK0yNyU6drSLu6QAL5HSh1mX7pauQRPjjfc6HSIMZPJiPmmsVJeZn1wmWcpZxT
	Yk2O7qKk0akIfgN5vc9/N4c+n3uqtjSrLtmsgC9gKYqygMdWFC2u2s9UiRFMD3QzAu//
	5iz9ZmYrv3gYZ+wx1a2m+yWHJRWbKLhgX9JVsqauBOMWqA/bqzaYoYkSLZa0S/MZwJe7
	j1lartUb6nPVEDJSCkDS98arYvSZ5As3FBh9LlOwIB9eibBuDfyk6IAtrxQDwm0vNQ6C
	v1JA==
X-Gm-Message-State: APjAAAX9EJWRZGdBb46uWIgzVEswCQQOEPS9BVlJXPIxxWe2tnnxk9h3
	VkzIXjd+6dy0EXpQ/JziE1kWuiPUduZ4PCbaMck=
X-Google-Smtp-Source: APXvYqyBmSUDLq4Jkr/GfRWXZ6j6wrIsv6s2406krpovLiO7+jRarFk/dpG9KKFk9PD57zvwdx2sfw4zIfUDDDoKBew=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr5266113vkq.49.1581444428812; 
	Tue, 11 Feb 2020 10:07:08 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<2a9e05eadae5df35ae1c13be4484fd6d3e8fed19.camel@linuxfoundation.org>
In-Reply-To: <2a9e05eadae5df35ae1c13be4484fd6d3e8fed19.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2020 19:06:57 +0100
Message-ID: <CANNYZj_JXMzwQuLcUwfAty_ESZZ8gWav+K9_gz8dDqSZR+xUEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 18:07:09 -0000
Content-Type: multipart/alternative; boundary="00000000000069563d059e50b9a3"

--00000000000069563d059e50b9a3
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2020 at 18:53, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> I still strongly believe we need something in core which pulls together
> all our pieces into a UI where you can test key elements of what we
> build. If we don't have sato how do we actually test the core or demo
> it?
>

See my other email I just wrote; I think epiphany/webkit under weston is
able to replace sato more or less fully in this aspect, and actually do
more when it comes to modern embedded UI use cases which involve video and
3D.


> I think we shouldn't rush into things here. We should ramp up our
> wayland testing and make the wayland images more useful/comprehensive
> and then look at moving more of our tests from sato to the wayland
> images.
>

Certainly no rush here and this transition will proceed carefully and will
take years, but then I am famous for mercilessly removing things from
oe-core, and X with sato would be the biggest one yet! :)

Alex

--00000000000069563d059e50b9a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 11 Feb 2020 at 18:53, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
I still strongly believe we need something in core which pulls together<br>
all our pieces into a UI where you can test key elements of what we<br>
build. If we don&#39;t have sato how do we actually test the core or demo<b=
r>
it?<br></blockquote><div><br></div><div>See my other email I just wrote; I =
think epiphany/webkit under weston is able to replace sato more or less ful=
ly in this aspect, and actually do more when it comes to modern embedded UI=
 use cases which involve video and 3D.<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
I think we shouldn&#39;t rush into things here. We should ramp up our<br>
wayland testing and make the wayland images more useful/comprehensive<br>
and then look at moving more of our tests from sato to the wayland<br>
images.<br></blockquote><div><br></div><div>Certainly no rush here and this=
 transition will proceed carefully and will take years, but then I am famou=
s for mercilessly removing things from oe-core, and X with sato would be th=
e biggest one yet! :)</div><div><br></div><div>Alex<br></div></div></div>

--00000000000069563d059e50b9a3--
