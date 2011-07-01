Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcmVA-0008T0-Q8 for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 00:47:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MD5VM021454
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:13:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20843-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 23:13:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MD0BU021448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:13:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309533561.2633.76.camel@phil-desktop>
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
	<469c48cf5611c9e984d8114a48e834d03c44d099.1309533254.git.richard.purdie@linuxfoundation.org>
	<1309533561.2633.76.camel@phil-desktop>
Date: Fri, 01 Jul 2011 23:12:38 +0100
Message-ID: <1309558358.20015.563.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/6] beecrypt: Fix up packaging QA warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 22:47:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 16:19 +0100, Phil Blundell wrote:
> On Fri, 2011-07-01 at 16:17 +0100, Richard Purdie wrote:
> > +FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
> 
> You can use ${SOLIBS} there...
> 
> > +FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la
> 
> ... and ${SOLIBSDEV} there.

I'm in two minds on these. On the one hand they do make sense and have
allowed us to build darwin targets in the past (and would extend to
windows too). On the other hand nobody is using them outside the core
metadata.

I think a global search and replace would likely be the best move if we
decide they're a good thing...

Cheers,

Richard





