Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 549AC6B3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 15:24:24 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V4Bma-0004NO-OH; Tue, 30 Jul 2013 17:24:16 +0200
Message-ID: <1375197856.8017.7.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Tue, 30 Jul 2013 16:24:16 +0100
In-Reply-To: <1372758642-6302-1-git-send-email-obi@opendreambox.org>
References: <1362529925-13211-1-git-send-email-obi@opendreambox.org>
	<1372758642-6302-1-git-send-email-obi@opendreambox.org>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v3] chrpath.bbclass: strip common parent directories from rpath
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
X-List-Received-Date: Tue, 30 Jul 2013 15:24:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-02 at 11:50 +0200, Andreas Oberritter wrote:
> Allows to use shorter TMPDIRs in corner cases, e.g. with native
> perl modules, having a deep directory structure.
> 
> The problem is that the original absolute rpath may be shorter
> than the newly generated relative rpath.

Can we not just fix chrpath to cope with the case where the new path is
longer than the old one?  It seems a bit sad to require
ever-more-convoluted workarounds for what is essentially a tool problem.

p.



