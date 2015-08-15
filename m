Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id F3E5A60167
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 23:15:59 +0000 (UTC)
Received: by igui7 with SMTP id i7so33316615igu.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 16:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ejugox+gzAm6NcRftA0ztTufUKLtP+MQRjzAJB80OyI=;
	b=j13V6Fazu+ueRlWGVB+oB759FeyiJWW9XhRitkjGSN1GTzqFjc3m10fy6MidZqxAAG
	LPlXbS6g4nvj/P01Cwb5yqIPfDdfOAAOcnKxQt45AFEotn2Iq3BGxVreQ0abGRO4rsTJ
	IvzlD+8BWHnPR/sqWlm41AAwSntIqBnDrO+LbuCCOdIeyRl3ndASDJ2BHCSAL5sEhfXH
	+WcPVWWMxnfrM3c+x4c7RIlzRLnf5+STCsh93Q0bKHcXWHZtDDjIGUpEFBa1sGQuPZHr
	+95m5O9ySh342/txK+YrewowSRCruY1rmhZoBA9lIUxZ8pgQfgTCAWsYirO0Ybrrww7P
	ILmA==
MIME-Version: 1.0
X-Received: by 10.50.28.101 with SMTP id a5mr9477566igh.57.1439680559254; Sat,
	15 Aug 2015 16:15:59 -0700 (PDT)
Received: by 10.64.38.229 with HTTP; Sat, 15 Aug 2015 16:15:59 -0700 (PDT)
In-Reply-To: <B8E44407-53A5-4332-8124-3DC507180D8E@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<1435759342-5312-5-git-send-email-dbaryshkov@gmail.com>
	<B8E44407-53A5-4332-8124-3DC507180D8E@gmail.com>
Date: Sun, 16 Aug 2015 02:15:59 +0300
Message-ID: <CALT56yOdHWxUkEpvMfi6u22mUX16HjvOLFOM+QEsgYyBqYOiRw@mail.gmail.com>
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
X-List-Received-Date: Sat, 15 Aug 2015 23:16:00 -0000
Content-Type: text/plain; charset=UTF-8

2015-08-15 22:34 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>
>> On Jul 1, 2015, at 7:02 AM, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
>>
>> Overriding TUNE_CCARGS this way breaks MULTILIB setup for MIPS. This
>> override disables multilib handling of tunes for TUNE_CCARGS, thus
>> enforcing glibc's TUNE_CCARGS to the TUNE_CCARGS of main DEFAULTTUNE.
>>
>> Glibc perfectly build without this override for both simple and multilib
>> cases.
>>
>
> this patch has been applied however we should reopen it.
> This has to be fixed differently. its not a build time issue but a runtime one. So find
> alternative way of passing these options to glibc build to accommodate your changes.

What is the issue that you  are facing with the current OE-Core?


-- 
With best wishes
Dmitry

