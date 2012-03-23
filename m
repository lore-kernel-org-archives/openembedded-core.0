Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB5C9-0004OT-K4 for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 15:10:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NE1PhY027869
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 14:01:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26743-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 14:01:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NE1HB8027863
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 14:01:19 GMT
Message-ID: <1332511281.9740.417.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 14:01:21 +0000
In-Reply-To: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
References: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gdb-cross-canadian: Fix linking issues when python support is enabled
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
X-List-Received-Date: Fri, 23 Mar 2012 14:10:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 05:50 -0700, Khem Raj wrote:
> gdb-cross-canadian was linking with static version of libpython
> and looking for build host python when run. This could be mismatch
> between python-nativesdk and build host provided python. So we
> make it consistent to always use python-nativesdk
> 
> Instead of adding bunch of -L we add -rpath and -rpath-link
> so that gdb finds all needed libraries in SDK and does not
> reach out into host
> 
> This should fix yocto PR# 2077 as well.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    7 ++++---
>  .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)

Merged to master, thanks!

Richard



