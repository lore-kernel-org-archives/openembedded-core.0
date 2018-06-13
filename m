Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 54648788E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 22:31:00 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id d5-v6so3879990oib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 15:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n1IaTBdmW5VV83hGNq539M37U9YdFKq4GV9SA+BPQWE=;
	b=KbdBYXBhsUrRYc8+1GSH8W566oCfT6WlKVHKkrPDmqsMdBs3bUREDMaMBsHAXOzhiy
	3ZiE+hLEUUwJQw1Bcm7PNEpf9/9yTYyrsBLmtQ+i7HwujGhA+2PoYJbtZODDP6ggISBe
	7Z4MZm3fB5SaDEv4assVtnLyiBhEi/sJjpLzIQLD2wyQClz018hTz+2hrjLr3THYMhaQ
	ecPMnucfNu+ax3ul1wwLvmJ8nApr533EQrxizhHjReYZtaKwfMUpjHoELuWx85SZzg8d
	k2B+NERbIiVcgIBXB+KFruQVMCvm1qgy+s8O2E/5+oE0DqRvKa03qetgMaE7NCjzVyQr
	vc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n1IaTBdmW5VV83hGNq539M37U9YdFKq4GV9SA+BPQWE=;
	b=ESVeW8lVPox3oxViyolC/R/YiFLjnHrKFdwRuTvmOON+66nPsC3G9AJWHKpeteOehe
	0saRT307NsfdvCRMQGb7Vwl4ORkX+pDvhIU3KcDmRPUPkS4eZheW8cOEnGJ1HjwjrvbV
	5YS/lD9jM/fmZl2OFHFGOdjdFHnBnHJq/R4NDmqCKU90Z5dO8l4phFgjgIVpCBAxo9x/
	7AEsIXzIVIk7QqwoFM17Sl3zDpZt6Vjq3nk1UeRCL+Nep+Lu5K5d0sQC5safNoH2WGmp
	9SCfNYkzpUfjrQvWZ95U23k7G3zY5ycmGO3t1pOP2ABLoC9hmOzMDeLnqBt3xS+i0cAJ
	E7LA==
X-Gm-Message-State: APt69E3nXDYsUm03C3TCrrkixjdxHrfa793+1Ha8CoTAifdHplLHp68D
	FshK8IJI27I4U5One8XTxjJ8RPvmyEjBMknnPvB9rg==
X-Google-Smtp-Source: ADUXVKK/gp/NtZc1eeD8UQ8tmOrwcmxlCAL6OKbTEeipisUwC3hSVUKlWuC31hGykqqHE4zV30HmB8SvYjX7roRfuGk=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr16394oix.235.1528929061405; 
	Wed, 13 Jun 2018 15:31:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 15:30:40
	-0700 (PDT)
In-Reply-To: <20180613222505.17242-1-dev@sashko.rv.ua>
References: <20180613222505.17242-1-dev@sashko.rv.ua>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2018 23:30:40 +0100
Message-ID: <CAJTo0LaD3UsNR+Y4QN+O0PkToFLEZ+C=zpK_BaNdq3wQgkwo4w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH] poky: add ubuntu-18.04 to SANITY_TESTED_DISTROS
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
X-List-Received-Date: Wed, 13 Jun 2018 22:31:00 -0000
Content-Type: text/plain; charset="UTF-8"

Generally we'll only do this when the autobuilders actually have a
18.04 builder, which we don't have yet.

Ross

On 13 June 2018 at 23:25,  <open.source@oleksandr-kravchuk.com> wrote:
> From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  meta-poky/conf/distro/poky.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
> index 9bd9ee58c4..19459b1791 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -71,6 +71,7 @@ SANITY_TESTED_DISTROS ?= " \
>              ubuntu-16.04 \n \
>              ubuntu-16.10 \n \
>              ubuntu-17.04 \n \
> +            ubuntu-18.04 \n \
>              fedora-24 \n \
>              fedora-25 \n \
>              fedora-26 \n \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

