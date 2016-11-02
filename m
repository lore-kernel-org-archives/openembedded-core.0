Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 37D8E6093B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:34:51 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id o68so13981301qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mFpjvgJML30Q2TfSdJvghDeCr+I3+Wte4sg9IRszaXU=;
	b=TEPU7GPXS8eLGTc9Gy1KdOtQywtAWl0CH5JeiqULC0Z81Xp7nehUWhbRb/kiD/Lrgy
	GdZSTO+X9akE5R9Rx4DC6nMLWMXiuSNbl01kEKD/mNgWY3uoHQ+Mfz6IusQWyAv80B2G
	tv8PXaM56sPsl+LUb1xDcT1q9e7M/ZVuhQzR6z85Pn0QgyrLD6El/CekiClnTQKq+c/b
	lrGlJCXFktlGzN3WL/hJcIUOrQrLF4NSU8um/5hlu+I/BipW/W3uUbiCKDTZvXlSJ6uQ
	vet20baskdN0S2hYpZIJl37todByWsDKvSWBL+r87sv/vZUt2tRgV5PGmcCK8ccq/vaV
	40IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mFpjvgJML30Q2TfSdJvghDeCr+I3+Wte4sg9IRszaXU=;
	b=cjQ7Zr+AtZ8wm9xi+fSa9FWI2ZwFW69ScOdfr+xV4HpiafHU7sqrbZbco6w14uq+wl
	ih6QFOrnnDuj+6B/EnOLgY36n+vS9w4Pvt+fAQa/FryjrD5GKkOyZUeDgMgION0siQBE
	iYrSj7q5d07z0t59t4Zv2Lddz76IvY/WSh4LEhvq4jcYhC3VCYXxEkW7sCE6VMTXHxQ9
	/R52DfBrN5gTatEmLJMjfxm4p2OCoPhXHKCJb338RTaFVmpdh9bZLE7PNwiR24p11OAx
	+LJu4bELd/iQqIXrfPXjxCgzGu6sJE+JqBf4bzqVvreH8m6qenhUUiBnIcrir1zJeeSt
	qWBw==
X-Gm-Message-State: ABUngvcHksdhyiQqbE1ieXKRhihmcjH15CJK6Qk4cVCXRngI86R4hOmuyrqRfY30ZeqC1Yq1lkwmFT2Qik3fdgIv
X-Received: by 10.55.207.78 with SMTP id e75mr3115441qkj.36.1478086493177;
	Wed, 02 Nov 2016 04:34:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 04:34:32 -0700 (PDT)
In-Reply-To: <1478030040-20670-7-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-7-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 11:34:32 +0000
Message-ID: <CAJTo0LYzaYCx6S1BP=FF_D6d20wzdGh7uZcypr+yPhAMWWQjLQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] gawk: Update to version 4.1.4
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
X-List-Received-Date: Wed, 02 Nov 2016 11:34:52 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b85fb8ea05404fd4db

--001a1145b7b85fb8ea05404fd4db
Content-Type: text/plain; charset=UTF-8

This causes QA warnings:

WARNING: gawk-4.1.4-r0 do_package_qa: QA Issue:
/usr/lib/gawk/ptest/test/arrayind1.awk contained in package gawk-ptest
requires /usr/local/bin/awk, but no providers found in RDEPENDS_gawk-ptest?
[file-rdeps]

We should patch out the hashbang line (and submit that upstream as none of
the other awk scripts in the test suite have a hashbang).

Ross

