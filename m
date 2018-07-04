Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id C363678A32
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 08:55:32 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id 13-v6so9354717ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CqAkRoFGtq0BxNkA4Qp8TNvlrOtyxIxqp3tZ1dFGbE0=;
	b=T7WQZUij7kTV+FK5sWtshQEpoJ2k1E5So2oorVKzi/ALYx5n3JqEfE3rkWdVmkciQH
	L+akZF1ulWTlje7zStrmx42FLB3YvHi9bRo2vBs6+K0TbPiLmCZtRE0/EAcnw40xs9AO
	ZTxq1bDMazgORdExAReLsVpTusIpBbUxau/MlvEkRuZ3EqqAnEirXsAOkoHupz4O/qmK
	C/rI/gGz1ZzCIW9G6jOLt209OdHE52WbJjD0hLQt8PaWES3QChOg2+Ag6IQ2r85S6nLD
	A+WKbvoy/eIqdKMmaABjT/KkZzQEis+e1V+qekdABK6hbxNQOYRIHInXiVwvFbLdmgdt
	MR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CqAkRoFGtq0BxNkA4Qp8TNvlrOtyxIxqp3tZ1dFGbE0=;
	b=oc1Z/TZKC8iy/B9++TBamfUpMKZ1miqMOvaqjojqT4NKO6XnwobX+rSE/SHfrtt1hL
	F+BAmfu6AoaaQr7xgulURw4zyR4u0tT5cSC7i0KxCgarWFyOUrfsBGRI5+jQ0vLuaVCd
	J0DMDe/i9d943vIR9zf1QAvmCoxzg8VcDYVoBgAXiKSDE6DmkE9jlCdv92JdVhnQHOSd
	TGH5X1hS88dtoFKFVmSg1HPw+2MkMahiD7kq7k6sMZcs/uBRgfx8iRxAjb3QQyTY59/N
	LGI5L/7ZuXOCRo0f4qryCrlsl+dfn7ikKPq/rpdqkaabZIiE0dFP5MpYbWbMue+aOyc9
	a+NA==
X-Gm-Message-State: APt69E1Geo4dmmGIZyJmNRGmwGkxhv8odandIdThIdA7Oe/NLBi80w5W
	Hcd49rhbfpP66/pbHU0L36QBqwELr3RohK8KWGj8Ug==
X-Google-Smtp-Source: AAOMgpc/VjQ8s7KQPeBe3tH8HdmVM5okA1OuFR2i8Mz/5OTkMYEwvkslky/YgWcjUOwJIhmItdD3foUK4wmNz5elrnU=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr1246285oix.235.1530694533917;
	Wed, 04 Jul 2018 01:55:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Wed, 4 Jul 2018 01:55:13 -0700 (PDT)
In-Reply-To: <38a8087461acbc6628b6b60a11393cf2431fbeb9.1530672257.git.liezhi.yang@windriver.com>
References: <cover.1530672257.git.liezhi.yang@windriver.com>
	<38a8087461acbc6628b6b60a11393cf2431fbeb9.1530672257.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jul 2018 09:55:13 +0100
Message-ID: <CAJTo0LZUkmav3kxtRpYqWwSxVenj-ZsYeoEX+mV91Z6vXhZf6A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nfs-utils: 2.1.1 -> 2.3.1
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
X-List-Received-Date: Wed, 04 Jul 2018 08:55:33 -0000
Content-Type: text/plain; charset="UTF-8"

On 4 July 2018 at 03:47, Robert Yang <liezhi.yang@windriver.com> wrote:
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
> @@ -0,0 +1,22 @@
> +Fixed:
> +configure: error: res_querydomain needed
> +
> +Upstream-Status: Backport [https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/musl-res_querydomain.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]

That's not a backport, it's a patch that Alpine created (U-S: Pending).

Ross

