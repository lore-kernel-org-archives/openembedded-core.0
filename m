Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC5D6098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 16:01:33 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e15so2109503vbg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 09:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=guVStMyVkQun+NkkbnftFVriX0Jz9tO5IzcXKpEQ0DA=;
	b=FL7GyNjaOC7GaCTFb7ZLPXK7n8ktmwLf28uDzHwO1yx3tLEH6O7pAXQm9ilBMhCO5E
	hfgN5iVQKk3jdZFwOrOVdR19sZ5doh14Nh5gLZaRKms7aORURePBpkFN+r7AWXso8pBt
	9VqOhQlQs/XFATrSWfP6w1kTYVW1pqv692Yb5Vzo6YHHe1yfoWNM78Vfgleimb2Xdcgx
	+vsiEWlcLKIzn1DTX2b4nGl1Kse5wlC/R61FE08VjdFpipJcbdRs+TqiAbW7I54Z8Ond
	E591HCgtUiYlYKOfKE6EWzni59iRwQ0sguF5xykJ0cQ0RP9pFGyXvrTAzL/IVE2aH9CB
	7A0w==
X-Received: by 10.52.21.232 with SMTP id y8mr394694vde.6.1371484894172; Mon,
	17 Jun 2013 09:01:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 17 Jun 2013 09:01:14 -0700 (PDT)
In-Reply-To: <959281c96e2293454a6084d17a6f35f2a86129ac.1371392062.git.kai.kang@windriver.com>
References: <cover.1371392062.git.kai.kang@windriver.com>
	<959281c96e2293454a6084d17a6f35f2a86129ac.1371392062.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Jun 2013 17:01:14 +0100
Message-ID: <CAJTo0LaEW2x+LNgN0LaOnNMJLdsNpJTpgS54WNPrbS9Hs=gcjg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Gm-Message-State: ALoCoQn64CxyProIKUjzIq+Zk77cvBsToOfqZKRCLfENbZ5tZas1Vm69XifuNMs6wxql+twQ4+wA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Add needed libx11 library for sato applications
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
X-List-Received-Date: Mon, 17 Jun 2013 16:01:34 -0000
Content-Type: text/plain; charset=UTF-8

On 16 June 2013 15:16, Kai Kang <kai.kang@windriver.com> wrote:
> From binutils-2.22, --copy-dt-needed-entries option is no longer enabled
> by default. Instead, --no-copy-dt-needed-entries is now the default option.
>
> When use other toolchain than default toolchain, some sato applications
> may compiled failed that they need libx11 but don't link to it directly.
> So we should add needed libraries to avoid build these sato applications
> fail.

I've pushed both of these upstream (as they're maintained by Yocto),
and after a build test will submit srcrev bumps instead.

Ross

