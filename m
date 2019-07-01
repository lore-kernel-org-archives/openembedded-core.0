Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id AC6426D74B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 20:37:39 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 190so9756566vsf.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WVGerymYHWAlZc4ihN8M8COhO206T9b1cItQUmnTDLM=;
	b=Fd14IIJnoxc1aMxPNx5u09AxzezharpT9wl0BtwsG/71T+1SMbzP7XS3qeMWZVj8rA
	RoFF8GX0XD7yiJwZfHgzScUc7l5THc2NSoRg7nXhlaWRbS1YVZax2Tq0g4tYVXW6rDm9
	TRDmpy0GFOstc1BiduruqgsGs57/9NH+t5NDuWyfs5+U752Bfq3yy4KXaMgvHIrRD5lR
	OA0lP+NGswtTLWWJMXKyXcVVzveR/gJJxPBQHVfBlq5NEtSKCpTUYFIYNwdj230KRXpv
	bkFYqbuh/vNIMeGjERYVLugv92NlWOIDfuYZofq0lI66bwDySyWWjmmr10svcabyWD9X
	AfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WVGerymYHWAlZc4ihN8M8COhO206T9b1cItQUmnTDLM=;
	b=qNS/6xaEUzpWpUgDvbLCHSxXJF0LuhkQcAdWE5Xi1kDKl9SMdsW7+W8eGllo4b6bWm
	0WNh5G0KJo/jAbXqB8lBLlFo2VBNKF8hHAHwcJjrMDBhjQ+4sXwYHK8zCmOuvgeIAo8K
	doYnslSuSgbRSp1aJq5Bijwlr6N650D5QpKRuT4jiHXpEzp/b0GJuOFgZu6KJNUSEs/P
	63Zqz3UMXnqdKWXvjmF7YspmLVlbDbEkCQQTYqIDxYt6bN7WnWZgFi5Oa51GFJW5oGl2
	Tl0iYY1/858p5lenGc5HEMS5lrGhWF7Zt7FITgyu0kinGklnir4NQFb41nHZ6hD4r6NZ
	ljIw==
X-Gm-Message-State: APjAAAWwb/207kDVHLTJeJP4xwIzeKiF8wgP+oZ33IuoBPJkUG5J6sST
	fxF6Lc7hYBVYsYCgsSdarnArUMEGA2xUhduGRD+eig==
X-Google-Smtp-Source: APXvYqxIFAS1TpM2JBAtaewCEmwBZmGuEjfOjlsor1jfaLz+lOCyN9nwwZJFOTw1+QMA1qGVIVAb6im+lgy04jGyAOM=
X-Received: by 2002:a05:6102:2008:: with SMTP id
	p8mr15760113vsr.188.1562013460652; 
	Mon, 01 Jul 2019 13:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190628033830.27713-1-anibal.limon@linaro.org>
	<2cb63a02a86f2726a47354dff8b5dc1d34e3ef00.camel@linuxfoundation.org>
In-Reply-To: <2cb63a02a86f2726a47354dff8b5dc1d34e3ef00.camel@linuxfoundation.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Mon, 1 Jul 2019 15:38:19 -0500
Message-ID: <CA+_AqitS=JJrYbb9JFv8Oqm4V2x8bHMMP+n6YT4dN=9mVQ+amg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Mon, 01 Jul 2019 20:37:39 -0000
Content-Type: multipart/alternative; boundary="00000000000074f968058ca49985"

--00000000000074f968058ca49985
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 30 Jun 2019 at 06:41, <richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-06-27 at 22:38 -0500, An=C3=ADbal Lim=C3=B3n wrote:
> > In order to support multiple tap devices in the same qemu virtual
> > machine.
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
>
> With this change included tests failed on the autobuilder. I think it
> breaks usage of tap devices after the first one. E.g.:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/756
>
> (but testimage failed all over)
>

Ok, I will review the issue and send a v2.

Thanks,
Anibal


>
> Cheers,
>
> Richard
>
>

--00000000000074f968058ca49985
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 30 Jun 2019 at 06:41, &lt;<a =
href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoun=
dation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, 2019-06-27 at 22:38 -0500, An=C3=ADbal Lim=C3=B3n wrote:=
<br>
&gt; In order to support multiple tap devices in the same qemu virtual<br>
&gt; machine.<br>
&gt; <br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.lim=
on@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
&gt; ---<br>
<br>
With this change included tests failed on the autobuilder. I think it<br>
breaks usage of tap devices after the first one. E.g.:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/59/build=
s/756" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/59/builds/756</a><br>
<br>
(but testimage failed all over)<br></blockquote><div><br></div><div>Ok, I w=
ill review the issue and send a v2.</div><div><br></div><div>Thanks,</div><=
div>Anibal</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000074f968058ca49985--
