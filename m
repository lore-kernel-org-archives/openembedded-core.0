Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UTCMp-0000SN-Mg for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 16:32:54 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UTC5q-0000sf-SC; Fri, 19 Apr 2013 16:15:15 +0200
Message-ID: <1366380914.7011.238.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Florin Sarbu <florin.sarbu@windriver.com>
Date: Fri, 19 Apr 2013 15:15:14 +0100
In-Reply-To: <1357801270-3793-1-git-send-email-florin.sarbu@windriver.com>
References: <1357801270-3793-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] alsa-utils: add bash as a dependency of the alsa-utils-alsaconf rpm.
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
X-List-Received-Date: Fri, 19 Apr 2013 14:32:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-10 at 09:01 +0200, Florin Sarbu wrote:
> alsa-utils-alsaconf rpm contains the bash script alsaconf. In order
> to have the do_rootfs not error when bash is not brought along in
> the rootfs as an explicit dependency, we add it as a dependency
> of alsa-utils.

This means that bash has become a build dependency of alsa-utils, which
is a waste of build time for anybody who doesn't want alsaconf.  I think
we previously didn't package alsaconf at all on the grounds that it was
no use, but if it is desired then maybe it should go in a separate
recipe so it can have its own DEPENDS.

p.




