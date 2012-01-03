Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri3NU-0004EQ-M3
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 13:22:04 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri3GQ-0000fj-KL
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 13:14:46 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 12:14:45 +0000
In-Reply-To: <09b1dc8bd886c8cd2a5d4085d8bb4b73ece1f5b0.1325571069.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
	<09b1dc8bd886c8cd2a5d4085d8bb4b73ece1f5b0.1325571069.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325592886.24417.350.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 012/113] base.bbclass: Allow buildstats to be optionally supplied
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
X-List-Received-Date: Tue, 03 Jan 2012 12:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-02 at 22:18 -0800, Saul Wold wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> Buildstats should be allowed to be optionally enabled.  It's
> recommended that it be enabled via the USER_CLASSES setting.
> 
> Alternatively it could be enabled via the INHERIT_DISTRO or
> similar mechanism.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

I don't think the short summary of this patch gives a very clear
indication of what it's doing.  The terminology "optionally supplied"
makes it sound as though you're talking about some sort of add-on data
file which can be enabled.  Whereas, what the patch seems actually to be
doing is removing the unconditional inherit of buildstats (i.e. turning
it off for almost everyone who has it on today) and adding a suggestion
in local.conf.sample as to how it might be turned on again.

(That said, I do think the intent of this patch is a good one; it's been
a long-standing source of irritation to me that disabling buildstats is
so awkward at present.)

p.




