Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 659D077DF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 12:14:19 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c13so125615873qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SKZQ4UPVw4D1MQuB00VK7OfMvhW7soEW1t7lp3X+RoU=;
	b=AO/s/5Jx0G+1YtKCtoyjUImSZK5ddVwms6pS/a51D3z047hmaItdDWRfeH35uUTxDI
	mKs7SeC//Q3n7urmuKb+tUWZ+xFxWUCeYnRsz3gXo338MmXZgYhMWTgWAoBZ0fepqRrU
	bGonq8gwuiKOEzDJkWIwMUZBrlEZFvT/Lpvf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SKZQ4UPVw4D1MQuB00VK7OfMvhW7soEW1t7lp3X+RoU=;
	b=aWcse3misJQgM2s25bx6cOotOoXw3Qo5r+mGdWso1rNEFYLNCPgEUvRw53W/5P+K1L
	zGduBUJb+NINZocZ/sacZp5lLE989UJCO7s/XwqcXoy7akh9X4CPKDIx93HMZW4tbhim
	EN6DNxKvLWXYKVkYyfqWiw4yj2eK9j5rPz26O9gE/h7BphMELtV7hzoX4iaW6Jr0zHmZ
	57q+2/FP99/KcDK1JSVWR3zCcls1xM1eYSUhRii2n6sHw2h2IqdjC7Ewh6i03fxuJbai
	zE++ISqHYy0EF86bwHmUJtxQhBTSjOgcrOstgjcTLVYKSVsb1q4XT8LMgsf3GIdF3+AE
	v/OQ==
X-Gm-Message-State: AODbwcDRxT/NIH3eDB4zBhp7bcZGqSg5LrFaRT3O9buErzBwiEYy5FbL
	D8HsoNrGTvfdYUA/CqNEK7Ypy4znZWai
X-Received: by 10.200.42.219 with SMTP id c27mr18826759qta.9.1495541660296;
	Tue, 23 May 2017 05:14:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Tue, 23 May 2017 05:13:59 -0700 (PDT)
In-Reply-To: <CAJTo0LbgS9xA+MRkHxVGy524hQhCyCGB2pBXuhxrF1j1tbWhnA@mail.gmail.com>
References: <1495509563-62240-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0LbgS9xA+MRkHxVGy524hQhCyCGB2pBXuhxrF1j1tbWhnA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 23 May 2017 14:13:59 +0200
Message-ID: <CAP71WjzjChQtrTVK7Ph3Ba3TPrgc=0t+CVtNQnOP0p5dZDMjpg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: 17.0.4 -> 17.1.0
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
X-List-Received-Date: Tue, 23 May 2017 12:14:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 1:09 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 May 2017 at 04:19, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
>>
>> 1) Upgrade mesa from 17.0.4 to 17.1.0.
>
>
> "Mesa 17.1.0 is released. This is a new development release. See the release
> notes for more information about the release."
>
> Unless there's a good reason we don't ship development releases, so the
> latest stable release is 17.0.6.

I agree with that, i was about to send the same email, but I noticed
yours.. especially because there is at least 1 regression that I found
when testing 17.1.0 on my boards which will be fixed in 17.1.1
release.

>
> (we should fix the upgrade helper regex to exclude .1.0 releases)

