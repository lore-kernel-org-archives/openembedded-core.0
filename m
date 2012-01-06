Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj683-0008Nd-61 for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 10:30:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q069N3f3018575
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 09:23:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18063-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 09:22:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q069Msgv018567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 09:22:55 GMT
Message-ID: <1325841774.20759.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 09:22:54 +0000
In-Reply-To: <87b36a8c64f96232ffbcef6b6de086ad9779067a.1325817957.git.nitin.a.kamble@intel.com>
References: <cover.1325817957.git.nitin.a.kamble@intel.com>
	<87b36a8c64f96232ffbcef6b6de086ad9779067a.1325817957.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] autoconf: fix nativesdk rdepends
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
X-List-Received-Date: Fri, 06 Jan 2012 09:30:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 18:47 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Fixes this build error:
> 
> | error: Failed dependencies:
> | 	m4 is needed by autoconf-nativesdk-2.68-r4.x86_64
> | 	gnu-config is needed by autoconf-nativesdk-2.68-r4.x86_64
> NOTE: package meta-toolchain-1.0-r6: task do_populate_sdk: Failed
> ERROR: Task 8 (.../meta/recipes-core/meta/meta-toolchain.bb,
> do_populate_sdk) failed with exit code '1'
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-devtools/autoconf/autoconf.inc     |    2 ++
>  meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



