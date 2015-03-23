Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0BF6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 16:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D7BDA315193D;
	Mon, 23 Mar 2015 17:47:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xr84oJDUgsJX; Mon, 23 Mar 2015 17:47:36 +0100 (CET)
Received: from [172.22.22.61] (55d41d03.access.ecotel.net [85.212.29.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D14FE3151732;
	Mon, 23 Mar 2015 17:47:35 +0100 (CET)
Message-ID: <551043A1.4040601@opendreambox.org>
Date: Mon, 23 Mar 2015 17:47:29 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1427125293-27123-1-git-send-email-obi@opendreambox.org>
	<CAJTo0LaG2kM=Q0ewEq+S7W3XMjRV=cvEc41jrsOSqHfkpee9uw@mail.gmail.com>
In-Reply-To: <CAJTo0LaG2kM=Q0ewEq+S7W3XMjRV=cvEc41jrsOSqHfkpee9uw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libav: fix floating dependency on libasound
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
X-List-Received-Date: Mon, 23 Mar 2015 16:47:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 23.03.2015 16:48, Burton, Ross wrote:
> 
> On 23 March 2015 at 17:41, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     -DEPENDS = "zlib libogg yasm-native"
>     +DEPENDS = "alsa-lib zlib libogg yasm-native"
> 
> 
> Wouldn't this be better as a PACKAGECONFIG?

As far as I can tell there's no configure switch to disable alsa. I
didn't care enough to patch libav's configure script, especially because
it's not based on autotools. I'd say apply this simple patch first, then
wait until someone wants to make the more complicated fix after the release.

Regards,
Andreas

