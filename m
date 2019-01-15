Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 39545745A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 13:30:58 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id c206so2128796oib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qQv73Md0LL4p+zZZTRzT/g+Ee9HAXzJN5dgpSaqrlRs=;
	b=Hdd/I/T+3w/XUWBqhKvlRHnbjg0gqTCpif/pjpH9bgr9VYarvlNh7xD2DRcUJO0/0H
	XstEh575KyKT7VnkpK+fuVd6KHa9zPfxUggUilEPImEs8qEdGMWl88T9r9hFEaUYe8x9
	xQVWzcm9uU2DFtmx/gmChTSSeN3RVuGvC9NufAIhxlTx3lQbBUonrqX1e1jYmzW1Ep9Z
	bHuWrIWLU03mcT48+d6C3RB7DMD4jZaBqNu7BHxKnrFBtJD5/ZItZRd/n2oJ6ST7B02Q
	2s+A1YeEITlJDejj3NAhPlExIo5WD9pl8d4BbGiYhfT7ie7GKXB8ltQbM40VZ/Po5Y4X
	qNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qQv73Md0LL4p+zZZTRzT/g+Ee9HAXzJN5dgpSaqrlRs=;
	b=Qm6lQ2PsFRctv46Joi3MbaJER3sLjTTGRhldNJ6BYPbh2MY531fTWiFlvMm3sFgJ3w
	c2XIdidIW223CWRvMuewr4jlwws53hZ1QW8SmAkaeuf3EdMoELkHaR07poYP1UCQC61F
	KAOzNafJwSDyQVV/hK5Kk8kPb8UrFht7WAhasTJIg0wptDjljrwEG2RpuzTZkI2xWxbc
	8JBnpBgjxS4Z84E+PSZYzPEQj/1M8Z72ojRJVssyEB4O1FPbMH03vNDXaJDwlex57vfU
	COVdSdWRfdK6QdBZ0LKP6xhzKYVXp5QLYcrtPgcvxsj7muS3427oz3JKQu+gvUXgOvRY
	K7TQ==
X-Gm-Message-State: AJcUukfArFMHGaJbripr6xDKXsfrYRI7Utl8MTeEzu1aX75+uTti/pcm
	Xqx3DYA21D0+uHEWJVAX88BmDco4oZLS0XkXDfM=
X-Google-Smtp-Source: ALg8bN45ArHIsHWoagEmXg5FNhIxozyIj6fQhqwLNzVF4sJ6GoEYbFsqjBl+8XjuLrx/MvqoFIDBYo4/8U5/vnr1AiM=
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr237997oit.325.1547559059178; 
	Tue, 15 Jan 2019 05:30:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<699c3aa571ce454e98d6fb405e1375a56aab1c3e.1547477793.git.alex.kanavin@gmail.com>
	<CAJTo0LY0FF5apEOOz8N9rCdXwsJ+F3LYiw6R_KMhrS-WQgmY7A@mail.gmail.com>
In-Reply-To: <CAJTo0LY0FF5apEOOz8N9rCdXwsJ+F3LYiw6R_KMhrS-WQgmY7A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 14:30:48 +0100
Message-ID: <CANNYZj8OkeawXP_PVXHtngcqn3Bm6i71Xmng9ZVHV9EJWHiJOQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/23] mesa: enable native and nativesdk variants
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
X-List-Received-Date: Tue, 15 Jan 2019 13:30:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jan 2019 at 17:05, Burton, Ross <ross.burton@intel.com> wrote:
>> -ANY_OF_DISTRO_FEATURES = "opengl vulkan"
>> +ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
>
>
> Sounds like this means we should be fiddling the native DISTRO_FEATURES instead of making a distro feature check target-only.

The precedents in oe-core seem to use DISTRO_FEATURES only for target
builds and I tend to agree: it's better to have a 'one size fits all'
approach to native packages, both to speed up builds and to reduce
complexity and need to test variants.
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc

Alex

