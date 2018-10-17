Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DAAFC79AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:27:10 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 61-v6so30187484wrb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4bj1CVxgvWbO/PjKiz90+Nsx43nrAcHc9DZ3jKlg82k=;
	b=hkKDsH1TEeXbR/G5wjXp6RcLKcm2//6MG3vVZh85zGP5pgjwdJIYPQF1V29008wwoi
	JDN3zziOrL0ibYMkqRHBlyQKTNFYFg2I3ZwBiSsejdquR80qT1epYe/bBUtYq6ToNgkp
	3cC0t/y5YgBWZSi45O33EvqTSHOf697/niUvYdYggoBlqaWIlLR8sXvJAWbPkrqz4T9f
	ibDoB5hek34jxmoV2JRP6RGENPWDyYlxWHp+zX8nVP/rKLBgmuqvG0okEN0te/Vb2h8Y
	GuOmRlaMXPZ/eqBuiLowmQXqVuT/VEdtAwyk3BXHlWUB0ydaORlE3C1GfuoaGlSH3Tde
	bx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4bj1CVxgvWbO/PjKiz90+Nsx43nrAcHc9DZ3jKlg82k=;
	b=emqyY/RHfQcjz5me7agw6JmjbHTZRgm7LF+uzHwaLlKRo1Wg0wVM52xMYbFlBeesWn
	E7IxFRD+zPknTrrUQvIkPue+NTEuaHUBD/GHDxuimJGq9fPY6FOVt9vL9qk2H57q07Qq
	ZvkRKbe1bwdUT/mupzpKJZ5qbdSLshQetJw2Sm67oHX2zm0+U1KQD9Ek5KTyMZ+8eEE1
	hn7DyLVs2zYiS75Yo9HFXCEiGn3Qy2Oh4r9KauCk/npc3iF4dF5m+wIYUfDpgjv4CI9v
	yl+8LFsD/rmPrNXQNumwxM0TnlSY0xqrbspET5RDJsdViXvZKbuM4l081IBb1yLuSEzu
	nMsQ==
X-Gm-Message-State: ABuFfohbKuKgli46eRVbqSh2KQ79YwE9h/mSWFx9iXfvC7Zv4jboTc2V
	jPGKa/FAt82jIgwGnfq7tQE6Xd/xbzNm9eAbElE=
X-Google-Smtp-Source: ACcGV633RC0Y9eXKClset4WsJESCDzKXTrvDFTsBGl7Ie0IG15mi/otJEBKjpAwSfJVFs7gO1kWOm65AzrrI55cgfl8=
X-Received: by 2002:adf:e842:: with SMTP id
	d2-v6mr22463611wrn.175.1539790031446; 
	Wed, 17 Oct 2018 08:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
In-Reply-To: <20181017150757.14591-1-yann@blade-group.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Oct 2018 17:26:59 +0200
Message-ID: <CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
To: yann.dirson@blade-group.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 15:27:11 -0000
Content-Type: multipart/alternative; boundary="000000000000da654305786e4d19"

--000000000000da654305786e4d19
Content-Type: text/plain; charset="UTF-8"

What about using some less confusing default BLUEZ value? RDEPENDS_ looks
wrong.

BLUEZ ??= "no-bluetooth"
RDEPENDS_no-bluetooth = ""

Might be a bit more clear.

On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com> wrote:

> From: Yann Dirson <yann@blade-group.com>
>
> Otherwise the build fails with:
>
>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>
> This restores some truth in the "Otherwise install nothing" comment in the
> recipe.
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> index 0ede5e57b..e81516fef 100644
> --- a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> +++ b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> @@ -32,6 +32,8 @@ RDEPENDS_bluez5 = " \
>          '', d)} \
>  "
>
> +RDEPENDS_ = ""
> +
>  # Install bluez4 tools or bluez5 tools depending on what is specified in
> the distro.
>  # Otherwise install nothing.
>  RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000da654305786e4d19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What about using some less confusing default BLUEZ value? =
RDEPENDS_ looks wrong.<div><br></div><div>BLUEZ ??=3D &quot;no-bluetooth&qu=
ot;</div><div>RDEPENDS_no-bluetooth =3D &quot;&quot;</div><div><br></div><d=
iv>Might be a bit more clear.</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Wed, Oct 17, 2018 at 5:08 PM &lt;<a href=3D"mailto:yann.di=
rson@blade-group.com">yann.dirson@blade-group.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">From: Yann Dirson &lt;<a href=3D"mailto:yann@=
blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
<br>
Otherwise the build fails with:<br>
<br>
=C2=A0 NOTE: Runtime target &#39;${RDEPENDS_}&#39; is unbuildable, removing=
...<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;${RDEPENDS_}&#39;=
]<br>
<br>
This restores some truth in the &quot;Otherwise install nothing&quot; comme=
nt in the recipe.<br>
<br>
Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" targ=
et=3D"_blank">yann@blade-group.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.bb" =
rel=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packag=
egroup-tools-bluetooth.bb</a> b/meta-oe/recipes-connectivity/packagegroups/=
<a href=3D"http://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" targe=
t=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
index 0ede5e57b..e81516fef 100644<br>
--- a/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://packageg=
roup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
tools-bluetooth.bb</a><br>
+++ b/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://packageg=
roup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
tools-bluetooth.bb</a><br>
@@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
+RDEPENDS_ =3D &quot;&quot;<br>
+<br>
=C2=A0# Install bluez4 tools or bluez5 tools depending on what is specified=
 in the distro.<br>
=C2=A0# Otherwise install nothing.<br>
=C2=A0RDEPENDS_${PN} =3D &quot;${RDEPENDS_${BLUEZ}}&quot;<br>
-- <br>
2.19.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000da654305786e4d19--
