Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 077B87E963
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 11:07:13 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id s3so8426378vsi.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 04:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m4yU0Lfk0s6/GIiWcTAhXNJZO4bjkOVQ+3fPZHGScfU=;
	b=n/kMb5ZcejexdgoL9Psps6T3SG1R4Rvfb3WN0iQjnsENIMtt+XSWpz/kRmrgwG92id
	cplm6AP4lkl2skuvgh/IeRvJKvRGuVMyVGL/0GYr9vfGp4kgX76mhNmgAFq10X/1z1E6
	ROz7/DCnKu6tpfbnYcmKjA51SM5X7XbI/bCtenxPn9JgnbLB1hQ/4eL83PJusilOP/ks
	lThoA/CNcHZUWwTJ/7ObZGwt/lg+x9QWBwEMdxp97K8/3IHiRC+Z1Pb1RlEGEMcjTS25
	v9K+0EghNuu6OWzDHqtOz6QCEKIc2R19D7agEqL9iJpYuyXyGm18P+hO2ufHjxRJpSRY
	N15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m4yU0Lfk0s6/GIiWcTAhXNJZO4bjkOVQ+3fPZHGScfU=;
	b=VuQVrsdRrck6u0Sa/w15lbZPFpEekpy3tl/ZzAne2G0u+185YtYibMvtOGpjwsRJiv
	4Pgbz4hY+dsQYyjPsI5sSKZ+zD0hDel0fGE54NHDdU94qU7S9K7Y02BQ25oql19evtHW
	bHLhGFBmI9KelGR3z72pzcCltbloFJD1WdT5hdf5Sg99CrdewuVmC7eq7HyzEtPu3FZZ
	wIX0HDjo9Og9OlVqs/JLtZurEbSjALxdqLmDMv8x6n+RLV3nUcdSk0IBuVb/c1hJcjEL
	6pbtn6/tm/4cEf/P4UTF4oiJ0IGxjpC9KekJszzoB817zFnSllygrGZA4Fm/VSm6+hg0
	Z1ug==
X-Gm-Message-State: APjAAAV8H3qrnB8OCqte1dPPYNP9ceQ70wD8vaIueyMGxxTBDky9xYMM
	tORdLURPtMt/Iq3MlG352qCh9GgK59W8vWGv1GOQTaOW
X-Google-Smtp-Source: APXvYqxhHMoga16sSfEUlQ13KTmB0wZtCOYjF813aXKtKyT2DHXRnjBGn78xFb7+/Rlms0dGuRdgnQkKd8Ci0Rr7LLc=
X-Received: by 2002:a67:784:: with SMTP id 126mr2570685vsh.35.1568027234775;
	Mon, 09 Sep 2019 04:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2019 13:07:03 +0200
Message-ID: <CANNYZj8kH3Oqp_ac8BsRCRpT4qEqnCg3VYk0LFW4vnkGxnoF9A@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Mon, 09 Sep 2019 11:07:14 -0000
Content-Type: multipart/alternative; boundary="00000000000053b8a805921cca04"

--00000000000053b8a805921cca04
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sep 2019 at 12:58, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

>          rm -rf ${D}/var
> +        install -d ${D}/${SDKTARGETSYSROOT}/etc/rpm
>

Why not simply ${D}/etc/rpm?


> +        sed -i 's/-nativesdk//g' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
> +        sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
>

What do these two sed commands do? If we create /etc/rpmrc just above, can
it have the right content from the beginning?
                      "

> +FILES_${PN}_append_class-nativesdk += "${SDKTARGETSYSROOT}"
>

Same question: why is ${SDKTARGETSYSROOT} needed? The configuration files
should be in /etc, and rpm should be instructed to pick them up from there,
same way as it is done for -native variant when building an image.

Alex

--00000000000053b8a805921cca04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 9 Sep 2019 at 12:58, Zheng Ruoqin=
 &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 rm -rf $=
{D}/var<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${SDKTARGETSYSROOT}/etc/rpm<br=
></blockquote><div><br></div><div>Why not simply ${D}/etc/rpm? <br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/-nativesdk//g&#39; ${D}/${SDKTARGETSYSRO=
OT}/etc/rpmrc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/-/_/&#39; ${D}/${SDKTARGETSYSROO=
T}/etc/rpmrc<br></blockquote><div><br></div><div>What do these two sed comm=
ands do? If we create /etc/rpmrc just above, can it have the right content =
from the beginning?<br></div><div>=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &quot;<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+FILES_${PN}_append_class-nativesdk +=3D &quot;${SDKTARGETSYSROOT}&quot;<br=
></blockquote><div><br></div><div>Same question: why is ${SDKTARGETSYSROOT}=
 needed? The configuration files should be in /etc, and rpm should be instr=
ucted to pick them up from there, same way as it is done for -native varian=
t when building an image.</div><div><br></div><div>Alex<br></div></div></di=
v>

--00000000000053b8a805921cca04--
