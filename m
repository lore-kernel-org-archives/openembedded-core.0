Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8531A6057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 21:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FLoqlW009208; Thu, 15 Sep 2016 22:50:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tb4cFmWEP9Fy; Thu, 15 Sep 2016 22:50:52 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FLokIQ009205
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 15 Sep 2016 22:50:47 +0100
Message-ID: <1473976246.7207.150.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>, "Burton, Ross" <ross.burton@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 15 Sep 2016 22:50:46 +0100
In-Reply-To: <a95b826d-cdcd-cf1d-bb38-6bf47122a528@mlbassoc.com>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<CAJTo0LbuVqOsjMUix-ntx67a6PVEcLFeYrAN8XnCh7eJzBQgdw@mail.gmail.com>
	<2762804.COdzxK9n1p@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LaeKEUKKheg2Grgc5SKoANQbRKT8TX-F2e7aL6ozdd+Eg@mail.gmail.com>
	<a95b826d-cdcd-cf1d-bb38-6bf47122a528@mlbassoc.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Crazy display
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
X-List-Received-Date: Thu, 15 Sep 2016 21:52:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-09-15 at 22:26 +0200, Gary Thomas wrote:
> On 2016-09-15 22:12, Burton, Ross wrote:
> > 
> > 
> > On 15 September 2016 at 21:03, Paul Eggleton <paul.eggleton@linux.i
> > ntel.com <mailto:paul.eggleton@linux.intel.com>> wrote:
> > 
> >     Are you guys perhaps using the same terminal application? Using
> > screen / tmux
> >     / anything similar? (I'm using screen here and haven't
> > experienced problems
> >     though.)
> > 
> > 
> > I'm using iTerm2 on a Mac to run normal SSH to my Linux box. No
> > screen/tmux/etc.
> Pretty much the same for me - just SSH in an xterm window.

I've also seen it on a standard linux ssh session to a remote machine,
no screen, no tmux, just ssh from a gnome-terminal window to a remote.
I've not spotted what the pattern is, other than it seems to be
something about the console write timing being off and started around
the time of the progress changes.

Cheers,

Richard



