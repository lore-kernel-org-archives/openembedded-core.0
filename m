Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5796C325
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 16:08:32 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y18-v6so1130666pfn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 08:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=29D6TOiYymOj4E9bJKplEZZwnnNXOSyGKjKQCFnfnmk=;
	b=eKlAHmECfjEEehNW9Yr9QsZSHLzG1mMmK9FqUwktzbnZzOlNU/dkkdenysQFy0SbUf
	w17EbZE6tZMP9kxY/FRfHhsB8Sx7GmmdAloJSNh2haM49O6VnxqziiOsy5fHxamjFmMM
	2Yqql0vf9nImK1r7wizRb887jgQsEJfke+VSbX08u9/TSGPFrVZz3yoGR3hIdrvuZcDC
	lawjU3MA1uAyhEr5qRJuSH/aCAWaQzylHqIdULwmrho2ilhE6oJWmxoonFIvCe9jme9j
	s+uZCtV22Cq0zsgx+c8AYbFMMUUs68p9MsRj5+W4bPtwJKARq4d+dFNPOGbseYfBGrQR
	VQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=29D6TOiYymOj4E9bJKplEZZwnnNXOSyGKjKQCFnfnmk=;
	b=MPD6JmQj1jAUA+j4AmknPBYL6S8p/1+LcQwTpJilfkOC4ApaV4bcnD9dRJqBH/om+b
	fHLjQxesPo05c5GBLEjsf6kPIRD7hGmPP8Qm2qNxgkPvA8dsbA4rtEkoHWIL6HNFE4D3
	nvxf8KV5Tc//KwFTj36JRXiMLfey2549hlcIOEvtUYUZyKpBFftCtbULsCzUU1KrEIbs
	6rb+UbEJpBuHwbyylxRhXukcjTGhx+EgNxYsG7DNZYJSJfQnwoGy5Er6EHIbE81HR08W
	oIi7EP5jB1rWPDT0JRizFv4AExM+9O9EPumXSww97EqjrsLBMp1mdwyu8lqm+EhDJ3JB
	mvQA==
X-Gm-Message-State: AGRZ1gKCdGytIwxqipJZ4Ta8UqoJ8gh0UbLXlJ8m0ns6i0fFedNZmkeQ
	18eH/Jaxzo+/L02VXkHMUtx+VLPe
X-Google-Smtp-Source: AJdET5d3bHetb+Wu2wsPDEN/c9hrmyJoJYo8PZrFVG3Umoe/egf7+p5fRNQxJBx1lCGPjjLhhbmP3A==
X-Received: by 2002:a63:4e18:: with SMTP id c24-v6mr7886443pgb.6.1541779712996;
	Fri, 09 Nov 2018 08:08:32 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:bc38:12a0:5835:9ef9?
	([2601:202:4180:c33:bc38:12a0:5835:9ef9])
	by smtp.gmail.com with ESMTPSA id
	v185-v6sm7648098pfv.48.2018.11.09.08.08.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 08:08:32 -0800 (PST)
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1541138937-68270-1-git-send-email-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <53d1e09c-dad4-be41-bce4-8e806525222c@gmail.com>
Date: Fri, 9 Nov 2018 08:08:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541138937-68270-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] unzip: fix for CVE-2018-18384
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
X-List-Received-Date: Fri, 09 Nov 2018 16:08:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/1/18 11:08 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../unzip/unzip/CVE-2018-18384.patch               | 39 ++++++++++++++++++++++


Change missing update to bb file

- armin

>  1 file changed, 39 insertions(+)
>  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch
>
> diff --git a/meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch b/meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch
> new file mode 100644
> index 0000000..cc9e2c1
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch
> @@ -0,0 +1,39 @@
> +Upstream-Status: Backport [https://sourceforge.net/p/infozip/bugs/53/]
> +CVE: CVE-2018-18384
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +--- unzip60/list.c	
> ++++ unzip60/list.c	
> +@@ -97,7 +97,7 @@ int list_files(__G)    /* return PK-type
> + {
> +     int do_this_file=FALSE, cfactor, error, error_in_archive=PK_COOL;
> + #ifndef WINDLL
> +-    char sgn, cfactorstr[10];
> ++    char sgn, cfactorstr[1+10+1+1];	/* <sgn><int>%NUL */
> +     int longhdr=(uO.vflag>1);
> + #endif
> +     int date_format;
> +@@ -389,9 +389,9 @@ int list_files(__G)    /* return PK-type
> +             }
> + #else /* !WINDLL */
> +             if (cfactor == 100)
> +-                sprintf(cfactorstr, LoadFarString(CompFactor100));
> ++                snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactor100));
> +             else
> +-                sprintf(cfactorstr, LoadFarString(CompFactorStr), sgn, cfactor);
> ++                snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactorStr), sgn, cfactor);
> +             if (longhdr)
> +                 Info(slide, 0, ((char *)slide, LoadFarString(LongHdrStats),
> +                   FmZofft(G.crec.ucsize, "8", "u"), methbuf,
> +@@ -471,9 +471,9 @@ int list_files(__G)    /* return PK-type
> + 
> + #else /* !WINDLL */
> +         if (cfactor == 100)
> +-            sprintf(cfactorstr, LoadFarString(CompFactor100));
> ++            snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactor100));
> +         else
> +-            sprintf(cfactorstr, LoadFarString(CompFactorStr), sgn, cfactor);
> ++            snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactorStr), sgn, cfactor);
> +         if (longhdr) {
> +             Info(slide, 0, ((char *)slide, LoadFarString(LongFileTrailer),
> +               FmZofft(tot_ucsize, "8", "u"), FmZofft(tot_csize, "8", "u"),

