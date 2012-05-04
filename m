Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SQOHc-0006ME-Im
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 21:35:16 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3I008J2J9WVJZ1@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 14:25:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C46F32016B; Fri,
	04 May 2012 15:25:08 -0400 (EDT)
Date: Fri, 04 May 2012 15:25:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120504192508.GB15097@denix.org>
References: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
	<20120504173337.GA14692@denix.org>
	<1930BED7-1C2F-4F35-AEBA-F0C02C7F10A0@gmail.com>
	<CAMKF1srkUmGFRDGqsk2HAkoALNy3xfS_ASv-HLcFFnsCR6Hd=A@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1srkUmGFRDGqsk2HAkoALNy3xfS_ASv-HLcFFnsCR6Hd=A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-openembedded] [PATCH] networkmanager: silence systemd bbclass WARNING.
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
X-List-Received-Date: Fri, 04 May 2012 19:35:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 04, 2012 at 11:39:16AM -0700, Khem Raj wrote:
> On Fri, May 4, 2012 at 10:39 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> >
> >
> > Me neither :-) ,... but this is what the warning message, suggested be done.
> >
> > It fixed the warning for networkmanager, though.
> 
> If you have sysvinit scripts for this package then it makes sense to
> have this renamed package otherwise leave it out. I think warning is
> harmless in this case

And there's a knob for that:

+NATIVE_SYSTEMD_SUPPORT = "1"

But use it wisely! :)

-- 
Denys


