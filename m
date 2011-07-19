Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qj8D7-0003qk-7I
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 13:11:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qj89C-0002Bb-6b
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 13:07:30 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2011 12:07:29 +0100
In-Reply-To: <bcd71928a9187721cbbd00795a8bde5f2b503710.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
	<bcd71928a9187721cbbd00795a8bde5f2b503710.1311034342.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311073650.30326.26.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 09/16] uclibc_0.9.32: Implement sync_file_range2.
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
X-List-Received-Date: Tue, 19 Jul 2011 11:11:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-18 at 17:17 -0700, Khem Raj wrote:
> ++#if defined __NR_sync_file_range2
> ++#define __NR_sync_file_range __NR_sync_file_range2
> ++#endif

Does that really work?  If I remember right, the argument lists for
those two syscalls are not the same.  It isn't entirely obvious to me
that it makes sense to just define one as an alias for the other.

p.




