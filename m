Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41E147D414
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 12:06:44 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j6so34614043ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3wDNyMO8MYfNBJx4AlBNPOYjqiLBRG6ext738rwrQcg=;
	b=1Iag+sg1Q4cD569yYbCcK5w2LwzLHXQHG5fxawKo0TfRUiNyNC4ypw4KDG/icVn1HZ
	MCN49+hFWOgi6n0u2K6tA2kl+wzxFnyK/8CoTQiseir+0BXPUh+78+OcUJjzNOk+Je81
	cPJ16HoEz8E3xN+wgZTpykqdSgPzKLI8v9Hm+a9r11EQclAC2nioP0H7PsxAhzUCT0Kd
	6d59IWYKZro+j8bceNLCvq8kix/Ve/+8sseAlBZcYDeZiCBYaE++JXIqY34Zcet0Sxdu
	ski6BvGCIQ/mWkM4Y+2TExgtpE8UAYCAP/FvJN5km2ABD49PG0/1zG4aF7XVGx1w239m
	UFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3wDNyMO8MYfNBJx4AlBNPOYjqiLBRG6ext738rwrQcg=;
	b=efqomYx5U1d7r9wwhDiM9I7OcFJpiauniBGRHPP2C96vHsdnCBWC5ntMlcSsXIR/8M
	sAUNodsLnjB4+uOUkYGbYuge+Rpo0zm9NFRmpEu5XnTU5lLj8kHMiOjELaA/BeoFSu52
	QMgqnjRrz5xSKvYgAd1SvbCcj02acV8o2f7Pu6PbkMV+CN8tPOSEcDcA7sXpOHFTsqSB
	OL9Gu9WuA2pM+pbXj1+ARblqe35tU4UpXkGZ8SX+LYEHvxvzl+FKtCawn1kjHzWqORIg
	wxT15nAmnPXFfdgi4MxIPxEhqLEMeN5l9951HqLnyktz/Q7r1PrBJpMozvPkJGwJxQYl
	C1Bw==
X-Gm-Message-State: APjAAAWAy+yzI/9+1jOKDXOigSGx/9h+YzC8Q7w7p1eD8ca49caNVjNe
	PO6DDNta4UVd2Nnk2W/RM1j9neC2M86vHlWph0qqXQ==
X-Google-Smtp-Source: APXvYqwIGCpZszQhv4tqd8AUJcj/2IAFbqDENM0BeCBScDSZJ2h7V20KbGYkjuCAyw0foRoCw1Ql6/KfKL0gCm1w8Hw=
X-Received: by 2002:a5d:9e11:: with SMTP id h17mr18890147ioh.261.1562587605230;
	Mon, 08 Jul 2019 05:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190708073101.7529-1-anuj.mittal@intel.com>
	<20190708073101.7529-3-anuj.mittal@intel.com>
In-Reply-To: <20190708073101.7529-3-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Jul 2019 13:06:33 +0100
Message-ID: <CAJTo0La+J0yFbOjyD7MqNAf_szwDRj5Y7oTTRb6zR1yR7pOu6g@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] vulkan-tools: add recipe
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
X-List-Received-Date: Mon, 08 Jul 2019 12:06:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2019 at 08:36, Anuj Mittal <anuj.mittal@intel.com> wrote:
> +PACKAGECONFIG ??= "\
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '' ,d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '' ,d)} \

bb.utils.filter() is a neater way of expressing this:

PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"

Ross

