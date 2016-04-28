Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 768847570D;
	Thu, 28 Apr 2016 14:02:02 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id f74so30024730qge.2;
	Thu, 28 Apr 2016 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NOc/ovovQ68oobsYxjm/XzQsTVpH1WXbLsDgDlMpbms=;
	b=buSz0b7HVYqlleickTOLx5qakbm0jHzMDVFx5jSE7pKSGh+Kn5V1IRca3/AB4hTojI
	pM3tcA++pNKW6x9G+b/wsH3WEBmXDw3a9R6Ss3YDSlNl8TKHQvfeQnZNIrkQr0/Pl55q
	3nTsFXYdmckA1uNrCEpOETRibUEo4bQ+zCS+iO9+qSBZUItv6E/ogcoXO2JAk/NGlPBR
	1Vwpo2e9WCC/OQxEjprB5TrS53cWOzEHH7PHyKkwjAGgsAx3o3eM3AR464Z9Y2GtYMn2
	Mxko+O0oYsvJk/CyKvtTYE4Inlmstv6IXveLsTa37x4brjStwhKh/TpEMujl5NBuwNRJ
	A8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NOc/ovovQ68oobsYxjm/XzQsTVpH1WXbLsDgDlMpbms=;
	b=a3ul706mRSeDt+cQaO1dSjg01HInmNDl7hROrjLcmy/AQWqWbMoBo3PXRS9QcfofaC
	u1GgbBxXHC5C+Z9Sz5WjmRcDsotpq/BGZ0lZ/503MChp5E0Cqvyu+t8aPMENUNyxtPoF
	NEqhSeDtEHHNUNQWAB2+E9wAMcJVlx0xtdfIKAU3Tg/tBcateXcBMOOakdwze1rue7Ki
	RlRIrcHZ+GHizFz5YAlbud4M2bV9r9CVgkHRErRqEZHuheswQSg8nXHx0Gj1YVTrk5iL
	0kRvBznTv6Sf2n9qF7qaOCz65NcbJ0frUdxW16LeV1IbEjyiAxCIx9Cu+H/1YgNZSBu3
	0s+Q==
X-Gm-Message-State: AOPr4FW7+mXB73HatRBbd12VB5JtKsYaUwE7zcbxk5eAWKdKuE0IFju/hPAQzANDlcXBw2Q6M12aOd+WIAEc1g==
X-Received: by 10.140.92.175 with SMTP id b44mr13599508qge.104.1461852123614; 
	Thu, 28 Apr 2016 07:02:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 28 Apr 2016 07:01:34 -0700 (PDT)
In-Reply-To: <20160428121437.GJ19598@bill-the-cat>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<20160427221005.GA19598@bill-the-cat>
	<403123E7-85F1-4CBF-9D6C-E6377B89D5EA@gmail.com>
	<20160428121437.GJ19598@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2016 07:01:34 -0700
Message-ID: <CAMKF1spK=tkagRSRCyWzipHt8v1atfuhZahQOQ8UZ0FiCs+UsQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 14:02:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 5:14 AM, Tom Rini <trini@konsulko.com> wrote:
> On Thu, Apr 28, 2016 at 12:08:46AM -0700, Khem Raj wrote:
>>
>> > On Apr 27, 2016, at 3:10 PM, Tom Rini <trini@konsulko.com> wrote:
>> >
>> > On Wed, Apr 27, 2016 at 10:53:52AM -0700, Khem Raj wrote:
>> >> thanks I think most of them come to these categories. So any help in
>> >> fixing them is welcome.
>> >>
>> >> 1. kernel older than 4.4, backport needed fixed into these branches o=
r
>> >> move to newer kernels.
>> >> 2. uboot dont have gcc6 compiler header files, backport the needed fi=
xes
>> >
>> > 9b2c282b348dfe966bbba967dc7a45ce817cce50 from mainline.
>> >
>> >> 2. meta-qt4 needs to use gnu++98
>> >> 3. gcc6 providing its own stdlib.h in libstdc++
>> >> 4. gcc6 swtiching to gnu++14 for C++ as default.
>> >> 5. GPLv2-only versions of recipes are simply old will need fixing
>> >>
>> >> I will take a stab at fixing the nativesdk recipes which is mostly du=
e
>> >> to stdlib.h issue.
>> >
>> > Please do, I'd like to see some SDKs so I can get more U-Boot testing
>> > done with gcc-6 :)
>> >
>>
>> I have pushed couple of more fixes which should now fix the nativesdk is=
sues and SDKs should be building
>>
>> Tree is here. Let me know how it goes.
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-=
6
>>
>> and also to github
>>
>> https://github.com/kraj/openembedded-core/tree/kraj/master
>
> debian/jessie, nodistro, MACHINE=3Dqemux86. bitbake busybox:
> | make[1]: Leaving directory
> '/home2/trini/oe-gcc-6/openembedded-core/build/tmp-glibc/work/x86_64-linu=
x/gcc-cross-initial-i586/6.0.0-r0/gcc-6.0.0/build.x86_64-linux.i586-oe-linu=
x/gcc'
> | cp: cannot create regular file
> '/home2/trini/oe-gcc-6/openembedded-core/build/tmp-glibc/work/x86_64-linu=
x/gcc-cross-initial-i586/6.0.0-r0/image/home2/trini/oe-gcc-6/openembedded-c=
ore/build/tmp-glibc/sysroots/x86_64-linux/usr/lib/i586-oe-linux.gcc-cross-i=
nitial-i586/gcc/i586-oe-linux/6.0.1/include/limits.h':
> No such file or directory
>
> Doing MACHINE=3Dqemux86-64 provides a similar error.  Thanks!

I forgot to rename recipes to 6.1 after I did the gcc rebase since 6.1
released yesterday. Anyway done now. please retry.

>
> --
> Tom

