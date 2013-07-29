Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEBF6B414
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 14:37:01 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V3oZH-0003M1-2Q; Mon, 29 Jul 2013 16:36:59 +0200
Message-ID: <1375108618.13247.35.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 15:36:58 +0100
In-Reply-To: <CAJTo0Lb5Unw3jW_ytf+Q5hDAwN8AosHdGGxmynuHNHJcCyHwtQ@mail.gmail.com>
References: <1375085392-12339-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAJTo0Lb5Unw3jW_ytf+Q5hDAwN8AosHdGGxmynuHNHJcCyHwtQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] [V2] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Mon, 29 Jul 2013 14:37:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-29 at 15:34 +0100, Burton, Ross wrote:
> On 29 July 2013 09:09, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
> > +        # If systemd_unitdir contains anything, delete sysv_initddir
> > +        if (os.path.exists(systemd_unitdir) and os.listdir(systemd_unitdir)):
> > +            shutil.rmtree(sysv_initddir)
> 
> Not sure we need the listdir(), why should the function only delete
> the directory if it has contents?  If it doesn't have contents you'll
> be packaging an empty directory.

The directory he's deleting is different to the one that he's listing.

p.



