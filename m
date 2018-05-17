Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 25E376079E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 09:56:35 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id a10-v6so1282965ioc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZSaqe5GqATFzrFd7MmYOMYwP9417HxG18nKdXqlhupU=;
	b=vWpOWwpNRnqebLXfwOc7r84F6i8wXnd836I64nO0g0t1bs0l7T3U6k1PPHa4bnayK3
	FaNXkK9j07XfECLyySI46yBe8aebd4P4AdPJuxVPgFcFocVouFyK4RI5YEMK4DP6itdL
	WyRCeuxa5Orp/j2v4Lt8Hg9/rJkAElYszSUFrOUrxa9sfnqNt09nA7W2xRCcB1AYgyLj
	6lAVnSkxutmoxwA5FIsXNcrANEeGRWacpvQAYONWA8lE8xw70jW8km5/+ut/q5NC9yVV
	iqfvH5roswuhC96VnL5Geu2Dq26k3DHRyYedz5drj4MA9jK4T1ERGpB1xnqNBLUouU4g
	I3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZSaqe5GqATFzrFd7MmYOMYwP9417HxG18nKdXqlhupU=;
	b=k9yP3Jz2ot27BCCgzBAgw43acKWX1VjJOeYlynHRCqZzjfLp9zSxjNSetYVwlxZpGb
	je++41BnZm2IUBwRgVMQHWKqYRVlXY5jOE8OlZqCd2nuVI2XOo2BQoyIyPs6ADlRVmQn
	CYXRY3WT9rA+62wskzPdjPkCTtmOnjz6h44pqQy4b8jD968fAqbjc8vu0JU7mN31v22o
	brP1LOpxPMjfJ1eP8z8aiUNu1JgyyUlC3yzfMzFlojnUrYvqEx66i74YcW322nwDAnT3
	zZvKaE7OSWr+lsEDRqaxhGOOfcWD76EV19AhHxCQLmQgyGBn+XWtI51q/RY85NQeO/5h
	fxZA==
X-Gm-Message-State: ALKqPwdjypCbGLPT6qH4oNxcW6PISg+OJHY2XZtRVk4rPNibuEiklSdT
	USbEsTls2n6ft+0Uiu/rki+1iBg3FbTQuf/0hK4bMg==
X-Google-Smtp-Source: AB8JxZp5hBRYledPCb1C1fENu6ZvBFalxPg3I1zaMs9uGkibliF8AGF8xZeV7am3YzRPA6upAI7kvpweFla3epsMY1w=
X-Received: by 2002:a6b:5507:: with SMTP id j7-v6mr5358044iob.23.1526550997093;
	Thu, 17 May 2018 02:56:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 17 May 2018 02:56:16 -0700 (PDT)
In-Reply-To: <b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 May 2018 10:56:16 +0100
Message-ID: <CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: auh@auh.yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Thu, 17 May 2018 09:56:36 -0000
Content-Type: text/plain; charset="UTF-8"

Looks like AUH runs as a x86 machine, which is why it doesn't catch u-boot.

Ross

On 17 May 2018 at 10:40, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 05/17/2018 04:13 AM, auh@auh.yoctoproject.org wrote:
>> Hello,
>>
>> You are receiving this email because you are the maintainer
>> of *u-boot-mkimage* recipe and this is to let you know that the automatic attempt
>> to upgrade the recipe to *2018.05* has Failed(do_compile).
>>
>> Detailed error information:
>>
>> do_compile failed
>
> Well yeah, if you dont upgrade all the recipes, it'll fail ...
>
> --
> Best regards,
> Marek Vasut

