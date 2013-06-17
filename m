Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A223C60819
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 10:28:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HAYRPD019898; Mon, 17 Jun 2013 11:34:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yRl2lFdyEpaC; Mon, 17 Jun 2013 11:34:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HAYJ5c019891
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 17 Jun 2013 11:34:20 +0100
Message-ID: <1371464893.20823.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 17 Jun 2013 11:28:13 +0100
In-Reply-To: <1371464233.6580.3.camel@phil-desktop.brightsign>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<fd86333f362b5ce34f7d2f2e60d03a4477ff8eeb.1371447869.git.Qi.Chen@windriver.com>
	<1371464233.6580.3.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 9/9] tinylogin: remove recipe
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
X-List-Received-Date: Mon, 17 Jun 2013 10:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-17 at 11:17 +0100, Phil Blundell wrote:
> On Mon, 2013-06-17 at 13:49 +0800, Qi.Chen@windriver.com wrote:
> > tinylogin has been deprecated and the functionality ported into busybox.
> > We now use busybox as the login manager, so the tinylogin recipe could
> > be deleted.
> 
> I'm not entirely sure who "we" is in this context, but the choice of
> login manager has, historically, been a distro decision.  
> 
> Reading between the lines I assume what you're actually saying here is
> that Poky has decided to switch from tinylogin to busybox, which
> obviously is fine.  It's not entirely obvious to me that this is a very
> compelling reason to remove tinylogin from oe-core, though equally I
> guess there is no reason it couldn't live in some other layer instead.

The trouble is that the tinylogin we're using is obsolete code and
unmaintained/deprecated. Its starting to become a maintenance burden and
cause some security concerns since nobody else is using it.

The thinking is therefore we should therefore create a replacement for
it from busybox. People are nervous about making busybox entirely SUID
but having some small subset of it seems like a reasonable compromise.

If someone wants to continue using tinylogin, there are obviously free
to do so but it would no longer be part of OE-Core.

Cheers,

Richard


