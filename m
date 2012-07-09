Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoFB9-0004hg-SZ for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 16:43:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69EW2je008267
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 15:32:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06451-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 15:31:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69EVsL3008261
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 15:31:54 +0100
Message-ID: <1341844315.8066.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 15:31:55 +0100
In-Reply-To: <4FFAE9ED.3050505@windriver.com>
References: <1341834900.8066.9.camel@ted> <4FFAE7B7.1080804@gmail.com>
	<4FFAE9ED.3050505@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] ccache: Ensure CCACHE_DIR is cleaned by do_clean task
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
X-List-Received-Date: Mon, 09 Jul 2012 14:43:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 09:25 -0500, Mark Hatle wrote:
> On 7/9/12 9:16 AM, Khem Raj wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 7/9/2012 4:55 AM, Richard Purdie wrote:
> >> This ensures a rebuild does really build from scratch when ccache
> >> is in use.
> >>
> >> [YOCTO #2696]
> >>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> --- diff --git a/meta/classes/ccache.bbclass
> >> b/meta/classes/ccache.bbclass index 5aa2da2..cd06a4b 100644 ---
> >> a/meta/classes/ccache.bbclass +++ b/meta/classes/ccache.bbclass @@
> >> -4,3 +4,5 @@ CCACHE_DISABLE[unexport] = "1"
> >>
> >> do_configure[dirs] =+ "${CCACHE_DIR}" do_kernel_configme[dirs] =+
> >> "${CCACHE_DIR}" + +do_clean[cleandirs] += "${CCACHE_DIR}"
> >>
> >
> > so will this remove all contents of .ccache dir ?
> > or just the package you are cleanall'ing
> 
> I was wondering the same thing, with the default configuration:
> 
> bitbake.conf:# Assign CCACHE_DIR a default value to fix a bug of ccache 3.1.7,
> bitbake.conf:# since it would always create CCACHE_DIR/.ccache even if
> bitbake.conf:export CCACHE_DIR ??= "${@os.getenv('HOME')}"

That line is only in the class file and that class redefines CCACHE_DIR
to include PN.

Cheers,

Richard



