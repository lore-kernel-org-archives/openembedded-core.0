Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2A29E783B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:37:32 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id d29so20913086uai.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iEZ4t3RPzoTYSYsdVOgDGip+59GpY2zEGo1Lov9YXI8=;
	b=lbQizZllXwdIVJ3MtFYust6YcUG71E0MKa7qiq0bYUis9UdQd5Sn2dfDQlN3DZIXHn
	hSkjBfkYESRHozNL8zAFD6Jj6UGPgT6/b2B6qcsOBTEEa4IpUmGaZRcRkwNEToRQKUzH
	ePTUzEj7wUgwwhr1k+FrZDvTr8jis8ih3+O1zVJG7c8BplxNzfhE7xtnId34g7KiSI78
	P6hvZ0oWaUincIoEBjPeAB1Kq3XIVc/8JjEVGCVHedmhVoD0pPdEFGtNfIGpuliqrLdJ
	RoUxs7qjClGQnVbAyXdMilqQec1CpXfWhJezrdVQ88r1IFx5iUzVEPLZfWHfZ7bXgDJP
	Bxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iEZ4t3RPzoTYSYsdVOgDGip+59GpY2zEGo1Lov9YXI8=;
	b=BzOcB2YoPd2Sx7v5WiLJQfvW6om200s/QG8QQuxmH2u3fkOBaYb3gb5wskBKJmChxu
	UTFryXK+ndttoz8zRdhUGig8bOpKgek8OOX+30lEMk/9aBky7XdgqFR7nB9Qg9Bkbp/2
	aaf4+sGoebnCYt6cDNXCPeLnm/IFvqgAWlFE6HsUoF57uDfmbc+60H22dXL/iGUPc3ID
	GTtlLAgOtcGtxs9TeusH60h+7LCXUEl0osDiLN+3ytjhD5AOPoqJJw6OG79VIh7ouPHD
	Qgdqn9FVbRivQ1XWzQ95fJ4YbNQ9qXZVcO1B1zI8ykyYh1yvj+qbitC1M4fP82b2g96U
	0a2g==
X-Gm-Message-State: AHYfb5iuXgC7qWuU2D+QLWt5HE9zr9Dv1jezBbGiLuf762o7iDw/8xoe
	qZVeXE6XAwhnNrFnKBEwuqKZjFC8kHDI
X-Received: by 10.176.25.197 with SMTP id r5mr12193741uai.22.1502498254079;
	Fri, 11 Aug 2017 17:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Fri, 11 Aug 2017 17:37:33 -0700 (PDT)
In-Reply-To: <20170812003455.27183-3-Martin.Jansa@gmail.com>
References: <20170812003455.27183-1-Martin.Jansa@gmail.com>
	<20170812003455.27183-3-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 12 Aug 2017 02:37:33 +0200
Message-ID: <CA+chaQdqof+GsioHLsShc27=d2YWXGVJb+G=Lk+MAf=yebsFBA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Gan Yau Wai <yau.wai.gan@intel.com>
Subject: Re: [PATCH][pyro 3/4] insane.bbclass: fix override handling in RDEPENDS QA
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
X-List-Received-Date: Sat, 12 Aug 2017 00:37:33 -0000
Content-Type: multipart/alternative; boundary="94eb2c0adbc4b5cadd055683a20e"

--94eb2c0adbc4b5cadd055683a20e
Content-Type: text/plain; charset="UTF-8"

I'm sorry for resending the first 2 patches in this series, but git
send-email didn't like the colon in Gan Yau Wai e-mail name - it's inside
the quotes for author e-mail, but in Signed-off-by it's parsed without
quotes, so the colon is taken as e-mail separator.

For second git send-email tryi, I've updated the commit to remove the colon
(from both author and SOB line).

See the error bellow:

(mbox) Adding cc: "Gan, Yau Wai" <yau.wai.gan@intel.com> from line 'From:
"Gan, Yau Wai" <yau.wai.gan@intel.com>'
(body) Adding cc: Gan, Yau Wai <yau.wai.gan@intel.com> from line
'Signed-off-by: Gan, Yau Wai <yau.wai.gan@intel.com>'
(body) Adding cc: Ross Burton <ross.burton@intel.com> from line
'Signed-off-by: Ross Burton <ross.burton@intel.com>'
(body) Adding cc: Martin Jansa <Martin.Jansa@gmail.com> from line
'Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>'
sendmail: recipient address Gan not accepted by the server
sendmail: server message: 553 5.1.2 The recipient address <Gan> is not a
valid RFC-5321 address. w19sm3347498wrb.49 - gsmtp
sendmail: could not send mail (account default from /OE/.msmtprc)
Died at /usr/libexec/git-core/git-send-email line 1361.


