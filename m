Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>)
	id 1RiZyh-0002wO-Db; Thu, 05 Jan 2012 00:10:39 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LXA008UBNWLY284@vms173017.mailsrvcs.net>; Wed,
	04 Jan 2012 16:02:46 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 72371202C2; Wed,
	04 Jan 2012 17:02:45 -0500 (EST)
Date: Wed, 04 Jan 2012 17:02:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120104220245.GE587@denix.org>
References: <20120104181400.GD587@denix.org>
	<CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
	<CAMKF1sqCETomiuAx=9zQf2kLYCO8SMxi5=UUwOQ3LGj4RRJXTg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sqCETomiuAx=9zQf2kLYCO8SMxi5=UUwOQ3LGj4RRJXTg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] BlueZ old releases have new checksums
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2012 23:10:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 04, 2012 at 12:53:25PM -0800, Khem Raj wrote:
> On Wed, Jan 4, 2012 at 12:14 PM, Chris Larson <clarson@kergoth.com> wrote:
> > On Wed, Jan 4, 2012 at 11:14 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> The main archive of BlueZ/obexd/hcidump releases on kernel.org[1] finally
> >> re-appeared after missing for long time since kernel.org compromise.
> >> Unfortunately, all previous tarballs have new checksums, breaking builds for
> >> anyone w/o previous copy cached. Old copies were also extensively mirrored,
> >> so you never know which one you fetch next time...
> >
> > Heh, checksums changing after a security compromise, that's worrisome
> > :) should diff their contents to see what's going on, or whether its
> > just a gzip timestamp change or something.
> 
> exactly. Make sure the tars are sane

Well, according to BlueZ maintainer[1], he gave the correct tarballs to 
kernel.org people, but for some reason they untarred and re-packed them. 
There's only 4 bytes difference, presumably timestamp...

[1] http://thread.gmane.org/gmane.linux.bluez.kernel/20040/focus=20041

-- 
Denys


