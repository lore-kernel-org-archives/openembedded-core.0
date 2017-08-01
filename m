Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 185B5782FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 20:39:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t138so4673563wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=E4RrNoCghp66gNToRX+MpoMsV70CMtIugNDdnOVFCm4=;
	b=Im7xDQ37tipwXsa5hdY4YLhGVfe7pGsuJKx0Iwu4RW7925ogWx1z/HMyYwGEHfoxCY
	JNHytkkOxTzFQso2P9QbMPIt3Ps2JnAo5a5AuApZ7hp+ZVqVcV8NE4kabNbTFCosUGMB
	pt6b980kUDxWL2rQ60bGOfwd9JcdVORIUWCtXfB+2Ifmdr+y3NdBYR6khCZIvf06Lwpx
	K9ZiTZbLLL0/ud0YCg4D3FidG0XbXxtMfSxXi8Cy/fnnmS0bSBS4W0Yo2h6dXuW3jqmL
	Xze9ibosKJkFdqOYCEaSyOaftBSKbo8C+Zxa0yARfU98FnH0bCROKMap3I5MG3sJieQ6
	gR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=E4RrNoCghp66gNToRX+MpoMsV70CMtIugNDdnOVFCm4=;
	b=WtP9vLy7vg/bcaGSUaRdW/8lGUlFp2ZQgi//GpZsHBuGp8rk6UE9+Pi7NKzX6oZjCl
	3kouaKb4kY9q+2CcdlSnr+xD/8fabYUwj6OJLAwKGDLIdFVNxLMzmWt+/y9h8f4XXc/m
	ejJLusDg5nlLpztOSK4YJzn5Ot/oV1ZX3QE8w4zzVr2jdAftwNikgFHM8kOCN6XskNGE
	MZ4YInHyO1hdx/veRZQwEsHvesbnehqBkjxNiJFHOVEZnvLLN5ywzYib0AwYb+sVL8no
	32qbtqRb4O5LpjStiCioUC3Z7N0tTmaJdoCb562sUKuyJbrtlJSyg33fKL99aGZQuBCE
	kHbg==
X-Gm-Message-State: AIVw113o8KrrJGLNIFJaz6U8HZ22YlVAh9fi8NHuCef5gy5VaFlBe07A
	fYXgI1CyAEerYYVq9l8=
X-Received: by 10.80.216.206 with SMTP id y14mr18361084edj.165.1501619972566; 
	Tue, 01 Aug 2017 13:39:32 -0700 (PDT)
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com.
	[209.85.128.180]) by smtp.gmail.com with ESMTPSA id
	q22sm3127282edd.64.2017.08.01.13.39.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 13:39:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f180.google.com with SMTP id k71so11254483wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 13:39:31 -0700 (PDT)
X-Received: by 10.223.148.36 with SMTP id 33mr17862017wrq.24.1501619971540;
	Tue, 01 Aug 2017 13:39:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.198.70 with HTTP; Tue, 1 Aug 2017 13:39:30 -0700 (PDT)
In-Reply-To: <1c686c58-c6d6-3235-be04-bf3da58d001e@gmail.com>
References: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
	<9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
	<4a2dc4e3-7291-ad72-838c-c54a907312e6@gmail.com>
	<CAP9ODKqTykvrXqC82Dyq2X_v7MOLbOormG2YCjFoyvxs2_iW3g@mail.gmail.com>
	<1c686c58-c6d6-3235-be04-bf3da58d001e@gmail.com>
Date: Tue, 1 Aug 2017 17:39:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrNzZ_UqVpP1F0Tpo=W372XxdMR3xyDwfX1Z8RTOey3yg@mail.gmail.com>
Message-ID: <CAP9ODKrNzZ_UqVpP1F0Tpo=W372XxdMR3xyDwfX1Z8RTOey3yg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Anton Novikov <a.novikov@yadro.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] (morty) Arch Linux build fixes
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
X-List-Received-Date: Tue, 01 Aug 2017 20:39:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 1, 2017 at 5:33 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 08/01/2017 01:32 PM, Otavio Salvador wrote:
>>
>> On Tue, Aug 1, 2017 at 5:30 PM, akuster808 <akuster808@gmail.com> wrote:
>>>
>>>
>>> On 08/01/2017 02:50 AM, Ian Arkver wrote:
>>>>
>>>> On 21/06/17 10:05, Anton Novikov wrote:
>>>>>
>>>>> [3 patch attachments]
>>>
>>>
>>> only one patch is missing
>>>
>>> "fix case fallthrough and printf overflow warnings"
>>>
>>> the others I already had from other back ports. all are in my
>>> akuster/morty-next.
>>
>> It has been there for  a while; what is holding them to be applied?
>
>
> clean build in the AB.

What are the errors? maybe we could help.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

