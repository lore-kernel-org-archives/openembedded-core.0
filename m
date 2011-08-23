Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QvshB-0000A8-8Q
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 17:15:17 +0200
Received: by wyf19 with SMTP id 19so172297wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 08:10:32 -0700 (PDT)
Received: by 10.216.59.130 with SMTP id s2mr815888wec.26.1314112231873;
	Tue, 23 Aug 2011 08:10:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p49sm43127weq.31.2011.08.23.08.10.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Aug 2011 08:10:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201108231353.13437.paul.eggleton@linux.intel.com>
Date: Tue, 23 Aug 2011 17:10:28 +0200
Message-Id: <6BCD0FB4-907F-4055-A405-F236F6D3D4AA@dominion.thruhere.net>
References: <cover.1314096402.git.xiaofeng.yan@windriver.com>
	<201108231318.10118.paul.eggleton@linux.intel.com>
	<63FF64B9-6C5E-4C87-9DFD-7AD9A88A5DD1@dominion.thruhere.net>
	<201108231353.13437.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Tue, 23 Aug 2011 15:15:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 aug. 2011, om 14:53 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 23 August 2011 13:27:11 you wrote:
>> I would lean toward a seperate meta-qt layer, not sure if it should =
be
>> hosted in the oe-core git repo, meta-oe or a completely seperate git =
repo.
>=20
> Possibly we should have meta-qt for Qt applications and additional =
libraries=20
> such as Qwt (and I'm all for moving our current Qt apps there, they =
don't=20
> really belong in OE-core IMHO). If you're suggesting moving out Qt =
itself=20
> though, I think Qt belongs in OE-core, certainly as much as GTK+ does.

I still say that gtk+ should be in it's own layer as well :) I hope to =
have some time in september to come up with a proposal to rearrange =
oe-core and meta-oe in a more logical set of layers.=


