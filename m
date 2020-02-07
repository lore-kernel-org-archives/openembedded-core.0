Return-Path: <scott.branden@broadcom.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B43D860D2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 23:15:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b17so4568079wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 15:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=zN96iyD/9wgSQUX70sueZgcrUXeiRGepF1jDgp0dNGw=;
	b=WFIXkxISZlxqvmP2vPfZYLPV6mgYfx6H7XJomyW+OPZCpO7x6gRtCXxk63PEr/j+lU
	mAh2LUyexuzdujAMSZVgX/KgOP3ij6rIBSt+pJJ8O+fAjqpn2fOFxb3NEoERPbgn2sOh
	D6TdMKqBBH54Wo2W+0gCk/3n/fGI4O5jTN7rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zN96iyD/9wgSQUX70sueZgcrUXeiRGepF1jDgp0dNGw=;
	b=IvpsFb4TO8thgVEVv4lSD86P7Y7U/942LstXKP1JvNZLcAJ08hOcBw8IZVRDZkBAH3
	AYeA0RedgMQca6fbssJWjfvTCSeyMQCMqBWPIgAbRUKkofNsRogPl450+z4mDkch9Dfn
	qf5K83nuq9nguaFaLcCFsF6Atr4d3sy1KkbH7K+Za5HfU++AI1U6u0lfC+3dIO3yj7SA
	RTUv4ui+c7cFvIf3EXbGrOmp1Anm+03FifXEtWQlM9SyTc2+8rlav/ErAdj7w5ciQ9rn
	3c+GRYWhUaaN3OtXOJybUom2F3Qx76upuhrB8QAjiLlWHdFPBegaw3vnIb3MIKTTKIFA
	oB+g==
X-Gm-Message-State: APjAAAWhat1Pz2pM+15bPT2HNJ1QaYQMYS+BUjkO/0rDEnQZieTRY/n/
	+FLzKiXJxJnuyY5nfoQzo4+/SYMoptYsnGeMY4r0xg4sltVjsCG/dWVesxb0xrYsrcHWJFv3UNo
	gkyme5tvL561KmPn/ckLaKMScfPR1GBeNRfdCHVCbPcQl1z3o+on/sZ3ALDCclHScd8TK82PybC
	8LZTmi5mjjChTY7SZWwVqyEyGg
X-Google-Smtp-Source: APXvYqxWIyDPttrTYle+9d2zkPwhk4oiLYVPqlMvcu2Thiwsh7lSSJVUjdWuS0BoAo3z4HlGkkQflg==
X-Received: by 2002:a05:600c:2406:: with SMTP id 6mr605127wmp.30.1581117316854;
	Fri, 07 Feb 2020 15:15:16 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id y1sm5229841wrq.16.2020.02.07.15.15.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Feb 2020 15:15:16 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20200207213440.10462-1-scott.branden@broadcom.com>
	<CAJ86T=XEWm-VKdU6LF_efuBsSuFRnu9weNTX7fg0hLLsOZZkyQ@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <42ff44ce-e535-b15c-9c06-c73926ace066@broadcom.com>
Date: Fri, 7 Feb 2020 15:15:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XEWm-VKdU6LF_efuBsSuFRnu9weNTX7fg0hLLsOZZkyQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x265: add x265 recipe
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
X-List-Received-Date: Fri, 07 Feb 2020 23:15:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2020-02-07 3:08 p.m., Andre McCurdy wrote:
> On Fri, Feb 7, 2020 at 1:35 PM Scott Branden via Openembedded-core
> <openembedded-core@lists.openembedded.org> wrote:
>> Add x265 recipe from latest revision of stable branch.
>>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   meta/recipes-multimedia/x265/x265_git.bb | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>   create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>
>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
>> new file mode 100644
>> index 0000000000..7c230e2b1e
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY = "H.265/HEVC video encoder"
>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>> +
>> +LICENSE = "GPLv2"
>> +LICENSE_FLAGS = "commercial"
>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>> +
>> +DEPENDS = "nasm-native"
>> +DEPENDS = "gnutls zlib libpcre"
> What's the final value of DEPENDS you are expecting here?
Started from the x264 recipe - will remove "nasm-native".  Thanks for 
noticing this.
>
>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
>> +          "
>> +
>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>> +
>> +S = "${WORKDIR}/git/source"
>> +
>> +inherit lib_package pkgconfig cmake
>> +
>> +AS[unexport] = "1"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


