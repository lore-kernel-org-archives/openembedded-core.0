Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjpHZ-0003kn-ON
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:11:01 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjpDc-0004Aw-0n
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:06:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2011 10:06:55 +0100
In-Reply-To: <32d1cb41db60871d067df99d7b24b46a3fe8297e.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<32d1cb41db60871d067df99d7b24b46a3fe8297e.1311234759.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311239216.30326.78.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 07/10] sudo: add pam support
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
X-List-Received-Date: Thu, 21 Jul 2011 09:11:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-21 at 16:00 +0800, Kang Kai wrote:
> +do_install_append () {
> +	install -D -m 664 ${WORKDIR}/sudo.pamd ${D}/${sysconfdir}/pam.d/sudo
> +}

As with openssh, you don't want to install and ship this file if pam
isn't enabled.

p.




