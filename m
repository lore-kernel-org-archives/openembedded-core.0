Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B44FE60912
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 11:06:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HBCWrq021600; Mon, 17 Jun 2013 12:12:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0wNrO5ZDJbXE; Mon, 17 Jun 2013 12:12:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HBCPSg021596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 17 Jun 2013 12:12:27 +0100
Message-ID: <1371467178.20823.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 17 Jun 2013 12:06:18 +0100
In-Reply-To: <1371466771.6580.14.camel@phil-desktop.brightsign>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<fd86333f362b5ce34f7d2f2e60d03a4477ff8eeb.1371447869.git.Qi.Chen@windriver.com>
	<1371464233.6580.3.camel@phil-desktop.brightsign>
	<1371464893.20823.100.camel@ted>
	<1371466771.6580.14.camel@phil-desktop.brightsign>
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
X-List-Received-Date: Mon, 17 Jun 2013 11:06:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-17 at 11:59 +0100, Phil Blundell wrote:
> On Mon, 2013-06-17 at 11:28 +0100, Richard Purdie wrote:
> > The thinking is therefore we should therefore create a replacement for
> > it from busybox. People are nervous about making busybox entirely SUID
> > but having some small subset of it seems like a reasonable compromise.
> 
> The difficulty with this in the past has always been that the way
> busybox is structured makes it quite difficult to tell which parts of
> the code might actually end up being executed in setuid context.  But
> maybe that situation has improved now, I dunno.

The plan (and I believe what this series does) is to have two busybox
binaries, one is suid (as small a subset as we really need) and the
other is not and hence this hopefully goes some way to reassuring people
about that.

Cheers,

Richard


