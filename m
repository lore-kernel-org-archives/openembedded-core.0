Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROTco-00046c-L3 for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 13:20:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAACEgCc028500
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:14:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28200-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:14:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAACEUgx028475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:14:31 GMT
Message-ID: <1320927273.1165.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 12:14:33 +0000
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL (v2) 00/33] Loads of Change!
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
X-List-Received-Date: Thu, 10 Nov 2011 12:20:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 23:42 -0800, Saul Wold wrote:
> Richard,
> 
> This set of changes is currently being built on the Autobuilder
> along with some change I dropped for this request. Based on the
> initial builds, I believe that most of these changes are correct
> and buildable.
> 
> I an attempt to clear the decks and move things forward I am suggesting
> we take these changes in.  I dropped Martin's SDL changes since they are
> causing some of the Autobuilder failures currently
> 
> There still seems to be an issue with connman sanity,
> and shadow (populate_sysroot_setscene):
> 
> ERROR: Task 3037 (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_populate_sysroot_setscene) failed with exit code '1'
> 
> I included many of your patches in this to verify them as part of
> this build.

We still need some patches Mark is working on to resolve the connman
regression. I've not taken my "hacktastic" patch since its incomplete
and Mark's version will be better. I think most other things are now in.

I did not take the link reordering alphabetically patch since I didn't
see that until I'd taken the version queued in master-next. If anyone
wants to submit a followup that would be fine. I can't say its a big
issue whether its sorted or not though (and it does make sense to
separate out a function change from a cosmetic one IMO).

Cheers,

Richard



