Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F46D6186B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 20:44:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2014 12:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,592,1384329600"; d="scan'208";a="452918370"
Received: from unknown (HELO helios.localnet) ([10.252.122.88])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2014 12:44:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 02 Jan 2014 20:44:54 +0000
Message-ID: <2957545.WLoVKAeHF1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1388672736.11527.101.camel@ted>
References: <cover.1387832257.git.paul.eggleton@linux.intel.com>
	<351b3404860f88138d7721c83d5fcfd928668a47.1387832257.git.paul.eggleton@linux.intel.com>
	<1388672736.11527.101.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Fix license notices for OE-Core
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
X-List-Received-Date: Thu, 02 Jan 2014 20:44:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 January 2014 14:25:36 Richard Purdie wrote:
> On Mon, 2013-12-23 at 20:59 +0000, Paul Eggleton wrote:
> > * Fix up LICENSE:
> >   - Replace reference to Poky with OpenEmbedded
> >   - Remove reference to bitbake and meta-extras that aren't part of this
> >   
> >     repository
> >   
> >   - Clarify license statements
> > 
> > * Add a COPYING.GPLv2 file in meta/ for the GPLv2 parts
> > * Add a COPYING.MIT file to meta-skeleton consistent with the other
> > 
> >   meta-* directories
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  LICENSE                   |  16 +--
> >  meta-skeleton/COPYING.MIT |  17 +++
> >  meta/COPYING.GPLv2        | 339
> >  ++++++++++++++++++++++++++++++++++++++++++++++ 3 files changed, 364
> >  insertions(+), 8 deletions(-)
> >  create mode 100644 meta-skeleton/COPYING.MIT
> >  create mode 100644 meta/COPYING.GPLv2
> 
> FWIW this broke everything which depends on the checksum of the LICENSE
> file. I merged a fix for that and alerted Scott to the issue in the
> manuals.

Oops, I hadn't anticipated that - thanks for clearing up after me. I do think 
most of those recipes ought to be pointing at COPYING.MIT and not LICENSE 
though.

Cheers,
Paul

--

Paul Eggleton
Intel Open Source Technology Centre

