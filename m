Return-Path: <matt@madison.systems>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id BFE2665C9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 19:49:39 +0000 (UTC)
Received: by qgh3 with SMTP id 3so52372670qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 12:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1xeGC3UMGdPwYEoikaGKuPYJGQhHuw5jB1vwSzOhyfc=;
	b=jpEvkhktn1BTDYuWf6+t8VwK6qfvpOThj6KQ5dV1n+ENxZbBD7RXYSCQDrnvxDterZ
	uG5n3JA4gH35r+xgBj/eja+JpZ0ntSlbA6ezRTBPBBhfgnhQc1/Ajp51bi5WChh4z0o/
	IC0nw5qhsmwwCoGzJBPGoSI5b2yOgdXLFnrscV6OunbdZBr4HAeMTddLT9/5QRsd9TMt
	U4gR71jVvFh8vbUnOIWTZYJOlrDFqeKulhjnyPvOmwAu5aZnV01ziL8ma5tqjwn+hXNJ
	Ed/ap0Q/KGj8p1LmLXcteEEunWNuiVBT3JYyN046p1qEJ9bKJv1/y/Qk7DT2oLQixnpa
	fxCw==
X-Gm-Message-State: ALoCoQkM81YUYcIP3ZmUt5QsQQ2fj0KEO4Dj4UO6r0ylCmfEQcqo2sCQmwMldIxhmjVPPeI8ejXz
MIME-Version: 1.0
X-Received: by 10.55.31.82 with SMTP id f79mr93089053qkf.31.1427917780964;
	Wed, 01 Apr 2015 12:49:40 -0700 (PDT)
Received: by 10.140.48.7 with HTTP; Wed, 1 Apr 2015 12:49:40 -0700 (PDT)
X-Originating-IP: [64.71.1.115]
In-Reply-To: <CAJ86T=VARtcTTEk79E6ZpA1C08ZrHyafKtqc7m+KUFnbsH4xMQ@mail.gmail.com>
References: <1427891538.4690.5.camel@workhorse.madison.systems>
	<CAJ86T=VARtcTTEk79E6ZpA1C08ZrHyafKtqc7m+KUFnbsH4xMQ@mail.gmail.com>
Date: Wed, 1 Apr 2015 12:49:40 -0700
Message-ID: <CAGgRHJrjSAth1xuhdzUU8RG4jvG4tSv+OPBJt6ELfj1Cj_9O2A@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: busybox issue in latest dizzy
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
X-List-Received-Date: Wed, 01 Apr 2015 19:49:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 1, 2015 at 11:27 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Apr 1, 2015 at 5:32 AM, Matt Madison <matt@madison.systems> wrote:
>> I updated to the latest on dizzy and ran into an issue with busybox's
>> modutils commands failing, complaining about "no gzip/bzip2/xz magic".
>> I've tracked it down to this patch committed (cd20b3c) on the 21st:
>>
>> busybox: libarchive: open_zipped() does not need to check extensions
>> Backport from busybox 1_22_stable branch:
>
> Thanks for testing and reporting this.
>
>> I found a thread about this issue on the busybox mailing list archive,
>> and applied the patch in this message
>>
>> http://lists.busybox.net/pipermail/busybox/2014-January/080389.html
>>
>> which appears to have fixed the issue.  I can submit the patch, if this
>> isn't already being worked on.
>
> Rather than take the risk that this might not be the final fix,
> perhaps the safest approach is just to revert the offending patch from
> dizzy?

That's fine with me, too.

Thanks,
-Matt


>
>> Thanks,
>> -Matt
>>

