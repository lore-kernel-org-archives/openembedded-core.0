Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SKQCa-0007HN-D3
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 10:25:24 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SKQ3T-00064V-Hl>; Wed, 18 Apr 2012 10:15:59 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SKQ3T-0001Gt-Ex>; Wed, 18 Apr 2012 10:15:59 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SKQ3S-0007py-BP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 10:15:58 +0200
Date: Wed, 18 Apr 2012 10:15:58 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120418081558.GB28842@mi.fu-berlin.de>
References: <cover.1334705370.git.scott.a.garman@intel.com>
	<41a0ab8337b5d29e4fe1d114bf678cb601956e1e.1334705370.git.scott.a.garman@intel.com>
MIME-Version: 1.0
In-Reply-To: <41a0ab8337b5d29e4fe1d114bf678cb601956e1e.1334705370.git.scott.a.garman@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH 1/1] qemugl: make postinst run at first boot
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
X-List-Received-Date: Wed, 18 Apr 2012 08:25:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 17, 2012 at 04:33:29PM -0700, Scott Garman wrote:
> The previous postinst script was not working for images which use
> RPM because do_rootfs could allow qemugl to be installed after
> libgl1, and the postinst needs to run after libgl1 is installed.
> 
> Hence, it's being changed to run at first boot instead of during
> do_rootfs.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/recipes-graphics/mesa/qemugl_git.bb |   16 +++++++++++-----
>  1 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
> index 378aa65..32980d3 100644
> --- a/meta/recipes-graphics/mesa/qemugl_git.bb
> +++ b/meta/recipes-graphics/mesa/qemugl_git.bb
> @@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
>  SRCREV = "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
>  
>  PV = "0.0+git${SRCPV}"
> -PR = "r10"
> +PR = "r11"
>  
>  DEFAULT_PREFERENCE = "-1"
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is this still needed?

Bye Henning


