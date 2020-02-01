Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3030F6021D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 04:49:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d16so10994610wre.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 20:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xi4y/38W8fHqYpUwfgqHnoTz5BnGQ3gsCW4aj3guKcA=;
	b=gx3olEG3eP7XpNJ+MsUufJDbKyw48mhla12QJDu3JwQXu48LIk/8u5GWCqM/PKset2
	gO1Op4GYFmvYzc8I7C0yoFXew3WrzfQphAiQOjDhYZUJVlOB/mRjNwnXhRBJQMkbemuc
	u6Frpgb6FsLx3cY0VFD6MdsUYueyk0mEzZcIiFTn0KvL16Nij/EWLBt1e90RtRxndjaR
	jHNSJ0NsVbM34YBpho+gw0shKcZQrQbuMZKhxK0FHbq7SQvJol4WLNgFdfjbHn4WyB+f
	Ve+IBvaFZZ2irRKOfuFtNOfi+G5I7LEBo3mCReE/EEA0YyIC4txFNK1GT8enE4d8xYLO
	h7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xi4y/38W8fHqYpUwfgqHnoTz5BnGQ3gsCW4aj3guKcA=;
	b=ujnqAicUlCl0hcq9ijq40R1bA2ulLUeRZQGAA7mwjIXLaOIO2PofWP3FYCvjyxlhY2
	URbVjtq9DSP6U0bviA3S0+z/cEnYfez2FtO16dgVi8U4sJ7lpFcCyxNjXa5UCETR7AGz
	bHsRiu9M4P/hQFjAturx7/sHymHaKKhWxZpmrDg8ryHfQtFHT1PNLVcrhEFpZyiaEyBq
	aRswIGGBNkgYtBsGPXuFQrpxEg1Vi1qAj08MRT+V5v6BqNlNAcUtPx0+QkOUGe44OchU
	t8F3skseEwj1f7M7A2HF9ARprT/Ez1rhZHLxMC6Fhb1vr70BU8dnenJ+ph8AuZYSfGZN
	VsRQ==
X-Gm-Message-State: APjAAAW9Oj04F1EsONs/FM0t/nzum2uIWsBgwQY9FZeHKSkGuAPXDR1H
	C7xgGPsT6LcoFhhuePX/WQWb0GHPHerYDoKMCzgZPEkQ
X-Google-Smtp-Source: APXvYqwHaZqGDexSHiQo7Pt7aarDe5DIDBEXfktLm+SIXkCzEAqRMbH9OT4y00LH8LPkqMhToNN0oEAeDuvcJEFghB4=
X-Received: by 2002:adf:ed04:: with SMTP id a4mr2258923wro.76.1580532554715;
	Fri, 31 Jan 2020 20:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20200131220751.106516-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200131220751.106516-1-mark.hatle@kernel.crashing.org>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Sat, 1 Feb 2020 14:49:03 +1000
Message-ID: <CA+aJhH0a5VSwdhGqg=5Ez+=TzDm0=Esu1kebDERWZTjkRp=7Ew@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] microblaze tune: Correct two minor issues with the microblaze tune
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
X-List-Received-Date: Sat, 01 Feb 2020 04:49:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Feb 2020 at 08:13, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
> From: Mark Hatle <mark.hatle@xilinx.com>
>
> TUNE_ARCH - microblazeeb is not a valid architecture, microblaze is big
>             endian, microblazeel is the little endian version.
>
> Version arguments:
>   If a version feature is not defined, then we don't want to set either
>   TUNE_CCARGS or MBPKGARCH_VERSION.
>
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/conf/machine/include/microblaze/arch-microblaze.inc      | 2 +-
>  .../include/microblaze/feature-microblaze-versions.inc        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> index eab7171cb2..265898b6b6 100644
> --- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
> +++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> @@ -46,7 +46,7 @@ require conf/machine/include/microblaze/feature-microblaze-versions.inc
>  require conf/machine/include/microblaze/feature-microblaze-math.inc
>
>  # Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess

Worth updating the comment at the same time.

> -TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
> +TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"

This change will break some things in oe-core (and probably
meta-xilinx too). They should be updated at the same time.

Might also be worth removing the microblazeeb references in siteinfo,
and elf.py. Since they were added to support this.

Regards,
Nathan

>
>  # Package Architecture formatting
>  TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
> diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> index 3221e2aab7..003fde3e07 100644
> --- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> +++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> @@ -64,6 +64,6 @@ TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3
>  TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
>
>  # Version flags
> -TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
> -MBPKGARCH_VERSION = "-${@microblaze_current_version(d)}"
> +TUNE_CCARGS += "${@'-mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
> +MBPKGARCH_VERSION = "${@'-${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

