Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 444746E9D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:36:00 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id fp1so6353808pdb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 05:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=pTXCPtw5xgvyKAiAmP62y/9Ou4vcCYksY0D9Z0pf6JA=;
	b=WztNVDUX+w7ZLOhZVEbJS+iDvEP0S08WEQjMDoBuWrr5SNhsxWxhfORz++X566iU9Z
	LnYwi0cVo9h8GoCfMSrhZT9mlp6Io4weoDymxzU/+Q+JIVgOCf+fK7f/0qIvGSdZ/z0F
	VCBdD3AmG14elwlLInUpmEdn0B6S6aBmc4FHF3h5qHnFzqjXeHwD41wpKV5kTWlJ3jfO
	7kpakkR53lk1C58Q+RSFeyulP9SwiZ8yNxYGTdP6/vRHDpcutRtzeukQEIJwTUggk8+p
	OPzNyoTkAXCX71LA1n3SDxSaJhyt/a+gtvjNp20x4PjbFbF1aCC286SBnTYXiC76yHdq
	FHXQ==
X-Gm-Message-State: ALoCoQmEPaDAU0CH225+6AnfwaRpeFWfVtTv04NgD6csHoZnXaGFtnA5aWJ6GYji3e/XUlwUNh2x
MIME-Version: 1.0
X-Received: by 10.69.2.2 with SMTP id bk2mr25098141pbd.75.1393248962052; Mon,
	24 Feb 2014 05:36:02 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 05:36:02 -0800 (PST)
In-Reply-To: <CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
Date: Mon, 24 Feb 2014 13:36:02 +0000
X-Google-Sender-Auth: KTK4nWCoviMPehWMUhFCN2RT63c
Message-ID: <CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 13:36:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 1:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 24 February 2014 12:01, Laszlo Papp <lpapp@kde.org> wrote:
>> For instance, the MeeGo Nokia phone had a software version information
>> in the settings, and that is something I would personally consider as
>> the image version, but again, there might be better ways. Please share
>> good practices in here., or alternatively, feel free to point me to
>> any documentation, examples, etc.
>
> This is an interesting example and a useful demonstration of why the
> image version isn't always that useful.

I am not sure about that; see below.

> The software build number
> covers *everything* that goes into the image, but the image version
> number is just the version of the top-level image recipe.

The problem is that build numbers, that I have seen at least, are
human unreadable. A human readable number would be nicer to have;
something that I have just double checked on my Blackberry Limited
Edition phone, and it is so that the OS Version is 10.0.10.738 in the
settings.

Perhaps the build number can be made human readable... but currently,
when I build an image, all I get is a long and not so convenient
time-stamp. Is there a more gentle way of generating image version
then?

> If you bump
> the version of eglibc your image version won't be increased.

Yes, but see above.

> There's nothing to stop you doing versioned images but as the version
> doesn't represent anything beyond the image recipe version it's not as
> useful as you'd think.

Perhaps the image version is not the right way to address this issue;
there might be other way, but it is still an important question for
embedded system creators because I have seen that at several clients,
and also on phones, that the software is shipped in one piece. I
rarely see that individual packages are sent for a software upgrade. I
rather see an incremental software update provided to the customers
out there.

The good example for this is the phones, tablets, etc (at least
mine)... but there might be other examples, too.

I would like to figure out a convenient and shared way or more of them
how to deal with this generic issue. It is not vendor specific, I
think.

