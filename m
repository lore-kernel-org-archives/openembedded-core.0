Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D231E60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 09:06:11 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so36012057wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FOjx+O5ycHbgWQLFfx3XDIXyVeiQXL/tWtmufKqqihU=;
	b=DpyxgOKqBfFqjylyqLIbRXAVh0YS8Vs/bumoWry2NRg5CMxe/y7gpnpa7J+KCa7uMV
	0pM9k25P5W2bOzkbOPkF2XXYRKBGEnX0xZ2lZrca+OcpI/4ORO2fa0zbnZmSaHQI/g7P
	E7rq50unOMUi2qvrTIVGE/6lBdedC7DDVVpyb5aPYln3R3ZpZzblsoLgb4z3ym+RlT4P
	dk8ARDgi849UTbgpMtRBRqejpS9pnzibVXVLPGJXC5JOUlylyQmrxWJ8LdbaN35Hr79L
	PKCbQekD0r1FC1JGYk9g8upYSvwbXw12jmvs2Ja8qCgDPMFk9fL1DDRSvxGpERaGV/1c
	OQqw==
MIME-Version: 1.0
X-Received: by 10.28.11.13 with SMTP id 13mr8421673wml.4.1446800771144; Fri,
	06 Nov 2015 01:06:11 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Fri, 6 Nov 2015 01:06:11 -0800 (PST)
In-Reply-To: <563BD16A.5070803@collabora.co.uk>
References: <CAJ86T=W-yx=peF_w-g4U7hkZN2u+RR2wbY7eACDEKADLQ-r2jw@mail.gmail.com>
	<563BD16A.5070803@collabora.co.uk>
Date: Fri, 6 Nov 2015 01:06:11 -0800
Message-ID: <CAJ86T=ULNoNNJWL1-S10WoaBPvs=6BkjO=-+vrymUgwWYR8ehw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: fido backports to support SH4 + uclibc
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
X-List-Received-Date: Fri, 06 Nov 2015 09:06:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 5, 2015 at 2:00 PM, Joshua Lock <joshua.lock@collabora.co.uk> wrote:
> On 04/11/15 18:16, Andre McCurdy wrote:
>>
>> Hi Joshua,
>>
>> Could you please consider backporting the following fixes to fido.
>> They are required in order to successfully build for SH4 + uclibc +
>> blacklist GPLv3.
>
> Done. Pushed to my joshuagl/fido-next branch of openembedded-core-contrib
> and undergoing testing now.
>
> Thanks,
>
> Joshua
>
> 1.
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next
>

Thanks!

>>
>>    aa20c3d uclibc: backport upstream fix for SH4
>>    898e9d7 libiconv_1.11.1: merge build and packaging fixes from
>> libiconv_1.14
>>    7d2da0e libiconv_1.11.1: fix LICENSE declaration, LGPL -> LGPLv2.0
>>    d46333d gettext_0.16.1: add -lrt and -lpthread to LDFLAGS for uclibc
>> builds
>>    d95d92a gettext_0.16.1: remove obsolete uclibc specific patch
>>
>> Thanks.
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

