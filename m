Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RRqSY-0003QD-Ug
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 20:20:18 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RRqML-0002YR-3O; Sat, 19 Nov 2011 20:13:53 +0100
From: Phil Blundell <philb@gnu.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
	<CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
	<CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
	<CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
Date: Sat, 19 Nov 2011 19:12:06 +0000
Message-ID: <1321729926.3389.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Sat, 19 Nov 2011 19:20:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-19 at 18:59 +0000, McClintock Matthew-B29882 wrote:
> On Sat, Nov 19, 2011 at 8:29 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> >> It must be online though in this case?
> >
> > The code you add needs to be running on target and doesn't work at
> > rootfs built time. This is bad and adds more complications to
> > read-only-fs support.
> 
> This works *perfectly* with a read only fs. Each time it boots removes
> the non-working serial ports. One could argue that it does NOT work
> completely as expected with a writable file system.

Um, the patch you sent seems to modify /etc/inittab on the rootfs.  How
can that work if the filesystem is read only?

p.




