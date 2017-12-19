Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE320784DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:38:40 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id f69so12888474oig.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ZKTTuTWJEBDhlt6iCnazXDCQSaIPjSXldRp++U8i7lk=;
	b=KUI05OjxE2Yy2XcmSEZGwrDS5elf5Dxz4kgfW29EfawlPI33L7onC4+yKAvZy/L5uw
	TygMvSExXCCx9L3g/jjYipARFiiHsFd7DKvKNrcCMh0F2gu/W0rXQkijBbs0l9Q/wonl
	bnrKVuN2M+Z7CNEFwlgI7S1rkwCgPxI0mniKlbcXompCzHxrrb0JCiYGhQaOYDYyFlLs
	GU15X6rGWI9bVSeg0ESqagEjXDLeRQBfsXuJbWVcccDaXi4ZAhBMSol1KteydYlLrOt9
	owSZ6t5yrbyiS0DVma9p8KEJmN/uTk03/W9tBbOJBAtyJng75m4Jk5Xa7kYyjaAerNlj
	MzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ZKTTuTWJEBDhlt6iCnazXDCQSaIPjSXldRp++U8i7lk=;
	b=E0Pcs88CAZA34isDqrdd611vK34+LST4HvU9SzFX4tfEkjPDHiaBB+kfHZt7c4RbFd
	IrceCTeH9xUF4qTlcJQVG2N/A96TMnUKaF8SLJz37Lot1qFE7P57KF8Pxm5BPiaaabb3
	yH1oMHfNSthCsIFxS/uL4Q+8eyih0+5L2kDNXxZBQEeQf1DupkiqkjTJQnltSHv7YnqP
	kG/wngnpNxyhA/HTyNsB2qcvliH7UcfMo3Br56lXm+oOnb7swsFhAlOSRo7zh06BohMS
	63yFsWCHM3FkP4l9eyLrNzM7//MLJ+NGkVFdhZA79Sym6ntT73zvWawb7oZ3qxAFW6V1
	tdeg==
X-Gm-Message-State: AKGB3mKe3v/2Hauj/tVczvq2y1quchQFOZ2A6gLS1qwi/6F2B6eCGonS
	74/MtmWBAjkVUdW6tKlPNyPxtPQY
X-Google-Smtp-Source: ACJfBotTBbjXDJGa/TdJaGgwJQy0SXJLksI/Wbt86iMdgERlaRWG83pRNT98VaH+AuZJbGGWy4u/Hw==
X-Received: by 10.202.77.142 with SMTP id a136mr2661723oib.292.1513705121169; 
	Tue, 19 Dec 2017 09:38:41 -0800 (PST)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170]) by smtp.gmail.com with ESMTPSA id
	n130sm6913499oia.12.2017.12.19.09.38.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Dec 2017 09:38:40 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id d44so7894373otd.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 09:38:39 -0800 (PST)
X-Received: by 10.157.14.215 with SMTP id 81mr2698719otj.284.1513705119578;
	Tue, 19 Dec 2017 09:38:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.41.233 with HTTP; Tue, 19 Dec 2017 09:38:38 -0800 (PST)
In-Reply-To: <1513704140.16507.66.camel@linuxfoundation.org>
References: <20171219171706.396-1-otavio@ossystems.com.br>
	<1513704140.16507.66.camel@linuxfoundation.org>
Date: Tue, 19 Dec 2017 15:38:38 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr8jOy7cWdAG4Trhv++X2V3HP7-NO=Ksums0M4ybZf4oA@mail.gmail.com>
Message-ID: <CAP9ODKr8jOy7cWdAG4Trhv++X2V3HP7-NO=Ksums0M4ybZf4oA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types_wic.bbclass: Ensure '-c image_wic' works
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
X-List-Received-Date: Tue, 19 Dec 2017 17:38:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 3:22 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-12-19 at 15:17 -0200, Otavio Salvador wrote:
>> The 'wic' image may use files which has been deployed (e.g in
>> do_deploy) for some partitions that may need to be copied in a
>> specific partition or filesystem (e.g a bootloader).
>>
>> When using 'bitbake <image> -c image_wic', from a clean build, the
>> contents of do_deploy must also be available so we need to ensure all
>> do_build of the image dependencies has been complete.
>>
>> Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  meta/classes/image_types_wic.bbclass | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes/image_types_wic.bbclass
>> b/meta/classes/image_types_wic.bbclass
>> index 222ae00433..4d7305a3a3 100644
>> --- a/meta/classes/image_types_wic.bbclass
>> +++ b/meta/classes/image_types_wic.bbclass
>> @@ -41,6 +41,9 @@ WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
>> os.path.exists('${WKS_FULL_PATH}
>>  do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
>>  do_image_wic[depends] += "${@' '.join('%s-
>> native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk',
>> 'dosfstools', 'mtools'))}"
>>
>> +# We ensure all artfacts are deployed (e.g virtual/bootloader)
>> +do_image_wic[recrdeptask] += "do_build"
>
> Shouldn't that be do_deploy instead of do_build?

Not all recipes has do_deploy. Wouldn't it cause problems?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

