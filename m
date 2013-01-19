Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1TwUHJ-0008HQ-5w
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 10:00:12 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 546FB2543431;
	Sat, 19 Jan 2013 08:58:14 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1TwU2M-0005Ql-Ho; Sat, 19 Jan 2013 09:44:26 +0100
Date: Sat, 19 Jan 2013 09:44:26 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130119084426.GH15126@xiaoyu.lan>
References: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
	<50F993A7.30308@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <50F993A7.30308@linux.intel.com>
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
X-List-Received-Date: Sat, 19 Jan 2013 09:00:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 18, 2013 at 10:25:43AM -0800, Saul Wold wrote:
> 
> I understand what the issue is here, but I am not sure this is the
> right solution. This will likely bring in way more than is wanted or
> needed for source archiving.
> 
> What's needed from the opkg-utils-native?

IANAL so let me say it is company/personal policy to release more than
would be the minimumm specially to avoid corner cases like we have with
gcc/libgcc.

I think there are some issues..

a.) Missing option to tarball everything. I can prepare a patch for that.

b.) At least libgcc sources not being present.

c.) How can I get back to compliance? I would have to use something like
the old DISTRO_PR after I patched the archiver class and rebuild everything.
How can this be handled today? I have installations in the field that I
want to upgrade, so the PR of each package should increase.

d.) Verify that for the meta-toolchain target the necessary GCC sources
are archived.

cheers
	holger

PS: Re-sent from the right address


