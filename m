Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id CD39D77E24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 22:47:14 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id r125so24299328vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7gDibhaIiGzrmNfebCtvWG+pV1LV2Uv3iK3AAMdeVrc=;
	b=gMpunYXwVFpK7mowgGe+7g3jABFMmpHrM6sgge6U59gvcV97sdgzHtGookUU7oC5eu
	Bdi1dOHcMifO3mDVZocmFHfBuK9NyKTF35gmSvMyqSZ9OaENW18Dq+FjH7ZxOlsDnnAb
	Dq4jgPMvmv9P0+n4+74zvObrz0CyyZdU7Ahx9JmaL1rUO/9uH1w7FycvgiuGzU5bnDlG
	vYIzjNa/JarDItT0JYOZYlTPi3ZIC2TroqQKmpCqkooZm08nVnVRIhDPgGyHVXrdGs0n
	HkxzCVRDvAGXngRCcQ8AMd7oBnPlApxh3TawXXQ4ypBi3+ggoTQROMnuUurTRLX1dNjf
	+jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7gDibhaIiGzrmNfebCtvWG+pV1LV2Uv3iK3AAMdeVrc=;
	b=F4M0TblfwHmQEQLFAr9hiVVevw6vzLKX34jxS434Yyw0g3ietEfNV9sIpO0CmvaUqb
	JWbgd9tuvDljVT3MD3kyRD6NakCQXpv1aj/xzJE0sJAxXcXTvlDMiyZzwOBDSPlZ1LsY
	o+ed9/M75rx55RrpgRLw4aw9EP1sOM6xZYcYhOyfLJmaDXQ7OKgtu9nBD2Pstv6cfFBX
	USyz4MCpXdFS7vZ8kalFgREqs1g0mbvtaofS2g5WjjfKZyfk/ChuQFwtoHcAqVUzbe0M
	ALhHFhhWCVzAuV9Rhnpih9dUo63RJ2AjSe/Vw3aby6OtNPgDUfjlm+5Tt0UcheUG/jeR
	273w==
X-Gm-Message-State: AKS2vOxTXiUq3a7SSBe0EfDNZsjQZrz1ULBNaJULMJihQgFndChxJkAj
	sl4tjFugOjKXFXhcYilDxhY38zFwig==
X-Received: by 10.31.191.75 with SMTP id p72mr4097430vkf.38.1498603635431;
	Tue, 27 Jun 2017 15:47:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.189.201 with HTTP; Tue, 27 Jun 2017 15:46:55 -0700 (PDT)
In-Reply-To: <89eb4c1de58d2de44df217a62c9cd791da16a9eb.1498577501.git-series.patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
	<89eb4c1de58d2de44df217a62c9cd791da16a9eb.1498577501.git-series.patrick.ohly@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 27 Jun 2017 15:46:55 -0700
Message-ID: <CABcZAN=rnbDi8qX_y3AXMMoazp=5Qt2wMg72tyvRx1h0fDWzsA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] yocto-compat-layer.py: avoid adding layers more than once
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
X-List-Received-Date: Tue, 27 Jun 2017 22:47:15 -0000
Content-Type: multipart/alternative; boundary="001a114da8f85960d60552f8d90f"

--001a114da8f85960d60552f8d90f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2017 at 8:33 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> add_layer_dependencies() might get called more than once, or one of
> the layer dependencies might already be present. The function should
> not add layers again because doing so can cause warnings like:
>
>   WARNING: Duplicate inclusion for .../meta-openembedded/meta-oe/conf
> /distro/include/meta_oe_security_flags.inc in
> .../meta-openembedded/meta-oe/conf/layer.conf
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>

I=E2=80=99m curious about why this isn=E2=80=99t either just calling out to=
 `bitbake-layers
add-layer` or using one of the existing functions we have for modifying
bblayers, rather than doing its own +=3D.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114da8f85960d60552f8d90f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jun 27, 2017 at 8:33 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=
=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1hh" c=
lass=3D"a3s aXjCH m15cea306d592b2e3">add_layer_dependencies() might get cal=
led more than once, or one of<br>
the layer dependencies might already be present. The function should<br>
not add layers again because doing so can cause warnings like:<br>
<br>
=C2=A0 WARNING: Duplicate inclusion for .../meta-openembedded/meta-oe/<wbr>=
<span class=3D"il">conf</span>/distro/include/meta_oe_<wbr>security_flags.i=
nc in .../meta-openembedded/meta-oe/<wbr><span class=3D"il">conf</span>/lay=
er.<span class=3D"il">conf</span><br>
<br>
Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">p=
atrick.ohly@intel.com</a>&gt;<br>
---</div></blockquote></div><br>I=E2=80=99m curious about why this isn=E2=
=80=99t either just calling out to `bitbake-layers add-layer` or using one =
of the existing functions we have for modifying bblayers, rather than doing=
 its own +=3D.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<b=
r>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a114da8f85960d60552f8d90f--
