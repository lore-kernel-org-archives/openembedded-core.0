Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RjB7R-0004pi-VZ for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 15:50:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06EgkBs021784
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 14:42:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21013-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 14:42:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06Egdci021778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 14:42:40 GMT
Message-ID: <1325860960.20759.123.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 14:42:40 +0000
In-Reply-To: <4F06F8BA.8010700@mlbassoc.com>
References: <4F06F8BA.8010700@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] filesystems: fix mount order
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
X-List-Received-Date: Fri, 06 Jan 2012 14:51:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 06:35 -0700, Gary Thomas wrote:
> This changes the order that file system [types] are tried
> when using 'mount' in busybox when the file system type is
> not explictly specified.  The pervious ordering is
> incorrect in that less capable file system types are tried
> first, e.g. ext2 before ext3, which will cause an ext3 file
> system to be mounted as ext2, disabling some of the ext3
> features such as journaling.
> 
> The change also moves infrequently used file system types to
> the end as checking for them is just a waste of effort in
> most cases.  The list now also includes ext4.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>   .../recipes-core/base-files/base-files/filesystems |    9 +++++----
>   1 files changed, 5 insertions(+), 4 deletions(-)

Merged to master, thanks.

I had to add a PR bump, mention base-files in the commit summary and for
some reason the patch was corrupt and wouldn't apply either so I had to
do so manually.

Cheers,

Richard



