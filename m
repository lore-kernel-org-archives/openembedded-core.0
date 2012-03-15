Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S86Di-0005zR-8S for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 09:39:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2F8Ur0V018384
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 08:30:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18276-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 08:30:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2F8Uh4u018376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 08:30:44 GMT
Message-ID: <1331800242.18586.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 08:30:42 +0000
In-Reply-To: <9152da8c4a5a72705532722a11a3bfdaa0fe4787.1331776832.git.nitin.a.kamble@intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<9152da8c4a5a72705532722a11a3bfdaa0fe4787.1331776832.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 7/8] gcc: remove the 64bithack patch
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
X-List-Received-Date: Thu, 15 Mar 2012 08:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 19:02 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> and bump PR
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.6.inc             |    1 -
>  meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   68 ---------------------
>  2 files changed, 0 insertions(+), 69 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch


As far as I can tell whilst this will make multilib work on the target
device, since you've removed this patch, the actual -cross toolchains
used for multilib builds will be broken since they may or may not look
in the correct libdir?

Cheers,

Richard





