Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DAEB06E88D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 13:43:53 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WAJoX-00057n-Vh; Mon, 03 Feb 2014 14:43:54 +0100
Message-ID: <1391435033.14769.5.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Mon, 03 Feb 2014 13:43:53 +0000
In-Reply-To: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net", has
 identified this incoming email as possible spam.  The original message
 has been attached to this so you can view it (if it isn't spam) or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 
 Content preview:  On Mon, 2014-02-03 at 13:58 +0100, David Nyström wrote: >
    An intended fix for below error message with core-image-lsb, > Sending this
    as an RFC since I dont really know what constitutes > a RRECOMMENDS vs. RDEPENDS.
    > Is this clearly defined somewhere ? > Below should be an RDEPENDS, no ?
    > > INIT: version 2.88 booting > Starting udev > udevd[59]: starting version
    182 > /etc/rcS.d/S04udev: line 108: udevadm: command not found > /etc/rcS.d/S04udev:
    line 113: udevadm: command not found > /etc/rcS.d/S04udev: line 114: udevadm:
    command not found [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] udev: add udev-utils to RDEPENDS
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
X-List-Received-Date: Mon, 03 Feb 2014 13:43:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2014-02-03 at 13:58 +0100, David Nyström wrote:
> An intended fix for below error message with core-image-lsb, 
> Sending this as an RFC since I dont really know what constitutes 
> a RRECOMMENDS vs. RDEPENDS. 
> Is this clearly defined somewhere ?
> Below should be an RDEPENDS, no ?
> 
> INIT: version 2.88 booting
> Starting udev
> udevd[59]: starting version 182
> /etc/rcS.d/S04udev: line 108: udevadm: command not found
> /etc/rcS.d/S04udev: line 113: udevadm: command not found
> /etc/rcS.d/S04udev: line 114: udevadm: command not found

That depends (ha ha) on what the udevadm call in question is actually
doing.  If udev is so badly broken without it as to be unusable then
yes, it should be an RDEPENDS.  If udev will still work without then
RRECOMMENDS is appropriate and the initscript should be tweaked to deal
with it.

p.



