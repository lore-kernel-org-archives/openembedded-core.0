Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C7C9060125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7V7JZ7N007164; Wed, 31 Aug 2016 08:19:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 738LiNXe7Itd; Wed, 31 Aug 2016 08:19:35 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7V7JWbZ007161
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 08:19:33 +0100
Message-ID: <1472627972.29583.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 08:19:32 +0100
In-Reply-To: <89463ec6e33f6ba793867711eb18d82ee58bc85b.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
	<89463ec6e33f6ba793867711eb18d82ee58bc85b.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] libc-headers: update to v4.8
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
X-List-Received-Date: Wed, 31 Aug 2016 07:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-08-30 at 12:49 -0400, Bruce Ashfield wrote:
> Updating the libc-headers to use the 4.8 kernel as the default.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc                 |  2 +-
>  .../linux-libc-headers/linux-libc-headers_4.8.bb            | 13
> +++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc
> -headers_4.8.bb

The musl patches fail to apply on the new version:

https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/928
/steps/BuildImages/logs/stdio

Cheers,

Richard

