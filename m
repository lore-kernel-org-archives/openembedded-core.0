Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RFmLf-0005Fh-VZ for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:31:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCWFhW007848 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:32:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OglsMaHpAwt9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:32:15 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCWA9i007844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:32:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 13:25:23 +0100
In-Reply-To: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318854333.21775.2.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] xserver-xorg: remove glx-use-tls again
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
X-List-Received-Date: Mon, 17 Oct 2011 12:31:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-15 at 12:24 +0200, Martin Jansa wrote:
> * khem confirmed that uclibc does support it now
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/glx-use-tls.inc         |    7 -------
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    3 +--
>  2 files changed, 1 insertions(+), 9 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/glx-use-tls.inc

Merged to master, thanks.

Richard



