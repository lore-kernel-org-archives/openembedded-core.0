Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3406FFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 18:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96IvxsA020587; Thu, 6 Oct 2016 19:58:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aGi8C2I6bHwD; Thu,  6 Oct 2016 19:58:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96Iwbho020621
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 6 Oct 2016 19:58:38 +0100
Message-ID: <1475780317.30475.575.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 06 Oct 2016 19:58:37 +0100
In-Reply-To: <20DFBC70-C0AA-4422-8E40-CAA4AB2E3AA0@gmail.com>
References: <20161006085422.GA2921@jama>
	<1475746035.30475.515.camel@linuxfoundation.org>
	<20DFBC70-C0AA-4422-8E40-CAA4AB2E3AA0@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: linux-yocto and linux-libc-headers are again going backwards
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
X-List-Received-Date: Thu, 06 Oct 2016 18:58:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 10:07 -0700, Khem Raj wrote:
> > 
> > On Oct 6, 2016, at 2:27 AM, Richard Purdie <richard.purdie@linuxfou
> > ndation.org> wrote:
> > 
> > On Thu, 2016-10-06 at 10:54 +0200, Martin Jansa wrote:
> > > 
> > > Either use 4.7.99+4.8-rc4 like most other recipes do or at least
> > > "4.8~rc4"
> > > which might sort lower than "4.8" (but needs to be verified for
> > > all
> > > packaging backends first).
> > > 
> > > Ignoring all this completely results with what we can see in oe-
> > > core
> > > now:
> > > 
> > > ERROR: linux-libc-headers-4.8-r0 do_packagedata: QA Issue:
> > > Package
> > > version for package linux-libc-headers-dbg went backwards which
> > > would
> > > break package feeds from (0:4.8-rc4-r0.0 to 0:4.8-r0.0)
> > > [version-going-backwards]
> > Sorry, we did screw up there :(. Lots of moving pieces and its hard
> > to
> > catch/remember everything.
> > 
> > I wish we knew for certain whether ~ works properly everywhere. A
> > good
> > case for some unittests I guess…
> I always wished there was a magic wand ( a sanity test) sort of which
> was able to catch the package feed upgradability

There is buildhistory but sadly it catches it too late (after 4.8-rcX
merges and is changed to 4.8, not when 4.7 -> 4.8-rcX).

Cheers,

Richard



