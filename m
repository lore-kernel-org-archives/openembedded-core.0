Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7B473237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 14:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RE3uF4026767; Mon, 27 Jul 2015 15:03:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Jld_6emEkx3G; Mon, 27 Jul 2015 15:03:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RE3dPI026762
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2015 15:03:51 +0100
Message-ID: <1438005819.821.255.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wei.tee.ng@intel.com
Date: Mon, 27 Jul 2015 15:03:39 +0100
In-Reply-To: <1436418620-16592-2-git-send-email-wei.tee.ng@intel.com>
References: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
	<1436418620-16592-2-git-send-email-wei.tee.ng@intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] recipes-connectivity: Add hostapd configuration for enabling Marvell 8897 WiFi feature
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
X-List-Received-Date: Mon, 27 Jul 2015 14:03:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-09 at 13:10 +0800, wei.tee.ng@intel.com wrote:
> From: Ng Shui Lei <shui.lei.ng@intel.com>
> 
> Hostapd features was created in the recipes-connectivity
> layer to enable Marvell 8897 module in AP mode and STA mode.
> 
> Signed-off-by: Ng Shui Lei <shui.lei.ng@intel.com>
> Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
> ---
>  .../hostapd/hostapd-2.2/defconfig                  |  145 ++++++++++++++++++++
>  .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
>  meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
>  meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
>  4 files changed, 262 insertions(+)
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
>  create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb

I'm by no means a comms expert which is one of the reasons I've not
replied to this, I'd hoped someone with more knowledge would. Part of
the issue here is that hostapd and connmand have overlapping
functionality, conflicting in some cases.

So the question is why do we need hostapd if we have connman (which is
already in OE-Core)?

Cheers,

Richard


