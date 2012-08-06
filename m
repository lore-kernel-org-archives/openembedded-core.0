Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyNEb-0006tr-8F for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 15:20:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76D8qWg028037
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 14:08:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27818-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2012 14:08:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76D8i6r028031
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 14:08:45 +0100
Message-ID: <1344258527.9756.148.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 14:08:47 +0100
In-Reply-To: <20120805103154.GB3267@jama.jama.net>
References: <1343053509-5931-1-git-send-email-Martin.Jansa@gmail.com>
	<1343058327.21788.98.camel@ted>
	<CABcZAN=CieCpsFCQ7Gsv=kF6MMy_W6T=itU6FtewXf-kPCz61w@mail.gmail.com>
	<20120805103154.GB3267@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
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
X-List-Received-Date: Mon, 06 Aug 2012 13:20:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-08-05 at 12:31 +0200, Martin Jansa wrote:
> On Mon, Jul 23, 2012 at 08:48:52AM -0700, Chris Larson wrote:
> > On Mon, Jul 23, 2012 at 8:45 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2012-07-23 at 16:25 +0200, Martin Jansa wrote:
> > >> * whole MACHINEOVERRIDES can change e.g. between MACHINES with different arm architecture, causing allarch packages to reexecute do_package
> > >>   bitbake-diffsigs ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.sigdata.90e760a8f6cecbd87cb2e95f1237e3cc ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.sigdata.9eeccfd15f25032b3b6b132534660fff
> > >>   basehash changed from 7618e17d3fda05d1f15246e6800ca0f0 to 97bc4dc8c1521c535bd96b2aa62d8a03
> > >>   Variable MACHINEOVERRIDES value changed from ${MACHINE}${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS} to ${MACHINE}${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS}
> > >>
> > >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >> ---
> > >>  meta/conf/bitbake.conf |    1 +
> > >>  1 files changed, 1 insertions(+), 0 deletions(-)
> > >
> > > Won't this hide genuine changes where things should get rebuilt too?
> > 
> > If something uses a machine override, won't the overridden value for
> > that variable be the one which is stored in the checksum? So any
> > effects of this will result in checksum modification anyway, no?
> 
> I think it was possible to find different local file in SRC_URI (in
> different override subdirectory), but now with local file checksums
> included in sstate checksum it should be safe too.

Yes, I think this should be safe now and will take the patch.

Cheers,

Richard



