Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlNkc-00076m-1A
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:11:26 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlNga-0000up-4Z
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:07:16 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 17:07:15 +0100
In-Reply-To: <4E2D9476.5000905@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
	<ea9bd3c17709ba37b964e4824e8818bcd4723135.1311352057.git.tom_rini@mentor.com>
	<1311609732.30326.247.camel@phil-desktop> <4E2D9476.5000905@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311610036.30326.249.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/8] siteinfo: Move certain samba entries to common-linux
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
X-List-Received-Date: Mon, 25 Jul 2011 16:11:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 09:06 -0700, Tom Rini wrote:
> On 07/25/2011 09:02 AM, Phil Blundell wrote:
> > On Fri, 2011-07-22 at 09:28 -0700, Tom Rini wrote:
> >> Part of re-syncing with oe.dev, move samba_cv_HAVE_IFACE_* to common-linux
> >>
> >> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> >> ---
> >>  meta/site/arm-linux           |    3 -
> >>  meta/site/arm-linux-uclibc    |    3 -
> >>  meta/site/armeb-linux         |    2 -
> >>  meta/site/armeb-linux-uclibc  |    2 -
> >>  meta/site/common-linux        |    5 +
> >>  meta/site/mipsel-linux-uclibc |    3 -
> >>  meta/site/powerpc-common      |  325 +++++++++++++++++++++++++++++++++++++++++
> >>  meta/site/powerpc32-linux     |    3 -
> >>  meta/site/sh-common           |    2 -
> >>  9 files changed, 330 insertions(+), 18 deletions(-)
> > 
> > What's that massive powerpc-common hunk about?  It didn't seem obviously
> > related to the subject of this patch.
> 
> Fall out from re-basing with Kumar's stuff applied, hence the v2 :)

Ah, right, sorry.  For some reason I seem to have the v1 and v2 patches
interleaved in my inbox and I got confused about which was which.

p.





