Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE1D6D56C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 12:40:39 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id s19so57843217lfb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=i2stlieUVbycfUCKH3G63Zq3DN3p2dszGTJKjShqljs=;
	b=Zn4tgMMCs8jxa6rKLEd88iEyLzrTnmvEuzGOAE9AGHw5td5oVdwv/di362FSSRnIOW
	FdWp/PfBWaTf11y4OA/0241gQhqdtgz6zBw9CumspLsUAIapgqde3uRaxgGAwuczff2L
	VI94t8ECxXKWj29iJcVeKm34DFhBzC9aVTvuQ0HXS99fzmj6VVwGLAJYrqP90nyRyDOL
	J33UIderRQ2amjBM8IVIsoN9p4JmFJ/9HRVLKUm2z31zNbzOeM9ukkn8YGINSfNVw2bb
	WoI5BnUR+FUA9KzcFw/RmfLRA6SD0N1xJTAk+aEQyOUYdO4Bxw8OrCqnZjhRndZgxSv9
	bIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=i2stlieUVbycfUCKH3G63Zq3DN3p2dszGTJKjShqljs=;
	b=P0SNS9Q6PpbEzGmvoxWA+6z/wLVOCPv4EIG/Rdb/GPdPhv4LyMSQPldrOED+QCc+Sv
	FUr8KQHwsypYzWh4GsGdjWhGc4Z9ZykC1EtMqe0RK6q8EgEqjfofiqay2GcGa3cvBslq
	gs+VMLEN5C0JbikEiLrxFVYJXUZ6kP7MNesy0Wdl6E9kRRRqi5kzX6FeLMsFyLnkUVdA
	TK053Bz7vtyPtALZiy4i/S5/phbYGiIgQdU+PiK0Vpc/LkafMex6R8+7QR+fLtcQOAeb
	rKpJVqrDoewIez633VIGBBZlTyqDpdiMfb/KEfmwMrRpVJIpoguyDQSlWPxVgYYkIPIX
	jb3w==
X-Gm-Message-State: APjAAAV4Bj5svPnFb0BRj1HAeOqnHQKxQ3u3PKtiZceappWU8KzKXpqY
	8uaYnXT2VqjNyQbAbB5O47gKDx2/
X-Google-Smtp-Source: APXvYqzTgO37NydH84+Vf1q/Xjn49G22W9cGy7BX6Nzl4jiObiNpVF/vKcuNTKCU3YM1BRXrT9fyZw==
X-Received: by 2002:ac2:4ace:: with SMTP id m14mr33805500lfp.99.1565008839509; 
	Mon, 05 Aug 2019 05:40:39 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	q2sm14671955lfj.25.2019.08.05.05.40.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Aug 2019 05:40:39 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190805115728.31260-1-alex.kanavin@gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <96bb7537-8b1c-c3f5-1c5a-ec1f80aca5a6@oleksandr-kravchuk.com>
Date: Mon, 5 Aug 2019 14:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805115728.31260-1-alex.kanavin@gmail.com>
Subject: Re: [PATCH] maintainers.inc: give python recipes to Oleksandr Kravchuk
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
X-List-Received-Date: Mon, 05 Aug 2019 12:40:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

> Oleksandr has been the de facto maintainer meanwhile.

So have you, so don't leave me alone ;)

On 05/08/2019 13:57, Alexander Kanavin wrote:
> Derek Straka has been inactive for about a yer; Oleksandr
> has been the de facto maintainer meanwhile.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 60 ++++++++++++------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 0df1d8c929b..bc13be2fd4f 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -586,38 +586,38 @@ RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER_pn-python = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python-native = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python-nose = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python-numpy = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python-scons = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python-scons-native = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python-setuptools = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3 = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-async = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-dbus = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-docutils = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-extras = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-file-utils = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-git = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-gitdb = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-iniparse = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-mako = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-native = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-nose = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-numpy = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-pbr = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-pip = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-pycairo = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-pygments = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-pygobject = "Derek Straka <derek@asterius.io>"
> +RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python-scons = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python-scons-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-file-utils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
> -RECIPE_MAINTAINER_pn-python3-setuptools = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-six = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-smmap = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-subunit = "Derek Straka <derek@asterius.io>"
> -RECIPE_MAINTAINER_pn-python3-testtools = "Derek Straka <derek@asterius.io>"
> +RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-six = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER_pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER_pn-qemu-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"

