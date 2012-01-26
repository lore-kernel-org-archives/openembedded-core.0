Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1RqWKS-0004KF-Uo
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 21:53:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKk9Vb028247
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:46:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27844-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:46:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKjxEC028241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:46:00 GMT
Message-ID: <1327610761.19643.401.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 20:46:01 +0000
In-Reply-To: <1327526328-26365-1-git-send-email-ferlandm@sonatest.com>
References: <1327526328-26365-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] pm-utils: Add grep to RDEPENDS to avoid command failures.
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
X-List-Received-Date: Thu, 26 Jan 2012 20:53:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-25 at 16:18 -0500, Marc Ferland wrote:
> Second version of the patch that adds grep to RDEPENDS.
> 
> Fixes [YOCTO #1887]
> 
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
> ---
>  meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



