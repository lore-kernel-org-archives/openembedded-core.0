Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 53B216B478
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 20:19:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jul 2013 13:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,781,1367996400"; d="scan'208";a="373635078"
Received: from unknown (HELO helios.localnet) ([10.252.122.205])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2013 13:19:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 21:19:37 +0100
Message-ID: <1987043.I59naQdUL0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CABcZANkzrC9D4CR5cp6VWV9goF0bWKDP_0GJLiNt18AfoMuU0Q@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
	<CABcZANkzrC9D4CR5cp6VWV9goF0bWKDP_0GJLiNt18AfoMuU0Q@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Tue, 30 Jul 2013 20:19:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 30 July 2013 11:26:58 Chris Larson wrote:
> I forgot to mention, we also need to focus on improving the oe-core systemd
> support, and the feature parity between sysvinit and systemd images. Some
> are missing systemd support at all still (e.g. dropbear's service files are
> still in meta-systemd), and others don't behave the same between the two.
> For example, were we to pull over those dropbear service files, the
> dropbear sysvinit script would behave differently than the service files,
> and dropbear would behave differently than openssh.
> 
> I don't know if that's a priority for the Yocto 1.5 release, but it
> probably should be.

Thanks for bringing this up. There's a bug open for this, but I'd like to 
stress that people need not wait for someone else to get around to it. There 
have already been some patches from Mentor folks to start getting this support 
moved across (although not yet merged due to earlier lack of a concrete 
resolution on the issue of unpackaged unit files, which is now resolved). 
Further help from anyone would be very much appreciated:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4420

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

