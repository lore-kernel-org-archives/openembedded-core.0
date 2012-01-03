Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri3wX-0005Wq-9S
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 13:58:17 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri3pT-0000hZ-2S
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 13:50:59 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 12:50:58 +0000
In-Reply-To: <abb5741c7b17832f1181b78ba3d03c070cab6304.1325571069.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
	<abb5741c7b17832f1181b78ba3d03c070cab6304.1325571069.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325595059.24417.355.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 083/113] procps: raise update-alternatives priority
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
X-List-Received-Date: Tue, 03 Jan 2012 12:58:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-02 at 22:20 -0800, Saul Wold wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
> 
> This fixes a problem with the uptime utility:
> 
> root@beagleboneA3-0088:/var/lib/cloud9# busybox uptime
>  16:00:17 up 2 days,  6:46,  load average: 0.14, 0.04, 0.05
> root@beagleboneA3-0088:/var/lib/cloud9# uptime.procps
>  16:00:22 up 2 days,  6:46,  1 user,  load average: 0.14, 0.05, 0.06
> root@beagleboneA3-0088:/var/lib/cloud9# uptime.coreutils
>  16:00pm  up 4382 days 15:58,  1 user,  load average: 0.13, 0.05, 0.05
> root@beagleboneA3-0088:/var/lib/cloud9# ls /usr/bin/uptime -la
> lrwxrwxrwx 1 root root 16 Dec 26 08:56 /usr/bin/uptime -> uptime.coreutils

If the coreutils uptime is broken (and assuming it isn't straightforward
to fix) then I would have thought the right thing would be to reduce the
priority of that one alternative rather than increasing all the others
to be higher.  Or just stop coreutils shipping uptime altogether I
suppose.  But, anyway, patching procps to work around a bug in coreutils
seems like the wrong thing.

p.




