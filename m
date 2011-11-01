Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLFni-0000Ns-B3 for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 15:58:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1EqmgL030977
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 14:52:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30849-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 14:52:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1EqcVt030971
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 14:52:39 GMT
Message-ID: <1320159158.15387.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 14:52:38 +0000
In-Reply-To: <2908890.eKOgJmF2nS@helios>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
	<2908890.eKOgJmF2nS@helios>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Misc metadata fixes
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
X-List-Received-Date: Tue, 01 Nov 2011 14:58:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-01 at 11:53 +0000, Paul Eggleton wrote:
> On Sunday 23 October 2011 16:07:14 Paul Eggleton wrote:
> > The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:
> > 
> >   distro-tracking-fields: update fields for tzdata and gst-plugins-good
> > (2011-10-20 13:07:16 +0100)
> > 
> > are available in the git repository at:
> >   git://git.openembedded.org/openembedded-core-contrib paule/fixes7
> >  
> > http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> > e/fixes7
> > 
> > Paul Eggleton (3):
> >   dbus: remove unused initscript
> >   util-linux: split out mkfs into its own package
> >   e2fsprogs: move mke2fs.conf to e2fsprogs-mke2fs package
> > 
> >  meta/recipes-core/dbus/dbus.inc                    |    3 +++
> >  meta/recipes-core/dbus/dbus_1.4.12.bb              |    3 +++
> >  meta/recipes-core/util-linux/util-linux.inc        |    6 ++++--
> >  meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
> >  .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 ++--
> >  5 files changed, 13 insertions(+), 5 deletions(-)
> 
> Ping...?

These got merged to master last night, updates on the list haven't quite
caught up yet :)

Cheers,

Richard




