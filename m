Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9377B7F2F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 07:46:49 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id q12so13664048lfc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=eewjS8wQMyQzSLp4nNZ1QPGo6ZX6aKXJugM7jamY3BE=;
	b=JqEHu7EMSLDjGGV1FxYf98mFUjZeV4smlCg+hUrv8xZI4+VMfdiPZUkJ03uPtYUqll
	Be9TNwrJfA4PrnHrFPhUKZnPotZsiJNkf+yIdhIjh8S5Q8bCER6+aaTWjuiHjcfwxItf
	psX8m3ZPlUNMOXW9cj78XnjKVRNjPkcdKngEOEI44b5EwIr6cQ2NWI9DNguppn3HFzOE
	aowCCiyOp6Q50LG4QhTWB1E6W8JCvR92HQhjN8THO9QYkZxo/omxkEjwwgOD1LWqK97o
	NyiHlTIeevp9bum5xYvJXUfUQzDGumdGDLP88nKrwJ72hWfRQWP8RyLVdT5J5o4MvSPh
	hj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eewjS8wQMyQzSLp4nNZ1QPGo6ZX6aKXJugM7jamY3BE=;
	b=BmviDxbDwOfucDbwqbsP5NIbnjLnWWiUSAhhJqIiLHVcfh7wR/DlCYVk/GzQElb2Lq
	a67BTshPbtX5sUQDA10pIR/MyqT2akTP09Mnz4x9BiCrxrFcYwopk64ijG9QxZaA52Xv
	b8pBrs3FwwWpwOMbIh4IIxRPDJQ4XASvx+wAX17SIDyvdhgXjgBiBjYORnvDNnQsU2ct
	ql90OXacSTeydGLzR1T+nA3rwajtoG1joy6TIV/RKgiZLL3HrdgoJAOWiwltjsnMgYQ3
	RA2f0l67gNh8NG6bI2N4SmnMdY07IoQjaaTZir1U9NwwCKWmwdZcvLew3xvg/jbDIaYS
	cPDw==
X-Gm-Message-State: APjAAAXveuGeRMEV/nuPgkbfKXL/4qqUSgh0d7111eK3AtCuRPZ66eVL
	e5tJ7BwGhj1c2dAP1tAZW+SMbb42DLA=
X-Google-Smtp-Source: APXvYqxI+4WJd2rDXHTTIHbPvLBOJ9Z48ZOs7dCq6ztkHLisPawTQi8R8BrReNtboWTvG/IMTrPUNA==
X-Received: by 2002:ac2:5a06:: with SMTP id q6mr18694046lfn.59.1571125609604; 
	Tue, 15 Oct 2019 00:46:49 -0700 (PDT)
Received: from [192.168.51.70] ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id v1sm4805780lji.89.2019.10.15.00.46.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Oct 2019 00:46:48 -0700 (PDT)
To: Dan Callaghan <dan.callaghan@opengear.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
	<e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
	<1571123420-sup-6304@galangal.danc.bne.opengear.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <ed8679a7-9f6c-b759-1eb2-95fffd33c222@gmail.com>
Date: Tue, 15 Oct 2019 09:46:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571123420-sup-6304@galangal.danc.bne.opengear.com>
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 07:46:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Den 2019-10-15 kl. 09:21, skrev Dan Callaghan:
> Excerpts from Jacob Kroon's message of 2019-10-15 08:59:56 +02:00:
>> Den 2019-10-15 kl. 08:15, skrev Dan Callaghan:
>>> @@ -46,8 +46,12 @@ SRC_URI[sha256sum]
>>> = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc
>>>
>>>    inherit autotools gettext ptest
>>>
>>> -EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
>>> -EXTRA_OECONF_append_class-native = " --without-bzlib"
>>> +EXTRA_OECONF = "--program-prefix=eu-"
>>> +
>>> +PACKAGECONFIG ??= "bzip2"
>>> +PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,bzip2"
>>> +PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
>>> +
>>>    RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
>>>
>>>    EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
>>>
>>
>> If I get it correctly, previously the recipe depended on bzip2, but for
>> native it was actually disabled at configure time. Can't we just skip it
>> for native then, since it hasn't been required sofar ?
>>
>> You can do
>>
>> PACKAGECONFIG_class-native = ""
> 
> Yes true, that would work, although it seems like needless complication
> to have different build configurations for the target recipe and native
> variant.
> 

Lots of recipes do this. I personally think its ok if it helps keeping 
build times down by avoiding unnecessary deps.

> Anyway, I figured out why the --without-bzlib was originally added for
> the native variant. The commit message wasn't clear to me, but I have
> seen the problem in action now.
> 
> I saw that elfutils-native correctly depends on bzip2-native, and the
> build worked on my PC. But it was actually the host bzip2 library
> leaking into the build.
> 
> Poky has "bzip2-native" in ASSUME_PROVIDED. Presumably, this is because
> bzip2 (the command line program) is a required host tool and so there is
> no need to build bzip2-native just to get a working bzip2 program.
> 
> However that also means that bzip2-native libraries and headers are
> silently omitted from the recipe-sysroot-native for elfutils-native,
> even though it depends on bzip2-native. On our Jenkins, which has a very
> minimal build environment and lacks the bzip2 headers, elfutils-native
> fails to configure:
> 
>      | checking for library containing BZ2_bzdopen... no
>      | configure: error: missing -lbz2 for --with-bzlib
> 
> It seems to me the real problem here is that "bzip2-native" does not
> really belong in ASSUME_PROVIDED. Recipes can assume that the host
> provides the bzip2 *command* but not necessarily its headers and
> libraries.
> 

Maybe try removing bzip2-native from ASSUME_PROVIDED in your local 
jenkins builds ? Something like 'ASSUME_PROVIDED_remove = 
"bzip2-native"' in local.conf.

Jacob

