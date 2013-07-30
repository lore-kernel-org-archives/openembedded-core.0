Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8996F6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 12:14:52 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V48pG-0004BU-Oh; Tue, 30 Jul 2013 14:14:50 +0200
Message-ID: <1375186489.13247.55.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 30 Jul 2013 13:14:49 +0100
In-Reply-To: <CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 12:14:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 09:00 -0300, Otavio Salvador wrote:
> To make this, we cannot reuse Poky distro for example as it
> /unconditionally/ appends to DISTRO_FEATURES. Besides it is easier for
> test to be able to override it using local.conf. For products I agree
> we'll end adding a distro to make it reprodicable but for development
> stage this trick makes life much easier.

Surely for one-off tests you can just write out the whole intended value
of DISTRO_FEATURES in your local.conf.  It doesn't seem as though this
variable is unwieldy enough that it really needs mechanical handling.

As for poky appending to DISTRO_FEATURES rather than just setting it,
that sounds like it's arguably a bug in poky and you should perhaps take
it up with those guys.  Of course, they might take the view that poky
itself is meant to be determining what DISTRO_FEATURES it wants and they
don't want to support or encourage random frobbing of flags by third
parties, and I think that'd be an understandable position.

>We call it and /finalize/ the database so it has _append/_prepend
>resolved before mangling the list.

That seems a bit unwholesome in itself.  Are you sure there are no
potential bad consequences from calling finalize() there?

p.



