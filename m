Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2Kfk-0001fE-GU for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:57:22 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14BkYwv029490 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 11:46:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zGnLpyBRqTl4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2013 11:46:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14BkUa2029484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 11:46:33 GMT
Message-ID: <1359978075.14071.150.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 04 Feb 2013 11:41:15 +0000
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/22] Packaging performance improvements, round 2
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
X-List-Received-Date: Mon, 04 Feb 2013 11:57:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-02-03 at 23:55 +0000, Richard Purdie wrote:
> The following patch series contains various performance improvements for 
> do_package.
> 
> It also includes changes to the sanity testing to start giving warnings 
> about packaging variables used without packages being specified, eg:
> 
> RDEPENDS = "x"
> 
> instead of
> 
> RDEPENDS_${PN} = "x"
> 
> The final patch in the series stops the packaging code using the non-package
> versions in many cases. I'm not planning to merge that one right away, its just
> included for illustration and benchmarking purposes now. 
> 
> There were three cases I found using bad syntax in OE-Core and the series includes 
> patches to fix them.
> 
> There is also a useful performance improvement to sstate manipulations to use
> hardlinks instead of file copies which should be universally helpful to
> build performance of tasks.
> 
> The following changes are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core master-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core/log/?h=master-next

I found a few issues with the patches after more extensive testing and
have updated the patches in the branch. There are a few more RDEPENDS ->
RDEPENDS_${PN} fixes too.

Cheers,

Richard



