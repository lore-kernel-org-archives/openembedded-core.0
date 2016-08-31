Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2236E60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7V7N0G6007356; Wed, 31 Aug 2016 08:23:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KLL9fbEfX-DT; Wed, 31 Aug 2016 08:23:00 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7V7MtcT007352
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 08:22:57 +0100
Message-ID: <1472628175.29583.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 08:22:55 +0100
In-Reply-To: <7a16ab60139050fc112ae798e763f1270e7abbfd.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
	<7a16ab60139050fc112ae798e763f1270e7abbfd.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] qemuarm: add device tree support
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
X-List-Received-Date: Wed, 31 Aug 2016 07:23:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-08-30 at 12:49 -0400, Bruce Ashfield wrote:
> As of the 4.7 kernel qemuarm must be booted with a dtb. To allow
> older and recent kernels to both boot qemuarm, we add the device
> tree definitions only to recipes that need it (linux-yocto-dev)
> and make runqemu detect and use the dtb if present.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  scripts/runqemu-internal | 3 +++
>  1 file changed, 3 insertions(+)

This doesn't work with Roberts runqemu conversion to python.

I did try adding http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=ma
ster-next&id=e91d7bf00bfab5142bc290425103971b897c208b however this
requires the use of the dtb file and doesn't work with older kernels.
I'll see if I can come up with something better based on kernel
PREFERRED_VERSION...

Cheers,

Richard


