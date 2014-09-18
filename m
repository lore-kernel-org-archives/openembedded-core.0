Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 401F071467
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 10:29:38 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id fb1so316205pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 03:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=FdfJRlXmqX5nT3GRC1jHBsIhUVHYuTV/KLxIAkvkjW0=;
	b=hNraJ0Zz/lkTDBoQkl9PF/hh+Ml0sYLzhEzquw4+wfM1HdAFgOeTCQiI3DviPiL/iS
	k+yhu0XQIEM/W4rl0GLZgcnbb+Ye3Eum0rUipqJ20TZO8TwB/+xKYLjT5ITb8Jm2cEKW
	l14ammDvj8tTmX9itea5mivHIo9WDdQpRVMZOCQViGLhnnjo82VoywyigPwqsCJ3hieD
	eCI7r2BERehr1KD2grYpjlq60RRrhABybk+N55nSMgOLlup91/AZp+MKZAxcjWY1f0l0
	eUUS5/3LQkaHQnThnyO73g933TzfjCrjET4NopECZ04upqLAxwI4PVtlbp530Xc3xBT/
	CQnQ==
X-Gm-Message-State: ALoCoQlRsNz2pDs+fQ5ttgxAbhGbh+Y93uQv4ppX1KHAuRVt9mM/hYRJQZZZbyMUH5wc/AkxhprC
MIME-Version: 1.0
X-Received: by 10.66.119.103 with SMTP id kt7mr4277942pab.95.1411036179694;
	Thu, 18 Sep 2014 03:29:39 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.65.69 with HTTP; Thu, 18 Sep 2014 03:29:39 -0700 (PDT)
In-Reply-To: <201409181130.36388.marex@denx.de>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201409181116.07918.marex@denx.de>
	<CAOMwXhN5=zy_wkKypAMjaPxTY1ezCZ302L8hqokNZQaUBbcfNQ@mail.gmail.com>
	<201409181130.36388.marex@denx.de>
Date: Thu, 18 Sep 2014 11:29:39 +0100
X-Google-Sender-Auth: CN-nJutK2MVBq50xTMtOK-54ha8
Message-ID: <CAOMwXhOa6rNukzGaCWFgipzvUFczjjcsbgzwOMqJcWwmS3oPiQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Marek Vasut <marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 18 Sep 2014 10:29:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 18, 2014 at 10:30 AM, Marek Vasut <marex@denx.de> wrote:
> On Thursday, September 18, 2014 at 11:23:13 AM, Laszlo Papp wrote:
>> On Thu, Sep 18, 2014 at 10:16 AM, Marek Vasut <marex@denx.de> wrote:
>> > On Thursday, September 18, 2014 at 11:11:45 AM, Laszlo Papp wrote:
>> >> Come on, Yocto maintainers, please...
>> >>
>> >> Mark sent this change relatively long ago, and it is still in "new"
>> >> state, sadly. The current SDK shipped _breaks_ any third-party
>> >> software that uses standard python with regards to the libraries and
>> >> all that.
>> >>
>> >> This is is slightly frustrating. We also face the same issue. :(
>> >
>> > Thanks for the reminder, new version which should fix the issues with the
>> > previous one is on the ML now. You're all on CC.
>>
>> I do not think this is an explicit Qt issue, and hence fixing on that
>> layer sounds like a weird approach. It seems to be a generic python
>> issue and so, I think it should be addressed in its core. I opened a
>> new report for this:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6735
>
> Then you probably want to add nativesdk-packagegroup-python class into the other
> toolchain recipes as well . Or even better, into the base SDK toolchain class
> (is there one?)

See, I do not understand why this "feature" was integrated the way it
was. IMHO, it lacks any kind of reality. Has the SDK been ever tested
against python based host development systems? My assumption is no. I
do not think there is any sanity in using a _that_ stripped down
version of python on desktop. It just really hurts the python users
for the SDK, since there is no simple workaround and we cannot get the
SDK to let the system python take precedence. This situation is awful
in my opinion. Who is up for fixing this in the core? Let us have a
_standard_ python shipped with the SDK by default or do not ship any
at all.

