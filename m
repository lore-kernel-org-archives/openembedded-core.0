Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiP5Z-0002cN-76 for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 12:33:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BPcB4017899;
	Wed, 4 Jan 2012 11:25:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16060-10; Wed,  4 Jan 2012 11:25:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BPUX9017893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 11:25:31 GMT
Message-ID: <1325676330.3555.128.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 11:25:30 +0000
In-Reply-To: <338da10abcd744ab75dfb184f8f81370727e5653.1325669461.git.dexuan.cui@intel.com>
References: <cover.1325669461.git.dexuan.cui@intel.com>
	<338da10abcd744ab75dfb184f8f81370727e5653.1325669461.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] mc: fix configure with automake 1.11.2
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
X-List-Received-Date: Wed, 04 Jan 2012 11:33:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 17:33 +0800, Dexuan Cui wrote:
> As Nitin said, "automake version 1.11.2 has made use of dir variables
> more strict, the pkglibexec var can not have SCRIPTS suffix. Using pkgdata
> instead."
> 
> Fixes this error:
> | contrib/Makefile.am:10: `pkglibexecdir' is not a legitimate directory for `SCRIPTS'
> | autoreconf: automake failed with exit status: 1
> NOTE: package mc-4.8.1-r0: task do_configure: Failed
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  .../mc/files/fix_for_automake_1.11.2.patch         |   69 ++++++++++++++++++++
>  meta/recipes-extended/mc/mc_4.8.1.bb               |    3 +-
>  2 files changed, 71 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch

Merged to master, thanks.

Richard



