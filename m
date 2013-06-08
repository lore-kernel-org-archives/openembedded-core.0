Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1AC06A901;
	Sat,  8 Jun 2013 11:44:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jun 2013 04:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,827,1363158000"; d="scan'208";a="326208624"
Received: from unknown (HELO helios.localnet) ([10.252.121.253])
	by orsmga001.jf.intel.com with ESMTP; 08 Jun 2013 04:43:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 08 Jun 2013 12:43:33 +0100
Message-ID: <1562117.pR91UQbp4e@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <20130607222052.GN22710@jama>
References: <CA+YB3rZ+pWVzy6_=PAa9QRTdsu+Y5OEGwdW7sLpLphnWZ-89yw@mail.gmail.com>
	<20130607222052.GN22710@jama>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: OE TSC Minutes 4 June 2013
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
X-List-Received-Date: Sat, 08 Jun 2013 11:44:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 08 June 2013 00:20:52 Martin Jansa wrote:
> > a. oe-classic recipe migration status
> > drop from agenda after this
> 
> Not sure why I got this idea now when it's "over" but would it be
> possible to populate new layerindex with at least recipe names from
> OE-classic?
> 
> I guess it would be hard to parse it completely as proper layer,
> but it would be nice to search for "foo" and see that it's available in
> OE-classic ready to be migrated to some layer - otherwise people will
> just start from scratch which isn't always best way.
> 
> Even just names from migration wiki page would be enough to give people
> heads-up that something similar is in OE-classic.

Indeed, I had thought of this... I think we could do a one-off hacked up parse 
to get the data into a separate table and then it would be more or less 
static. At least it would give us an easy way to report on recipes that 
haven't been migrated (currently I've been doing it with some scripts). 

FYI I've been doing some work in my spare time on the layer index code 
recently, implementing additional features and tidying a few things up 
(published in the paule/features branch). The barrier to getting this up on 
the live site is further testing and the database migration which I haven't 
been through yet other than locally; I guess the less migrations the better so 
it would probably be worth implementing the OE-Classic data structures before 
that happens. I'll take a look at this if I have some spare time over the next 
couple of weeks.

Cheers,
Paul


