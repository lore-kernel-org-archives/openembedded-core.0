Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6F44A6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:49:19 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pa12so3826527veb.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 07:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=qN/7C21D190RRncUZ5aVh9GNDuhqneoXah5vBIKE9SQ=;
	b=L1o5bMXF/lrDxoSaku0cpnUdml3I/lRHKJm/x5w3QIpoAoLYdaSPVbfsRhRxDJWQbD
	hUC11i580T9wOYR8wbKW6kf/wKqO6yIc1scGzK/ACUhEuQxO76HH8PxYKF0+k2FxuwE3
	rNAVbcMIMgTulJY0RE/U2QZC8+tJlUdNtShdGcG+d2Hi0+dKUjmlMEUVeeQ3T0IjvGke
	L1VyWGMBWlf7JEsXb9R0vPC9iCOyj7NahocdX2dcmSSdUOD6kQyNLJmbE7NvQxOzGMfu
	9sSfZ/AMiKReIGr8oBOwSLhm2qwYpU+FbH4BeyAh7kHx+fZSUyoT5Z8nEFGIvoir96SH
	pHiA==
X-Received: by 10.52.29.106 with SMTP id j10mr7885840vdh.77.1372690160429;
	Mon, 01 Jul 2013 07:49:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 07:49:00 -0700 (PDT)
In-Reply-To: <2393683.pgSWLXlTRj@helios>
References: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
	<1372372997-1604-5-git-send-email-sgw@linux.intel.com>
	<2393683.pgSWLXlTRj@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 15:49:00 +0100
Message-ID: <CAJTo0LbtyiNhLKvfnn7dE-mUckef7c10wdpj2OKjb5UfrAek5Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQm5tWDIIZ77nD9kPBFdTI/C56JJf4G18iqKJHQwDGfXtyE9hh/fz8eU7w8743jUAKTYwXG7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] packagegroup-core-boot: used udev-cache for sysvinit
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
X-List-Received-Date: Mon, 01 Jul 2013 14:49:19 -0000
Content-Type: text/plain; charset=UTF-8

On 28 June 2013 11:02, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> I appreciate the intention here but I'm not sure if this is really the
> appropriate place to put this; packagegroup-core-boot is supposed to only
> directly pull in the essentials required for booting. This will cause problems
> for those people using alternative device managers (e.g. busybox mdev) as
> well.
>
> I'm not sure where this should go, but adding it to VIRTUAL-
> RUNTIME_dev_manager (in the distro config?) could work. Anyone else have any
> better suggestion?

How about making udev RRECOMMEND udev-cache?

Ross

