Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 943C960EFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:14:08 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id y1so2099320lam.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FBWU15UHFhlzyKrYafFzvFIwptnrNxHoUDGy/NiDx+k=;
	b=deFuOple9WUCD6Z1INz2VUzTKKOROg6AU7PbvtOie78N68RHMq9zl6xlmXyddQmbGK
	OjT+2m5qoIG4q0DnNdX9WmRwvkMVOB8a6/72lNa6Qc/1ccwBuEJKjof4W/uiufC4lEYO
	IkTy/O2qW7fqZOJ7KHBmy62flDdXSK9RpIPNvsQFzUS8u6JNaAf7J1ZQFBtN3NMO9dCe
	tc+NJtWC7dud30LNjxd16yzwNAModR7aEb8x3zr26hin0kxtrPUBUzdDJpgdepqT2ir/
	lNXexZwcEgL0jf/wSgrnvTaC3np3NOkF9ZlxW2x8MgXH3b2iWc6VnCBj6wkX6G6c5rX9
	nt1g==
X-Received: by 10.152.246.43 with SMTP id xt11mr2851223lac.34.1394824448975;
	Fri, 14 Mar 2014 12:14:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Fri, 14 Mar 2014 12:13:48 -0700 (PDT)
In-Reply-To: <CANyK_8ex42HU9pDjkMri4vCs7hyGQTSk4eZ_dB25NXSXRY3JSA@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
	<CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
	<CAMKF1sp0WUMyC8zsnQEei8=azDsy5xpM9UWUUsnw5rNqjytWVQ@mail.gmail.com>
	<CABcZANkrJYK7xgf=A=WcL9+xHbX1=jTkcDGs=pC3wjpwS-G3sw@mail.gmail.com>
	<CANyK_8ex42HU9pDjkMri4vCs7hyGQTSk4eZ_dB25NXSXRY3JSA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 14 Mar 2014 12:13:48 -0700
X-Google-Sender-Auth: Lwh3PLjU32zTSkJDTCSJ5GroFwY
Message-ID: <CABcZAN=z8mB1LkJ05SmTk6Gg+UJgp2+-yQNWKNwNPpvHcdrVtQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 19:14:11 -0000
Content-Type: multipart/alternative; boundary=001a1133a774ce29f104f495dfc1

--001a1133a774ce29f104f495dfc1
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 12:11 PM, Paul Barker <paul@paulbarker.me.uk> wrote:

> >> I use containers. systemd-nspawn goes long way
> >
> >
> > Yeah, containers (systemd-nspawn, docker) or even a chroot can be
> > invaluable. schroot on a debian machine works quite well too for
> something
> > as simple as builds. I end up aliasing bb and bitbake to transparently
> run
> > in the chroot at all times.
>
> It's time I learnt how to use these newfangled containers then...


You'll be amazed how many headaches you can save having the host
environment be a known quantity :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1133a774ce29f104f495dfc1
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 14, 2014 at 12:11 PM, Paul Barker <span dir="ltr">&lt;<a href="mailto:paul@paulbarker.me.uk" target="_blank">paul@paulbarker.me.uk</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="HOEnZb adM"><div class="">&gt;&gt; I use containers. systemd-nspawn goes long way<br>
&gt;<br>
&gt;<br>
&gt; Yeah, containers (systemd-nspawn, docker) or even a chroot can be<br>
&gt; invaluable. schroot on a debian machine works quite well too for something<br>
&gt; as simple as builds. I end up aliasing bb and bitbake to transparently run<br>
&gt; in the chroot at all times.<br>
<br>
</div></div>It&#39;s time I learnt how to use these newfangled containers then...</blockquote></div><br></div><div class="gmail_extra">You&#39;ll be amazed how many headaches you can save having the host environment be a known quantity :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a1133a774ce29f104f495dfc1--
