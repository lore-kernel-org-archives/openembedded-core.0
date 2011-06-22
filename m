Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZQVe-0006NP-AG for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:42:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MGd0TS006012
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:39:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05710-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:38:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MGcqPc006004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:38:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9e1c30c907343c7a3a781d5f1d3746d6ed441d59.1308658641.git.edwin.zhai@intel.com>
References: <cover.1308658641.git.edwin.zhai@intel.com>
	<9e1c30c907343c7a3a781d5f1d3746d6ed441d59.1308658641.git.edwin.zhai@intel.com>
Date: Wed, 22 Jun 2011 17:38:35 +0100
Message-ID: <1308760715.20015.87.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] clutter: Use new git repo
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
X-List-Received-Date: Wed, 22 Jun 2011 16:42:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 20:22 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> clutter move its git server from clutter-project.org to gnome.org
> 
> [YOCTO #1040] got fixed
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
>  meta/recipes-graphics/clutter/clutter_git.bb       |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> index 4c1c003..2d10d81 100644
> --- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> +++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> @@ -6,7 +6,7 @@ SRCREV = "4799ac10ae8cb7da936a2b999aba58fe62eb1ee3"
>  PV = "0.10.1+git${SRCPV}"
>  PR = "r0"
>  
> -SRC_URI = "git://git.clutter-project.org/clutter-box2d.git;protocol=git"
> +SRC_URI = "git://git.gnome.org/clutter-box2d;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-graphics/clutter/clutter_git.bb b/meta/recipes-graphics/clutter/clutter_git.bb
> index cb5f476..76a26a6 100644
> --- a/meta/recipes-graphics/clutter/clutter_git.bb
> +++ b/meta/recipes-graphics/clutter/clutter_git.bb
> @@ -7,7 +7,7 @@ SRCREV = "e957e277b8a4893ce8c99e94402036d42a8b3748"
>  PV = "1.0.0+git${SRCPV}"
>  PR = "r9"
>  
> -SRC_URI = "git://git.clutter-project.org/clutter.git;protocol=git;branch=master \
> +SRC_URI = "git://git.gnome.org/clutter;protocol=git;branch=master \
>             file://enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch;patch=1;rev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 \
>             file://enable_tests.patch;patch=1;notrev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 "
>  S = "${WORKDIR}/git"

Master already has:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=e4293c5be719663d75d7bc464a04a841d8b35115

Could you please rebase on top of that?

Cheers,

Richard




