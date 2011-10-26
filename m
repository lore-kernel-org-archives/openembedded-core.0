Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJAaP-00006o-2l for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 23:00:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9QKsYOQ022512
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 21:54:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21433-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 21:54:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9QKsPsl022506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 21:54:26 +0100
Message-ID: <1319662464.12054.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2011 21:54:24 +0100
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1A8959@MBX20.4emm.local>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
	<1319173361-11527-3-git-send-email-raj.khem@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8929@MBX20.4emm.local>
	<CAMKF1soXuZ84hVv9sN+rgR+Fh-o0jaDKKn7BMWs80xikiF7_bQ@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8959@MBX20.4emm.local>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] gcc-configure-sdk: Point sysroot to	correct location
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
X-List-Received-Date: Wed, 26 Oct 2011 21:00:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-21 at 05:23 +0000, James Limbouris wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Khem Raj
> > Sent: Friday, 21 October 2011 1:16 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to correct
> > location
> > 
> > On Thu, Oct 20, 2011 at 10:12 PM, James Limbouris
> > <james@digitalmatter.com.au> wrote:
> > >> -----Original Message-----
> > >> From: openembedded-core-bounces@lists.openembedded.org
> > >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > >> Khem Raj
> > >> Sent: Friday, 21 October 2011 1:03 PM
> > >> To: openembedded-core@lists.openembedded.org
> > >> Subject: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to correct
> > >> location
> > >>
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> ---
> > >>  meta/recipes-devtools/gcc/gcc-configure-sdk.inc |    2 +-
> > >>  1 files changed, 1 insertions(+), 1 deletions(-)
> > >>
> > >> diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-
> > >> devtools/gcc/gcc-configure-sdk.inc
> > >> index de80870..98fd4c1 100644
> > >> --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> > >> +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> > >> @@ -7,7 +7,7 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-
> > >> uclibceabi", "no", "", d )}'
> > >>  EXTRA_OECONF_PATHS = "--with-local-
> > >> prefix=${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
> > >>                        --with-gxx-include-dir=${target_includedir}/c++ \
> > >>                        --with-build-time-
> > >> tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
> > >> -                      --with-sysroot=${SDKPATH}/sysroots/${TARGET_SYS} \
> > >> +                      --with-
> > >> sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-
> > >> ${TARGET_OS} \
> > >>                        --with-build-sysroot=${STAGING_DIR_TARGET}"
> > >>
> > >>  #
> > >> --
> > >> 1.7.5.4
> > >>
> > >
> > > Shouldn't --with-local-prefix be changed too? I am testing with both
> > ${TARGET_SYS}'s replaced. Will post results shortly.
> > 
> > yes I think both places it should change
> > 
> 
> Ok, I've tested with both changed, and the corresponding binutils patch, and both Qt and kernel compiles are working.

I took these patches but I would like to stress that we shouldn't need
to rely on the hardcoded path in the compiler, it should be picking up
any alternative sysroot paths from the environment. If this isn't
happening, we should be figuring out why not. This change therefore
hides issues and does not fix the problem entirely :(.

Cheers,

Richard



