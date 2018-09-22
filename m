Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id C1D9B6003C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:24:29 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i10-v6so4917746qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=stPdmY/Y23Fn6UrIAfDi/7MLfYYg2ixa7mG5W2T7BEM=;
	b=cfyGoIeuooPiwMV6d77qJLCzb7pnK3+KxKefOzlTRWs0qweI+v56Q7opn89Qwf/vkh
	rKbC7KwQ27Y6TbFsNUI8ILeOqXKx2PlWIp2M5Bbf1reQQqt99TnZNhCa7MPVr0UWCf3K
	JWgsggeaiIeZS/rM8tCC9aNIt4rpzu4NOXY0Irr8ca2uRdgdiAVS6LIUTRT1vGf+aD4p
	DPSeewhmekzRda2HNXwmpvV+durNC12X7kPenIeG0LeRUMKsUYi29pIw9kd0WU3bAF7q
	mN4hbS8eksmodLQr/SOEBgdGry9Ukwy7m3Yw7yPU8J9BwqyHMvuw+gimFD743Z8ZQeFU
	1NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=stPdmY/Y23Fn6UrIAfDi/7MLfYYg2ixa7mG5W2T7BEM=;
	b=B/uOj+Uyi+5AEWi7ZvuYipJdxYJviMVKY/1xzt1X9rPP7hSPxEGP6WqDCPwoF8Q/Le
	2bgv9GkpzvWcoD3r4raitu3NlYO3uTo2U09Ea3jmZuXTXGdklcXW3FM/35Nh5e/DiB4H
	S6Dv9rclFcfQNjsDq1gJiwo3dWZTBC6Gymks+GW9LXV4PXCPeyhagWS6lqWC+Jl3/BIB
	VO1hFBMB2BQG7u1KeACXZL37OALrfCqYCl5F5+f9OQyV7919u5sYbjxIG2PKvqdMZE7z
	MI/kQn3/bIycVQillp9JXyBXSp7qIFIwOB9/sVLivhfZmZu9huShuDjdn6B36sDAGw7n
	I0vA==
X-Gm-Message-State: APzg51DXoMNZu75aJ/3AzR/85n/LIUP9bEnkdzpXBSWPKLulFCS4bcMD
	9KoZZlfz0D/tG9TYxyk+0eSggN/qREhMKtJgcYU=
X-Google-Smtp-Source: ANB0VdbOmCZNuBxHibFD0oI900+yZ50vkWEyj/Xj3RBkLgSu5M8ImebkBOGWscPdwrs0KgnAn/2o3IwBJF84cj3RVxM=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr2051112qte.218.1537637070373; 
	Sat, 22 Sep 2018 10:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Sep 2018 10:24:04 -0700
Message-ID: <CAMKF1sqenR+Y7nhdwvVjnrvp39CGZE_0nPN2O4fghzaSfFKiLg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 22 Sep 2018 17:24:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 22, 2018 at 10:19 AM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> Hi all,
>
> Here is the consolidated pull request for the active linux-yocto
> kernels.
>
> It is -stable updates, configuration audit warning fixes as well
> as a fix for the qemuarm64 boot hang with the ssl update.
>
> Nothing to major here, and I've boot tested on all architectures,
> but you never know what the autobuilder may dig out.
>

not tested but patches look ok to me

> Cheers,
>
> Bruce
>
> The following changes since commit 18b90a0fd9bdc00d82140fbd55761e9cea308fb1:
>
>   yocto-uninative: Add aarch64 uninative tarball checksum (2018-09-20 09:06:00 -0700)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (7):
>   linux-yocto: configuration warning fixes
>   linux-yocto/4.18: update to v4.18.7
>   linux-yocto: tweak RTC configuration
>   linux-yocto/4.14: fix kernel configuration audit warnings
>   linux-yocto/4.18: update to v4.18.9
>   linux-yocto/4.14: update to v4.14.71
>   linux-yocto: enable pci and CRYPTO_DEV_VIRTIO
>
> Hongzhi.Song (1):
>   linux-yocto-rt: Add paravirt_kvm support for qemux86-64
>
>  meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  8 ++++----
>  meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  8 ++++----
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
>  6 files changed, 34 insertions(+), 34 deletions(-)
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

