Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B81F2737FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 15:49:55 +0000 (UTC)
Received: by igdh15 with SMTP id h15so1327770igd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 07:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=H7BaH46wuYJITePYV8DumBaHvSDMV7LwsPsXAR/Iyb8=;
	b=dcAj8HDptUDa6Z6Kj5WGBhFJ+Zd4A9A4nJalwyf5MUH9ShYTICD9MzsVyWCXNy4T92
	wIxa9SFaLsgOiv9pZ0kamoV1kGag5hZgLUO2okjahM7Dh/hCTVS44eC/zAtTsRJ/lCex
	sXGiNeZdnLk4bDmePXy0uBbhNtwPxzTmsRe8Etou4K2LA8jKlUs8wD5gYdn6HnCuhRRp
	sg6+tNyuJl++6/vi76WawBeccaHSbAxgHMk5wlo0AUrEEbUfKsEyltyXLbkOjwlMkWSZ
	ffTPvofghfu82u2sQFt6Jj4mRTSYgeuldREMTHHSB5M1wtrrYUmjDzT3FzFzhXRA9Y/o
	IcMA==
X-Received: by 10.107.12.167 with SMTP id 39mr19448693iom.71.1425052195522;
	Fri, 27 Feb 2015 07:49:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Fri, 27 Feb 2015 07:49:25 -0800 (PST)
In-Reply-To: <CAJTo0Lax5EpeTy2y0PUGt+x3hM90U6V=oMaTnLGgRi8LtPGikw@mail.gmail.com>
References: <1424832475-20806-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0Lax5EpeTy2y0PUGt+x3hM90U6V=oMaTnLGgRi8LtPGikw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Feb 2015 07:49:25 -0800
Message-ID: <CAMKF1srCWK008StDy4q6-PKdqBaAhxdNPfu38SaBvQU5SEhHUg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Fri, 27 Feb 2015 15:50:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 27, 2015 at 4:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 25 February 2015 at 02:47, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> 219 has been in the docks for sometime, the older patch got merged
>> this patch is now upgrading 218 to 219
>
>
> With this merged I'm now getting these warnings from QA:
>
> WARNING: QA Issue: systemd rdepends on iptables, but it isn't a build
> dependency? [build-deps]
> WARNING: QA Issue: systemd rdepends on libxkbcommon, but it isn't a build
> dependency? [build-deps]
>

I did not see it yet, since they were not part of my distro

Pushed a fix here please try it out

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-5.0&id=70d1beede31ee50ded93ea55cff27b8886161af9

