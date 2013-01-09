Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TswD8-0001fb-Hr for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 15:00:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09DjVZZ001377;
	Wed, 9 Jan 2013 13:45:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23373-06; Wed,  9 Jan 2013 13:45:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09DjQpD001370
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 9 Jan 2013 13:45:27 GMT
Message-ID: <1357739128.13022.81.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Wed, 09 Jan 2013 13:45:28 +0000
In-Reply-To: <441976458177570ed317fb6a8687c8eab8667cf8.1357721541.git.constantinx.musca@intel.com>
References: <cover.1357721541.git.constantinx.musca@intel.com>
	<441976458177570ed317fb6a8687c8eab8667cf8.1357721541.git.constantinx.musca@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] gcc: remove the 64bithack patch
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
X-List-Received-Date: Wed, 09 Jan 2013 14:00:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-09 at 11:00 +0200, Constantin Musca wrote:
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc             |  1 -
>  meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch | 63 -----------------------
>  2 files changed, 64 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch

Does removing this break multilib builds? For example, with different
libdir layouts? 

Note that gcc has a shared source tree so patches cannot by applied in
say the cross case when we need this yet not in the target case when we
probably don't want it. We need to make a patch which works in all
cases.


Cheers,

Richard




