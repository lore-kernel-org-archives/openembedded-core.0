Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1918E60657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:38:59 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so23956056igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=GeioZ+3IDzjcXrZT0SUN+UJeFNvyTBwyn2yDCcxN7Bk=;
	b=KbBmM6fzUulaXJL/sUm1CmcLTFyd0xi874GnXD5b/C41aHG8RQ3KyzLkAVkFi1DLpE
	YPAMSKpL8loWoLwLDPM/7VzQMemlS0HrOJrZ/B9Ly+BxUFOPL/j+kpKCpl/irp9GD13F
	0MuvG3Cd3mNjcbeGbJ3E3DvM6xLbTjsuvJGjFNw3qUCPbbqtUOlhbJa0Uq6Qqicniqea
	Ew0lBUzq7Ikbz7qvGXmSiInmeZaBiKsVTpg2miGFF6kckN0BITtIxYUS/CP7WImYhKFD
	xXBNWq2fMRQME6yXkD22lqw/Q8Kguhxj2fM32MFIrCTUzLZ6WJP2714vB/gsYi5Kpqm8
	PTIg==
X-Gm-Message-State: ALoCoQm8PcHirIIhxu01SoyppBzLiOVwcCTngqf1N2NSV7u2mfIDLEq2x6jVBbCIL4uRuFeqqy9e
X-Received: by 10.50.78.161 with SMTP id c1mr5094744igx.35.1440193140007;
	Fri, 21 Aug 2015 14:39:00 -0700 (PDT)
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com.
	[209.85.213.179])
	by smtp.gmail.com with ESMTPSA id o66sm6935483ioo.5.2015.08.21.14.38.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 14:38:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igui7 with SMTP id i7so23111313igu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:38:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.88.8 with SMTP id bc8mr5422794igb.46.1440193138144; Fri,
	21 Aug 2015 14:38:58 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 21 Aug 2015 14:38:58 -0700 (PDT)
In-Reply-To: <CAMKF1srJxd1A6K+TQxsaKn7Bckfz7_eBs6+2bHj090ZzN-jYiA@mail.gmail.com>
References: <1440055967-28503-1-git-send-email-coldnew.tw@gmail.com>
	<CAMKF1srx_Jzv1gfwQ=VAiepAqL3GHfP4SJduup_GiwCSvL0MoQ@mail.gmail.com>
	<CAP9ODKrs70dX-K2zJ9Rhx1J+yqeDXQDX7u7UpH_bM5KGPrDa0g@mail.gmail.com>
	<CAMKF1srJxd1A6K+TQxsaKn7Bckfz7_eBs6+2bHj090ZzN-jYiA@mail.gmail.com>
Date: Fri, 21 Aug 2015 18:38:58 -0300
Message-ID: <CAP9ODKq+YAT4rRAmvKv=CpiZnxgccrpZTGbViT7zrsrjd=DvYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: Add SRCBRANCH for use by SRC_URI
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
X-List-Received-Date: Fri, 21 Aug 2015 21:39:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 12:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 21, 2015 at 3:31 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Thu, Aug 20, 2015 at 11:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Thu, Aug 20, 2015 at 12:32 AM, Yen-Chin Lee <coldnew.tw@gmail.com> wrote:
>>>> -SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
>>>> +SRCBRANCH ??= "master"
>>>> +
>>>> +SRC_URI = "git://uclibc.org/uClibc.git;branch=${SRCBRANCH} \
>>>
>>> this is ok. Just call is BRANCH instead of SRCBRANCH
>>
>> Personally I prefer SRCBRANCH. This is personal option though.
>
> consistency is what I wanted here. There is BRANCH used for same
> reason in some other recipes, it can be any name I don't have a
> preference.
> if you prefer SRCBRANCH, propose another patch to rename other
> usecases in metadata to use it as well.

Yes; I sent this for OE-Core but ended using SRC_BRANCH so it clearly
relates to SRC_URI.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

