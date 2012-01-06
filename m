Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rj9v6-0002VC-IN
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:33:20 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rj9ny-0003jA-ST
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:25:58 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 13:25:58 +0000
In-Reply-To: <4F05CAB9.4020001@windriver.com>
References: <4F05CAB9.4020001@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325856358.28005.179.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: MIPS Prelinker problem -- possible fix
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
X-List-Received-Date: Fri, 06 Jan 2012 13:33:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 10:07 -0600, Mark Hatle wrote:
> I have created a patch (with help from Khem Raj) to resolve a long standing 
> issue w/ the MIPS prelinker.  The prelinker was detecting a error condition 
> based on what appears to be some incomplete math calculations.
> 
> Attached is a patch that I believe will fix the problem, but I would like folks 
> on both MIPS and non MIPS system to try it out.

Thanks.  I tried this out last night and it does seem to solve the
problem for me.  (I was previously using a hack in image-prelink.bbclass
which just deleted all the .mdebug.abi32 sections before prelinking.)

p.




