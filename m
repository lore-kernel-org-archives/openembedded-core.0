Return-Path: <kergoth@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 62B2E6BDD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 19:40:28 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id v62so2892723otb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8wuHbymd67u1q8lQYZ6C1ICrVGLgbQN+r6DDj9/LA6Y=;
	b=Y1sPXcQ8qcsufFCLg8yBgBdAdEUN2ifKKVygwxWfUIUc+3mHHYNVh/0G7bNwmejgU7
	eYaKXhDVIKRWfMJHRjAA5GsGL3nF58bcdFatpv8H+vVu8KMBK+Fsi1P0c52W1zuG9WiB
	mT5+nzCvReCnmYnpAjdUJk2lohr5iay/otGVxbR2/S6fuIVx5c36QDUNf3Vaq/4CEYew
	f+gUlDrUuPkvp0di2IuCtbws3dayAP1nAbnQ1edjef/AwvZSwqsFm1qgqlDxQsQe/f0S
	PHALpSqj5wti1sqQ+u1IIeEFNA3ar94L1W3zLYQe1sCKLdVnYBSoexbyTYxdsHYOb3uU
	Q/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8wuHbymd67u1q8lQYZ6C1ICrVGLgbQN+r6DDj9/LA6Y=;
	b=SV8cSoMp9fTAe3xrVp4e3LuMpRF45re1zm1gQLlBLHDyA14XEOusGvjduXq7Hl/2be
	ejbHoa07hwFhk0y1gN0xg8F05SiCalEdYSjnFW4t5NbQz22Y2SSabK/NCPCidIsTwEEp
	bSn72RjMfzR3Q4P6wx5huhHgpf/dNXzRerA5UDCLyQrSf0yUeivXHHI3PRsCIpSkT17E
	YFpS3hle9roEn3abCoQZOjO2vHVR5JJ9BVIBWP1pbFTfIKABnKLWE0GLTPkY0XqzsE8t
	w+4Y2YbRc6i9m1BJLUbW9kGmhBdJvoi1V38dEAhcpYZOx1e4kFidB7MbNOnsgeRm2enk
	d1Rw==
X-Gm-Message-State: APjAAAWVVhRjPrhQF/bKdWPiQ1RSUQR/yuFMFiFmuw74Fml50HSp7qGZ
	NMOdqCRVTd97YuTkME+CTg4NtLotG5Dljm1z7Us=
X-Google-Smtp-Source: APXvYqzXvECWC71Il8VTCFbKU4zFVZK2iEVQ8Rus7tcyFFUsUumCdBiAZ9Xz/XEHauH/ybYqwE1bcQmn3XylRqGoqLs=
X-Received: by 2002:a9d:6255:: with SMTP id i21mr28756727otk.158.1552506029041;
	Wed, 13 Mar 2019 12:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 13 Mar 2019 12:40:18 -0700
Message-ID: <CABcZANmQp3PNhqGMwekPmiaq=prZBBwtPftzJvzeTYJFYfDRDA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go.bbclass: Export GOARM
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
X-List-Received-Date: Wed, 13 Mar 2019 19:40:28 -0000
Content-Type: multipart/alternative; boundary="0000000000005fa2e00583fefa7f"

--0000000000005fa2e00583fefa7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How would bitbake respond to an =E2=80=98export=E2=80=99 line with the empt=
y string? I.e.
can you do an actual conditional export the way we do conditional inherits,
so it still is only exported for arm, even if the value is set to the empty
string for others?

