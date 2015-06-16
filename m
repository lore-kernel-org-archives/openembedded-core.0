Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 16D80601F7;
	Tue, 16 Jun 2015 13:27:21 +0000 (UTC)
Received: by pacgb13 with SMTP id gb13so12964549pac.1;
	Tue, 16 Jun 2015 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hmkex+jX1EXN9IJns5BieF8PJ4evfZx7aKFrADSFx+E=;
	b=wlfqyJ0Kv9lm6xw2IldCGVQApfSNvDhIQJoJFHi3VmiGJ5AsGeLc9teQ44k3eBqcIO
	6btzUHtVMeQ77a1UhjPqfBq9xieJnnONAD1mGvxjjDZHo7Bb9+xAlLPIgej7MwVhD+MI
	8ky4RQvoarupkBsLbSmuqYBf/s19NhOTOxB89sbgeNqDXv157EMSv0HIqefwrsSvi9ft
	/F20dxmIRrrDf/ZCqn84WNvB0wr5i7K77dPEmApUwlZAakhdIySpIIP+B7pb+6MXRx3A
	T+xenHO/4NVKmn74/8vxG2XTIw89Y4mJqjGhUasg8ByHyOXcC8Xuy2fBRQhLSEXXQPCb
	agPg==
MIME-Version: 1.0
X-Received: by 10.68.200.100 with SMTP id jr4mr649919pbc.168.1434461243095;
	Tue, 16 Jun 2015 06:27:23 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Tue, 16 Jun 2015 06:27:23 -0700 (PDT)
In-Reply-To: <55801903.4040905@linux.intel.com>
References: <557E9EFE.1030703@linux.intel.com>
	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
	<CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>
	<557EE4C2.501@linux.intel.com>
	<CALbNGRS-xR52wapA2viFa0oZJ6kotFdjhXpb6kyOtpRyn--5=A@mail.gmail.com>
	<55801903.4040905@linux.intel.com>
Date: Tue, 16 Jun 2015 15:27:23 +0200
Message-ID: <CALbNGRTJeh4eCD45cGUOx-DRZPHSeKTqndq1Jk+7V-ANQtAPNA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Tue, 16 Jun 2015 13:27:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2015 at 2:39 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/16/2015 09:50 AM, Andreas M=C3=BCller wrote:
>
>> How about doing same as others do e.g fedora [1-2]: Keep two version
>> of webkit-gtk based on same recent code:
>>
>> * gtk2/webkit1
>> * gtk3/webkit2
>
>
> Before showing how, you need to explain why. Fedora has to package webkit=
1
> because they have a lot of apps in the Gnome stack that still haven't bee=
n
> ported to webkit2. Oe-core on the other hand has only one such app: midor=
i.
Yes and midori is the only working browser in Yocto (I know): firefox
crashes since very long time for illegal ARM instruction and chromium
does not start at all.

I suggest we stop discussing my comment: You continue updating
webkitgtk and I'll try to get a working browser.

Andreas

