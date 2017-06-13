Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8537978299
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 18:33:38 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u101so32993331wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0ZMmugIR47FfCP8rLnZlebJV2/mv1A2pzPcQXo5AgMY=;
	b=uMPTHVBBP4AAFYP2B7LH0PvCrHmnQ8QnC1Uxzq3DxvBWOIT/2pEafwS3H6BCD9rkjr
	nT0v3lclnvR3BljUexrDR1GAeQLzmOuki0EsS1IPLeeS+T5Juy6e1sW8OTC2RTxMhT7h
	KRvWZZ2vGH+uKQ/OOeLmsTqz53NzKnabSHFiG/caUqJF216wvd0RhPDDVGlut9FZgmkn
	U0TMr85rGM1IRJK8NYRD+9/vzOx2nafjx5vktfibkPRks5IPZ+IEVFBavqiZO6CWLDIy
	5KhuHXTTnDhiyj3w9HFKY+33k02rXrJI/dUwlOOX5WUs+KV2nezAg8X7Px+IeShXERjU
	XC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0ZMmugIR47FfCP8rLnZlebJV2/mv1A2pzPcQXo5AgMY=;
	b=t7/o7TXzGY/qZU62928B80l7snmBMT29iS64UlWDd+C9xRK3QPevwgmnZi9pZv7zOa
	o2ilL/gQnAcVVbR2TpMgtNje9pyaxvmgVLIi3+V3PTLl9/9EjrfmXY0opOD7RtcwRHHP
	S0g29NWlGpgfMkK/wl9YOUrTLLLDmXN7Ox1LXdBE5CZUSdAWdsprMHIHbtmW2pv2IBGG
	qfo/3s6sOoohL/qPiA+SYcoGThjVZEg/snGd0eH3sYQV9DlxKN8b5RWv0iYduizT9biR
	9xn2bgcOc3qzPYMCZOLxEhSU45xcIeeU9FaPdvhA+jJUnXAemoPfT/3XJSbpDx8YtihZ
	FJnA==
X-Gm-Message-State: AKS2vOw5dk7e5G7/qn8NITMcttZGHK9GbCc2lPDHe3WU1DPl2LZjscip
	Nqz0m20kUf6GI2FOLxVIi1Hp0whv4A==
X-Received: by 10.80.137.36 with SMTP id e33mr964597ede.67.1497378819183; Tue,
	13 Jun 2017 11:33:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Tue, 13 Jun 2017 11:33:08 -0700 (PDT)
In-Reply-To: <20170613090926.GA1963@mcrowe.com>
References: <20170516124000.21432-1-mac@mcrowe.com>
	<20170613090926.GA1963@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2017 11:33:08 -0700
Message-ID: <CAMKF1sr0-=SZgXPBVsgMi1t6-MhVk+tst=Zy3B0Ex+GM+dFRDQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross-canadian: Use ${target_includedir} for compatibility with meta-micro
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
X-List-Received-Date: Tue, 13 Jun 2017 18:33:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 13, 2017 at 2:09 AM, Mike Crowe <mac@mcrowe.com> wrote:
> On Tuesday 16 May 2017 at 13:40:00 +0100, Mike Crowe wrote:
>> meta-micro puts headers in /include rather than /usr/include in the
>> sysroot. ${target_includedir} means that the correct path will be used
>> automatically.
>>

patch looks ok to me

>> Signed-off-by: Mike Crowe <mac@mcrowe.com>
>> Acked-by: Phil Blundell <pb@pbcl.net>
>> ---
>>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> index ec1d281800..91a6fa6994 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> @@ -80,7 +80,7 @@ FILES_${PN} = "\
>>      ${includedir}/c++/${BINV} \
>>      ${prefix}/${TARGET_SYS}/bin/* \
>>      ${prefix}/${TARGET_SYS}/lib/* \
>> -    ${prefix}/${TARGET_SYS}/usr/include/* \
>> +    ${prefix}/${TARGET_SYS}${target_includedir}/* \
>>  "
>>  INSANE_SKIP_${PN} += "dev-so"
>>
>> @@ -153,7 +153,7 @@ ELFUTILS = "nativesdk-elfutils"
>>  DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
>>  RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
>>
>> -SYSTEMHEADERS = "/usr/include"
>> +SYSTEMHEADERS = "${target_includedir}/"
>>  SYSTEMLIBS = "${target_base_libdir}/"
>>  SYSTEMLIBS1 = "${target_libdir}/"
>>
>> --
>> 2.11.0
>
> This patch ended up in https://patchwork.openembedded.org/patch/139908/ .
> There don't appear to have been any objections. Is there any chance it
> could go in?
>
> Thanks.
>
> Mike.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

