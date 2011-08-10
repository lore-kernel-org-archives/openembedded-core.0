Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qr8JK-0000RT-7s
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:55:02 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qr8F0-00051p-65
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:50:34 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 13:50:33 +0100
In-Reply-To: <1A4B195B-C80C-4E0B-9FC2-DBB3E1FC3E2E@kernel.crashing.org>
References: <24988974-E702-4404-BEB2-EB8B946BFC5E@kernel.crashing.org>
	<1312967980.6733.35.camel@phil-desktop>
	<1A4B195B-C80C-4E0B-9FC2-DBB3E1FC3E2E@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312980634.6733.62.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: finding libgcc.a with meta-toolchain-sdk toolchain
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
X-List-Received-Date: Wed, 10 Aug 2011 12:55:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 07:43 -0500, Kumar Gala wrote:
> While these are good suggestions, I still think the toolchain is broken as u-boot has been this way for sometime and numerous other cross toolchains work perfectly fine.

I just tried "ld -lgcc" on my Ubuntu desktop and it didn't work there
either.  Indeed, there's no way in general for ld to know which libgcc
to use since you might have multiple versions of gcc installed on the
system.  

So, while u-boot might have worked for you before, if it is linking with
the command you mentioned (and no extra -L options) then I think it was
only working by chance. 

p.




