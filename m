Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SgbPl-0002aM-Ej for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 14:50:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5ICdtsq005111;
	Mon, 18 Jun 2012 13:39:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18265-09; Mon, 18 Jun 2012 13:39:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5ICdkVI005105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Jun 2012 13:39:47 +0100
Message-ID: <1340023187.8481.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jun 2012 13:39:47 +0100
In-Reply-To: <5b10b328ed39fd43464ed1f97fdc8964237252e7.1339932526.git.anders@chargestorm.se>
References: <cover.1339932526.git.anders@chargestorm.se>
	<5b10b328ed39fd43464ed1f97fdc8964237252e7.1339932526.git.anders@chargestorm.se>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: [oe-core, for-denzil][PATCH 1/1] qt4-embedded: fix QT_ARCH usage in QT_CONFIG_FLAGS
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
X-List-Received-Date: Mon, 18 Jun 2012 12:50:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-06-17 at 13:31 +0200, Anders Darander wrote:
> After the change to shell style functions (from python style), the
> ability to use oe_filter_out on QT_CONFIG_FLAGS got broken.
> 
> This patch solves that by referring to QT_ARCH in a more correct way.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
> index 05803d1..9c5b4af 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -10,7 +10,7 @@ QT_BASE_LIB  ?= "libqt-embedded"
>  SRC_URI += "file://qte.sh"
>  
>  QT_CONFIG_FLAGS += " \
> -    -embedded ${QT_ARCH} \
> +    -embedded $QT_ARCH \
>      -qtlibinfix ${QT_LIBINFIX} \
>      -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
>      -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \

Merged to master, thanks. cc'ing Scott for denzil...

Cheers,

Richard



