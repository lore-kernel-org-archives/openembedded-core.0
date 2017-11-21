Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2254F60248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:24:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k61so9976428wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WHb0A+A74xFwRM+odkYEUrdcE/PR5C0MsDA/+pMK3lY=;
	b=axQzkyE/UpCtdQRwKR3SOGRP3hjQd7jW2mN4N74oByNGqaoPwKJkrHLiV1CBVx6LjF
	6FHd2/2M8X8gWV5KVLi//QidHhXU5h1wAYJhnsl0DMTbw603nWv9nCb6w3qwElAFV70O
	G7udLWPto28zqmtHREE4TrLQQRnch/WfKcVJnNRZRJydvH5rFirevjZaw1ZHrOdwkctk
	BRhpSMAeBtNNjY/+CyWfA7j3XKIY4XDpWivAidWQcjg5ueKK+OW4U+W15K1alv82/s4Y
	m25iPv4YsuExQzHtcMwt1riQM6nmwDztdjzyYNX07BWZ+16zyq2gPf4y7p2wXoZ4DyM4
	X3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WHb0A+A74xFwRM+odkYEUrdcE/PR5C0MsDA/+pMK3lY=;
	b=piNzVtzQMpP5bcOys8XUcWyBwt1eVBAQLlY5iYveXR5MrCKTmHubbeSdyXKLPbJqhv
	9Aj9OHWboEpNJ7o7aZdYVOmLzKD+37XV4EVGJwCkWji/axDVjJpHglF4Of6BDBT1KDnE
	3Yp9t9MFvPFgss2W0Pt7Xcb27cVpIx9XVe5gjpqSoR4a2Ei6Zn4Jdde7qe6eMeulX04C
	m/BC4ZPjAym6GQRhRU7NcrkEzPJsWIHka9uAuq+AaX0ela7iMGOu+aIU1SoqE6l1s09n
	vJdLQrg1wRy+H2qV5jfqSWuvrEHtB3vwtDmEGnPPPeGjEpOvq6XoM2lPJbWJCL9OKrbY
	rgng==
X-Gm-Message-State: AJaThX7Ixzvb2iFls3Ae45L+BvXjKv4ZVi0fxIdrmz+2j5O2o42+UcLR
	Y9rbPZpIxCgTUT+8UocJHGlYf2cC2KiGadVXik4=
X-Google-Smtp-Source: AGs4zMbTgMKC+2QWq6r99Jynov8OgNOhr0fQ96d5QukNHHUDqC/bPB0Ip6EWAjeewy2gNHqID4MQQEuGkKdh7PVj+Ik=
X-Received: by 10.223.184.47 with SMTP id h44mr11944573wrf.11.1511234673206;
	Mon, 20 Nov 2017 19:24:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Mon, 20 Nov 2017 19:24:32 -0800 (PST)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Nov 2017 19:24:32 -0800
Message-ID: <CAJ86T=Ub5KJK6nEUCDithboripFosi2w_f5JifOwEaq7LH4keg@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: backfill mechanism
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
X-List-Received-Date: Tue, 21 Nov 2017 03:24:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 3:32 PM, Slater, Joseph
<joe.slater@windriver.com> wrote:
> The backfill mechanism is not compatible with multilib.

Did anyone ever explain why?

> This could possibly
> be fixed, but the backfill_considered functionality is also obscure, so I
> think in at least the machine related .inc files we should replace lines
> like
>
> MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "
> ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
>
> with lines like
>
> MACHINE_FEATURES_remove_mipsarchn32 = " qemu-usermode"

That only works for TUNE_FEATURES which happen to have a corresponding
over-ride, so may not be a generic solution. Does something like:

  MACHINE_FEATURES_remove = "${@bb.utils.contains('TUNE_FEATURES',
'n32', 'qemu-usermode', '', d)}"

work for multilib?

> There are two advantages:  the second line works for multilib, and it is far
> more readable.
>
> Joe
>

