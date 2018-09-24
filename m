Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id B010C793A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 15:47:26 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j62-v6so16691406edd.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X6a82ejfX8RyLv78sztVMdbHIbzBF/L1KZuo1qNyaEI=;
	b=WE1a374FLCeW8tUaV4R3xFej4QB80F7mp8PPzQF2k9/tsOeokPaJh1QchI4GKTWa9M
	FJpcb0Uq9racWuZs94nneDy8/p03qm5CNnafIIC2EY9MZyREk4npOeBXFFps1uYl9wf4
	iJLjdP8uhiScRQwYxaVMeubAZU6g9zz/SZ4A/poXiEV9EgVkVmvPe7qlva1iY6GG2VgN
	vpoUaLcr2bZLU1bYQ0jLNzGdAjW0cD/rd+eTPsBmdkyVr2AsKr+oDsTp1Cu7PdrEv2j/
	GEb8DvEMIlT2XEH/0Zllonr7kZtVm/T79zqqNWZyVCn9XIkbdY7A6QjolmZ35h9GJe5b
	0G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X6a82ejfX8RyLv78sztVMdbHIbzBF/L1KZuo1qNyaEI=;
	b=n7IgtnWh5dlQU4GyEeUm52d5j5xpCIa0z2c0IBsaV75PQNsP9TgkixDu4giqF8Kbcn
	MRfEqxcTGa/oYK8Ug/X+gK+Y5EsZtTCxC+g7KZoGSbgUM8357oB8fRDWqeLpMyoNS29K
	qhkMX7v6KfGXNX4WmgVGkG7GrgPqK+xdk4Z5hWWPaunVTxxdOEckZRhrKUYQRD8OEV72
	MJE9yBpFnC/1i8frRTYCT1YMtH6VtYm4wzHlzSJuNqKUC26kBSbyYKkKbaQdltYzUvVz
	KOtOQhILF7KpzSMfTyjFQWynWT4JvNzS/RnlGu40C3fT2W/d6podnEq/wkIwBW8PfMra
	AyHg==
X-Gm-Message-State: APzg51AuTfHzFtrquESugHN20lyapEU6gojIoZMgOPQ17pLapsKpIFm9
	FNyBlCRJjY3WuUuRY7KocIw1A53rG+rvmTDm9IE15JYC
X-Google-Smtp-Source: ACcGV63yVPZgepYp9hUlr4KE1u6OyEemmJ4tyWByr6nkFysMY9QJVRA/nRggOrYZWJfgTwWd76UYvRFPFAKhkKI3V/c=
X-Received: by 2002:a50:e00d:: with SMTP id
	e13-v6mr17355643edl.234.1537804047150; 
	Mon, 24 Sep 2018 08:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180924113003.32625-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180924113003.32625-1-richard.purdie@linuxfoundation.org>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Mon, 24 Sep 2018 08:47:15 -0700
Message-ID: <CAFNP8OtmPuOaRaRP157Q6qQbHnSxJ=4GZuP+rP+oUdP6+1EmEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] layer.conf: Add thud to LAYERSERIES_CORENAMES
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
X-List-Received-Date: Mon, 24 Sep 2018 15:47:27 -0000
Content-Type: multipart/alternative; boundary="000000000000f6f08b05769fe77c"

--000000000000f6f08b05769fe77c
Content-Type: text/plain; charset="UTF-8"

Hi,

Manual updated for LAYERSERIES_COMPAT variable.  All examples use ENTITY
variables so as releases change the examples do not go stale.

Scott

On Mon, Sep 24, 2018 at 4:30 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> With the release approaching, add thud to LAYERSERIES_CORENAMES and update
> oe-core to use this release series. "sumo" will be removed during M4 in
> the next couple of weeks so people need to start updating their master
> layers in preperation for release.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/layer.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 2cbe952801f..0728c51e5fd 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
>  BBFILE_PATTERN_core = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_core = "5"
>
> -LAYERSERIES_CORENAMES = "sumo"
> +LAYERSERIES_CORENAMES = "sumo thud"
>
>  # This should only be incremented on significant changes that will
>  # cause compatibility issues with other layers
>  LAYERVERSION_core = "11"
> -LAYERSERIES_COMPAT_core = "sumo"
> +LAYERSERIES_COMPAT_core = "thud"
>
>  BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f6f08b05769fe77c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div><br></div><div>Manual updated for =
LAYERSERIES_COMPAT variable.=C2=A0 All examples use ENTITY variables so as =
releases change the examples do not go stale. <br></div><div><br></div><div=
>Scott<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mo=
n, Sep 24, 2018 at 4:30 AM Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">With the release approaching, add t=
hud to LAYERSERIES_CORENAMES and update<br>
oe-core to use this release series. &quot;sumo&quot; will be removed during=
 M4 in<br>
the next couple of weeks so people need to start updating their master<br>
layers in preperation for release.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/conf/layer.conf | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
index 2cbe952801f..0728c51e5fd 100644<br>
--- a/meta/conf/layer.conf<br>
+++ b/meta/conf/layer.conf<br>
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS +=3D &quot;core&quot;<br>
=C2=A0BBFILE_PATTERN_core =3D &quot;^${LAYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_core =3D &quot;5&quot;<br>
<br>
-LAYERSERIES_CORENAMES =3D &quot;sumo&quot;<br>
+LAYERSERIES_CORENAMES =3D &quot;sumo thud&quot;<br>
<br>
=C2=A0# This should only be incremented on significant changes that will<br=
>
=C2=A0# cause compatibility issues with other layers<br>
=C2=A0LAYERVERSION_core =3D &quot;11&quot;<br>
-LAYERSERIES_COMPAT_core =3D &quot;sumo&quot;<br>
+LAYERSERIES_COMPAT_core =3D &quot;thud&quot;<br>
<br>
=C2=A0BBLAYERS_LAYERINDEX_NAME_core =3D &quot;openembedded-core&quot;<br>
<br>
-- <br>
2.17.1<br>
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

--000000000000f6f08b05769fe77c--
