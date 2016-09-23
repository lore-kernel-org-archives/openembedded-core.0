Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B05B760765
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:06:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2016 02:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="172320806"
Received: from yleow-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.155.25])
	by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2016 02:06:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 21:06:01 +1200
Message-ID: <5465751.PuAniykgrn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.3-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20160923085640.GA17846@mbabyjoh-desk.ger.corp.intel.com>
References: <1474620517-4809-1-git-send-email-anujx.mittal@intel.com>
	<20160923085640.GA17846@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Patrick Ohly <patrick.ohly@gmx.de>, Armin Kuster <akuster@mvista.com>
Subject: Re: [master][PATCH] openssl: security fix CVE-2016-6304
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
X-List-Received-Date: Fri, 23 Sep 2016 09:06:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 23 Sep 2016 11:56:41 Maxin B. John wrote:
> On Fri, Sep 23, 2016 at 04:48:37PM +0800, Anuj Mittal wrote:
> > Reference:
> > https://www.openssl.org/news/secadv/20160922.txt
> > 
> > Upstream fix:
> > https://github.com/openssl/openssl/commit/e408c09bbf7c3057bda4b8d20bec1b3a
> > 7771c15b
> > 
> > Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
> > ---
> > 
> >  .../openssl/openssl/CVE-2016-6304.patch            | 75
> >  ++++++++++++++++++++++
> Mid air collision with Patrick's patch.

I guess for krogoth and jethro we have the choice of applying just this fix or 
the upgrade. Looking over the commits for 1.0.2i it does look like quite a lot 
more than the list of CVEs in the recent security advisory were fixed, and 
it's somewhat concerning that the 1.0.2i release went out with an apparently 
compile-breaking typo in it (subsequently fixed, patch applied in Patrick's 
upgrade).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

