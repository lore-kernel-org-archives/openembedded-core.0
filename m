Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 580B27725D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 20:45:42 +0000 (UTC)
Received: from [212.183.132.59] (helo=e130)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aPysP-0001PQ-3l; Sun, 31 Jan 2016 21:45:41 +0100
Message-ID: <1454273105.7421.24.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sun, 31 Jan 2016 20:45:05 +0000
In-Reply-To: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
References: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xterm: revert FILES_PN change from recent package uprev
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
X-List-Received-Date: Sun, 31 Jan 2016 20:45:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-31 at 14:56 -0500, Paul Gortmaker wrote:
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> index f67d890abcae..10b75fca32db 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> @@ -27,4 +27,4 @@ do_configure() {

This file doesn't exist in oe-core.  I think you must have sent this
patch (and the inetutils one, to which the same applies) to the wrong
mailing list.

p.



