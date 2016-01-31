Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC8B7770C9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0VLpmTA032489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 31 Jan 2016 13:51:48 -0800
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jan 2016 13:51:47 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 4503C2800B4; Sun,
	31 Jan 2016 16:51:47 -0500 (EST)
Date: Sun, 31 Jan 2016 16:51:47 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20160131215146.GB8889@windriver.com>
References: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
	<1454273105.7421.24.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1454273105.7421.24.camel@pbcl.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Sun, 31 Jan 2016 21:51:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [OE-core] [PATCH] xterm: revert FILES_PN change from recent package uprev] On 31/01/2016 (Sun 20:45) Phil Blundell wrote:

> On Sun, 2016-01-31 at 14:56 -0500, Paul Gortmaker wrote:
> > diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> > index f67d890abcae..10b75fca32db 100644
> > --- a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> > +++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> > @@ -27,4 +27,4 @@ do_configure() {
> 
> This file doesn't exist in oe-core.  I think you must have sent this
> patch (and the inetutils one, to which the same applies) to the wrong
> mailing list.

Of course you are right.  In my defense, in poky, the full path is
meta-openembedded/meta-oe/<....> and with two references in the path to
OE, I think I can't be the only one consistently getting confused like
this.

Both the Yocto mailing list summary:

https://www.yoctoproject.org/tools-resources/community/mailing-lists

and the OE list summary:

http://lists.openembedded.org/mailman/listinfo

are lacking path info that would help me out to get the right list.

If i go into poky/meta-openembedded, and crack open .git/config I'll see
the source git://git.openembedded.org/meta-openembedded listed.  So I
think at least at that point, I need to look at OE lists and not yocto
lists.  But looking the 2nd link above I'm still none the wiser where in
OE the xterm patch needs to be sent to, and OE-core looks right until I
clone core and find the file simply isn't there.

What is the mailing list decoder secret that I'm missing here?  If I'm
looking at the web pages and even the .git/config and I still get it
wrong, then I think I must be missing something obvious.

My best guess at the moment is oe-devel, but that is only because I
cheated and looked at the archive and found meta-networking patches
sent there.

Is there a 1:1 mapping between mailing lists <---> git://<server>/<path>
out there, since I think that would help.  And/or maybe a get_maintainer
script like the kernel has.

Thanks,
Paul.

