Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 78A8E6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:15:40 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n202so106705qke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 16:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9mVlF2BeCMnhIsgtlHkx8iOSGTVbmlGddQNthJLYeSU=;
	b=AEyWIdbWVU1QBN8soI6Xmwxc4z6ioEI+bhRTk70QiMgK8bYJ6k8o8YgHzuUUS5pgMU
	t+bCiXekGbgxjQJFWn4hqmccjZRs40xvThK+ULdweYol5EC0Gmr0zDlkgTqtZ+XoZGN1
	VvaAuCpGMhRK4+cOybatST/2PgUh8mnjVPrpMJ5SUDdazl+mVhLEIKgsHyVj/xBFaso5
	uFruk8trRqQrKj7JBtSILskN6ajRG0/YD/wN7mH7P+/UZsIdJGXDZ43X/efYoxIHQtIG
	hk16H1Bl7AxSAAdGbGkppRENywEu0xzS09KSGltXq/2r2/Y/xUYO6DZbO9AJHROiyKR7
	5BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9mVlF2BeCMnhIsgtlHkx8iOSGTVbmlGddQNthJLYeSU=;
	b=jU5+LPEEqi/G/XVYF7QoSbF/PrhLZYUhjxLl+Xbj/k+n88tURg4z8xtPLnuejv3DRU
	KT2wIxmDEGyp0Ct4a5pYGFGrQjuzi+8VvJtWYJtT4jgHMycSObJ4OkBFbC1rjHg3wsbN
	k3wlwhLULO4doffs3YC5VPw4+4Kzu5EShGMhfpMatlil4iu1/P88b8NQeQJr0JVFUhB/
	073cR7GQdmcySv9NG0QewpowK9I9XIeWsNldg+1l/eR1gqAIqEwwV4OG4VVM4okV666t
	9SstofhnuoDK5eY1f9v67Hrcbs1wbxGWHTZzOVRPR5KlWnE8wOFd2HU9p7JIYJUSF2up
	wBVg==
X-Gm-Message-State: ALyK8tIVmtLYyZYyCE0MNhvhaBHhA/0RZf0EaRqVgt3EtxpIfGb7oy4hwj2DB94WLn5KdGypXpeXRFlB9X3ASg==
X-Received: by 10.55.97.18 with SMTP id v18mr6255593qkb.102.1468365340255;
	Tue, 12 Jul 2016 16:15:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 12 Jul 2016 16:15:10 -0700 (PDT)
In-Reply-To: <1468362435.28829.118.camel@linuxfoundation.org>
References: <5784A2D0.9030902@mlbassoc.com>
	<CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
	<57855DCA.1080807@gmail.com>
	<CAJTo0LbJfZSNr5U9G8rBLXfqWfjf3R7uSatEwuQFSA9SfWh+xQ@mail.gmail.com>
	<5785627D.9080800@gmail.com>
	<1468362435.28829.118.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2016 16:15:10 -0700
Message-ID: <CAMKF1sqruoi9yBW75gzgjn7-6h8kTTLJdjoVxLkYx+YJdsxR5g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: Future of GCC
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
X-List-Received-Date: Tue, 12 Jul 2016 23:15:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 12, 2016 at 3:27 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-07-12 at 14:34 -0700, akuster808 wrote:
>>
>> On 07/12/2016 02:24 PM, Burton, Ross wrote:
>> > On 12 July 2016 at 22:14, akuster808 <akuster808@gmail.com> wrote:
>> >
>> > > > Personally I was thinking that gcc 5.x and 6.x should stay in
>> > > > oe-core for
>> > > > this cycle, and then drop 5.x after the release.
>> > >
>> > >
>> > > Wouldn't that be dropped iff GCC 7.0 is release? or are you
>> > > saying we
>> > > should only have one GCC version?
>> > >
>> >
>> > Well, depends on the adoption and migration problems.  I don't
>> > think we
>> > should carry three versions,
>>
>> I agree. 3 is too many.
>>
>>  and ideally one, but two is acceptable to ease
>> > migration.
>>
>> One makes Stable maintenance less costly in time.
>

When we upgrade gcc and it becomes default then most of the validation
and testing for that release happens with that version of gcc. Yes we have
been carrying the older version of gcc however it goes our largely untested
in the new release. We even dont know if the new recipes we upgrade in
the given release have any issues or build with this version of gcc. Everyone
should just default to the default gcc that comes with the release.  So if you
have been on 2.0 release and your apps building with gcc5, upgrading to yocto
2.2 where gcc6 becomes default may not guarantee you well tested metadata
for gcc5. So its in your interest to start using gcc6 with 2.2, and if
one still needs
to keep using gcc5, its not a big deal for them to carry the compiler recipes
in their own layer.


> I'm personally a fan of one if we can do it. We've taken a bit of an
> "easier" path recently but it might be time to change that. Right now
> I'm not aware of any of our core usecases which need 5.x, all work with
> 6.x. I am aware of some BSPs on older kernels which would however have
> issues.
>
> I did nearly send a 5.x removal patch but wasn't sure it would be
> accepted by people quite yet...

You should send it. This will help us concentrate on improving the quality
of default compiler.

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

