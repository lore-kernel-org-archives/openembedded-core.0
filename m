Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB437503C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 16:28:08 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a2so1104367pff.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 09:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TZa/j5u1jm//9xTKxBb76/TkMTeaWfRUY50mPOky+iM=;
	b=e4DcqmURv0Fn/lVxbNe/MQ7JOIhX/3C+WWld+97jpP/iQCbXYEopdHvP/k0TMerARI
	QZcuvXq2HmYZTMDLnHtwzUCjyD+pyp4O6QDnr+SP+H7iyQ18GnSZdN37yhbYjkPmU5D2
	sKED0HXHtUkBaLxz4A6dhR5i03ZEXJJxmY5/fLqI33Bg7b8Vzpo2mAcSGZ9AswNTiekb
	zDF0e4CxW7QYyTSQCuVsCu01t+npjjDdOaouEjw8mk1KhtZGCoxedpDAfOBMwUB0MI9q
	KkljhZWAt4zEeJMk+Cd3f9Haz7073JTcEWls+OoGkc8FCCVC4w2gKttid/+qa2Jjg2Il
	sEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TZa/j5u1jm//9xTKxBb76/TkMTeaWfRUY50mPOky+iM=;
	b=WrxgCOd8O4OP5JyB1ASWXqPN8jR4sheuKZa7PfuweqV5pl+9HnVH+n4t3IRg7sOnV6
	xu4rgYFnmSORgkMZFkambOVBNOuRAT4F/2LzN6rNTi7mD1J+FaPMYRc9vQ8kqcDx07sz
	yKJZPRH2RQyN6rJ+6z9wkJUHnpCAaF35AqLy56mtBXuhgDZLdG8SoouE6mkAi/wFdIJw
	/zdRY6SNCqZk8D/zuC661PdId9CZS3g5f0mXqGnnvJY7PSUEDW167KkGWSFDw8KcPXVq
	nI7iiwGglkrwhtlAiGejplpLpxXUq9SWRR4TIPuIZ/jgrPXkTnj2R81ujTx/hzYPaD9t
	C+rw==
X-Gm-Message-State: AElRT7HdcLQNZj8u9ihF/1O1jDR1+LUfOStAK8PIIJUze1DDt9mFUCv7
	tJwalVpqi56medub6VDyeezflMgr+ohV7dTBS44=
X-Google-Smtp-Source: AIpwx4/RVMdgNLvYxo9l9eRmJFuFCh/6qD3zqSxb96sSZMUiWUqTufiQT3YyxrQ+aEDpD1h2ko4aNYfkM39wPH9EtsQ=
X-Received: by 10.101.97.15 with SMTP id z15mr18226778pgu.393.1523032088992;
	Fri, 06 Apr 2018 09:28:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.131 with HTTP; Fri, 6 Apr 2018 09:27:38 -0700 (PDT)
In-Reply-To: <1523029327.2942.18.camel@linuxfoundation.org>
References: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
	<CAMKF1srQLn+7YKX0AeE00Y+r=7PC4R7cFUjGNm9wjEa0kVr8gA@mail.gmail.com>
	<1523029327.2942.18.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Apr 2018 09:27:38 -0700
Message-ID: <CAMKF1srNsAUyzQCP6x+=vHVqp37R-HUZPSK5KYCFJaK6aQ-ysA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Split glibc and libcrypt
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
X-List-Received-Date: Fri, 06 Apr 2018 16:28:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 6, 2018 at 8:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-04-06 at 08:03 -0700, Khem Raj wrote:
>> this series is ok. Although dont like the fact its not upstream yet
>> but it reduces glibc baggage for future.
>
> Were you able to find out if glibc will definitely do this?
>

I have started a disucussion.

> I think applying this nativesdk is the only thing we can do right now
> and it does set us up well to migrate this further if glibc do go for
> this. After thinking about this a bit, the patch series needs a few
> minor tweaks to avoid wider testing failures:
>
> a) libxcrypt needs to SkipRecipe in the target case and be nativesdk
>    only
> b) We need an RDEPENDS_${PN}_append_class-nativesdk = " libxcrypto" in
>    glibc-package.inc
> c) The override used in glibc-pacjage.inc is wrong suggesting the code
>    can be dropped.

I think we should apply it for target case too. It will keep things
simple. We are
not losing functionality as we have libxcrypt

>
> Good news is a few of us tested this on f28, f27, ubuntu 1604 and 1710
> and the new uninative built with it seems to work well.
>
> Cheers,
>
> Richard

