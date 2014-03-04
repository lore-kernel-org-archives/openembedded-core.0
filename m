Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F34A6EFCB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 08:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 06639180DE;
	Tue,  4 Mar 2014 09:37:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id VuFGdlFKu9X1; Tue,  4 Mar 2014 09:37:21 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 65F7B180DC;
	Tue,  4 Mar 2014 09:37:21 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 4FA44B30;
	Tue,  4 Mar 2014 09:37:21 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 448129FC;
	Tue,  4 Mar 2014 09:37:21 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 423893E048;
	Tue,  4 Mar 2014 09:37:21 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Tue, 4 Mar 2014 09:37:21 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 0E2059C29D; 
	Tue,  4 Mar 2014 09:37:21 +0100 (CET)
Date: Tue, 4 Mar 2014 09:37:21 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140304083720.GA30745@axis.com>
References: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
	<CAMKF1sq5C01yFquzWjAUaHDgr30ZFXj-dnujS0XWBWrWHC5YXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq5C01yFquzWjAUaHDgr30ZFXj-dnujS0XWBWrWHC5YXA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Tue, 04 Mar 2014 08:37:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14-03-03 19:17 +0100, Khem Raj wrote:
> On Mon, Mar 3, 2014 at 6:37 AM, Olof Johansson <olof.johansson@axis.com> wrote:
> > With this change, you can use shell like globbing expressions (as
> > supported by Python's fnmatch) for entries in SANITY_TESTED_DISTROS.
> > This makes it possible to say that, e.g. "all Debian 7 Wheezy releases
> > are supported" with the entry "Debian-7.*".
> 
> I dont think its a good thing. We should be strict about it as we are.
> otherwise it can end up
> with bigger problems to save few  typing words

I don't really think we are strict about it today. Currently,
Ubuntu LTS (12.04) does not include point release number in its
lsb release name. Debian does (and I noticed a similar bump patch
was sent for CentOS recently). I suspect that in many cases, a
new Ubuntu point release contains about the same changes that the
Debian point release does.

The issue is that new point releases, at least in the case of
Debian, happens about every two months. These bumps are
integrated to master, backported to older branches, but it still
won't reach people working off releases immediately.

Even if Poky chooses not to adopt this, it would still be a nice
thing to have support for doing this internally for our
layer/distro.

-- 
olofjn

