Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QNhA5-0005J7-5E for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 10:03:49 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QNh7F-0000GD-NW
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 10:00:53 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
References: <cover.1305933509.git.raj.khem@gmail.com>
	<43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
Date: Sat, 21 May 2011 09:00:48 +0100
Message-ID: <1305964848.18415.257.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Sat, 21 May 2011 08:03:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
> -	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
> +	install -d $D/${sysconfdir}/rcS.d

Just as a note in passing, this sort of thing is best written as:

	install -d "${D}${sysconfdir}/rcS.d"

i.e. you don't need a slash after ${D}, and the whole argument should
ideally be quoted to protect against characters that are special to the
shell.

p.




