Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CC6E86E64A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 19:32:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 13 Dec 2015 11:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,423,1444719600"; d="scan'208";a="872782177"
Received: from jang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.145])
	by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2015 11:32:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, akuster808 <akuster808@gmail.com>
Date: Mon, 14 Dec 2015 08:32:31 +1300
Message-ID: <30211243.jsT0NjOi6x@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <566C8E4C.102@gmail.com>
References: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
	<20151208074923.GB8707@ad.chargestorm.se> <566C8E4C.102@gmail.com>
MIME-Version: 1.0
Cc: anders@chargestorm.se
Subject: Re: [jethro][fido][PATCH 4/4] openssl: three CVE fixes
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
X-List-Received-Date: Sun, 13 Dec 2015 19:32:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sat, 12 Dec 2015 13:14:52 akuster808 wrote:
> On 12/07/2015 11:49 PM, Anders Darander wrote:
> > Hi,
> > 
> > * Armin Kuster <akuster808@gmail.com> [151208 02:49]:
> >>  meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 4 ++++
> >>  1 file changed, 4 insertions(+)
> > 
> > I'm just a little curious about this serious, and a few others that I've
> > seen recently. They all add a number of CVE-patches, with one commit per
> > patch, and as the last commit, they all get added to SRC_URI in a single
> > patch.
> > 
> > What's the reason to do it like this? i
> 
> Each CVE patch can be leveraged independently so back porting to other
> branches is simpler and less work.  The recipe file is  where merge
> conflicts will occur. Not all CVE's are weighted the same so someone who
> has a product in the field can easily cherry pick the CVE's they want or
> need. This was talked about on IRC a few weeks ago.

Well, except they might cherry-pick the fix commit on the assumption that it 
fixes the CVE, when unfortunately it doesn't because the included patch isn't 
actually applied within the recipe in that commit.

I can see how this makes things slightly easier for backporting, but honestly 
I don't like it. I don't believe it matches with our practice up to this point 
either.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

