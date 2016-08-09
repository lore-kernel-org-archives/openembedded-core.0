Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob09.myregisteredsite.com
	(atl4mhob09.myregisteredsite.com [209.17.115.47])
	by mail.openembedded.org (Postfix) with ESMTP id 80232771F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 12:08:48 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.209])
	by atl4mhob09.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u79C8llc027941 for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 08:08:47 -0400
Received: (qmail 5641 invoked by uid 0); 9 Aug 2016 12:08:47 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 9 Aug 2016 12:08:47 -0000
To: openembedded-core@lists.openembedded.org
References: <20160801123253.9292-1-twoerner@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57A9C7AD.9090901@topic.nl>
Date: Tue, 9 Aug 2016 14:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160801123253.9292-1-twoerner@gmail.com>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Tue, 09 Aug 2016 12:08:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I've been adding "lzop-native" to a lot of kernel recipes because you also 
need it when generating an LZO compressed kernel (I like my boot time to be 
under 1 second).

It's a small dependency which is hard to automatically figure out, since there 
are a number of ways to trigger it (we just found two). I would welcome this 
patch very much, and I don't think many will suffer...


On 01-08-16 14:32, Trevor Woerner wrote:
> If the initramfs image is type lzo, then a native lzop is needed.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   meta/classes/kernel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index fa76a14..db42744 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>   inherit linux-kernel-base kernel-module-split
>
>   PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native lzop-native"
>
>   S = "${STAGING_KERNEL_DIR}"
>   B = "${WORKDIR}/build"
>


