Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A94878B08
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 22:07:07 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id i19-v6so25696993otk.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 15:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MxlmbNEM1qT9tTQA7ArOMKRD2bsvEFGiGXxZksmfeoM=;
	b=kmVzvfaySSVCDbRf04TIcyMBKkVyjNAVUmK+nujO/3Tm3/TLcZPPZ8IHRX5J1hqfg6
	i66VkgM0Wp3841k8dY+GSZxrqmfe3DZ5w+yfrLFhm/v+r5cU8QOwfP4cl4wFXNYEWnnE
	hqTyLONv+QR88ui8lM1HygjQ5SroUR7j4QnLa3ZdT3YRXZWETcjRryMk/GY7A8HcvC2P
	+Mdp4DiZCCQ9iAMeXViLuHNR3yTkIqVXHkbP80y+pOgUPfZOj41eKjpCJZmCPcREteFJ
	PRkAcpGoURBirrbezsPRZiQwtz3fBhvR6QRf1ln2cSuW2IsTXN3lvyxpeWAe5JZmK9cE
	o0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MxlmbNEM1qT9tTQA7ArOMKRD2bsvEFGiGXxZksmfeoM=;
	b=DPcwbqBFQGk1UHM99HpOy4hDXOLxdR/64Eb3JD0fzOupYDtl5Id+sNZ6KmZZnMbT8w
	8kvXy9av0EuquUTjCZHJRbNDYctRn9plu/ZC6lE0Uk/hLFybQKVkX/52ESQoKj/L9D5k
	xDsvKapI/AKcL6f4U6uMUBrk0FSCCPZOxQfh/MJCrecMvAf3qKvHXIgGK1G8y+p6UA0b
	RKd0lOmqxJteCGxTjD6l4CqOC/rWsY8N1GdKIYYUTl0+ux1F48b3Q3etqqlMZzchdF/J
	LGiRPnAbn3DuhE2pswzmeORw5ghV9UTZnAq/SNYuY+cyIA6qQmvP/EYlmjMIeUCepuva
	qgTw==
X-Gm-Message-State: APt69E2j0ANovN6nHE8kzGH9kzj+IemaL1kGxTxAYahpzXiTV1c9hkmK
	TxjJTJ6/aWvpRoRTmvjP5QXVWwRzS2X4JUsmi0Y/KQ==
X-Google-Smtp-Source: ADUXVKKsMwGoQafKTwSlULvR4p/BGhazmnRUKRBgsqtXptQudOCJisaf/hJxhJ2axI/Qgmp8fhiBWErm7XnmLU2DDFM=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr638842otz.135.1528754828123; 
	Mon, 11 Jun 2018 15:07:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 15:06:47
	-0700 (PDT)
In-Reply-To: <1528754600-26824-1-git-send-email-akuster808@gmail.com>
References: <1528754600-26824-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 23:06:47 +0100
Message-ID: <CAJTo0LYtc4Cdo1zUzc-UK-BOO-J0dA5iQLGEn6vn2zfGhnbRxg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: remove myself as maintainer.
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
X-List-Received-Date: Mon, 11 Jun 2018 22:07:07 -0000
Content-Type: text/plain; charset="UTF-8"

Do we have anyone willing to take over?

Ross

On 11 June 2018 at 23:03, Armin Kuster <akuster808@gmail.com> wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 628edac..08d7e1b 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -85,7 +85,6 @@ RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> -RECIPE_MAINTAINER_pn-busybox = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

