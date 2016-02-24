Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id EEE87772E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 19:05:58 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b205so2366893wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 11:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=DY9VFp/9JHQ0YtJURa3ALZCjDw185VrtUeDUdaqtH1M=;
	b=wMorq8ILt47Z/fV8qytH+yoeGKXlsFXcdXoWPkJOl3/8Zk5QhWt7w9l+03yjVcQE1o
	dEYPBkpcXBO17h5bxr3DReYHbKNXB/GO7qlWWbvB8d4pMIxV1ryWq+V/KHNRzCCwn00N
	3Sw4fqCuCF6YY1Rt0FzYIhp/6bWpt4ZsKgzP3LdwYw/dkv5mAWX/cuFIUEIk/T+UUh4x
	2pW8LOswSW07zq5P91cEmcp6yy4lqTXefBuFEdMf5WYB3r8DQuoIejfq0ovFYTcGSPdT
	i9pRvlJr62NgiUcTar5PTTRJogCGS18EaiS4tZV1MrJEy8bp4+iZOfLcSmZVeUTmoWrd
	1e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=DY9VFp/9JHQ0YtJURa3ALZCjDw185VrtUeDUdaqtH1M=;
	b=el47L3OAF3LxhY/c+YHRsyBvqJU+5+puuyDehmyMkaZA4Buci4OffXiXJ2wwyvMkj7
	AUG2ZWB7AZiCNLNe5ZKW2Ri6py1k9RiavH6KDy5ixbU6Tr/aTMts+j9bmvEt6pi0KdsU
	EWcYocSUehg6NJxNeSWsoP2cK/akxyIgY67IfiscK2MtVj+gIcAge/by0EgYgmw8ZcPz
	vTmnzoRkYV68lCZGc/7h7oqNkD++R5mTNkRw/0/0pmlnah26MzPPdoS2RodaoM9xC1OM
	5FtUZObm2pDG+w5JE2nsmtztMNooUasXyzOtRGfwb685FRdaVLBz9DBfx0g/RAW4WVik
	jvnw==
X-Gm-Message-State: AG10YOQWtDeexI2lyidV+xvSdYTrALuGbIZKnJc7RfZTDgyXPp5CujfOFeuRQHy0/s5y17HkoXIQ99GcLxVSqw==
MIME-Version: 1.0
X-Received: by 10.28.50.133 with SMTP id y127mr25051764wmy.4.1456340758873;
	Wed, 24 Feb 2016 11:05:58 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 24 Feb 2016 11:05:58 -0800 (PST)
In-Reply-To: <20160224125133.GA7560@jama>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
	<20160224125133.GA7560@jama>
Date: Wed, 24 Feb 2016 11:05:58 -0800
Message-ID: <CAJ86T=UD=F4Bic8N6m4ii_DVSF_X-0K0uf0dTGbw-3t7UoTcWA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] libsoup-2.4: cleanup + disable libsoup-gnome by default
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
X-List-Received-Date: Wed, 24 Feb 2016 19:06:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 24, 2016 at 4:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Feb 18, 2016 at 11:21:23AM -0800, Andre McCurdy wrote:
>> Andre McCurdy (2):
>>   libsoup-2.4: minor formatting improvements
>>   libsoup-2.4: disable libsoup-gnome by default
>>
>>  meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 20 +++++++++-----------
>>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> It looks like this was merged without suggested fix for upgrade-path.
>
> Will you please send follow-up patch?

I think the v2 series was merged OK. Here's the commit which tries to
prevent renaming when the gnome PACKAGECONFIG is disabled:

  http://git.openembedded.org/openembedded-core/commit/?id=f5f95f501c8aacb3d624e683b4b5b8403115ba5d

> It also most likely breaks libgdata in meta-oe (for complete log see bitbake world
> reports or errors.yoctoproject.org)
>
>   | configure: error: Package requirements (libsoup-gnome-2.4) were not met:
>   |
>   | No package 'libsoup-gnome-2.4' found
>
> Maybe it will be resolved by libgdata upgrade sent in
> gobject-introspective set, so this is just FYI.

OK. I'll look into this one.

> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

