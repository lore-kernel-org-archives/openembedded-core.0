Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlO0b-0000cY-4y
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:27:57 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlNwZ-0000vH-7f
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:23:47 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 17:23:46 +0100
In-Reply-To: <1311601337.2344.192.camel@rex>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
	<1311357674.2344.155.camel@rex> <1311601337.2344.192.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311611027.30326.252.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 6/3] Move architecture specific TARGET_OS mangling into tune files
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
X-List-Received-Date: Mon, 25 Jul 2011 16:27:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:42 +0100, Richard Purdie wrote:
> To try and help preserve my sanity when pulling the various multilib
> patches together, I've merged these six patches, along with a patch
> incrementing bitbake's miniumum version requirement for the
> bb.utils.contains usage.

FWIW, the bitbake minimum version check (at least in its current form)
doesn't buy much in this sort of situation because you get a parse error
before the event handler in sanity.bbclass ever runs.  I think this
happened last time there was a bitbake-affecting change too although I
don't recall the details.

Perhaps adding something like:

__sane_bitbake := "${oe.check_bb_version_sanity}"

to the top of bitbake.conf would improve matters, I dunno.

p.




