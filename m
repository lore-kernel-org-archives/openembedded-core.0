Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD8177026
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:10:15 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z14so40758538igp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BzoMUKfsZHd9dmGIJnB5c6a35SPQ4mtuqDnB3JuFUCo=;
	b=a5eujxV57EGxxZ5NhE90PmuTC5ZfjN4p6PUS044I6sfsVEmgwuEilx9QmQI2L+kSxl
	oPp8buGe5LrzmGpmloXwlMeO0YuqRAaKD8dl+EFkAyspN8Wg5D9KH0/krBtwdjrmAF6B
	/kCBYiYyWWfL4sV3MCX1OQ12+piOgc3xla25JITZfH7EycR3HD5XVW3iP9tGNIZAbIKd
	49PZimyi5jKqQZJonk6jESLK9vTuE1iEwgL6Kci1DZ3V0ZFum75EojXRXz87bQRGRqt5
	eDCWJ3UTDjL40+s4xbD95neUUraxpJqnvn/L3avYUQOa4hZU9r4EvasV2c+yvFfJpG1W
	R1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BzoMUKfsZHd9dmGIJnB5c6a35SPQ4mtuqDnB3JuFUCo=;
	b=RvycsUJO8V40imuKhsN5Tm/hpVDMgDITViZGW2Nj7JyL5a40ylcrXP3HVW/vScT/Pu
	7jjN/wkRM1cAf63uAFRd6iIVApJ38cdBJkl0eM8vahbFItcGbOc+NcJVb1Js4EKL+V2g
	2RuFrUcTYY8X6XI540T775p/YYy8z4WLLAbERK4upTRJCKrfuee3TU3Ma8YOSYe23nTm
	Az7aZgMQerpr3MkZHBrYVSkkmdEfR9WyFoGacWUOyT7pxO1cABzNvP2j6v06YMs4SJKM
	mAjIbGnJ+irL0T2kER5lSWsS+maA/Ez27NR51TUUEPJOxgbu2RIG28LKXzExLPevxx2T
	Nj3Q==
X-Gm-Message-State: AG10YOSPKjezXWr6ToytTVG26KUP05IHxAWmfAJevoq/8rNW9anVNqptiJXGGh6hDVqXAF1FzzXsVubztyD9pw==
X-Received: by 10.50.33.81 with SMTP id p17mr10802471igi.75.1454346615887;
	Mon, 01 Feb 2016 09:10:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 09:09:46 -0800 (PST)
In-Reply-To: <CAJTo0LbCHLao9R1UK-J=iUUt+3bD9gLhiNOBu5rjEYknUiNPrA@mail.gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
	<be55911f598d8e203b6481011d30086ad79b6bff.1454303080.git.raj.khem@gmail.com>
	<CAJTo0LYY12dKQF7u3_QxkZhpiqt1=UX=M4iUR568kpvvnuQ+SA@mail.gmail.com>
	<CAJTo0LbCHLao9R1UK-J=iUUt+3bD9gLhiNOBu5rjEYknUiNPrA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 09:09:46 -0800
Message-ID: <CAMKF1sp8b5xjRFEoodSTGh_C-k=+apJwtvD3JBZb7mQvtcLNGA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] pth: Remove dead code
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
X-List-Received-Date: Mon, 01 Feb 2016 17:10:15 -0000
Content-Type: text/plain; charset=UTF-8

Ross

On Mon, Feb 1, 2016 at 4:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 1 February 2016 at 10:23, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Please update the packagegroups that refer to pth.
>
>
> Sorry, this was already merged by Richard and he pulled the fixed version
> that I'd made locally.

This is patches files left overs. they are not merged yet.

http://git.openembedded.org/openembedded-core/commit/?id=22c0b4c5034f929a1b1145f49b835387856e80b1

did not delete them.

>
> Ross

