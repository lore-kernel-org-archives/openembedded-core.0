Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 95F3E6FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 11:45:51 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id dc16so9960856qab.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 03:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=dWzL0U4PChFB0VlEW7GN4Sou/OgSJmNCqhYiryMsWg8=;
	b=PlZBZ8Pxvw4RMV9dMbqouKQ/OELl/wq+IZAUa+GasvmfOFWav8xU1uRHitc9/G61X9
	oa6jhX11KdjTcct2fpPwFu0Tf71+PfcXoD2ni3Xc8+nEQUSStssSFsYtUN8+wYPjkIp8
	4KDLeo1EKNGBH7A5WO1XcWfWkoT2Z4fCF8hi2HLrTXpS4BEgiXDKKOEA/qODdi+4tqFm
	PS5UdOWYhEwvoZhvrqTx3gjH2PHQkNLmJEwX4RQRwiQc2C+G2SgaOoa0ql+5nJE99Qrd
	PMlkIRewxZtrrHfv/omvmqus4CAZsGSszY2XnXgeNtE3R//t2hr86NReuPwRQLOk6vzN
	3xZg==
X-Received: by 10.224.130.71 with SMTP id r7mr2455689qas.69.1415879150317;
	Thu, 13 Nov 2014 03:45:50 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Thu, 13 Nov 2014 03:45:09 -0800 (PST)
In-Reply-To: <ED3281C6-D24B-4406-B92E-065939B4EAAA@dominion.thruhere.net>
References: <CANyK_8eJYijsMH2y4s6bGTMTOpmz=-zFeuDG5CkM4h=YvLGUQw@mail.gmail.com>
	<ED3281C6-D24B-4406-B92E-065939B4EAAA@dominion.thruhere.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 13 Nov 2014 11:45:09 +0000
X-Google-Sender-Auth: kDk7gXMiEbidMBjI2BNHiXgnfmI
Message-ID: <CANyK_8fxfRZxQWfi1nf36xMw19QJFDfqN6DsvMyVEYi7QAkh-Q@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Replace procps with procps-ng
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
X-List-Received-Date: Thu, 13 Nov 2014 11:45:51 -0000
Content-Type: text/plain; charset=UTF-8

On 11 November 2014 09:00, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>> Op 10 nov. 2014, om 11:38 heeft Paul Barker <paul@paulbarker.me.uk> het volgende geschreven:
>>
>> Hi all,
>>
>> I've tried upstreaming a patch against procps by sending it to the
>> listed maintainer and the mailing list and I've had no reply from
>> either. The last change to the CVS repository seems to be 3 years old
>> and the mailing list archive is mostly just full of spam.
>>
>> It looks like Arch Linux, Debian, Fedora and openSUSE have moved on to
>> procps-ng. I suggest we do the same during the v1.8 development cycle
>> if possible. procps-ng is actively developed and looks to be open to
>> patches.
>>
>> I'm sadly pretty limited on development time at the minute but I may
>> be able to give this a go in December. I'd rather focus the time I do
>> have on opkg though so if anyone else wants to pick this up that'd be
>> great.
>
> With the util-linux -> util-linux-ng -> util-linux change in mind I strongly encourage to keep using 'procps' are package name or ensure that the appropriate (R)PROVIDES are in place.
>
> regards,
>
> Koen

I've opened bug 6952 to track this
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=6952).

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

