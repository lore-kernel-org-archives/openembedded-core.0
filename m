Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AE5276B87C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 12:04:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1DC4XoT027308; Thu, 13 Feb 2014 12:04:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nc1RKhn8FU0u; Thu, 13 Feb 2014 12:04:33 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1DC4UXP027290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 13 Feb 2014 12:04:32 GMT
Message-ID: <1392293065.14081.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Thu, 13 Feb 2014 12:04:25 +0000
In-Reply-To: <1392263338-9144-1-git-send-email-rongqing.li@windriver.com>
References: <1392263338-9144-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Thu, 13 Feb 2014 12:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-02-13 at 11:48 +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> Read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion, to avoid
> to use the hardcode kernel version.
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta/recipes-support/nss/nss.inc |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I've just realised this makes nss machine specific. We do not want to do
that.

Cheers,

Richard


