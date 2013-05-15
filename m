Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcYhn-00024H-J3 for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 12:13:08 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcYQC-0007Ha-3w; Wed, 15 May 2013 11:54:56 +0200
Message-ID: <1368611695.6920.79.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Joe Slater <jslater@windriver.com>
Date: Wed, 15 May 2013 10:54:55 +0100
In-Reply-To: <1368574528-28247-2-git-send-email-jslater@windriver.com>
References: <1368574528-28247-1-git-send-email-jslater@windriver.com>
	<1368574528-28247-2-git-send-email-jslater@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] zlib: put shared libraries in base_libdir
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
X-List-Received-Date: Wed, 15 May 2013 10:13:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-14 at 16:35 -0700, Joe Slater wrote:
> We put the shared libraries in base_libdir because at least
> one library under base_libdir, pam_cracklib.so, needs them
> and will cause a qa warning when it is built.

Which warning are you getting?  From the description it sounds like
unsafe-references-in-binaries but that one has been disabled since
2fb58da56e8e7044de21fd10fe9164d204587236.

p.




