Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4905E60144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 20:37:42 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id f12so35857488qad.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 12:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ggJ0Enw2y4aZKE1vENrBRFfJJ54EKJ4OnZYg5G+cx2w=;
	b=XnczNc7swxMbKC158jMzz5XuAuwjK8JQm9vo4ns39ryHzDOzcUqZkbwTFusPofdtqi
	aR5YyDoF8F0oQ4h/URMGu3LnRAoxeF442WE1LGlaB7p2Bcbi80V6kXt3xCnLowJbW7R5
	P77DK7mEQqhujPUDh6boLMHF6fzXbUd6k9F2WfT+QhEM44Pt/j19JXHtlsR9Bd8q+wix
	7l7Qcd1y0o6Zn6brZUwabB6EA1wAgA1nAFNosbmnOF0zKAj5+qgtvrmRrxicfrSGUASx
	C+M+XnpFNlS8dxfv1ciUSX528BqUnpDoW9ZZl79Uxf6S6usIT5v0pPPpBuYndWTWhadv
	rr7g==
X-Gm-Message-State: ALoCoQmkhk19MAnzoe1PzUsDA79Wyp/wdf6vQVIp/RAcFlyjAgVHXAlc2Rn9Ksnd7gDeBWFB2ZC1
X-Received: by 10.140.27.129 with SMTP id 1mr7912300qgx.64.1425501463592; Wed,
	04 Mar 2015 12:37:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 4 Mar 2015 12:37:22 -0800 (PST)
In-Reply-To: <1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Mar 2015 20:37:22 +0000
Message-ID: <CAJTo0LY1suWrUCG-AY5pf0H+_HAiyFJOqfR8pT9K3DJA_cfJ+A@mail.gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Wed, 04 Mar 2015 20:37:45 -0000
Content-Type: multipart/alternative; boundary=001a11c146405d65ad05107c6c43

--001a11c146405d65ad05107c6c43
Content-Type: text/plain; charset=UTF-8

Hi Naresh,

On 3 March 2015 at 15:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:

> +    if [ "${TARGET_ARCH}" == "aarch64" ]:
> +             return
> +    else:
> +            bb.build.exec_func('build_iso', d)
>

As Bernhard says, that isn't valid Python.  Were these patches actually
tested?

Ross

--001a11c146405d65ad05107c6c43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Naresh,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 3 March 2015 at 15:46, Naresh=
 Bhat <span dir=3D"ltr">&lt;<a href=3D"mailto:naresh.bhat@linaro.org" targe=
t=3D"_blank">naresh.bhat@linaro.org</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div id=3D":2pe" class=3D"a3s" style=3D"overflow:hidden">+=
=C2=A0 =C2=A0 if [ &quot;${TARGET_ARCH}&quot; =3D=3D &quot;aarch64&quot; ]:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&#39;build_is=
o&#39;, d)</div></blockquote></div><br>As Bernhard says, that isn&#39;t val=
id Python.=C2=A0 Were these patches actually tested?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c146405d65ad05107c6c43--
