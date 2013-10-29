Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B4C6E6D406
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:03:40 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Oct 2013 09:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="381751074"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.13])
	by azsmga001.ch.intel.com with ESMTP; 29 Oct 2013 09:03:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 29 Oct 2013 16:03:36 +0000
Message-ID: <2319343.tLITFFHSjA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <526FD611.30304@linux.intel.com>
References: <1382937354-31622-1-git-send-email-qiang.chen@windriver.com>
	<526FD611.30304@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: create package for openssl configuration file
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
X-List-Received-Date: Tue, 29 Oct 2013 16:03:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 29 October 2013 08:36:49 Saul Wold wrote:
> On 10/27/2013 10:15 PM, qiang.chen@windriver.com wrote:
> > From: Qiang Chen <qiang.chen@windriver.com>
> > 
> > * Add the openssl-conf package to the list of packages to
> > 
> >    be created.  This package contains the openssl.cnf file
> >    which is used by both the openssl executable in the
> >    openssl package and the libcrypto library.
> > 
> > * This is to avoid messages like:
> >      WARNING: can't open config file: /usr/lib/ssl/openssl.cnf
> > 
> > * When running "openssl req" to request and generate a certificate
> > 
> >    the command will fail without the openssl.cnf file being
> >    installed on the target system.
> > 
> > * Made this package an RRECOMMENDS for libcrypto since:
> > 	* libcrypto is a RDEPENDS for the openssl package
> > 	* Users can specify a configuration file at another
> > 	
> >        location so it is not stricly required and many
> >        commands will work without it (with warnings)
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> > ---
> > 
> >   meta/recipes-connectivity/openssl/openssl.inc |   12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> > b/meta/recipes-connectivity/openssl/openssl.inc index 78ff7ae..f4b786a
> > 100644
> > --- a/meta/recipes-connectivity/openssl/openssl.inc
> > +++ b/meta/recipes-connectivity/openssl/openssl.inc
> > @@ -33,13 +33,21 @@ export AS = "${CC} -c"
> > 
> >   inherit pkgconfig siteinfo multilib_header
> > 
> > -PACKAGES =+ "libcrypto libssl ${PN}-misc"
> > +PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
> 
> How about ${BPN}-conf here instead?

Does this work when two multilib variants produce the same package name? I 
suspect you'll get warnings.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

