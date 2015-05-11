Return-Path: <pb@pbcl.net>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 May 2015 22:09:22 UTC
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id AD00C6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 22:09:22 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=h006.home.private)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1YrvoD-0002SR-4q; Tue, 12 May 2015 00:04:21 +0200
Message-ID: <1431381853.3920.17.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Date: Mon, 11 May 2015 23:04:13 +0100
In-Reply-To: <1431367371-7716-2-git-send-email-bruno.bottazzini@intel.com>
References: <1431367371-7716-1-git-send-email-bruno.bottazzini@intel.com>
	<1431367371-7716-2-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 1/3] dbus: split tools package.
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
X-List-Received-Date: Mon, 11 May 2015 22:09:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-05-11 at 15:02 -0300, Bruno Bottazzini wrote:
> +FILES_${PN}-tools += "${bindir}/dbus-uuidgen \

Doesn't the dbus startup script use dbus-uuidgen?

p.



