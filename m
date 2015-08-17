Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 811E1759CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:43:22 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so54204487pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NOAmrCol+9IzqEfm/rO9Gv3AJBQSspfxCT5K0CIZJDk=;
	b=QxXbMI1xUf0Kj0d1liGqkcFlO7x3mShrfafJX89Knv/OQyq/cjVg3hd0+bXc1kz80S
	3YYNmRh6KXcX/AzBWFlu9joVYHjEoxBbnZeLq253wqj1ENYmvtWfOOt+w9I0aWWHUu8d
	Kn57Th8F5GZuTCeVT5/peoaltwK3KQBCPwrW4r1WWljnofwriJEL1py9eE+JJsDamCz3
	LfgLCJUqeaIQu1rA+ifnqxfnTjPQU4cQdTLcYifmG7bUgtERf3/93K208gvaIAqh+MgW
	N6KYAq7TQGqdwfXD9s5tn0Ci22vpkxSlQiGPwkxXYfH8Lnyea4IfMoV6QjqS0VHzcU9E
	WtQQ==
MIME-Version: 1.0
X-Received: by 10.69.27.68 with SMTP id je4mr49247854pbd.163.1439779402788;
	Sun, 16 Aug 2015 19:43:22 -0700 (PDT)
Received: by 10.66.48.97 with HTTP; Sun, 16 Aug 2015 19:43:22 -0700 (PDT)
In-Reply-To: <1439688121-32636-1-git-send-email-raj.khem@gmail.com>
References: <1439688121-32636-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 17 Aug 2015 12:43:22 +1000
Message-ID: <CANwerB16-bm0+S2tQ2sa7MXzNjW8Qr7c4960PXcENA7zZWMc6w@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Mon, 17 Aug 2015 02:43:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 16 August 2015 at 11:21, Khem Raj <raj.khem@gmail.com> wrote:
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_224.bb
> similarity index 94%
> rename from meta/recipes-core/systemd/systemd_219.bb
> rename to meta/recipes-core/systemd/systemd_224.bb
> index 83e4bce..16eb497 100644
> @@ -23,14 +22,13 @@ DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl rea
>
>  SECTION = "base/shell"
>
> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
> +inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
>
> -SRCREV = "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
> +SRCREV = "b2a0ac5e5b29c73ca7c0da23369a4769d5a91ddd"
>
> -PV = "219-stable+git${SRCPV}"
> +PV = "224+git${SRCPV}"
>
> -SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stable;protocol=git \
> -           file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
> +SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
>             file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
>             file://0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch \

The git repository URL has already been changed to github.com in
master. Please rebase.

Regards,
Jonathan

