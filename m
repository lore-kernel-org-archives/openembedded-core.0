Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 08B067D6B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 15:48:48 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t10so5907425plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=ogLs29eQ5Padt8K0jmK/DZSpP02Rxn7P1A88/7TAwIo=;
	b=cwbtmNu7wvL/HsorlLbJbDRN6nJOrxQMUKDTk8xNW4OUb3Ys382FQatcv/H/LWIqQg
	lO2kf0ToK7VtDYowU97xUEoxgaRVX9dY34BZ8ZjuTu64jl9ZgGszpAy9K+FDmEd5N53X
	gEnu9EFHmGiflXhlkslmpq5GY88pE3YPYElQPeciw56ZUKGLsoqrxoZV6hQ8bLtl+3Rq
	8k18awMg5Tp0pn3fkSbylducKKsSsVxvO2KqWktsxWeiJJY9LyeWrGuH0wuwj6+h1zIO
	MpyxMPWQdLa9djjWwMjF3l9tLHEV+SfxrLtUIICZPrqBDwU2WAz2H66ueUEvu/QXGwc/
	JQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=ogLs29eQ5Padt8K0jmK/DZSpP02Rxn7P1A88/7TAwIo=;
	b=Ho46Hr8/kQR+I0wcIM2E51GmXanxbQSMZCdb3CotTjw4/NC7/VZjSAd7JoVFE9rWHl
	JUsCrPE80bFr4NYqaI1p3gYHU0yJj9yPAWyxzIR7dd1i6cgioSwzJE2oMWTxgST2XGD1
	9obRhXpzPxngmLnjXhI0F4BJpPRnAgINAEaf0l5PVVASgLlc3oF83l0+QGcLH839MGaW
	q/ADKKRR5RKj5WExhoRsfpGUOzJ3hh3rpxKx4daQjoPqoIEPsGwESfbAExywj+o1Cs+C
	vVFl7nwio24s151/ACn475AL+xRBNt8gN2L3TVu+6jlwJwx4HHknLtgAh+ofnkWqXgqM
	QzYw==
X-Gm-Message-State: APjAAAXpY4Jqschg8y/r0A6SfXX4s4JliW5JwMOlOWBjbJ9jF5w1h36k
	kok5bH2GwTELICZLUR6foDnyJw5Xbco=
X-Google-Smtp-Source: APXvYqxAHjs8SC/Cx38j6fOaYlETqxnYGeQQx9SJeuU1o4/vfdiqumJnZch2XGuA1NMgLT91AJVraw==
X-Received: by 2002:a17:902:6bc4:: with SMTP id
	m4mr21199345plt.103.1570895329568; 
	Sat, 12 Oct 2019 08:48:49 -0700 (PDT)
Received: from tyche ([2601:646:8500:1c20::3d0e])
	by smtp.gmail.com with ESMTPSA id
	g4sm11512824pfo.33.2019.10.12.08.48.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 08:48:49 -0700 (PDT)
Message-ID: <73a4ebf5e0fe883b6d0cb8757dade5cca194d413.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 08:48:48 -0700
In-Reply-To: <20190928231617.3553801-1-raj.khem@gmail.com>
References: <20190928231617.3553801-1-raj.khem@gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] core-image-sato-sdk-ptest: Remove valgrind ptests for riscv
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
X-List-Received-Date: Sat, 12 Oct 2019 15:48:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ping

On Sat, 2019-09-28 at 16:16 -0700, Khem Raj wrote:
> valgrind is not yet ported to riscv
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> index ff297fe324..13c813a4d6 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> @@ -10,6 +10,8 @@ PROVIDES += "core-image-sato-ptest"
>  # Also include ptests which may not otherwise be included in a sato
> image
>  IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
>  
> +PTESTS_SLOW_remove_riscv64 = "valgrind-ptest"
> +
>  # This image is sufficiently large (~1.8GB) that we need to be
> careful that it fits in a live
>  # image (which has a 4GB limit), so nullify the overhead factor
> (1.3x out of the
>  # box) and explicitly add just 1100MB.


