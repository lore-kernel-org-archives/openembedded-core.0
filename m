Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9216A9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:26:47 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UmQT9-0000HU-No; Tue, 11 Jun 2013 17:26:47 +0200
Message-ID: <1370964404.27750.83.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 16:26:44 +0100
In-Reply-To: <CAMKF1srGhvZLyhEZbYbFepZADbAKF1kJM2ObBEjc8OevQ5CCqQ@mail.gmail.com>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
	<1370963003.27750.80.camel@phil-desktop.brightsign>
	<CAMKF1srGhvZLyhEZbYbFepZADbAKF1kJM2ObBEjc8OevQ5CCqQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Tue, 11 Jun 2013 15:26:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-11 at 08:22 -0700, Khem Raj wrote:
> On Tue, Jun 11, 2013 at 8:03 AM, Phil Blundell <pb@pbcl.net> wrote:
> > Er, don't RRECOMMENDS always go into the build dependency list?
> 
> if they do then whats the difference between DEPENDS and RRECOMMENDS
> functionally.

RDEPENDS are required and the package manager will insist they are
always installed.  RRECOMMENDS are optional; you can uninstall them
after the fact, and you can (with some package managers at least)
declare them to be BAD_RECOMMENDATIONS which will be ignored.

> since now rrecommended packages will always be available and they will
> always make into images.

You say "now", but as far as I know it has always been thus.  If it
wasn't then the set of packages that get installed in the image would
depend on what things you happened to have lying around in your deploy
directory, which would not be a very good thing.

p.



