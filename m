Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWVJG-0003rK-Gx for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 17:13:42 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWVFz-0004Jg-EK
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 17:10:19 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307937636.git.raj.khem@gmail.com>
References: <cover.1307937636.git.raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 14 Jun 2011 16:10:18 +0100
Message-ID: <1308064218.25285.266.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 0/1] Upgrade gcc 4.6.0 to latest on FSF 4.6 branch
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
X-List-Received-Date: Tue, 14 Jun 2011 15:13:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-12 at 21:03 -0700, Khem Raj wrote:
> This patch brings in new patches from gcc 4.6 FSF branch
> And refreshes the headers of existing backported patches
> to not have git patch numbers in comments
> 
> I am not sending the patch itself to mailing list due to its
> large size so please review it on the contrib tree itself

This patch doesn't seem to have bumped PR on gcc-4.6.0.bb even though
the SRC_URI has changed.  Was that intentional?

p.




