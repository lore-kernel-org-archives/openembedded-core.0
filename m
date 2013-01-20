Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1TwxMe-0000rJ-0a
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 17:03:20 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 9D6FB2543431;
	Sun, 20 Jan 2013 16:01:45 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1Twx7f-0001aC-9h; Sun, 20 Jan 2013 16:47:51 +0100
Date: Sun, 20 Jan 2013 16:47:51 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130120154751.GA21666@xiaoyu.lan>
References: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
	<50F993A7.30308@linux.intel.com>
	<20130119084426.GH15126@xiaoyu.lan> <1358686568.14265.20.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1358686568.14265.20.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archiver.bbclass: Archive the native builds as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 16:03:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 20, 2013 at 12:56:08PM +0000, Richard Purdie wrote:

Dear Richard,

> So there could well be a problem here but I'm not feeling happy we've
> solved it yet. More information would be appreciated.

I agree. The removal of -native comes from the fact that I wanted the
source opkg-utils-native (because at least in edison there were patches
that are not inside the Openmoki SVN, this also means I backported the
archiver). So the -native helped with that part. I was just curious to
check if I have the sources for libgcc and I didn't.

It will take me at least two weeks before I can re-try with OE-Core HEAD
and check if the sources for GCC are missing or not. For the policy part
I am pretty sure that I want _all_ the sources (except the LICENSE is closed).

holger




