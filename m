Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 73F1C787C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:52:20 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l19so11027pgo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R89uujkC6TcmxCLX4jJNUqn8fQe/vj/jDIssK+feGBc=;
	b=N7pWXm2dkaoVSf5EKaLamyRbiue6RSV7/LC0+Q12CyE2xIJjbamOzUO1WnWoyGrsUi
	J23yC8UaCYGWgZssAzqHtZHrtWl4winGyKQKFcwVDFKA1umVEqxtQQV3mWh5l0xLWkrK
	1h81AjR4CgFRjH0AxTX/+D08XwzvNzG3srgMqMopWoDli524eWm3PZDy1LR0gVZRJJsA
	byv1PM66CwUDU07gvVEsDoRp5nV9uouWa3VcPSsZoXVZF2NG3zCFOY46YK2OYU6FylTO
	T5MRH1P2072aim3Gu2+pmLGiGYC2bQPJBL2ElhCJ3P3ZE4tLG8k3lST38eO3K8woUvoX
	NzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R89uujkC6TcmxCLX4jJNUqn8fQe/vj/jDIssK+feGBc=;
	b=lrNbxXr65C71fYFVT9BZUSOQgNuz6d+Zb/XraX64im8yF5alwzUkmbZ/0N2/4wLedh
	pMaD1BCfX/aQabnhppNjnhaXpnISH8nL60rCJzD3IeTnnzwt/pAW3VSflud8QpBB00eV
	uMhvsMH8CSnsAuC2gTuaaqronRnCwLVRVWxF0ZhdUcsvwgkwa/YfGmIYoQIllGgvoAps
	jX1KvR15ocjdcjZvrzGyq5M0QYAcopFGmbilbXoA+j6QykDO7GgY3c9eDtqPlni/SIP/
	bQ2DB/pUshVOM+JBqAekz8EK0FXSfLPv1NymnA+ob/JCbdlijBRfDb5352kgFN9TmUD9
	8JUQ==
X-Gm-Message-State: AJaThX5ab1DQlE7QkI0UB2vuCx6kuLZ50E0joNVeKbhGOYleOzO4eLgv
	6FaAg8IDzm7386/Sovcw27y+alXTq3RQy+J7gGg=
X-Google-Smtp-Source: AGs4zMZu2DAh7xbGs8KsJ36JNDzvgLGdiUlYrI8o4rtfr5zB41RRmjh8Cdo2C2iW/mVpyaA5FlkY75D/unoUKJl/RQI=
X-Received: by 10.99.124.24 with SMTP id x24mr2562711pgc.196.1510858342399;
	Thu, 16 Nov 2017 10:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20171116091639.16549-1-git@andred.net>
In-Reply-To: <20171116091639.16549-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2017 18:52:11 +0000
Message-ID: <CAMKF1sq31HwJAMyZ-LFyej7Dy4S2k-q-ZCUv-Zg_cQid2qvmiQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add 'xz' to HOSTTOOLS
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
X-List-Received-Date: Thu, 16 Nov 2017 18:52:21 -0000
Content-Type: multipart/alternative; boundary="94eb2c1b4cf6ce04e2055e1e1e09"

--94eb2c1b4cf6ce04e2055e1e1e09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2017 at 1:16 AM Andr=C3=A9 Draszik <git@andred.net> wrote:

> Files in SRC_URI that are xz compressed can not be
> unpacked without this, as we'd have no decompressor
> available.


I thought we added  xz-native dependency to such recipes

>
>
> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9696273acc..dfc4de56a6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -480,7 +480,7 @@ HOSTTOOLS +=3D " \
>      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd
> python python2 \
>      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh
> sha256sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true
> uname \
> -    uniq wc wget which xargs \
> +    uniq wc wget which xargs xz \
>  "
>
>  # Tools needed to run testimage runtime image testing
> --
> 2.15.0.rc1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1b4cf6ce04e2055e1e1e09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Thu, Nov 16, 2017 =
at 1:16 AM Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net">git@and=
red.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Files in SRC=
_URI that are xz compressed can not be<br>
unpacked without this, as we&#39;d have no decompressor<br>
available.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I thou=
ght we added =C2=A0xz-native dependency to such recipes</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><br>
<br>
Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net" tar=
get=3D"_blank">git@andred.net</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 9696273acc..dfc4de56a6 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -480,7 +480,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0mktemp mv nm objcopy objdump od patch perl pod2man pr p=
rintf pwd python python2 \<br>
=C2=A0 =C2=A0 =C2=A0python2.7 python3 ranlib readelf readlink rm rmdir rpcg=
en sed sh sha256sum \<br>
=C2=A0 =C2=A0 =C2=A0sleep sort split stat strings strip tail tar tee test t=
ouch tr true uname \<br>
-=C2=A0 =C2=A0 uniq wc wget which xargs \<br>
+=C2=A0 =C2=A0 uniq wc wget which xargs xz \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# Tools needed to run testimage runtime image testing<br>
--<br>
2.15.0.rc1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c1b4cf6ce04e2055e1e1e09--