On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> When building GO packages for ARM (v5, v6, v7) it is expected that the
> GOARM env variable is set during the build. Not having GOARM exported
> will result in GO binaries which can't be executed on the target
> (terminate with segfault). Per https://github.com/golang/go/wiki/GoArm
>
> We already have the logic in goarch.bbclass to determine the correct
> value of GOARM (see GOARM_TARGET), but currently this is only used to
> build go itself (go-cross_1.*.bb requires go-cross.inc --> export
> GOARM =3D "${TARGET_GOARM}").
>
> Here we export GOARM but we do it such that it is only exported if we
> are building for 'arm' and only when recipes requiring/inheriting
> go.bbclass are be used to build for the target.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> Richard,
>
> MarkH and I were debating this one some. He was suggesting I add
> 'GOARM ?=3D ""' so as not to leave things undefined for non-arm target
> builds. I however, like the behavior of this as submitted here as
> non-arm target builds don't get polluted with a useless export in
> their do_compile scripts and such. The question is as presented here
> is the behavior deterministic?
>
>
> meta/classes/go.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index af331f8..72e2c29 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -8,6 +8,9 @@ GOROOT =3D "${STAGING_LIBDIR}/go"
>  export GOROOT
>  export GOROOT_FINAL =3D "${libdir}/go"
>
> +GOARM_arm_class-target =3D "${TARGET_GOARM}"
> +export GOARM
> +
>  DEPENDS_GOLANG_class-target =3D "virtual/${TUNE_PKGARCH}-go
> virtual/${TARGET_PREFIX}go-runtime"
>  DEPENDS_GOLANG_class-native =3D "go-native"
>  DEPENDS_GOLANG_class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk
> virtual/${TARGET_PREFIX}go-runtime"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000005fa2e00583fefa7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How would bitbake respond to an =E2=80=98export=E2=80=99 l=
ine with the empty string? I.e. can you do an actual conditional export the=
 way we do conditional inherits, so it still is only exported for arm, even=
 if the value is set to the empty string for others?</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 13, 2019 at=
 10:57 AM Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.c=
om">mark.asselstine@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
When building GO packages for ARM (v5, v6, v7) it is expected that the<br>
GOARM env variable is set during the build. Not having GOARM exported<br>
will result in GO binaries which can&#39;t be executed on the target<br>
(terminate with segfault). Per <a href=3D"https://github.com/golang/go/wiki=
/GoArm" rel=3D"noreferrer" target=3D"_blank">https://github.com/golang/go/w=
iki/GoArm</a><br>
<br>
We already have the logic in goarch.bbclass to determine the correct<br>
value of GOARM (see GOARM_TARGET), but currently this is only used to<br>
build go itself (go-cross_1.*.bb requires go-cross.inc --&gt; export<br>
GOARM =3D &quot;${TARGET_GOARM}&quot;).<br>
<br>
Here we export GOARM but we do it such that it is only exported if we<br>
are building for &#39;arm&#39; and only when recipes requiring/inheriting<b=
r>
go.bbclass are be used to build for the target.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
---<br>
<br>
Richard,<br>
<br>
MarkH and I were debating this one some. He was suggesting I add<br>
&#39;GOARM ?=3D &quot;&quot;&#39; so as not to leave things undefined for n=
on-arm target<br>
builds. I however, like the behavior of this as submitted here as<br>
non-arm target builds don&#39;t get polluted with a useless export in<br>
their do_compile scripts and such. The question is as presented here<br>
is the behavior deterministic?<br>
<br>
<br>
meta/classes/go.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
index af331f8..72e2c29 100644<br>
--- a/meta/classes/go.bbclass<br>
+++ b/meta/classes/go.bbclass<br>
@@ -8,6 +8,9 @@ GOROOT =3D &quot;${STAGING_LIBDIR}/go&quot;<br>
=C2=A0export GOROOT<br>
=C2=A0export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
<br>
+GOARM_arm_class-target =3D &quot;${TARGET_GOARM}&quot;<br>
+export GOARM<br>
+<br>
=C2=A0DEPENDS_GOLANG_class-target =3D &quot;virtual/${TUNE_PKGARCH}-go virt=
ual/${TARGET_PREFIX}go-runtime&quot;<br>
=C2=A0DEPENDS_GOLANG_class-native =3D &quot;go-native&quot;<br>
=C2=A0DEPENDS_GOLANG_class-nativesdk =3D &quot;virtual/${TARGET_PREFIX}go-c=
rosssdk virtual/${TARGET_PREFIX}go-runtime&quot;<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--0000000000005fa2e00583fefa7f--
