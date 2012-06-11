Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Se20q-0002YH-Nx
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 12:38:20 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Se1qf-0002DV-Kz
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 12:27:49 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 11:27:48 +0100
In-Reply-To: <2537506.sJK0eATnrm@helios>
References: <cover.1339405061.git.lianhao.lu@intel.com>
	<ebe46107b8bcc9637bf93b125fa5f9b0a0a045bd.1339405061.git.lianhao.lu@intel.com>
	<20120611094548.GA6900@ad.chargestorm.se> <2537506.sJK0eATnrm@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1339410469.31110.73.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] openssh: Allow empty passwords login.
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
X-List-Received-Date: Mon, 11 Jun 2012 10:38:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-11 at 11:24 +0100, Paul Eggleton wrote:
> I don't think we want this to be image-specific. FWIW, we do already have a 
> mechanism to handle this for the dropbear recipe - debug-tweaks in 
> IMAGE_FEATURES. I don't particularly like it however since IMAGE_FEATURES 
> should not be influencing non-image recipes. This has bothered me for a while 
> and I think we ought to change to some other mechanism (perhaps make it a 
> separate variable) and then make the OpenSSH recipe use that.

In the particular case of OpenSSH, it's just a configuration file
setting, rather than a compile-time #ifdef, so doing it with
IMAGE_FEATURES and a rootfs postprocess step sounds like a perfectly
wholesome approach.  

I agree that the current mechanism used by dropbear (applying patches
based on IMAGE_FEATURES) is full of suck and should be changed, perhaps
to something more akin to what openssh does.

p.




