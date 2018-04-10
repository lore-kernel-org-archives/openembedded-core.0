Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0833B74928
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 23:18:10 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id m7-v6so14729284otd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 16:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2VxDfPXl+mH3J9Cd2btfCsS2/4l3gra/2cPZkaOkJXk=;
	b=E0kE09+d5lYEHFluK8rImjQm7GaM834BFfQuusuuIGtGNcPxFICVqZjOBMTy190J1J
	7V+7ZTVSLyafu7arAVxPianyLoKs2kQATrd8YAqBanKEkJVUw3GnMea8RSp0uB9e6mFa
	Nqc9z4YJTBqVqbzq9+bW6Qn8XqL77LCNLJ3NQPWdgmf0QAO9yvhICMfDxvmNp0lK4ra/
	gT19oup2VI+0UElso7u5YhW3kVSBrIAXLCQ99XVz3sKhU3yZojKcOsxdLE6I3xCsOked
	iFTCKn8a3rYgnIAMswcvzIDpxtD/L0F7bdbp0FhEv2Zg5HcrJSPTPLM8vRYwB8ltrhnd
	pq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2VxDfPXl+mH3J9Cd2btfCsS2/4l3gra/2cPZkaOkJXk=;
	b=nSttU7gEnYcJcmhb1wcvq6qeCqBHGZyTT1jlnkvxmo/hfGg8gJGv89y3noT6KqkpJE
	MqP/xjr1Up0LC9aN84LZDT6vUJzzNe3wwFq+tQiUciZfu1eP1EOxOKrl5G+Rz+LkWYAz
	pIVsvotEKiZg8jUjSUKNkUUgb9ioIkGI6zbdixP+RNmduFFTfGEBqZB1Z0wyJ5+6MViC
	mYxQk1G18jDQOsIaTO2Vgl78su++TK8LiKBRZkqT5aLIdnl7t7WVGMMMfTn8Jmdgi/BC
	jzVP4ck2AVMOHEcuuaN5elZvdlhAJo/Kq/ynDvlilHQv4HVODHUkfcTGDNnTful4m0Bo
	uq8Q==
X-Gm-Message-State: ALQs6tBbd+pkpAWkUDqmn76hh2FM8B+1MwP+nXFpQ9EhSnH39ZAnUwk2
	XGCCXNMSt1+TO8rlLPDlJcpZ/2bNDQcI/V7fd1tUvw==
X-Google-Smtp-Source: AIpwx48LGCl0R22sZOTRzXxIR1VU0Lx7w1pX5yPryLtWaaC5DGh9l+syRpbu++uaiVLWTZ0Qj7xoN0XHmRdSL57C6h0=
X-Received: by 2002:a9d:2ce2:: with SMTP id
	e31-v6mr1543603otd.135.1523402291719; 
	Tue, 10 Apr 2018 16:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 10 Apr 2018 16:17:51 -0700 (PDT)
In-Reply-To: <CAJTo0La0UV_6yYzdPsFnBtak0JfX0QQU-24JFN1_N7te8=Mepw@mail.gmail.com>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<1523387170-30191-2-git-send-email-denis@denix.org>
	<CAJTo0La0UV_6yYzdPsFnBtak0JfX0QQU-24JFN1_N7te8=Mepw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Apr 2018 00:17:51 +0100
Message-ID: <CAJTo0LY3uVhbN+97EQSXVmLGzgM-JZm33Sy-Mp11MJFWDmNLMA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] weston: upgrade to 4.0.0
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
X-List-Received-Date: Tue, 10 Apr 2018 23:18:11 -0000
Content-Type: text/plain; charset="UTF-8"

Ah presumably this is because the U-S is after the scissors.  Denys,
when you add it back, can you put it above the ---?

Ross

On 11 April 2018 at 00:16, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 April 2018 at 20:06, Denys Dmytriyenko <denis@denix.org> wrote:
>> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
>> index 0671a45..6799254 100644
>> --- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
>> +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
>> @@ -1,26 +1,25 @@
>> -From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
>> +From ad1d2161c811cff25d1684c33611f300adb753bc Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Fri, 29 May 2015 20:56:00 -0700
>> -Subject: [PATCH weston] make error() portable
>> +Subject: [PATCH] make error() portable
>>
>>  error() is not posix but gnu extension so may not be available on all
>>  kind of systemsi e.g. musl.
>>
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> -Upstream-Status: Submitted
>
> Ah, I've seen this before and was wondering if it was a genuine
> mistake or devtool being bad.
>
> devtool refresh is doing A Bad Thing and for some reason dropping the
> Upstream-Status tag.  Alex, can you see why this is?  Denys, can you
> edit it back in?
>
> Ross

