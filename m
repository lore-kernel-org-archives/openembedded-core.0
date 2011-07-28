Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmMQ9-0001cn-36
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 10:58:21 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmMM4-0002yq-2V
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 10:54:08 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 09:54:06 +0100
In-Reply-To: <20110728072450.GE15286@jama.jama.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop> <4E30489A.100@windriver.com>
	<20110728072450.GE15286@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311843248.30326.403.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Thu, 28 Jul 2011 08:58:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 09:24 +0200, Martin Jansa wrote:
> Mark is right that if we have PACKAGE_ARCH = "armv4t" and we force
> no-thumb with ARM_INSTRUCTION_SET = "arm" then PACKAGE_ARCH should be
> switched to "armv4" only to indicate that.

No, this is wrong.  Even with ARM_INSTRUCTION_SET = "arm" you might have
BX instructions in the output, in which case "armv4t" is the correct
PACKAGE_ARCH.  You can only set PACKAGE_ARCH = "armv4" if all the BXs
have been suppressed, which means that you lose the ability to do
interworking.

p.



