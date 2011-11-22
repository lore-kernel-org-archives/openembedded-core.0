Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RSu2H-0007qL-Nc
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 18:21:33 +0100
Received: from [81.142.160.137] (helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RStw1-0006vA-1u
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 18:15:05 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2011 17:14:22 +0000
In-Reply-To: <65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1321982105.29435.302.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Tue, 22 Nov 2011 17:21:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 13:47 +0000, Otavio Salvador wrote:
> Xorg VESA driver calls DGAInit enforcing this symbol to be available
> to the driver to work.

Maybe it would be better to patch vesa.c to not require this symbol
rather than forcing it on in the server for everyone.  Or alternatively,
if you genuinely want DGA, maybe make it a PACKAGECONFIG option.

p.




