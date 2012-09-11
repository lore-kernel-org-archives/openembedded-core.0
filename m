Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBUys-0004Ai-3P
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 20:14:38 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBUmm-0000TX-94; Tue, 11 Sep 2012 20:02:08 +0200
Message-ID: <1347386402.29443.32.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Matthew McClintock <msm@freescale.com>
Date: Tue, 11 Sep 2012 19:00:02 +0100
In-Reply-To: <1347386213-6215-1-git-send-email-msm@freescale.com>
References: <1347386213-6215-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we have items to check
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
X-List-Received-Date: Tue, 11 Sep 2012 18:14:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 12:56 -0500, Matthew McClintock wrote:
> Right now, we delay running the serial console checks to we boot up. This causes
> issues for read only file systems. So, if have not configured any serial ports to
> check via SERIAL_CONSOLES_CHECK we can skip the check at boot. This fixes any
> issues with read only file systems and ipk packaging.
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> v2: bump PR
> v3: change a == bashism to =

Looks good.  Thanks.

p.




