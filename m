Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id D9A727914A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 16:46:22 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id j205-v6so3026396oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nVoyKz+cg7ql2cj5LD/ciSb4YD0opaO13RntgpIuhfA=;
	b=LosCumbi6FELwjHGOR7Q+0UFO9AIYF2PETowJjYATgRVSaO4Itq/9jac8eWomUMaBS
	OYX8ZsUi2Cy6BdjF4s75DGJS53XYyM2ZNYFBaCwPcPy9jJrl5oaalpzAxPXjSJ0X3iOM
	snuHMWDlLfWb8+KLN6iZqrAc9i/gdY557Kfj0KIPLaiOejnh0jEYj0KSjkoez3Kebfqa
	ZExAuyvK8V8qDkpDmh4kJLmNM6kNkSmyowmAXwpXpJi0bbkH9VvDIS/+tkzsS7DWh5sS
	DqEi6hGKljeGHLuRluUZois1fCmuE891k9130Ef6Ru5fYphFmTr3I8hdTVWU3x2c0sVP
	guyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nVoyKz+cg7ql2cj5LD/ciSb4YD0opaO13RntgpIuhfA=;
	b=FyiqRuDBDD3IX7g2iOypgrArGE9TFrmfV0RfnlqCxAB1C745Swq8gcc+waWyfzNS6F
	xA/kYMncGvw5A7IDg1yjBNFZPrA4dbZVP+a6c+BYamFeVgC7La2T32HExJYp94hyg66d
	V+SXEs6Z2krYI4w39S5J8xshmwViHJr8UUACMj/C+Dj4mNzWKjEGzI4TsGsk8Gfdo1Y5
	r+xrgltpUPMWeOB8cwsgfeEjDZxADjIrG4U12fF54h3J/ilG86VwMxLye0Ic5S/S95rB
	BcYj0bS0VxniCwwO66Rhv1UhfFZbTuZSyOVH5LodqA9eoH1TT1WPJ9NeTB+eMCWzcxhD
	g5Cg==
X-Gm-Message-State: AOUpUlEfKC67zwqW8kBPqSGSRN3i8c0l8ubjtOUPGsxPIdIF5RoxTs/k
	HeUnUIjjCi0InT9ygF6xhJBhgN2D7h9yPmN+aQrxZw==
X-Google-Smtp-Source: AA+uWPy5QfiU0n8ooCu3wTVJ01feygjvV117zjdsuIgzmBvTvwGiGH49LTVw8+dKbi/leierT1Uo9heGVYpSQkWgBio=
X-Received: by 2002:aca:ad86:: with SMTP id
	w128-v6mr29890481oie.112.1534351583233; 
	Wed, 15 Aug 2018 09:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1532711448.git.chris_larson@mentor.com>
In-Reply-To: <cover.1532711448.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 15 Aug 2018 09:46:11 -0700
Message-ID: <CABcZANkopptHbXSO_hTzBP=20wgJEPvXDCKVH4z49Naz-Q-YDw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/4] Pull postinst-intercepts from BBPATH
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
X-List-Received-Date: Wed, 15 Aug 2018 16:46:23 -0000
Content-Type: multipart/alternative; boundary="000000000000144b4f05737c11d1"

--000000000000144b4f05737c11d1
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 27, 2018 at 10:24 AM Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> These are the bits to  allow us to pull intercepts from BBPATH. This is
> kept
> as a separate class, as it's needed by both image construction and sdk
> construction, the latter to support meta-toolchain & similar recipes.
>

Ping. v2 renamed bbpath-intercepts to image-postinst-intercepts and
rebased. Let me know if there are any other concerns. Not urgent, just want
to make sure it doesn't fall through the cracks :)
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000144b4f05737c11d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Fri, Jul 27, 2018 at 10:24 AM Christopher Larson &lt;<a=
 href=3D"mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christopher Lar=
son &lt;<a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_=
larson@mentor.com</a>&gt;<br>
<br>
These are the bits to=C2=A0 allow us to pull intercepts from BBPATH. This i=
s kept<br>
as a separate class, as it&#39;s needed by both image construction and sdk<=
br>
construction, the latter to support meta-toolchain &amp; similar recipes.<b=
r></blockquote><div><br></div><div>Ping. v2 renamed bbpath-intercepts to im=
age-postinst-intercepts and rebased. Let me know if there are any other con=
cerns. Not urgent, just want to make sure it doesn&#39;t fall through the c=
racks :)<br clear=3D"all"></div></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div>Christopher Larson<br>kergoth at gma=
il dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Softwar=
e Engineer, Mentor Graphics</div></div></div></div></div></div></div></div>

--000000000000144b4f05737c11d1--
