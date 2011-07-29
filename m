Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmpCs-0004uL-Rb
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 17:42:34 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qmp8m-000471-Br
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 17:38:20 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jul 2011 16:38:19 +0100
In-Reply-To: <8d920461c0a2d050b30d99d5a5ce464af6209f40.1311950827.git.lianhao.lu@intel.com>
References: <86e74f97a7eea07d74dafa632c053da2d37e03eb.1311950827.git.lianhao.lu@intel.com>
	<8d920461c0a2d050b30d99d5a5ce464af6209f40.1311950827.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311953900.30326.495.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC BUG #1236 2/2] eglibc: Modify ldd script according to multilib config.
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
X-List-Received-Date: Fri, 29 Jul 2011 15:42:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-29 at 22:57 +0800, Lianhao Lu wrote:
> +		"x86": ["ld-linux.so.2", "FLAG_ELF_LIBC5"],

That looks a bit weird to me.  Are you sure that's right?

p.




