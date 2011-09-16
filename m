Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4c3g-0001mg-Jr for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:18:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GHJMER000761; Fri, 16 Sep 2011 18:19:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lWsXoftlKc0K; Fri, 16 Sep 2011 18:19:22 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GHJJHl000749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 16 Sep 2011 18:19:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Date: Fri, 16 Sep 2011 18:13:07 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316193195.20858.55.camel@ted>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: QT4 patches
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
X-List-Received-Date: Fri, 16 Sep 2011 17:18:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paul/Eric,

I was trying to figure out where we're at with the QT4 patches. With
regard to the version update, I've seen talk of the first version of the
update being broken, a second version posted and then some talk of some
fix needed on top of that which I could find a patch for.

On top of this I think there is an SDK fix needed (I've replied with a
question about that).

There is also a qt4 demo split patch that looks like its been through a
couple of iterations and also some armv6 patch with feedback that there
are futher issues so I'm not sure what the status is there.

Firstly, I love the patches, its great to see these issues getting
sorted out. I am however getting very confused between all the patches
and their versions and its taken me a while to figure out what I'm
likely being expected to merge.

Could someone therefore please put together a combined pull request for
these pieces from a git branch? I will take them into master (assuming
some details get ironed out) but I'm not sure they can make the release
branch at this point (the fun with the .bbappend files isn't helping my
confidence there).

Cheers,

Richard






