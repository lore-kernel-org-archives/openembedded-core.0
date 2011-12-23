Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Re0S7-0005UA-I6
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 09:26:07 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Dec 2011 00:18:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89679840"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2011 00:18:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Garman <scott.a.garman@intel.com>
Date: Fri, 23 Dec 2011 08:18:57 +0000
Message-ID: <3098076.yaHO5nC1Xs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <4EF41210.5090403@intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
	<4EF356EF.7080703@intel.com> <4EF41210.5090403@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 12/26] ncurses: move libraries to base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Dec 2011 08:26:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 December 2011 21:30:56 Scott Garman wrote:
> On 12/22/2011 08:12 AM, Scott Garman wrote:
> > On 12/22/2011 12:50 AM, Phil Blundell wrote:
> >> On Wed, 2011-12-21 at 23:55 -0800, Saul Wold wrote:
> >>> +BUILD_LDFLAGS += "-Wl,-rpath,${base_libdir}"
> >> 
> >> Why is that required?
> > 
> > It's actually needed only for the -native case, so that the tic command
> > (and possibly others) can be run.
> > 
> > I take it I should have done:
> > 
> > BUILD_LDFLAGS_virtclass_native +=
> 
> Having tested this, it actually doesn't work.

Were you doing virtclass_native or virtclass-native? If the former I think the 
latter is what you need.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


