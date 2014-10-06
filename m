Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4123A717D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 19:58:37 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so4181855qgd.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 12:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o7a5DOqw9phDrVlHHLttmAck9kFLwDJftJj6bvYGHoM=;
	b=YavSPg4i5jE/usF4XecKVdGlQiN6vzeRaFqH1iOZm/JNmsnB5BQPnPvWzul5Hk1nFL
	hSdt+dfi8E8HUNprEF7LSnpW0j5W80TQSOH0IEdGthRYmKXs+GtuxySzZEuLuuxTx6Xv
	HuCEhE1f2bIU+YYhOC+ax5QZPKV1hCcuSF5eCjLp78sOk244bXik1PXmyeGGjZURQ02K
	9i5i9OIyYY8xnv7rkspBVcu26GYGVrCHYOlM0JTyOWuDbRhDA7uSXSs1iaKO09z7EFI/
	dC1rkVU1LcGtLvgKptZakkTZtoPxuV4agZsFmLmnFUzpSe8uJ/gg04wALHtbrc2HWG4B
	lOkQ==
X-Gm-Message-State: ALoCoQnhi8ZLqahJWhGCL8YaxVX2STVKKcu1JNWDElBw5vy7dLNuXSp8qlLV9UAZOZ84+RxDMIA3
X-Received: by 10.224.63.140 with SMTP id b12mr32884288qai.22.1412625517615;
	Mon, 06 Oct 2014 12:58:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Mon, 6 Oct 2014 12:58:17 -0700 (PDT)
In-Reply-To: <CAMKF1spq=NefNnf4UB6jEurF2+0amt1x3PHT7dX2yOqgaKR=fg@mail.gmail.com>
References: <1412550979-15317-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYakD7wSHpGMwEYnz_v2xoBv-hiD9zXmHLP72VrVT0oKg@mail.gmail.com>
	<CAMKF1spq=NefNnf4UB6jEurF2+0amt1x3PHT7dX2yOqgaKR=fg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Oct 2014 20:58:17 +0100
Message-ID: <CAJTo0LaDLCMa7S83WPzcxJcim0BEcnq3X4EO6=AtzPB__nxjgw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] gnome-desktop-testing: Fix build on uclibc
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
X-List-Received-Date: Mon, 06 Oct 2014 19:58:42 -0000
Content-Type: text/plain; charset=UTF-8

On 6 October 2014 15:30, Khem Raj <raj.khem@gmail.com> wrote:
> Yes. It should be in master too, I was not sure if same patch would be
> needed on master when I sent this one when I sent this one

Both master and daisy have the same release of gnome-desktop-testing,
so please submit a patch to master that can then be backported to
daisy.

Ross

