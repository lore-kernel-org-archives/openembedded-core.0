Return-Path: <paul.betafive@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8A26F6E20F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 13:31:30 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id i7so599399oag.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 05:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=zti3Wt9ctBoRXwHbOTbecqj5wlMWP6JaEzRB5IJDdtE=;
	b=KfxNjTBimwo2dimG3X8Bm9CVqOEX167j3p4RibXvmnxPRJfRedy2GxCU3JuCRTKvoA
	alLwEqe5qlHR7hxYV20nY1H29TEmdgSBNItdCqy1Supf3Szo9ypSrfrtAm7RdbRpHKJ4
	jhIJVsoQuA6BBYVu8XmY8+ORP0cwY1i8mWRIq5vXzr08lfMMIZi+6xv3SkkubXitVp4H
	RUmCjsCkWH9SyEQPFszamLiK7PLAbw7od43fdKux6FQw37apwQXBz3USZqZunBHGtNCi
	h0cyvLErQkwBKXvF8xocBqCg6K7/9BOxlb2ScxB2UWOHXFcxjVTAwhUQ6WQY/t0Z036u
	4vJQ==
X-Received: by 10.182.19.132 with SMTP id f4mr7003113obe.14.1389879091392;
	Thu, 16 Jan 2014 05:31:31 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Thu, 16 Jan 2014 05:30:51 -0800 (PST)
In-Reply-To: <52D70DC0.3060709@linux.intel.com>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
	<1389752246-4296-4-git-send-email-paul@paulbarker.me.uk>
	<52D6A554.2050705@linux.intel.com>
	<CANyK_8cBWSps_v=eF-ktk6YbUKo76KfGTufa09m2gVsgQk7NRQ@mail.gmail.com>
	<52D70DC0.3060709@linux.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 16 Jan 2014 13:30:51 +0000
X-Google-Sender-Auth: mSwbRSjNAzgFgcmQD7J9xDCLFHw
Message-ID: <CANyK_8f=okR8sc_XkuaHHC7L6++UTT_qFWZ7MM=nqF9BOxOicg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] opkg: No longer PROVIDES update-alternatives
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
X-List-Received-Date: Thu, 16 Jan 2014 13:31:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 January 2014 22:37, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/15/2014 08:13 AM, Paul Barker wrote:
>>
>> On 15 January 2014 15:12, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> On 01/14/2014 06:17 PM, Paul Barker wrote:
>>>>
>>>>
>>>> The new provider is the opkg-utils recipe.
>>>>
>>> This seems to have triggered a failure on the AB:
>>>
>>> | Computing transaction...error: Can't install
>>> nativesdk-shadow-4.1.4.3-r13@i686_nativesdk: no package provides
>>> nativesdk-update-alternatives-opkg
>>>
>>
>> I've not really done much with nativesdk, but my guess is I just need to
>> change
>>
>>      BBCLASSEXTEND = "native"
>>
>> to
>>
>>      BBCLASSEXTEND = "native nativesdk"
>>
>> in the opkg-utils recipe so that nativesdk-* packages are built for
>> that recipe. Does that sound correct? If so, I'll re-spin the patches
>> with that change.
>>
> Yup, that's it, aslo why did you locate opkg-utils in a separate directory
> from opkgs itself?  Is there a reason they can't co-locate?
>

I've just modified the existing recipes, I haven't moved anything.
They can probably be merged into one directory if that's beneficial.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

