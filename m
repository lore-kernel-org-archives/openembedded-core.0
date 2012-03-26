Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC8U0-0001zh-Ra for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:53:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBiAp3024871
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:44:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20450-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:44:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBi2dV024865
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:44:02 +0100
Message-ID: <1332762240.28414.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 12:44:00 +0100
In-Reply-To: <313583f23e026bed3155643d1e8914313fce7478.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
	<313583f23e026bed3155643d1e8914313fce7478.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv 08/10] libusb*: import native support from meta-oe
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
X-List-Received-Date: Mon, 26 Mar 2012 11:53:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 23:30 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 +++++--
>  meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
> index 43da5af..7edd422 100644
> --- a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
> +++ b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
> @@ -13,9 +13,12 @@ DEPENDS = "libusb1"
>  # Besides, libusb-0.1 uses a per 1ms polling that hurts a lot to power
>  # consumption.
>  PROVIDES = "libusb"
> +PROVIDES += "virtual/libusb0"
> +PROVIDES_virtclass-native += "virtual/libusb0-native"

Doesn't the -native class extension code handle the above correctly now?

i.e. PROVIDES = "libusb virtual/libusb0"

should be enough?

Cheers,

Richard



