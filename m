Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qe7Dn-0007VF-25 for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:07:31 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qe7A7-0002jz-7k
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:03:44 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jul 2011 16:03:36 +0100
In-Reply-To: <B8FD72A4-2F8C-48AF-AA13-E686D39ADB01@dominion.thruhere.net>
References: <cover.1307895912.git.koen@dominion.thruhere.net>
	<1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
	<29375D62-544F-457B-8393-79BF9DDA54BA@dominion.thruhere.net>
	<4E0D0211.5040102@linux.intel.com>
	<5A258184-4045-4BAE-AE15-F5ADDBD62B77@dominion.thruhere.net>
	<1309875430.20015.717.camel@rex>
	<B8FD72A4-2F8C-48AF-AA13-E686D39ADB01@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309878223.2410.11.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
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
X-List-Received-Date: Tue, 05 Jul 2011 15:07:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 16:01 +0100, Koen Kooi wrote:
> I currently have no way of saying "I always want tgz and the native
> formats"

Does IMAGE_FSTYPES_append = "tgz" not do what you want?

p.





