Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qjpyu-0004YV-Vl
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:55:48 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qjpux-0004Bw-Qq
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:51:44 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2011 10:51:37 +0100
In-Reply-To: <f623c7c79851ef287ce6f0dbba90a1cd8d1177e0.1311238455.git.lei.mei@intel.com>
References: <cover.1311238455.git.lei.mei@intel.com>
	<f623c7c79851ef287ce6f0dbba90a1cd8d1177e0.1311238455.git.lei.mei@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311241903.30326.80.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] dhcp: Fix libdir issue for multilib
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
X-List-Received-Date: Thu, 21 Jul 2011 09:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-21 at 16:59 +0800, Mei Lei wrote:
> -+		 $(libbind)/lib/libdns.a $(libbind)/lib/libisc.a
> ++		 $(libbind)/libdns.a $(libbind)/libisc.a

I wonder if you could just replace all this craziness with "-lbind" and
let the linker find the library in the usual way.

p.




