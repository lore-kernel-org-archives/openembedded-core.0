Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 39B1960232
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Mar 2016 07:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2K7ofkJ025512; Sun, 20 Mar 2016 07:50:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UCWlFGghjkdO; Sun, 20 Mar 2016 07:50:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2K7ob0P025508
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 20 Mar 2016 07:50:39 GMT
Message-ID: <1458460237.7615.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Mar 2016 07:50:37 +0000
In-Reply-To: <1458326374-8865-1-git-send-email-otavio@ossystems.com.br>
References: <1458326374-8865-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] u-boot: Upgrade to 2016.03 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Mar 2016 07:50:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-18 at 15:39 -0300, Otavio Salvador wrote:
> The 2016.03 release has been announced in March 14th. This
> incorporates a lot of bug fixes and improvements which are useful for
> any new embedded development.
> 
> Along with the upgrade of U-Boot and its related recipes, this patch
> also drops the AM335x environment fix which has been merged into the
> release.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  ...utils_2016.01.bb => u-boot-fw-utils_2036.03.bb} |  8 ++---
>  ...kimage_2016.01.bb => u-boot-mkimage_2036.03.bb} |  8 ++---

2036?

Where did the last 20 years go?! :)

I'll fix this up in -next.

Cheers,

Richard

