Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2326AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 13:25:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 Apr 2015 06:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="684522107"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2015 06:25:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Apr 2015 14:25:09 +0100
Message-ID: <1828695.sPIXEUjWsd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <CAJTo0LZd_CSOVW9j07d19fARwvkFuj3LgaizQO7Dr3xg_mpd-A@mail.gmail.com>
References: <1429771148-1545-1-git-send-email-cristian.iorga@intel.com>
	<2822728.eQSAVmuFvh@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZd_CSOVW9j07d19fARwvkFuj3LgaizQO7Dr3xg_mpd-A@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] testimage: regenerate rootfs before testing
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
X-List-Received-Date: Thu, 23 Apr 2015 13:25:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 April 2015 16:02:45 Burton, Ross wrote:
> On 23 April 2015 at 12:20, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > I can't remember for certain, but I suspect the lack of this dependency
> > was intentional, so that you could e.g. copy in an image built elsewhere
> > and run tests on it. Maybe we can take the decision we don't need that,
> > but it should be a conscious decision.
> 
> My guess was that the missing dependency was from when rootfs always
> regenerated an image, so if you were iterating the test suite it would
> always rebuild the image.  This isn't the case now.

I don't believe so since that change was made prior to testimage's existence 
(although it was only a month or so before).

> Someone should speak with QA and see if they actually use the ability to
> copy in images.  Cristian, I'm looking at you. :)

I'm assuming our QA team aren't the only people that use testimage ;)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

