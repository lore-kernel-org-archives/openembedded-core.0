Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 638686A441
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 10:21:19 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VIyat-00058k-Ue; Mon, 09 Sep 2013 12:21:20 +0200
Message-ID: <1378722078.6940.124.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: jackie.huang@windriver.com
Date: Mon, 09 Sep 2013 11:21:18 +0100
In-Reply-To: <1378721444-22545-1-git-send-email-jackie.huang@windriver.com>
References: <1378721444-22545-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: avoid gcc ICE by omitting code TEMPORARILY
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
X-List-Received-Date: Mon, 09 Sep 2013 10:21:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-09 at 18:10 +0800, jackie.huang@windriver.com wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
> 
> It's a FYI patch for anyone who might be having the same problem.
> 
> pulseaudio-4.0 causes an internal compiler error. Temporarily
> avoid the build error be omitting the code that makes the
> compiler fail until the compiler ICE is addressed.

Please mention the GCC bug number for this ice so that it's easy to
establish when it has indeed been addressed.

p.



