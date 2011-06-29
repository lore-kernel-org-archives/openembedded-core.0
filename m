Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbvRF-0005BT-G3 for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:08:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TE4b2s004853
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:04:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04529-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:04:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TE4U50004847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:04:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309353632.2551.32.camel@phil-desktop>
References: <cover.1309352791.git.dexuan.cui@intel.com>
	<c572d4f39bc61df11a8e5a344b88c7b3fe8e476f.1309352791.git.dexuan.cui@intel.com>
	<1309353632.2551.32.camel@phil-desktop>
Date: Wed, 29 Jun 2011 15:04:13 +0100
Message-ID: <1309356253.20015.390.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] grub: add -fno-reorder-functions into STAGE2_COMPILE
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
X-List-Received-Date: Wed, 29 Jun 2011 14:08:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 14:20 +0100, Phil Blundell wrote:
> On Wed, 2011-06-29 at 21:09 +0800, Dexuan Cui wrote:
> > +This turned out to be a gcc's bug. See
> > +https://bugs.gentoo.org/show_bug.cgi?id=360513
> > +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39333
> > +
> > +Upstream gcc seems uninterested in the bug, so at present we can disable the
> > +option as a workaround. Thanks Ryan Hill for the investigation and the
> > +workaround patch.
> 
> I'm not sure it's fair to say that upstream gcc is uninterested.  It
> doesn't appear that anybody has been willing or able to produce a
> testcase which will allow the gcc people to debug the problem. 

Agreed, it would be good if the gcc people could get a testcase to fix
the problem. In the meantime I will take the workaround though.

Cheers,

RIchard



