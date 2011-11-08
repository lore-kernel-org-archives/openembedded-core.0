Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNmmK-0006d0-BD for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:35:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8EThDq000521
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:29:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32646-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 14:29:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8ETYDx000515
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:29:35 GMT
Message-ID: <1320762575.10843.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 14:29:35 +0000
In-Reply-To: <8d5fb3fc99567457b497c859f333fe68b49806cb.1320732950.git.dongxiao.xu@intel.com>
References: <cover.1320732950.git.dongxiao.xu@intel.com>
	<8d5fb3fc99567457b497c859f333fe68b49806cb.1320732950.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] multilib: Drop MULTILIB_IMAGE_INSTALL
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
X-List-Received-Date: Tue, 08 Nov 2011 14:35:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 14:19 +0800, Dongxiao Xu wrote:
> There should just be a single IMAGE_INSTALL variable. If the package
> backends need this split into different multilib components they should
> be responsible for doing this, not the user.
> 
> This commit removes the MULTILIB_IMAGE_INSTALL variable.
> 
> [YOCTO #1564]
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/classes/image.bbclass       |    4 +---
>  meta/classes/multilib.bbclass    |    5 ++---
>  meta/classes/package_ipk.bbclass |   31 ++++++++++++++++++++++++++++---
>  meta/classes/package_rpm.bbclass |   37 +++++++++----------------------------
>  meta/classes/rootfs_ipk.bbclass  |    3 +--
>  meta/classes/rootfs_rpm.bbclass  |    3 +--
>  6 files changed, 42 insertions(+), 41 deletions(-)

I'll take this as its a definite improvement over the current situation.
I did however wonder what happens if we try something tri-arch e.g.
i586, x86_64 and x32?

I get the feeling both package backends could really use some cleanup
now we have the basics working and better abstraction of the code so we
can loop over something like tri-arch (or more) easily...

Cheers,

Richard



