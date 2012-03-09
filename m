Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S60u3-0000Ux-M9 for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 15:34:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q29EQ4Jn010271
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Mar 2012 14:26:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08772-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 14:25:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q29EPrAf010265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Mar 2012 14:25:57 GMT
Message-ID: <1331303151.3006.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Mar 2012 06:25:51 -0800
In-Reply-To: <4F59BA50.3010309@linux.intel.com>
References: <1331175070-12257-1-git-send-email-obi@opendreambox.org>
	<4F5926DC.2030705@opendreambox.org> <4F59BA50.3010309@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][RFC] bitbake.conf: use empty SRC_URI by default
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
X-List-Received-Date: Fri, 09 Mar 2012 14:34:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-09 at 00:07 -0800, Saul Wold wrote:
> On 03/08/2012 01:38 PM, Andreas Oberritter wrote:
> > On 08.03.2012 03:51, Andreas Oberritter wrote:
> >> * Otherwise, recipes that only append to SRC_URI instead of
> >>    overwriting it will get the full path of the recipe written
> >>    into the Source: field of the package.
> >>
> >> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> >> ---
> >> * I haven't tested this yet, I don't know whether there
> >>    are any caveeats. What's the purpose of having ${FILE}
> >>    in there, anyway?
> >
> > Richard, did you commit this by accident? In the meantime I've started a
> > clean build with this patch applied and noticed eglibc-locale failing,
> > because opkg-build complains about a missing "Source" field.
> >
> Agreed, this seems to have been committed by accident, we see the same 
> failures on the Autobuilder.

I meant to do some local testing but it ended up getting merged, sorry
about that. Since there weren't too many issues on the autobuilder, I
pushed a follow up which sets Source to be "None" rather than unset and
the last set of builds are looking pretty green.

Cheers,

Richard



