Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5juM-00075Z-7D for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 21:25:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KHGeD030489
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 20:17:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29888-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 20:17:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KH4pc030421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 20:17:08 GMT
Message-ID: <1331237822.3006.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 12:17:02 -0800
In-Reply-To: <985672cba7c76c5357200575e206024a940430f3.1331105701.git.lianhao.lu@intel.com>
References: <cover.1331105701.git.lianhao.lu@intel.com>
	<985672cba7c76c5357200575e206024a940430f3.1331105701.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] prservice: Added sanity check for prservice connection.
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
X-List-Received-Date: Thu, 08 Mar 2012 20:25:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-07 at 15:36 +0800, Lianhao Lu wrote:
> Fixed bug [YOCTO #2052]. Added sanity check for variables of PRSERV_HOST
> and PRSERV_PORT, also for the connection availabity of prservice.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/prexport.bbclass |    4 +++-
>  meta/classes/primport.bbclass |    3 +++
>  meta/lib/oe/prservice.py      |   18 +++++++++++++++++-
>  3 files changed, 23 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



