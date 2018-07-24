Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13AD578990
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 13:19:05 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id b15-v6so7373807oib.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=439a9wlYADCbmC4snJyL15QTy9pzfFJBCHLEOn0t9P8=;
	b=BWcZebBoaoWghkFj9b8RH49UDMakQHNcX9fBahAUW7LItQWSM9G0lkJYtwJAndHfc3
	JmG3NhuuhndbUbgeCCUd77hMLJSABo5Hy5LMKcjOlcUpnQTRg87hh2clnWFUiKb3CpjB
	kMAcwinZfGWHfNSYFPbbR0vKHs9TtdO/LL7fxiKBcw7tIj9SvP1nnVrB+u8xrneCUz+o
	7dTRMwaZxT6Top7SdtTmPgXW9Z8Bi5jVe63GB2Ly2+nYtTS2rXsAag7QxqNWeUqk8Gg6
	5kUXPBmyPoG5bnFJHO+MJJUcTHI6Tu8aZG9RuXZFjJPbCiJSyRsRZNwIUhZf4lte0cw/
	8p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=439a9wlYADCbmC4snJyL15QTy9pzfFJBCHLEOn0t9P8=;
	b=JU3o8CglvU5k1UP1iX6VywBk+QyrODCRGWp197rEjyI9GhqBIEXmsVvE/PgtCaVJoz
	MRkSve0cEBsH147TXInPm1iFg5GOTAA7AY6UFb5VwYz3xtw7hIvSIEXQUiqMX8rifNam
	QjggRtHpEpqTzzB23rIPG32BYpgV2De61ArFLkfVhKU1lenT3COtbbhv3XPmGpSiVC1l
	tgZfrnWQigOd9zXj1ZBEiETKhDfmLOQ/kP6UwZPYPGoaEZhuynb4HF5vv7KF2GZOLREA
	PbRL1PJMwIOjLMmrAhSQa4sBs0b9e4+q53Bl7JZN9dmGMeJlSkdl95u45behdBhyDSxR
	aWxA==
X-Gm-Message-State: AOUpUlES69tZwUJVRZ19y3ROZfEDG+Auti+fB8U7GaAqqGdQ0B1QEStN
	m5/Wyd7k9EKwF7X3oYyj/cgsFa0yvNBqPxpONaG1S50T
X-Google-Smtp-Source: AAOMgpcCjL3G5RjK+GzCxaCo8wUR9sfJgCRUMPKmzzRsl/Zmznr6NG5YNUf5giS65bw1InwHTnQ33ZEJEyeutcYVcKw=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr3233377oib.320.1532438347049; 
	Tue, 24 Jul 2018 06:19:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 06:18:46
	-0700 (PDT)
In-Reply-To: <2c33e55a-51b1-b1b6-c940-d4d80b6805ae@pseudoterminal.org>
References: <20180724105222.25606-1-dv@pseudoterminal.org>
	<20180724105222.25606-6-dv@pseudoterminal.org>
	<CAJTo0LavvoSVEOFXEwcJB3snMk7HgR-CWJF_hhVDAT9UyJqRLQ@mail.gmail.com>
	<2c33e55a-51b1-b1b6-c940-d4d80b6805ae@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jul 2018 14:18:46 +0100
Message-ID: <CAJTo0LYTHq57ozkvu=bmK+BQFSLZ39VCfmtVGXqR+svefxG0Bw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 6/6] gstreamer1.0-libav: Replace German umlaut to avoid parsing problems
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
X-List-Received-Date: Tue, 24 Jul 2018 13:19:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll just drop it, no need to resend.

Thanks
Ross

On 24 July 2018 at 14:15, Carlos Rafael Giani <dv@pseudoterminal.org> wrote=
:
> I wanted to add details to this as a response to your comment, but my old
> setup where this happens now refuses to work anymore, and I don't remembe=
r
> said details.
>
> Okay, I propose we skip this patch and commit it later in case this probl=
em
> reappears.
>
> Is a v6 necessary now, or can patchwork skip the last patch?
>
>
>
> On 2018-07-24 13:04, Burton, Ross wrote:
>>
>> It can? Where?  That's surely a bug...
>>
>> Ross
>>
>> On 24 July 2018 at 11:52, Carlos Rafael Giani <dv@pseudoterminal.org>
>> wrote:
>>>
>>> The umlaut can cause issues related to encoding; avoid by replacing it
>>>
>>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>>> ---
>>>   .../workaround-to-build-gst-libav-for-i586-with-gcc.patch       | 2 +=
-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-bu=
ild-gst-libav-for-i586-with-gcc.patch
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-bu=
ild-gst-libav-for-i586-with-gcc.patch
>>> index 36abf8607e..5355480aa4 100644
>>> ---
>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-bu=
ild-gst-libav-for-i586-with-gcc.patch
>>> +++
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-bu=
ild-gst-libav-for-i586-with-gcc.patch
>>> @@ -1,5 +1,5 @@
>>>   Description: Workaround to build libav for i586 with gcc 4.9.2 by
>>> avoiding memset
>>> -Author: Bernhard =C3=9Cbelacker <bernhardu@vr-web.de>
>>> +Author: Bernhard Uebelacker <bernhardu@vr-web.de>
>>>
>>>   ---
>>>   Bug-Debian: https://bugs.debian.org/783082
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

