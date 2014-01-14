Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEC960172;
	Tue, 14 Jan 2014 12:55:35 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W33Wp-0002II-N4; Tue, 14 Jan 2014 13:55:35 +0100
Message-ID: <1389704128.19023.11.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Jan 2014 12:55:28 +0000
In-Reply-To: <20140114121347.GB3717@jama>
References: <7166127.YkfX3aIoNI@helios> <20140114121347.GB3717@jama>
X-Mailer: Evolution 3.8.5-2+b1 
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
	Content preview:  On Tue, 2014-01-14 at 13:13 +0100,
	Martin Jansa wrote: > Not sure if it's worth new item on agenda,
	but maybe we should move > meta/classes/image-prelink.bbclass
	functionality to package.bbclass,
	> maybe we have more cases like this where
	image build is changing files > which are provided by normal packages
	(such
	cases are lost after > upgrading on device with packagemanager). [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Public TSC / OE Workgroup meeting today
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
X-List-Received-Date: Tue, 14 Jan 2014 12:55:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-14 at 13:13 +0100, Martin Jansa wrote:
> Not sure if it's worth new item on agenda, but maybe we should move
> meta/classes/image-prelink.bbclass functionality to package.bbclass,
> maybe we have more cases like this where image build is changing files
> which are provided by normal packages (such cases are lost after
> upgrading on device with packagemanager).

How would that work?  I'm not sure that it's possible (in the general
case) to prelink in any sensible way prior to rootfs construction.  The
same applies to image-mklibs.bbclass.

p.


