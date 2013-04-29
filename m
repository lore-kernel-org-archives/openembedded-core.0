Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UWplD-0007sr-Kz for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 17:13:13 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TEtm6M003950; Mon, 29 Apr 2013 15:56:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0yerHJ5DGy_W; Mon, 29 Apr 2013 15:56:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TEuUEw004010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 29 Apr 2013 15:56:31 +0100
Message-ID: <1367247290.5379.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 29 Apr 2013 15:54:50 +0100
In-Reply-To: <2359996.YCG7Bud1Ca@helios>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
	<6907890.oTRpLvAECS@helios> <1367053734.29677.91.camel@ted>
	<2359996.YCG7Bud1Ca@helios>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Mon, 29 Apr 2013 15:13:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-29 at 15:45 +0100, Paul Eggleton wrote:
> So upon further reflection, I'm guessing my objections were only really about 
> changing the status quo, as well as a lot of my own testing involving re-
> running the image creation step without really changing anything other than 
> the code that contributes to do_rootfs; it could be argued that my use case 
> would be equally served by me setting nostamp locally or using -f, and 
> everyone else having the benefit of not rebuilding the image when not needed.

Remember as well that if you change the rootfs code, that will change
the rootfs stamp and the image will get regenerated. So it should even
work for your use case, if it doesn't, we have bigger dependencies
issues which we should fix which would be the real problems.

> Given that this is a departure from previously established behaviour, I do 
> think we need to give a more of an explanation in the commit message than the 
> proposed patch however; something that summarises Richard's explanation above 
> would be informative.

Agreed, Phil's commit message missed out a few important points.

Cheers,

Richard



