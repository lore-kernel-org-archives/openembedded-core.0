Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 549D560168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 13:40:57 +0000 (UTC)
Received: by qgew3 with SMTP id w3so7100336qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=xwew8z6IvdxdMTQa5WNLieC42q+UsUwlIkfBYNYc4rY=;
	b=WaZ7lQHOPT1d74DDciyszULVxw6aDCHB6uX86d8QXzV28Q72uOBzWmAAPugk0E9Pxz
	XzylZ4rrFz7ZPYqmjOuxg0+ucnF1XNLwTCeWb2YNIDc/340QidN+L7K0j7wlW4QfqoEx
	i/4ssBrZJfH0ZBQJEfu2504Rhtkkcu8d2NcmwhLlipa5xAioYllq+34+ea0UhQiRs5lF
	OKur6LLmpITA5CPGRuJJCw1Con3Iqzv3lIlzNGFNP4awzKNXnAJlCurg5zIIFpSPNO6k
	Ku/ZtZ19GG6OjQ5ljjzxKFym0LKwtFqRzG7dIUvHqqzBwcMHuK/8LMwo1yNj0Py1EXCu
	2Qfw==
X-Received: by 10.55.51.129 with SMTP id z123mr58192676qkz.102.1432042858834; 
	Tue, 19 May 2015 06:40:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.117 with HTTP; Tue, 19 May 2015 06:40:32 -0700 (PDT)
In-Reply-To: <1432032474.32616.25.camel@linuxfoundation.org>
References: <cover.1432024013.git.Qi.Chen@windriver.com>
	<971f18fc4a97344769e54313a78898f86f520a7e.1432024013.git.Qi.Chen@windriver.com>
	<1432032474.32616.25.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 19 May 2015 06:40:32 -0700
X-Google-Sender-Auth: a_VuE9OYA-5n4pelP87QvgCX9V8
Message-ID: <CABcZAN=Ky_TKqC8y3ecYh7Mf_SkQYJ0UUvDXMHnQCKZBpW+1KA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildstats-summary: add eventmask
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
X-List-Received-Date: Tue, 19 May 2015 13:41:00 -0000
Content-Type: multipart/alternative; boundary=001a1149013ee76f7305166f7500

--001a1149013ee76f7305166f7500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 3:47 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2015-05-19 at 16:29 +0800, Chen Qi wrote:
> > Add eventmask for buildstats_summary handler.
>
> Why?
>
> This says what you've done but not why we need this...
>
> Cheers,
>
> Richard


Also, this adds the eventmask, but doesn=E2=80=99t remove the then-redundan=
t
isinstance() on the event object.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1149013ee76f7305166f7500
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 19, 2015 at 3:47 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Tue, 2015-05-19 at 16:29 +0800, Chen Qi wrote:<=
br>
&gt; Add eventmask for buildstats_summary handler.<br>
<br>
</span>Why?<br>
<br>
This says what you&#39;ve done but not why we need this...<br>
<br>
Cheers,<br>
<br>
Richard</blockquote></div><br>Also, this adds the eventmask, but doesn=E2=
=80=99t remove the then-redundant isinstance() on the event object.<br>-- <=
br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsli=
b<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1149013ee76f7305166f7500--
