Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CB0F16010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 15:16:21 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZyhzY-0006TP-TV; Tue, 17 Nov 2015 16:16:21 +0100
Message-ID: <1447773377.1472.28.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 15:16:17 +0000
In-Reply-To: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 15:16:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-11-16 at 21:56 -0800, Andre McCurdy wrote:
> 
+# Workaround for linking issues seen with armv7a + gold
> +LDFLAGS_append_armv7a = "${@base_contains('DISTRO_FEATURES', 'ld-is
> -gold', ' -fuse-ld=bfd ', '', d)}"
> 

Does the resulting directfb-csource binary actually work with that
change?  My recollection is that ld.bfd will just silently permit
relocs that gold (correctly) refuses to allow.

p.


