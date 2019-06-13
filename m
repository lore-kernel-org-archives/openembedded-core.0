Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id BC3E87E8EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 23:43:39 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 131so464138ljf.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 16:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=pQ5t3bWhExSphQwoW+olFvJalAjCKdhCI4jLPVJ5bP4=;
	b=OeeMcFZBwEeL6Fcbm+sMN3EiGO70LVjKpu3Yxdx0pL4o0K1/yZ3hvo79xayLcHIGg0
	A3eGSJxdufXI/r/WWV/twk9rm7agVvkMMly4Ty3CJS0/yWgDJ2PDHEfRMBLkvDye1pO6
	9dEfRtkBl1hLEr9NqPfBs8e9HeJOkhIOrfjB1CAKCfJPD1WiRWQqy22BZZ2BGZWt6QZ7
	yWbsqA4+v1m00K1ZmKf+p0uCCCmMMhmLiEVLXt7s8Dv5QYowffXyn0JNqYRG9Ev6Gl8/
	leu4hZqg41c6eGYVBIdAyH94cQnO5TIwuLPHRioGsGzYWik1CVstl+tY1SXgaAzZ0WAP
	5llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=pQ5t3bWhExSphQwoW+olFvJalAjCKdhCI4jLPVJ5bP4=;
	b=Bjkex64FD3tz5rm1WQ36CpXE3tj1PM8KtVqR4Vm3vyVF/ao5r7xnTodWVw005d7Mf5
	Wzhc9f5eiyH59fenblYX715tYiuzaDJ0e+dRgh2eooBdHnIHj6RFwaKwK2U038pzFcSk
	0F+Eu1HI/o1SZk9XM1ExPHavZFPBLn3KNnufbcexFFOuWY4ImEV7yvPbrN20hiMJwFmj
	f4J69MrdK1c7hXcScJlwmPSR5OWxePtJ6VxC5NgsenYibl+SsytKGgTz4uq2IspgZf6B
	+Ni4hgMcvasNgZjp8t5iI2sQ1a1JQu4epSgR2LDm2Vnq6I0XH97a1UvkJ1wE+zpbCr+F
	nYKQ==
X-Gm-Message-State: APjAAAX+qPUgFJi0eyfy5zEVVam0yvZpgbhAw2uE+lStsgEtcDSl7bjC
	lMzbHiESUNsayf/nRZOBK0BOZFe5Hl4=
X-Google-Smtp-Source: APXvYqw8jV6p0OztZo2l4nBoHBXqIJM9fOhlSrAXfbstZn6rkmin4bXjLNLamfgVxmnLpNDFSizTWw==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr2256710lji.223.1560469420187; 
	Thu, 13 Jun 2019 16:43:40 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id h10sm202663lfj.10.2019.06.13.16.43.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jun 2019 16:43:39 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20190613234251.8494-1-open.source@oleksandr-kravchuk.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <6042fc69-03d8-15c4-ce3d-00fa2f531d91@oleksandr-kravchuk.com>
Date: Fri, 14 Jun 2019 01:43:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613234251.8494-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] bitbake: cooker: list all nonexistent bblayer directories
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
X-List-Received-Date: Thu, 13 Jun 2019 23:43:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This is how it'll look like:

ERROR: Unable to start bitbake server (None)
ERROR: Server log for this session
(/home/sashko/projects/yocto/open-embedded/build/bitbake-cookerdaemon.log):
--- Starting bitbake server pid 7414 at 2019-06-14 01:35:10.070371 ---
ERROR: The following layer directories do not exist:
ERROR: - /home/sashko/projects/yocto/open-embedded/sources/poky/meta-abc
ERROR: - /home/sashko/projects/yocto/open-embedded/sources/poky/meta-xyz
ERROR: Please check BBLAYERS in
/home/sashko/projects/yocto/open-embedded/build/conf/bblayers.conf

Feel free to suggest better way to present this information to a user.

On 14/06/2019 01:42, Oleksandr Kravchuk wrote:
> Check existence of all the bblayer direcotories at once and print them
> all, so if there are multiple nonexistent directories, user does not
> have to correct bblayers.conf and restart bitbake multiple times.
>
> [YOCTO #11647]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  bitbake/lib/bb/cookerdata.py | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/bitbake/lib/bb/cookerdata.py b/bitbake/lib/bb/cookerdata.py
> index f8ae41093b..be1c332eb5 100644
> --- a/bitbake/lib/bb/cookerdata.py
> +++ b/bitbake/lib/bb/cookerdata.py
> @@ -342,14 +342,24 @@ class CookerDataBuilder(object):
>              data = parse_config_file(layerconf, data)
>  
>              layers = (data.getVar('BBLAYERS') or "").split()
> +            broken_layers = []
>  
>              data = bb.data.createCopy(data)
>              approved = bb.utils.approved_variables()
> +
> +            # Check whether present layer directories exist
>              for layer in layers:
>                  if not os.path.isdir(layer):
> -                    parselog.critical("Layer directory '%s' does not exist! "
> -                                      "Please check BBLAYERS in %s" % (layer, layerconf))
> -                    sys.exit(1)
> +                    broken_layers.append(layer)
> +
> +            if broken_layers:
> +                parselog.critical("The following layer directories do not exist:")
> +                for layer in broken_layers:
> +                    parselog.critical("- %s", layer)
> +                parselog.critical("Please check BBLAYERS in %s" % (layerconf))
> +                sys.exit(1)
> +
> +            for layer in layers:
>                  parselog.debug(2, "Adding layer %s", layer)
>                  if 'HOME' in approved and '~' in layer:
>                      layer = os.path.expanduser(layer)

