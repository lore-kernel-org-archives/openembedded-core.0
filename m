Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SUhTe-0007g0-C5
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 18:53:30 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SUhJz-0000UO-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 18:43:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2012 17:43:30 +0100
In-Reply-To: <4FB3C2CC.7010204@windriver.com>
References: <20120515140110.2ba5a1be@wrlaptop>
	<CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
	<4FB32EA1.3060601@linux.intel.com> <4FB3C2CC.7010204@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1337186611.1964.76.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: RFC: FOO_subtract, the logical antidote to FOO_append.
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
X-List-Received-Date: Wed, 16 May 2012 16:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-16 at 10:07 -0500, Mark Hatle wrote:
> But the real problem we keep struggling with is .conf load order.. you try to 
> set some nice value in local.conf, and some later configuration file adds to it, 
> or simply overwrites it.  He'd like a way to strip out things like that.

OVERRIDES .= ":local"
VAR_local = "I rule"

Or you could use the existing "_forcevariable" override although I have
a feeling that was intended for something else.

p.




