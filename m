Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 451D573CC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:37:10 +0000 (UTC)
Received: by iody8 with SMTP id y8so43607999iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 05:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=rlHqsLZf8U1j69TnBBN1di4PNVz8HKNFrW2uUeQuRW4=;
	b=fqzgt1Rexb/fBR9t7giKpitmW8OatF/BmxQ+QW3QJMA4yuWl1eGwADwX2lOnVbJBgO
	Z0rakRhaDTZ8HIEaRCm1VV7Un+j71K7MPaHj7JgFOmXU7b0BTSeCZ48aYKda6WU+YwEV
	TM8diCeiTwz3cvg60K5bmckDKTmXsmwPoAiDACDAK6DJh9PnMmVMH1SaI4vPIb2KXzIY
	KRxiXnXzp8zVhLkvhIhbrs7ciYomG8DZtnA8rTArNLUXC3CRsoV7w3JbZZBQKw2yLrzP
	32nGqM/+Q4Im7EPZZDBUgII/cWhne664WwcmGDDJv+LAqvk8vEAmk6jvUitjyAEKlPjM
	PN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=rlHqsLZf8U1j69TnBBN1di4PNVz8HKNFrW2uUeQuRW4=;
	b=LxSsEdUHhf2C8SB4AmkZs46RFaQIZR3IH6jPjdrPc2+Vz8O3W5uNQZ+35y/4OgOdf5
	QwrOmj/IhFCNIjlFIa785JhH8CrAMaWMed4Adtux6eANrHi3zBVWXvy6tr791/zdhSfB
	yUi9JW3trfPHIQzC3Jl+Ou9mykuIo5j3qLZzlXobk8k8qfj3AI3DOJwiJnIluRPN/PMf
	Reo3IH78HtmNLz13QHRgvenRgAT64pB3McHS4K2CwxwomBIvSjSrXWqkhAf0+MSlHCze
	Akec/N07djugzedss/HXPmX6f4WbJ5OiHxtEHjEmPj8aSdOH7FRFp/uzb0mu0Qe34I8B
	O5bg==
X-Gm-Message-State: ALoCoQmJkRlcU5sX7lEAxmPZfqUtqvqw++cmS2wwDIOrDcED+ljqQnJYirrqrKaiVHv1QGGf/H+5
X-Received: by 10.107.165.131 with SMTP id o125mr3018593ioe.94.1446122230547; 
	Thu, 29 Oct 2015 05:37:10 -0700 (PDT)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170]) by smtp.gmail.com with ESMTPSA id
	jh6sm11543990igb.13.2015.10.29.05.37.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 05:37:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofz202 with SMTP id z202so43654086iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 05:37:08 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.198 with SMTP id j189mr3006560ioe.37.1446122228747; 
	Thu, 29 Oct 2015 05:37:08 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 29 Oct 2015 05:37:08 -0700 (PDT)
In-Reply-To: <1556288.oU3CJGhmjq@peggleto-mobl.ger.corp.intel.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<16FB52C0-E87A-40C9-A677-F1220982FB30@gmail.com>
	<1556288.oU3CJGhmjq@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 29 Oct 2015 10:37:08 -0200
Message-ID: <CAP9ODKrj3XrhrUBjp7VssdqWbeMvKNm_iJSSQY0L7h-S7DmyLg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Thu, 29 Oct 2015 12:37:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 10:27 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 29 October 2015 12:47:18 Jens Rehsack wrote:
>> > Am 08.10.2015 um 16:36 schrieb Jens Rehsack <rehsack@gmail.com>:
>> >
>> > This updates libusb1 from 1.0.19 to 1.0.20
>> >
>> > 2015-09-13: v1.0.20
>> > * Add Haiku support
>> > * Fix multiple memory and resource leaks (#16, #52, #76, #81)
>> > * Fix possible deadlock when executing transfer callback
>> > * New libusb_free_pollfds() API
>> > * Darwin: Fix devices not being detected on OS X 10.8 (#48)
>> > * Linux: Allow larger isochronous transfer submission (#23)
>> > * Windows: Fix broken builds Cygwin/MinGW builds and compiler warnings
>> > * Windows: Fix broken bus number lookup
>> > * Windows: Improve submission of control requests for composite devices
>> > * Examples: Add two-stage load support to fxload (#12)
>> > * Correctly report cancellations due to timeouts
>> > * Improve efficiency of event handling
>> > * Improve speed of transfer submission in multi-threaded environments
>> > * Various other bug fixes and improvements
>> > The (#xx) numbers are libusb issue numbers, see ie:
>> > https://github.com/libusb/libusb/issues/16
>> >
>> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> > ---
>> > meta/recipes-support/libusb/{libusb1_1.0.19.bb => libusb1_1.0.20.bb} | 4
>> > ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
>> > rename meta/recipes-support/libusb/{libusb1_1.0.19.bb =>
>> > libusb1_1.0.20.bb} (85%)
>> >
>> > diff --git a/meta/recipes-support/libusb/libusb1_1.0.19.bb
>> > b/meta/recipes-support/libusb/libusb1_1.0.20.bb similarity index 85%
>> > rename from meta/recipes-support/libusb/libusb1_1.0.19.bb
>> > rename to meta/recipes-support/libusb/libusb1_1.0.20.bb
>> > index a20e1fc..21b8b45 100644
>> > --- a/meta/recipes-support/libusb/libusb1_1.0.19.bb
>> > +++ b/meta/recipes-support/libusb/libusb1_1.0.20.bb
>> > @@ -11,8 +11,8 @@ BBCLASSEXTEND = "native nativesdk"
>> > SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>> >
>> >           "
>> >
>> > -SRC_URI[md5sum] = "f9e2bb5879968467e5ca756cb4e1fa7e"
>> > -SRC_URI[sha256sum] =
>> > "6c502c816002f90d4f76050a6429c3a7e0d84204222cbff2dce95dd773ba6840"
>> > +SRC_URI[md5sum] = "1d4eb194eaaa2bcfbba28102768c7dbf"
>> > +SRC_URI[sha256sum] =
>> > "cb057190ba0a961768224e4dc6883104c6f945b2bf2ef90d7da39e7c1834f7ff"
>> >
>> > S = "${WORKDIR}/libusb-${PV}"
>>
>> Ping :)
>
> At this point in the release it's too late for version upgrades unless the
> upgrade fixes a critical issue and applying the patch to fix that issue is more
> risky than the upgrade. I should imagine Ross has this queued for master when
> the release happens and we diverge.

Due the memory leak fixes, I think we could consider the backport for
2.0.1 after it proves stable in master for some time.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

