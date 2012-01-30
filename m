Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RrvaW-0003t4-Hm
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 19:04:20 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RrvSv-00022C-Vq
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:56:30 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jan 2012 17:56:28 +0000
In-Reply-To: <4F26D85A.8030908@linux.intel.com>
References: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
	<4F26D85A.8030908@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1327946189.29933.86.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] alsa-state: fix RDEPENDS assignment
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
X-List-Received-Date: Mon, 30 Jan 2012 18:04:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-30 at 09:50 -0800, Joshua Lock wrote:
> Yikes, I don't know why I keep making this mistake. Thanks for catching 
> it Koen.
> 
> I thought we caught this in a QA error but I definitely didn't see it, 
> best investigate.

It seems that Yocto doesn't enable those checks.  Possibly it should, or
maybe we should just turn them on by default for everybody.

p.




