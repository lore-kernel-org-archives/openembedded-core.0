Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2E8774D9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 00:20:15 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id bj1-v6so14140905plb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 17:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ipQANirBKDWUzbA9xjFoBI0UJ0+k6xeVDlB2r5WsQ+Q=;
	b=uLRgP5z/1l77lUBHUirrwN1d21VjQV2k35ajJhUGaZ5Rbrae2qg7xdYCkDF6l+Nz9D
	jRC41uBXkH60fLqqalSH5YicaioZBl7qPV5xI2CE/RjMfl/VVgRRw5BfaIRBPPi5wiCd
	Kt0wqoOmZhFPEUX6B9yqozIuyi6pa/aQpmv4gW7gB2ygtcqOOiV9aSW7AsBibEdGYIIb
	IlwBm1YGh5ABpQRvjyZRWVqXEosjZPaw2TeTh36qcUYL205EhepJk1YGIu0DE6vHPI25
	KKxJOOwOhtKi66yjnukf2ZwqfXQxlhgWQ2sz4l6STm+rpe6R4nZnP2ELMqmW2PxuB4RJ
	SWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ipQANirBKDWUzbA9xjFoBI0UJ0+k6xeVDlB2r5WsQ+Q=;
	b=TQAQD1iS7vL+rD/Boa5RTr0z9oxf/Ja9ItV+N2l4HQNtJ4PYKvkdZaHKvo56Wa2a6Y
	Xho26Lo3UsKh+Ik+vSbBAd9a+SuP3K5qokmel2EAd4pPhgWkq0aOkaPn8ZkEs8dfG/kd
	yD9sKpLWytm8WUt7j+ihGfmpGpDyDxUVbuEV4m0FFw1RjT9yq9Mq/tHndp9rNDP5i1Rj
	brMu3mOYiGm/7rI1775KHEplOhPhdezO6iWe/Xa9xljjMCDaO+z81F2WERuFpH3VHGLu
	sLbX7LTjyZSN+Ecb9MqnAgGBLN0Ki/fexSs7gvtcNp+RgittjynrdoKmh6+dmYYr8g7G
	mgOA==
X-Gm-Message-State: AElRT7EVoSxoBPc5VPrv3DF4TecDshTyyIzp1Brk0+b3PQWC1vTxGjWz
	MiqiWu1/zRfresiK1d/i4jgVspBo
X-Google-Smtp-Source: AIpwx48u5BEPmVr+rCh6WTGCyNMvMvB0VeJIeFsKPZ5DHsGTQI+zGP5YVJ6TrSCeW8WxRznJYQCGLg==
X-Received: by 2002:a17:902:a2:: with SMTP id
	a31-v6mr20555326pla.204.1522887616598; 
	Wed, 04 Apr 2018 17:20:16 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:fde8:8784:7436:3e7a?
	([2601:646:8880:466c:fde8:8784:7436:3e7a])
	by smtp.gmail.com with ESMTPSA id
	g9sm10767141pgo.22.2018.04.04.17.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 17:20:15 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-14-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <1ee35204-4a8b-d22c-7225-1408f2a09d17@gmail.com>
Date: Wed, 4 Apr 2018 17:20:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180404111321.10824-14-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 14/22] icu: update to 61.1
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
X-List-Received-Date: Thu, 05 Apr 2018 00:20:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/4/18 4:13 AM, Alexander Kanavin wrote:
> License-Update: copyright years updated, added terms for Google double-conversion

should this change to terms reflect in LICENSE filed as well.

> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-support/icu/{icu_60.2.bb => icu_61.1.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/icu/{icu_60.2.bb => icu_61.1.bb} (78%)
> 
> diff --git a/meta/recipes-support/icu/icu_60.2.bb b/meta/recipes-support/icu/icu_61.1.bb
> similarity index 78%
> rename from meta/recipes-support/icu/icu_60.2.bb
> rename to meta/recipes-support/icu/icu_61.1.bb
> index 585a92bc4cd..ffaf3508966 100644
> --- a/meta/recipes-support/icu/icu_60.2.bb
> +++ b/meta/recipes-support/icu/icu_61.1.bb
> @@ -1,6 +1,6 @@
>  require icu.inc
>  
> -LIC_FILES_CHKSUM = "file://../LICENSE;md5=675f2d069434d8a1e4e6b0dcf4379226"
> +LIC_FILES_CHKSUM = "file://../LICENSE;md5=63752c57bd0b365c9af9f427ef79c819"
>  
>  def icu_download_version(d):
>      pvsplit = d.getVar('PV').split('.')
> @@ -22,8 +22,8 @@ SRC_URI = "${BASE_SRC_URI} \
>  SRC_URI_append_class-target = "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[md5sum] = "43861b127744b3c0b9d7f386f4b9fa40"
> -SRC_URI[sha256sum] = "f073ea8f35b926d70bb33e6577508aa642a8b316a803f11be20af384811db418"
> +SRC_URI[md5sum] = "68fe38999fef94d622bd6843d43c0615"
> +SRC_URI[sha256sum] = "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef"
>  
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
>  UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
> 


