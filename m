Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8q5Z-0005r1-3d for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 10:38:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2H9TSqf013954
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2012 09:29:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13325-03 for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2012 09:29:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2H9THCZ013948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2012 09:29:19 GMT
Message-ID: <1331976558.18586.222.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 17 Mar 2012 09:29:18 +0000
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C01378348@ORSMSX106.amr.corp.intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
	<b10ee19a1ab989049aafcb0f8eefadf8296dc900.1331924359.git.nitin.a.kamble@intel.com>
	<1331941774.18586.214.camel@ted>
	<ADD6A3980E8C39419A432FF422031B4C01378348@ORSMSX106.amr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/7] python-pycurl: fix packaging warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Mar 2012 09:38:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-17 at 00:35 +0000, Kamble, Nitin A wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: Friday, March 16, 2012 4:50 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 6/7] python-pycurl: fix packaging
> > warnings
> > 
> > On Fri, 2012-03-16 at 12:00 -0700, nitin.a.kamble@intel.com wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > This commit fixes these packaging warnings:
> > >  WARNING: For recipe python-pycurl, the following files/directories
> > were
> > > installed but not shipped in any package:
> > >  WARNING:   /usr/share/share
> > >
> > > PR not bumber because no change in the output packages.
> > >
> > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > ---
> > >  .../python/python-pycurl_7.19.0.bb                 |    4 ++++
> > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> > b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> > > index d9fe465..8b849d7 100644
> > > --- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> > > +++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> > > @@ -29,3 +29,7 @@ export STAGING_INCDIR
> > >  export STAGING_LIBDIR
> > >
> > >  BBCLASSEXTEND = "native"
> > > +
> > > +do_install_append() {
> > > +	rm -rf ${D}${datadir}/share
> > > +}
> > 
> > What is actually in there? Is that a file or a directory?
> > 
> > This is one of the cases it might be worth looking at why it exists at
> > all as something looks wrong there at a deeper level...
> > 
> That is an empty directory. Yes this need further looking why that directory existed in the 1st place.

For empty directories, at least use rmdir, then if they suddenly gain
files, we'd see a failure rather than silently still working.

Cheers,

Richard



