Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id E262778CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:42:59 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id r83-v6so8880550vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EX5g2H1moHztPBo03efbR/j5bhyOpAmU0HTTBbVMwQg=;
	b=LuOXKzhV/UkwKFloALqBAxXp6uwF2BWibCE26NQ1a+8GxuidBMU22qT9VOVH2Mfmzm
	Ih7cjrYPTkRSufLdjXBIkzBjq++oJxBxfhl0m7jE8D68GRjQDQE3IU2ElQKBhBvBRHlc
	1+kWdP8+61Eo3O6nI3WrHy6zGLESxKgZSn6iwUdqFIX5ILRUFOqx+vk0L71KXtC+gHyY
	bJEXJqQYX6F1cFD/ZWLGvDBsxmaSyid9oWS1VQz0oTT2xhUSjM0c/FygGTqtTyY6J0zv
	sbo2br13QO9ybW/7sjHdO2ttvVlMdFvorBxK5zPYfmka70mY/2+v583KNzWgPnCINY7A
	Tp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EX5g2H1moHztPBo03efbR/j5bhyOpAmU0HTTBbVMwQg=;
	b=ZT9t7WJvTFlggZn9oBijdXw2QSxl0CtItiamM210KzyheH9qyTcz18oZ6Mcdji2q3C
	3tCo02MxIPDEUTMPW2HmXVYqCAh7oLT4pkyDiWMkmTqXkpnxsJpIGhfEJyGgR42sZOyD
	3C+UF4qEiPZwbSkj4QYjT4jMm4cHYJ/ev/glnoG+PoHePvQUzxbo4NlFqf20hyshcX4t
	J9xJjRv/UkY61F35a9LZUTqpAeiSxfWhpcWxKV5xrTVo54vz3XS969GngO+xfrH0lNqS
	wxBKax6AtD/h1sV0cDVztWezT7RSK1waI+ETxth4IHQu0F0UAPYehDrR/XnXpzCpkZq2
	BKwA==
X-Gm-Message-State: APt69E1XKP9b8wE6bloLbc7qAmsNpE7hbYSgWf+xy5D3rFrx6WUjx2wQ
	IItzoQ91K9IGXYeOR2Od3H5N9daWdc6Rzh9A1tk=
X-Google-Smtp-Source: ADUXVKIX5JvTM1rEM0+PkEO18p1KbSAGz0/Ydh7PjI3RyoVJN51c9WypqeEQym+d+4wcPuhq0g/8xXtqM5hIXVWb8SI=
X-Received: by 2002:a1f:d5c2:: with SMTP id
	m185-v6mr1912378vkg.133.1528803780722; 
	Tue, 12 Jun 2018 04:43:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:4b48:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 04:43:00
	-0700 (PDT)
In-Reply-To: <CAJ86T=X_BFLzGB4PDKSOJR3Boiv+gQvTN-3D+d+tk=Otw7iwew@mail.gmail.com>
References: <1528716867-20270-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=X_BFLzGB4PDKSOJR3Boiv+gQvTN-3D+d+tk=Otw7iwew@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 12 Jun 2018 13:43:00 +0200
Message-ID: <CALatG=4B7RYeuxm3QovKGDPjig6=J=kXufomJ=c0uczetU3r0w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Tue, 12 Jun 2018 11:43:00 -0000
Content-Type: multipart/alternative; boundary="00000000000048050b056e705e5d"

--00000000000048050b056e705e5d
Content-Type: text/plain; charset="UTF-8"

Hi, Andre:
The reason for needing this multiconfig to be in OVERRIDES, for me, is the
scenario that I have one recipe but some variables/tasks in it are
different for multiconfig, for instance:

do_install-mc-default () {}

do_install-mc-foo() {}

and I do not want split them into several almost same recipes with only one
task different.

//Ming Liu

2018-06-12 1:15 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:

