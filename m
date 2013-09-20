Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB65861592
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 16:14:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Sep 2013 09:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,945,1371106800"; d="scan'208";a="404726547"
Received: from unknown (HELO helios.localnet) ([10.252.123.234])
	by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2013 09:14:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Colin Walters <walters@verbum.org>
Date: Fri, 20 Sep 2013 17:14:58 +0100
Message-ID: <4037078.8vkzREKUPL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1379693055.1665.9.camel@localhost>
References: <1379688225-29241-1-git-send-email-paul.eggleton@linux.intel.com>
	<1379693055.1665.9.camel@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: fix broken python script header on machines using buildtools
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
X-List-Received-Date: Fri, 20 Sep 2013 16:15:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Colin,

On Friday 20 September 2013 12:04:15 Colin Walters wrote:
> On Fri, 2013-09-20 at 15:43 +0100, Paul Eggleton wrote:
> >  it also seems sensible to do
> > this for native as well instead of explicitly trying to exclude that
> > case.
> 
> But someone presumably introduced the explicit special case for native
> for a reason, I'd expect some blame analysis to be done here to
> determine whether those reasons were bogus or not.

I already did that as a matter of course; there is no clue in the message
for the commit that added it:

http://cgit.openembedded.org/openembedded-core/commit/?id=08fd9740b9359425ec6ee9810fab1152e9737b0c

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

