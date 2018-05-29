Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id AE9A2745AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 20:30:53 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id 77-v6so18536148otd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fOI9VpOXpr9/WXj6EPYCu/e5mht0AI0ub7pM5mnhY8E=;
	b=OooVTDyrW31rBYAy8lUPHSuiUaMUHoOsuBswWjhHKtS6vfGaIbXN2XCKptJMkqy0rG
	IyS79IGcA8Ml1fZ0Rp789s6GB3B46u56hTJL2jNyWtQbxXmxIj/Sl4ekVpj5yFD3IxP8
	S6JnyBFtUa+Pp8DTXjbMJVke/kEuzH3ZTkqWKPtjN4e8UiTuLvLYg8ZFN9VfQcjha9cb
	kTjeDoRJ+BPnlithwioEW68GQIg0UwMD2KmV7qAnkZ0l3K8EN3WsvJ4ux01HA6Oa3XW/
	Ov3h+xrTccyOtf38k8ND0URbF5hAxsjqdhlTUugyL7cQyNXCjPT4m0ojc5a0yj7IXywR
	fL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fOI9VpOXpr9/WXj6EPYCu/e5mht0AI0ub7pM5mnhY8E=;
	b=aiWURBV8gFt+xQhLQRPtvuLtwfxoh8/EyHFo0t22LD+nFi73nD8L7jFbbyz1BFCCKD
	bgwvdm4X5HI8gAb9AfH8i4JbD94Gr1CdjTr8luIpOMzamgMjOIN52kbtd7r/Y6UPg7IN
	20+ogfCOzQZEZzRVyFuBbQVpJpIW7e+PwBwyvrcisQUAmXfxkAFN+jlgKetGEEJMUVVA
	cYMbfOTP8FWA0gvLR8kwHkT5jfqEiNoGzJahgNsBFXc79XJTQKv+h//hT3Hp0qB0suwt
	CH6W9VO1apsZ85Z833F++iIr9fJ15DVDN3/5PxRgvIusTPo7MDLz10dqG3ql9TumXUtc
	RYEg==
X-Gm-Message-State: ALKqPwd3I92hsedt6kp0hYocvSEAvhIakX7iEivliUG4zyJsVjRZP7cE
	/tMDXj5XdZXpZP3tNI3p1MmQoUBSmCUMm+cBWf8=
X-Google-Smtp-Source: ADUXVKI/972RPVbJBi0j38MAY6aKnfhUpWVTzF3PiqAPbT1jPZSEzJjgO7QdjcbOQFMQdXMFFAiow83HCYHCOX74cpc=
X-Received: by 2002:a9d:2bec:: with SMTP id
	u99-v6mr12713395ota.319.1527625854388; 
	Tue, 29 May 2018 13:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sqWVd61gS8eksZ_LB2DK00oSzM0BXjDM_5Pxz53SCzGBA@mail.gmail.com>
	<d883f610-cff1-6b16-97bd-74f84225605a@windriver.com>
	<CAMKF1spAmk-pAmt=efM+vPeCv6uSfXwapTd_z6gRSacAcEShSg@mail.gmail.com>
In-Reply-To: <CAMKF1spAmk-pAmt=efM+vPeCv6uSfXwapTd_z6gRSacAcEShSg@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 29 May 2018 13:30:42 -0700
Message-ID: <CABcZAN=-h=mw731dSDv81eibBWqdsV86mYKS5p-Jy7EVSwbLvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipe_links.bbclass: introduction
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
X-List-Received-Date: Tue, 29 May 2018 20:30:53 -0000
Content-Type: multipart/alternative; boundary="000000000000668d07056d5e1ca2"

--000000000000668d07056d5e1ca2
Content-Type: text/plain; charset="UTF-8"

Keying off of PN when processing BBINCLUDED is going to cause problems for
cross recipes whose pn is altered in the recipe but isn't included in the
bbappend path. bbappends are based on the recipe basename, not PN.

