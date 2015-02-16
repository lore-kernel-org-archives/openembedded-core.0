Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DF35E606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:51:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 16 Feb 2015 05:51:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,587,1418112000"; d="scan'208";a="652804104"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by orsmga001.jf.intel.com with ESMTP; 16 Feb 2015 05:51:20 -0800
Date: Mon, 16 Feb 2015 13:51:20 +0000
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150216135119.GC9950@jupiter.iwi.intel.com>
References: <1424085509-25433-1-git-send-email-brendan.le.foll@intel.com>
	<1424085509-25433-2-git-send-email-brendan.le.foll@intel.com>
	<20150216131003.GG2297@jama>
MIME-Version: 1.0
In-Reply-To: <20150216131003.GG2297@jama>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: disable SSLv3 by default
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
X-List-Received-Date: Mon, 16 Feb 2015 13:51:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 16, 2015 at 02:10:03PM +0100, Martin Jansa wrote:
> On Mon, Feb 16, 2015 at 11:18:29AM +0000, brendan.le.foll@intel.com wrote:
> > From: Brendan Le Foll <brendan.le.foll@intel.com>
> > 
> > Because of the SSLv3 POODLE vulnerability, it's preferred to simply disable
> > SSLv3 even if patched with the TLS_FALLBACK_SCSV
> > 
> > Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
> > ---
> >  meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> > index 6eb1b5e..ba9bca6 100644
> > --- a/meta/recipes-connectivity/openssl/openssl.inc
> > +++ b/meta/recipes-connectivity/openssl/openssl.inc
> > @@ -50,6 +50,10 @@ CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
> >  RRECOMMENDS_libcrypto += "openssl-conf"
> >  RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
> >  
> > +# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
> > +# vulnerability
> > +EXTRA_OECONF = " -no-ssl3"
> 
> Why not use PACKAGECONFIG to make it easier to enable from distro
> config or bbappend?

No real reason, was trying to keep it as simple as possible whilst
making it clear it was not a good idea to re-enable it. I can make it
a PACKAGECOUNFIG[ssl3] = "--no-ssl3" if you think that's best.

Cheers,
Brendan

