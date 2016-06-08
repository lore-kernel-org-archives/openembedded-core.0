Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 790AF60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 08:38:54 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id p204so1900920oih.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2016 01:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3a5yuHfTjtAw/yHseq1G/3QydbB1OlusftuT7ST9klU=;
	b=wiMaRAJvcND7J3nDmQrkxMIq9H9N6bNjtesFwGZsETBrBx5xcJo+AgGRaV5P+gJX0/
	2xRLekU1+dgr+vulrakcfczMZ/IOC9i6S93gAVA8Dp29EyC4Wv3xh0+b2pA5O7ns+VdQ
	j6Xs7/rHJBPW0Ylk8vZB68F6Rhn5/p6KgdfcP9NluYeSf3TI7leZQp3LeC4zE6puWVPF
	iXR8J9P9QnVLKAJOv+Bf2yrio2rUVz+50aPD6g9ls9kwlLd6E0OlFvcwC/8uQ68H6jrq
	BsPthNI3tJ6KDmo3WoBI6ZWzPHM4zv6sLFOi6FFmqx6Br9IKAqFnitBLmwSpGsS/mmkb
	G/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3a5yuHfTjtAw/yHseq1G/3QydbB1OlusftuT7ST9klU=;
	b=AgeDqUFMRwbKunZbGISl1E/T6bfRp5XqaE2vJ7NH3I1PG8hpdzKKBYsoFik9w2+Lg1
	oyLPKdqCFsxDxerrIcMxCndO6L9PGAdQPFmgvCODG22xkiFksAK9J7ZtyPz12Ix3Np74
	0doVgeQSh1SWumMQSf2VatwlaRSlCuRk/bm1drU9EC7GA641ESoAa+7kllIz2iJOfc8i
	maU8HUMKZABl9nHFxlWfQ8fkW5CilCh8l0UMdD47m4p/mg3vC8ZPCaHEhRA1gEoJA+ol
	CFobIWXaE69GFX5CXGnQOBw/XOzrE+WX6XDJJkID/S4uFv2cU70dZ7rvmnhHS1epZrwJ
	tDCg==
X-Gm-Message-State: ALyK8tKYimuJDFNheWrN5aKMrgIWLRqJP1wDKiNVVfcDavgtx4EduA7Jkko4/eJeeqZVJufrvgIthJnSIXTgxZhf
X-Received: by 10.157.32.196 with SMTP id x62mr2186232ota.120.1465375135424;
	Wed, 08 Jun 2016 01:38:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Wed, 8 Jun 2016 01:38:26 -0700 (PDT)
In-Reply-To: <d569eff9957384d9f04fc1c3b3f54c9dd61e6cb9.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
	<d569eff9957384d9f04fc1c3b3f54c9dd61e6cb9.1465365165.git.alejandro.hernandez@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 8 Jun 2016 11:38:26 +0300
Message-ID: <CAHiDW_EhH30=8tifRos=EVJA+U27KO342_1DVjUJ2DsFTjumQQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] python3-pygobject: Upgrade from 3.18.2 to 3.21.0
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
X-List-Received-Date: Wed, 08 Jun 2016 08:38:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c11012068f5fd0534c03c4f

--94eb2c11012068f5fd0534c03c4f
Content-Type: text/plain; charset=UTF-8

On 8 June 2016 at 08:56, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  .../{python3-pygobject_3.18.2.bb => python3-pygobject_3.21.0.bb}      |
4 ++--

I think python3-pygobject follows the "minor-even-is-stable" release
numbering typical to GNOME projects.
If that is correct, then 3.20.x might be better and inheriting
"upstream-version-is-even" would make sense.

Jussi

