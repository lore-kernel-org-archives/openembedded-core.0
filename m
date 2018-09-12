Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id B09B07965C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:22:36 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id g44-v6so1979087qtb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zAXl5fugBf6ISdBnkSjB0nmd/XCPbQQh980p/8chKsk=;
	b=u6unu/gNAedrZkBJmta1TMDcVemBWH4QO612MUHKr157sRonrl/WvQJfsC3/22cjyO
	3Jt4Z7UKdvcUcEBHffLypFBwPMM0B7dXInKZx0GGFN60gCpuzRUmg3am7fd/YOh9TKFo
	K3jalMJQsdph51iplgfx/NXtXg1spr4nM+Yr+JcP1OTzIdwLg9QE2DC0pTYM+qF5YdUp
	KKvsSurYXawXtGxzjozpBUlbFwSK8gkKlEjGYBf9NbIpq6YD175/7nDyIVe4hD8M7aS3
	h0OLat5PYKLJtxbS75uyy9cVuYdI1Sz/Axc3Dpuf358Yz25vgTzN+/dxKMvtru2P3BO6
	BPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zAXl5fugBf6ISdBnkSjB0nmd/XCPbQQh980p/8chKsk=;
	b=kvOhKK8AlA9VkQfEzj605YBxvArRD5O7ZYFY+unVwZTlh7ATbfOwuBqU6De1DGJEhB
	S5eD120zT0RDkFnAKPmkRoZ9yYJufsA3m0mMdo6zsZ/g8QFbYidoDpfUYg6uY6iQQplX
	zE/h11V+mmvEWqen/HlbcTamVCMvIDBhyHRFjAh1zwhlvy5QFXDLYeIQX/QdL11LK3/C
	GSSjWbVq1JiLNJoH0bl63esqE+Gfyom+9yMWh9OojG2g5ujY+B9n+8f4/yypa2yYh7NU
	MjrMEbxcLQgdZwKgqDNUnPtxLKA8ha6WC3JIgzmCQV+DV9OIvZEBOkoFunUUzlOZMIlK
	DlVg==
X-Gm-Message-State: APzg51Dq+3hv2UHJo9hx/NwzaYcnQhhXBDMhhPHYBQgzVLiAqc6lMrpV
	ctQ5PYGAjStKuFikkJ2KiDZ9Q/0k0SnddrJUYFg=
X-Google-Smtp-Source: ANB0VdaIEHuJRsLNBdgep31aKD7+z2UPsjt/VXqT3xfiKmEq9RJQ+AttowyepxwlUFOjupksTc7bMZQVOICbobVrAHk=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr1646100qvk.228.1536762157438; 
	Wed, 12 Sep 2018 07:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
	<41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
	<CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
	<0a2370ce-a756-5cf8-256b-929b70367e3a@windriver.com>
	<CANNYZj90HLS4HZwtZK+9azCa1iMOjTXtWGy1RCBqCwRGPk+mfA@mail.gmail.com>
In-Reply-To: <CANNYZj90HLS4HZwtZK+9azCa1iMOjTXtWGy1RCBqCwRGPk+mfA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 07:22:11 -0700
Message-ID: <CAMKF1spV7wzPB7CtKsB9Kv=hmqCCWVh_h3kzHinS_FG4V769CA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: +lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Wed, 12 Sep 2018 14:22:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 12, 2018 at 3:30 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> 2018-09-12 11:59 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
> > It's a long term target, we should try to push upstream to accept
> > openssl 1.1, such as split one patch to multiple sub patches step
> > by step, make it more reviewable,  not only openssh, ideally any
> > recipe depends on 1.0 should be turned to 1.1
>
> The pull request has been open for two years now:
> https://github.com/openssh/openssh-portable/pull/48
>

I agree we should not take the patch if its large and has no momentum upstream.

> I don't think you'll get far with the pushing the upstream. They are
> happy using libressl on *BSD, and don't particularly care about Linux
> or openssl.
>
> > Currently, use openssl10 as the standalone recipe to provide openssl,
> > everything works well in oe-core + oe.
>
> openssl10 upstream support ends at the end of 2019. We can no longer
> afford to do nothing about the situation.
>
> > As I mention before, there is still a issue at run time image. Even though
> > openssh depends on `openssl10',  but the `openssl' is installed at do_rootfs
> >
> > It breaks DEPEND/RDEPENDS principle
> >
> > [local.conf]
> > IMAGE_INSTALL_append = " openssh"
> > [local.conf]
> >
> > $ bitbake core-image-minimal
> >
> > [log.do_rootfs]
> >   Installing       : openssl-1.1.1~pre9-r0.core2_64
> > [log.do_rootfs]
> >
> > The recipe depends on openssl10, but openssl10 will not be installed.
>
> There is a library package split, so you should be seeing libcrypto10
> or libssl10 installed as well. Can you provide the full log please?
>
> > BTW, Is pre9 1.1.1 openssl a stable release?
>
> Final 1.1.1 has been released yesterday, so I'll send a patch in a moment.
>
> Alex

