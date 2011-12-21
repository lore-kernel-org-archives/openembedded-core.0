Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdQCA-00009h-Ly for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 18:43:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHa8sR012107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:36:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11633-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:36:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHa0tC012101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:36:01 GMT
Message-ID: <1324488963.19860.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 17:36:03 +0000
In-Reply-To: <cover.1324485726.git.jiajun.xu@intel.com>
References: <cover.1324485726.git.jiajun.xu@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] ltp: Add recipe from OE
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
X-List-Received-Date: Wed, 21 Dec 2011 17:43:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-22 at 00:45 +0800, Jiajun Xu wrote:
> The pull request is to address [YOCTO #1568] - "Add recipe for ltp/posix tests and automate test".
> ltp is ported from OE and updated to latest version(20110915). Testcases are installed to 
> ${D}/opt/ltp and POISX test suite is also copied into ${D}/opt/ltp/testcases folder. We 
> include ltp to testapps list by default.
> 
> Note that some cases are removed from ltp since they depend on expect. Currently there is 
> no expect recipe in OE and we will add it for enhancement next.
> 
> The following changes since commit ae4118a1f78f113c3d687c3aa6a86007cf977cae:
> 
>   libsdl 1.2.14: fix packaging (2011-12-19 12:17:36 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib
> 
> Jiajun Xu (3):
>   ltp: Add recipe from OE
>   distro_tracking_fields: add information for ltp
>   task-core-tools: add ltp to testapps list

Merged to master, thanks.

Richard



