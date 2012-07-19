Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SroOT-0001V0-R9 for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 12:55:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JAiINZ001457;
	Thu, 19 Jul 2012 11:44:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32466-06; Thu, 19 Jul 2012 11:44:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JAi8LS001451
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 Jul 2012 11:44:09 +0100
Message-ID: <1342694652.7940.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 11:44:12 +0100
In-Reply-To: <alpine.DEB.2.02.1207190627001.26827@oneiric>
References: <1342692051-5963-1-git-send-email-mertsas@cisco.com>
	<1342693126.7940.5.camel@ted>
	<alpine.DEB.2.02.1207190627001.26827@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 19 Jul 2012 10:55:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-19 at 06:28 -0400, Robert P. J. Day wrote:
> On Thu, 19 Jul 2012, Richard Purdie wrote:
> 
> > On Thu, 2012-07-19 at 12:00 +0200, Martin Ertsaas wrote:
> > > Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> > > ---
> > >  meta/classes/toolchain-scripts.bbclass |    4 ++--
> > >  1 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> > > index bf37ec9..8f7c644 100644
> > > --- a/meta/classes/toolchain-scripts.bbclass
> > > +++ b/meta/classes/toolchain-scripts.bbclass
> > > @@ -68,8 +68,8 @@ toolchain_create_tree_env_script () {
> > >  	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> > >  	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> > >  	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> > > -	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> > > -	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
> > > +	echo 'export AR=${TARGET_PREFIX}ar' >> $script
> > > +	echo 'export NM=${TARGET_PREFIX}nm' >> $script
> > >  	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
> > >  	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
> > >  	if [ "${TARGET_OS}" = "darwin8" ]; then
> >
> > Merged to master, thanks.
> 
>   there appear to be more of those, based on a simple grep:
> 
> $ grep -rn "TARGET_PREFIX}-" *
> meta/classes/toolchain-scripts.bbclass:27:	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> meta/classes/toolchain-scripts.bbclass:28:	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
> meta/classes/toolchain-scripts.bbclass:114:	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> meta/classes/toolchain-scripts.bbclass:115:	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
> $
> 
>   just an observation.

Thanks, I've pushed something fixing those up too.

Cheers,

Richard



