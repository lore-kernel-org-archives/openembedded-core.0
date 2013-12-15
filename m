Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D18B1611E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 23:26:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFNQbLm027971; Sun, 15 Dec 2013 23:26:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TmmRdYkaznLL; Sun, 15 Dec 2013 23:26:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFNQVE9027967
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 15 Dec 2013 23:26:33 GMT
Message-ID: <1387149986.8783.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Sun, 15 Dec 2013 23:26:26 +0000
In-Reply-To: <cover.1386920771.git.kai.kang@windriver.com>
References: <cover.1386920771.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Update for lsb and lsbtest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Dec 2013 23:26:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-12-13 at 15:54 +0800, Kai Kang wrote:
> Hi Saul,
> 
> This version of lsb patch creates necessary directory otherwise do_install fails.
> And some update for package lsbtest.
> 
> The following changes since commit ba8506ee342a1a579ceb309f3f50285eaad84f25:
> 
>   local.conf.extended: Bring into sync with OE-Core (2013-12-12 23:18:39 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib kangkai/lsb
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=kangkai%2Flsb
> 
> Kai Kang (5):
>   lsb: update directory of install_initd and remove_initd
>   LSB_Test.sh: update rpm platform file when enable multilib
>   LSB_Test.sh: check ldconfig before update cache
>   LSB_Test.sh: update locales
>   lsbtest: add ppc64 support
> 
>  meta/recipes-extended/lsb/lsb_4.1.bb          |  7 ++++---
>  meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 20 ++++++++++++++++++--
>  meta/recipes-extended/lsb/lsbtest_1.0.bb      | 12 ++++++++++++
>  3 files changed, 34 insertions(+), 5 deletions(-)

These changes continue to break the multilib builds:

http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/52

Cheers,

Richard



