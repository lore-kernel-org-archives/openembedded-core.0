Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW4ET-0000nP-Un for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:51:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AiVSG013281
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:44:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12488-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 10:44:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AiMta013275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:44:23 GMT
Message-ID: <1322736272.17484.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 10:44:32 +0000
In-Reply-To: <EE02ECC0-4FA3-4A4E-8AEE-54DBF3B631D4@dominion.thruhere.net>
References: <cover.1322731182.git.dexuan.cui@intel.com>
	<f0005eed49592dca75bd49a1cfc043d8dc252b37.1322731182.git.dexuan.cui@intel.com>
	<EE02ECC0-4FA3-4A4E-8AEE-54DBF3B631D4@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] make: expand MAKEFLAGS before we re-exec after rebuilding makefiles.
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
X-List-Received-Date: Thu, 01 Dec 2011 10:51:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 10:22 +0100, Koen Kooi wrote:
> Op 1 dec. 2011, om 10:21 heeft Dexuan Cui het volgende geschreven:
> 
> > This patch was got from the upstream cvs repo of make to fix the bug of
> > make-3.82: http://savannah.gnu.org/bugs/?30723
> > 
> > Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> > ---
> > .../make/make-3.82/expand_MAKEFLAGS.patch          |   39 ++++++++++++++++++++
> > meta/recipes-devtools/make/make_3.82.bb            |    4 ++-
> > 2 files changed, 42 insertions(+), 1 deletions(-)
> > create mode 100644 meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
> > 
> > diff --git a/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
> > new file mode 100644
> > index 0000000..4184937
> > --- /dev/null
> > +++ b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
> > @@ -0,0 +1,39 @@
> > +Upstream-Status: Inappropriate [The fix is already in upstream cvs repo, but not in the stable release]
> 
> Isn't 'backport' a better description than 'inappropriate'?

Agreed, I've taken this patch but changed the patch status to backport.

Cheers,

Richard



