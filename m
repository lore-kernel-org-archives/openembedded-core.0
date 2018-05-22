Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDFF74739
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 23:45:45 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k5-v6so11024803wrn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0ay9zJlLNCN5YcaBmhqY4nplNb4+gQZlGBWRv7tdus0=;
	b=n2fkJ4kinR8kGjH14LXsXIh++Gb3mDpqlnVhAY60/8hTU3oX2jTsRI4So+EHjzFlF7
	7b2fl0LGT5iNlM6pdR6+08wOVgejSb6Cs62a4z7B+aQnV14AmOXIyua4nEpR9g54KTzS
	FmPb+oHiv7E+hygmFlba+rWFaAB+oVSzjK858yRAFu5H1PRVMvYSSr1pmEDrXZdOXQrk
	pEuTui0mf5nmeq2ITYHqr9Q51Ao8wTlhv0v5E2IImib00xR1MuyJjuk/UIxcBSrZUdEi
	9cyzA3ml3IJF4SJ0r8S+nELMYjWMT8O74HuIasBKqq6hCq6OjbpzL3XODZ0GJg84M/mb
	n/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0ay9zJlLNCN5YcaBmhqY4nplNb4+gQZlGBWRv7tdus0=;
	b=nhLvZRr0ZbIbXk52/IlEo+LJmuNvQLmDiX5uSofFxfiaeyBCo398l1Gjad2u6sDxJn
	nD6TcpyNUYsGJtsWlKuatvEP4NqX08V2xrfgnbxTDeEU/VXAjTvL5v6Tz4xqA3apDz5z
	bN8ZCn9hInCaC2ZJm2ZIpx1f7vm4k4SLdeJVGpJYD2+pNbADgjOnoIfPxuEd38UqANPt
	uCltmmSDXD044LqHcYGGbk9FxVDfkvZD30a0hQ8jkLio4vDLiiQln+hmFGV2J4nVPTDq
	OrzVllqRYepMwZZLzxxJJQTQ8PfY66pQceUMvOibrSs673ikBcOIzTXrsBGWlGf2hyPv
	uZOw==
X-Gm-Message-State: ALKqPwdSlf7nvJaon4O/XS0rMboQZouL5E8emunJp6NZ5rTFB5IVcMP2
	s/IBOhOmYNmtJLoQy9KjQmwvWFa9VXAPXP8Os3I=
X-Google-Smtp-Source: AB8JxZrJ7tjATHjrhu4dAOYn4eg23LdSQnEEr3iBshDPVMRxU8QmYzAiQTtDAsvJNb4raMVAubAj1bX5DyMHzzg0sgc=
X-Received: by 2002:a19:1003:: with SMTP id f3-v6mr247080lfi.114.1527032745852;
	Tue, 22 May 2018 16:45:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:320a:0:0:0:0:0 with HTTP; Tue, 22 May 2018 16:45:15
	-0700 (PDT)
In-Reply-To: <20180502204907.137185-1-alistair.francis@wdc.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 May 2018 16:45:15 -0700
Message-ID: <CAKmqyKM1cAX-6ZjgEb2r+4_K-PDdUgcq-Zodr7=cfdkQpzvNsg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Tue, 22 May 2018 23:45:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 2, 2018 at 1:49 PM, Alistair Francis
<alistair.francis@wdc.com> wrote:
> If the user has set numa in their MACHINE_FEATURES we should enable
> NUMA support in the kernel config.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Ping!

Alistair

> ---
>  meta/recipes-kernel/linux/files/numa.cfg  | 4 ++++
>  meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>  2 files changed, 7 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/numa.cfg
>
> diff --git a/meta/recipes-kernel/linux/files/numa.cfg b/meta/recipes-kernel/linux/files/numa.cfg
> new file mode 100644
> index 0000000000..bb0f9ab20c
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/numa.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_NUMA=y
> +CONFIG_ACPI_NUMA=y
> +CONFIG_NUMA_BALANCING=y
> +CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 3bb872a32a..e8fb38b8f4 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -28,6 +28,9 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>
>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>
> +SRC_URI += "${@bb.utils.contains('MACHINE_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> +
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
> --
> 2.17.0
>

