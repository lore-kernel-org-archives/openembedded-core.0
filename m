Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SthVm-0005pQ-6g
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:59:02 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SthKi-0005VM-3g
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:47:36 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jul 2012 16:47:35 +0100
In-Reply-To: <500EC30C.30503@windriver.com>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<1343144355.5878.18.camel@phil-desktop> <500EC30C.30503@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1343144856.5878.19.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
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
X-List-Received-Date: Tue, 24 Jul 2012 15:59:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-24 at 11:45 -0400, Yao Zhao wrote:
> In the Makefile, libbz2.so.0 is installed before bzip2, but the 
> installation is "make -j xxx install". Then this could happen.

Well, yes, but you could fix that by adding an appropriate dependency.
Right?

p.




