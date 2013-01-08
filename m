Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TsakL-0001UW-HU
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:05:46 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TsaVg-0005od-G5; Tue, 08 Jan 2013 15:50:36 +0100
From: Phil Blundell <philb@gnu.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Tue, 08 Jan 2013 14:50:35 +0000
In-Reply-To: <50EC3002.8050209@intel.com>
References: <50EC3002.8050209@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1357656636.3678.118.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-modules, do we need it anymore?
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
X-List-Received-Date: Tue, 08 Jan 2013 15:05:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-08 at 16:41 +0200, Laurentiu Palcu wrote:
> So, does anybody know why do we still have it around? Most modern
> distributions declared update-modules as obsolete and /etc/modules.conf
> doesn't exist anymore. Am I missing something?

As you say, it's just a historical relic.  It's already optional in
oe-core: you can turn it off by omitting update-modules from your
DISTRO_FEATURES.  I would certainly recommend that any modern distro
does that.

p.




