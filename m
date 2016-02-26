Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0A954772F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 12:57:08 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id hb3so33871797igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 04:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Nj2/TI/kDNSOyK6CMb5wj9towWWPXEAZmeEU3RyitZM=;
	b=E9SF2fLGqmGdgLaTiFdTju59dMYA7TO0buUOvXJqTArzpiO++B8JOAahKiXM9FjGCt
	A/DiIkdDJr/iFGFdiHKZM8nolei/7tlBTKQorDiyuIp67HQWjmhZXNZijrkxsmlJiIrI
	Cf66BWvdjvniXxlDk57ihdarvXI4I0pMLaokOVR8FslvI1+/cmzUT+Nr7RFB/5kIDpjM
	rzL4xw50eR/CYX0go4hdaPxrWBt7GCqa0A5hAO9+vFp6ovVV/YRMO1ah0O+ow6ejYyqu
	GSWLxoUmf7DBm2Go8bASi7Za5rNDRGIqsBmF5ICzDZWxrVc1514pEalxgUU4FrFdP0Qi
	7sMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Nj2/TI/kDNSOyK6CMb5wj9towWWPXEAZmeEU3RyitZM=;
	b=fnpxRuHuqlRMLqhA+52g6O/EN+xGNLPn0nJIBg/v/h1u3Yo+BEO5oFF5O6Nb7htrjS
	JuhKBQlBHOykJHNS13MQ+sO6JhDZ+n9+S/zi5Lm4vuqtAg7HojvtTHSKJaFK4WXWg3vd
	x8iQRf0t6FNQ+FYc/zmcpUfAosnuFwsGNExlnhCwXAq/BikXzJva0y3+knFBFF2q2wxR
	mZXMDay+f8IX2YIimkrc2PeRkk/H4V0BN5+CrGdEkDLan7obyTaz68W4OUXkXYeSg7XB
	U7/JDLiBZ+fdgpP6ChT+8NfjH8CgXjUoN2t8GkGG2doXycIm8iA+iq54VvZEzLpzxe8q
	JOtg==
X-Gm-Message-State: AD7BkJJYshe4oL/IZwRsdwfHvHuNQ5vBCwOPLnuVZ5AvxoDkLVuX4dZyZ2T7ByVjRrleZFEkJo4gP0VqjQTOZ4Rm
X-Received: by 10.50.43.226 with SMTP id z2mr2712213igl.78.1456491428988; Fri,
	26 Feb 2016 04:57:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 04:56:49 -0800 (PST)
In-Reply-To: <1456437568-391-1-git-send-email-ross.burton@intel.com>
References: <1456437568-391-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 12:56:49 +0000
Message-ID: <CAJTo0LY7OP7rTE-5qMU58H53Oyp9eQGT4GECLEyQaziw4r6D0g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rsync: enable native builds for rsync 2.6.9
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
X-List-Received-Date: Fri, 26 Feb 2016 12:57:10 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f43e6350052cabd6a9

--047d7bfea0f43e6350052cabd6a9
Content-Type: text/plain; charset=UTF-8

Retracting this - for native builds GPLv3 is acceptable.

Ross

On 25 February 2016 at 21:59, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/rsync/rsync_2.6.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> index 6854c77..d37cda7 100644
> --- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> +++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
> @@ -26,3 +26,5 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6d5a9d4c4d3af25cd68fd83e8a8cb09c"
>
>  PR = "r4"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.7.0
>
>

--047d7bfea0f43e6350052cabd6a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Retracting this - for native builds GPLv3 is acceptable.<d=
iv><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 25 February 2016 at 21:59, Ross Burton <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burto=
n@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-=
off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burto=
n@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rsync/<a href=3D"http://rsync_2.6.9.bb" rel=3D"=
noreferrer" target=3D"_blank">rsync_2.6.9.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/rsync/<a href=3D"http://rsync_2.6.9.bb" =
rel=3D"noreferrer" target=3D"_blank">rsync_2.6.9.bb</a> b/meta/recipes-devt=
ools/rsync/<a href=3D"http://rsync_2.6.9.bb" rel=3D"noreferrer" target=3D"_=
blank">rsync_2.6.9.bb</a><br>
index 6854c77..d37cda7 100644<br>
--- a/meta/recipes-devtools/rsync/<a href=3D"http://rsync_2.6.9.bb" rel=3D"=
noreferrer" target=3D"_blank">rsync_2.6.9.bb</a><br>
+++ b/meta/recipes-devtools/rsync/<a href=3D"http://rsync_2.6.9.bb" rel=3D"=
noreferrer" target=3D"_blank">rsync_2.6.9.bb</a><br>
@@ -26,3 +26,5 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6d5a9d4c4d3af25cd68fd=
83e8a8cb09c&quot;<br>
<br>
=C2=A0PR =3D &quot;r4&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.0<br>
<br>
</font></span></blockquote></div><br></div>

--047d7bfea0f43e6350052cabd6a9--
