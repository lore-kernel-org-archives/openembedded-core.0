Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id ED11873F9E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 14:34:08 +0000 (UTC)
Received: by qgii30 with SMTP id i30so85061731qgi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 07:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0UCXWBPuiL6bBcnfhjtO23Epsc0jydwkPijzMTBbYuQ=;
	b=k1Ic9Httis6/JPcbFlmYYZ6LkpHrkYSE+FUuGhQqOkLB2bY1ZLzMVdmkBiHtz/W2Qa
	UE4czTBINENC2BrQgw8V71/V7FCuum5Oj4bp+HiX3fAHon8i2BpfauwEv64KmaGByl6l
	38nrfx1SL7ZexF9AiiA/O9dOCKYTnzcxp7TBjcL1tJr+dDgc8LzDLWp05Q+fyrWqn1Af
	mkDoZVslf2w+hZh2PV4GUf6GfChf++J7lGiWumZqbcnnilifRkfoaVOjXmZ6FvWy1HRM
	rZHt/wriobrszx5OYalUQWIfvWGto5eU7AIfayimEZ5ho2f34787vFuYsYpbTGi8RKaY
	j+6Q==
X-Gm-Message-State: ALoCoQkdzj/e24JUMTxSmAU59qLZ8QYKELYjkIkokZgk9Fzs6fikH87A4Gg1uo+8dgOTD8idIk3g
X-Received: by 10.140.149.141 with SMTP id 135mr2672217qhv.64.1436279648280;
	Tue, 07 Jul 2015 07:34:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 7 Jul 2015 07:33:48 -0700 (PDT)
In-Reply-To: <e73c01fa56d1408ca13f4fcb8e7c6ea1e5580a37.1435134771.git.Qi.Chen@windriver.com>
References: <cover.1435134771.git.Qi.Chen@windriver.com>
	<e73c01fa56d1408ca13f4fcb8e7c6ea1e5580a37.1435134771.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Jul 2015 15:33:48 +0100
Message-ID: <CAJTo0LYHWNytwgjSEiYbt3a5RTwO9TWdnjxSF82Ok00E_i9V6A@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] cups: upgrade to 2.1b1
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
X-List-Received-Date: Tue, 07 Jul 2015 14:34:09 -0000
Content-Type: multipart/alternative; boundary=001a11357bf03bfadb051a49ea0c

--001a11357bf03bfadb051a49ea0c
Content-Type: text/plain; charset=UTF-8

This is a beta release, so isn't appropriate for oe-core without good
reason.

Ross

On 24 June 2015 at 09:34, Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.1b1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.1b1.bb} (40%)
>
> diff --git a/meta/recipes-extended/cups/cups_2.0.2.bb
> b/meta/recipes-extended/cups/cups_2.1b1.bb
> similarity index 40%
> rename from meta/recipes-extended/cups/cups_2.0.2.bb
> rename to meta/recipes-extended/cups/cups_2.1b1.bb
> index 96c24cd..cbf3506 100644
> --- a/meta/recipes-extended/cups/cups_2.0.2.bb
> +++ b/meta/recipes-extended/cups/cups_2.1b1.bb
> @@ -2,5 +2,5 @@ require cups.inc
>
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
>
> -SRC_URI[md5sum] = "6e0ea72dbafcf5baaa1cf4178e71096d"
> -SRC_URI[sha256sum] =
> "858720f76b66fd0441ae2a16f7cabd9554c8c64607e28ffacf16c36c53a3b18b"
> +SRC_URI[md5sum] = "12e37ca320f46467759e9440ffad07e9"
> +SRC_URI[sha256sum] =
> "ffc7620e7dcd8412af3ff2c3da74c56d5dcbb335bf79b787bed039fe1918aee1"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11357bf03bfadb051a49ea0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a beta release, so isn&#39;t appropriate for oe-co=
re without good reason.<div><br></div><div>Ross</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 24 June 2015 at 09:34, Chen Qi=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_=
blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.co=
m">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/cups/{<a href=3D"http://cups_2.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">cups_2.0.2.bb</a> =3D&gt; <a href=3D"http://cu=
ps_2.1b1.bb" rel=3D"noreferrer" target=3D"_blank">cups_2.1b1.bb</a>} | 4 ++=
--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/cups/{<a href=3D"http://cups_2.0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">cups_2.0.2.bb</a> =3D&gt; <a href=3D"ht=
tp://cups_2.1b1.bb" rel=3D"noreferrer" target=3D"_blank">cups_2.1b1.bb</a>}=
 (40%)<br>
<br>
diff --git a/meta/recipes-extended/cups/<a href=3D"http://cups_2.0.2.bb" re=
l=3D"noreferrer" target=3D"_blank">cups_2.0.2.bb</a> b/meta/recipes-extende=
d/cups/<a href=3D"http://cups_2.1b1.bb" rel=3D"noreferrer" target=3D"_blank=
">cups_2.1b1.bb</a><br>
similarity index 40%<br>
rename from meta/recipes-extended/cups/<a href=3D"http://cups_2.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">cups_2.0.2.bb</a><br>
rename to meta/recipes-extended/cups/<a href=3D"http://cups_2.1b1.bb" rel=
=3D"noreferrer" target=3D"_blank">cups_2.1b1.bb</a><br>
index 96c24cd..cbf3506 100644<br>
--- a/meta/recipes-extended/cups/<a href=3D"http://cups_2.0.2.bb" rel=3D"no=
referrer" target=3D"_blank">cups_2.0.2.bb</a><br>
+++ b/meta/recipes-extended/cups/<a href=3D"http://cups_2.1b1.bb" rel=3D"no=
referrer" target=3D"_blank">cups_2.1b1.bb</a><br>
@@ -2,5 +2,5 @@ require cups.inc<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D6c5a350596fba0275=
4bd96eb6df3afd0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;6e0ea72dbafcf5baaa1cf4178e71096d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;858720f76b66fd0441ae2a16f7cabd9554c8c64607e28=
ffacf16c36c53a3b18b&quot;<br>
+SRC_URI[md5sum] =3D &quot;12e37ca320f46467759e9440ffad07e9&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ffc7620e7dcd8412af3ff2c3da74c56d5dcbb335bf79b=
787bed039fe1918aee1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11357bf03bfadb051a49ea0c--
