Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2E761566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 17:20:12 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id la4so1765683vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=XoqHllwYWX5oQhECx2qOc6Z67uiZrlDbMKEB189wlaQ=;
	b=OzG87lVdfWahFOQr8oErQSOFHXFr9OwtekB6xGILBKvwMzDOtJLNc8yp8TAScrk0B7
	PeuLmljVsz9XddL4SimjMpwUSuakMJvFeJxJUzlyQMdyvwsngEEClBnXpTp31aEYEFmp
	DYLlWjwOUY4W7TIg4FIDrEB3ipTViQQcOfGX7nD0YJ2OrPhFw58e1m/3NYnM3WVmP0tX
	duPnBJKO9irc992EdMd46NEqFGuaxVlKuyjAH5zZvEHV3GUVlDd0h522M6rUVlgtYU8p
	Qa3RiawHZKpz0++JxlIuQDtAY3uSh7sjIFgRizUgdMiE5jmBEo9BkNfsjVqtC5dObPSU
	SUMw==
X-Gm-Message-State: ALoCoQlorDHplVxFlb02ygkpZwvXMBXmAY1y+Ag/Eppm1pw80CCLQakhNjY/BdOUtnOpigQ8eYuv
X-Received: by 10.52.189.167 with SMTP id gj7mr44255vdc.91.1386696011569; Tue,
	10 Dec 2013 09:20:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Dec 2013 09:19:51 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BBEE@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BB97@post.tritech.se>
	<CAJTo0LZ7jfC7UJtYvVCywVGnSkfvHsUcc+1Z7ZW1NNyKYHHXUg@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C4FD9BBEE@post.tritech.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Dec 2013 17:19:51 +0000
Message-ID: <CAJTo0LbN-z3DDEj1aZC1urus3ReerpZyROr_Rr7nuz+FnVKvvg@mail.gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can OE build it's own make?
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
X-List-Received-Date: Tue, 10 Dec 2013 17:20:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 December 2013 17:16, Mats K=C3=A4rrman <Mats.Karrman@tritech.se> wrot=
e:
> On: Tuesday, December 10, 2013 5:41 PM, Burton, Ross wrote:
>> "bitbake make-native" should be sufficient instructions to build a
>> replacement make.
>
> Ouch, that was simple.
> Unfortunately the consistently failing build doesn't feel like failing
> right now so I can't verify that it works.
>
> Assuming that it works, I could of course add make-native to the
> depends of the troublesome recipe but what if I'd like to use the
> new make for all recipes? Is there somewhere else I could put the
> dependency to force bitbake to build make "first of all"?

As far as I know there isn't an easy "build this first" hook as it
leads to scary dependency cycles and issues.

There's also the buildtools tarball which contains pre-built binaries
for most of the tools that we expect the host to have:

http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/buildtools/

Ross

