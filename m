Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B0B736ADA2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 21:43:11 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WKx7G-0006JP-6X; Tue, 04 Mar 2014 22:43:11 +0100
Message-ID: <1393969384.4151.5.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andrey Belous <abelous@broadcom.com>
Date: Tue, 04 Mar 2014 21:43:04 +0000
In-Reply-To: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2014-03-04 at 15:40 -0500,
	Andrey Belous wrote: >
	-PREFERRED_PROVIDER_virtual/libc = "uclibc" >
	+PREFERRED_PROVIDER_virtual/libc
	?= "uclibc" Why would you be including tclibc-uclibc.inc if you don't
	want to use uclibc? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Tue, 04 Mar 2014 21:43:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-04 at 15:40 -0500, Andrey Belous wrote:
> -PREFERRED_PROVIDER_virtual/libc = "uclibc"
> +PREFERRED_PROVIDER_virtual/libc ?= "uclibc"

Why would you be including tclibc-uclibc.inc if you don't want to use
uclibc?

p.



