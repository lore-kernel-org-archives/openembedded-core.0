Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpNK3-0005ZX-J8 for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:32:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GS4qG014100
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:28:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13855-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:27:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GRvvk014092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:27:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <58CFE121-CAEA-4ADD-AC97-6A03DDBA56C3@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<CABcZANmC-K=S7E0vL_4B1ys4VA_OV_r8CHpk2DNFDY0wU+7cCw@mail.gmail.com>
	<58CFE121-CAEA-4ADD-AC97-6A03DDBA56C3@dominion.thruhere.net>
Date: Fri, 05 Aug 2011 17:27:34 +0100
Message-ID: <1312561654.14274.136.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 16:32:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 07:55 +0200, Koen Kooi wrote:
> Op 5 aug. 2011, om 07:51 heeft Chris Larson het volgende geschreven:
> 
> > On Thu, Aug 4, 2011 at 10:48 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> 
> >> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
> >> 
> >>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
> >>>> 
> >>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
> >>>> 
> >>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
> >>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
> >>>>>> 
> > 
> > Can someone explain why this patch added the dependency to the global
> > RDEPENDS, rather than the RDEPENDS_<pkg> for the pkg in question?
> 
> Ah, I assumed it was local to 'pkg' when iterating over packages.
> 
> So should it be:
> 
> rdepends = bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
> 
> [..]
> 
> bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)
> 
> ?

Yes, it should.

Cheers,

Richard



