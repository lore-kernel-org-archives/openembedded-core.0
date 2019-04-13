Return-Path: <mike@foundries.io>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2E647DAF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 04:56:13 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g12so6048765pll.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 21:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=egiHAJdC0O9/cMSlzx0yO6esLfH0FXnIqXo9tNlKEBI=;
	b=qCTa6+KTchB0VbJk/yAgEAzupTam8cubv65EXkwtAaaFYVi2XXmJIYBQXKbMzazrZr
	FbKeeoSe59cRY1mI9LmeeMh6kXKu3nKMLLDavWUp4yGHfv2h/1NcK09lwNKJE40E7o2B
	aR6FdCYjosngPcpA966Ud2lFFn8KYnxmWC8Z7A+bmIHA2iKzz9rhOQijxzfgjrIG79IA
	n5bGOV+IjwdJJH54baGNxQnlTXn8kn+AMMq0JajXC3cW9woRW/zqJQ2EpVL0lhz8BSIY
	ppGoHGFjRsDuq0BmXhAzg00PAqU1PBhU/rKPKowglJHkSz9+lIda8rQnRokPpkoxZZk/
	STpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=egiHAJdC0O9/cMSlzx0yO6esLfH0FXnIqXo9tNlKEBI=;
	b=V4dep+9YpjRXaYG2zbL35aNLiipgqQz7w6W3GGycOfzlrwmpmRWR0L+lVY5f+efKJP
	RcE5AUq1QpKnMRtnYJaEO4cfItvzNitGWbFXTixHjWtHu5IU50mFZfyXFunXX/xEHn+h
	BTmyjnLOrRilJMSkx3+4MR6houh28Xvd6m7JM01ya9OSTGfnel9K8pWAXuxsyTYD+xSM
	F1uS04yGQ9yofDd+PyDZ1OCHh8iiryZbomo1IPDz3FOzW39E6jgudVVqwpPsRs/jsnow
	adxUlaC8j4Cid0DKaKp9vNKoNEnyZC6VCktEc5NVMYbmescCatfWqsi4MS0hJLUsYPcX
	HVBA==
X-Gm-Message-State: APjAAAXJIOJ9t9vjxtHZwHhfMqltit31wXgDjS7Yc42B/nOaRI8Ejbik
	NSNADwCQP1XesbzcCdTijnk37f8PHMs=
X-Google-Smtp-Source: APXvYqwdlqJUU7v+K+GO7DPhHY9terGCMV1/JS1RqlM8G4/gHJ1osArg2BLOl5XC4oArN469Gr3kbw==
X-Received: by 2002:a17:902:7594:: with SMTP id
	j20mr6415986pll.272.1555131374476; 
	Fri, 12 Apr 2019 21:56:14 -0700 (PDT)
Received: from [172.20.2.133] ([207.183.242.50])
	by smtp.gmail.com with ESMTPSA id
	u6sm40371502pfm.10.2019.04.12.21.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 21:56:13 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>
References: <20190412054625.9447-1-mike@foundries.io>
	<CAKmqyKPW93Z5ovf3kLe3VteXNEr0Z45YUNShakwcCN7bJvnG9Q@mail.gmail.com>
From: Michael Scott <mike@foundries.io>
Message-ID: <2cc02705-6ee2-cf74-1e87-7865b6d790b1@foundries.io>
Date: Fri, 12 Apr 2019 21:56:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPW93Z5ovf3kLe3VteXNEr0Z45YUNShakwcCN7bJvnG9Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Sat, 13 Apr 2019 04:56:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/12/19 10:17 AM, Alistair Francis wrote:
> On Thu, Apr 11, 2019 at 10:46 PM Michael Scott <mike@foundries.io> wrote:
>> Support RISC-V kernel image, using the "Image" target.
>>
>> This change allows RISC-V support for fitImage via the following
>> flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
>> with ramdisk and dtb).
>>
>> This was tested using QEMU RISC-V 64-bit.
> Do you mind sharing how you tested this? I would be interested in
> trying this as well.
The current OE-based manifest for the Foundries.io Linux microPlatform 
is found here (v42):
https://github.com/foundriesio/lmp-manifest

However, I think you're interested in seeing the 
opensbi/u-boot/fit-image work for qemuriscv64, and that won't land until 
v43 (along with kernel 5.0.6 update).

It should be ready in a few days.  I can send you a private ping then, 
if you'd like.

The documentation is here: 
https://docs.foundries.io/latest/reference/linux-building.html

- Mike

>
> Alistair
>
>> Signed-off-by: Michael Scott <mike@foundries.io>
>> ---
>>   meta/classes/kernel-fitimage.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
>> index 2517d75746..2820ff9689 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -10,6 +10,8 @@ python __anonymous () {
>>           uarch = d.getVar("UBOOT_ARCH")
>>           if uarch == "arm64":
>>               replacementtype = "Image"
>> +        elif uarch == "riscv":
>> +            replacementtype = "Image"
>>           elif uarch == "mips":
>>               replacementtype = "vmlinuz.bin"
>>           elif uarch == "x86":
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Michael Scott
Embedded Software Engineer at Foundries.io
"microPlatforms™ for Connected Products"
E: mike@foundries.io
W: https://www.foundries.io


