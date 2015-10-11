Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D5D4B75F3A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Oct 2015 09:51:20 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZlDHi-0007Rj-QI; Sun, 11 Oct 2015 11:51:19 +0200
Message-ID: <1444557068.2003.0.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Oct 2015 10:51:08 +0100
In-Reply-To: <1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Sun, 11 Oct 2015 09:51:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-10-09 at 17:11 +0200, Martin Jansa wrote:
> * gcr, libsecret are new since switch to gcc 5.2

The problem with libsecret seems to be caused by its valgrind support
code (which contains asm statements that only work in ARM state).  I
wonder if you can just turn WITH_VALGRIND off rather than forcing
ARM-state for the whole library.

p.



