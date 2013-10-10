Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id C42546D01D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 15:59:28 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so1290928vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 08:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9ljBCg2D7ch7BkC+edPCW4YoTqhJu4MWMhqNWhuqwAg=;
	b=TH6X+2qSf7sV2GGloIgYASLaRUmIYtnRWqqPm33lYwyhifbQ8Bfl5U6VXKRGBVcVvj
	R8QmU34D8i3JSJJ2EnNFoGRtkUcZlZ/6OcuyFWE9Yp8wCFmf63LNmIsV1PpaSFfnbj58
	t0a5unQwVewZC3cjnyjLmFACVOAri9Vll39HzFO4hZVXlxvNCjUSvKjsl6DEAwVTbFS2
	1IuKsXQUMxHTntK5qBSgjgIU3JQcQujfau0e+xHmbIUJAKdxEv9A7P4BCs9ifQpQZEGu
	P5FxncDPLsHHUZBynyK4tENdenrzicaqmtROE5elbdOkC0YR+RYH4BbJeFFn8B46QQOs
	UaHg==
X-Gm-Message-State: ALoCoQmtkwsUBQGNwxEeMPoBLBDGISCsDLG3DUcZoBIlU2C6FGjPRUZbG0lXF4im5uGYH+WdJUY1
X-Received: by 10.52.185.8 with SMTP id ey8mr7025361vdc.107.1381420770026;
	Thu, 10 Oct 2013 08:59:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 10 Oct 2013 08:59:09 -0700 (PDT)
In-Reply-To: <5256CB7B.60500@eurogiciel.fr>
References: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
	<CAJTo0LaW6XJThFnBGydYNDBMZ-_ONt=BRgbnosNapadyDyoqFg@mail.gmail.com>
	<5256CB7B.60500@eurogiciel.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Oct 2013 16:59:09 +0100
Message-ID: <CAJTo0LZbM_gL5ZEEWCTH=C2r9bLK_G-TZ5q6Lj30eOQZnHgTFw@mail.gmail.com>
To: Ewan LE BIDEAU-CANEVET <ewan.lebideau-canevet@eurogiciel.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] wayland : Bump to 1.2.0 version
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
X-List-Received-Date: Thu, 10 Oct 2013 15:59:29 -0000
Content-Type: text/plain; charset=UTF-8

On 10 October 2013 16:44, Ewan LE BIDEAU-CANEVET
<ewan.lebideau-canevet@eurogiciel.fr> wrote:
> Wayland is still installing this m4 file, so why delete this fix?
> From a glance at Wayland 1.2 it looks like it isn't required anymore
> as pkgconfig is used to determine the paths, but you need to state
> this in the commit message.
>
> This file
>
> wayland-scanner.m4.in
>
> doesn't exist anymore. In fact there is only "wayland-scanner.m4"
> Run sed command on a missing  file wayland-scanner.m4.in  is now useless,
> correct ?
> Furthermore, in wayland-scanner.m4 has no reference to strings
>
> @prefix@
> @exec_prefix@
> @bindir@
> @datarootdir@
>
> So if we let this instruction wayland-scanner.m4 will  be cleared. So this
> leads to build faillure.

Sure, but this rationale needs to be in the commit message, ideally
after verifying that the pkgconfig file doesn't have the same problem
that the m4 had.

Ross

