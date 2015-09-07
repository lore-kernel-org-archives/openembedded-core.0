Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CDBD560017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 19:36:58 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZ2Dp-0002rk-Lg; Mon, 07 Sep 2015 21:36:57 +0200
Message-ID: <1441654609.1680.79.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 07 Sep 2015 20:36:49 +0100
In-Reply-To: <a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Sep 2015 19:36:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
> update-rc.d is now needed by systemd to interact with sysv
> scripts, so if we have a mixed system, then we can not uninstall
> update-rc.d as it is going to break systemd functionality

The description above implies that you will only uninstall update-rc.d
if systemd is present, but that doesn't seem to be what the patch does.

Also, if the rootfs is read-only then you might as well go ahead and
uninstall it irrespective of systemd because it isn't going to work.  If
systemd will fail catastrophically in this situation then I guess it
should be an error to have both systemd and sysv scripts in a read-only
filesystem.

p.



