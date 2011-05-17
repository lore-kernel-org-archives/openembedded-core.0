Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMGsd-0007Fn-Qk for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:47:55 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMGQT-0004Um-Lw
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:18:49 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305624899.3424.209.camel@rex>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<1305623837.2429.126.camel@phil-desktop>
	<1305624899.3424.209.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 10:44:58 +0100
Message-ID: <1305625498.2429.158.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Tue, 17 May 2011 09:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 10:34 +0100, Richard Purdie wrote:
> How about this idea:
> 
> TMPDIR_append = "-uclibc"

Hm, I'm not totally sure what this really buys us.  

If the whole issue boils down to saying that you just can't share a
TMPDIR between builds with competing C libraries (which sounds
reasonable, since it's probably about the same thing as saying that libc
selection is a DISTRO property) then it seems like something that can be
fixed in the documentation.  Users can just select a different TMPDIR by
hand, same as they would when changing DISTROs, and it doesn't seem that
there is any real need for the build system to try to work around it for
them.

I'm also slightly uncomfortable with automagic TMPDIR frobbing for the
same reason as MACHINE; if I set TMPDIR="foo" in my local.conf then I
would have an (IMHO reasonable) expectation that the build artifacts
would actually go into that directory and not some variation on the
theme.  I guess you could ameliorate that slightly by appending
"/uclibc" so that at least you ended up using a subfolder of the chosen
path, but it still doesn't seem very wholesome to me.

p.




