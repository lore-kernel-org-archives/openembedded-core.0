Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0687F746FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 00:14:21 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e12-v6so20668160iob.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 17:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nmZ7R+bpwbPI3EMsjkZ2FMtIhN8ugGxLGSvASMYRUgY=;
	b=zezDpod6ElKf+SqQJ6W9tmWPBa2q2qEoDUdJlTxN/3Nhij9xut6evvWht3R1gqNO5Q
	Wy+DzoLX3NyWKUMrbNIupgNb53TP3PD3mmlS3/tXn821WkkuzzeRPfmHP2KwUZ+x+qvy
	2DstoJx98b9kyS8U+ylKT9WxwWnBvIzF4Xc6U9lVJCrIdeIU6pFuU4UtC9sm7Wnd8Ohm
	3hzh1gwbA3ZFFxDxph2AvYvY1jg/sAr7tiplq4Xb6+lb/LRHpV9ercZcbodklw+Mp9qW
	IxMdZywR4UUD8dG+LICyHaj/wNYzonGOoXRWlXuqrnk1vgzC8tlcXN1zmrsBWn9rFxp6
	NB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nmZ7R+bpwbPI3EMsjkZ2FMtIhN8ugGxLGSvASMYRUgY=;
	b=EZ0UhWup3+SzUOwES7gCichjw1upq+KPpFvdUxgQtK1fRnkJBJFFvlFfND+2vdeGrC
	9myt+dYgkcKzm0o/uzZiBTNvkjPh6wU6b2/Bs8Sn0DLqpM7I3JfLP0jU5Fx7KN6Z+d+/
	Oj5U17W1Bl2wLSslcqHD71dx+fhcLDeBo9JYCUUb2op493gmtQ5BWYAHZxIkdqiQVNJr
	C7lMjKJuJjzcUYinvcQp/9CwREraSgJiL6N8JT2QhBVHHuujQsk6THkT24YJf/tIVW4H
	SppjdfJsXJ43y09AgZ/WSx3H5dOr5yDMJtixdwyq4jiRfDUa9OMmGu4UrJqPuk80bdKs
	9fXQ==
X-Gm-Message-State: ALKqPwdBE6NAJ3CYylVDU4p8siYWr9MwpiOtsRM0g4J6OyJ5Cn3ZcgtP
	UOZ8h4lS5em+Nd7QyJKAdqywERFfBpxu9g57CMIlgQ==
X-Google-Smtp-Source: AB8JxZqkHhsXmwN+MT1pO+Gw0C+AerYv7Q+ltM23c0SKIumvNQf/YRS+GzP+E9Rr6LlUZ+NuuKnuJQ8T4KNQUwDczLA=
X-Received: by 2002:a6b:5507:: with SMTP id j7-v6mr602192iob.23.1527034462944; 
	Tue, 22 May 2018 17:14:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ef0b:0:0:0:0:0 with HTTP; Tue, 22 May 2018 17:14:02
	-0700 (PDT)
In-Reply-To: <CAKmqyKM1cAX-6ZjgEb2r+4_K-PDdUgcq-Zodr7=cfdkQpzvNsg@mail.gmail.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
	<CAKmqyKM1cAX-6ZjgEb2r+4_K-PDdUgcq-Zodr7=cfdkQpzvNsg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 May 2018 01:14:02 +0100
Message-ID: <CAJTo0LaCHutWfBe+zW2dF3JcO4ODzcHa72U96Ta6fPj1SnGpyQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Wed, 23 May 2018 00:14:24 -0000
Content-Type: text/plain; charset="UTF-8"

Bruce, can you review this please?

Ross

On 23 May 2018 at 00:45, Alistair Francis <alistair23@gmail.com> wrote:
> On Wed, May 2, 2018 at 1:49 PM, Alistair Francis
> <alistair.francis@wdc.com> wrote:
>> If the user has set numa in their MACHINE_FEATURES we should enable
>> NUMA support in the kernel config.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> Ping!
>
> Alistair
>
>> ---
>>  meta/recipes-kernel/linux/files/numa.cfg  | 4 ++++
>>  meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>>  2 files changed, 7 insertions(+)
>>  create mode 100644 meta/recipes-kernel/linux/files/numa.cfg
>>
>> diff --git a/meta/recipes-kernel/linux/files/numa.cfg b/meta/recipes-kernel/linux/files/numa.cfg
>> new file mode 100644
>> index 0000000000..bb0f9ab20c
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/files/numa.cfg
>> @@ -0,0 +1,4 @@
>> +CONFIG_NUMA=y
>> +CONFIG_ACPI_NUMA=y
>> +CONFIG_NUMA_BALANCING=y
>> +CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 3bb872a32a..e8fb38b8f4 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -28,6 +28,9 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>>
>>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>>
>> +SRC_URI += "${@bb.utils.contains('MACHINE_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>> +
>>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>>  # by the kernel. This is typically the branch that should be built,
>>  # and it can be specific to the machine or shared
>> --
>> 2.17.0
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

