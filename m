Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 62F5260620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 16:36:00 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r16so6013572pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=9hFTEOO/Kj49EsgIYIt3xNYCphUOQ5tPteQQahhPOUw=;
	b=t9NziDb5dWTlNo+XwIevECahcF2lewEB5FPS2X7ggjd9bHxjJsos6KBndCKxI2EgAF
	dblyZEswgwVdDlZr1It2c631GYeUcLJ7Q1+Im+DrPgj5YG2QBWCyGMaCWE51SwPjFKX5
	B9OJ0aEfoHdI4f9gIVP/0SlEAHWvO8i2pKaquacrLwiw5oDX9FbqVLeOxV4oak+lkBZA
	StpKLq2mgnIwyes2lioq4SrLpoAyWZonaTItJw/48AeE4MsHKWII2sGj5I1HqAwR5GpV
	Uk97tbdIMarxHPHPbQ8QTAhtf4lUHh3VOZUGwZKWsls7IOSpeRiLzaPgGtHzx+Npf2qY
	UKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9hFTEOO/Kj49EsgIYIt3xNYCphUOQ5tPteQQahhPOUw=;
	b=HDqfcYIRSXFPUvq8prSzhqVwtrykaq22MszjSyXxUjeBBw6J4rDnbMFGSFJOSDfwJo
	Y0C1SFAE0yy4wk+NA/sRl5AQHojIzxuw+9GXZby0mapad/AMR/RYTBOeG1esWNlEyYIZ
	GMDtF19uztpIT91WkO5eT8qMlCQz0+Xl9ZG91AKSpnSX1G9jEy/cftVxJaCiJ1ufsOwv
	18xWzX1q/uwqkMwg10fMogqIvp5t9AwPBmTQTGJdtkISNqTCiqJHxPBKpRJz9l8Pm1Q+
	YUlRbrpSs01XGzEyEAQnXCNej859C89qgp4Ljeb8482A0xBjLfsyvYZpooc9wVGcq+3D
	/6/g==
X-Gm-Message-State: AA6/9RmMoeVst5xaoFPa5If1jlKtQr6SoZRj6l2LyhdqYzkebWJW7lhkgKiDVWFQUF0VtQ==
X-Received: by 10.99.123.1 with SMTP id w1mr2221364pgc.155.1476981362447;
	Thu, 20 Oct 2016 09:36:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:bc9a:54ac:66f2:66ed?
	([2601:202:4001:9ea0:bc9a:54ac:66f2:66ed])
	by smtp.gmail.com with ESMTPSA id
	70sm72874988pfc.50.2016.10.20.09.36.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 09:36:02 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<432da226-7470-bc72-8089-78e738f60657@gmail.com>
	<4e71b2b1-e293-81a8-b1cc-215789c0f7de@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <118a8c0e-65d1-df2c-cda7-8ef9ade6f826@gmail.com>
Date: Thu, 20 Oct 2016 09:36:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <4e71b2b1-e293-81a8-b1cc-215789c0f7de@linux.intel.com>
Subject: Re: [PATCH 00/19] Recipe updates and version check fixes
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
X-List-Received-Date: Thu, 20 Oct 2016 16:36:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/2016 02:16 AM, Alexander Kanavin wrote:
> On 10/19/2016 10:42 PM, akuster808 wrote:
>> Are these updates just bug fixes or do they also contain new features /
>> enhancements. Having a little more description in the commit will help
>> the morty maintainer determine if any of the updates are suitable to
>> backporting.
>
> They're both. The updates in master happen not because of specific 
> features or bugfixes, but simply because we want to stay as close to 
> upstream as possible at all times, because there is less pain in many 
> incremental updates as opposed to single massive updates that jump 
> over a lot of code changes.
>
The issue is not updating master. It is about following the process.
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Many of the changes don't comply to:

"Commit with a concise and descriptive message - one that explains your 
changes in a way others get a short overview without looking at the code."


> If stable releases want to do recipe version updates, the correct way 
> to do that is to have automatic regression testing on every level, 
> from oe-core all the way to the product image. Manually analyzing git 
> log output and summarizing release announcements or whatnot for all of 
> oe-core packages is labour-intensive and error/omission prone for 
> everyone involved.

This has nothing to do with the correct way a stable branch would update 
a package. It is about providing some information so maintainers can 
make a decision on what to do.

- armin
>
> Alex
>


