Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0yGx-0005YS-DO for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 17:45:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGb8Xq008797
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:37:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08112-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:37:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGb0HX008790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:37:01 GMT
Message-ID: <1330101421.5477.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 16:37:01 +0000
In-Reply-To: <f7ac4b5a19670d88441b120cdbab19101d6a3a65.1330025054.git.paul.eggleton@linux.intel.com>
References: <cover.1330025054.git.paul.eggleton@linux.intel.com>
	<f7ac4b5a19670d88441b120cdbab19101d6a3a65.1330025054.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] conf/bitbake.conf: add DISTRO_FEATURES_BACKFILL
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
X-List-Received-Date: Fri, 24 Feb 2012 16:45:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 19:26 +0000, Paul Eggleton wrote:
> When introducing new items to DISTRO_FEATURES that control functionality
> that is already enabled, in order to leave existing distro configuration
> unchanged we need a way to "backfill" these new feature items onto the
> existing DISTRO_FEATURES value.
> 
> This introduces a DISTRO_FEATURES_BACKFILL variable whose items will be
> added to the end of DISTRO_FEATURES, unless they also appear in
> DISTRO_FEATURES_BACKFILL_CONSIDERED which distros can use in their
> configuration to prevent specific items from being added.
> 
> Fixes [YOCTO #1946].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/conf/bitbake.conf |    3 +++
>  meta/lib/oe/utils.py   |   20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



