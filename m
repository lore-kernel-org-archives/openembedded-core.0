Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 435B571CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 01:01:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f4so848081wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 18:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uXo9wgLw6nkgsdoyLP9c8ajR9j6m4GlXVTJ+N9Eb+m8=;
	b=epQ/clVzA9c3Cm22vBicvWbOtVYUvcfK66RPRLjtW80rdf++3heEOUEx/dd+r8C51B
	s+jdh/0z8kEv/hlP/gpw/Cqd9yz9nGHa0CMiSgG6yhVOjcsB+C4rv+zpWvv05sHwfV4Y
	DPpRuvOjFw/lgJQ8t1VFbkFaU9X4qJht/a8n5cMaPNbYCulAM9l209cgfaV9a36HLPLG
	IC1/Vk0k99AEyTQH2/RnN9kegZUSLZjxkThrbqigMBnsAhLGGouDwtIQ+UwucIodqG28
	3nlRwWB6HsucdBIP4AG8mS6llIcpCgpwSqzdpWF+NDKF6cfHJH0g3b9/xpsxey6L7B+5
	ThRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uXo9wgLw6nkgsdoyLP9c8ajR9j6m4GlXVTJ+N9Eb+m8=;
	b=oBaDWPayJFnWxnMWawNynbopf4gcWREi9DIBLWsHWKhhTrDuBN/xfEuxNqoaVU4iIv
	Q99x3TONZV4AXdUSdqE85x7wMtOTGl/nTIRF3FM3PlkPnBNduGSVH5XuO11zhoT6mc7y
	SBmyzZdATrsznxB4ppoqof++2k79yj0JVyYC4MSqvXTXFJN/BXf9K5bo22CWKFTPJc/6
	Imir1B38DN1QX7q5ADcfkCIG59o1onK4n6q6EurKAy98YMmVhFVnZ5b3RbVuPi4+JbX+
	Iik4bph6Imr85DAcnR6v80Y/pckVhVuO0uqq1lIDMSnfZQmr00fpSVZOW7y0VuIiPgws
	lNDQ==
X-Gm-Message-State: AMCzsaWfIZxqT26QwxoaHuNdOo3Zu9xSNvQlBY4fTT4epaFxrYIzutO5
	t6/829xT3c7Ll/GGk1qBzR28QXPH3++tT1b0xX8=
X-Google-Smtp-Source: AOwi7QA9sV8IWtNfCCyJhF97So8V3mzovs7hwPaXy071yO0BfXtK+k2eZjXGL7xndOcnob6tzC7M76gqPM070qepAyU=
X-Received: by 10.28.91.75 with SMTP id p72mr9360629wmb.89.1507597303761; Mon,
	09 Oct 2017 18:01:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Mon, 9 Oct 2017 18:01:43 -0700 (PDT)
In-Reply-To: <d31de312-7137-d95d-7cf6-2f15ac4ac1b6@linux.intel.com>
References: <20171009141227.21795-1-otavio@ossystems.com.br>
	<d31de312-7137-d95d-7cf6-2f15ac4ac1b6@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Oct 2017 18:01:43 -0700
Message-ID: <CAJ86T=UGY1LciuKpDvpDFot8fQaJHaQEGp=N0zVHo9nMP+4vJw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Tue, 10 Oct 2017 01:01:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 9, 2017 at 7:13 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/09/2017 05:12 PM, Otavio Salvador wrote:
>>
>> -LIC_FILES_CHKSUM =
>> "file://Copyright.txt;md5=8d8c7bc32f8797d23f5cf605d9339d2d \
>> +LIC_FILES_CHKSUM =
>> "file://Copyright.txt;md5=24600643e5d1d2b8f7478ae5c9074949 \
>>
>> file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"
>
> What has changed in Copyright.txt? If it's just the copyright years, you can
> exclude the line using beginline/endline.

The copyright statement and copyright year(s) are part of the license.
Slicing and dicing the license text to get a consistent hash probably
isn't the right approach.

