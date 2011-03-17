Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q0119-0004lD-Nx for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 01:25:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2H0McL2011874;
	Thu, 17 Mar 2011 00:22:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11739-03; Thu, 17 Mar 2011 00:22:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2H0MXbI011868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 17 Mar 2011 00:22:33 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <526eb0e9906e6fae324d087708a71626563f5457.1300318053.git.mark.hatle@windriver.com>
References: <cover.1300318053.git.mark.hatle@windriver.com>
	<526eb0e9906e6fae324d087708a71626563f5457.1300318053.git.mark.hatle@windriver.com>
Date: Thu, 17 Mar 2011 00:22:21 +0000
Message-ID: <1300321341.30423.1925.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@lists.pokylinux.org
Subject: Re: [PATCH 7/7] sat-solver: Fix solution DB generation and general cleanup
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
X-List-Received-Date: Thu, 17 Mar 2011 00:25:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-16 at 18:30 -0500, Mark Hatle wrote:
> Uprev sat-solver to the latest git version.  This corrects the solv db
> generation with RPM5.
> 
> Refactor the patches for RPM5 support, cleaning up components of the
> cmake.patch for submission upstream.  (Also fix a problem remaining
> in the upstream with a mismatched function name.)
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../conf/distro/include/poky-default-revisions.inc |    2 +-
>  .../sat-solver/sat-solver/cmake.patch              |   58 ++---------------
>  .../sat-solver/sat-solver/rpm5-solvdb.patch        |   30 ---------
>  .../sat-solver/sat-solver/rpm5.patch               |   53 ---------------
>  .../sat-solver/sat-solver/sat-solver_rpm5.patch    |   67 ++++++++++++++++++++
>  meta/recipes-extended/sat-solver/sat-solver_git.bb |    7 +-
>  6 files changed, 78 insertions(+), 139 deletions(-)
>  delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch
>  delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/rpm5.patch
>  create mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch

Merged to master, thanks.

Richard



