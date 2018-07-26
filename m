Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 30BF478BF9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:00:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r16-v6so1827279wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F4sfsY5H+SvienYboECnIm9Jpm+ny5iMEkxnuU8p6ow=;
	b=uaymTooRlof/3uo/vXBI/Z5sCHxNPaLCoF5BlnQ1ZV98zKBOW4yrMZq1FCq3ViSJVG
	Qs0zXrvhT5CO3S8jHWmNjxEatVMqo8AZL3XHakVPwwTKJhpnKX8euuQ5vFbC/pkVsCKV
	JxOBq29DnIZJWqtfDYUSeyBA1wOVUITJ+4o6uCJpctmGEn/ta7yDQJZRv6MJhMG3Yuxe
	COBwrhlDZTh/5ocPC5Bp0KlVS+RTvWr22vF4MbGCk93J4HTftoHVW0lOgCo4MSnD+SRf
	7WmCBbeIWf1jnuUTWnabhvGkJM96ESYeyauTxptsSYer2+6VYugC5nHtg6alLNjLuDo8
	3YDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F4sfsY5H+SvienYboECnIm9Jpm+ny5iMEkxnuU8p6ow=;
	b=TMXTU90pWz+Ez3H1DMohOoTe12F5WkgQh+MMxS/ykWb/sAYD6dm7pQZJkyjWLkW4BC
	cTVvAU59kDvT4psiYaRLwrcvZwD9PGQHOpJZpnHwomoOAY29xAw3HfewpjkfqsMtabLL
	zevXyD7P3GZ+GNXom/OiFcE8vbohfgjENGyDJfbTyLW1LC4rMt/l0AzU8ZGW+332qwhY
	wZmoCQm+bdhgPiYzfBHFlqa/0xSRk5ws4zjO5EnHfJHG5M4HTYyznVb6H9hULp5nbFe2
	keS5JyBn8APthVN0eaRxLJl7BV3t87x9H7Ryb+dv1Bk+GmYj13bHORvJSx7LveQZLOL5
	aPJA==
X-Gm-Message-State: AOUpUlHj0Y0SrkodS1/CY6tMiuBTB1vs1k2VOEYogXbUKTd4QbCkZPCL
	U86Cp1j+Ie2VdQasDXPE6p21UiNU9OdVM2UcLKQ=
X-Google-Smtp-Source: AAOMgpdPU3OM/wSj346kcI2nBzPZ4BsbbsvZL23+0wfw9Dx3Z7niXDRtO8lnrZfEWDH+q2xAg76ZF/EvMmmqgPNfQ1E=
X-Received: by 2002:a5d:40c4:: with SMTP id
	b4-v6mr1565284wrq.133.1532613635037; 
	Thu, 26 Jul 2018 07:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
In-Reply-To: <20180726135835.17632-1-adrian.ratiu@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jul 2018 16:00:25 +0200
Message-ID: <CA+chaQfGatvA-7UQSvrBZXG58QNLf0M0UcNbSNp+9JJ==GuQ2g@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Thu, 26 Jul 2018 14:00:35 -0000
Content-Type: multipart/alternative; boundary="0000000000004b9e320571e76b8a"

--0000000000004b9e320571e76b8a
Content-Type: text/plain; charset="UTF-8"

This probably doesn't do what you're expecting it to do, use
ALTERNATIVE_${PN}_append_class-target = " fallocate"

You can check with bitbake -e to see what's the difference between these 2.

On Thu, Jul 26, 2018 at 3:56 PM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> Because the util-linux_2.32.bb recipe explicitely disables fallocate
> for nativesdk triggering build warnings:
>
> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux:
> alternative target (sdk/usr/bin/fallocate or
> sdk/usr/bin/fallocate.util-linux)
> does not exist, skipping...
> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding
> alternative provide sdk/usr/bin/fallocate: sdk/usr/bin/fallocate.util-linux
> does not exist
> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link ==
> alt_target: sdk/usr/bin/fallocate == sdk/usr/bin/fallocate
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index ed5c618750..504f3c5b61 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -206,8 +206,9 @@ do_install_append_class-native () {
>  ALTERNATIVE_PRIORITY = "80"
>
>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
> switch_root"
> -ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall
> fallocate unshare"
> +ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall unshare"
>  ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
> +ALTERNATIVE_${PN}_class-target += "fallocate"
>
>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>  ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
> --
> 2.18.0
>
>

--0000000000004b9e320571e76b8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This probably doesn&#39;t do what you&#39;re expecting it =
to do, use<div><span style=3D"font-size:small;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">ALTERNATIVE_${PN}_append_class-targe</span><span style=3D"=
font-size:small;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">t =3D &quot; =
fallocate&quot;</span><br></div><div><span style=3D"font-size:small;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline"><br></span></div><div><span style=3D=
"font-size:small;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">You can chec=
k with bitbake -e to see what&#39;s the difference between these 2.</span><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul 26, =
2018 at 3:56 PM Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com=
">adrian.ratiu@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Because the <a href=3D"http://util-linux_2.32.bb" rel=3D"noreferrer" targ=
et=3D"_blank">util-linux_2.32.bb</a> recipe explicitely disables fallocate<=
br>
for nativesdk triggering build warnings:<br>
<br>
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux:<br>
alternative target (sdk/usr/bin/fallocate or sdk/usr/bin/fallocate.util-lin=
ux)<br>
does not exist, skipping...<br>
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding<br=
>
alternative provide sdk/usr/bin/fallocate: sdk/usr/bin/fallocate.util-linux=
<br>
does not exist<br>
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link =3D=
=3D<br>
alt_target: sdk/usr/bin/fallocate =3D=3D sdk/usr/bin/fallocate<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
 target=3D"_blank">adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index ed5c618750..504f3c5b61 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -206,8 +206,9 @@ do_install_append_class-native () {<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;80&quot;<br>
<br>
=C2=A0ALTERNATIVE_${PN}=C2=A0 =3D &quot;dmesg kill more mkswap blockdev piv=
ot_root switch_root&quot;<br>
-ALTERNATIVE_${PN} +=3D &quot;hexdump last lastb logger mesg renice wall fa=
llocate unshare&quot;<br>
+ALTERNATIVE_${PN} +=3D &quot;hexdump last lastb logger mesg renice wall un=
share&quot;<br>
=C2=A0ALTERNATIVE_${PN} +=3D &quot;setsid chrt flock utmpdump eject nologin=
 taskset&quot;<br>
+ALTERNATIVE_${PN}_class-target +=3D &quot;fallocate&quot;<br>
<br>
=C2=A0ALTERNATIVE_LINK_NAME[dmesg] =3D &quot;${base_bindir}/dmesg&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[kill] =3D &quot;${base_bindir}/kill&quot;<br>
-- <br>
2.18.0<br>
<br>
</blockquote></div>

--0000000000004b9e320571e76b8a--
