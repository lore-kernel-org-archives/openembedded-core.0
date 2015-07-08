Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id B366675D75
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 11:12:54 +0000 (UTC)
Received: by qkei195 with SMTP id i195so160001601qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 04:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wQlbZIsHhJAWTMQPk/gIGuZS/OIEzzLizch0x1GffHU=;
	b=h22fwzXuTlLfX1lJvrrhxjleoUL4aiPBwvcuCmUSDvft4AIFTemomRkiDHFF6yuYuP
	mseHAAjVivT7zAVvn9BT22ID8hO/YIatO5AUj06QMQlNItv9tlbQtdIKXuPfmv8ZmGB+
	w1Ip3KqHsGQ1DjPlN6+A+bElBCuahoew6Qb7X8wTYyqz+WyaCtoX39E+1uPUQIt9x7Hu
	oNM8IvfDxuAyMXVQD1iI3RAgZIPegolzAQMYaluzfDwewofZgkF/jUfOw5TKHr8qN3JP
	Hvo8kQG0B7Su50BtwksLukWRG8+7Z55Y9ByilYC9qy/T5fdcJuazrxG0rhma31sJtdZv
	vnKw==
X-Gm-Message-State: ALoCoQmBhcQ6bG81Q7WVAiywC1EGiaUvO4TSbjjuVLhFvwJ3VFZ43p38PJw2JhPOzAxo6LGLBL7V
X-Received: by 10.140.149.141 with SMTP id 135mr10787426qhv.64.1436353974418; 
	Wed, 08 Jul 2015 04:12:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 8 Jul 2015 04:12:35 -0700 (PDT)
In-Reply-To: <BD7BC129-0185-4023-9545-FB3CAC8A5482@gmail.com>
References: <1435918885-12200-1-git-send-email-ross.burton@intel.com>
	<BD7BC129-0185-4023-9545-FB3CAC8A5482@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jul 2015 12:12:35 +0100
Message-ID: <CAJTo0LZiJ6TBTjyc7FAi5s87Z3NarZBe+P+8Mm-xhv-AV_f-pA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: remove git recipe, merge inc
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
X-List-Received-Date: Wed, 08 Jul 2015 11:12:56 -0000
Content-Type: multipart/alternative; boundary=001a11357bf06ad19a051a5b38ce

--001a11357bf06ad19a051a5b38ce
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 8 July 2015 at 05:16, Khem Raj <raj.khem@gmail.com> wrote:

> There might be recipes in other layers which might be using .inc file, drm
> is sometimes
> specific to some SOCs. layer index shows that atleast meta-ti assumes .inc
> to be available
> and there might be more unlisted or closed layers which do so.
>

Looking at the meta-ti recipe, it rewrites so much of the include file that
practically the only bits it is using are the summary and inherits.  If
that were my layer I'd copy the pieces from oe-core that it needed and
consider it a proper fork (or upstream the drivers and drop the recipe).

<insert standard moan about include files for cross-layer use without a
defined "api" for their behaviour and expectations>

Ross

--001a11357bf06ad19a051a5b38ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 8 July 2015 at 05:16, Khem Raj =
<span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":5j1" class=3D"a3s" style=3D"overflow:hidden">There might be =
recipes in other layers which might be using .inc file, drm is sometimes<br=
>
specific to some SOCs. layer index shows that atleast meta-ti assumes .inc =
to be available<br>
and there might be more unlisted or closed layers which do so.</div></block=
quote><div><br></div><div>Looking at the meta-ti recipe, it rewrites so muc=
h of the include file that practically the only bits it is using are the su=
mmary and inherits.=C2=A0 If that were my layer I&#39;d copy the pieces fro=
m oe-core that it needed and consider it a proper fork (or upstream the dri=
vers and drop the recipe).</div><div><br></div><div>&lt;insert standard moa=
n about include files for cross-layer use without a defined &quot;api&quot;=
 for their behaviour and expectations&gt;</div><div><br></div><div>Ross</di=
v></div></div></div>

--001a11357bf06ad19a051a5b38ce--
