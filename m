Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 542697E904
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 12:36:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z23so3071321wma.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JxrCouSFR02f6qGz7oTqEoHzyp98u1vISZFtEYatsWs=;
	b=Crvms1GCsJim28lf92bysIpw5TaaeZockwvu04dUNyY8o3JG5RZr8M37gEDqJVWI/F
	bZTJQifXf/bpGnOQriazuivxGyLpHaTbZDidYLzxKkRNwv2nQWmTV17M/lF7zBSwaQFd
	fcFtzK1gk2lvXomgxdX5pDxqZiwR+MbjJTxub7HOIvA77xXofLNgkfDZqJY1uIpL8W9x
	q2dlJDozUqiyhrcAYMyU/3TTvthRGnRyF5YJKWV4uuvY9U9MfniK5dgqctm5RNbZkSpb
	dEsy+S3k5ZtXTFT4xqyilG8N8hUHVaw61jktqAHmwFaG3rWB/a8T1xDJ3AR6GcPOF6ph
	QVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JxrCouSFR02f6qGz7oTqEoHzyp98u1vISZFtEYatsWs=;
	b=YgYxrfH4WbW9MYclWV72ms/p3GsE1mPq1GgC29tIw74JYJLkAitmydn+JfsrT0OhlY
	MHAFKaDasfIdzB9te8sSlLXNdnKqMM967lfCf2Md2ph4jGrf3p/unNnzmkzAu8SLCQyS
	v9DRLKD70rCnv+IgnlY/xOMHW5mLztq7ZqNiCNQZZYZw7ICwua+H0JljUqCzeFWV805A
	osaRSwJ0/D1po3ObqX1s8jWXuWi94kzVDDgBpB+DY6X+Etmpb167Xew4Yk8AN3Y9wIku
	9/ZEXmZ83GAIYN/THX7wpN+sF00I98pIPhAW6eUgwDwRMVSUwUGavgcnOxgAmti8UcLi
	NmSg==
X-Gm-Message-State: APjAAAUYZlQ4kH11tSceJ+E+KbvrYiEGOHYNnnW7AvWjGQBqmjNtPDCk
	/bp5FMV1CowNoP+Cdtp9LOcLsBrq8kJfevvQ6Ontk1NI
X-Google-Smtp-Source: APXvYqy4ghK7Gkf3lkmk//R7NkO9kHBcy0b3tOgtmlKqQn9q6VElAE4LtBi1yvrZt9X5E5HPqjiLe/vzy+K6TOMdIpo=
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr3229846wmj.99.1560861386613; 
	Tue, 18 Jun 2019 05:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <1560844186-105711-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1560844186-105711-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Jun 2019 08:36:14 -0400
Message-ID: <CADkTA4MONSg2dmH7B--9oC0ZApTZBq=RYc0XgVjMwPEvPRAONA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: qemuarmv5: Update machine overrides of KERNEL_DEVICETREE
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
X-List-Received-Date: Tue, 18 Jun 2019 12:36:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 3:50 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> The original BSP qemuarm has been renamed to qemuarmv5. Update the machine
> overrides accordingly to avoid not generating dtb.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

I had meant to do this myself, but kept forgetting :D

I can take this into my tree and send it with my next series.

Bruce

>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb       | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 1 -
>  7 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 3a055c1..8c83620 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -41,7 +41,7 @@ DEPENDS += "openssl-native util-linux-native"
>
>  COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
>
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> index 0836dc7..a4facfe 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> @@ -33,7 +33,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
>
>  COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
>
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> index b5e415f..8bd9d74 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> @@ -33,7 +33,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
>
>  COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
>
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> index 4ca11d7..e668854 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> @@ -29,4 +29,4 @@ COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
>  # Functionality flags
>  KERNEL_FEATURES = ""
>
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> index a9c463c..226a90c 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> @@ -29,4 +29,4 @@ COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
>  # Functionality flags
>  KERNEL_FEATURES = ""
>
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> index cda4ecf..014d689 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> @@ -36,7 +36,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
>  COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index 8aec315..bb7ed56 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -38,7 +38,6 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>  KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
>  COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

