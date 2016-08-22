Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8E636731DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 10:18:42 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so77973852ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MFbLbPNMa12d5c2Ov8N2jA0llUZcDjGbcW9AXLMyGK0=;
	b=ZunYoDdaEda51BMep7uu02gbK2twoopx5t6JYedL61AOilmGhgP0RJMNgHu89lL4HY
	VNd1GjFvzP6Avf6jqpJvsI4DBwOnk0iWayeAZAx2QEYyYZnWt6D8vXaZM9n5whDJ7Y57
	UtgneS/HWgR61ksefOX3FP/pQ9dYzZCpNmbU8FgwAxSNscxVDd9cmXJGswGlKH97dp7G
	tYFl6qfrUe10nMZQgW/ZWim/C9P+5LEMgIJZBQiBliX4/BN602a9Py3UugAsHRCAkrwO
	aHxq1h6H8FJu8AX42rbLBLziBhPvR4dBeelWjCneDRK3fpatEC/iFbjyzv/Lw2YfAuXC
	36Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MFbLbPNMa12d5c2Ov8N2jA0llUZcDjGbcW9AXLMyGK0=;
	b=FdTwjybMPoDOxbKlVFF/oiLs7YjxeF3UpdANC65dW3rkc2S22rUBzSj+Ay0lhaHwL3
	/scJ5Nh1c1WSgX2KweQgeWCoiw2SiKw3Hc/ox4l2g/xS+6yDL5q+kfk1rJyadBdBZ51j
	Ihrlrl85rygUn0YkORQ2STuyHh5qy09I1Bf2chToFAG+wyPQlAXCYQq6Bdm9vyQhVLql
	1qbhsXYA6PcZjs+npCcQhQ2RQCteEobzOyw84De5gLB4Gg8Xmd5tpXMvs1raey74Qjuy
	tRwOBRly0KgUVz9o1+yF0lUOsULDxzu6ZEvY8wKDGHnoWmgY0WpMM5TIiIhAUau6fkIn
	JSfQ==
X-Gm-Message-State: AEkooutS4WBxZrM7HsezHFvVHIvy8gDpROUTW3jziXT2HICytwDUy9m2nMzyywxCKgDRRUscaxFNBpFN+xuw2NHJ
X-Received: by 10.36.57.211 with SMTP id l202mr20014106ita.22.1471861122939;
	Mon, 22 Aug 2016 03:18:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 22 Aug 2016 03:18:22 -0700 (PDT)
In-Reply-To: <ly1t1hjg44.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1471246474.git.hongxu.jia@windriver.com>
	<f2d0736dd176c21c4ef1d539a7e82dbfd1367f2a.1471246475.git.hongxu.jia@windriver.com>
	<ly1t1hjg44.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Aug 2016 11:18:22 +0100
Message-ID: <CAJTo0LY1L1zadYdw+AH=hVD6xu5r9sRap_G7+iALhf9q41Excw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] ncurses: upgrade to 6.0+20160625
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
X-List-Received-Date: Mon, 22 Aug 2016 10:18:44 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca645070053aa65f00

--001a114ab3ca645070053aa65f00
Content-Type: text/plain; charset=UTF-8

On 22 August 2016 at 10:40, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
wrote:

> This breaks the build with OE because it tries to split our $CC.
> E.g. with
>
> | CC = ccache arm-linux-gnueabi-gcc -march=armv7ve ... --sysroot=...
>
> configure will warn
>
> | your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options
>
> and messes up CFLAGS completely so that 'arm-linux-gnuebi-gcc' becomes
> part of it :(
>

I've long wondered about changing our abuse of CC to hold the sysroot,
ncurses isn't the first recipe we've had to patch over this...

Ross

--001a114ab3ca645070053aa65f00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 August 2016 at 10:40, Enrico Scholz <span dir=3D"ltr">&lt;<a href=3D"=
mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sig=
ma-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":565" class=3D"a3s aXjCH m156b1a0a8ea27843">This breaks the build wi=
th OE because it tries to split our $CC.<br>
E.g. with<br>
<br>
| CC =3D ccache arm-linux-gnueabi-gcc -march=3Darmv7ve ... --sysroot=3D...<=
br>
<br>
configure will warn<br>
<br>
| your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options<=
br>
<br>
and messes up CFLAGS completely so that &#39;arm-linux-gnuebi-gcc&#39; beco=
mes<br>
part of it :(</div></blockquote></div><br>I&#39;ve long wondered about chan=
ging our abuse of CC to hold the sysroot, ncurses isn&#39;t the first recip=
e we&#39;ve had to patch over this...</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114ab3ca645070053aa65f00--
