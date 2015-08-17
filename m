Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 58DA773E20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:30:44 +0000 (UTC)
Received: by igfj19 with SMTP id j19so60172968igf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=438Ri5wKcutH1q77o8zRVwItphl8DmKryzTPq36vtJ8=;
	b=PxYYrAPH0DCGetQ8XbeSP7sJZ/ryUvii73EuieCfrHzxWMcOA4zATfzMf6MNocWJJS
	Hw7TYCTeJpw7cjYbMZbL8Y68MMlmlonav5sqwHtC1X0c945NTKELg0RNOxWMQSykQZ4e
	pduS9734SLSZqUDeBOzU+CdtOpyv4wA+6OYQHoOYsm+eumjB9Wt7qW4KIJUBrQMuzhTt
	26woq2h/VGrcULJ9fhETHdBQygHYtAB4p6sBqBoNEE3UshDGqrR8yXTLxfzszXu8il86
	j0+r3eygwS6umv60hWpsDtboQ52DJV8Et0dDT/DXh2rTIvmSPGGjQCoqxMfWXBnoMKhW
	GiFw==
MIME-Version: 1.0
X-Received: by 10.50.88.41 with SMTP id bd9mr17944976igb.4.1439825444895; Mon,
	17 Aug 2015 08:30:44 -0700 (PDT)
Received: by 10.64.38.229 with HTTP; Mon, 17 Aug 2015 08:30:44 -0700 (PDT)
In-Reply-To: <CAMKF1sqN_moGReYFdyLEWm+C1EGBXfLs5vTvT9KDH36EV2M+sQ@mail.gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<1435759342-5312-5-git-send-email-dbaryshkov@gmail.com>
	<B8E44407-53A5-4332-8124-3DC507180D8E@gmail.com>
	<CALT56yOdHWxUkEpvMfi6u22mUX16HjvOLFOM+QEsgYyBqYOiRw@mail.gmail.com>
	<CAMKF1sqN_moGReYFdyLEWm+C1EGBXfLs5vTvT9KDH36EV2M+sQ@mail.gmail.com>
Date: Mon, 17 Aug 2015 18:30:44 +0300
Message-ID: <CALT56yN=2EJosZX+RKF-3YfJsQxgRSVUWRA-+UAWv9woHSojsw@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] glibc: don't override TUNE_CCARGS for MIPS
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
X-List-Received-Date: Mon, 17 Aug 2015 15:30:45 -0000
Content-Type: text/plain; charset=UTF-8

2015-08-16 3:29 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
> On Sat, Aug 15, 2015 at 4:15 PM, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
>> 2015-08-15 22:34 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>>>
>>>> On Jul 1, 2015, at 7:02 AM, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
>>>>
>>>> Overriding TUNE_CCARGS this way breaks MULTILIB setup for MIPS. This
>>>> override disables multilib handling of tunes for TUNE_CCARGS, thus
>>>> enforcing glibc's TUNE_CCARGS to the TUNE_CCARGS of main DEFAULTTUNE.
>>>>
>>>> Glibc perfectly build without this override for both simple and multilib
>>>> cases.
>>>>
>>>
>>> this patch has been applied however we should reopen it.
>>> This has to be fixed differently. its not a build time issue but a runtime one. So find
>>> alternative way of passing these options to glibc build to accommodate your changes.
>>
>> What is the issue that you  are facing with the current OE-Core?
>>
>
> systemd remount segfaults in glibc. The problems will be more where it
> will use wrong syscall headers.

Hmm. N32 and N64 packages seem to work for me. O32 programs segfault
with illegal
instruction. I'll take a look.

-- 
With best wishes
Dmitry

