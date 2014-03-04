Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D6CDB6EEF3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 10:56:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2014 02:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,584,1389772800"; d="scan'208";a="492012416"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2014 02:56:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Tue, 04 Mar 2014 10:56:40 +0000
Message-ID: <1903575.6s612YHEYV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <20140304085653.GA3511@ad.chargestorm.se>
References: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
	<20140304083720.GA30745@axis.com>
	<20140304085653.GA3511@ad.chargestorm.se>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Tue, 04 Mar 2014 10:56:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 March 2014 09:56:53 Anders Darander wrote:
> * Olof Johansson <olof.johansson@axis.com> [140304 09:37]:
> > On 14-03-03 19:17 +0100, Khem Raj wrote:
> > > On Mon, Mar 3, 2014 at 6:37 AM, Olof Johansson <olof.johansson@axis.com> 
wrote:
> > > > With this change, you can use shell like globbing expressions (as
> > > > supported by Python's fnmatch) for entries in SANITY_TESTED_DISTROS.
> > > > This makes it possible to say that, e.g. "all Debian 7 Wheezy releases
> > > > are supported" with the entry "Debian-7.*".
> > > 
> > > I dont think its a good thing. We should be strict about it as we are.
> > > otherwise it can end up
> > > with bigger problems to save few  typing words
> > 
> > I don't really think we are strict about it today. Currently,
> > Ubuntu LTS (12.04) does not include point release number in its
> > lsb release name. Debian does (and I noticed a similar bump patch
> > was sent for CentOS recently). I suspect that in many cases, a
> > new Ubuntu point release contains about the same changes that the
> > Debian point release does.
> > 
> > The issue is that new point releases, at least in the case of
> > Debian, happens about every two months. These bumps are
> > integrated to master, backported to older branches, but it still
> > won't reach people working off releases immediately.
> > 
> > Even if Poky chooses not to adopt this, it would still be a nice
> > thing to have support for doing this internally for our
> > layer/distro.
> 
> I'm with Olof and Mark on this one.
> 
> We should at least add the code for allowing wildcards in the
> SANITY_TESTED_DISTROS. Then everyone creating our own setups/distros can
> choose to add wildcards or not.
> 
> Whether we should add wildcards in Poky is a separate question. Though,
> we should treat e.g. Debian and Ubuntu in the same way.

FWIW the above reflects my thoughts as well. We'll need to decide whether or 
not Poky adopts it but we should have the mechanism regardless.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

