Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3C4605BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 17:03:06 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id i8so15866127qcq.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 10:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6yHGYjzdxNASvbyn0NopkzYGLCxaNddv27AxkZkkrAI=;
	b=CdQYIIrpeQotVcyr7FkzTjcytnSeatP1d2DQ67DCLOBunpjWUuMHDYfTxcCgIQo/UK
	9NbiMsX1sAwp4KlhBk5RQcnH762AdQZ3TU/HrW9+BN153HcxQWKKRp+fmE1O6JVbm+xq
	bKJfo7bHTyVjNz0IKyV6/MRFCIArnr2GS0/9a0yD1mVy+Tth6gQqUxSfu5BxwfUvApEL
	m/7QbdpOJTIq35xATdwuLJGUw9IV9BdQ3ZjOsRo2+DTwZNHKXxxrQoJfqRAqzby9zYNO
	aLs9vAhz65NZIySkvyD6pRbj4mRlYOncykUx2NU8R/OTf73eAmIyt2KOxKGkLTwpwb8o
	e5ag==
X-Gm-Message-State: ALoCoQndNGGyBZAftTkQ+xp8s63V7jJaq3we257CgUDoBll9thlYtPbdVjXGn/Z0diK08GDvMptn
X-Received: by 10.224.103.65 with SMTP id j1mr44186690qao.17.1410195786903;
	Mon, 08 Sep 2014 10:03:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 8 Sep 2014 10:02:46 -0700 (PDT)
In-Reply-To: <lyoauufjw2.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<c57d855c12c783cdfa52f304e52fc2fd1267dd96.1409655125.git.Qi.Chen@windriver.com>
	<5408BDC6.2060006@pabigot.com>
	<lyoauufjw2.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Sep 2014 18:02:46 +0100
Message-ID: <CAJTo0La3gCJNf1znoW8M4W045rE0pbsoZo=_My2p3i5ZCkPPrg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/26] systemd: upgrade to 216
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
X-List-Received-Date: Mon, 08 Sep 2014 17:03:16 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2014 11:21, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>> Maybe systemd-networkd and its constituent pieces need to be pulled
>> out as a separate package?
>
> Yes; I think this is necessary.  systemd gets larger and larger with
> each release and is providing functionality which is either not needed
> (logind, the network stuff, nspawn, nss modules) or which is solved by
> other parts of the system and is conflicting with them.

Considering the number of patches still landing in resolved and
networkd, I think just disabling them right now is safest.  I just
sent a patch to do this.

Ross

