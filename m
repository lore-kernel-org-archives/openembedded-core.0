Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T5eWO-00079W-Oq
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 17:13:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2012 08:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,315,1344236400"; d="scan'208";a="191424801"
Received: from unknown (HELO [10.255.12.244]) ([10.255.12.244])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2012 08:00:52 -0700
Message-ID: <1345993252.1125.5.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 26 Aug 2012 10:00:52 -0500
In-Reply-To: <1345970114.7252.10.camel@ted>
References: <cover.1345935181.git.tom.zanussi@intel.com>
	<dc1953f169a835ec6b1dd04c78d61900f0fb53d5.1345935181.git.tom.zanussi@intel.com>
	<1345970114.7252.10.camel@ted>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perf: add bison and flex to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2012 15:13:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-08-26 at 09:35 +0100, Richard Purdie wrote:
> On Sat, 2012-08-25 at 17:57 -0500, tom.zanussi@intel.com wrote:
> > From: Tom Zanussi <tom.zanussi@intel.com>
> > 
> > perf depends on bison and flex for event parsing - add them as
> > dependencies.
> 
> Does it need these at build time or runtime? I suspect you meant to add
> these as RDEPENDS as it needs them at runtime?
> 

Build-time e.g. pmu.y --> pmu-bison.c --> pmu.o

So it should be DEPENDS...

Tom

> Cheers,
> 
> Richard
> 
> > 
> > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > ---
> >  meta/recipes-kernel/perf/perf_3.4.bb |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> > index 5fb38e6..decc911 100644
> > --- a/meta/recipes-kernel/perf/perf_3.4.bb
> > +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> > @@ -9,7 +9,7 @@ as well."
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> >  
> > -PR = "r4"
> > +PR = "r5"
> >  
> >  require perf.inc
> >  
> > @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
> >             ${MLPREFIX}binutils \
> >             ${TUI_DEPENDS} \
> >             ${SCRIPTING_DEPENDS} \
> > +           bison flex \
> >            "
> >  
> >  SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
> 
> 




