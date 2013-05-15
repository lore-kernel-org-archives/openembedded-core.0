Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ucfp6-00025D-8Z for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:49:12 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4FHXsK7013379; Wed, 15 May 2013 18:33:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1qUKS_O4L4UT; Wed, 15 May 2013 18:33:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4FHXlg0013368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 15 May 2013 18:33:50 +0100
Message-ID: <1368639038.18324.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Wed, 15 May 2013 20:30:38 +0300
In-Reply-To: <5193B925.6010607@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com> <5543572.N8ppyBn6lW@helios>
	<5193B925.6010607@r-finger.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 15 May 2013 17:49:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'd ask that we give trying to make this work from OE-Core a fair try. 

If in say 3 months from now OE-Core is causing clutter users pain we can
look again at the problem. Equally, if nobody has sent me any clutter
patches in the next three months, I wouldn't consider than a fair try.

I'm happy enough to see the clutter recipes architecture changed to
better support their users. If that means adding some of the machine
specific tweaks to the core as examples I'm also ok with that rather
than forcing those into BSP layers. I'm not saying we'll take every
machine entry into the core but enough to show its usages would be
acceptable in my view.

I do agree with the view that we have enough mailing lists and so on and
adding more is not appropriate where this is at right now.

Cheers,

Richard



