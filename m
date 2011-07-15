Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhrE4-0006vx-RW for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:51:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FMlFeK025007;
	Fri, 15 Jul 2011 23:47:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24808-02; Fri, 15 Jul 2011 23:47:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FMl6hS025000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Jul 2011 23:47:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E20BF61.3020901@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
	<4E20BE2C.3060103@linux.intel.com>  <4E20BF61.3020901@mentor.com>
Date: Fri, 15 Jul 2011 23:47:02 +0100
Message-ID: <1310770022.20015.1257.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Fri, 15 Jul 2011 22:51:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-15 at 15:29 -0700, Tom Rini wrote:
> On 07/15/2011 03:24 PM, Saul Wold wrote:
> > On 07/15/2011 03:03 PM, Tom Rini wrote:
> >> These are 'side ports' of current oe.dev versions.  PR is kept in sync
> >> but we drop out the target recipes in order to punt on potential perl
> >> problems.
> >>
> >> Signed-off-by: Tom Rini<tom_rini@mentor.com>
> >> ---
> >>   .../help2man/help2man-native_1.36.4.bb             |   26
> >> ++++++++++++++++++++
> >>   .../help2man/help2man-native_1.38.2.bb             |   24
> >> ++++++++++++++++++
> >>   2 files changed, 50 insertions(+), 0 deletions(-)
> >>   create mode 100644
> >> meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
> >>   create mode 100644
> >> meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
> >>
> > 
> > Why do we need both versions?  Can't we just use the most current?
> 
> For the "I want no GPLv3" crowd.  This is a little more clear in oe.dev
> where we also build for the target but yes, different legal departments
> have different GPLv3 concerns so I think it makes sense in this case still.

We support limited GPLv2 functionality for the target. We don't do this
for the build tools since the compiler is GPLv3 for a start. We also
don't cover target development tools.

So I don't think we need the old version...

Cheers,

Richard




