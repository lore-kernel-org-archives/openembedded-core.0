Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShgqU-0002HW-Nm for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:50:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCe1Ze022358
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:40:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22083-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:39:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCdpLT022352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:39:52 +0100
Message-ID: <1340282394.1640.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 13:39:54 +0100
In-Reply-To: <CADkTA4M6tN=zGrKe6-1ZVmcW3Facm-cLT+70cqMs7+Q_U6DXOg@mail.gmail.com>
References: <1340180732-26710-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1340281789.1640.106.camel@ted>
	<CAMZjud0p_349MXBVFUj4q-jxKy0S+1bz3_onEjx16XdkKtRPQw@mail.gmail.com>
	<CADkTA4M6tN=zGrKe6-1ZVmcW3Facm-cLT+70cqMs7+Q_U6DXOg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] linux-tools: multilib compilation fix
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
X-List-Received-Date: Thu, 21 Jun 2012 12:50:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-21 at 08:33 -0400, Bruce Ashfield wrote:
> On Thu, Jun 21, 2012 at 8:32 AM, Marinescu, Bogdan A
> <bogdan.a.marinescu@intel.com> wrote:
> > On Thu, Jun 21, 2012 at 3:29 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Wed, 2012-06-20 at 11:25 +0300, Bogdan Marinescu wrote:
> >>> This patch makes linux-tools compile properly on multilib configurations
> >>> (which failed because of some invalid dependencies). Tested by compiling
> >>> lib32-core-image-sato-sdk.
> >>>
> >>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >>> ---
> >>>  meta/recipes-kernel/linux/linux-tools.inc |    2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
> >>> index 3b03c05..048608c 100644
> >>> --- a/meta/recipes-kernel/linux/linux-tools.inc
> >>> +++ b/meta/recipes-kernel/linux/linux-tools.inc
> >>> @@ -34,7 +34,7 @@ do_install_perf[umask] = "022"
> >>>
> >>>  PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
> >>>  PERFDEPENDS_libc-uclibc = ""
> >>> -PERFRDEPENDS = "python perl elfutils"
> >>> +PERFRDEPENDS = "${MLPREFIX}python ${MLPREFIX}perl ${MLPREFIX}elfutils"
> >>>  PERFRDEPENDS_libc-uclibc = ""
> >>>
> >>>  do_compile_perf[depends] = "${PERFDEPENDS}"
> >>
> >> Bruce has just totally rearranged this code. Could you check if the new
> >> recipe still suffers from this issue please?
> >
> > Sure, I'm on it.
> 
> Yep. We still need this addition to the recipe .. luckily, easy to do :)

I'm not sure, the autorenaming magic should take care of a simple
RDEPENDS...

Cheers,

Richard



