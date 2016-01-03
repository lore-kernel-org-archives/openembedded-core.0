Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 82F2C6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jan 2016 13:01:15 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aFiHa-0001Up-U5; Sun, 03 Jan 2016 14:01:15 +0100
Message-ID: <1451826066.2002.96.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Date: Sun, 03 Jan 2016 13:01:06 +0000
In-Reply-To: <7ef127138c4ba5c89b42b892c84aaa7766f78a4c.1451778497.git.mschiffer@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<7ef127138c4ba5c89b42b892c84aaa7766f78a4c.1451778497.git.mschiffer@universe-factory.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
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
X-List-Received-Date: Sun, 03 Jan 2016 13:01:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-03 at 00:53 +0100, Matthias Schiffer wrote:
> +PACKAGECONFIG ??= " \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'merged-usr','merged-usr', '', d)} \

Why is this DISTRO_FEATURE (or the corresponding PACKAGECONFIG)
required?  Surely it ought to suffice to simply set ${base_bindir} etc,
and everything else should follow from that.  This, albeit the other way
around, is what micro has been doing for years.

p.



