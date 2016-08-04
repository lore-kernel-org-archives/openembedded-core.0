Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB0F77026;
	Thu,  4 Aug 2016 20:08:30 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 33so15896744lfw.3;
	Thu, 04 Aug 2016 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=67u4foeF7Y47dBUvh0/D2DLRVADINbfe87YgK7m5DRw=;
	b=FY4SQK3g8JG9yTk/1AAzgYytniwBARnV8KNBc50wKaG5h13uE33MzfUECdmNYe6p8K
	AWs3xyeY6MI+avH6AUZSMJ6jR5JR2+npgMHJgGYm1Pcmg35ZHJclmX6bduj0owcy8Yzm
	MZqtkPe+twYw3cTtPgCIpr2Zc6g0dFs5DbuN/gKflxGr3WJePFGnZU6Ljg+RX54a2dFm
	I/p/uznBz3xuHfbxUZVFO55Qn+2JEoZy6VF9FNb/ihIuWd4O7qdxxxAD7OpZT2SQqhJq
	acOjGM0pH+Pt2Ns+th8nz6jyvnNvImA1O2TGI5pZx4k05fOMHEDX2weUNEHLHbQnIRTr
	PwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=67u4foeF7Y47dBUvh0/D2DLRVADINbfe87YgK7m5DRw=;
	b=WLE9FR9bsMhloqBJoYSTJk0JJ262UNXwHeV9kuUtl2/c06DG4SAdMcpW4XI73aTAE1
	U1ZIKaQbUucILyjZo2rtm02gsJ+2SQnxus9kfQMNQ/e5Ozfnk7bjViXGBNU7H3w4YMxD
	CI6aUxQs4wBxUNeY8Z8YyiWROx+FzVO/HnraRUlUqgHhwLtDLVLBTokCVra3vmVg2IVZ
	tM52hPm/0FSOAfXwpuIKDITCagGCwxXgHxiGR+RJi9VI5hXUu++BZ/cNA5ZHzzAHEZB0
	e7wTF4pwqzoMSDektFJtkv25q4wgwBMYqBZKbiVhafXjdt1f78Yd7rOOxoHr9wwo27X9
	SfBQ==
X-Gm-Message-State: AEkoous2HCRHSKH0HPHLTzqffFmZT9w90tAmyU9qa9qS+Rl5PFlw4Guftz9ep2EVwOZiNasyABZfvZWnFtixhQ==
X-Received: by 10.25.228.79 with SMTP id b76mr229413lfh.10.1470341310262; Thu,
	04 Aug 2016 13:08:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 4 Aug 2016 13:08:29 -0700 (PDT)
In-Reply-To: <20160804195647.4E7D15017B@opal.openembedded.org>
References: <20160804195645.1254.80390@opal.openembedded.org>
	<20160804195647.4E7D15017B@opal.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Aug 2016 22:08:29 +0200
Message-ID: <CA+chaQc0hKwRL1rJohYRxTG3GBre8xAqBpqrKzBwd6mnE9_sxQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 06/10: tslib: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Thu, 04 Aug 2016 20:08:32 -0000
Content-Type: multipart/alternative; boundary=94eb2c0ed3b87f32ef0539448399

--94eb2c0ed3b87f32ef0539448399
Content-Type: text/plain; charset=UTF-8

Since when tslib reads pointercal-xinput file?

On Thu, Aug 4, 2016 at 9:56 PM, <git@git.openembedded.org> wrote:

> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit a0e1ee6d4990d30f42875a8e47854131b9c8d130
> Author: Maxin B. John <maxin.john@intel.com>
> AuthorDate: Tue Jul 12 17:07:40 2016 +0300
>
>     tslib: replace pointercal with pointercal-xinput
>
>     tslib RRECOMMENDS pointercal. Replace it with pointercal-xinput
>     since we removed pointercal recipe.
>
>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/tslib/tslib_1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb
> b/meta/recipes-graphics/tslib/tslib_1.1.bb
> index b0264c3..9d3de2e 100644
> --- a/meta/recipes-graphics/tslib/tslib_1.1.bb
> +++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
> @@ -44,7 +44,7 @@ DEBIAN_NOAUTONAME_tslib-tests = "1"
>  DEBIAN_NOAUTONAME_tslib-calibrate = "1"
>
>  RDEPENDS_${PN} = "tslib-conf"
> -RRECOMMENDS_${PN} = "pointercal"
> +RRECOMMENDS_${PN} = "pointercal-xinput"
>
>  FILES_${PN}-dev += "${libdir}/ts/*.la"
>  FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh
> ${datadir}/tslib"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--94eb2c0ed3b87f32ef0539448399
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Since when tslib reads pointercal-xinput file?</div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 4, 2016 at =
9:56 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.org"=
 target=3D"_blank">git@git.openembedded.org</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit a0e1ee6d4990d30f42875a8e478541<wbr>31b9c8d130<br>
Author: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">maxin.joh=
n@intel.com</a>&gt;<br>
AuthorDate: Tue Jul 12 17:07:40 2016 +0300<br>
<br>
=C2=A0 =C2=A0 tslib: replace pointercal with pointercal-xinput<br>
<br>
=C2=A0 =C2=A0 tslib RRECOMMENDS pointercal. Replace it with pointercal-xinp=
ut<br>
=C2=A0 =C2=A0 since we removed pointercal recipe.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john=
@intel.com">maxin.john@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank">ts<wbr>lib_1.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>tslib_1.1.bb</a> b/meta/recipes-gra=
phics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"noreferrer" target=3D"_b=
lank"><wbr>tslib_1.1.bb</a><br>
index b0264c3..9d3de2e 100644<br>
--- a/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank"><wbr>tslib_1.1.bb</a><br>
+++ b/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank"><wbr>tslib_1.1.bb</a><br>
@@ -44,7 +44,7 @@ DEBIAN_NOAUTONAME_tslib-tests =3D &quot;1&quot;<br>
=C2=A0DEBIAN_NOAUTONAME_tslib-<wbr>calibrate =3D &quot;1&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;tslib-conf&quot;<br>
-RRECOMMENDS_${PN} =3D &quot;pointercal&quot;<br>
+RRECOMMENDS_${PN} =3D &quot;pointercal-xinput&quot;<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/ts/*.la&quot;<br>
=C2=A0FILES_tslib-conf =3D &quot;${sysconfdir}/ts.conf ${sysconfdir}/profil=
e.d/tslib.<wbr>sh ${datadir}/tslib&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0ed3b87f32ef0539448399--
