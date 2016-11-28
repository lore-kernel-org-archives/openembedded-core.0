Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3094960722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 11:01:10 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id t196so93329312lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 03:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=6hYr4BUZAKEJydbniKxlDlNexujdxxi8WRPD6GjUAwc=;
	b=CJNLYjaJcPmqyEQs1wKtRQP1vqYPw2/JDe1rsrQuYw8YuhA+/fDoH+IYhnL4PTF66J
	TUP+rJblz/lXC1JdkhERPdKfpG0RGjktDNkWX7rCYRdW+VW5xJkvaPN1QC2oa8ku2dxl
	XuB4Toxuoi3Xh5mmBy1232+qIn3/ZEsiQ7+cAIqUJ1E8/wSt/5MYCtEnDxpCeWl732Qk
	x/36y9Ff1L1+KZ8eEOUoIHiMi68foKGtmev/dIkVMyRzU7PNzWTqhy29DfMLQN8nFfEA
	/ljOpdJO9UMQbeG5z7TA7yepl+qc4OuiOnE+tiVtrQYVnEhd2t1xx2jts3kytL7WIgzH
	ue/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=6hYr4BUZAKEJydbniKxlDlNexujdxxi8WRPD6GjUAwc=;
	b=kBHDCQh2cK7ZK9sDxi7loCDXlgskznI/RTuQTosxghLQlofHWwo3Dn2gODk7INpNm+
	7J+QCHpQmQEgWNikMkWIFsbPZB+NDRG9jzkkpmdWebR/MuCUJ/vRfK3e9POdhiwTHppJ
	UHWt8le6chfoHR1nmoyzHvj+EpI7TYv/08xT1hs0YreZiiAWAssMfJ6eM/uB7HXDGct1
	gfAn2FMsVjRhWaIKklOpI+DMlbhR+slP/fdT8qWkSQdTOyJnhKkZ0Yt/11XoFOJF2XQ2
	vM26/DtxUc/7t/T3MHfjrZfrq9IyoC5Yp8ZVPzRwv/BXeFBf+9BNE/An5UbxwlQekCxJ
	lEHw==
X-Gm-Message-State: AKaTC01nA21qQsnIifFP+LnLeTpevT09KU4Mst5BEt32Ve4jvIKskkUkm7hjrTgHQOtA0g==
X-Received: by 10.25.19.106 with SMTP id j103mr7944893lfi.68.1480330871114;
	Mon, 28 Nov 2016 03:01:11 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	f25sm12711996lji.47.2016.11.28.03.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 03:01:09 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
	<20161128105236.GB15660@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <ae35149f-dc2d-fea5-e59e-a65dd3dce0ec@mender.io>
Date: Mon, 28 Nov 2016 12:01:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161128105236.GB15660@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Mon, 28 Nov 2016 11:01:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 28/11/16 11:52, Ed Bartosh wrote:
> On Mon, Nov 28, 2016 at 08:15:26AM +0100, Kristian Amlie wrote:
>>>
>>> What's the reason of insisting that path must be absolute?
>>> May be it's just me, but I find it a bit scaring to use absolute path in .wks
>>> The patch is relative to the rootfs directory from my point of view.
>>>
>>> It also looks quite strange in the code to insist on absolute path
>>> +                if not os.path.isabs(path):
>>> +                    msger.error("Must be absolute: --exclude-path=%s" %
>>>
>>> and then immediately making it relative:
>>> +
>>> +                while os.path.isabs(path):
>>> +                    path = path[1:]
>>
>> Not really any strong reason. I just thought it was a logical thing to
>> do from a user perspective: When you're making an image you're thinking
>> about paths in the final image, and the path after "part" is absolute,
>> so I thought this one should be too.
>>
>> The fact that it's made relative in the code is just an implementation
>> detail to make join() work correctly.
>>
>> I'm fine either way, so just let me know which you prefer.
>>
> I'd prefer relative path as I think about --exclude-path as a path in
> the source rootfs directory that we want to exclude from copying to
> the target partition. However, I agree that that it can be also treated
> as a path to the target directory.

Ok!

I will get a new patchset up soon.

-- 
Kristian

