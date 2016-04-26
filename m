Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBA960043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 13:57:39 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id d62so16421201iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QxHWafyx8AMD2sQ2NInewhVPpzSBKPOh3p5ODpaPHwg=;
	b=thff8nY2fUnuV1hhBlPuWCAtchBdaDMYcH+gYbSnH1QU8SA4sYr2cM/jVC/yDh58Ss
	+8Wpy2pCeOad1knFiusq6M9IyyHs9ACmvTrix/7tAbznYez0X47S3bhVKt1AdwNh1ceQ
	BV4ItgSP0Hz2EnhSFYPQTxvn6MW/mq1mdql2Uoyopr0H6fCzmgfFck1v+fOcbv1lu+ot
	L89P0I7E/+RaQdsaD/Ijqzv8cihMsfdCKTNDM8X9leSKVy44garZ1FLUVGy8zTHQ1LT/
	FU2muiPsv+/+sA6YPKLHoHPx6kytBRXdCP9HmCPjzT6zv2mlJhXGTAzIkTO+r/2nhtfD
	CSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QxHWafyx8AMD2sQ2NInewhVPpzSBKPOh3p5ODpaPHwg=;
	b=RCBgSEwkIz0YSHcW75cFDv9BmankAya7cYkVBNUqRXZ4LM/n+iVctvFJ6I6bi8wU1r
	lcf4wxMriXJ6Nk9adMFRynE92I1gVWeBr1MNprbgefX2KblPzk1Zc7sIsGD+FPRgvgEp
	+yaBjscFihDokeC2TlWISIqn4l1ZiPFiBJeF0a5Gv5C6QdrT1l6jSYN2Twp+h8WPs1IY
	Pfx0Ww4Kz6CjJkqYecdaiglceTwzcdc5AiFVjjFS/6nz4iXt8IaKQpYBuvjC3lxkDssZ
	T2H7HawYm2Q/WXi4fAwR8PBFpHEI7elfAS9aBHZxn7Xi3a46vzSmYeHEMMzm81b7PphH
	taqw==
X-Gm-Message-State: AOPr4FVH4vNtpvnQK3v67NalTin7Cc0ZzP78V1dzeWro+UVLM10pdwma7jilFCCmbGHuCc3mLJ+wIfH6Jye0k7B2
X-Received: by 10.107.149.66 with SMTP id x63mr3565994iod.141.1461679060411;
	Tue, 26 Apr 2016 06:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.140 with HTTP; Tue, 26 Apr 2016 06:57:01 -0700 (PDT)
In-Reply-To: <CAJTo0LZN4Y1vFOJJrMxsapm9LL=KT05_KV2C63fH5QkEjZw3og@mail.gmail.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
	<e76f32f4bb513453ffd80704adf19540b8f35d2a.1461592183.git.liezhi.yang@windriver.com>
	<CAJTo0LZgtTN+6M_Xvwm2zQAibJR0jBXB15eU12HfUtz2ERuYKA@mail.gmail.com>
	<571EB9F9.3060602@windriver.com>
	<CAJTo0LZN4Y1vFOJJrMxsapm9LL=KT05_KV2C63fH5QkEjZw3og@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Tue, 26 Apr 2016 14:57:01 +0100
Message-ID: <CAPhnLPDJ3hfHJLRYPHQOz47A1oFrtuM_FevmvAtRpCTp5eChng@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libxsettings-client: fix LICENSE
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
X-List-Received-Date: Tue, 26 Apr 2016 13:57:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 April 2016 at 14:29, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 26 April 2016 at 01:44, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Thanks, did you mean the following text ? I can't find MIT license there=
.
>>
>> /*
>>  * Copyright =C2=A9 2001 Red Hat, Inc
>>  *
>
>
> Yes, this one.  I've just had a chat with Beth and we both agree that it'=
s
> practically MIT, even if it's not worded traditionally.  My personal beli=
ef
> is that this license is Red Hat's legal department's wording of MIT.
> Pointing it at the MIT license is acceptable, but preferable would be add=
ing
> a new "RedHat-MIT" license to common-licenses and using that.
>

Yes, this is MIT enough that, in that, it doesn't really add any
restrictions to MIT that looking at it again I think leaving it MIT is
enough.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
Elizabeth Flanagan
Yocto Project
Build and Release

