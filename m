Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D27AE77DFF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 17:00:13 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g2so16708332pge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=5mEa+9fhOX8mPA0tTTazzOKbqELynYLhqii3UG3IZ/0=;
	b=A5L2eo/jXpnp/IeDeSsftKqJd6DipZb3ruR5x3HXIKRy5o3T97F4eGg6n8H+FCXZ5V
	zpp7sGhpd81kn23dqxYKW2OKOmmzg1bYD/e0JD7wrXX6bkqJMODTy3ky/kVjb0+VxCXZ
	FwwLfFFAWRo0ixuG4jWXT2Lf64nsEp8OwBXCv33O2cYQOGO9aAkhpt1rjhn7wGTBwWdC
	aJQRQrsIQWAcdh8cLtScpNK+yxIABgCF7y0/XERxFvrEfJIXcwWV4EfGOLLb1r0C2Ljs
	lQm8EYvxJYS8Kyu63FnDW6S3ko0rU//XOAtLERBymapOQWJHOwbTL+Oo66l71n0VMNWe
	YLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5mEa+9fhOX8mPA0tTTazzOKbqELynYLhqii3UG3IZ/0=;
	b=CO7lN8FNsCB/739PdkA4PrWJAr0OBcUoS4EoLDokRn7ov0PNqzGSU0+qG8Yc/f0SdC
	RCK4MJQB07XFXxjCp+SEHhq3WepmvaydRPpSph+10p4u7k8Bg85aSxNgr8n3UtLVGaP9
	SusgtqTKDaBMKMD43MPzOhRyFHqca2ghPDdNNYsmKuHEI8mThiwAer2Br/Jbe3PePCWj
	lTE7ELPAaPDQSITGn6xtQgCoL+VvOPut5/5Z/INoV/x69svwOCCzg/TxdaKcS0/TlNfI
	3qYmYo4UexVp3lvQ2kmp20XVp6335bzgiowJvOB32PJU9zAAQXTM8p6bneeaiBeaOTwH
	SCxg==
X-Gm-Message-State: AFeK/H0bViEDaAKm8BbbIED5rwbHtQkbIEPf4HaTKDPwpEaIZL/8RTxELZiUwDyBlO3GkA==
X-Received: by 10.98.42.14 with SMTP id q14mr10461975pfq.229.1491584415122;
	Fri, 07 Apr 2017 10:00:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	t15sm10678859pfl.25.2017.04.07.10.00.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 10:00:14 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1491532173.git.paul.eggleton@linux.intel.com>
	<4edc896d0720c9d8fb9677c01c98af89d6b94950.1491532173.git.paul.eggleton@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d2926502-8ad2-8b47-d693-0afc3d8bf39f@gmail.com>
Date: Fri, 7 Apr 2017 10:00:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <4edc896d0720c9d8fb9677c01c98af89d6b94950.1491532173.git.paul.eggleton@linux.intel.com>
Subject: Re: [morty][PATCH 1/1] packagegroup-core-standalone-sdk-target: add libssp
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
X-List-Received-Date: Fri, 07 Apr 2017 17:00:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/06/2017 07:38 PM, Paul Eggleton wrote:
> If you want to be able to use -fstack-protector then you need the
> runtime support - you can either write this yourself or use libssp
> supplied with GCC. If you're using GCC then it seems likely that you'd
> just be using libssp, so include in the SDK by default; however use
> RRECOMMENDS just in case it's been disabled or you aren't using GCC.
>
> (From OE-Core rev: 6c990655e35bb3a14d59555662ec5802c9980028)
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

great. will pull in. thanks,
Armin
> ---
>   .../packagegroups/packagegroup-core-standalone-sdk-target.bb         | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> index 274e11a..43fc599 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> @@ -12,3 +12,8 @@ RDEPENDS_${PN} = "\
>       libstdc++-dev \
>       ${LIBC_DEPENDENCIES} \
>       "
> +
> +RRECOMMENDS_${PN} = "\
> +    libssp \
> +    libssp-dev \
> +    "


