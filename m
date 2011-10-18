Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGH44-0005NO-Ov
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 23:19:12 +0200
Received: by qyg14 with SMTP id 14so1174164qyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FivzoMo1T9eumaQuKhrpsZhYmvjm6yMgjm43+ua589k=;
	b=YMzpkPjNPNo5NS7rv0mH9yZnp6VqANSaXoLwFFrYi4Vf1w9HrNwEbiN3NW8nL1L3BN
	kqY5+tlvuvGe5eVuL+zMKoHZkJl0P6GpEXc2GXKV4hU8T/I2b8xPyFJCldMLYYEk+ePC
	rOp1ctf98bVA6GbiX+IX2D1IUcL5MbQgRP/js=
Received: by 10.68.56.169 with SMTP id b9mr7646382pbq.34.1318972396606;
	Tue, 18 Oct 2011 14:13:16 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z3sm10716554pbu.7.2011.10.18.14.13.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 14:13:15 -0700 (PDT)
Date: Tue, 18 Oct 2011 14:14:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111018211436.GB27508@sakrah.homelinux.org>
References: <cover.1318968860.git.nitin.a.kamble@intel.com>
	<3e92600b78e184b9388ed75c91796aa5ee17a3fc.1318968860.git.nitin.a.kamble@intel.com>
	<20111018205425.GC27472@sakrah.homelinux.org>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F429D2@orsmsx504.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E2F429D2@orsmsx504.amr.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/5] python-scons: upgrade from 2.0.1 to 2.1.0
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
X-List-Received-Date: Tue, 18 Oct 2011 21:19:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 14:07), Kamble, Nitin A wrote:
> 
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Khem Raj
> > Sent: Tuesday, October 18, 2011 1:54 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 3/5] python-scons: upgrade from 2.0.1 to
> > 2.1.0
> > 
> > On (18/10/11 13:15), nitin.a.kamble@intel.com wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > ---
> > >  ...ative_2.0.1.bb => python-scons-native_2.1.0.bb} |    3 +--
> > >  ...python-scons_2.0.1.bb => python-scons_2.1.0.bb} |    6 +++---
> > >  2 files changed, 4 insertions(+), 5 deletions(-)
> > >  rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb =>
> > python-scons-native_2.1.0.bb} (89%)
> > >  rename meta/recipes-devtools/python/{python-scons_2.0.1.bb =>
> > python-scons_2.1.0.bb} (51%)
> > >
> > > diff --git a/meta/recipes-devtools/python/python-scons-
> > native_2.0.1.bb b/meta/recipes-devtools/python/python-scons-
> > native_2.1.0.bb
> > > similarity index 89%
> > > rename from meta/recipes-devtools/python/python-scons-native_2.0.1.bb
> > > rename to meta/recipes-devtools/python/python-scons-native_2.1.0.bb
> > > index f7646a2..083ad15 100644
> > > --- a/meta/recipes-devtools/python/python-scons-native_2.0.1.bb
> > > +++ b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
> > > @@ -2,5 +2,4 @@ require python-scons_${PV}.bb
> > >  inherit native
> > >  DEPENDS = "python-native"
> > >  RDEPENDS_${PN} = ""
> > > -PR = "r1"
> > > -
> > > +PR = "r0"
> > > diff --git a/meta/recipes-devtools/python/python-scons_2.0.1.bb
> > b/meta/recipes-devtools/python/python-scons_2.1.0.bb
> > > similarity index 51%
> > > rename from meta/recipes-devtools/python/python-scons_2.0.1.bb
> > > rename to meta/recipes-devtools/python/python-scons_2.1.0.bb
> > > index 1c7939e..22df333 100644
> > > --- a/meta/recipes-devtools/python/python-scons_2.0.1.bb
> > > +++ b/meta/recipes-devtools/python/python-scons_2.1.0.bb
> > > @@ -1,15 +1,15 @@
> > >  DESCRIPTION = "A Software Construction Tool"
> > >  SECTION = "devel/python"
> > >  LICENSE = "MIT"
> > > -LIC_FILES_CHKSUM =
> > "file://LICENSE.txt;md5=8481211ebbeaed9cdc7ad5a3b0c98aaf"
> > > +LIC_FILES_CHKSUM =
> > "file://LICENSE.txt;md5=ab8b65435c2e520ed18e67459f1f9bb9"
> > 
> > a little commentary on what changed in license text would be nice here
> 
> The change is copyright year to 2011 :)

Adding that to commit log would be nice.

> Nitin
> 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


