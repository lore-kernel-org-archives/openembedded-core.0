Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwPjL-00042g-G5 for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 04:31:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P2QnBF026167;
	Thu, 25 Aug 2011 03:26:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26102-01; Thu, 25 Aug 2011 03:26:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P2QdEx026160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 25 Aug 2011 03:26:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 24 Aug 2011 19:26:38 -0700
Message-ID: <1314239198.5939.173.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Thu, 25 Aug 2011 02:31:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 20:32 +0200, Koen Kooi wrote:
> When using binary locales rootfs generation fails with:
> 
> | Unknown package 'locale-base-en-us'.
> | Collected errors:
> |  * opkg_install_cmd: Cannot install package locale-base-en-us.
> 
> This is due to:
> 
> $ dpkg-deb -I ipk/armv7a/locale-base-en-us_2.12-r16_armv7a.ipk | grep Depends
>  Depends: eglibc-binary-localedata-en.us
> 
> Note the '.' seperator
> 
> $ ls ipk/armv7a/ | grep binary-localedata-en | grep us
> eglibc-binary-localedata-en-us_2.12-r16_armv7a.ipk
> 
> Note the '-' seperator vs the '.' in the locale-base packages.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Merged to master, thanks.

Richard



