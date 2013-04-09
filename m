Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UPfw3-00082D-Cb for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 23:18:38 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UPffH-0001GW-QM; Tue, 09 Apr 2013 23:01:16 +0200
Message-ID: <1365541265.2116.9.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 09 Apr 2013 22:01:05 +0100
In-Reply-To: <6500457.3vgtoKXQDv@helios>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
	<5482882.4phbAeRO1n@helios>
	<1364318752.6320.27.camel@phil-desktop.brightsign>
	<6500457.3vgtoKXQDv@helios>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
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
X-List-Received-Date: Tue, 09 Apr 2013 21:18:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-26 at 17:52 +0000, Paul Eggleton wrote:
> I'm sure this has come up before, but is rm_old_work something we ought to 
> have in OE-Core?

Obviously it's not for me to say, but I suspect probably not.  It
requires ${WORKDIR} to follow a particular pattern, which not everybody
will necessarily want, and I don't think you could really argue that it
represents "core" functionality either.

p.




