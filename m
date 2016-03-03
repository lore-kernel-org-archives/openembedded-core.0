Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id F017377038
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 19:30:32 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1abYxE-00084e-71; Thu, 03 Mar 2016 20:30:32 +0100
Message-ID: <1457033424.587.4.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 03 Mar 2016 19:30:24 +0000
In-Reply-To: <CAJ86T=VFnc1rPssKouNWGbr-_WgyLKjau5hwn5-B4LiCh=jJUg@mail.gmail.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-4-git-send-email-armccurdy@gmail.com>
	<1457010155.3476.31.camel@pbcl.net> <20160303131826.GE2569@jama>
	<1457013652.3476.44.camel@pbcl.net>
	<CAJ86T=VFnc1rPssKouNWGbr-_WgyLKjau5hwn5-B4LiCh=jJUg@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Thu, 03 Mar 2016 19:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-03 at 11:11 -0800, Andre McCurdy wrote:
> All the good work and effort that Martin has been doing keeping the
> Thumb1 builds alive could then perhaps be redirected to testing Thumb2
> (or some other case which isn't covered by the default oe-core CI
> builds).

Yes, agreed.  Given that, with modern processors and recent versions of
GCC, Thumb2 code is generally both smaller and faster than the
equivalent ARM binaries, it seems as though this is the configuration
that most users will want nowadays and consequently an important one to
test.

p.



