Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACA26FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 13:02:41 +0000 (UTC)
Received: from [212.183.132.60] (helo=e130) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1agB61-0005kA-HM; Wed, 16 Mar 2016 14:02:42 +0100
Message-ID: <1458133326.2038.30.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Mar 2016 13:02:06 +0000
In-Reply-To: <CAJTo0LZVWPcneQzqB5hWaphESAUtVjNggto4oNcTDjdOXj9jFA@mail.gmail.com>
References: <1458131361.2038.28.camel@pbcl.net>
	<CAJTo0LZVWPcneQzqB5hWaphESAUtVjNggto4oNcTDjdOXj9jFA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: X.org licenses
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
X-List-Received-Date: Wed, 16 Mar 2016 13:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-16 at 12:59 +0000, Burton, Ross wrote:
> Ditto, MIT-style and MIT-X all map to MIT.
> 
> Considering xorg-lib-common.inc already sets LICENSE="MIT-X" and these
> recipes are overriding that assignment, we should probably remove all
> instances of MIT-style from the xorg recipes as they should probably
> be MIT-X.

Yeah, that seems reasonable.  A particularly weird thing is that some of
the recipes are setting LICENSE = "MIT && MIT-style", which seems bogus
if they are in fact the same thing.

p.




