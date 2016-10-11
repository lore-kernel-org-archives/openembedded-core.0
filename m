Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BC1226E5FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 14:04:00 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:d9ca:78f3:9621:b8b5] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>) id 1btxez-0006n3-4r
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2016 16:04:01 +0200
Message-ID: <1476194640.16008.49.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 15:04:00 +0100
In-Reply-To: <1446734860-6091-1-git-send-email-mac@mcrowe.com>
References: <1446734860-6091-1-git-send-email-mac@mcrowe.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] kernel: Permit overriding of KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Tue, 11 Oct 2016 14:04:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2015-11-05 at 14:47 +0000, Mike Crowe wrote:
> Commit a1690131691507bbf5853540229b3ad775b836bf removed the ability
> of
> recipes to set KERNEL_IMAGETYPE_FOR_MAKE. This can be fixed by only
> setting KERNEL_IMAGETYPE_FOR_MAKE if it doesn't already have a
> value. This should hopefully be a good enough approximation to the
> behaviour prior to that commit to keep such recipes working.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>

Does anybody know why this patch was not merged?  I couldn't find any
comments on the list.

(It needs adjusting slightly to apply against current master due to
other changes to kernel.bbclass in the meantime.)

thanks

p.


