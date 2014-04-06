Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0272A60D67
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Apr 2014 15:50:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s36FoRUT017029; Sun, 6 Apr 2014 16:50:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ij44VYa9ZdQQ; Sun,  6 Apr 2014 16:50:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s36FoNw0017025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 6 Apr 2014 16:50:24 +0100
Message-ID: <1396799417.24597.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 06 Apr 2014 16:50:17 +0100
In-Reply-To: <CANyK_8d+pAHXhtdPUYVaZNJe+eOnyATd9cCWXHxgG3mVxrbeeA@mail.gmail.com>
References: <1396313895-21200-1-git-send-email-denis@denix.org>
	<CANyK_8cu-czs-qmB1PJHosLt-TYnmu=u8F9J9ip1MmVZuE7zVA@mail.gmail.com>
	<CANyK_8f0=bEjKFZGMW7cTEL-_BiXPo9a93zrvz_gwYkH4Nn5vg@mail.gmail.com>
	<20140403162312.GB3370@denix.org> <20140403223234.GH2132@jama>
	<CANyK_8d+pAHXhtdPUYVaZNJe+eOnyATd9cCWXHxgG3mVxrbeeA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] opkg-utils: Update to latest git master
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
X-List-Received-Date: Sun, 06 Apr 2014 15:50:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-04-06 at 16:42 +0100, Paul Barker wrote:
> On 3 April 2014 23:32, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > I haven't read whole discussion, but the idea of adding just one needed
> > patch from the repo into oe-core metadata seems reasonable to me (unless
> > someone wants to create dora branch in opkg-utils repo and cherry-pick
> > just that one required commit there + update SRC_URI + SRCREV
> > accordingly).
> 
> I'd rather not keep a 'dora' branch in opkg-utils as I'd like it to
> align with opkg and be independent of which build system is being
> used. I think putting the patch into the dora branch of oe-core is the
> best way forward as the change in question is tiny.

In this specific case I'd tend to agree FWIW...

Cheers,

Richard


