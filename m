Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A357CA0EFF
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 20:58:18 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.17988.1756587494402410290
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Aug 2025 13:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHTy+e9I;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cf429f4c2so4856594a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756587492; x=1757192292; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+vmeOy/n0ClbYdEOCHc08ecKBibt93/vyRFfmcN310=;
        b=SHTy+e9IN35Zd8wfpUA+4zK88HaKUmojCqo8SSsAwhA1JnaUmsmbilEpuOgFrdF9fD
         A6bc1Fd/xr/zqzIaEaTdPyOqSh+jxP/5+MQ7AaJcvfVCLdf7BZj3F7fFO+DUBCi6Z5AY
         TUXT2ghesjrnE+Obcy1F0d8hww+AFCJHUnECcav4szcD6UfUuBHEIPASbzl6bwVbXlUI
         Fnv5Kcsv/qJfdGDe3kJvY/FFDCTh5ugCdYsQzkBZ/4g3aP/eaZbQ9a3ja2I6FZD6ZEi2
         d5cWQJ83x1bZ4w1U0L+BbmGzA2JUI4uoVBhQ+ZrC4Kre59v9Si5NXQxuOlsrxchHd4WY
         A7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756587492; x=1757192292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+vmeOy/n0ClbYdEOCHc08ecKBibt93/vyRFfmcN310=;
        b=k7cSOgoo1WUSeUxqUv+psyqNrytMSp/aNNCEITNsmBajinBbgUNO+hBaN5zO3niPgy
         QuxH2/uFlWXTG06zTi4adt6q5g7h92aG8LbZmfOC1NvjmPfAusLOJcaEac0DjdANmErt
         K9XTPku/tgy81JYilVWkc9THCW/AoHUcwLbCFBdzrZlNTI7ez3SGtB7HGEz7c3Yfbed5
         JYeL5BidPanaRhm58Nabibz6H5yjlRVFrWdtHvDQ8ek675Q2YAvW3pjG5L+t4GeqzPS0
         eQBw6iImf3wC1Fs4uMp3Op2gEsKwN/soBAYvHb8PYOG2ywjZ9r0dy/lHhMtlfOm7swxn
         n3vA==
X-Gm-Message-State: AOJu0YzHnLSHNfntqxUwXfG5it29qu+BNsdy06uY2aFOMc35PdvUhzO6
	epwysEP1k/iRrRoLoIkQvzuUTFLUPrRZ73LFtrPp7MGHMizJrqRarnRLXLAmkg==
X-Gm-Gg: ASbGncsOHylZYLyKqWRto9buIO5qXn+YQavcsrrr7A8ZSBc/qZXFI8kMcsopHZrBxMO
	oHUjtdkrMsQt9pDgGT/rrXST1cCb98l6JkM/kNrgJeHKkeZHgI874XIZ23Cm54A+Yv8CCdVNWWp
	HrW9YGMoUHIBkd70ZzyGmr+afiUfoia6c0GPyitlEB8Tx4JNp9gHRW/GZtMFsWxhCW2QN+wfDQt
	PWL9pwr1cwF0VRhe33LiUzlTDra4/H0m9KiD1OGjQNrUg7H9Nsb+TncLs+gcwfqpkOsuTqg1Q0w
	dMsUYvrSTaoQGDUOygC/tb/SjcPCGWejnGvKdI1yCBzUFOxO3N35cQo91Ikez52UyL4FhiGeoI3
	yY5qtMj6bmuUX+QGLxX8sv2AGlE29RV1QvYwI31z2EA==
X-Google-Smtp-Source: AGHT+IEjhy6u9hkjc0M8k/mSEdmdbCJdB/4nt9No9uwWb7zj0Drx5B4TQvW51b1CAv0n4/5fgHAC0A==
X-Received: by 2002:a17:906:8f8a:b0:afe:f418:2294 with SMTP id a640c23a62f3a-b01d979d31emr287156266b.49.1756587492495;
        Sat, 30 Aug 2025 13:58:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040b1cf3c9sm139139666b.5.2025.08.30.13.58.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 13:58:12 -0700 (PDT)
Message-ID: <2f5a2e0f-0b16-4990-a574-a3fad36fdc96@gmail.com>
Date: Sat, 30 Aug 2025 22:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
To: openembedded-core@lists.openembedded.org
References: <1860A6DF185EFE18.24627@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1860A6DF185EFE18.24627@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 20:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222628

On 8/30/25 22:55, Gyorgy Sarvari via lists.openembedded.org wrote:
> diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
> index 948f8c183a..0d83e68679 100644
> --- a/meta/classes-recipe/autotools.bbclass
> +++ b/meta/classes-recipe/autotools.bbclass
> @@ -186,13 +186,35 @@ autotools_do_configure() {
>  				echo "no" | glib-gettextize --force --copy
>  			fi
>  		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> -			# We'd call gettextize here if it wasn't so broken...
> +			# Gettextize could be called here, however it doesn't make the job much easier:
> +			# It doesn't discover relevant po folders on its own, so they still need to be
> +			# found by some heurestics. Also, it would require always the full gettext
> +			# package always, instead of gettext-minimal-native.
>  			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
> -			if [ -d ${S}/po/ ]; then
> -				cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
> -				if [ ! -e ${S}/po/remove-potcdate.sed ]; then
> -					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${S}/po/
> +			if [ -d ${S}/po ]; then
> +				if [ -f ${S}/po/Makefile.in.in ]; then
> +					# search for all Makefile.in.in files that are identical to ./po/Makefile.in.in, by md5sum
> +					base_makefile_hash=`md5sum ${S}/po/Makefile.in.in | tr -s ' ' | cut -f1 -d' '`
> +					makefiles_to_update=`find ${S} -name Makefile.in.in -exec md5sum {} \+ | grep $base_makefile_hash | tr -s ' ' | cut -d' ' -f2`
> +				else
> +					# if there is no po/Makefile.in.in, then just copy the latest there, without
> +					# searching for others
> +					makefiles_to_update="./po/Makefile.in.in"
>  				fi
> +				bbnote List of Makefile.in.ins to update: $makefiles_to_update
> +				for makefile in ${makefiles_to_update}; do
> +					makefile_dir=$(dirname $makefile)
> +					bbnote Executing: cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${makefile_dir}/
> +					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${makefile_dir}/
> +					if [ ! -e ${makefile_dir}/remove-potcdate.sed ]; then
> +						cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${makefile_dir}/
> +					fi
> +				done
> +				for makevars in `find ${S} -name Makevars`; do
> +					bbnote Concatenating Makevars: $makevars
> +					cat ${STAGING_DATADIR_NATIVE}/gettext/po/Makevars.template.minimal ${makevars} >> ${makevars}.yocto_temp
> +					mv ${makevars}.yocto_temp ${makevars}
> +				done
>  			fi
>

In principle I think that it's about as I can make it on my own (sans AB
failures[1]), but there would be a few question marks on my end:

1. If you have a better idea for relevant Makefile.in.in heurestics in
autotools.bbclass, I'm listening
2. I *think* that the Makevars concatenation makes actual sense, and the
build success is not only an accident - but I'm not 100% sure if that's
the best way to handle this. If you know gettext, I'd like to hear your
opinion. (This was inspired by gettextize's behavior. Upon running it,
it copies the Makevars.template with default values in the po folder,
and asks you to set up all the variables from it in your Makevars file)

[1]: I did build recipes and multiple images successfully, but not
"bitbake world" on multiple configs

