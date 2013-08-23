Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7C36065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:03:56 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VCumD-0003NZ-34; Fri, 23 Aug 2013 19:03:57 +0200
Message-ID: <1377277436.5452.48.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Aug 2013 18:03:56 +0100
In-Reply-To: <1377274473.6762.100.camel@ted>
References: <1377180295.6762.19.camel@ted>
	<1377181123.13664.11.camel@phil-desktop.brightsign>
	<1377256631.6762.58.camel@ted>
	<1377273397.5452.43.camel@phil-desktop.brightsign>
	<1377274473.6762.100.camel@ted>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Web browsing and HTML in OE-Core
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
X-List-Received-Date: Fri, 23 Aug 2013 17:03:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-23 at 17:14 +0100, Richard Purdie wrote:
> What does the standalone launcher give you?

Basically a very simple browser-type application that you can launch
with a URL from the command line and see the resulting page in a window.
Generally you also get some rudimentary UI controls, back/forward
buttons and an address bar, that sort of thing.

The Qt port actually seems to have a slightly more sophisticated thing
in the form of QtTestBrowser, but I've never used that myself.  Anyway,
I guess the key thing is that every port has at least something, and
these ship with (and are maintained as part of) webkit itself.

p.



