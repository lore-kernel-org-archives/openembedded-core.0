Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B91AF6E45B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 17:37:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFHbqWw023055; Sun, 15 Dec 2013 17:37:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RocnU8g76D8K; Sun, 15 Dec 2013 17:37:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFHbiPv023040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 15 Dec 2013 17:37:46 GMT
Message-ID: <1387129060.8783.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 15 Dec 2013 17:37:40 +0000
In-Reply-To: <1386775933-14232-1-git-send-email-koen.kooi@linaro.org>
References: <1386775933-14232-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] grub: add git version
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
X-List-Received-Date: Sun, 15 Dec 2013 17:38:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-12-11 at 16:32 +0100, Koen Kooi wrote:
> Recently grub git gained support for ARM builds (using u-boot or EFI as first stage loader) and with 2 extra patches we get support for 64-bit ARM as well.
> 
> Buildtested for genericarmv7a, genericarmv8 and qemux86. The genericarmv8 build fails in do_package/strip due to a binutils problem.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>

No objection but should this have a DEFAULT_PREFERENCE = "-1" at least
for the x86 cases since we try and stick to releases where we can...

Cheers,

Richard


