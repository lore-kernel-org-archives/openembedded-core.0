Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW4FH-0000zu-QC for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:52:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AjMJl013317
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:45:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12698-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 10:45:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AjE0K013311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:45:15 GMT
Message-ID: <1322736324.17484.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 10:45:24 +0000
In-Reply-To: <243c4b2329a95b3488f9c43e8f361095a686f925.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
	<243c4b2329a95b3488f9c43e8f361095a686f925.1322731182.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] task-self-hosted: install sudo, tun.ko, iptables, libgl and libgl-dev into the target
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
X-List-Received-Date: Thu, 01 Dec 2011 10:52:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 17:21 +0800, Dexuan Cui wrote:
> sudo, kernel-module-tun and iptables are needed by runqemu.
> strace has appeared in RDEPENDS_task-self-hosted-debug, so let's remove it
> from RDEPENDS_task-self-hosted-extended.
> install libglu and libgl-dev rather than mesa-dri and mesa-dri-dev due to the
> recent commit "mesa: package gl/egl/osmesa to separate packages".
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-core/tasks/task-self-hosted.bb |   14 ++++++++++----
>  1 files changed, 10 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard



