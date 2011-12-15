Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rb9NU-0002kB-AT for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 12:21:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFBEYew002835
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:14:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02440-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:14:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFBEO24002829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:14:25 GMT
Message-ID: <1323947665.4568.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 11:14:25 +0000
In-Reply-To: <1323944813.24417.197.camel@phil-desktop>
References: <cover.1323911699.git.sgw@linux.intel.com>
	<b52e93fb176d552e1334088af964dfbd38c0007d.1323911699.git.sgw@linux.intel.com>
	<1323944813.24417.197.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 7/7] perl: add .pl, pm, pod, sh files to SSTATE_SCANE_FILES
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
X-List-Received-Date: Thu, 15 Dec 2011 11:21:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-15 at 10:26 +0000, Phil Blundell wrote:
> On Wed, 2011-12-14 at 17:50 -0800, Saul Wold wrote:
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/recipes-devtools/perl/perl_5.14.2.bb |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> This commit message is very terse.  What is SSTATE_SCAN[E]_FILES and why
> do we want these things in it?

This is basically some hints to the sstate code about which files need
relocation mangling. We process all files for the native/cross cases but
in the target case it's only been .la and binconfig files we've
processed.

An earlier patch is adding in a mechanism to extend this list and this
is adding in some problematic files for the perl case. We've been seeing
sstate failures from issues like this.

I agree this probably needs a little more explanation in the commit
message.

Cheers,

Richard



