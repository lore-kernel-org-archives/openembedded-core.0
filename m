Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1185D6FE64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:39:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2014 07:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,411,1406617200"; d="scan'208";a="582398825"
Received: from besquive-mobl.zpn.intel.com (HELO [10.219.26.196])
	([10.219.26.196])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2014 07:39:07 -0700
Message-ID: <1409150346.3566.101.camel@besquive-mobl.amr.corp.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Aug 2014 09:39:06 -0500
In-Reply-To: <20140825233139.GB9458@haswell>
References: <1408935491-79054-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<20140825160425.GB21358@haswell>
	<1409007467.2532.13.camel@besquive-mobl.amr.corp.intel.com>
	<20140825233139.GB9458@haswell>
Organization: Intel OTC
X-Mailer: Evolution 3.10.4 (3.10.4-3.fc20) 
Mime-Version: 1.0
Cc: Andreas Schwab <schwab@linux-m68k.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix to egrep 'yes$' instead 'yes' at configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Aug 2014 14:39:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ok, I will re-do the patch and send it over

On Mon, 2014-08-25 at 16:31 -0700, Khem Raj wrote:
> On 14-08-25 17:57:47, Benjamin Esquivel wrote:
> > To Khem and Andreas, 
> > 
> > I would say that the proposed patch is based on the existing design, a
> > corner case was found and it deserves a fix but not so sure about
> > redesigning it
> > 
> > By redesign I mean to modify also the part where the string is thrown
> > into the conftest.c
> > 
> > Please let me know your thoughts
> 
> there is nothing wrong in redoing it. It would fix the issue and make it
> more readable too.



