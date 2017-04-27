Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D71F077D55
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 09:50:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 02:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,383,1488873600"; d="scan'208";a="1140782682"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.17.69])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2017 02:50:11 -0700
Message-ID: <1493286610.26953.1.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Thu, 27 Apr 2017 10:50:10 +0100
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B61194DECB@ORSMSX112.amr.corp.intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
	<20170426074212.GB3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
	<CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
	<20170426183306.GF3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DECB@ORSMSX112.amr.corp.intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Thu, 27 Apr 2017 09:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-26 at 19:50 +0000, Bystricky, Juro wrote:
> > I wasnted to say "passing the seed value" through some separate
> > variable
> > which is easy to override from somewhere else.
> > 
> > e.g.
> > export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
> > 
> > in image-prelink.bbclass:prelink_image() is a bit difficult to
> > override.
> > 
> 
> I think it is best to keep all reproducible build related variables
> gathered together, 
> so bitbake.conf seems like a natural place (same place as the
> variable BUILD_REPRODUCIBLE_BINARIES),
> i.e something like:
> 
> PRELINK_TIMESTAMP ??=`git log -1 --pretty=%ct `
> 
> A single "general purpose" fallback timestamp variable (not specific
> to prelinking) would be my
> preference. Unfortunately, the timestamps may need to come in various
> different formats...

One option for a single general purpose timestamp variable is just to
use a static value. Guix[1] just set the value of SOURCE_DATE_EPOCH to
1[2].

Joshua

1. https://www.gnu.org/software/guix/
2. http://git.savannah.gnu.org/cgit/guix.git/tree/guix/build/gnu-build-
system.scm#n42

