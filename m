Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RVUGk-0003fv-Cu
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 21:27:10 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RVUAL-0001vm-Av
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 21:20:33 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
Date: Tue, 29 Nov 2011 20:20:26 +0000
Message-ID: <1322598026.3077.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 20:27:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 11:30 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> configure runs few checks to make sure c++ compiler and runtime are working
> as expected with the --enable-cxx=detect option. And it enables building
> of libgmpxx library.
> 
> Same as earlier the libgmp.so.10.x file is packaged in the libgmp10 package,
> and a new package named libgmpxx4 is added for libgmpxx.so.4.x file.
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> Signed-off-by: Phil Blundell <philb@gnu.org>

Um, why does this patch have my name in Signed-off-by?

p.




