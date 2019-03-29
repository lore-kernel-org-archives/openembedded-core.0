Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 64B267D094
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 22:52:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id ck15so471645plb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 15:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SFOMouIZNeYya4p13QYKGA/lYzdenI9a+Fbc5/v4NTg=;
	b=SklSY89H8ZutGsZNVlImCN5zkWEsO4KxLkCM2difxXwj8+/Gw3U9eBm4Z9Y5yDfkfm
	NM+avv+H+YfL+c/ph4/XSrCMYG92/Ma/bJELarC533kntKXBcTZKW08MqxNbzSHVTJ0b
	Vw9yQrF0mBdy51J2hmwMt0lz4f0Igogi9DJMtUIpg1f7SQxZlgQEl5rOUBXu5TW8K9wy
	cmINtrydoCZyIDNgiruMUcaVT57fQ6L3SZMCBQMpPVb6ETtkXxhAbx0wUCLMmBdcVgbg
	D3HqZM3nxJ+iV0XeVu2Fhq9qpV/tZmMg8ZS72iBhGqCA+N002mJhjNKZgE4Lw8+mINpk
	vDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=SFOMouIZNeYya4p13QYKGA/lYzdenI9a+Fbc5/v4NTg=;
	b=rLhDA/1f1UzYxcs4lQjkYSPFe/r4kTLXizFpVPf7U/Z7k+HAIDicqRGgUQh2yIyE6+
	3sy4qSeTxBQRf/tDK+q9WxheN3V9iU4153OSAkkwzLQ7JnSDixjXPclvKPYVJlRknotu
	VV2dTSbRFiA0L0pijGNOwTKPD2G/zHhXDCX4mNjqD4NzweglP8MUEPZ9FRSHK70D/9j6
	xe+BHonYo2rVuU7WmuxJ9CNdSVHXEmSNnSslXOr/w4HiRgj8yg5wx+Fw1rEWlWRtxUU8
	tLyRiOJXWWHll5mAjOcsEknUnrFFgq+alw/UmRqZQdEOC8DhxQvmUIg7Zz7oGbNTbEpO
	//Bg==
X-Gm-Message-State: APjAAAXf9N40NpdOis7MStt+23Nw2EXU7LKiU+2a4jWpd0HKuR9H36zb
	U4Y+17qHfKRQQ6XpD2Fs5c9dtLX/
X-Google-Smtp-Source: APXvYqyeHW9Qx4AQlRmS7xL3+UHvltrsyxg+PdYHKxxUecVLzRpVKlZnyXB0JhPT8Mh8LhtYdAEomA==
X-Received: by 2002:a17:902:988e:: with SMTP id
	s14mr38846332plp.167.1553899971158; 
	Fri, 29 Mar 2019 15:52:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:e49f:a080:8dd:cb67?
	([2601:202:4180:c33:e49f:a080:8dd:cb67])
	by smtp.gmail.com with ESMTPSA id v1sm4816935pff.81.2019.03.29.15.52.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 15:52:50 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190329224904.27359-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <40d34399-f10e-ae8c-9938-2170b8f1e52e@gmail.com>
Date: Fri, 29 Mar 2019 15:52:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190329224904.27359-1-ross.burton@intel.com>
Subject: Re: [PATCH] python: improve ptest
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
X-List-Received-Date: Fri, 29 Mar 2019 22:52:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/29/19 3:49 PM, Ross Burton wrote:
> Add missing runtime dependencies: the test suite needs proper chmod from
> coreutils, and the Europe/Minsk timezone.
>
> Also change run-ptest to use -W (run verbosely on failure) instead of -v (always
> verbose) to hopefully reduce the noise in the ptest reports.

with backport?

- armin
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/python/python/run-ptest  | 2 +-
>  meta/recipes-devtools/python/python3/run-ptest | 2 +-
>  meta/recipes-devtools/python/python3_3.7.2.bb  | 2 +-
>  meta/recipes-devtools/python/python_2.7.15.bb  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python/run-ptest b/meta/recipes-devtools/python/python/run-ptest
> index 832551a1244..13dfc99efd5 100644
> --- a/meta/recipes-devtools/python/python/run-ptest
> +++ b/meta/recipes-devtools/python/python/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>  
> -python -m test.regrtest -v | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> +python -mtest -W | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
> index 3863c6d314f..20c9274dfa7 100644
> --- a/meta/recipes-devtools/python/python3/run-ptest
> +++ b/meta/recipes-devtools/python/python3/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>  
> -python3 -m test -v | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> +python3 -m test -W | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
> index 4d10986f3b7..5c64bc8aa2a 100644
> --- a/meta/recipes-devtools/python/python3_3.7.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.2.bb
> @@ -284,7 +284,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
>  PACKAGES += "${PN}-man"
>  FILES_${PN}-man = "${datadir}/man"
>  
> -RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc"
> +RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils"
>  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
>  RDEPENDS_${PN}-dev = ""
>  
> diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> index 3e1af4baf63..c459af06f10 100644
> --- a/meta/recipes-devtools/python/python_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> @@ -176,7 +176,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
>  RDEPENDS_${PN}-modules += "${PN}-misc"
>  
>  # ptest
> -RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip"
> +RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils"
>  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
>  # catch manpage
>  PACKAGES += "${PN}-man"


