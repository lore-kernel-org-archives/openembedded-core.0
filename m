Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEE37E8DE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2019 15:15:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 207so5179032wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2019 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+kmsaKkuMXyTOw7k62gWiYB8Hi0FCL5LdtwLmUhd8hM=;
	b=I07qwwELJ+OKzRgSdY6UkVNATcRR20gcjRv9i4ODRThnC0uzYodt5kmTTP3pSAnLdK
	XEXunTstgBSlMMwsixBMT67c31vTKO3I3VoCC3zRwXeuBrZEPT2SpZG6MCdEx3cvfNlF
	eCu/utR6PocQugfhVT44/f8TYJsnph70DXB3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+kmsaKkuMXyTOw7k62gWiYB8Hi0FCL5LdtwLmUhd8hM=;
	b=rSnnx2eyzHXKa6qhCmS5ndBOeA5IXKSLdDTqpiBoeajKPK9vO3KJ7ASLzrb+zfXIw7
	JJhOhuJOQrsyR/dRaw9iUGO8/S7/t61gNVE0uOnBUK4KewYCyXeMBISM8M5SycRIlFwy
	QEaXymfzcjaxiE4Mk+FonkUVUlEvDKdbsHnkuE5Yma542QFy7PrLKDtsh6Ek1928pka1
	2MwzARXcLIenYQG4B6B4mxQBRtcvkC9gfYOE1q8Ran3f60KGz/DOHhe3ZN2ebWzv+cfv
	FInKC2138yFmvEjA4fvxyXm1k0ZYq25QtBe/chngOr8w2fI/oKs/cMGhHtCaHa2hEopv
	KoFg==
X-Gm-Message-State: APjAAAVTsYeQBVlIGAQ8gM4UNihHO4O0qLI0WRnCtzVcgtj9XrlP5rNk
	bQezGrV7U8+hkdWoI5jBP8l3kQ==
X-Google-Smtp-Source: APXvYqyiZAIysFgSJdaPSd+pmdAvVKyfFmkGYsHWBDVouQqTY9+RY2PmeItNurrtlJVU+DJBo4dzKA==
X-Received: by 2002:a05:600c:224d:: with SMTP id
	a13mr11626411wmm.62.1560611737774; 
	Sat, 15 Jun 2019 08:15:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d5sm3246849wrc.17.2019.06.15.08.15.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 15 Jun 2019 08:15:36 -0700 (PDT)
Message-ID: <5227c124e870dce2a5eed682dcd9f7cb7ea9d2b6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mariano =?ISO-8859-1?Q?L=F3pez?= <just.another.mariano@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Jun 2019 16:15:35 +0100
In-Reply-To: <e1f95376a17a9cc240d051db9d63cccd82ab02d2.1560482696.git.just.another.mariano@gmail.com>
References: <cover.1560482696.git.just.another.mariano@gmail.com>
	<e1f95376a17a9cc240d051db9d63cccd82ab02d2.1560482696.git.just.another.mariano@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Sat, 15 Jun 2019 15:15:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-06-13 at 22:32 -0500, Mariano López wrote:
> util-linux ptest requires the scsi_debug module to perform eject/mount
> tests. This will conditionally add scsi_debug module when ptest is in
> DISTRO_FEATURES.
> 
> This doesn't include linux-yocto-tiny because the resulting image will
> be too big and do_image would complain about this.
> 
> [YOCTO #13301]
> 
> Signed-off-by: Mariano López <just.another.mariano@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 1 +
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 1 +
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 1 +
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> index 6604bdf90c..0836dc7ea0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> index 1fe28b1bf0..b5e415f935 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> index a5fdafe6b2..cda4ecf89e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> @@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index da795d97aa..8aec315084 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"

I merged this but have just realised its causing warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/93/builds/31

which suggest its not quite doing what we hope/need? :/

Cheers,

Richard


