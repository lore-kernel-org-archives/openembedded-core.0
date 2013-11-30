Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 98A3D6C6EB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2013 09:48:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAU9m0MI000584; Sat, 30 Nov 2013 09:48:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LMxJckp91ebG; Sat, 30 Nov 2013 09:48:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAU9lutM000577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 30 Nov 2013 09:47:58 GMT
Message-ID: <1385804873.11222.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong.Lu@windriver.com
Date: Sat, 30 Nov 2013 09:47:53 +0000
In-Reply-To: <1385725039-5387-1-git-send-email-Chong.Lu@windriver.com>
References: <1385725039-5387-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: fixed ptest cases failed
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
X-List-Received-Date: Sat, 30 Nov 2013 09:48:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-29 at 19:37 +0800, Chong.Lu@windriver.com wrote:
> From: Chong Lu <Chong.Lu@windriver.com>
> 
> Some ptest cases failed, because perl ptest depends on source code.
> In order to make test cases to pass, we copy source code to target
> to resolve dependence issue.
> perl-dev provides some files for test cases, so we make perl ptest
> relies on it.
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl-5.14.3/config.sh |    4 +--
>  meta/recipes-devtools/perl/perl-ptest.inc        |   37 ++++------------------
>  2 files changed, 8 insertions(+), 33 deletions(-)

We tried this on the autobuilder and lots of builds failed, for example:

http://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/24/steps/Building%20Images/logs/stdio

Cheers,

Richard