On Sat, Aug 12, 2017 at 2:34 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> From: Gan Yau Wai <yau.wai.gan@intel.com>
>
> The package_qa_check_rdepends() in insane.bbclass has
> incorrectly replace its localdata OVERRIDES value with
> the package name. Fixing it by appending the package name
> to the existing OVERRIDES value. This resolves RDEPENDS QA
> error when setting PACKAGECONFIG using a pn- override at
> local.conf.
>
> Cherry picked from master 60d28dd72daee235150ab6605cbf953f1ea691df
>
> [YOCTO #11374]
>
> Signed-off-by: Gan Yau Wai <yau.wai.gan@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index dc1c2f8d41..5a3d017004 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -867,7 +867,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip,
> taskdeps, packages, d):
>
>      if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image"
> in pkg:
>          localdata = bb.data.createCopy(d)
> -        localdata.setVar('OVERRIDES', pkg)
> +        localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES') + ':'
> + pkg)
>
>          # Now check the RDEPENDS
>          rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS') or
> "")
> --
> 2.14.0
>
>

--94eb2c0adbc4b5cadd055683a20e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry for resending the first 2 patches in this se=
ries, but git send-email didn&#39;t like the colon in Gan Yau Wai e-mail na=
me - it&#39;s inside the quotes for author e-mail, but in Signed-off-by it&=
#39;s parsed without quotes, so the colon is taken as e-mail separator.<div=
><br></div><div>For second git send-email tryi, I&#39;ve updated the commit=
 to remove the colon (from both author and SOB line).</div><div><br></div><=
div>See the error bellow:<div><br></div><div><div>(mbox) Adding cc: &quot;G=
an, Yau Wai&quot; &lt;<a href=3D"mailto:yau.wai.gan@intel.com">yau.wai.gan@=
intel.com</a>&gt; from line &#39;From: &quot;Gan, Yau Wai&quot; &lt;<a href=
=3D"mailto:yau.wai.gan@intel.com">yau.wai.gan@intel.com</a>&gt;&#39;</div><=
div>(body) Adding cc: Gan, Yau Wai &lt;<a href=3D"mailto:yau.wai.gan@intel.=
com">yau.wai.gan@intel.com</a>&gt; from line &#39;Signed-off-by: Gan, Yau W=
ai &lt;<a href=3D"mailto:yau.wai.gan@intel.com">yau.wai.gan@intel.com</a>&g=
t;&#39;</div><div>(body) Adding cc: Ross Burton &lt;<a href=3D"mailto:ross.=
burton@intel.com">ross.burton@intel.com</a>&gt; from line &#39;Signed-off-b=
y: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@int=
el.com</a>&gt;&#39;</div><div>(body) Adding cc: Martin Jansa &lt;<a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; from line &#=
39;Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com=
">Martin.Jansa@gmail.com</a>&gt;&#39;</div><div>sendmail: recipient address=
 Gan not accepted by the server</div><div>sendmail: server message: 553 5.1=
.2 The recipient address &lt;Gan&gt; is not a valid RFC-5321 address. w19sm=
3347498wrb.49 - gsmtp</div><div>sendmail: could not send mail (account defa=
ult from /OE/.msmtprc)</div><div>Died at /usr/libexec/git-core/git-send-ema=
il line 1361.</div></div><div><br></div></div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Sat, Aug 12, 2017 at 2:34 AM, Martin =
Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">From: Gan Yau Wai &lt;<a href=3D"mailto:yau.wai.gan@intel.=
com">yau.wai.gan@intel.com</a>&gt;<br>
<br>
The package_qa_check_rdepends() in insane.bbclass has<br>
incorrectly replace its localdata OVERRIDES value with<br>
the package name. Fixing it by appending the package name<br>
to the existing OVERRIDES value. This resolves RDEPENDS QA<br>
error when setting PACKAGECONFIG using a pn- override at<br>
local.conf.<br>
<br>
Cherry picked from master 60d28dd72daee235150ab6605cbf95<wbr>3f1ea691df<br>
<br>
[YOCTO #11374]<br>
<br>
Signed-off-by: Gan Yau Wai &lt;<a href=3D"mailto:yau.wai.gan@intel.com">yau=
.wai.gan@intel.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index dc1c2f8d41..5a3d017004 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -867,7 +867,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskd=
eps, packages, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0if not &quot;-dbg&quot; in pkg and not &quot;packagegro=
up-&quot; in pkg and not &quot;-image&quot; in pkg:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata =3D bb.data.createCopy(d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;OVERRIDES&#39;, pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;OVERRIDES&#39;, localdat=
a.getVar(&#39;OVERRIDES&#39;) + &#39;:&#39; + pkg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Now check the RDEPENDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdepends =3D bb.utils.explode_deps(<wbr>l=
ocaldata.getVar(&#39;RDEPENDS&#39;) or &quot;&quot;)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.0<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c0adbc4b5cadd055683a20e--
