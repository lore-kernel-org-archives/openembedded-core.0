Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id CF03F7198F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 15:13:59 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id b187so166426271oif.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JUM53/0bkrNbMDwTV3csaj60ASYmj29b/ZjGJbcT5VY=;
	b=bnPv8Hzu6gbWY1XmXaKqrWJg+tO+XTlp5FYzrtnaYiZfrcjMv+6wOG/tJgRl5Zb9VO
	SFBnk/UPTykZ941QkUtrHa53w3Iwzkvlngh0X1FAW8Yp/EWl3jPrbmycWJ7tPPBRh1Dx
	mjpkTlNEl2Osr6se+foLOaJSDkyRL0EiOq6oflsLOSUWN0vtlBAe3QpofTjLNbPfBAeD
	UyD+hWilrdrYqXBx+ZpR8CZ5LtX1//rzLL6BgBm+z5vMHgVlwozO37Ttol0Fo6K2ML4d
	Z3Vzglv5G8bKU896gAaKTJbAST3qKWfLJHy98eXKYZKPFM8T/p1GnhN6qrz2hg6q/zDR
	i7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JUM53/0bkrNbMDwTV3csaj60ASYmj29b/ZjGJbcT5VY=;
	b=QY6tb6+lGcx5XAlKhLSO+JpM8RRM/N/44kD5ZYiOeFZ6xs7B4CDj6ovOni+GM63wNy
	lpDTKLvO0zfgK4Ogec2zXfNrxibt63s1ceZ8Ys4XQqpdFwE8zjup4X3KiUZf1U3h6PVG
	lcatFVNZydl7mXYEe1lQIonjdgwKTRz1QwVbrkhMBuoKurFvIU4jQgaGLmWRFdVLJKq6
	1nfG9IesdVt/YyDNdFGzowrQe5U7P+2nhbJ5m++vsdakVe5Q3/iSHbfgzQD+ndZdLStX
	RU8LMnat2A7AX50IYn/6HbhkoolTwLz915rpUw/HEqkDTVcfnNWM3+a6oa0rdOwcZ5ZI
	5InA==
X-Gm-Message-State: AFeK/H3EQywol2v50mLju3/Vp1mD80PkM4ZW/pD2kxxeLkKQ1yAYv/5QkKdOZ09kS7tNp/031mILy2KepVToeA==
X-Received: by 10.157.41.38 with SMTP id d35mr6468815otb.15.1491318840664;
	Tue, 04 Apr 2017 08:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.197 with HTTP; Tue, 4 Apr 2017 08:13:40 -0700 (PDT)
In-Reply-To: <1491315753-17805-1-git-send-email-ross.burton@intel.com>
References: <1491315753-17805-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 4 Apr 2017 08:13:40 -0700
Message-ID: <CABcZANn2e_b4dgdr9=LNMuAUtby5r0OoODv4CVFj0DUTno_wKw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: explain where TMPDIR is if we're telling the user to delete it
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
X-List-Received-Date: Tue, 04 Apr 2017 15:14:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c111416bea8c0054c58b98a

--94eb2c111416bea8c0054c58b98a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2017 at 7:22 AM, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 94c78b5..ade8cb6 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -589,7 +589,7 @@ def sanity_handle_abichanges(status, d):
>              with open(abifile, "w") as f:
>                  f.write(current_abi)
>          elif int(abi) <=3D 11 and current_abi =3D=3D "12":
> -            status.addresult("The layout of TMPDIR changed for Recipe
> Specific Sysroots.\nConversion doesn't make sense and this change will
> rebuild everything so please start with a clean TMPDIR.\n")
> +            status.addresult("The layout of TMPDIR changed for Recipe
> Specific Sysroots.\nConversion doesn't make sense and this change will
> rebuild everything so please start with a clean TMPDIR (%s).\n" %
> d.getVar("TMPDIR"))
>

This looks good, though I wonder if we should explicitly state that it
should be removed. I could see someone wondering how they =E2=80=9Cclean=E2=
=80=9D their
tmpdir :)
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c111416bea8c0054c58b98a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 4, 2017 at 7:22 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1s5" cla=
ss=3D"a3s aXjCH m15b3978a37edae9c">Signed-off-by: Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sanity.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 94c78b5..ade8cb6 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -589,7 +589,7 @@ def sanity_handle_abichanges(<wbr>status, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(abifile, &quot;w&=
quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(curre=
nt_abi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif int(abi) &lt;=3D 11 and current_abi =
=3D=3D &quot;12&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot;The layou=
t of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn&#39;t m=
ake sense and this change will rebuild everything so please start with a cl=
ean TMPDIR.\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot;The layou=
t of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn&#39;t m=
ake sense and this change will rebuild everything so please start with a cl=
ean TMPDIR (%s).\n&quot; % d.getVar(&quot;TMPDIR&quot;))</div></blockquote>=
</div><br>This looks good, though I wonder if we should explicitly state th=
at it should be removed. I could see someone wondering how they =E2=80=9Ccl=
ean=E2=80=9D their tmpdir :)<br>-- <br><div class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christ=
opher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded=
, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div>=
</div>
</div></div>

--94eb2c111416bea8c0054c58b98a--
