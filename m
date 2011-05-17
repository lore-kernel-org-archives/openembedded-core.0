Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMKsh-0005nE-6L for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:04:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HE1LBA017079;
	Tue, 17 May 2011 15:01:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16645-10; Tue, 17 May 2011 15:01:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HE1C3C017073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 May 2011 15:01:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305628454.2429.187.camel@phil-desktop>
References: <1305628454.2429.187.camel@phil-desktop>
Date: Tue, 17 May 2011 15:01:12 +0100
Message-ID: <1305640872.3424.238.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@www.linuxtogo.org
Subject: Re: [PATCH] guilt-native: eliminate hardcoded "/usr" in do_install
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
X-List-Received-Date: Tue, 17 May 2011 14:04:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 11:34 +0100, Phil Blundell wrote:
> For some reason guilt-native seems to have gone out of its way to refer explicitly to /usr, which breaks on micro. 
> Let's use ${prefix} instead.
> 
> ---
>  meta/recipes-devtools/guilt/guilt-native_0.33.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
> index 6261330..7d0246e 100644
> --- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
> +++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
> @@ -28,5 +28,5 @@ do_compile() {
>  }
> 
>  do_install() {
> -       oe_runmake PREFIX=${D}/${base_prefix}/usr install
> +       oe_runmake PREFIX=${D}/${prefix} install
>  }
> 

Merged to mast thanks.

(again, whitespace on this was corrupted)

Cheers,

Richard



