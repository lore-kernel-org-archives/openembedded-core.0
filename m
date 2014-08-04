Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA3A65DB1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 09:47:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s749kuRq008344; Mon, 4 Aug 2014 10:46:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8xBo8t9Y8JUQ; Mon,  4 Aug 2014 10:46:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s749kr3d008181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Aug 2014 10:46:54 +0100
Message-ID: <1407145613.6981.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 04 Aug 2014 10:46:53 +0100
In-Reply-To: <1406891040-8738-1-git-send-email-koen@dominion.thruhere.net>
References: <1406891040-8738-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cups: fix host contamination issue
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
X-List-Received-Date: Mon, 04 Aug 2014 09:47:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-01 at 13:04 +0200, Koen Kooi wrote:
> -I/usr/include would end up in CFLAGS if /usr/bin/gcrypt-config is
> present on the host systemd.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...crypt-config-from-the-host-it-leads-to-SS.patch | 28 ++++++++++++++++++++++
>  meta/recipes-extended/cups/cups_1.7.4.bb           |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch

Does the patch "cups: regen configure so cups-no-gcrypt.patch has an
effect" obsolete the need for this change?

Cheers,

Richard


