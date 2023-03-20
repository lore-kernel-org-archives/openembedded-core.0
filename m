Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78CCC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 06:16:01 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.7814.1679292953006379905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Mar 2023 23:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ceLc8Z4O;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id f18so13526973lfa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Mar 2023 23:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679292951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fadjFh5gWRddBRgbMQZTxDk9zqNuE6DM+GwZGMKN9zo=;
        b=ceLc8Z4O8es1tebmheNmHNBKPeELhkch+YuEmSrBG8xjclA0VzOpzQ4r0k1/dX4Ogb
         aPZAxd+Pre2BhGhTdOLfqaNG13pvWysr5Y9nUTaFfD4O7zSlt4lllDLVDlgZPTtgp3fK
         LInp/CtZnjmotjhC9QTbVvx3fnrLjw0jVUoxjCiG0+qsD4xN87tjadLFOze1fBWIJ2Uz
         g/iCVgjnO9IVj8obujfM3Xrnh9etfAkndA8ex7XPVA+Yc5iDa0T6+eskUI6Viiua+EVP
         TGyyugGTvAmxTxKExi0N1fdbvkYPncDZuVhfPVGDFoyYUsVF280n3o71DcWKO2OdZaUM
         ay+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679292951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fadjFh5gWRddBRgbMQZTxDk9zqNuE6DM+GwZGMKN9zo=;
        b=KUbvvpZHvWrkVgNxATeFq29l2jBRTXXcwZMEWPNX71uZC7enWrqJtnluOY+kCH7IAs
         xww8uCWoA6w+OMIZKm337bRPUfQl3I8r4Hwdjw8xzPLvvAfzzKX97LXNrRKU8UQtVWci
         2otTCDf9G2AgAUOCZbk2M0tNlx4VNSBU1ZQW4VsBG8fQAgIWBSC8GHJc13y0Z7WVf1j6
         jUp4r9U1JjoXoQyYy0hCamD4fVB+sVeKyHDHSjClqnY7NVWo9Hnnc8ubOeFDNOmNHmEa
         /NGbE7JU+kdZ1mVqVe43dyD5HSvTMxQXD3i29/LpMHZ2FJs+3tgNGOTi8qIO9zB+ogQh
         A5xw==
X-Gm-Message-State: AO0yUKXpL8vLr8OG54I+VBWloliezZ/5Uglt6nPWGMZOADCBtxM9cEIA
	Aj31/FO0aL2EOAy1iUUV9QRFqg==
X-Google-Smtp-Source: AK7set8l65zXVVR9nq4pSdro5CqMct0xfwB3MN4eI+Zdd9lQos5fHTLyS2lUvZ7DX43SMbH0rXDMCg==
X-Received: by 2002:ac2:443b:0:b0:4e9:d719:3603 with SMTP id w27-20020ac2443b000000b004e9d7193603mr776227lfl.55.1679292950953;
        Sun, 19 Mar 2023 23:15:50 -0700 (PDT)
Received: from nuoska (85-76-100-193-nat.elisa-mobile.fi. [85.76.100.193])
        by smtp.gmail.com with ESMTPSA id y1-20020a197501000000b004dcf20843efsm1553963lfe.239.2023.03.19.23.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 23:15:50 -0700 (PDT)
Date: Mon, 20 Mar 2023 08:15:49 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jerome Forissier <jerome.forissier@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] e2fsprogs: switch from master to debian/master
 branch to fix compatibility
Message-ID: <ZBf6FVpE022lf/NA@nuoska>
References: <20230317100923.3295331-1-mikko.rapeli@linaro.org>
 <CANNYZj_RVtE=Ud1Tmcr5H0_zQZS_SK+5CT1ro4oanudVdTfBWQ@mail.gmail.com>
 <ZBRWmcQjRoq631S8@nuoska>
 <CANNYZj-bB4DUWL0HqkAmJyKm7WHEdDatXZZC=EqRVuAfuFwJfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj-bB4DUWL0HqkAmJyKm7WHEdDatXZZC=EqRVuAfuFwJfw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 06:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178799

Hi,

On Fri, Mar 17, 2023 at 03:25:10PM +0000, Alexander Kanavin wrote:
> On Fri 17. Mar 2023 at 12.01, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> 
> > Hi,
> >
> > On Fri, Mar 17, 2023 at 11:39:23AM +0100, Alexander Kanavin wrote:
> > > This doesn’t seem right. We should not give special privileges to tooling
> > > from any particular host distro. If you need to manipulate images, build
> > > e2fsprogs-native and run that.
> >
> > This is about ext4 images breaking compatibility with older versions of
> > tooling used manipulate the images. For Debian the upstream maintainers
> > and Debian package maintainers agreed to keep the backwards
> > compatibility for longer time. I think that makes sense for yocto too.
> >
> > While I agree that using e2fsprogs-native is a solution too, I also
> > agree that a lot of users are using non-yocto e2fsprogs when e.g.
> > flashing images to target HW. Breaking compatibility can quite simply be
> > avoided and upstream will maintain this branch. Win win from my point of
> > view.
> 
> But then we should put e2fsprogs into buildtools-tarball(-extended). It’s
> not any different to providing compatible gcc, when one from the host
> distro is too old.

I think this one is a bit different. At flashing/install step people
frequently manipulate rootfs images coming out of yocto builds to match
what HW and various boards actually have, like extending the file system
to fill full EMMC/SD cards. Like dd the .wic out of a build but extend
the file system for the full disk before first boot on the system.

> Taking a custom branch creates a maintenance problem. What if it stops
> being maintained? Will it follow proper upstream closely? Can we ever drop
> this backwards compatibility? It creates a long term headache that I do not
> want.

This branch is from upstream developers who are also the Debian package
maintainers. Of course anything can break and no support can be
guaranteed.

https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=debian/master&id=1181f164c48574a4813bfa203dbd7b4123154021

"author	Theodore Ts'o <tytso@mit.edu>	2023-03-04 22:04:29 -0500

Disable metadata_csum_seed and orphan_file by default for Debian
There are a lot of debian packages that assume that mkfs.ext4 for
Debian N will work on Debian N-1 (and sometimes N-2, N-3, etc.).  This
is a bad assumption, but it's too late to fix this for Debian
Bookworm.

So revert making these feature a default for now.  We will enable it
again post Bookworm.

Signed-off-by: Theodore Ts'o <tytso@mit.edu>"

That explains the timeline a bit. I think this is sensible to follow. If the
branch dies and there are no more updates to CVEs etc triggers, then switching
to master branch is ok. Right now the branch is actively maintained.

Cheers,

-Mikko

