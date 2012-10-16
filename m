Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TO5fR-00086y-L2 for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 13:50:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9GBbJ7Q018423;
	Tue, 16 Oct 2012 12:37:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17867-04; Tue, 16 Oct 2012 12:37:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9GBbAwW018417
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 16 Oct 2012 12:37:11 +0100
Message-ID: <1350387436.2185.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 16 Oct 2012 12:37:16 +0100
In-Reply-To: <507CDF3E.5070808@linux.intel.com>
References: <1350339551-8820-1-git-send-email-sgw@linux.intel.com>
	<1350339551-8820-2-git-send-email-sgw@linux.intel.com>
	<507CDF3E.5070808@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] sato-icon-theme: update mapping program location
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
X-List-Received-Date: Tue, 16 Oct 2012 11:50:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-15 at 21:14 -0700, Saul Wold wrote:
> On 10/15/2012 03:19 PM, Saul Wold wrote:
> > When we changed the /usr/libexec default to be
> > /usr/lib/<pn>, the icon name mapping needed to
> > be updated also.
> >
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >   .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
> >   .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> > index 0bd4814..b07d8c3 100644
> > --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> > +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> > @@ -12,7 +12,7 @@ inherit autotools pkgconfig allarch gtk-icon-cache
> >
> >   FILES_${PN} += "${datadir}"
> >
> > -EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
> > +EXTRA_OECONF += "--with-iconmap=${STAGING_LIBEXECDIR_NATIVE}/icon-name-mapping"
> >
> This is still wrong apparently since icon-naming-mapping is not placed 
> in sato-icon-theme, but in /usr/lib/icon-naming-utils.  So my original 
> patch should be correct.

No, it should be:

EXTRA_OECONF += "--with-iconmap=${STAGING_LIBEXECDIR_NATIVE}/../icon-name-mapping"

Cheers,

Richard



