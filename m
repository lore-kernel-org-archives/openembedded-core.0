Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TZ07X-0007pJ-Vo for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 15:08:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAFDshVe022505;
	Thu, 15 Nov 2012 13:54:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21089-06; Thu, 15 Nov 2012 13:54:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAFDsZ7M022499
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 15 Nov 2012 13:54:36 GMT
Message-ID: <1352987675.3709.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 15 Nov 2012 13:54:35 +0000
In-Reply-To: <96e8a890aa256c71895cabe5f36c3c42edc1a086.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<96e8a890aa256c71895cabe5f36c3c42edc1a086.1352898505.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 04/12] xkeyboard-config: upgrade to 2.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 14:08:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-14 at 15:21 +0200, Laurentiu Palcu wrote:
> A couple of extra changes:
>  * changed the SRC_URI to the new, valid, one
>  * added dependency of gettext (do_qa_configure detected is needed)
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  ...board-config_2.1.bb => xkeyboard-config_2.7.bb} |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.1.bb => xkeyboard-config_2.7.bb} (75%)


checking whether to enable maintainer-specific portions of Makefiles... no
checking build system type... x86_64-pc-linux-gnu
checking host system type... i586-poky-linux-gnu
checking for a sed that does not truncate output... /bin/sed
checking for xsltproc... /media/build1/poky/build1/tmp/sysroots/x86_64-linux/usr/bin/xsltproc
checking for a sed that does not truncate output... (cached) /bin/sed
checking for i586-poky-linux-pkg-config... no
checking for pkg-config... /media/build1/poky/build1/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
configure: WARNING: using cross tools not prefixed with host triplet
checking pkg-config is at least version 0.9.0... yes
checking for DEPS... no
configure: WARNING:
                 Required dependencies not found. These dependencies are
                 run-time dependencies only and not required for building.
                 Skip this check with --disable-runtime-deps.

                 Installing this version of xkeyboard-config on a host
                 without the required dependencies may result in unusable
                 keyboard layouts.
                 
configure: error: No package 'x11' found
Configure failed. The contents of all config.log files follows to aid debugging
/media/build1/poky/build1/tmp/work/i586-poky-linux/xkeyboard-config/2.7-r0/xkeyboard-config-2.7/config.log
This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

Cheers,

Richard




