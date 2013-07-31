Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9138561619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 11:47:04 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V4Urw-0005rD-A5; Wed, 31 Jul 2013 13:47:04 +0200
Message-ID: <1375271223.8017.52.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 31 Jul 2013 12:47:03 +0100
In-Reply-To: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
References: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Jul 2013 11:47:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 22:11 -0300, Otavio Salvador wrote:
> +    l = d.createCopy()
> +    l.finalize()

Doesn't this mean you're now going to get the overrides applied twice?
It seems as though making a copy here kind of defeats the point of
calling finalize() in the first place.

p.



