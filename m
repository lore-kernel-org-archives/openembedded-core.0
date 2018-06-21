Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8E69777086
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 09:24:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2018 02:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,251,1526367600"; d="scan'208";a="209931221"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga004.jf.intel.com with ESMTP; 21 Jun 2018 02:24:23 -0700
Date: Thu, 21 Jun 2018 12:24:28 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180621092428.GB22158@mbabyjoh-desk.ger.corp.intel.com>
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
	<1529503642-7158-2-git-send-email-maxin.john@intel.com>
	<CAMKF1so5xW1KMmTgXB2exwqEAdGjJxc-F_JRrt76SsCx97uRaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so5xW1KMmTgXB2exwqEAdGjJxc-F_JRrt76SsCx97uRaQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] piglit: upgrade to latest revision
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
X-List-Received-Date: Thu, 21 Jun 2018 09:24:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Wed, Jun 20, 2018 at 10:19:52AM -0700, Khem Raj wrote:
> On Wed, Jun 20, 2018 at 7:07 AM Maxin B. John <maxin.john@intel.com> wrote:
> >
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> > index b936ad8..1a3e888 100644
> > --- a/meta/recipes-graphics/piglit/piglit_git.bb
> > +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> > @@ -9,7 +9,7 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
> >  UPSTREAM_CHECK_COMMITS = "1"
> >
> >  # From 2018-02-26
> > -SRCREV = "4ce0887e2f7f848d2be2e435a2d0f3c80e44ea3b"
> > +SRCREV = "3aa8c1cfe1a9ddae40c60d9dc76fe8dce47b15cc"
> 
> Can you update the comment about the date as well

Will do that. Thanks !

> >  # (when PV goes above 1.0 remove the trailing r)
> >  PV = "1.0+gitr${SRCPV}"
> >
> > --
> > 2.4.0
> >

Best Regards,
Maxin

