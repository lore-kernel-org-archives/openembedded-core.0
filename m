Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF8670030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 16:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7AGkosE016106; Wed, 10 Aug 2016 17:46:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ExL-Hsg_sDPn; Wed, 10 Aug 2016 17:46:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7AGkkhJ016103
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 10 Aug 2016 17:46:48 +0100
Message-ID: <1470847606.20391.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Aug 2016 17:46:46 +0100
In-Reply-To: <CAMKF1soe+Z1PqbuzB-7FW=r5pWpzs08-8N10W5=xnpC+z1npHg@mail.gmail.com>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<57A9C7AD.9090901@topic.nl>
	<BA7DFF44-541C-4FEE-B5B2-586FD82ABC60@gmail.com>
	<1470819593.8166.68.camel@linuxfoundation.org>
	<CAMKF1soe+Z1PqbuzB-7FW=r5pWpzs08-8N10W5=xnpC+z1npHg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Wed, 10 Aug 2016 16:46:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-08-10 at 09:07 -0700, Khem Raj wrote:
> On Aug 10, 2016 1:59 AM, "Richard Purdie" <
> richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2016-08-09 at 12:27 -0700, Khem Raj wrote:
> > > > On Aug 9, 2016, at 5:08 AM, Mike Looijmans <
> mike.looijmans@topic.nl
> > > > > wrote:
> > > >
> > > > I've been adding "lzop-native" to a lot of kernel recipes
> because
> > > > you also need it when generating an LZO compressed kernel (I
> like
> > > > my boot time to be under 1 second).
> > > >
> > > > It's a small dependency which is hard to automatically figure
> out,
> > > > since there are a number of ways to trigger it (we just found
> two).
> > > > I would welcome this patch very much, and I don't think many
> will
> > > > suffer…
> > >
> > > From linux.inc days there is a python snippet which can do this
> > > conditionally e.g. see
> > >
> > > 
> https://github.com/kraj/meta-raspberrypi/blob/master/recipes-kernel/l
> > > inux/linux-rpi.inc#L121
> >
> > Which is fine if you have a prebuild defconfig file however in many
> > cases we don't have that :(
> >
> Thats right perhaps dependency could be conputed after configure task
> and added to say compile task

Bitbake computes the dependency trees in advance, not on the fly so its
sadly not possible to change the dependency graph during a running
build. I'm sure you could design such a system but its not what we have
today, nor does it likely warrant the extra complexity it could
involve.

Cheers,

Richard

