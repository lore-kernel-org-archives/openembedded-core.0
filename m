Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 26E6878087
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 16:33:03 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id p78so17816557iod.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 08:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=J7II8qxW7/sAUA6SoXwjGBSvd5vXZZ7oDm+KbDOQ5xM=;
	b=S3oJXxVj83VVU7L0tQo/qsWP34J7V6sHc8uFVjrQ+g3SH8OsFKXb0LGa++ZukA1GPB
	5wYfBadP8k/RMT0pi4vTmQxyAtFnTNdVnFyioeaJp1AosSOBoadYS3jN5P5z9pyRX4iW
	hvduYUxnev4fLPJQ7yj1yfxmzI3+Y8VbyQBJU7+r8qLYo8pjTRsydyEhRx95WFNwuGWX
	Qsiqru9rAmVnq1vOy/YAUBbKHE4OhLJLlpY/81UzA7btFlTF1UPeHO5LV6cfFbrzCpY8
	7MHHjnm4FqT7h4QuyO7aVr8s00Z3nV9AaRly3X8pTwhLNyL3akuBdniVhnUj4DITYY8D
	bIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J7II8qxW7/sAUA6SoXwjGBSvd5vXZZ7oDm+KbDOQ5xM=;
	b=bxX/NnLT4oVY/1T/hvFq2DN/4oBtCSWh0d7qnpXAtGt2VRpzaYDZsq2mhtE6U/0h2x
	Ru64I1/Ksk5QsLCY1XBym2nqmvssDn0xl6Qr3prvdkDBQjj70UwcYaisEbym4bpGATHy
	rerITKh+oR71WJ7lVEETPbk8VXAK3bQ16XDignCQsSNZBIbOQMMt3CIY+P9kfWtLnOrR
	BC5qGa+27h8wI/Kkx7RaMTl8kqx+NgrP+Ejd7APUZjv+Qiq7RPeY3qgXnk6u4SDfBpce
	vlXGuveCW20kiGaNqaCQDz74FxF1Tyx0GAJKwSvOmjQC6PAktu6XEfWiEO9lX9NEsg5g
	DN3g==
X-Gm-Message-State: APf1xPC6AEhExqm0mIH4/uzEqVv5LrHPi9IY6zKMeppF5G+cofqh1kMi
	xSrT32SSuEz2YjymooTko5I=
X-Google-Smtp-Source: AG47ELsoDbWwmjsSeF1COTAlOyS2UqwTGOKF2xlki8PyNxFOC9cAiEe122lJBHetaFwX19IsA7NLcQ==
X-Received: by 10.107.151.209 with SMTP id z200mr6488205iod.150.1519662785361; 
	Mon, 26 Feb 2018 08:33:05 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r65sm5796503ioe.26.2018.02.26.08.33.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Feb 2018 08:33:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1519662784.2806.67.camel@gmail.com>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org, alexander.kanavin@intel.com
Date: Mon, 26 Feb 2018 10:33:04 -0600
In-Reply-To: <20180222105116.4102-1-ross.burton@intel.com>
References: <20180222105116.4102-1-ross.burton@intel.com>
X-Mailer: Evolution 3.26.5 (3.26.5-1.fc27) 
Mime-Version: 1.0
Subject: Re: [PATCH] maintainers: update for change to icecc-create-env recipe name
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
X-List-Received-Date: Mon, 26 Feb 2018 16:33:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-02-22 at 10:51 +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 59906f8b6de..965fd34ca04 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -266,7 +266,7 @@ RECIPE_MAINTAINER_pn-help2man-native = "Hongxu
> Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Maxin B. John <maxin.john
> @intel.com>"
>  RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alexander.kan
> avin@intel.com>"
>  RECIPE_MAINTAINER_pn-i2c-tools = "Maxin B. John <maxin.john@intel.co
> m>"
> -RECIPE_MAINTAINER_pn-icecc-create-env-native = "Alexander Kanavin <a
> lexander.kanavin@intel.com>"
> +RECIPE_MAINTAINER_pn-icecc-create-env = "Alexander Kanavin
> <alexander.kanavin@intel.com>"

Since I basically re-wrote this in its entirety, I would be willing to
take over ownership if Alexander doesn't want to any more.

>  RECIPE_MAINTAINER_pn-icon-naming-utils = "Alexander Kanavin
> <alexander.kanavin@intel.com>"
>  RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alexander.kanavin@int
> el.com>"
>  RECIPE_MAINTAINER_pn-ifupdown = "Maxin B. John <maxin.john@intel.com
> >"
> -- 
> 2.11.0
> 

