Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iLD-0004f2-Cj for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 13:53:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34Bp4e4015588
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:51:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15532-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 12:51:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BoudL015582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:50:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d22a618d7ca6e992f2b3539c5089842d0d8541eb.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<d22a618d7ca6e992f2b3539c5089842d0d8541eb.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 12:50:53 +0100
Message-ID: <1301917853.24596.339.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 13/46] gettext_0.17.bb: Use linux-uclibceabi instead of linux-uclibcgnueabi
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
X-List-Received-Date: Mon, 04 Apr 2011 11:53:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:28 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/gettext/gettext_0.17.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/gettext/gettext_0.17.bb b/meta/recipes-core/gettext/gettext_0.17.bb
> index 3a9f893..b9c4e1c 100644
> --- a/meta/recipes-core/gettext/gettext_0.17.bb
> +++ b/meta/recipes-core/gettext/gettext_0.17.bb
> @@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>            "
>  
>  SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
> -SRC_URI_append_linux-uclibcgnueabi = " file://gettext-error_print_progname.patch;patch=1"
> +SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch;patch=1"
>  
>  SRC_URI[md5sum] = "58a2bc6d39c0ba57823034d55d65d606"
>  SRC_URI[sha256sum] = "209638bb8e162f22c281145a34e220c66f1f6e9ff5e4c50c6f2ef2ded59537ba"

I've merged patches 8-13 to master, thanks.

Richard



