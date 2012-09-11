Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBPA0-0003n9-Ve
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 14:01:44 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TBOxw-0000Gv-2J
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 13:49:16 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 12:49:15 +0100
In-Reply-To: <2e7dddfce4a40a56f671116a2001b13c57667c70.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
	<2e7dddfce4a40a56f671116a2001b13c57667c70.1344892361.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1347364156.6856.18.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 11/32] sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to be defined
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
X-List-Received-Date: Tue, 11 Sep 2012 12:01:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-13 at 14:14 -0700, Scott Garman wrote:
> +pkg_postinst_${PN} () {
> +# run this on the target
> +if [ "x$D" == "x" ]; then

By the way, "==" is a bashism; that should just be "=" for portability.
Or you can use '-z "$D"' which is also portable.

p.




