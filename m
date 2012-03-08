Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5jSp-0005bT-1c for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 20:57:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28JmmC9029696
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 19:48:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12542-09 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 19:48:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28JmbUt029688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 19:48:40 GMT
Message-ID: <1331235953.3006.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 11:45:53 -0800
In-Reply-To: <4efd2e00d0cd6cc765da809b47d239664fc8922d.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
	<4efd2e00d0cd6cc765da809b47d239664fc8922d.1331053126.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 02/20] self-hosted: Fix multiple libx11 error
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
X-List-Received-Date: Thu, 08 Mar 2012 19:57:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-06 at 09:03 -0800, Saul Wold wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Self-hosted needs package libx11-dev, which is ambiguous as virtual/libx11 is
> provided by libx11 or libx11-trim. This patch explictly set the perferred one,
> libx11-trim-dev, to avoid this.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-core/tasks/task-self-hosted.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

This patch should be dropped, an alternative fix has been merged
(http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=157b44cf72c8660ba53b8fe1b321d2ef314c07ef)

Cheers,

Richard



