Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uciqy-0001V0-Qz for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 23:03:19 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UciZN-0000DO-45; Wed, 15 May 2013 22:45:05 +0200
Message-ID: <1368650688.16243.142.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Wed, 15 May 2013 21:44:48 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8436FC7C27@ALA-MBA.corp.ad.wrs.com>
References: <1368574528-28247-1-git-send-email-jslater@windriver.com>
	<1368574528-28247-2-git-send-email-jslater@windriver.com>
	<1368611695.6920.79.camel@phil-desktop.brightsign>
	<519388C2.5000706@windriver.com>
	<007BD92917A2324FA403BCF9A464CF8436FC7C27@ALA-MBA.corp.ad.wrs.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] zlib: put shared libraries in base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 21:03:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-15 at 19:50 +0000, Slater, Joseph wrote:
> Yes, this is it:
> 
> WARNING: QA Issue: libpam: /lib64/security/pam_cracklib.so, installed in the base_prefix,
> requires a shared library under exec_prefix
> (/usr): libz.so.1 => /usr/lib64/libz.so.1 (0x00000000dead5000)

Presumably pam_cracklib.so can't go in /usr due to reasons, right?

p.




