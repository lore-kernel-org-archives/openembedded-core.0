Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Px1yy-0008D7-6A for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 19:50:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28ImYDJ023143
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2011 18:48:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22665-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2011 18:48:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28ImMpm023135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2011 18:48:26 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1299135167-18330-6-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-6-git-send-email-raj.khem@gmail.com>
Date: Tue, 08 Mar 2011 10:48:19 -0800
Message-ID: <1299610099.602.93.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv3 5/6] poky-default.inc: Change LINUXLIBCVERSION "2.6.36" -> "2.6.37.2"
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
X-List-Received-Date: Tue, 08 Mar 2011 18:50:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-02 at 22:52 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/poky-default.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/distro/include/poky-default.inc b/meta/conf/distro/include/poky-default.inc
> index ef9f5cf..3ec5e1d 100644
> --- a/meta/conf/distro/include/poky-default.inc
> +++ b/meta/conf/distro/include/poky-default.inc
> @@ -19,7 +19,7 @@ GCCVERSION ?= "4.5.1"
>  SDKGCCVERSION ?= "4.5.1"
>  BINUVERSION ?= "2.21"
>  GLIBCVERSION ?= "2.10.1"
> -LINUXLIBCVERSION ?= "2.6.36"
> +LINUXLIBCVERSION ?= "2.6.37.2"
>  
>  # Temporary preferred version overrides for PPC
>  PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= "2009.08"

Merged to master, thanks.

Richard



