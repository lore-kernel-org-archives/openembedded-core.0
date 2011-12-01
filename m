Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW6Ep-00066E-8v for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:59:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1Cr2bZ015316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:53:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14989-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 12:52:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1CquVm015310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:52:57 GMT
Message-ID: <1322743985.17484.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 12:53:05 +0000
In-Reply-To: <1322708827-27449-1-git-send-email-raj.khem@gmail.com>
References: <1322708827-27449-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] classes, conf: Exclude native and nativesdk recipes from libc specific override
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
X-List-Received-Date: Thu, 01 Dec 2011 12:59:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 19:07 -0800, Khem Raj wrote:
> Based on suggestions from RP
> 
> libc-uclibc and libc-glibc overrides are for denoting
> system C library in use on the target and not for the
> host therefore we make sure that the override only takes
> effect for target recipes only.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/native.bbclass                |    3 +++
>  meta/classes/nativesdk.bbclass             |    3 +++
>  meta/conf/distro/include/tclibc-eglibc.inc |    3 ++-
>  meta/conf/distro/include/tclibc-uclibc.inc |    3 ++-
>  4 files changed, 10 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



