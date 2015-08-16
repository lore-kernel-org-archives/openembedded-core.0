Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 60AC860043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 00:30:24 +0000 (UTC)
Received: by igui7 with SMTP id i7so33783745igu.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 17:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3YtmlJKIn64LdyCswdR/XN5K1hTmImioJNAiFbMdNzY=;
	b=mtQ3TLk5bwci/fX/uKrB2S9wHJw4htVPqDPAgrwU0hWJqbOPdrvNiecEiVY/0Q39BY
	JgOGyhg64tlpLWGnsgcl3Q+CiP9I2uLkDctjCAtZx/eYza0FdHf2zsWncBa8p6BFEMET
	DO+9+fzjUw6uTnQxdyQibYE7sU4oO8iPwglnQQzof6XDGwVvF0nB+Y7D6H4PTp35JAwZ
	Cvdnxsf4+vjrhq1A8zlLx6JFo4ZxNXkWhvharzSu6D7EONtP4TYsPMYpxbuiDpA2pbWn
	d69d2Z759BrOIgQigfeDULmvO/hHWdyMD7G/rS8gKQq818DBDNMvLEuBWXIVe0Do5qbu
	UuSw==
X-Received: by 10.50.17.66 with SMTP id m2mr10383409igd.77.1439685024835; Sat,
	15 Aug 2015 17:30:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Sat, 15 Aug 2015 17:29:55 -0700 (PDT)
In-Reply-To: <CALT56yOdHWxUkEpvMfi6u22mUX16HjvOLFOM+QEsgYyBqYOiRw@mail.gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<1435759342-5312-5-git-send-email-dbaryshkov@gmail.com>
	<B8E44407-53A5-4332-8124-3DC507180D8E@gmail.com>
	<CALT56yOdHWxUkEpvMfi6u22mUX16HjvOLFOM+QEsgYyBqYOiRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Aug 2015 17:29:55 -0700
Message-ID: <CAMKF1sqN_moGReYFdyLEWm+C1EGBXfLs5vTvT9KDH36EV2M+sQ@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
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
X-List-Received-Date: Sun, 16 Aug 2015 00:30:26 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 15, 2015 at 4:15 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> 2015-08-15 22:34 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>>
>>> On Jul 1, 2015, at 7:02 AM, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
>>>
>>> Overriding TUNE_CCARGS this way breaks MULTILIB setup for MIPS. This
>>> override disables multilib handling of tunes for TUNE_CCARGS, thus
>>> enforcing glibc's TUNE_CCARGS to the TUNE_CCARGS of main DEFAULTTUNE.
>>>
>>> Glibc perfectly build without this override for both simple and multilib
>>> cases.
>>>
>>
>> this patch has been applied however we should reopen it.
>> This has to be fixed differently. its not a build time issue but a runtime one. So find
>> alternative way of passing these options to glibc build to accommodate your changes.
>
> What is the issue that you  are facing with the current OE-Core?
>

systemd remount segfaults in glibc. The problems will be more where it
will use wrong syscall headers.

>
> --
> With best wishes
> Dmitry

