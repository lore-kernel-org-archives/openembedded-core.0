Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1A68C60FC6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 10:49:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UArY6N018043; Thu, 30 May 2013 11:53:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OlgtTuNJnmUB; Thu, 30 May 2013 11:53:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UArUZe018039
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 11:53:31 +0100
Message-ID: <1369910940.14887.295.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Thu, 30 May 2013 11:49:00 +0100
In-Reply-To: <20130530123230.78dab18a@e6520eb>
References: <1369899843-3318-1-git-send-email-eric@eukrea.com>
	<CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
	<CAJTo0LYDRHqO2kveMW4ftq3g4BNjLE_sJJ6mej2cNbaC3TKh6g@mail.gmail.com>
	<20130530123230.78dab18a@e6520eb>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] hicolor-icon-theme: keep inherited dependencies
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
X-List-Received-Date: Thu, 30 May 2013 10:49:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2013-05-30 at 12:32 +0200, Eric Bénard wrote:
> Le Thu, 30 May 2013 09:32:38 +0100,
> "Burton, Ross" <ross.burton@intel.com> a écrit :
> 
> > On 30 May 2013 09:09, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > Doesn't it depend now on something which isn't allarch? IIRC gnome.bbclass
> > > brings gconf.
> > 
> > gnome.bbclass is an abomination and should be gutted.  Yes, this will
> > mean the build dependencies are massive, and I can't see why this
> > recipe needs gnome.bbclass.  Then again it doesn't need gtk-icon-cache
> > either as it doesn't actually have any icons in.  I'd be interested in
> > seeing a buildhistory-diff between the current recipe and one with
> > both inherit gnome and DEPENDS="" removed.
> > 
> when  removing gnome I get the following error at install :
> DEBUG: Executing shell function do_install
> install: cannot create regular file
> `/scratch/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/work/all-oe-li\
> nux/hicolor-icon-theme/0.12-r1/image//usr/share/icons/hicolor': No such
> file or directory

I have a suspicion we really want a gnomebase inherit in the recipe
instead of gnome and that might solve serveral issues in one.

Cheers,

Richard


