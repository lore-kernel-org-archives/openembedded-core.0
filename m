Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QnEW9-0000bt-AI
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 20:44:09 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QnES1-0004r9-Cr
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 20:39:53 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9242177.qDpCW2S6UF@perseus>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<13ae8210a401f000beaf5ab54523e07c5b113831.1311807353.git.tom_rini@mentor.com>
	<9242177.qDpCW2S6UF@perseus>
Date: Sat, 30 Jul 2011 19:39:47 +0100
Message-ID: <1312051187.3497.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/9] sudo: Drop sudo_cv_uid_t_len from site files
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
X-List-Received-Date: Sat, 30 Jul 2011 18:44:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-07-30 at 10:25 -0700, Khem Raj wrote:
> On Wednesday, July 27, 2011 03:56:45 PM Tom Rini wrote:
> > We were just setting this to the assumed default.  If anything, this
> > belongs in the libc files if we must set it.
> 
> uid_t is not a libc controlled define. Its kernel controlled (though kernel-
> headers)

No, that's incorrect.  The uid_t that applications see is controlled by
libc and decoupled from __kernel_uid_t.  There is logic in glibc to
convert between types if necessary.

p.




