Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKBlc-0000Me-QG for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 19:05:10 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PHvspF028037; Mon, 25 Mar 2013 17:57:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q+GStlqu89XX; Mon, 25 Mar 2013 17:57:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PHvieV028028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 17:57:47 GMT
Message-ID: <1364233672.3097.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 25 Mar 2013 17:47:52 +0000
In-Reply-To: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2 RFC] workaround for debugedit segv
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
X-List-Received-Date: Mon, 25 Mar 2013 18:05:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 12:19 -0500, Mark Hatle wrote:
> [ YOCTO #4089 ]
> 
> This is an attempt at a workaround for the debugedit segv.
> 
> The problem is that during the creation of the build-id hash, the
> system iterates over the various ELF sections passing a point to the
> loaded data and size of each section to a hash function.
> 
> When it gets to the hash for the .plt and .bss section, the size is
> non-zero, while the data is point to 0.  This immediately causes a
> segfault on access of data at address 0.
> 
> See the bug and patch comments for more diagnostic information.

I really want to figure out how widespread issues are so I merged the
workaround and my version of the error handling patch so we start seeing
where the remaining problems are (if any).

I'm hoping to test this out on the autobuilder, see how we stand.

If further improvements are found to the workaround we can merge those
on top of the existing tree.

Cheers,

Richard





