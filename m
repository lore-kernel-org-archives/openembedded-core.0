Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id B35CB78220
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 15:47:12 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id c189so3558692lfe.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ZiKaSEjkDMLHmQNw2cnkrlBSDFnty+WTEcvOClyDdlU=;
	b=TTF3DDF7Ej9s8gARUr0qUWwFnPEQXnv33eXEZl17CJHtJj0y7YSINPp1jxzANQRi+P
	pxG65wBNH2AMGKDNfqC0Z+yGE13A7CGQ50umhHZ05zn33inUD4XPLEoR17CE7kWO9ntY
	dDhFrqO9O9FVWbxbFIoVGB8D8fUP39JRAK7BsYhog9tcl911XhfmT7wjXtlTZ0jU32A6
	D6Ge2ebIsg3aMWp60S9pMUmfTh7zAMqSo1+YEDv9o/9qEGMdusv66xduPrKj2zJ9YuFi
	3S0F29N9xTuu1jrhCqHzquhfaEHGjSq10RJn6Y+d3mAXw+rVnqwQU+k68YzqzKvh37oq
	JLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZiKaSEjkDMLHmQNw2cnkrlBSDFnty+WTEcvOClyDdlU=;
	b=oazO9QE/NfhUEFhvRYyNqWiIKsSu3Jvr/zVrAAX1aMHMGD74YLaMiVp/6zUXjhx0Bd
	d3Tfq5I6ZxZSzhooeEj5pUcPJIWCKxGqXmmAHjKQoGSGYK/jbIC8y2z56Hx7/HCPSlet
	8JRwIuv8EQ+0is5JY78uS00SDYCMK4sZecMEaW4/ixcgqBma1rQHdkAO+kAWKu/fophS
	vM7Zqn4biIExsrWhmJrfRnPcm0ilLzjlT1O90eIrmC8BrWgmNGRnYhIAToxU8XE+zdlm
	M76UC8LoZe4mVaKAnj+xEjSWsPt1Cpw/n8xU017ceT/XI0X7gOcZJBWBW8QwzoTZFXDv
	DUow==
X-Gm-Message-State: AHYfb5gN0utihLYzIaJA3D+xhg/iv5qaxcj27BPHARaWnQ8wvPAuVll6
	K4ayM6me/4eIFf7C
X-Received: by 10.46.83.29 with SMTP id h29mr418700ljb.10.1503935233190;
	Mon, 28 Aug 2017 08:47:13 -0700 (PDT)
Received: from [10.20.33.249] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	n26sm129805lfi.21.2017.08.28.08.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Aug 2017 08:47:12 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1503488763-1554-2-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-1-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-2-git-send-email-kristian.amlie@northern.tech>
	<1503492432.32591.155.camel@linuxfoundation.org>
	<a86ad415-8cd7-d037-0e7c-183ff2662911@northern.tech>
Message-ID: <deabfcea-aa87-d925-1380-249127905c57@northern.tech>
Date: Mon, 28 Aug 2017 17:47:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a86ad415-8cd7-d037-0e7c-183ff2662911@northern.tech>
Subject: Re: [PATCH v5] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Mon, 28 Aug 2017 15:47:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23/08/17 15:19, Kristian Amlie wrote:
> On 23/08/17 14:47, Richard Purdie wrote:
>> On Wed, 2017-08-23 at 14:39 +0200, Kristian Amlie wrote:
>>> From: Kristian Amlie <kristian.amlie@mender.io>
>>>
>>> This is a direct followup from the earlier f6a064d969f414 commit in
>>> wic. It works more or less the same way: The variable specifies a
>>> list
>>> of directories relative to the root of the rootfs, and these
>>> directories will be excluded from the resulting rootfs image. If an
>>> entry ends with a slash, only the contents are omitted, not the
>>> directory itself.
>>>
>>> Since the intended use of the variable is to exclude certain
>>> directories from the rootfs, and then include said directories in
>>> other partitions, it is not natural for this variable to be respected
>>> for image creators that create multi partition images. Therefore the
>>> default is to ignore the variable, and image creators that create
>>> single root filesystems need to set
>>>
>>>   do_image_myfs[respect_exclude_path] = "1"
>>>
>>> in order to honor it. Specifically, "wic" and "multiubi" have not
>>> received this variable flag, while others have.
>>
>> I have to wonder if this is implemented the correct way around. Would
>> it not be better to mark multiubi and wic as not wanting this feature,
>> rather than requiring every other image creation method (which may even
>> be in other layers) to set this?
> 
> The idea was that people in downstream repositories (other layers) are
> more likely to have their own complete image creators than to have
> filesystem creators. So rather than requiring all of the downstream
> repositories to opt out of the feature, we opt in in the filesystem
> creators which are mostly contained in OE.
> 
> Or so was the thinking. Not sure if it's a good reason though. I can
> invert the behavior if you think it's better!

Since I heard nothing more I assume that it's better inverted, and I
kind of agree as well, the patch is much smaller. So here follows the
next patch, the changes from the last are:

* Inverted default of the respect_exclude_path flag, now on by default

* Added a debug message when it's turned off, to lessen confusion.

* Documentation is now stripped out as it should be, I will send it as a
separate patch as soon as we've concluded on this patch.

-- 
Kristian

