Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC556D4B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 11:20:24 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id c3so1144576itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1OjGvFcMZSPP+pvASwiECODfDuTB1meqUGZaujUIPAM=;
	b=P10NgfTqAelXH7+sUvK4dp3LPMmXk2QGCRBosVq14O3lC/GPSiPCLHuBfw9e5lA5+d
	3ocs8hp44z9CVC9gptWxCPvDo5MGqzmugYb7oPUrJF0hCz4psmqCTK3ZWYaLFrt+psdC
	lF8lrIhDKNueX0HYYnN+fGiwvvVlQmz0zf1TCFlOHQ2zhFUct8K/+rr8BOhp0iKWrIMw
	G4BcTRLp6UguUmxFeCie9oqGcCfEkoZ41XL7K1+L4D4jDz3+sc5EWtZSJ7mVYr5RDRIZ
	T5BOi5pexZBOJibzuNW8cfUAUJrMayj53pNdLgkT7KoGJDXjHvVdSojNo/AFRqiwls8g
	Egiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1OjGvFcMZSPP+pvASwiECODfDuTB1meqUGZaujUIPAM=;
	b=W59mQMiS3RLr7smpEi5PO4FvuKLglrvlMFavODrSU30FU+s3wERi2tcGiVgiiDqTkv
	cka0qXjKD89nGRr5+j5iqI5QVaOZAHoeovyrDsHj1jLhNnQMkdFI4tzrRQJuInDNI2yP
	TYs7Ud91SHKAv3UI/GqlxDvgwxyaBGcVwC3vYxeip6lagPZoog6okZXXbiP+u6h8aTYL
	EqS0Liin4L2fUiQB9ewZVTt0iWHCA1zDUAA2XqVY9H2oky/Qrw2RSrrCdWEAj6smbRky
	/r3uN4a9O9nBbiW0trWkBBwdlRqM2gsM8ZXuLyBUb/SJzBfWtfXLR/5z/6rDV1E9khvV
	0lyg==
X-Gm-Message-State: APjAAAXVMxspMi42G5TO92wvLyDCky3IeOA77ppjq/oSFcYsB+pD6Nlf
	lPnQR+01Gpu8its01J2OTgIhXJrVRFQtWRH7HNlRFA==
X-Google-Smtp-Source: APXvYqwkAjADNEcPBEs/yt+VYhn5eRqIt7JSUomK6vLFsH655iSnqMyj8ITJzIlYQq6K501hrr1SNCzg5kLDR3cD+p4=
X-Received: by 2002:a02:3217:: with SMTP id j23mr35431934jaa.79.1559906425702; 
	Fri, 07 Jun 2019 04:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
	<20190607012157.16757-1-douglas.royds@taitradio.com>
In-Reply-To: <20190607012157.16757-1-douglas.royds@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jun 2019 12:20:14 +0100
Message-ID: <CAJTo0LaXrqCh6Nn9V8QWZS8+ivUdbOwTAcVvwXi7xziETMQKtw@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Fri, 07 Jun 2019 11:20:24 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW I still believe that just patching out -Werror is the correct fix
here.  To be honest I'm really close to writing a QA check that
-Werror and friends isn't being used at all...

Filed https://github.com/json-c/json-c/issues/489 in the hope that
upstream will handle it.

Ross

On Fri, 7 Jun 2019 at 02:22, Douglas Royds via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> icecc preprocesses source files locally before shipping them off to be compiled
> on remote hosts. This preprocessing removes comments, including /* fallthrough */
> comments in switch statements that normally prevent the implicit-fallthrough
> warning.
>
> Rather than turning off -Werror by patching configure.ac, it is simpler to
> disable icecc completely for json-c. There are very few source files to compile,
> so the compilation is quick even without icecc.
>
> See https://github.com/icecc/icecream/issues/419
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/icecc.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index edb0e10434..c0f21bdbfd 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -76,6 +76,7 @@ ICECC_ENV_DEBUG ??= ""
>  # target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
>  #                             prefix" error.
>  ICECC_SYSTEM_PACKAGE_BL += "\
> +    json-c \
>      libgcc-initial \
>      target-sdk-provides-dummy \
>      "
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

