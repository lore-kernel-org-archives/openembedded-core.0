Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71E1D60D4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 18:29:44 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y30so1632896pga.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=SsC2Jm1ND25BnScN+oFsKBqxO3zKtFss8Re5jB8OYn8=;
	b=qpmRFrgyYRBRrH/yrKMtan+QMuvaeWmguT2tRe9d+nPajr6yqNaKl6snscOsrOgJKG
	LyUZTuUk4QiJj1udYMFCfrpCwvPWu/dprULVSscTxiSfiV865K55v6+TA8h2gdCuH+jp
	kdrAe2bNKSbSWzwI05LosQzhk85CRtCpyOOArm/8D53CtKxm/JwLpopCcaBAJetDVcYO
	POqdQ5xEypVL2HCBZcUFQTg6c7p1EjiPGwb4AHyRaQjI6utjexmF4y/tA4kN088j4y1r
	8tfGA7fM3cnCY7b3aS+57ZYERKTcBec7SPj/njms+EefMksC6FXogrBKZOPGo1CIoC9p
	c0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SsC2Jm1ND25BnScN+oFsKBqxO3zKtFss8Re5jB8OYn8=;
	b=ljp56zUrsKWdDEedGnFAhxC/ci+gFoaK4udlEysZOAGTY4TzyJTr1On/YW+8dVWfcy
	xqHhIpwcSFGse9TUFXDl8DEX3Tt6QCsiNAICn3b5H0iuqP1i4j6Q8d/vKB+gg1GJ8Zc8
	DhNaiMNj1VkRB7llKawfNL7FeZoBTd8nY4LccUNXJNcd0bq3Jrze2KfyJJ+Qx/yNvbMk
	sVF811hjodowrkdmsGeH/nueML9ibyY+Cx3dHkFBb2u60Du0i89sQaxi+2wqIbVoZBSI
	D/rEdEGctf0h0B9teHzVpIJdcnd4M5N3+2HESEKd4+x8g0VIIPwmOHEkeU1IQN/+56RH
	YYKA==
X-Gm-Message-State: ANhLgQ0ODct68vPwYN4Y6mUe0V9656rJG0Cra1foypiZwbKfavs0b8cH
	I9CM3GL0jClJDFdTCZh6MQCi0w7HPiM=
X-Google-Smtp-Source: ADFU+vvzS0VUzm1lDnElD+ovf8/xJTSDPk6CyH0PEYBZvOhnmmrLib3CgXR47D86SM/IeecLSxNuEA==
X-Received: by 2002:a63:ff20:: with SMTP id k32mr2017475pgi.371.1583951385019; 
	Wed, 11 Mar 2020 11:29:45 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:e8b9:f87c:18f3:1405?
	([2601:646:9200:4e0:e8b9:f87c:18f3:1405])
	by smtp.gmail.com with ESMTPSA id
	f127sm14698638pfa.9.2020.03.11.11.29.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 11:29:44 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200311114421.65442-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <53da03e4-b7e4-8882-3d10-ff27a051f07b@gmail.com>
Date: Wed, 11 Mar 2020 11:29:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311114421.65442-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] coreutils: Fix -dev package dependencies
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
X-List-Received-Date: Wed, 11 Mar 2020 18:29:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/11/20 4:44 AM, Richard Purdie wrote:
> The new ptest dependencies present some challenges, in particular libmodule-build-perl
> which effectively depends on gcc. In multilib images, this results in both
> libXX-gcc-symlinks and libYY-gcc-symlinks being installed which conflict. This also
> makes little sense.
> 
> The easiest way to fix this is to disable the automatic -dev package dependencies
> and manually specify the correct ones.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-core/coreutils/coreutils_8.31.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index cba0bfe15cc..eac016319eb 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -149,6 +149,10 @@ inherit ptest
>   
>   RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl libmodule-build-perl make perl perl-module-file-stat python3-core sed shadow"
>   
> +# -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
> +RRECOMMENDS_coreutils-dev[nodeprrecs] = "1"
> +RRECOMMENDS_coreutils-dev = "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
> +

this also means that any indirect dependency in future has to be added 
here manually right ? or will that situation never happen, if it will 
then perhaps a note in comments might be useful about that

>   do_install_ptest () {
>       install -d ${D}${PTEST_PATH}/tests
>       cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
> 

