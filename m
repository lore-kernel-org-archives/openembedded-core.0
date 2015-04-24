Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A60A7605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 10:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3OAH1mn004642; Fri, 24 Apr 2015 11:17:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HvnDzcyA3s6r; Fri, 24 Apr 2015 11:17:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3OAGkZH004571
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Apr 2015 11:16:59 +0100
Message-ID: <1429870606.26983.130.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li Zhou <li.zhou@windriver.com>
Date: Fri, 24 Apr 2015 11:16:46 +0100
In-Reply-To: <1429841959-9823-3-git-send-email-li.zhou@windriver.com>
References: <1429841959-9823-1-git-send-email-li.zhou@windriver.com>
	<1429841959-9823-3-git-send-email-li.zhou@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] libxfont: Security Advisory - libxfont - CVE-2015-1804
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
X-List-Received-Date: Fri, 24 Apr 2015 10:17:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-04-24 at 10:19 +0800, Li Zhou wrote:
> bdfReadCharacters: ensure metrics fit into xCharInfo struct
> 
> We use 32-bit ints to read from the bdf file, but then try to stick
> into a 16-bit int in the xCharInfo struct, so make sure they won't
> overflow that range.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  ...acters-ensure-metrics-fit-into-xCharInfo-.patch |   76 ++++++++++++++++++++
>  meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch

No Upstream-Status in 2/3 or 3/3.

Cheers,

Richard


