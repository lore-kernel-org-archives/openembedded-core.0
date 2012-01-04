Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiUe5-0006Sm-Kk for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:29:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04HLcFq022384;
	Wed, 4 Jan 2012 17:21:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22223-03; Wed,  4 Jan 2012 17:21:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04HLUGQ022378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 17:21:31 GMT
Message-ID: <1325697690.20759.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 17:21:30 +0000
In-Reply-To: <CAEsOVNdi_no+UZ9uigiM_U8BLwUDES=02bwdPKT7A+YGH7KqNg@mail.gmail.com>
References: <cover.1325640149.git.josh@linux.intel.com>
	<a8eea7c83f33f5d5eab1e2758a88f3ee140e68a1.1325640149.git.josh@linux.intel.com>
	<CAEsOVNdi_no+UZ9uigiM_U8BLwUDES=02bwdPKT7A+YGH7KqNg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] linux-tools: add binutils to perf DEPENDS
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
X-List-Received-Date: Wed, 04 Jan 2012 17:29:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 16:32 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Jan 3, 2012 at 7:31 PM, Joshua Lock <josh@linux.intel.com> wrote:
> > We have witnessed non-deterministic failures of perf for some platforms
> > whilst looking for bfd.h, a header provided by binutils.
> >
> > Signed-off-by: Joshua Lock <josh@linux.intel.com>
> > ---
> >  meta/recipes-kernel/linux/linux-tools.inc |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
> > index 950f197..aa45dba 100644
> > --- a/meta/recipes-kernel/linux/linux-tools.inc
> > +++ b/meta/recipes-kernel/linux/linux-tools.inc
> > @@ -22,7 +22,7 @@ addtask install_perf after do_install before do_package
> >  do_compile_perf[umask] = 022
> >  do_install_perf[umask] = 022
> >
> > -PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot"
> > +PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
> 
> Does this build the rpm for binutils too? I've seen the following
> error recently when creating the rfs:
> 
> | error: Failed dependencies:
> | 	binutils >= 2.21.1a is needed by perf-3.0.6-r2.p3060qds
> | 	libbfd-2.21.1.so is needed by perf-3.0.6-r2.p3060qds

I suspect the patch is not enough to fix this...

Cheers,

Richard



