Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RiqUv-0006Mz-7Y
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 17:49:01 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RiqNm-0003Jr-RR; Thu, 05 Jan 2012 17:41:38 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 16:41:37 +0000
In-Reply-To: <1325781559-18967-1-git-send-email-andrei@gherzan.ro>
References: <1325781559-18967-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325781698.28005.132.camel@phil-desktop>
Mime-Version: 1.0
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] wpa-supplicant: Patch this recipe order to remove a duplicate defconfig file
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
X-List-Received-Date: Thu, 05 Jan 2012 16:49:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 18:39 +0200, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
> 
> Instead of having two defconfigs we can have only one and append this file with de specific
> CONFIG if GPLv3 packages are allowed.

As I said the other day, I think it would be better to just have one
defconfig and turn off the GPLv3 stuff entirely.  Do you know of anybody
who actually wants to use it?

p.




