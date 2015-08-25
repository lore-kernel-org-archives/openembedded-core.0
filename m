Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 80EFB73E11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:03:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99984272"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Aug 2015 13:06:53 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7P53aHI010931
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:03:36 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Tue, 25 Aug 2015 13:03:42 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] base-files: Fix LSB NG Cases.
Thread-Index: AQHQnqPSPI6QridmT0CnKIJDTp6FVp4cqXEw
Date: Tue, 25 Aug 2015 05:03:41 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCBCC6F@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1433407956-1948-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1433407956-1948-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 25 Aug 2015 05:03:45 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Ping

Thanks

>-----Original Message-----
>From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Sent: Thursday, June 04, 2015 4:53 PM
>To: openembedded-core@lists.openembedded.org
>Cc: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Subject: [OE-core][PATCH] base-files: Fix LSB NG Cases.
>
>-/tset/LSB.fhs/var/tmp/tmp-tc.
>
>The LSB Core test requires the /var/tmp directory supports creation of fil=
es.
>And the mount tmpfs on /var/volatile cause the /var/tmp directory can't be=
 writable
>for non-root users.
>
>Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>---
> meta/recipes-core/base-files/base-files/fstab | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/meta/recipes-core/base-files/base-files/fstab
>b/meta/recipes-core/base-files/base-files/fstab
>index d79a016..458ec70 100644
>--- a/meta/recipes-core/base-files/base-files/fstab
>+++ b/meta/recipes-core/base-files/base-files/fstab
>@@ -4,7 +4,6 @@
> proc                 /proc                proc       defaults
>0  0
> devpts               /dev/pts             devpts     mode=3D0620,gid=3D5
>0  0
> tmpfs                /run                 tmpfs
>mode=3D0755,nodev,nosuid,strictatime 0  0
>-tmpfs                /var/volatile        tmpfs      defaults
>0  0
>
> # uncomment this if your device has a SD/MMC/Transflash slot
> #/dev/mmcblk0p1       /media/card          auto
>defaults,sync,noauto  0  0
>--
>1.8.4.2


