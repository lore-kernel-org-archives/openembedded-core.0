Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id A08D871AF8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 16:13:14 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id q126so154797105vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fQMwT948lrjbjpDRb4RcSTAyqk9Z9rYYo3KUghzV7IA=;
	b=iAKn4udDV/4qqAy0qD5Nz193L+s0sZbik0YJXu+YiZHrDYaCwiaGWP2nAmc9LeZ3dY
	RvU8+CA/v0uvHizLKp27ARnOxHced64vfBkINEU/go2RkcUNrxq6L+f+hI4nxkND+cU1
	ZJuu/kNQJlIx/tA/B5bXy8hM5SIkh+PNwvCDuoPhu8EDT7SN09TOhoEYmmndnDDkTAaR
	Me+N/Jut9gmrkZpDBPFqv1W5bMwaetEHtp6/VXX2Cnc2GKKt54tk94klHBqMqe8LjT6A
	0uuS71xfa/1Cn7WSy8tlyYt8azTbSQjgovqRZjuXMGSsVsQpuicExSWEoAFC9uIL3eJ6
	ViGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fQMwT948lrjbjpDRb4RcSTAyqk9Z9rYYo3KUghzV7IA=;
	b=ay+NG3sFk8iStJTdRKcvP5xTAySF053O3cCwgGuWBUFO14R8763+CRO6UXgupJQ5aX
	mF8Y1Vb2NAtLILSFrEUO+vooraJFOb+kCyMNL3h3ef80p3c1TbEA1DcViISLwuTwTBxr
	wofziaXlt9Zn8n/+b09MI1A6rHXbo0izCldqYWJ8LVcgKtd3aLdp4bwjvn6rDe/RVE74
	7y7ekecoGZStKDbdRwwtGobVKddGMnWk4AUSaMQcaqnoBnfUhu7Zin9ZSrWr7dLJUTm6
	jfcPchsH4xelcQ3rU29jgbb78TvFWve7W5d/z5KVBy4Vh0Va3e0RwuwGuwi540yGHXDl
	x6Iw==
X-Gm-Message-State: ABUngvdvU9Xi6ayekrxOGXw2sQupqvu0r/BAyqMLC1ERyGZU4Cw43P1Ly8dgUjbTVs2RgAOiMu6sNX9b3pS4dA==
X-Received: by 10.31.0.67 with SMTP id 64mr6303815vka.173.1477239195436; Sun,
	23 Oct 2016 09:13:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Sun, 23 Oct 2016 09:12:45 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610230847370.32524@localhost.localdomain>
References: <alpine.LFD.2.20.1610230847370.32524@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Oct 2016 09:12:45 -0700
Message-ID: <CAMKF1soxRpd+YKEBq251+a1eosvSGF-7+G+b6vYLaNGDj-q=0w@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "run-postinsts" added twice to PACKAGE_INSTALL
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
X-List-Received-Date: Sun, 23 Oct 2016 16:13:14 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 23, 2016 at 5:51 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   minor observation ... messing with toolchains, and i noticed (via
> "bb"):
>
> $ bb show -r core-image-minimal PACKAGE_INSTALL
> Parsing recipes..done.
> # PACKAGE_INSTALL=${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}
> ${FEATURE_INSTALL}
> export PACKAGE_INSTALL="packagegroup-core-boot run-postinsts
> run-postinsts "
>
>   wait a minute ... why is "run-postinsts" listed twice? (no harm, of
> course, just superfluous.)
>
>   so ...
>
> $ bb show -r core-image-minimal IMAGE_INSTALL
> Parsing recipes..done.
> # IMAGE_INSTALL=packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}
> ${CORE_IMAGE_EXTRA_INSTALL}
> IMAGE_INSTALL="packagegroup-core-boot run-postinsts "
>
>
> $ bb show -r core-image-minimal ROOTFS_BOOTSTRAP_INSTALL
> Parsing recipes..done.
> # ROOTFS_BOOTSTRAP_INSTALL=${@bb.utils.contains("IMAGE_FEATURES",
> "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}
> ROOTFS_BOOTSTRAP_INSTALL="run-postinsts"
>
>   so it's being added both as part of IMAGE_INSTALL and as part of
> ROOTFS_BOOTSTRAP_INSTALL. someone else is free to decide whether
> that's worth caring about.

ROOTFS_BOOTSTRAP_INSTALL is conditional upon package-management feature
so if you want to enforce post installs irrespective then you have to
demand it explicitly.

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

