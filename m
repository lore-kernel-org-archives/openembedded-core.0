Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id D6D06605C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 11:01:36 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id i50so26228288qgf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 03:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/3HLkcjTlDEBsiVYS1CDsKgq2h8+rTeHVY1obQ8+P3g=;
	b=Duqu5OjwYdpBEkqAbkFHchWiDUfc//In0HlsAlS8xTZlNjGz60gI32Xoudu0VAHNSq
	fsugFH2+GuZzNYqJj925honhumTIUCnlLG2nahY+wPWIvvq8lj5nK8QCuYrPr3MfvqOI
	4FrVE1esaRsCMeB067t3Ar+bYIZZctnxpkTaqf62lCUevJmIuXQY8tOrg0Q3HFDnBASJ
	JHvOXfA7NumImbO7m2QTUtrfqY3j0CCAMXP+8GzFdmwhY+HiimDu2JA1teU7Q4Z26KRy
	GKK9o4EVWPnnKFUx7Eq9IHsU/D1gI3hEQlViEfph0thtEBBYgw2LLw+TV8d+tpsTUu96
	j+aQ==
X-Gm-Message-State: ALoCoQnHOAuRUtfCn9aucOAMmndvGE4X3EMBy5nlyfwEumRz8ORBdmL/W8bD8V1cu6Gf7VM4FJVe
X-Received: by 10.224.103.129 with SMTP id k1mr19776qao.93.1422529297574; Thu,
	29 Jan 2015 03:01:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 02:54:31 -0800 (PST)
In-Reply-To: <1422498660-48338-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1422498660-48338-1-git-send-email-leimaohui@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 10:54:31 +0000
Message-ID: <CAJTo0LahwH41HWu-6Ho7-yU-mkEy=mB831WRVGH-5Q_OM1p1eA@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libidn_0.6.14: fix the QA Issue
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
X-List-Received-Date: Thu, 29 Jan 2015 11:01:39 -0000
Content-Type: multipart/alternative; boundary=047d7b66f74b76f2a9050dc8692a

--047d7b66f74b76f2a9050dc8692a
Content-Type: text/plain; charset=UTF-8

This is already queued for master (merge of which is pending a rootfs
problem).

Ross

On 29 January 2015 at 02:31, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> To fix the QA Issue as following:
> ERROR: QA Issue: libidn: Files/directories were installed but not shipped
>   /usr/share/emacs
>   /usr/share/emacs/site-lisp
>   /usr/share/emacs/site-lisp/punycode.el
>   /usr/share/emacs/site-lisp/idna.el [installed-vs-shipped]
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/recipes-extended/libidn/libidn_0.6.14.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/libidn/libidn_0.6.14.bb
> b/meta/recipes-extended/libidn/libidn_0.6.14.bb
> index ff8d345..4df1d08 100644
> --- a/meta/recipes-extended/libidn/libidn_0.6.14.bb
> +++ b/meta/recipes-extended/libidn/libidn_0.6.14.bb
> @@ -29,4 +29,5 @@ do_configure_prepend() {
>
>  do_install_append() {
>         rm -rf ${D}${libdir}/Libidn.dll
> +       rm -rf ${D}${datadir}/emacs
>  }
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b66f74b76f2a9050dc8692a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is already queued for master (merge of which is pendi=
ng a rootfs problem).<div><div><div><br></div><div>Ross</div></div></div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 29 January=
 2015 at 02:31, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimaohu=
i@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">To fix the QA Issue as following:=
<br>
ERROR: QA Issue: libidn: Files/directories were installed but not shipped<b=
r>
=C2=A0 /usr/share/emacs<br>
=C2=A0 /usr/share/emacs/site-lisp<br>
=C2=A0 /usr/share/emacs/site-lisp/punycode.el<br>
=C2=A0 /usr/share/emacs/site-lisp/idna.el [installed-vs-shipped]<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">l=
eimaohui@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/libidn/<a href=3D"http://libidn_0.6.14.bb" targ=
et=3D"_blank">libidn_0.6.14.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-extended/libidn/<a href=3D"http://libidn_0.6.14.b=
b" target=3D"_blank">libidn_0.6.14.bb</a> b/meta/recipes-extended/libidn/<a=
 href=3D"http://libidn_0.6.14.bb" target=3D"_blank">libidn_0.6.14.bb</a><br=
>
index ff8d345..4df1d08 100644<br>
--- a/meta/recipes-extended/libidn/<a href=3D"http://libidn_0.6.14.bb" targ=
et=3D"_blank">libidn_0.6.14.bb</a><br>
+++ b/meta/recipes-extended/libidn/<a href=3D"http://libidn_0.6.14.bb" targ=
et=3D"_blank">libidn_0.6.14.bb</a><br>
@@ -29,4 +29,5 @@ do_configure_prepend() {<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${libdir}/Libidn.dll<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/emacs<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.4.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7b66f74b76f2a9050dc8692a--
