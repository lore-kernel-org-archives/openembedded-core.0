Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id B32D2717E4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 20:28:16 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j5so4364219qga.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 13:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/iplJK8JiHQgH7BBKTCEXVazCvbSKOKIubVnMXfOCGU=;
	b=ZbuzSegZrp+afrX+bzu3RoeGlxN3eipKxeReIfds3ZNu++AngAbNuJJDNgL85Vf0ni
	m7jZ+63ID2d8rrM1IqP+PR8L4Suson/FHRjuOJRjM+UzQ86qi/bpLdt90iPHC/vBsYSD
	eCFYs5icoc7G+my/eQoTcUq4GuX7Kumrw/JlKkwZoQICouOyBbS7txVU+HdkOw524mT2
	oOgR5TwHztxPHClqzlKnMHZqYR+5RFG924OioO1hw14QjvW2pZEIgayP/B18yoYs3c/+
	AUqYxJfUwYJmDxdID9zGoiItqSDclDWNMXLYYCiSk56NKN/ZhaL6Ce/VvnY3lAi4HnG4
	8cog==
X-Gm-Message-State: ALoCoQmcbtCgfanPbP+t3L62MxTpQLFLByAWiSHVX+EO2MuECWtRIJ5n5WUmz/s5ZY6yjERE+fu4
X-Received: by 10.140.27.239 with SMTP id 102mr30594780qgx.59.1412627297186;
	Mon, 06 Oct 2014 13:28:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Mon, 6 Oct 2014 13:27:57 -0700 (PDT)
In-Reply-To: <CAMKF1soFU6oqKy8HkyRFRtNKCCmsxF6B5Q2s2pr0-ZeWO3jRrg@mail.gmail.com>
References: <1412550979-15317-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYakD7wSHpGMwEYnz_v2xoBv-hiD9zXmHLP72VrVT0oKg@mail.gmail.com>
	<CAMKF1spq=NefNnf4UB6jEurF2+0amt1x3PHT7dX2yOqgaKR=fg@mail.gmail.com>
	<CAJTo0LaDLCMa7S83WPzcxJcim0BEcnq3X4EO6=AtzPB__nxjgw@mail.gmail.com>
	<CAMKF1soFU6oqKy8HkyRFRtNKCCmsxF6B5Q2s2pr0-ZeWO3jRrg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Oct 2014 21:27:57 +0100
Message-ID: <CAJTo0LYtiLm63hZW8cXawC3e2ipJHp1fRDmgPzRbnRrwxeG+Jw@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Oct 2014 20:28:19 -0000
Content-Type: text/plain; charset=UTF-8

On 6 October 2014 21:15, Khem Raj <raj.khem@gmail.com> wrote:
> I dont understand. Doesn't Same patch apply to master

You know I looked at this earlier and thought it wouldn't apply.  Just
looked again and it was me mis-reading a patch (those - and + symbols
look so similar!).    Sorry for the confusion.

Ross

