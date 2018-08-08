Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id E7FFA60074
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:48:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h9-v6so2463635wro.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s8IJeSlYhj08ZS4et67KtAzTpehsdKc90oM6gAn5oo8=;
	b=BBpgg8bNtJDHCVYG0vKxlkA8M+S/0VnYWWI/PmFqzAh2SNeuCCsHi5Tjq7FlUSOZ13
	bCmByjMuvhn6kDzjHizUYm+njMIS3jleHHQtKhIOFV+ZtK05uDhxYpQC7uC6E/Vv24U9
	+ftPk65oxNRGDVNvSvccj4c4T+vQLyYr7BHwjkF9mLXIxgIlvd/fsHEvO81fFOD+9I/s
	vLPUG+n1ogiTIml64Lh3se4lQqKK0Zn2NViitW4Bbh7bCQMO9/Cd9VUDBumW8KI0dgqi
	+NZApebWF0HGz5mrV3XysUi+8ZTyc6YWFtHx/tzg9B3lujrCmIaaIgs4+ymhj85FF9kq
	c0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s8IJeSlYhj08ZS4et67KtAzTpehsdKc90oM6gAn5oo8=;
	b=OsnKdCBR+R5xF2C9xSffqce1ZrnEz7bDuJ4HdUQRdcJC3oXwRpMksqNUrCB2j07e7L
	0HUznG44M+dsEQeXP75mgMzG+/hMQS0FKuXLeufRGG5hkmJQNu3pVwzZ4VwT55ZrOgWV
	lB+dQLCCmoyHw4CJGiEYPTLVu9NoGdhRLehKRQnhs9llEg2kLlHgFtotCuv2TyXwmeDy
	oZcGarpU99FrQNjJdQMID2zf2eTyUnHPsIHQzPp36aM0jJFRle2rpNzeQTY9WTIVfpZU
	6DfQ8Ipj9cavvkUvW7m5Iy6cW7hIl20GXuK0P21uxYkbYDRlal4YHNhME02LXVFekrvP
	/cEA==
X-Gm-Message-State: AOUpUlEuZ1z0qNeiOf29J439gi8rhXqGNnHu7wCtsb6DIbvBOOkfJUTp
	LXQ4TKFmpGxIkFWUouvaFNFXDdsyKufAX+PJ12A=
X-Google-Smtp-Source: AA+uWPzCtU36cyE/bJsejevEK1Lf0xNmv2SvbhKE3zrWJGM3uX+7gjbkfbHJAjylnCfQsRtv7bZIrH4qm3JF96S0Eg0=
X-Received: by 2002:a5d:40c4:: with SMTP id
	b4-v6mr2077013wrq.133.1533743309540; 
	Wed, 08 Aug 2018 08:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1533595822.git.raj.khem@gmail.com>
	<e9bcf3a4c54ac1cd9721abc0d9be5324d4004845.1533595822.git.raj.khem@gmail.com>
In-Reply-To: <e9bcf3a4c54ac1cd9721abc0d9be5324d4004845.1533595822.git.raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Aug 2018 17:48:20 +0200
Message-ID: <CA+chaQfiZ4MPSPE5B3JPYNrcJaDOEQiyHE4UsMf2dP_vWsfrwQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/18] Disable crypt support in glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 15:48:29 -0000
Content-Type: multipart/alternative; boundary="0000000000002452fc0572ee71ec"

--0000000000002452fc0572ee71ec
Content-Type: text/plain; charset="UTF-8"

Should this be squashed with "glibc: Drop packaging libcrypt from 2.28+
onwards" ?

I've accidentally cherry-picked the packaging change from patchwork and
missed this one which results in:

ERROR: glibc-2.28-r0 do_package: QA Issue: glibc: Files/directories were
installed but not shipped in any package:
  /lib/libcrypt.so.1
  /lib/libcrypt-2.28.so
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
glibc: 2 installed and not shipped files. [installed-vs-shipped]


On Tue, Aug 7, 2018 at 12:59 AM Khem Raj <raj.khem@gmail.com> wrote:

> We have independent crypt implementation coming from libxcrypt
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.28.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb
> b/meta/recipes-core/glibc/glibc_2.28.bb
> index 086daed04c..906e6c2b62 100644
> --- a/meta/recipes-core/glibc/glibc_2.28.bb
> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
> @@ -83,6 +83,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --enable-bind-now \
>                  --enable-stack-protector=strong \
>                  --enable-stackguard-randomization \
> +                --disable-crypt \
>                  ${GLIBCPIE} \
>                  ${GLIBC_EXTRA_OECONF}"
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002452fc0572ee71ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Should this be squashed with &quot;glibc: Drop packaging l=
ibcrypt from 2.28+ onwards&quot; ?<div><br></div><div>I&#39;ve accidentally=
 cherry-picked the packaging change from patchwork and missed this one whic=
h results in:</div><div><br></div><div><div>ERROR: glibc-2.28-r0 do_package=
: QA Issue: glibc: Files/directories were installed but not shipped in any =
package:</div><div>=C2=A0 /lib/libcrypt.so.1</div><div>=C2=A0 /lib/<a href=
=3D"http://libcrypt-2.28.so">libcrypt-2.28.so</a></div><div>Please set FILE=
S such that these items are packaged. Alternatively if they are unneeded, a=
void installing them or delete them within do_install.</div><div>glibc: 2 i=
nstalled and not shipped files. [installed-vs-shipped]</div></div><div><br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Aug 7, =
2018 at 12:59 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We have =
independent crypt implementation coming from libxcrypt<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.28.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.28.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.28.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.28.bb</a><br>
index 086daed04c..906e6c2b62 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.28.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.28.bb</a><br>
@@ -83,6 +83,7 @@ EXTRA_OECONF =3D &quot;--enable-kernel=3D${OLDEST_KERNEL}=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-bind=
-now \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-stac=
k-protector=3Dstrong \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-stac=
kguard-randomization \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-crypt \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GLIBCPIE} \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GLIBC_EXTRA=
_OECONF}&quot;<br>
<br>
-- <br>
2.18.0<br>
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

--0000000000002452fc0572ee71ec--
