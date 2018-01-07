Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C696F78940
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 18:24:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u25so4394574pfg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 10:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=+3MjmjR4qiJx/ZnnA+zp4ww6OGRGOQaM7CIUdjQPxsM=;
	b=VMjSoLfIDXmoCmfN0gReaNnVW2h3IA+ym+mAcpjFQNGP8FZ5LLYD2JTAR/HONk4mL/
	n5UVoj7do46nfB6hNVGmYlhJRBXRTsnS7AZugRMGPnhYRScZEHXKKgq0SVZcRH74l4NJ
	5m8eozO9Wl9RUcm5xzohTE4HlaKiR6k2olCuasMymtiBCHYgXm1Fgr989BbkraEw7WiO
	WqhAI7+bcYq659fFBflNoFtj66MthruebEHHV/63eGEQe+66/CSpmoTZf0N1nxtpVWjz
	pehMmBjMIybG/WdPKi0UkyjTW22B1JJJiAs/03T4wxOI8Bex4U0UP6pT4ZVlzisrhTu9
	uYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+3MjmjR4qiJx/ZnnA+zp4ww6OGRGOQaM7CIUdjQPxsM=;
	b=HKbq9JE3rLMc5woI+DqzfX6vDfX1eg7BSZiVkSmd43CfNju7usbapgjPV4elDy0aBb
	uHSNQ1UAon2JkXuQtalm/vHZpTU/K5dA0g39Ica0AqrOl0ESGxQ7DtZHMc76CUyVfM39
	5denGpZGooUkHsotTKwppQ6/q7udAOVLipgDKTeA5ULZCKSXdniOnobSH+lbg0eOHhjp
	WiI8Z5/vYTkSNjFES8+xrTXnl9oVlF74r95Z4rpodvEuX8WEDOOMWZeh6ffxmfZlCG+3
	oVWWteftuNGqzhlFTsJt8Unp3O+9d6nkdxl68nJVgWYj5a3TBqNqE0Xxxsi4VoODGY9K
	jocw==
X-Gm-Message-State: AKGB3mKZOds8oabxVnmgKAHEHc5DU3Wqs2nKO+Wl4OXfbRBNwa/PYwmi
	LDEyg0M60RtHgoWuePxLtKE=
X-Google-Smtp-Source: ACJfBovSiuillzvaFRRhGMtZzb+djult+1fnfd8Lys/RUAScga708fuOpZgVyFsFMfypI2yb1cXLUg==
X-Received: by 10.84.149.168 with SMTP id m37mr9439880pla.353.1515349493234;
	Sun, 07 Jan 2018 10:24:53 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:d3a:c846:b190:ee80?
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id
	m11sm19070218pgt.56.2018.01.07.10.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jan 2018 10:24:52 -0800 (PST)
To: Ruslan Ruslichenko <rruslich@cisco.com>,
	openembedded-core@lists.openembedded.org
References: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fe004779-60af-f45c-acba-aba427d3d9d6@gmail.com>
Date: Sun, 7 Jan 2018 10:24:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
Subject: Re: [morty][PATCH 1/7] acpid.inc: set CVE_PRODUCT to acpid2
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
X-List-Received-Date: Sun, 07 Jan 2018 18:24:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This set is now in morty.

Thanks,

Armin


On 12/18/2017 05:50 AM, Ruslan Ruslichenko wrote:
> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> It is used in NVD database for CVE's like:
>
> https://nvd.nist.gov/vuln/detail/CVE-2011-4578
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit 966052df79df0f68565ebc40887170322d3f85b8)
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> ---
>  meta/recipes-bsp/acpid/acpid.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
> index 12ec19b..766ed4f 100644
> --- a/meta/recipes-bsp/acpid/acpid.inc
> +++ b/meta/recipes-bsp/acpid/acpid.inc
> @@ -9,6 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
>             file://acpid.service \
>            "
>  
> +CVE_PRODUCT = "acpid2"
> +
>  inherit autotools update-rc.d systemd
>  
>  INITSCRIPT_NAME = "acpid"


