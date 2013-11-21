Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 34C0A6DB9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 14:51:42 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VjVbY-0001zX-T6; Thu, 21 Nov 2013 15:51:41 +0100
Message-ID: <1385045500.23724.165.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 21 Nov 2013 14:51:40 +0000
In-Reply-To: <528E1BE1.2030003@windriver.com>
References: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>
	<1385035973.23724.146.camel@phil-desktop.brightsign>
	<528E1BE1.2030003@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2013-11-21 at 08:42 -0600,
	Mark Hatle wrote: > On
	11/21/13, 6:12 AM, Phil Blundell wrote: > > On Thu,
	2013-11-21 at 00:59 -0600, 
	Mark Hatle wrote: > >> +# When using a read-only rootfs additional
	setup
	may be required > >> +# uncomment the following line to make bind start
	in
	read-only rootfs > >> +#ALLOW_ROOTFS_READ_ONLY="yes" > > > > If the
	filesystem
	is read-only then it's going to be fairly difficult > > for the user to
	uncomment
	this line on the target. > > A post image process script would be
	capable
	of un-commenting that line (or > simply replacing the file with a
	specific image specific configuration.) [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 21 Nov 2013 14:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 08:42 -0600, Mark Hatle wrote:
> On 11/21/13, 6:12 AM, Phil Blundell wrote:
> > On Thu, 2013-11-21 at 00:59 -0600, Mark Hatle wrote:
> >> +# When using a read-only rootfs additional setup may be required
> >> +# uncomment the following line to make bind start in read-only rootfs
> >> +#ALLOW_ROOTFS_READ_ONLY="yes"
> >
> > If the filesystem is read-only then it's going to be fairly difficult
> > for the user to uncomment this line on the target.
> 
> A post image process script would be capable of un-commenting that line (or 
> simply replacing the file with a specific image specific configuration.)

That's true, but I still don't understand why this ought to be
necessary.  Why should it not just default to being enabled?

> >> ++	[ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount /var/volatile/bind/etc /etc/bind
> >> ++	[ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount /var/volatile/bind/named /var/named
> >
> > Is it really necessary to mount a tmpfs at /etc/bind?  Can't those files
> > just be relocated somewhere else?
> 
> My understanding is both locations need to be RW for bind to work properly.  In 
> a normal READONLY filesystem configuration, neither is RW by default.

What files does it need to write to /etc/bind?

p.



