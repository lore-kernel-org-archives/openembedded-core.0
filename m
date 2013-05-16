Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UcrHI-0007PK-K9 for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 08:03:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4G5lapf031475; Thu, 16 May 2013 06:47:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mPd_4m-XBENc; Thu, 16 May 2013 06:47:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4G5lUdJ031469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 16 May 2013 06:47:33 +0100
Message-ID: <1368683059.18324.131.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto <yocto@yoctoproject.org>, =?ISO-8859-1?Q?Bj=F6rn?= Stenberg
	<bjst@enea.com>
Date: Thu, 16 May 2013 08:44:19 +0300
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Gnome tests, taking inspiration from us!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 06:04:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've just found out that there is currently a proposal in the Gnome
project to change the way they write and run tests. I know Colin posted
it a few weeks ago but somehow I missed the mail and I suspect others
did too:

https://live.gnome.org/GnomeGoals/InstalledTests

When you read through this, you will see echos of what we're trying to
do with ptest and its not a coincidence! Certainly, interfacing tests
like the above with ptest should be straight forward.

I know the people involved in this would love feedback. There is some
resistance in the Gnome community to a change like this but it would
obviously be very in keeping with our goals and the higher level goal of
making it easier for people to run these tests and getting wider spread
and more diverse usage of them.

I was thinking about the design overnight and I like it, I'm not sure I
have any suggestions for improving it right now, I certainly support it.

Other links:

Glib discussion: https://bugzilla.gnome.org/show_bug.cgi?id=699079
Status Update: https://mail.gnome.org/archives/desktop-devel-list/2013-May/msg00014.html

Cheers,

Richard






