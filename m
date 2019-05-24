Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id A68277E452
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 02:17:30 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f12so3491852plt.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 19:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Tp5YJrSB6rrK1WT/ZpuOIIUEVOw02wCwEECAtvAOsHc=;
	b=GQIagQObjttOknozeZaGWhC4l0W/Wq9623mH8/l/nuY93bS0F0DiWohX77v4Bm4NFu
	+zdrskKmQuKrinkyf/tDBS0EuNFAjo/l9EmApMnxiS8hb0Kh79+OQ/aOI5s9PZGwzSG8
	xAXyWylzbsnysX6kjHOswSf2Yh+7t8NrQGTbUl9Gt60kyhutm8RGEpy53uyXRzvSVJrx
	y93ExcAUi6TsSkADV+1nI51jaU0fsKzq6r2H1ZBHom0Pv7edfCAFW38qTbAqAyP6+gXr
	iIodlOlBRq1kI8pA5WpYB8GR+l0EFuJTLcqrIYvlnBxBaCCf7MuPvlgH2vivUI5fvOtA
	K6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Tp5YJrSB6rrK1WT/ZpuOIIUEVOw02wCwEECAtvAOsHc=;
	b=GSGZ3FtEKrJddTl/PfakwGhCYoytz+s7Ve3xnlqiMPFemu2DaRbVdbRqhUf+g+BKHZ
	OjquJWs8dbzcK/2as3YYW2iWlI6VRYCtjJvUIZwUfF415um9lvBjAq9Ut2j/6W0YykV8
	3nRG9RqkO35+Tm9Fk6wVUjDZFVF0SXA8m/lW6IW1+Batww6ytHeVqq23G2TNsOvA4ehp
	zI4Hcfi7lfafMz9SSZbjlNCWC1zUPtxxyLsi+4MxxdqstxrE5l1p5pE3HBYWLzr2tTCf
	2mQ+W+Bq3I7SNLsmosver0WJvlcuoEjS2nXK20l9zPdnu4NtZh9P9jW9pcwhBNGCnBkx
	6Dkw==
X-Gm-Message-State: APjAAAV/tfKeyrCjrBmbnqKTQG7s4U/ZUkeOWBLXUVXW68ZQw6Y/cIwx
	7+ytx+N9w3m7EIOzoN9ZCotBcTBWS7w=
X-Google-Smtp-Source: APXvYqwZRQrloGMYdTj2KjmxVT/Rl6jBjJlji2uISFaS1rgtGlms3KGSXnFJ0SOjhFsNaMwhqehh8g==
X-Received: by 2002:a17:902:404:: with SMTP id
	4mr11292488ple.204.1558664251252; 
	Thu, 23 May 2019 19:17:31 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:41da:1c8d:2ccb:5914])
	by smtp.gmail.com with ESMTPSA id
	e12sm763775pfl.122.2019.05.23.19.17.30
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 19:17:30 -0700 (PDT)
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1558664136.git.Qi.Chen@windriver.com>
	<ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a9312659-9114-bc5e-c79a-847563fbb95c@gmail.com>
Date: Thu, 23 May 2019 19:17:29 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] systemd: avoid musl specific patches affect glibc systems
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
X-List-Received-Date: Fri, 24 May 2019 02:17:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/23/19 7:17 PM, Chen Qi wrote:
> systemd upstream only care about glibc. We made musl specific
> patches so that systemd could work. But currently these patches
> contain potential security issues.
> 
> So apply these patches only when the libc is musl.
> 

LGTM

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_242.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
> index 2dda0d0..adb592f 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -27,7 +27,7 @@ SRC_URI += "file://touchscreen.rules \
>              "
>   
>   # patches needed by musl
> -SRC_URI += "${SRC_URI_MUSL}"
> +SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' else ''}"
>   SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
>                  file://0002-don-t-use-glibc-specific-qsort_r.patch \
>                  file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
> 

