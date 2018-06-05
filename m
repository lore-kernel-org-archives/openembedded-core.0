Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A99FD784E5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 17:01:14 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id r24-v6so4198034ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h4pPf4oKuhgIDKv7KHCfOvAlF3euJWTz3fE4rwxGUSI=;
	b=oKgeplyk7e4cT62x6mUxsfB0A1gxhGDPzY5FrrrsmnfjW6HHbcbfHMb8coN4mVXcZR
	jPD9UIqaspsK78CiaT1dLC1Z9BBbcYgicexwCnYSf4UW0d1O3tGz1yh3AxZ0oPt+g7VR
	jB9kE7/hr5BfuLR5yUonc7YdCae3Xx1Y2kMZjBxRUJ5q7CHaoHeWyIJf+zIi9bZuMk5R
	BTy2C4k/7ufUN65/SMTikjj9FO4tsmmKr8R4vu2rgh87mX56vYARaydAnsU1wqOMxbFG
	EXt0n3sWtUSWyWG6EHm16i9K/lVhTqpo+0nR6PGqAktExQzidMkzmxOzyToPUiANIWIh
	O7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h4pPf4oKuhgIDKv7KHCfOvAlF3euJWTz3fE4rwxGUSI=;
	b=TfZEbqWUVyKZHwdmABsZV8jUHxXcPQWlwmtX9eTlkDAACilQ6sS1v1mXGX7peqTQ3p
	yNL43hlVR/cnoMhRDpV+I5SI8fHgRvVigqf/7v7C8wOItvx9baoE9yrN+uux19Eo8kay
	mmxqz5OxZQGaLM50+NG97QobpUqH1vgLsvw+4nz5o47lwnaaifORRzEtvIxmFfGLGO7d
	tNcywnLlBYmlK8343QjriVwVzJ2YNyX+SVZoyabQDq8v2yMXaPTVy/5rLzRI7CT60qRE
	2kw+Zq/YRucTFKMdfvzwhNEdBDrnSKCjFuDEiOwYXsqSmvsWQlrkamNON16yIoNHEFn+
	sUaA==
X-Gm-Message-State: APt69E13Yn/4GfarKFP6fU+ztxW4AuUrfUQYM6pRZUoTVH+WDAxHoNkW
	JzkDZO7lyDTYl53ZprN7SVtqxeMaOPFkztdpsZq6u4P8
X-Google-Smtp-Source: ADUXVKKzEYprXVYjnYCsImh8FNks1wbeDfywSQrEgATeh9ij0QLpoVaxqjdqQggnt9felsYIRqGjBuUC3gJnbWrxQ9I=
X-Received: by 2002:a6b:e603:: with SMTP id
	g3-v6mr10007903ioh.216.1528218075616; 
	Tue, 05 Jun 2018 10:01:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 10:00:55 -0700 (PDT)
In-Reply-To: <20180605160643.23035-1-dev@sashko.rv.ua>
References: <20180605160643.23035-1-dev@sashko.rv.ua>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jun 2018 18:00:55 +0100
Message-ID: <CAJTo0LaneaCdQcEW6tFEFm8xXg2+wfrQ098FE542sNZc9DcDHw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] iso-codes: update to 3.79 and fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 17:01:14 -0000
Content-Type: text/plain; charset="UTF-8"

No need to change to git, salsa has a tarball at
https://salsa.debian.org/iso-codes-team/iso-codes/tags.

Ross

On 5 June 2018 at 17:06, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> Updated package to version 3.79.
>
> The original FTP server, alioth.debian.org has been permanently taken
> down by the Debian Project and replaced with salsa.debian.org.
>
> Source: https://wiki.debian.org/Alioth
>
> Also added HOMEPAGE, and BUGTRACKER.
>
> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> ---
>  .../iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} (56%)
>
> diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
> similarity index 56%
> rename from meta/recipes-support/iso-codes/iso-codes_3.77.bb
> rename to meta/recipes-support/iso-codes/iso-codes_3.79.bb
> index bd613ac573..72cb542f18 100644
> --- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
> +++ b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
> @@ -1,15 +1,19 @@
>  SUMMARY = "ISO language, territory, currency, script codes and their translations"
> +HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
> +BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
> +
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
> -SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
> -SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
> +SRC_URI = "git://git@salsa.debian.org/iso-codes-team/iso-codes.git;protocol=git"
> +SRCREV = "c1d5dd96b33cb815ebc21d2708bc045b1545249d"
>
>  # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
>  # are inhibited by allarch
>  DEPENDS = "gettext-native"
>
> +S = "${WORKDIR}/git"
> +
>  inherit allarch autotools
>
>  FILES_${PN} += "${datadir}/xml/"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

