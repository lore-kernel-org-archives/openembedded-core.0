Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SS7vf-0007Mj-30
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 16:31:47 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SS7m8-00059u-Du
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 16:21:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 15:21:55 +0100
In-Reply-To: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1336573316.5602.68.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
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
X-List-Received-Date: Wed, 09 May 2012 14:31:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 08:46 -0500, Jason Wessel wrote:
> External distributions based on the oe-core will typically include
> bitbake in the top level directory.  The idea is to make it easy
> for external distributions to easily assemble a distribution
> with a pristine version of oe-core, add avoid the git untracked messages:

Presumably any non-trivial external distribution is going to include
other metadata as well, in which case they're going to have to
edit .gitignore for themselves anyway.  So it doesn't really seem as
though having bitbake be mentioned there in oe-core buys much.

On the other hand, actually moving bitbake inside the oe-core repository
seems like an idea which might have some merit.  It's not obvious that
having it in its own tree really achieves anything other than making
release engineering slightly more difficult.

p.




