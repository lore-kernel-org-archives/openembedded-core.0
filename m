Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvPp1-0001jk-Rw for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:30:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9IOJN026822;
	Sun, 29 Jul 2012 10:18:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18532-08; Sun, 29 Jul 2012 10:18:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9IFBl026816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 29 Jul 2012 10:18:17 +0100
Message-ID: <1343553495.16998.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:18:15 +0100
In-Reply-To: <1343473829-19737-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120728110453.GF3742@jama.jama.net>
	<1343473829-19737-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2] qt-mobility, xserver-xorg, ofono, bluez4, gst-plugins-good: bump PR to rebuild after libudev0 soname change to libudev1
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
X-List-Received-Date: Sun, 29 Jul 2012 09:30:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-07-28 at 13:10 +0200, Martin Jansa wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> * this patch depends on http://patchwork.openembedded.org/patch/32085/
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> ---
> v2: rebased bluez4 PR bump
> 
> ---
>  meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
>  meta/recipes-connectivity/ofono/ofono_1.8.bb       |    1 +
>  meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
>  .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
>  .../gstreamer/gst-plugins-good_0.10.31.bb          |    2 +-
>  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    2 +-
>  6 files changed, 6 insertions(+), 5 deletions(-)


Merged to master, thanks.

Richard



