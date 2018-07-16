Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id B33837600F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 23:19:25 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id q12-v6so25967059ual.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3+Q+IUlFzFVajy/enCB+HHn7ZOpekHXvAD+skOcBDrk=;
	b=IXOg96AkZ89Ek7QBv3y1QM0k6wd4qcuoeQdFNQOPbAsMU9TKqswc7h/B4r5/IrlW8Y
	EqUkQxP9D2KWn7cDFEtWljKibZiZ3Vgbja8adb7+7e7yTpkI/QqxwFhgPYJJLpEzzfc6
	Yy83s/2IVUxsN7T3mm2oW8jZodvMo0+NpWEt2gwFcgQ5riNLQVypndz9d+2bvk2UNYAe
	HnbcrR9y219Q0Y9BH4gpsHrvnLTih8gCq3+NElozBNWFKIRdMUiLIOCrVogcwFZWxPBj
	PytoUaC2Dl8dXKUTp42YcwKo59F9/qO8Csanz1vNgENxqrCIYMbUVt6SUfyuRez/ElID
	+S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3+Q+IUlFzFVajy/enCB+HHn7ZOpekHXvAD+skOcBDrk=;
	b=k3mWnId5HvqiV3TI3AUD7jjf1Ai+R2bcWxux/Efh45ZDWrC9+NPYSa93VMl3JTffg0
	EBoHlJPe3/v1OmXGui0vqA7bP9E6cwP7af98QljXKRt2Yrt0BV25K/Il1olkaP+ruaFC
	nzC+0RsqngHeHrK+Uj2yW5Nj4vvsV3AK7Kb/r1cMYg0hOHXf15WIg9bfyeXcwooF5zfl
	epG2GIu41DdYbV3vNmMHxBVweHVMMiCCm2ib1lDGVTfoYESaEsaa8I4venp81n/KM9xO
	ZwCs/Az2Cm8zIDdqZqxu0LFbLMIZu4hOc+nuZ1sxVHnltTAqjltoY7HzBXfC6RYPPD9y
	Sh2w==
X-Gm-Message-State: AOUpUlFtKLJrw1bfxVRuy8PXXyTzp2Jk1U0fXT2Q3/D21Cr6mFyeMD65
	rMfIWBR3mlSUYdLX5yF4ayiiwezKc/Kq0MSknmI=
X-Google-Smtp-Source: AAOMgpfouh94EplhCKbL+LFmQU+2OwS3rX5DuOkiVVzX5Idcy5T1xYBGj91cxegWaZp7puLN2MRAHAWTPlybyTyoFs4=
X-Received: by 2002:ab0:899:: with SMTP id
	n25-v6mr12450340uaf.128.1531783166480; 
	Mon, 16 Jul 2018 16:19:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 16 Jul 2018 16:19:26 -0700 (PDT)
In-Reply-To: <20180716225009.3403-1-alistair.francis@wdc.com>
References: <20180716225009.3403-1-alistair.francis@wdc.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 16 Jul 2018 16:19:26 -0700
Message-ID: <CAJ86T=ULkG-857p6d4XMLo+rPxjwQxxK7x20mCkqxRsxSNTAjg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Enable coredump if it is in PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Jul 2018 23:19:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 3:50 PM, Alistair Francis
<alistair.francis@wdc.com> wrote:
> Previously if coredump was enabled in PACKAGECONFIG the user would still
> need to modify the conf file to enable it. Now the config will be
> enabled if coredump is enalbed in the PACKAGECONFIG.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../systemd/systemd/coredump.conf             | 21 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_237.bb      |  5 +++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/coredump.conf
>
> diff --git a/meta/recipes-core/systemd/systemd/coredump.conf b/meta/recipes-core/systemd/systemd/coredump.conf
> new file mode 100644
> index 0000000000..4cbc19cdc5
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/coredump.conf
> @@ -0,0 +1,21 @@
> +#  This file is part of systemd.

If this file is part of systemd, why does it need to be added to
oe-core? Isn't there a copy somewhere in the systemd source directory
which could be used?

> +#  systemd is free software; you can redistribute it and/or modify it
> +#  under the terms of the GNU Lesser General Public License as published by
> +#  the Free Software Foundation; either version 2.1 of the License, or
> +#  (at your option) any later version.
> +#
> +# Entries in this file show the compile time defaults.
> +# You can change settings by editing this file.
> +# Defaults can be restored by simply deleting this file.
> +#
> +# See coredump.conf(5) for details.
> +
> +[Coredump]
> +Storage=external
> +Compress=yes
> +ProcessSizeMax=2G
> +ExternalSizeMax=2G
> +#JournalSizeMax=767M
> +#MaxUse=
> +#KeepFree=
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index 3efca33e73..db2848fd65 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -276,6 +276,11 @@ do_install() {
>                         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>                 fi
>         fi
> +
> +  # If coredump was enalbed, enable it in the config

Typo.

> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
> +    install -Dm 0755 ${FILE_DIRNAME}/${BPN}/coredump.conf ${D}${sysconfdir}/systemd/

Installing from the meta layer directly to ${D} is not the typical
approach and may cause unexpected problems (e.g. the recipe won't get
rebuilt if the file is changed, etc).

> +  fi
>  }
>
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

