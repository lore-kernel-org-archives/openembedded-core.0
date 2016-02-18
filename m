Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D90B46FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 23:44:25 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aWYFC-0002zb-QY; Fri, 19 Feb 2016 00:44:23 +0100
Message-ID: <1455839056.2039.36.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 18 Feb 2016 23:44:16 +0000
In-Reply-To: <CAJ86T=WUd+Zi5feRe4iVShnkj5qdFHTPM42NCthbZc5-RrjcXg@mail.gmail.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
	<1455823285-32028-3-git-send-email-armccurdy@gmail.com>
	<CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
	<2046956.ogQECgGtmI@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=WUd+Zi5feRe4iVShnkj5qdFHTPM42NCthbZc5-RrjcXg@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 23:44:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-18 at 13:33 -0800, Andre McCurdy wrote:
> Aside from automated detection of such problems, what's the best fix
> in this particular case?
> 
>   1) Use LEAD_SONAME to force renaming, even in the case when the
> libsoup-2.4 package contains both shared libs.
> 
>   2) Split libsoup-gnome-2.4 into it's own package, so that both
> libsoup-2.4 and libsoup-gnome-2.4 get renamed.
> 
>   3) Use DEBIAN_NOAUTONAME to prevent renaming, even when the
> libsoup-2.4 package only contains one shared lib.
> 
>   4) Drop the gnome PACKAGECONFIG option so that people can't mess
> with it (in combination with one of the above).

I recommend (2) with (4) as an optional extra.

p.



