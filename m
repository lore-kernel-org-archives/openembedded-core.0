Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 41B3F6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 20:39:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2014 12:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="435079132"
Received: from jacullen-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.42])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2014 12:27:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster <akuster@mvista.com>
Date: Tue, 30 Dec 2014 20:39:56 +0000
Message-ID: <1895049.K8DhQhocfW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54A2EC21.6070308@mvista.com>
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
	<54A2EC21.6070308@mvista.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH 0/2] Backport fixes for git-perltools split
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
X-List-Received-Date: Tue, 30 Dec 2014 20:40:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Armin,

On Tuesday 30 December 2014 10:17:05 akuster wrote:
> On 12/30/2014 09:02 AM, Paul Eggleton wrote:
> > The following changes since commit 
1cf1edcd28a002291622d04dd2d0ee2c67e329e4:
> >    buildtools-tarball: package all of Python (2014-12-11 16:34:01 +0000)
> > 
> > are available in the git repository at:
> >    git://git.openembedded.org/openembedded-core-contrib
> >    paule/dizzy-git-tools
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
> >    paule/dizzy-git-tools> 
> > Jackie Huang (1):
> >    packagegroup-self-hosted: add git-perltools
> 
> This change is in that gray area "does this really need to be back
> ported decision make processed", so I did not include it.

I would argue this is of a similar order as the other fix. The tools that the 
git-perltools package contains were in the build appliance already until git-
perltools was split out, so it's fixing a regression (though I think that 
regression happened in the 1.6 timeframe rather than 1.7 FWIW).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

