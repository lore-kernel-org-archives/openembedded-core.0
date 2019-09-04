Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id F3E167F21A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:17:08 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id b123so2571958vsb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XLRXr+0FipnizdpImKMDZFk1e5P7BRjnHYa+emvXCoE=;
	b=FrTwIeBrEc2fCKDkagyloTkFAvZVL+tOdFz1xj07yv0Fxq5wVUBjQDKakm4uHTg2Tg
	bYyK7WtviW3QovS0yZ8aaVUNdEkwsLYlWdOJzSAgA5KWBg3uyfB0NY+Rofyhz0TI52o8
	6IQVx0+OJEJXIxntThz2h821b6jasA2mcKddRvXufNnaNSCKkb1unzZCTArxVJTIsPK6
	n8Qr2yPAKYBbV5qDDjdISFgamsuicUb/3IjhdO9NepB9JCwTNL9Bt55lMt5xPXkVoXjy
	wii63PV1enFawauPtgiOFWumAXTcJ6Rz/0IDg16xV3xhoUJHZk7TPIy9zqZpCYr49RGn
	wN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XLRXr+0FipnizdpImKMDZFk1e5P7BRjnHYa+emvXCoE=;
	b=b1B3eHgpq463NDh8nwVJKWkUmFHwjdu0ybQ4YDwt4Bd213U6jsecNMPnaOvQ4O0J65
	2kOUrujVbHfTG70j+6YKtaz/4hhiNF8n6kH2hmOvJTRp/aVPFWfOImwy7kl/05il5zLd
	fSijPb4m4jffoTvwy84spS7EDk6q8NrKVMcDwMmNxMNVNhmdY97jyq1LSWSHeY16Fq+G
	onSTqbawSumbmBIry7Hc/R5TzkCrKKzjpK/xr9Cyv5/BuN1MVfIY5Fz6caEb4c/Ac/Mo
	nI3jx9eq4+z9l3Aop0JSCakmVc6XZd1B30xEX4RTpJQblaOS0zzKpv+BnNZEBWWuT4c8
	3pDw==
X-Gm-Message-State: APjAAAXP3yJe0D2fq/XGiTvvtmV7svOyIlNaOCPpLOApb4RKUxJTClGm
	dJN53/5hv/GwhPP8obl44uKbkgMjge3hsYbLfQc=
X-Google-Smtp-Source: APXvYqytB+2KnwuOt/L2MjKqSVKKcOkxTGvOE2AyB0JzWh4HEyVAdoh2L8vKOv1icteZLfMrsQfuxjreNR/I+yuVW70=
X-Received: by 2002:a67:1c87:: with SMTP id c129mr23478526vsc.23.1567621030045;
	Wed, 04 Sep 2019 11:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190904181009.8374-1-raj.khem@gmail.com>
	<20190904181009.8374-2-raj.khem@gmail.com>
In-Reply-To: <20190904181009.8374-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 20:16:58 +0200
Message-ID: <CANNYZj9k5pyYnXj5gnrazMV6WBjJvKOQsGr_cD7rY3-Z-k2wMg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python3native: export PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Wed, 04 Sep 2019 18:17:09 -0000
Content-Type: multipart/alternative; boundary="000000000000a36c0f0591be3657"

--000000000000a36c0f0591be3657
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sep 2019 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:

> +export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_BINABI}"
> +export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_BINABI}
>

You need to explain why this is needed. Where are these variables used?

Also, python3-dir.bbclass already has all the needed settings, so please
use it.

Alex

--000000000000a36c0f0591be3657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Sep 2019 at 20:10, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">+export PYTHON_LIBRARY=3D&quot;${STAGING_LIBDIR}/${PYTHON_BINABI=
}&quot;<br>
+export PYTHON_INCLUDE_DIR=3D&quot;${STAGING_INCDIR}/${PYTHON_BINABI}<br></=
blockquote><div><br></div><div>You need to explain why this is needed. Wher=
e are these variables used?</div><div><br></div><div> Also, python3-dir.bbc=
lass already has all the needed settings, so please use it.</div><div><br><=
/div><div>Alex<br></div></div></div>

--000000000000a36c0f0591be3657--
