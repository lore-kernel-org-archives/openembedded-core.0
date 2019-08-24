Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 12CF97D53D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 22:37:36 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id k13so14632220qtm.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i4CWzGEECDKlpslsB3gZ1QRMIwHhMOfKUiT83wUUwSg=;
	b=Nq2Wl1weZINieSsnHl+LhozoeKh6yvtuNryZrPjUjNPkl5UXTkvNVVT7uVlA92Z1JN
	zrezMxYCimJiuhhhaZcSZutTZF9gZuPO4jYJitDouoCA1W2srdeKwuxINz2MfZE4JO8n
	yspQhf+vy8fMmBWeqzo1ZW+0koY03Y8jn2s/cHq66a5ztfC9aMkaxUQad3VC8vwwQFIU
	kM5NKrd4Q3IUoRbM0cvMAnxZpP2XzMksNLC7/iBcUoB7BpTzNVJYdhcUM9NBDOPGPrIM
	5kh0plxHzdjNOHA4GfQwCR3GEXjDZJD7hiMJ0e7PV8wxSlbblpzyVvFzrSpSENhpHNzT
	KjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i4CWzGEECDKlpslsB3gZ1QRMIwHhMOfKUiT83wUUwSg=;
	b=oGoKHrzEuScGK4F9v2eeyApEaRfIA4B3gU8CVtwhoOmX9FOGQtwqY+dwvs/t+pLtP2
	siMQ9bJeeoqGVpC1vgpcIg5puZpyyp1EDpR9YLb0HlqbgNPn9LRf4Q9bPB2veOAhZcxf
	FHNwF80yzDotwJ68bL8v7n3+JLVx3ylGg5qPEOA8vRswr7qcSx6K0DxpWjiy5PN/yS79
	3Bpk0AUpcnak7G/96eylgJDZ6Ei7WAA2iS0/9WAKpiXdm1b22dATFokq0imJ0KbJG5is
	1ghiJ8g3BNhH5hShwzHyJARGsygTmwNDV4vlZyFHeFYsXnUeQo4W4HsLUqhB3RCT3Qas
	cZAQ==
X-Gm-Message-State: APjAAAWavaSTHqGyOOVPoGh0LjgNaWeu5+jT6oG8Lz3pl1MdclFzyKgd
	qm2a1K7B1tgOMVVgFermZJ3BKOa55SdZk/SAW2Zh5Q==
X-Google-Smtp-Source: APXvYqxB6BOjMkDs8wv0mqYJs8MozOzxdTtDKuzxng5FY9lUis6cOAZhhfErN9dYZkSLzxzP8i0IKYjYCzuV5jic+hw=
X-Received: by 2002:a0c:e485:: with SMTP id n5mr9961861qvl.175.1566686257709; 
	Sat, 24 Aug 2019 15:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <1566499924-12897-1-git-send-email-Trevor.Gamblin@windriver.com>
In-Reply-To: <1566499924-12897-1-git-send-email-Trevor.Gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 15:37:27 -0700
Message-ID: <CAMKF1sq-ruMp6OyiSWFOydPg=Sy6XUKyZFzU-FiwWcwRbzo1dg@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lighttpd: lighttpd: drop hard-coded lua version in PACKAGECONFIG
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
X-List-Received-Date: Sat, 24 Aug 2019 22:37:37 -0000
Content-Type: multipart/alternative; boundary="000000000000dd86d40590e49132"

--000000000000dd86d40590e49132
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 22, 2019 at 11:53 AM Trevor Gamblin <
Trevor.Gamblin@windriver.com> wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> When building lighttpd with PACKAGECONFIG_append_pn-lighttpd = "lua" in
> local.conf,
> bitbake gives the following error:
>
> ERROR: Nothing PROVIDES 'lua5.1' (but
> /home/tgamblin/build/oe-core/meta/recipes-extended/lighttpd/
> lighttpd_1.4.54.bb DEPENDS on or otherwise requires it)
> NOTE: Runtime target 'lighttpd' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['lighttpd', 'lua5.1']
>
> Removing the "5.1" from the PACKAGECONFIG line in lighttpd_1.4.54.bb
> fixes the issue.


Does it run fine with lua > 5.1 ?

>
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> index ba1a2c5..72990d0 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> @@ -44,7 +44,7 @@ PACKAGECONFIG[webdav-props] =
> "--with-webdav-props,--without-webdav-props,libxml
>  PACKAGECONFIG[webdav-locks] =
> "--with-webdav-locks,--without-webdav-locks,util-linux"
>  PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
>  PACKAGECONFIG[memcache] =
> "--with-memcached,--without-memcached,libmemcached"
> -PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
> +PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
>
>  EXTRA_OECONF += "--enable-lfs"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000dd86d40590e49132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 22, 2019 at 11:53 AM Trevor Gamblin &lt;<a href=
=3D"mailto:Trevor.Gamblin@windriver.com">Trevor.Gamblin@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">From: Trevor Gamblin &lt;=
<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_blank">trevor.ga=
mblin@windriver.com</a>&gt;<br>
<br>
When building lighttpd with PACKAGECONFIG_append_pn-lighttpd =3D &quot;lua&=
quot; in local.conf,<br>
bitbake gives the following error:<br>
<br>
ERROR: Nothing PROVIDES &#39;lua5.1&#39; (but /home/tgamblin/build/oe-core/=
meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54.bb" rel=3D=
"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a> DEPENDS on or otherwi=
se requires it)<br>
NOTE: Runtime target &#39;lighttpd&#39; is unbuildable, removing...<br>
Missing or unbuildable dependency chain was: [&#39;lighttpd&#39;, &#39;lua5=
.1&#39;]<br>
<br>
Removing the &quot;5.1&quot; from the PACKAGECONFIG line in <a href=3D"http=
://lighttpd_1.4.54.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54=
.bb</a> fixes the issue.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Does it run fine with lua &gt; 5.1 ?</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54.bb" =
rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.=
54.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a> b/meta/r=
ecipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54.bb" rel=3D"noref=
errer" target=3D"_blank">lighttpd_1.4.54.bb</a><br>
index ba1a2c5..72990d0 100644<br>
--- a/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54.bb" =
rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a><br>
+++ b/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54.bb" =
rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a><br>
@@ -44,7 +44,7 @@ PACKAGECONFIG[webdav-props] =3D &quot;--with-webdav-props=
,--without-webdav-props,libxml<br>
=C2=A0PACKAGECONFIG[webdav-locks] =3D &quot;--with-webdav-locks,--without-w=
ebdav-locks,util-linux&quot;<br>
=C2=A0PACKAGECONFIG[gdbm] =3D &quot;--with-gdbm,--without-gdbm,gdbm&quot;<b=
r>
=C2=A0PACKAGECONFIG[memcache] =3D &quot;--with-memcached,--without-memcache=
d,libmemcached&quot;<br>
-PACKAGECONFIG[lua] =3D &quot;--with-lua,--without-lua,lua5.1&quot;<br>
+PACKAGECONFIG[lua] =3D &quot;--with-lua,--without-lua,lua&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-lfs&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000dd86d40590e49132--
