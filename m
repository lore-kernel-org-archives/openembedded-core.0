Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaLmW-0002W7-L5 for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 10:00:53 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r497jB6j031995; Thu, 9 May 2013 08:45:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z2YKqJg6SEHP; Thu,  9 May 2013 08:45:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r497j6hc031987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 9 May 2013 08:45:08 +0100
Message-ID: <1368085353.27116.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 09 May 2013 08:42:33 +0100
In-Reply-To: <57346B3A-FB30-46F4-8160-CDC69F206243@gmail.com>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1368013438-15107-3-git-send-email-marcin.juszkiewicz@linaro.org>
	<57346B3A-FB30-46F4-8160-CDC69F206243@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] gdb: move checksums to versioned include
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 08:00:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-08 at 21:37 -0700, Khem Raj wrote:
> not if we have 1 version.

In principle they do belong in the .bb file rather than the
general .inc/. People can then do things in other layers if desired.

Cheers,

Richard

> 
> On May 8, 2013, at 4:43 AM, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> wrote:
> 
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > ---
> > meta/recipes-devtools/gdb/gdb-common.inc | 3 ---
> > 1 file changed, 3 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> > index 6f42dff..deb3841 100644
> > --- a/meta/recipes-devtools/gdb/gdb-common.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> > @@ -23,9 +23,6 @@ inherit autotools
> > 
> > SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
> >           "
> > -SRC_URI[md5sum] = "b1519bf899890d21d4774845a6e602fe"
> > -SRC_URI[sha256sum] = "f99f26e2c1127f12ba14ece0947a9a9948be45e96b69ef363131e469a698636e"
> > -
> > export CC_FOR_BUILD = "${BUILD_CC}"
> > export CXX_FOR_BUILD = "${BUILD_CXX}"
> > export CPP_FOR_BUILD = "${BUILD_CPP}"
> > -- 
> > 1.8.1.2
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 




