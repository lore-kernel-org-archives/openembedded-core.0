Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4100C77F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:44:21 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id s62so27610371ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 04:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=hCvpz4XozPbAQoOTg/xWvRgtnhjxBPch5yKjKD+95F8=;
	b=sdfyhkc8r3vPa8kGXidTW2koqDcNv+qF6oMNYNK1swIJVmkwze0SMoz0SDehi1bH/G
	AM3Ep7z1RBRPgkq3XMS6kREDwI1C97o5/3zDgPf9vKrybYOEfIYp/ijcbcYXlSHgb4HT
	Yko/aWLNR3eNXuzMRRiNVUQYvR6DtTIuW1squyiA6b9rd5Ia02NFg2L7dUlCr2OFRQEe
	DUpjVPqrXrdmfOf8RCRr//jBVJMUSt+xKEE4J5wEjNGwaswBjGPGFiMFMYBwoTGVO6up
	4v+NE211L7uSGdM5iHrQMl9M0X9YxpSPZtOSxiz7A/MFNExm7QG11A6brdSTkH9tDh3o
	n3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=hCvpz4XozPbAQoOTg/xWvRgtnhjxBPch5yKjKD+95F8=;
	b=T8xeNzVeNP0u0MBnpKv9lJOa0wf4pd1DVwakM0LRChAD+xyrp/NzVUHk7VzpNVBoaM
	1L1fo8Utcz/stwiybT/2QstXPnfz3cyeb8IkL8xMKRQpc9Jt7OQEypWZyps5OuSGePTD
	n2ePKXv4wWpRVEymdRJBIIUli6nuYpF7T9VmFHi/0PhH9REATXyMlD1izOk2kGK8auVu
	3ffMGaM5Ae6d2FV3y0WQDHgaqD6p4w7Ss4e7T9qhK+KzHHPpUIUeYwnpXplSbga9EnhC
	fh3OSici3j15JAF4IJSBrWkPuyYs7/4NH1r3eacVNExrWB8Erhi3/qSM+JNiSObRLDBh
	QQGg==
X-Gm-Message-State: AHPjjUhwOyi53kQzFcbpub4AWifxUGHsx2rYO8sUGJ1m0+OEisnGuS44
	SblennBvF3qrHp4ggOA=
X-Received: by 10.129.118.84 with SMTP id j20mr11828926ywk.38.1505216662900;
	Tue, 12 Sep 2017 04:44:22 -0700 (PDT)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180]) by smtp.gmail.com with ESMTPSA id
	h186sm3875391ywh.52.2017.09.12.04.44.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 04:44:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f180.google.com with SMTP id v36so32099017ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 04:44:21 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAdDoPrCz4vlbeCR0HLiCP1OIuvCDSrV7LdEjOIuGatbtWxJ9WkomHtRexcg4+Rc77UeLlvAntI7qVmp6Xzx1c=
X-Received: by 10.202.83.10 with SMTP id h10mr13888144oib.56.1505216661186;
	Tue, 12 Sep 2017 04:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 04:44:20 -0700 (PDT)
In-Reply-To: <1505205241.18640.14.camel@linuxfoundation.org>
References: <20170911211807.21269-1-otavio@ossystems.com.br>
	<1505205241.18640.14.camel@linuxfoundation.org>
Date: Tue, 12 Sep 2017 08:44:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr8m5Uih5jrzsGJmqXTmq5croxejYXiRbtarBkyLQUAgw@mail.gmail.com>
Message-ID: <CAP9ODKr8m5Uih5jrzsGJmqXTmq5croxejYXiRbtarBkyLQUAgw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 1/2] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Tue, 12 Sep 2017 11:44:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Tue, Sep 12, 2017 at 5:34 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2017-09-11 at 18:18 -0300, Otavio Salvador wrote:
>> The Device Tree is commonly used but it is still kept as a .inc file
>> instead of a proper class. Instead now we move the Device Tree code
>> to
>> a kernel-devicetree class and automatically enable it when the
>> KERNEL_DEVICETREE variable is set.
>>
>> While converting to the class, we reworked the compile and install in
>> tasks as well as run the build of the Device Tree files in parallel,
>> if possible.
>>
>> To avoid breakage in existing layers, we kept a linux-dtb.inc file
>> which raises a warning telling the user about the change so in next
>> release this can be removed.
>
> Sorry but this patchset doesn't appear to be well tested and has big
> issues. For example:
>
> https://autobuilder.yocto.io/builders/nightly-x86/builds/497/steps/Buil
> dImages/logs/stdio
>
> I'm going to guess that do_compile_devicetree is racing
> against do_compile_kernelmodules. Debugging these kinds of races is
> tremendously hard and taking a patchset on a key component like the
> kernel at this point in M4 where this hasn't been considered is
> worrying/risky.
>
> https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/461/steps
> /BuildImages/logs/stdio
>
> another form of the same race? The autobuilder is full of these
> failures :(

Ok.

> I think if this patchset is to go anywhere it needs to be split into
> more incremental changes, one to move to the new file structure but not
> change the functionality, another looking at parallelisation etc. as
> the current approach of "this patch does X + Y + Z" makes review harder
> and makes it harder to merge any piece of it.

I will do; I will split to the patchset so we have a more granular change.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

