Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC9378283
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 09:27:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 02:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,383,1496127600"; d="scan'208";a="1174679268"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2017 02:27:12 -0700
Date: Thu, 20 Jul 2017 12:28:06 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Marc Ferland <marc.ferland@gmail.com>
Message-ID: <20170720092806.GA17156@mbabyjoh-desk.ger.corp.intel.com>
References: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
	<1500476485-20310-4-git-send-email-maxin.john@intel.com>
	<CAMRMzCAom44+sFt5QXW9tmLgVqwZhCz5en9uC+DnKL2E5vZUOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRMzCAom44+sFt5QXW9tmLgVqwZhCz5en9uC+DnKL2E5vZUOg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] bluez5: upgrade to 5.46
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
X-List-Received-Date: Thu, 20 Jul 2017 09:27:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

On Wed, Jul 19, 2017 at 11:13:16AM -0400, Marc Ferland wrote:
> On Wed, Jul 19, 2017 at 11:01 AM, Maxin B. John <maxin.john@intel.com> wrote:
> >
> > 5.45 -> 5.46
> >
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-connectivity/bluez5/{bluez5_5.45.bb => bluez5_5.46.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-connectivity/bluez5/{bluez5_5.45.bb => bluez5_5.46.bb} (91%)
> >
> > diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb b/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> > similarity index 91%
> > rename from meta/recipes-connectivity/bluez5/bluez5_5.45.bb
> > rename to meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> > index d5f516c..93f4be3 100644
> > --- a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
> > +++ b/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> > @@ -2,8 +2,8 @@ require bluez5.inc
> >
> >  REQUIRED_DISTRO_FEATURES = "bluez5"
> >
> > -SRC_URI[md5sum] = "20d936917afc7e1ffa091f5213081c55"
> > -SRC_URI[sha256sum] = "4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa85364e9"
> > +SRC_URI[md5sum] = "913f35d6fa4ca5772c53adb936bf1947"
> > +SRC_URI[sha256sum] = "ddab3d3837c1afb8ae228a94ba17709a4650bd4db24211b6771ab735c8908e28"
> >
> 
> A new testing utility, advtest, has been added and should be installed
> along with the rest of the tools listed in NOINST_TOOLS_BT.
> 
> See: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=fedb7f6eaba7bc4ac879d1762ff267789c4db552

Thanks for sharing this info. Will add that.

> Marc

Best Regards,
Maxin


