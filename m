Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsBRO-0006vK-SN for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:04:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BnL9P004170;
	Mon, 7 Jan 2013 11:49:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04100-01; Mon,  7 Jan 2013 11:49:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BnBv4004164
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 11:49:12 GMT
Message-ID: <1357559353.25855.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 07 Jan 2013 11:49:13 +0000
In-Reply-To: <1357547255-2245-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1357547255-2245-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake: add AArch64 support
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
X-List-Received-Date: Mon, 07 Jan 2013 12:04:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 09:27 +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/recipes-devtools/cmake/cmake.inc              |  7 ++--
>  .../cmake/cmake/aarch64-cmake.patch                | 35 ++++++++++++++++++++
>  .../cmake/cmake/aarch64-kwsys.patch                | 38 ++++++++++++++++++++++
>  3 files changed, 78 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
>  create mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch

Assuming these are backports (they look like they are) can you add
"Upstream-Status: Backport" to the patch headers please?

This means we can automatically tell they are backports for patch status
tracking purposes and means when someone comes to upgrade the software,
its easy to know to drop them, both for the person doing the upgrade and
the person reviewing the upgrade.

Cheers,

Richard





