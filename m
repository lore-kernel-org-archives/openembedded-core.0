Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8EXA-0001ps-G7 for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 19:00:00 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QH0tMa004303 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:00:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o5qDRZVE1nyI
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:00:55 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QH0qOR004273
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:00:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 17:54:29 +0100
In-Reply-To: <933bacf8def65b14016b1543915357cc5ea3ebd1.1317037371.git.edwin.zhai@intel.com>
References: <cover.1317037371.git.edwin.zhai@intel.com>
	<933bacf8def65b14016b1543915357cc5ea3ebd1.1317037371.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317056075.26109.65.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] matchbox: Upgrade SRCREV to reflect recent accpeted patches by upstream
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
X-List-Received-Date: Mon, 26 Sep 2011 17:00:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 19:55 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  .../libmatchbox/files/16bppfixes.patch             |    2 +-
>  .../libmatchbox/files/matchbox-start-fix.patch     |    2 +-
>  .../libmatchbox/libmatchbox_git.bb                 |    6 +--
>  .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |    4 +-
>  .../files/dso_linking_change_build_fix.patch       |    2 +-
>  .../matchbox-desktop/files/window-resize-fix.patch |   50 --------------------
>  .../matchbox-desktop/matchbox-desktop_git.bb       |    8 +--
>  .../matchbox-panel-2/matchbox-panel-2_git.bb       |    7 +--
>  .../recipes-sato/matchbox-panel-2/startup_fix.diff |   19 -------
>  .../files/dso_linking_change_build_fix.patch       |   37 --------------
>  .../matchbox-stroke/matchbox-stroke_git.bb         |    3 +-
>  .../matchbox-theme-sato-2/png_rename.patch         |   16 ------
>  .../matchbox-theme-sato-2_git.bb                   |    5 +-
>  13 files changed, 17 insertions(+), 144 deletions(-)
>  delete mode 100644 meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
>  delete mode 100644 meta/recipes-sato/matchbox-panel-2/startup_fix.diff
>  delete mode 100644 meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
>  delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch

Merged to master. Great to see some of this getting tidied up! :)

Cheers,

Richard