>
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pygobject_3.18.2.bb =>
python3-pygobject_3.21.0.bb} (81%)
>
> diff --git a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
b/meta/recipes-devtools/python/python3-pygobject_3.21.0.bb
> similarity index 81%
> rename from meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
> rename to meta/recipes-devtools/python/python3-pygobject_3.21.0.bb
> index 4ddae81..e5990d6 100644
> --- a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
> +++ b/meta/recipes-devtools/python/python3-pygobject_3.21.0.bb
> @@ -13,8 +13,8 @@ SRC_URI = " \
>
 file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
>  "
>
> -SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
> -SRC_URI[sha256sum] =
"2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
> +SRC_URI[md5sum] = "a6dba83e3a7df52ba80bd02906f74611"
> +SRC_URI[sha256sum] =
"898c9ef2f80968ccf33d6fbd5087b1721b74792a308b277d02bc935450168a58"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.6.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c11012068f5fd0534c03c4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 8 June 2016 at 08:56, Alejandro Hernandez &lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com">alejandro.hernandez@linux.i=
ntel.com</a>&gt; wrote:<br>&gt;<br>&gt; Signed-off-by: Alejandro Hernandez =
&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com">alejandro.hernan=
dez@linux.intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.../{<a href=3D"http:=
//python3-pygobject_3.18.2.bb">python3-pygobject_3.18.2.bb</a> =3D&gt; <a h=
ref=3D"http://python3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a>}=
 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br><br>I think python3-pygobject follows the =
&quot;minor-even-is-stable&quot; release numbering typical to GNOME project=
s. <br>If that is correct, then 3.20.x might be better and inheriting &quot=
;upstream-version-is-even&quot; would make sense.<br><br>Jussi<br>=C2=A0<br=
>&gt;<br>&gt; =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>&gt;=
 =C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-pygob=
ject_3.18.2.bb">python3-pygobject_3.18.2.bb</a> =3D&gt; <a href=3D"http://p=
ython3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a>} (81%)<br>&gt;<=
br>&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3=
-pygobject_3.18.2.bb">python3-pygobject_3.18.2.bb</a> b/meta/recipes-devtoo=
ls/python/<a href=3D"http://python3-pygobject_3.21.0.bb">python3-pygobject_=
3.21.0.bb</a><br>&gt; similarity index 81%<br>&gt; rename from meta/recipes=
-devtools/python/<a href=3D"http://python3-pygobject_3.18.2.bb">python3-pyg=
object_3.18.2.bb</a><br>&gt; rename to meta/recipes-devtools/python/<a href=
=3D"http://python3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a><br>=
&gt; index 4ddae81..e5990d6 100644<br>&gt; --- a/meta/recipes-devtools/pyth=
on/<a href=3D"http://python3-pygobject_3.18.2.bb">python3-pygobject_3.18.2.=
bb</a><br>&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3=
-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a><br>&gt; @@ -13,8 +13,=
8 @@ SRC_URI =3D &quot; \<br>&gt; =C2=A0 =C2=A0 =C2=A0file://0001-configure=
.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \<br>&gt; =C2=A0&quot;<br=
>&gt;<br>&gt; -SRC_URI[md5sum] =3D &quot;0a956f3e785e23b0f136832f2e57a862&q=
uot;<br>&gt; -SRC_URI[sha256sum] =3D &quot;2a3cad1517916b74e131e6002c382436=
1aee0671ffb0d55ded119477fc1c2c5f&quot;<br>&gt; +SRC_URI[md5sum] =3D &quot;a=
6dba83e3a7df52ba80bd02906f74611&quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot=
;898c9ef2f80968ccf33d6fbd5087b1721b74792a308b277d02bc935450168a58&quot;<br>=
&gt;<br>&gt; =C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>&gt;<br=
>&gt; --<br>&gt; 2.6.6<br>&gt;<br>&gt; --<br>&gt; _________________________=
______________________<br>&gt; Openembedded-core mailing list<br>&gt; <a hr=
ef=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@li=
sts.openembedded.org</a><br>&gt; <a href=3D"http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core</a></div>

--94eb2c11012068f5fd0534c03c4f--
