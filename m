Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D23F17148F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 17:09:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2014 10:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,556,1406617200"; d="scan'208";a="593933361"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.139])
	by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2014 10:08:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Fri, 19 Sep 2014 18:08:57 +0100
Message-ID: <17868307.0UxuRyX4nr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CABcZAN=EGg68zyNGoefo9yr4GS8W8SjLjtZjSLSdoECEzZwvFQ@mail.gmail.com>
References: <1411031735-14721-1-git-send-email-marex@denx.de>
	<6249697.nqJ7MiLpN2@peggleto-mobl5.ger.corp.intel.com>
	<CABcZAN=EGg68zyNGoefo9yr4GS8W8SjLjtZjSLSdoECEzZwvFQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nativesdk-packagegroup-python: buildtools-tarball: Introduce NativeSDK package group
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
X-List-Received-Date: Fri, 19 Sep 2014 17:09:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 19 September 2014 10:02:29 Christopher Larson wrote:
> On Fri, Sep 19, 2014 at 9:42 AM, Paul Eggleton <
> 
> paul.eggleton@linux.intel.com> wrote:
> > There's clearly a bug here, adding a Python-using component does not mean
> > you
> > should have python in the SDK but that's what currently happens. There is
> > a
> > bug open now covering this, we will do our best to address it in a timely
> > manner. (FWIW, I would have thought this issue has been present for some
> > time
> > rather than being a recent regression.)
> 
> Ah, we've hit something similar. We had a need to add the git perl tools to
> the buildtools-tarball to support the gitsm:// fetcher (git-submodule is
> perl, iirc), which sucked in nativesdk-perl. At the moment we're doing a
> horrible hack and just rm'ing perl itself after it gets installed, do you
> have the yocto bug # for the python one?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6735

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