> On Mon, Jun 11, 2018 at 4:34 AM,  <liu.ming50@gmail.com> wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > This is useful when the users want different variables/tasks when using
> > multiconfig.
>
> Isn't the idea of multiconfig to select between configurations which
> already fully define all necessary over-rides?
>
> If a particular multiconfig build needs a custom over-ride then the
> multiconfig can append to OVERRIDES (or MACHINEOVERRIDES etc, as
> appropriate) directly.
>
> ie to avoid confusion isn't it good if building with a multiconfig
> enabled is always equivalent to building with the contents of the
> multiconfig file copied directly in local.conf?
>
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 3b2ef9f..0c803d5 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
> >  # And finally '<foo>_forcevariable' overrides any standard variable,
> with the highest priority.
> >  # This works for functions as well, they are really just variables.
> >  #
> > -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${
> MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:
> forcevariable"
> > +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${
> MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:
> mc-${BB_CURRENT_MC}:forcevariable"
> >  LIBCOVERRIDE ?= ""
> >  CLASSOVERRIDE ?= "class-target"
> >  DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000048050b056e705e5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, Andre:<br></div><div>The reason for needing this =
multiconfig to be in OVERRIDES, for me, is the scenario that I have one rec=
ipe but some variables/tasks in it are different for multiconfig, for insta=
nce:</div><div><br></div><div>do_install-mc-default () {}</div><div><br></d=
iv><div>do_install-mc-foo() {}</div><div><br></div><div>and I do not want s=
plit them into several almost same recipes with only one task different.</d=
iv><div><br></div><div>//Ming Liu</div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">2018-06-12 1:15 GMT+02:00 Andre McCurdy <span dir=3D"=
ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy=
@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Mon, Jun 11, 2018 at 4:34 AM,=C2=A0 &lt;<a href=3D"mailto:liu.ming50@=
gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@=
gmail.com</a>&gt;<br>
&gt;<br>
&gt; This is useful when the users want different variables/tasks when usin=
g<br>
&gt; multiconfig.<br>
<br>
</span>Isn&#39;t the idea of multiconfig to select between configurations w=
hich<br>
already fully define all necessary over-rides?<br>
<br>
If a particular multiconfig build needs a custom over-ride then the<br>
multiconfig can append to OVERRIDES (or MACHINEOVERRIDES etc, as<br>
appropriate) directly.<br>
<br>
ie to avoid confusion isn&#39;t it good if building with a multiconfig<br>
enabled is always equivalent to building with the contents of the<br>
multiconfig file copied directly in local.conf?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 3b2ef9f..0c803d5 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -731,7 +731,7 @@ DISTRO_NAME ??=3D &quot;OpenEmbedded&quot;<br>
&gt;=C2=A0 # And finally &#39;&lt;foo&gt;_forcevariable&#39; overrides any =
standard variable, with the highest priority.<br>
&gt;=C2=A0 # This works for functions as well, they are really just variabl=
es.<br>
&gt;=C2=A0 #<br>
&gt; -OVERRIDES =3D &quot;${TARGET_OS}:${TRANSLATED_<wbr>TARGET_ARCH}:pn-${=
PN}:${<wbr>MACHINEOVERRIDES}:${<wbr>DISTROOVERRIDES}:${<wbr>CLASSOVERRIDE}$=
{LIBCOVERRIDE}:<wbr>forcevariable&quot;<br>
&gt; +OVERRIDES =3D &quot;${TARGET_OS}:${TRANSLATED_<wbr>TARGET_ARCH}:pn-${=
PN}:${<wbr>MACHINEOVERRIDES}:${<wbr>DISTROOVERRIDES}:${<wbr>CLASSOVERRIDE}$=
{LIBCOVERRIDE}:<wbr>mc-${BB_CURRENT_MC}:<wbr>forcevariable&quot;<br>
&gt;=C2=A0 LIBCOVERRIDE ?=3D &quot;&quot;<br>
&gt;=C2=A0 CLASSOVERRIDE ?=3D &quot;class-target&quot;<br>
&gt;=C2=A0 DISTROOVERRIDES ?=3D &quot;${@d.getVar(&#39;DISTRO&#39;) or &#39=
;&#39;}&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--00000000000048050b056e705e5d--
