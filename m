Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE0676B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81LE0k0015418; Tue, 1 Sep 2015 22:14:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id E1TR-CS6IxwS; Tue,  1 Sep 2015 22:14:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81LDmpI015412
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Sep 2015 22:13:59 +0100
Message-ID: <1441142028.24871.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Date: Tue, 01 Sep 2015 22:13:48 +0100
In-Reply-To: <1433407956-1948-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1433407956-1948-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: Fix LSB NG Cases.
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
X-List-Received-Date: Tue, 01 Sep 2015 21:14:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-06-04 at 16:52 +0800, Li xin wrote:
> -/tset/LSB.fhs/var/tmp/tmp-tc.
> 
> The LSB Core test requires the /var/tmp directory supports creation of files.
> And the mount tmpfs on /var/volatile cause the /var/tmp directory can't be
> writable for non-root users.

This change doesn't look correct to me, its a pretty fundamental change
to the way the system operates and certainly needs more thought and
justification than the few lines above.

Surely if its a non-root users issue, the problem is permissions, not
the tmpfs anyway?

Cheers,

Richard

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-core/base-files/base-files/fstab | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
> index d79a016..458ec70 100644
> --- a/meta/recipes-core/base-files/base-files/fstab
> +++ b/meta/recipes-core/base-files/base-files/fstab
> @@ -4,7 +4,6 @@
>  proc                 /proc                proc       defaults              0  0
>  devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
>  tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> -tmpfs                /var/volatile        tmpfs      defaults              0  0
>  
>  # uncomment this if your device has a SD/MMC/Transflash slot
>  #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
> -- 
> 1.8.4.2
> 



