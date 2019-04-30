Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9FA7DAE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:11:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p21so3996320wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=wMhi+V0Rw1w+lj42cRSXqRq111jV2Ejd+DP868T6OcM=;
	b=Rs0tIXUGqSbHF6jYR0/eUAhGCsyh7qZkv0/6jpfVLYV4SHbsFFbbBwrJXNW4zUz5Ud
	w/Ri0Ge/Dm/oa/NSxc/Fva22fjl7LTR4kb5ZprZ/e+7EV8XZrm1of1ILSY9nIrHQqqmr
	e21ary4CbHpJnAw9n1j5YjWiuhUAdoI+HSOzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wMhi+V0Rw1w+lj42cRSXqRq111jV2Ejd+DP868T6OcM=;
	b=ehhMfY74F+4Lg+8SiOYOiuBX5mAl8NvsSkZ6IH1RiJ1EqRXGRxCXSijsvZTXo6DJVW
	Ur3t3WHI+q/srBYdtcD5tyo98vam6I0Q7OBdqRw0pMKLrZUqK3q/1/va8s4ZwHU46IUB
	9XYReSzQlTKhq5Fm7UethL8iXe4fl5pFc/KoySOH1gyvGIxe9Kms9+sv4ph145uq1RBb
	n0RhRIwGxoefdDEHpukICSEa2ftVGXjMH0MMEnSEwMMldrbsFpswbxmkRWAVRQ5pSVA3
	DEVL6elGsqEuqlKZYKetnqPZyQIBN2ed1NGr7tlmnx6x9wh507fvpPoxsA+yPeKev3a2
	LXNA==
X-Gm-Message-State: APjAAAWTitAwzVDMhGRyLG56xNFgp8SgSSEhoS8LdtFmcmG578N70Ead
	3xan4HBg/r1y4c0DPvC+29cYxQ==
X-Google-Smtp-Source: APXvYqxFDEDA94J9AbHmdWgHBj5LgMkZQvZDX2tTojJJojTzebhPb9zgaFv+VcI2I1QmorEpSY1Ycw==
X-Received: by 2002:a05:600c:24f:: with SMTP id
	15mr3166420wmj.48.1556633504206; 
	Tue, 30 Apr 2019 07:11:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s22sm9287853wrb.44.2019.04.30.07.11.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 07:11:43 -0700 (PDT)
Message-ID: <b3208cdef64483f1f5f9bb3f334374f3f9f95e3d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 15:11:39 +0100
In-Reply-To: <20190430115323.25661-1-m.felsch@pengutronix.de>
References: <20190430115323.25661-1-m.felsch@pengutronix.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] mesa: fix imx gallium driver
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
X-List-Received-Date: Tue, 30 Apr 2019 14:11:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 13:53 +0200, Marco Felsch wrote:
> Since commit [1] the imx-drm driver is covered by the generic kmsro
> driver. Unfortunatly we need to patch the autotools path too since
> the
> switch commit [1] missed some dependencies.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/commit/ \
> 	41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  ...Fix-imx-autotools-build-dependencies.patch | 46
> +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  4 +-
>  meta/recipes-graphics/mesa/mesa_19.0.1.bb     |  1 +
>  3 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0005-Fix-imx-
> autotools-build-dependencies.patch
> 
> diff --git a/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-
> build-dependencies.patch b/meta/recipes-graphics/mesa/files/0005-Fix-
> imx-autotools-build-dependencies.patch
> new file mode 100644
> index 0000000000..6cefe70bd8
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-
> dependencies.patch
> @@ -0,0 +1,46 @@
> +From 3e2aeab89fdbd0572d635d3a57a54f3fb99af254 Mon Sep 17 00:00:00
> 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Tue, 30 Apr 2019 09:45:26 +0200
> +Subject: [PATCH] Fix imx autotools build dependencies
> +
> +Since commit 41a0acd6 ("Switch imx to kmsro and remove the imx
> winsys")
> +the imx-drm is covered by kmsro. During the switch some autotools
> +dependencies are missed. Autotools are marked as deprecated but
> since
> +yocto still uses them we need to cover this.
> +
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

The patch is missing an Upstream-Status: line.

Cheers,

Richard


