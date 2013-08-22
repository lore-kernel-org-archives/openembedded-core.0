Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3423C60842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:19:52 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VCVjs-0001X5-K3; Thu, 22 Aug 2013 16:19:52 +0200
Message-ID: <1377181123.13664.11.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1377180295.6762.19.camel@ted>
References: <1377180295.6762.19.camel@ted>
Date: Thu, 22 Aug 2013 15:18:43 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.4.4-3 
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
X-List-Received-Date: Thu, 22 Aug 2013 14:19:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 15:04 +0100, Richard Purdie wrote:
> With that in mind, I think some kind of HTML support in OE-Core is
> important going forward. Equally, I dislike having things there which we
> cannot test. I know some people have looked into this and it appears
> midori is the best option for something with a small number of
> additional dependencies. I therefore currently think this is something
> we should make a decision to include since it gives us significantly
> better coverage of things like webkit which are a already in the core
> yet totally untested at present.

WebKit itself comes with a bunch of test wrappers (and tests!) for
different platforms and if the aim of the exercise is to test webkit
then it seems like maybe we should just be installing and using those.
Midori would be fine for testing the parts of webkit that it uses, but
obviously it doesn't exercise anything other than the Gtk port which
still leaves you with a bit of a hole in your coverage.

p.