On 1 November 2016 at 19:53, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest | 0
>  meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb}     | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest
> (100%)
>  rename meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb} (89%)
>
> diff --git a/meta/recipes-extended/gawk/gawk-4.1.3/run-ptest
> b/meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
> similarity index 100%
> rename from meta/recipes-extended/gawk/gawk-4.1.3/run-ptest
> rename to meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
> diff --git a/meta/recipes-extended/gawk/gawk_4.1.3.bb
> b/meta/recipes-extended/gawk/gawk_4.1.4.bb
> similarity index 89%
> rename from meta/recipes-extended/gawk/gawk_4.1.3.bb
> rename to meta/recipes-extended/gawk/gawk_4.1.4.bb
> index 6ca7f3e..ad18237 100644
> --- a/meta/recipes-extended/gawk/gawk_4.1.3.bb
> +++ b/meta/recipes-extended/gawk/gawk_4.1.4.bb
> @@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://run-ptest \
>  "
>
> -SRC_URI[md5sum] = "55d37f4069502677f25d1340df8eec97"
> -SRC_URI[sha256sum] = "524effa5b9ecd4ed940f2581c5d3c1
> df4e4bd7e6f768aa033c1916f47dfc6e29"
> +SRC_URI[md5sum] = "f20c94ca51b6ebfc9bffb90f95c8ffbb"
> +SRC_URI[sha256sum] = "8c03080e2b5a56263e8783f6f1f306
> 398d4591be18254041f3f547efef944d35"
>
>  inherit autotools gettext texinfo update-alternatives
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1145b7b85fb8ea05404fd4db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This causes QA warnings:<div><br></div><div>WARNING: gawk-=
4.1.4-r0 do_package_qa: QA Issue: /usr/lib/gawk/ptest/test/arrayind1.awk co=
ntained in package gawk-ptest requires /usr/local/bin/awk, but no providers=
 found in RDEPENDS_gawk-ptest? [file-rdeps]<br><div><br></div><div>We shoul=
d patch out the hashbang line (and submit that upstream as none of the othe=
r awk scripts in the test suite have a hashbang).</div></div><div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 1 November 2016 at 19:53, Fabio Berton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@o=
ssystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Sig=
ned-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.b=
r">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/gawk/{<wbr>gawk-4.1.3 =3D&gt; gawk-4.1.4}/run-p=
test | 0<br>
=C2=A0meta/recipes-extended/gawk/{<a href=3D"http://gawk_4.1.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">ga<wbr>wk_4.1.3.bb</a> =3D&gt; <a href=3D"http=
://gawk_4.1.4.bb" rel=3D"noreferrer" target=3D"_blank">gawk_4.1.4.bb</a>}=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/gawk/{<wbr>gawk-4.1.3 =3D&gt; gawk-4.1.4=
}/run-ptest (100%)<br>
=C2=A0rename meta/recipes-extended/gawk/{<a href=3D"http://gawk_4.1.3.bb" r=
el=3D"noreferrer" target=3D"_blank">ga<wbr>wk_4.1.3.bb</a> =3D&gt; <a href=
=3D"http://gawk_4.1.4.bb" rel=3D"noreferrer" target=3D"_blank">gawk_4.1.4.b=
b</a>} (89%)<br>
<br>
diff --git a/meta/recipes-extended/gawk/<wbr>gawk-4.1.3/run-ptest b/meta/re=
cipes-extended/gawk/<wbr>gawk-4.1.4/run-ptest<br>
similarity index 100%<br>
rename from meta/recipes-extended/gawk/<wbr>gawk-4.1.3/run-ptest<br>
rename to meta/recipes-extended/gawk/<wbr>gawk-4.1.4/run-ptest<br>
diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" re=
l=3D"noreferrer" target=3D"_blank">g<wbr>awk_4.1.3.bb</a> b/meta/recipes-ex=
tended/gawk/<a href=3D"http://gawk_4.1.4.bb" rel=3D"noreferrer" target=3D"_=
blank">g<wbr>awk_4.1.4.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gaw<wbr>k_4.1.3.bb</a><br>
rename to meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">gaw<wbr>k_4.1.4.bb</a><br>
index 6ca7f3e..ad18237 100644<br>
--- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=3D"no=
referrer" target=3D"_blank">g<wbr>awk_4.1.3.bb</a><br>
+++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.4.bb" rel=3D"no=
referrer" target=3D"_blank">g<wbr>awk_4.1.4.bb</a><br>
@@ -19,8 +19,8 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}<wbr>.tar.=
gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>55d37f4069502677f25d1340df8eec<wbr>97&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>524effa5b9ecd4ed940f2581c5d3c1<wbr>df4e4=
bd7e6f768aa033c1916f47dfc<wbr>6e29&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>f20c94ca51b6ebfc9bffb90f95c8ff<wbr>bb&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>8c03080e2b5a56263e8783f6f1f306<wbr>398d4=
591be18254041f3f547efef94<wbr>4d35&quot;<br>
<br>
=C2=A0inherit autotools gettext texinfo update-alternatives<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1145b7b85fb8ea05404fd4db--
