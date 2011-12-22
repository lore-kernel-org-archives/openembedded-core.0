Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rdicv-0003tE-KZ for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 14:24:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMDGxTT023711
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 13:16:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23492-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 13:16:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMDGqAR023705
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 13:16:53 GMT
Message-ID: <1324559814.24604.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 13:16:54 +0000
In-Reply-To: <cover.1324534102.git.lei.mei@intel.com>
References: <cover.1324534102.git.lei.mei@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2]curl:upgrade from 7.22.0 to 7.23.1 and fix some typo issues.
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
X-List-Received-Date: Thu, 22 Dec 2011 13:24:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-22 at 14:17 +0800, Mei Lei wrote:
> Hi all,
> 	Upgrade curl from 7.22.0 to 7.23.1.
> 	Some typo issues exist in distro_tracking_fields.inc reported by pkg-report system, so fix them in this patch.
> 
> Thanks,
> Lei
> 
> The following changes since commit db446421933d640528328e46a29f828a36d6649b:
>   Richard Purdie (1):
>         multilib.conf: Enable shadow-sysroot and libffi
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib lmei3/upgrade-12222
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-12222
> 
> Mei Lei (2):
>   curl: Upgrade from 7.22.0 to 7.23.1
>   distro_tracking_fields: Update curl info and fix other recipes' typo
>     issues

Merged to master, thanks.

Richard



