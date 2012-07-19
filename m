Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sro8v-0001Jl-1Q
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 12:39:37 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:50562 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Srnxw-0000J7-Fb; Thu, 19 Jul 2012 06:28:16 -0400
Date: Thu, 19 Jul 2012 06:28:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1342693126.7940.5.camel@ted>
Message-ID: <alpine.DEB.2.02.1207190627001.26827@oneiric>
References: <1342692051-5963-1-git-send-email-mertsas@cisco.com>
	<1342693126.7940.5.camel@ted>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Martin Ertsaas <mertsas@cisco.com>
Subject: Re: [PATCH] Remove the - between ${TARGET_PREFIX} and ar/nm for the env script, as this will make autotools look for arm-none-linux-gnueabi--ar instead of arm-none-linux-gnueabi-ar.
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
X-List-Received-Date: Thu, 19 Jul 2012 10:39:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 19 Jul 2012, Richard Purdie wrote:

> On Thu, 2012-07-19 at 12:00 +0200, Martin Ertsaas wrote:
> > Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> > ---
> >  meta/classes/toolchain-scripts.bbclass |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> > index bf37ec9..8f7c644 100644
> > --- a/meta/classes/toolchain-scripts.bbclass
> > +++ b/meta/classes/toolchain-scripts.bbclass
> > @@ -68,8 +68,8 @@ toolchain_create_tree_env_script () {
> >  	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> >  	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> >  	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> > -	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> > -	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
> > +	echo 'export AR=${TARGET_PREFIX}ar' >> $script
> > +	echo 'export NM=${TARGET_PREFIX}nm' >> $script
> >  	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
> >  	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
> >  	if [ "${TARGET_OS}" = "darwin8" ]; then
>
> Merged to master, thanks.

  there appear to be more of those, based on a simple grep:

$ grep -rn "TARGET_PREFIX}-" *
meta/classes/toolchain-scripts.bbclass:27:	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
meta/classes/toolchain-scripts.bbclass:28:	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
meta/classes/toolchain-scripts.bbclass:114:	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
meta/classes/toolchain-scripts.bbclass:115:	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
$

  just an observation.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


