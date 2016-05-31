Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DD518771BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 07:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4V7bgYQ029712; Tue, 31 May 2016 08:37:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sf1JXC3pBiKq; Tue, 31 May 2016 08:37:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4V7baHD029707
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 May 2016 08:37:37 +0100
Message-ID: <1464680256.19134.110.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 08:37:36 +0100
In-Reply-To: <1464621623-16991-2-git-send-email-maxin.john@intel.com>
References: <1464621623-16991-1-git-send-email-maxin.john@intel.com>
	<1464621623-16991-2-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: [PATCH 2/2] bluez5: update to 5.40
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
X-List-Received-Date: Tue, 31 May 2016 07:37:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-30 at 18:20 +0300, Maxin B. John wrote:
> 5.39 -> 5.40
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-connectivity/bluez5/{bluez5_5.39.bb => bluez5_5.40.bb}
> | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.39.bb =>
> bluez5_5.40.bb} (89%)

I had this in master-next and suspect it caused:

https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/build
s/448/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-pam/build
s/800/steps/BuildImages/logs/stdio

and the world targets also showed some issues. There were other changes
mixed in (particularly python3) and some builds succeeded so it could
also be some kind of dependency race.

Cheers,

Richard


