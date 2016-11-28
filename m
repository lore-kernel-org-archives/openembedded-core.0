Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id D9808600BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 23:53:38 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id y198so171340795oia.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=iJJoEAbLyudsCx2Wv0SOf02lQITsEATQmgx4P/7d3iU=;
	b=gkjn987CZqUlG0jJhURrAJtNjRvXu9S5TO7woiKprcKqfDdq8HvFEHYE62uR8vbPfz
	5oVmFZM7tLWLYzeppj7FVQiKdJqAuwABTCrR92iaCwrTQgrTgOlXZXsK+Sa7BX3ITdzJ
	I486s1vXNDx6JKQ2nAVZ3JiuoBYeeYjsLlUgFaudtfY5l/4zHB94cKZhrR//CN+ES3e4
	y5s041uQJUedngIq+L0oz7+bDiMJAtU2Z82VyqqvGKJ/OePUC+Uelx9gjUN2xx6+GD9d
	ri7GYZwJEPMcN/asPPCDKo5479AA0ElRhyFk9D98Pbr+8y4/yb0YCodNZ1iS+RRx1gZx
	nGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=iJJoEAbLyudsCx2Wv0SOf02lQITsEATQmgx4P/7d3iU=;
	b=QqdIaONXbhNwWJ3aDUB/qIeRBfWj0Q4GtSsFEY4IbJulpQV7hA1QEY/0C8WrnylG2L
	NZWIkQpwSU5WPDzNYMoAo+pGfpdgNy0Lnhaip6+0bRtDoIToLgGeM7wPas7Q1kAffHTH
	RLwgqp7kRGJDwwYcyN0AUcx72rYWTOzVH2Shvlx9DzxRnpOTiIWkmHu6kuE1j+VRT9KW
	zqmYLzNuHVMxfg9sFXvWO1KC0a9VBNMV0xYY1ZVk7qh24q25AntHiBa3chg2psBnkjuP
	WDUue1H5+hZ2bIa/zGRlNjTQtoKJ9Qxt2BGTijtGw+XhOXGBPxbJAY4c+WXVVGTqgHMz
	DUXA==
X-Gm-Message-State: AKaTC01umbGZlxtgKXlRxTC2Y8fDWc5GTHOYdB0bJDzAwkFXpg2VDJwZYsLeiVojk85/DdhhMX3+ND/4EIMBTg==
X-Received: by 10.157.3.143 with SMTP id f15mr15396591otf.150.1480377219894;
	Mon, 28 Nov 2016 15:53:39 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Mon, 28 Nov 2016 15:53:19 -0800 (PST)
In-Reply-To: <1480371801-21467-1-git-send-email-armccurdy@gmail.com>
References: <1480371801-21467-1-git-send-email-armccurdy@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 28 Nov 2016 16:53:19 -0700
X-Google-Sender-Auth: obtkVSYZOlbHH48WKrC65_ds6kU
Message-ID: <CABcZAN=QjzMYd9my-xyOA-=12Mpv6bOvAS2a8shBSxyZFqZ5cQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: squash whitespace when printing BUILDCFG_VARS
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
X-List-Received-Date: Mon, 28 Nov 2016 23:53:40 -0000
Content-Type: multipart/alternative; boundary=94eb2c03b0225353d00542652edc

--94eb2c03b0225353d00542652edc
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 28, 2016 at 3:23 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> TUNE_FEATURES for ARM targets typically contains a lot of whitespace
> due to refactoring in OE 2.1:
>
>   http://git.openembedded.org/openembedded-core/commit/?id=
> f774b44fa007a2a756ada892ede832b1251d940c
>
> Squash whitespace when displaying BUILDCFG_VARS in buildcfg_vars().
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 024fe43..c36c5ed 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -191,7 +191,7 @@ def buildcfg_vars(d):
>      for var in statusvars:
>          value = d.getVar(var, True)
>          if value is not None:
> -            yield '%-17s = "%s"' % (var, value)
> +            yield '%-17s = "%s"' % (var, " ".join(value.split()))
>
>  def buildcfg_neededvars(d):
>      needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
>

This will result in inaccurate values displayed for non-list variables.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c03b0225353d00542652edc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 28, 2016 at 3:23 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21f" class=
=3D"a3s aXjCH m158ad0972fe0669f">TUNE_FEATURES for ARM targets typically co=
ntains a lot of whitespace<br>
due to refactoring in OE 2.1:<br>
<br>
=C2=A0 <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=
=3Df774b44fa007a2a756ada892ede832b1251d940c" rel=3D"noreferrer" target=3D"_=
blank">http://git.openembedded.org/<wbr>openembedded-core/commit/?id=3D<wbr=
>f774b44fa007a2a756ada892ede832<wbr>b1251d940c</a><br>
<br>
Squash whitespace when displaying BUILDCFG_VARS in buildcfg_vars().<br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">arm=
ccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/base.<span class=3D"il">bbclass</span> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/base.<span class=3D"il">bbclass</span> b/meta/cla=
sses/base.<span class=3D"il">bbclass</span><br>
index 024fe43..c36c5ed 100644<br>
--- a/meta/classes/base.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/base.<span class=3D"il">bbclass</span><br>
@@ -191,7 +191,7 @@ def buildcfg_vars(d):<br>
=C2=A0 =C2=A0 =C2=A0for var in statusvars:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D d.getVar(var, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if value is not None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield &#39;%-17s =3D &quot;%s&qu=
ot;&#39; % (var, value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield &#39;%-17s =3D &quot;%s&qu=
ot;&#39; % (var, &quot; &quot;.join(value.split()))<br>
<br>
=C2=A0def buildcfg_neededvars(d):<br>
=C2=A0 =C2=A0 =C2=A0needed_vars =3D oe.data.typed_value(&quot;BUILDCFG_<wbr=
>NEEDEDVARS&quot;, d)</div></blockquote></div><br>This will result in inacc=
urate values displayed for non-list variables.<br>-- <br><div class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clars=
on at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mai=
ntainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c03b0225353d00542652edc--
