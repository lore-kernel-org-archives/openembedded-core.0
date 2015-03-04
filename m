Return-Path: <naresh.bhat@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4300E65C88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 06:53:28 +0000 (UTC)
Received: by labgf13 with SMTP id gf13so17902535lab.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 22:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qqMdzQ7VDSSLMmlnTenyYwNVFiXIiaviUptmgEApo2M=;
	b=Mm3ODn76RY7P0J8PxSxRkJ5tGPmEw0/4cXcH/QEkrhh7zTLJY+4iWqTQxvYLS2TN1V
	+6PLoj5dWPtMQ0UAsIfCyuTAonSgcXvvv22MS0tV8MGgQhOejkLxe1MFxfoAjPOO3TT/
	tWI7AZqsp1cN5EBkwchrgfqOY0KeMkxkZUmJVl5KAPfEz/5uEHb4Yz9dwoBnM+IvAg1R
	UvBdY+9wpmIqI3IytTMe/GaHrOggw1nLns1uvTN8QzEkYvFcRodBkMqxFIV6yUFNX4mh
	FuqEGZmqexJFvYMZXwWxbtqlGPmxT23yz2ELDUJFrfrJPZhsXTe0C8xlW28B0RUuPScv
	wHCg==
X-Gm-Message-State: ALoCoQkjM6tbTXrm/t2zZJBu9bguf5scoVm0KRIGtkvl8L+BtuBdRIFpmDQrlcgmPrhq/kHYxMo6
MIME-Version: 1.0
X-Received: by 10.112.146.66 with SMTP id ta2mr2271195lbb.0.1425452008977;
	Tue, 03 Mar 2015 22:53:28 -0800 (PST)
Received: by 10.112.225.172 with HTTP; Tue, 3 Mar 2015 22:53:28 -0800 (PST)
In-Reply-To: <CAC1BbcSV76Gd0HQZx0TzadSD7Nd+NSUecjaDmA2C9M_-aat-mA@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-2-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSV76Gd0HQZx0TzadSD7Nd+NSUecjaDmA2C9M_-aat-mA@mail.gmail.com>
Date: Wed, 4 Mar 2015 12:23:28 +0530
Message-ID: <CAFoFrHYFrwQWi9zJMFhJi-ESZbwM4k041PM0Yd=tVijmtsY9dQ@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 1/4] grub-efi: Add to support to install grubaa64 efi
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
X-List-Received-Date: Wed, 04 Mar 2015 06:53:32 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 23:22, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> Add to support to install grubaa64.efi binary for aarch64
>>
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
>> ---
>>  meta/classes/grub-efi.bbclass |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
>> index 47bd35e..455dc8d 100644
>> --- a/meta/classes/grub-efi.bbclass
>> +++ b/meta/classes/grub-efi.bbclass
>> @@ -37,6 +37,9 @@ efi_populate() {
>>         if [ "${TARGET_ARCH}" = "x86_64" ]; then
>>                 GRUB_IMAGE="bootx64.efi"
>>         fi
>> +       if [ "${TARGET_ARCH}" = "aarch64" ]; then
>> +                GRUB_IMAGE="grubaa64.efi"
>> +        fi
>
> Assuming you're adding at least the second call to test(1) in a row
> I'd have switched the whole thing to a case statement.
Thank you very much.  That makes sense.
> This would be easier to read, fewer lines and on some shells fewer
> forks of test(1), fwiw.
Agreed. I will implement the same in my next series.
>
> thanks,

