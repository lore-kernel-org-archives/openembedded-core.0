Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWQ1H-0004QV-CY for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 11:34:47 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWPy0-00041A-IS
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 11:31:24 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8b9e3b8e8afa3720fbc57adb817b9e9f7f9094ef.1308037753.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
	<8b9e3b8e8afa3720fbc57adb817b9e9f7f9094ef.1308037753.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 14 Jun 2011 10:31:23 +0100
Message-ID: <1308043883.25285.234.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [CONSOLIDATED PULL 21/51] alsa-tools: fix Checksums
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
X-List-Received-Date: Tue, 14 Jun 2011 09:34:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 01:01 -0700, Saul Wold wrote:
> +EXTRA_OEFLAGS = "--host ${HOST_SYS}"

This change isn't mentioned in the checkin comment and, as far as I can
tell, setting that variable isn't going to produce any useful effect.
Can you clarify what's going on here?

p.




