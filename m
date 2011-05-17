Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMLM8-0006KR-SN for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:34:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HEVlBH017445
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:31:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17082-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:31:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HEVcW0017439
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:31:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305625498.2429.158.camel@phil-desktop>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<1305623837.2429.126.camel@phil-desktop>
	<1305624899.3424.209.camel@rex>
	<1305625498.2429.158.camel@phil-desktop>
Date: Tue, 17 May 2011 15:31:37 +0100
Message-ID: <1305642697.3424.249.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Tue, 17 May 2011 14:34:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 10:44 +0100, Phil Blundell wrote:
> On Tue, 2011-05-17 at 10:34 +0100, Richard Purdie wrote:
> > How about this idea:
> > 
> > TMPDIR_append = "-uclibc"
> 
> Hm, I'm not totally sure what this really buys us.  
> 
> If the whole issue boils down to saying that you just can't share a
> TMPDIR between builds with competing C libraries (which sounds
> reasonable, since it's probably about the same thing as saying that libc
> selection is a DISTRO property) then it seems like something that can be
> fixed in the documentation.  Users can just select a different TMPDIR by
> hand, same as they would when changing DISTROs, and it doesn't seem that
> there is any real need for the build system to try to work around it for
> them.

Some distros want to be able to build multiple libc in the same tree in
the same way multiple machines work without requiring the user to switch
settings. I don't think its an unreasonable request but the
implementation shouldn't impact the system too adversely. I think this
fits that requirement.

> I'm also slightly uncomfortable with automagic TMPDIR frobbing for the
> same reason as MACHINE; if I set TMPDIR="foo" in my local.conf then I
> would have an (IMHO reasonable) expectation that the build artifacts
> would actually go into that directory and not some variation on the
> theme.  I guess you could ameliorate that slightly by appending
> "/uclibc" so that at least you ended up using a subfolder of the chosen
> path, but it still doesn't seem very wholesome to me.

Its not ideal but its nicer than the MACHINE workarounds IMO. We could
default to turning it off and let distros choose to turn it on if they
desire it too...

Cheers,

Richard