On Tue, May 29, 2018 at 12:47 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, May 29, 2018 at 12:40 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > On 5/29/18 2:22 PM, Khem Raj wrote:
> >> On Mon, May 28, 2018 at 6:38 AM, Mark Asselstine
> >> <mark.asselstine@windriver.com> wrote:
> >>> This is a new class which can be used (for example via USER_CLASSES in
> >>> local.conf) to make your build more development friendly. When
> >>> included this class will create symlinks to the various bb and
> >>> bbappend files in WORKDIR.
> >>>
> >>> Normally when you are debugging or extending a package's recipe files
> >>> a developer will employ one of a few indirect techniques to determine
> >>> where bb and bbappends files associated with a recipe exist. For
> >>> example they might use bitbake-layers show-recipes or similar, or
> >>> simply rely on their experience to guide them. Even after working with
> >>> openembedded for serveral years now I find these techniques tedious
> >>> and time consuming, and sometimes even hit and miss.
> >>>
> >>> Since the whereabouts of these files are already stored in various
> >>> files at parse time we can create symlinks to simplify the task of
> >>> finding these files, making them available in WORKDIR for easy
> >>> inpsection and in a convenient location if using devshel for instance.
> >>>
> >>> For now this work is completely optional but we could conceivable make
> >>> this the default behavior if folks find it is convenient and the cost
> >>> of performing these operations across all builds is minimal enough.
> >>>
> >>> recipe_links can safely be added to USER_CLASSES for existing builds,
> >>> care has been taken to avoid this action causing anything to be
> >>> rebuilt. After this has been added you can either 'bitbake <recipe> -C
> >>> unpack' or 'bitbake <recipe> -c create_recipe_links' to cause the
> >>> links to be created in the WORKDIR for the specified recipe.
> >>>
> >>
> >> I think this is not complementing devtool workflow, even though its
> >> not going to hurt it.
> >> however, devtool workflow is what we should be targeting as primary
> >> workflow for OE
> >> and I do not see a benefit of this in that regard.
> >
> > I think the same could be said about other bbclasses that are not
> enabled.
> > devtool is not the only workflow, and a lot of people like to work
> directly
> > using 'bitbake -c devshell' or similar still.
> >
> > As an optional user class, I do think this is reasonable and helpful to
> many folks.
> >
> > (it also does not clash with the devtool workflow at all, so even if
> enabled a
> > devtool user won't be negatively impacted by it.)
>
> Dont get me wrong I do see that part. I was trying to make a case for
> promoting
> devtool workflow.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000668d07056d5e1ca2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Keying off of PN when processing BBINCLUDED is going to ca=
use problems for cross recipes whose pn is altered in the recipe but isn&#3=
9;t included in the bbappend path. bbappends are based on the recipe basena=
me, not PN.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, May 29, 2018 at 12:47 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On Tue, May 29, 2018 at 12:40 PM, Mark Hatle &lt;<a href=3D"mailto:mark.h=
atle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt; wrot=
e:<br>
&gt; On 5/29/18 2:22 PM, Khem Raj wrote:<br>
&gt;&gt; On Mon, May 28, 2018 at 6:38 AM, Mark Asselstine<br>
&gt;&gt; &lt;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_bl=
ank">mark.asselstine@windriver.com</a>&gt; wrote:<br>
&gt;&gt;&gt; This is a new class which can be used (for example via USER_CL=
ASSES in<br>
&gt;&gt;&gt; local.conf) to make your build more development friendly. When=
<br>
&gt;&gt;&gt; included this class will create symlinks to the various bb and=
<br>
&gt;&gt;&gt; bbappend files in WORKDIR.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Normally when you are debugging or extending a package&#39;s r=
ecipe files<br>
&gt;&gt;&gt; a developer will employ one of a few indirect techniques to de=
termine<br>
&gt;&gt;&gt; where bb and bbappends files associated with a recipe exist. F=
or<br>
&gt;&gt;&gt; example they might use bitbake-layers show-recipes or similar,=
 or<br>
&gt;&gt;&gt; simply rely on their experience to guide them. Even after work=
ing with<br>
&gt;&gt;&gt; openembedded for serveral years now I find these techniques te=
dious<br>
&gt;&gt;&gt; and time consuming, and sometimes even hit and miss.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Since the whereabouts of these files are already stored in var=
ious<br>
&gt;&gt;&gt; files at parse time we can create symlinks to simplify the tas=
k of<br>
&gt;&gt;&gt; finding these files, making them available in WORKDIR for easy=
<br>
&gt;&gt;&gt; inpsection and in a convenient location if using devshel for i=
nstance.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For now this work is completely optional but we could conceiva=
ble make<br>
&gt;&gt;&gt; this the default behavior if folks find it is convenient and t=
he cost<br>
&gt;&gt;&gt; of performing these operations across all builds is minimal en=
ough.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; recipe_links can safely be added to USER_CLASSES for existing =
builds,<br>
&gt;&gt;&gt; care has been taken to avoid this action causing anything to b=
e<br>
&gt;&gt;&gt; rebuilt. After this has been added you can either &#39;bitbake=
 &lt;recipe&gt; -C<br>
&gt;&gt;&gt; unpack&#39; or &#39;bitbake &lt;recipe&gt; -c create_recipe_li=
nks&#39; to cause the<br>
&gt;&gt;&gt; links to be created in the WORKDIR for the specified recipe.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I think this is not complementing devtool workflow, even though it=
s<br>
&gt;&gt; not going to hurt it.<br>
&gt;&gt; however, devtool workflow is what we should be targeting as primar=
y<br>
&gt;&gt; workflow for OE<br>
&gt;&gt; and I do not see a benefit of this in that regard.<br>
&gt;<br>
&gt; I think the same could be said about other bbclasses that are not enab=
led.<br>
&gt; devtool is not the only workflow, and a lot of people like to work dir=
ectly<br>
&gt; using &#39;bitbake -c devshell&#39; or similar still.<br>
&gt;<br>
&gt; As an optional user class, I do think this is reasonable and helpful t=
o many folks.<br>
&gt;<br>
&gt; (it also does not clash with the devtool workflow at all, so even if e=
nabled a<br>
&gt; devtool user won&#39;t be negatively impacted by it.)<br>
<br>
Dont get me wrong I do see that part. I was trying to make a case for promo=
ting<br>
devtool workflow.<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--000000000000668d07056d5e1ca2--
