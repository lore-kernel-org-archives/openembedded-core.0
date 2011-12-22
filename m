Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rdhal-0008Mb-BL for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:17:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMCAdVF022868
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:10:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22560-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:10:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMCAWth022862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:10:33 GMT
Message-ID: <1324555835.24604.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 12:10:35 +0000
In-Reply-To: <20111222080659.GH12791@jama.jama.net>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
	<20111220075952.GB3946@jama.jama.net>
	<20111221074011.GB12791@jama.jama.net>
	<E6A4ABFF-7BBC-4D8F-97E7-42FEAD69E3B5@dominion.thruhere.net>
	<20111222080659.GH12791@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
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
X-List-Received-Date: Thu, 22 Dec 2011 12:17:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-22 at 09:07 +0100, Martin Jansa wrote:
> On Thu, Dec 22, 2011 at 09:03:46AM +0100, Koen Kooi wrote:
> > 
> > Op 21 dec. 2011, om 08:40 heeft Martin Jansa het volgende geschreven:
> > 
> > > On Tue, Dec 20, 2011 at 08:59:52AM +0100, Martin Jansa wrote:
> > >> On Thu, Dec 15, 2011 at 04:16:17PM +0100, Koen Kooi wrote:
> > >>> ping
> > >> 
> > >> I've tried it with older midori-0.4.2 as well as with newer 0.4.3 (which
> > >> I'll send to meta-oe later) but both does segfault, probably not caused
> > >> by this newer webkit-gtk because even with older webkit-gtk 0.4.2 was
> > >> segfaulting (maybe gcc-4.6 issue if you're still using gcc-4.5).
> > >> 
> > >> I've tried to get usable backtrace.. but webkit-gtk-dbg is huge (>300MB)
> > >> and opkg died twice already when I was waiting for midori-dbg to install
> > >> :/.
> > >> 
> > >> BTW: it happens on armv4t as well as armv7a-vfp-neon.
> > > 
> > > 627.8M  usr/lib/.debug/libwebkitgtk-1.0.so.0.11.2
> > > from libwebkitgtk-1.0-dbg (1.7.2+svnr101488-r0) wasn't 
> > > really helpfull as it fails even before that on nokia900:
> > 
> > All this happens on both the old and the new version, right? If so, can this patch finally go in?
> 
> Yes with both, so for me this can go in.

I'd really like someone to confirm the user of webkit in OE core
(web-webkit iirc) works with this update. I've been meaning to test but
do far haven't had time :(

Cheers,

Richard



