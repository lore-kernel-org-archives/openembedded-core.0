Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id A63337FBC6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 15:36:22 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id b184so5895695vsc.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2019 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U180chd209NEJrZCWT/fdB1KFi/5kE0KukAS2Ft9c7c=;
	b=OjVl/TV8pV/OmMNS6AGita3yxhNeJETD1cFIJ2u7QXtx9mVYZI4H+itRvxIqz0eUtF
	zFZeIpz1TWm8rLc/Zdmgcq9jqAycWmz6ZorWofcBXTsXHGgBZ9qG5KWUA0bpiF8Cb7fE
	j2XW6irlM98Gy81aj80C5wEk0vlO2f6bo6RKTWmnhdfLdZ6h7F8iDeJSGJWXuQG0xWWj
	4iU4L4pBfJsR2fQc6IJkKqBbZGVGlaoAB2KYGgXwI+WIXNm57h++YOMuKnUyeykWIRb8
	SoMkQ2ExaBi7iLDbK7SJCS1mN90Mn9v7zZ39rPTCpGcD4qoqpeQvXlZVkJrMw4hsRzr+
	8JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U180chd209NEJrZCWT/fdB1KFi/5kE0KukAS2Ft9c7c=;
	b=p8uWk7L3bulIQibKW52fxvVM611tpqnxjKL5l1kgn/mIKtTCJKACTB2hGKBSYAmAnY
	vrTuhZWPwIs7P/RqBNgivMqU0QgH6Vyky6HWtfc9W2swwydqdROdPTddSjyfNF/fRbpZ
	Vblic7h/sEZunSQH1+C2tMGUPTTAU0o2hI3yBkB/d9o0DO/w5VOHE2eR1y5BG6Bq4v0x
	3ypKUgoOFpJaY2E6qd0bJz7tsdkHs9vrjJoybHO79TzfG/yvXb2JctkiQlOH53Bk+6kv
	TRAjyGytH+DP7qumyzsTaogJyypH3NZKSfTElVuVPkgFAw8xOikvhdVTQH+VoQyrg3iH
	v0Zw==
X-Gm-Message-State: APjAAAWhGeU2oGRAjrhgyJTBxhv/G/UWuRUugPt1SytA6mD6JMtkAaR1
	EvKG5nTer4RwwYUki7DTgel99NZi5IT2XGH0/9o=
X-Google-Smtp-Source: APXvYqxlawOY3ovMKQkorJzyF0RFClVjTJtDCvMzWgkXyrql+eiU9NxGU366cpj+POclKn4l8LJhyM2QiUUokgBSuUk=
X-Received: by 2002:a67:ea5a:: with SMTP id r26mr12419162vso.94.1573313783592; 
	Sat, 09 Nov 2019 07:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
	<CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
	<CAKmqyKNtUpuqodwxjsseOwdQn3AhG+yU0kJx1K0DCXH3sc4VBw@mail.gmail.com>
In-Reply-To: <CAKmqyKNtUpuqodwxjsseOwdQn3AhG+yU0kJx1K0DCXH3sc4VBw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Nov 2019 16:36:11 +0100
Message-ID: <CANNYZj8=PbGVmE+9C4mnJv3BW0Y-G8f5zG=AmGD0vDpoPNU2XQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Sat, 09 Nov 2019 15:36:22 -0000
Content-Type: multipart/alternative; boundary="00000000000030fc230596eba94f"

--00000000000030fc230596eba94f
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Nov 2019 at 00:02, Alistair Francis <alistair23@gmail.com> wrote:

> > right this means glx-tls is not working anymore, and it will fail on
> > musl at runtime
> > see
> > https://gitlab.freedesktop.org/mesa/mesa/issues/966
>
> So what do we do here?
>
> There are some patches in that issue, but they don't cleanly apply and
> seem hacky anyway. Can we have two versions of mesa? One for musl and
> one for others until this is fixed upstream?
>

Maybe we can silence the warning for musl only, via
INSANE_SKIP_..._libc-musl = "textrel"?
ffmpeg does the same already.

Alex

--00000000000030fc230596eba94f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 9 Nov 2019 at 00:02, Alistair Fra=
ncis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">&gt; right this means glx-tls is not working anymore, =
and it will fail on<br>
&gt; musl at runtime<br>
&gt; see<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/issues/966" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/iss=
ues/966</a><br>
<br>
So what do we do here?<br>
<br>
There are some patches in that issue, but they don&#39;t cleanly apply and<=
br>
seem hacky anyway. Can we have two versions of mesa? One for musl and<br>
one for others until this is fixed upstream?<br></blockquote><div><br></div=
><div>Maybe we can silence the warning for musl only, via INSANE_SKIP_..._l=
ibc-musl =3D &quot;textrel&quot;?</div><div>ffmpeg does the same already.<b=
r></div><div><br></div><div>Alex<br></div></div></div>

--00000000000030fc230596eba94f--
