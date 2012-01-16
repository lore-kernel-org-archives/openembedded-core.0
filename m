Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rmrfr-0005T6-B8
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 19:52:55 +0100
Received: from 50-78-106-41-static.hfc.comcastbusiness.net ([50.78.106.41]
	helo=[10.1.0.230])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RmrYX-0006jo-1T
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 19:45:21 +0100
Message-ID: <1326739512.3367.32.camel@pb-ThinkPad-R50e>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2012 18:45:12 +0000
In-Reply-To: <CAGDS+n=HwjOz-QKMDyGy6qKf74WESsUFR-mCUT1HV+qaOzcCfg@mail.gmail.com>
References: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
	<1326737165.2933.7.camel@ted>
	<CAGDS+n=HwjOz-QKMDyGy6qKf74WESsUFR-mCUT1HV+qaOzcCfg@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
Subject: Re: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Mon, 16 Jan 2012 18:52:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-16 at 10:19 -0800, Steve Sakoman wrote:
> My tested-by was indeed performed with the meta-oe layer enabled.
> 
> In the future I will make clear what layers were used in my testing.
> 
> I fear that this kind of thing is going to bite us repeatedly :-(

It's never been entirely clear to me why meta-oe needs to override quite
so many bits of oe-core as it does.  I think you're probably right that,
as long as it continues to do so, and people enable meta-oe during
testing, this sort of issue probably is going to continue to occur.

We had some discussion a while back about making the layer priority be a
user-configurable thing, which would enable you to sink meta-oe beneath
oe-core in the priority stack.  This would allow you to use the recipes
which are in meta-oe but not oe-core, without overriding the bits that
do exist in oe-core itself.  I think I lost that argument at the time
but I still feel this would be an improvement.

(Actually, right now what I am doing is just cherry-picking the few
recipes that I need from meta-oe into a local layer and not adding
meta-oe itself to bblayers.conf at all.)

p.




