Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3D15F7736F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 19:51:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2016 11:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="752617799"
Received: from mmsaini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.207])
	by orsmga003.jf.intel.com with ESMTP; 24 Feb 2016 11:51:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 08:51:19 +1300
Message-ID: <2791977.VXU03QmIbh@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <56CDDBCD.6090303@balister.org>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<56CDD519.9050109@gmail.com> <56CDDBCD.6090303@balister.org>
MIME-Version: 1.0
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 19:51:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 24 Feb 2016 11:35:25 Philip Balister wrote:
> On 02/24/2016 11:06 AM, Trevor Woerner wrote:
> > Ideally the work done here and the work done on meta-swupdate[1] would
> > be somehow merged so people creating images/distros would only have to
> > learn and integrate one software update solution, instead of having to
> > evaluate and choose between the two (or more?).
> > 
> > [1] https://github.com/sbabic/meta-swupdate
> 
> Amen. I had the same thoughts reading the patch set intro.

I think it would be hard to integrate these two, since they operate quite 
differently to eachother.
 
> Maybe the swupd should go in a seperate layer so we can see which
> project works best for oe users before moving something directly into
> oe-core?

This makes sense to me too though FWIW. The os-release patch should probably 
go straight in, but everything else looks like it could comfortably live in a 
separate layer without making things too difficult.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

