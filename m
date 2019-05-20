Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 67AE37E07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:51:08 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c3so13997057otr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6p/EKSzQmMxeVt5niyw6MXndHtmn/EUw75NjKoUn/CY=;
	b=iV4+8wbVmxwXyiXB3gNonrtRgzo+Qs4Y5wn4W98VHbDx3uIFsYW8yYRqzH0tkOFxCO
	o+3ELGl7IKhkCeLUfV07t2xwNBuSt4QpV+T7YnAdWETIHTzenO0M83BHf7YUgE8MTKg0
	C/wVg93jatoOemRi404hERkeNG4B+Z7ZbB8RteOiOOI4wra1cUWARo8PGPYLLTTcg7On
	mVG0WoSvsxoG2Tq0Rq8/0klZnYYHN5VuGJ+FeEAkhk21+jJI1tlbv3TKWz2bwRuFpfvf
	bntvvsNEgw79nOMioS8+vmfPyqfpw+o86wZZXxorRWQ2p5Lxsudixt3sTLvkFY/OShY5
	AiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6p/EKSzQmMxeVt5niyw6MXndHtmn/EUw75NjKoUn/CY=;
	b=fIBRtbgLvrKgGt1qhfO34GdU0Bpe3oz1bp0F+2hbMcF7/6UjSxX1p5kxUA6ZV7pQgO
	jVWAOaU73uyluaRVPpBIhmWypNY89Ocok82enzmxAEj1Egm3rWBa3dVg1WvWT2bEOHCH
	RW3pQ6bmYmNHq02C17KIFeZvw0KyUVGeVRB0Av9O1h+Bx6NySaWcvibhwJiLYoVpK5u+
	Rjugwq3jLL42jNczT4mHtKE0I3CF/fTZTIJ2ehFirlhxMT4yGquYWyx1Q1CGe7OtI9kl
	5o8hGPh7KPvsQkxcIu2PJmJs4xrVCWi0uPtvxhSFfrbb4PchUdC7VlKNAPNUeHQgm98X
	VDog==
X-Gm-Message-State: APjAAAWM1vcPE2trT81nrFSkT1qVpXYl1meXz9+815YN7aznrXCHlVgA
	zXlBBXTs4EK04k/wRXTDD/PRZHWuE/FhXzEdX5fVpA==
X-Google-Smtp-Source: APXvYqxfMMfhP6VEXs0EeuApTI3ZsSPJvuElX4iEEyGg2Ya+TpW38fEwV6gVoR5IV07950dXOcjBtScLVuO8wjJjT5Y=
X-Received: by 2002:a9d:694a:: with SMTP id p10mr23597671oto.61.1558378269381; 
	Mon, 20 May 2019 11:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-24-alex.kanavin@gmail.com>
	<5458b99f-5330-1ad6-30e3-a98018c88e00@gmail.com>
In-Reply-To: <5458b99f-5330-1ad6-30e3-a98018c88e00@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 May 2019 20:50:57 +0200
Message-ID: <CANNYZj_ytjH12F2nkRt7f-2-VM6prXOE_ToHWc4FtzUM-pbMpQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/42] at-spi2-core: upgrade 2.30.0 -> 2.32.1
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
X-List-Received-Date: Mon, 20 May 2019 18:51:08 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, upstream has renamed the meson options - thought it was self-evident.

Alex

On Mon, 20 May 2019 at 19:54, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 5/20/19 7:11 AM, Alexander Kanavin wrote:
> > -GTKDOC_MESON_OPTION = "enable_docs"
> > +GTKDOC_MESON_OPTION = "docs"
> >
> > -GIR_MESON_OPTION = 'enable-introspection'
> > +GIR_MESON_OPTION = 'introspection'
> >   GIR_MESON_ENABLE_FLAG = 'yes'
> >   GIR_MESON_DISABLE_FLAG = 'no'
> >
>
> is this change intentional ? if yes then perhaps commit msg should
> document it.

