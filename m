Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0425878451
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 18:59:52 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id d12so2332993uag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jcp6QB6j05qfI18jRzqxSb0nyGCuLhFCYCn9K5F8GPE=;
	b=jV+PmceC5/gTuLyPt5gGsFtAGUeADv7RRacC808RF1DyI5Y0l932301yoWkALquBaA
	TvixAJB1dI7CW2NjzolXJKJ50Gd13wKBwjPTDfjc578w/0L1ptv0bw965boucZGZ9a+5
	5MCucphcGL8aLj8Deloszy/5Sln2ftFUv4QI+IhYlKEV58wYZnidEaUloxi3AJvSQ+cn
	jsa8fgOiDPiPwWoTlm6CTDFTx+szxbxrtglhE5qap/Fy+Dyyu90BOANADQc2c3TALoBc
	TTN+LKYrVtnCzWjtntMdSDlG0vTXtGYaSqSSw7wc4qjndM/NSRPG/PBFr7iWYURNNgSr
	DHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jcp6QB6j05qfI18jRzqxSb0nyGCuLhFCYCn9K5F8GPE=;
	b=BbnbB4shzO/Fg3DDiwGARqnvPSsHxaAXyzHcMMFXzuDYAXShu2WJ/SNCovyeW/FoYB
	3bBnOBXhV1lVo07rIm3tbwUEV1Iyvb0nXqngNk3BZqcgZlafYNhsesGj40PSOqkX0aNV
	8DBGxs0AzsZoIX1wcBUPAXIWFD+YhGqy8XnQ185Efj9pP5sGksX5OAv/uDnWDmTzNdVq
	wU6m1JHm4jEabbLSA9tubMBbJRlR9bfgaptnHiOyVxX4zktW1Ny3XJ8xDsxvamTz7Ev4
	w2HuuDbYR8KrusOxTM1LCBO94Sb7Quel6JSnRhz4bFQOCjiyDcjvqQDZEuj9fHAzo5xi
	VaXA==
X-Gm-Message-State: AHYfb5gnTGEY93G88rjxQl7mxOPLKbp/X+qSFLBNqjGsHV8Y7RlUGK1N
	n1BZwkhbTeRzGetw29tnA0jJHX2xEw==
X-Received: by 10.176.1.3 with SMTP id 3mr1225440uak.2.1503687594074; Fri, 25
	Aug 2017 11:59:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Fri, 25 Aug 2017 11:59:53 -0700 (PDT)
In-Reply-To: <1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
	<1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Aug 2017 20:59:53 +0200
Message-ID: <CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Fri, 25 Aug 2017 18:59:53 -0000
Content-Type: multipart/alternative; boundary="001a11475752e5e98c0557988cb2"

--001a11475752e5e98c0557988cb2
Content-Type: text/plain; charset="UTF-8"

Does the patch cause any harm when used on newer kernel?

If so shouldn't the patch be fixed to work correctly even with newer kernel?

Or what's the main reason to remove it?

On Fri, Aug 25, 2017 at 8:55 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 8/25/17 1:48 PM, Andre McCurdy wrote:
> > On Fri, Aug 25, 2017 at 12:09 AM, Jose Alarcon <jose.alarcon@ge.com>
> wrote:
> >> On 24.08.2017 20:45, Andre McCurdy wrote:
> >>> On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon <jose.alarcon@ge.com>
> wrote:
> >>>> This patch was a temporal workaround needed with 4.1 kernels.
> >>>> Remove it.
> >>> OLDEST_KERNEL is still set to 3.2.0
> >>>
> >>> How can you be sure nobody is using 4.1 ?
> >>
> >> That's a good point!
> >>
> >> I didn't know about this variable. I believe we should not integrate
> >> this change.
> >> I will resend it once OLDEST_KERNEL is set to 4.2 or bigger.
> >
> > The original patch has been merged to master so a second patch will be
> > needed to revert it.
> >
>
> It may make sense to selectively apply the patch based on what
> OLDEST_KERNEL is
> set to.
>
> This way if a user or distribution sets a newer 'OLDEST_KERNEL', that item
> can
> be removed automatically.
>
> --Mark
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11475752e5e98c0557988cb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does the patch cause any harm when used on newer kernel?<d=
iv><br></div><div>If so shouldn&#39;t the patch be fixed to work correctly =
even with newer kernel?</div><div><br></div><div>Or what&#39;s the main rea=
son to remove it?</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Fri, Aug 25, 2017 at 8:55 PM, Mark Hatle <span dir=3D"ltr">&=
lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"">On 8/25/17 1:48 PM, Andre McCurdy wrote:<br>
&gt; On Fri, Aug 25, 2017 at 12:09 AM, Jose Alarcon &lt;<a href=3D"mailto:j=
ose.alarcon@ge.com">jose.alarcon@ge.com</a>&gt; wrote:<br>
&gt;&gt; On <a href=3D"tel:24.08.2017%2020" value=3D"+12408201720">24.08.20=
17 20</a>:45, Andre McCurdy wrote:<br>
&gt;&gt;&gt; On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon &lt;<a href=3D"=
mailto:jose.alarcon@ge.com">jose.alarcon@ge.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; This patch was a temporal workaround needed with 4.1 kerne=
ls.<br>
&gt;&gt;&gt;&gt; Remove it.<br>
&gt;&gt;&gt; OLDEST_KERNEL is still set to 3.2.0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; How can you be sure nobody is using 4.1 ?<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s a good point!<br>
&gt;&gt;<br>
&gt;&gt; I didn&#39;t know about this variable. I believe we should not int=
egrate<br>
&gt;&gt; this change.<br>
&gt;&gt; I will resend it once OLDEST_KERNEL is set to 4.2 or bigger.<br>
&gt;<br>
&gt; The original patch has been merged to master so a second patch will be=
<br>
&gt; needed to revert it.<br>
&gt;<br>
<br>
</span>It may make sense to selectively apply the patch based on what OLDES=
T_KERNEL is<br>
set to.<br>
<br>
This way if a user or distribution sets a newer &#39;OLDEST_KERNEL&#39;, th=
at item can<br>
be removed automatically.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11475752e5e98c0557988cb2--
