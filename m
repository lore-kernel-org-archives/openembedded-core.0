Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.23])
 by mx.groups.io with SMTP id smtpd.web12.396.1610690539175834007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 22:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=VwyKUcSE;
 spf=pass (domain: outlook.com, ip: 40.92.89.23, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV2G59IHIhvLVR5WxAu56v06uRO9v6HR8gHC0YPC7ZyVCKyyOLZNfzh3R/0dIv83YZPZcDkAJmAraW47IohYPe3b16tj074T/kRq8hAxiSmn8PqW1x08W5b898shtIJDjtvOjgqjGRobpDD6TXWazaF2iAXiQl2t8QVaiS9lRXM6pRtSSjUbkt8LKyHofb1L45JeYV//STxQnC0hdaS4pobjSky6hAPz7uHfSljtLiSzYP2biNXnufxmlc1wYo39PXuR265vYYQFlSlccH5tRNvKzq85Gy8rnRzLTURVkpzFSEmQNg/Pw24FINo/RxNlrm5jC9kE4FPquqmAZfm5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJGAJwEvS+s8H8vyUS8nY+WjfXe+35bIBQlRGl+iLSA=;
 b=Gv/cHoR3AAclBHMNflg7DEGLkCwbcaz1tTL3ZmhZ8Eww9NMPb73TX49K9VDV9iAPSVQ1rAQuddzdF0EN467ceNLQOezKqbuOpc8LSw3XCnKcj20Jdbxd+85JS42lN/G7AP4ragVGfT7tn7/6EYeMQB/ON5lvzpQiA2/5eIdoRMhgX4BXGgQ2GD0CKHewmd5/u65Tm6XTrcKb1JbOT8detuqLK+GongH7YuOPiERYun8AckNaunzqpUW2bALujaFWDsG7TjDvTRkw/1LsgO70cUn4BgKAkXZXpXcc+wFegzHUXkI04fACQMdM3HVnytOTMeYaJrtZRD2RqoNbsKBJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJGAJwEvS+s8H8vyUS8nY+WjfXe+35bIBQlRGl+iLSA=;
 b=VwyKUcSEub4c1ASqa5Y0i1WhVae5VfToF0woq0gdpF5z33JFjaWSuZM9xXH7OUwFSPxGOFzw4EM0WgCZd9gKF5iIXQkv832RZy/d8XTikre+HsNhro0hzmz8AeqHfameEMKlW2zA0xspPumPZdohzy/0p+Uj+V6bY4TWOMZZJ3+AzN9qIsZSygwutyQU8CBU0xxWDD6y/gB0o2Mk02jJalOYLdKFPS4f5F0lSpBnBdMy+1RwVisjBZqD65DWnKaPWfW3hODz9hlO0Euko7ZFvLIrFk1SmOt3lsD/GQjJtYbi1uv7+V0iz7rM+7AOUizGvPd+l6Ss583S9fXaXXLiIw==
Received: from AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::49) by
 AM6EUR05HT110.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::277)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 06:02:17 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:fc11::46) by AM6EUR05FT062.mail.protection.outlook.com
 (2a01:111:e400:fc11::254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 15 Jan 2021 06:02:16 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:CA58914B00576A5AB8B8CAAEFB90AF9F08BF9E420EFB1FAD6C53DD8ECC36AB00;UpperCasedChecksum:11F60E91A7FD47393DE33F495234DD1B1B44B9CBCF3E63CCC32A7BBDB61250A2;SizeAsReceived:8662;Count:47
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::404f:17dc:be86:de0b]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::404f:17dc:be86:de0b%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 06:02:16 +0000
Subject: Re: [OE-core] [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
To: openembedded-core@lists.openembedded.org
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB47391E7ECA1AA0257910D38DA8A70@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Fri, 15 Jan 2021 07:02:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210115052615.29893-1-paul.gortmaker@windriver.com>
X-TMN: [elw9rX8HEu6AdoTprFf8a5XgaQ5/TpS4]
X-ClientProxiedBy: AM5PR0402CA0015.eurprd04.prod.outlook.com
 (2603:10a6:203:90::25) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <212aca77-32dc-6243-3f29-3467ba890465@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.94.202) by AM5PR0402CA0015.eurprd04.prod.outlook.com (2603:10a6:203:90::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 06:02:16 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cb32c42c-af3e-4cc0-05a7-08d8b91b1c52
X-MS-TrafficTypeDiagnostic: AM6EUR05HT110:
X-MS-Exchange-MinimumUrlDomainAge: github.com#4847
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LNt0q7TJUFr59VEPh8qy71RfV91INUSWJi9vii2uWBIYT7brwq9h4sPjs2fVziiIGpMfD33MgD2QLYwn1wkRK+phckFPFQV5ixUQYbwJrUxi6SFkG33iJcory/F3jxaakqRcfSGacLPKMg97IVVsB+7Jyog4mLJaRzrbc4ZiluOmKvQXxSGFdeJ2uuAFkbR5IeihLGWlayZ5IwMP+bN0ByAn+SER/BhYLPl6YqN/j0GBZ2Qbx6ZtFYW2IlX+NrH5gYoDPbytl8I0OiUPEv8iFCfOppWpBj6jvYOhPGx8nfI=
X-MS-Exchange-AntiSpam-MessageData: 
	VJ8ECPr+FgOWMffBce4R0Fz+gh7tw7rsRCyX2ktN1PsoHbK8ILZbHrP4wa0QFy9u6GkD/hftrlRJyTV6TrSQNH9c/xZ3PUhohmfxFWll3zKncGNlAxrvAw6jdAKnP1/FCaO3Qjt1qifPj7mF/+i2zg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb32c42c-af3e-4cc0-05a7-08d8b91b1c52
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 06:02:16.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT110
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 15.01.21 06:26, Paul Gortmaker wrote:
> Recent systemd started using ascii args to "hidepid=" mount options
> for proc fs - unconditionally -- even though kernels older than v5.8
> emit an error message on each attempt:
> 
> root@qemux86-64:~# cat /proc/version
> Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version 10.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> root@qemux86-64:~# dmesg|grep proc:
> [   29.487995] proc: Bad value for 'hidepid'
> [   43.170571] proc: Bad value for 'hidepid'
> [   44.175615] proc: Bad value for 'hidepid'
> [   46.213300] proc: Bad value for 'hidepid'
> root@qemux86-64:~#
> 
> Simply ignoring them as the systemd maintainer unconditionally says
> is the resolution is clearly not acceptable, given the above.
> 
> Add a kernel version check to avoid calling mount with invalid args.
> Further details are within the enclosed systemd commit.
> 
> Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> new file mode 100644
> index 000000000000..65e7eca32d05
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> @@ -0,0 +1,126 @@
> +From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:00 2001
> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
> +Date: Wed, 13 Jan 2021 21:09:33 +0000
> +Subject: [PATCH] proc: dont trigger mount error with invalid options on old
> + kernels
> +
> +As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab ("core: introduce
> +ProtectProc= and ProcSubset= to expose hidepid= and subset= procfs
> +mount options") kernels older than v5.8 generate multple warnings at
> +boot, as seen in this Yocto build from today:
> +
> +     qemux86-64 login: root
> +     [   65.829009] proc: Bad value for 'hidepid'
> +     root@qemux86-64:~# dmesg|grep proc:
> +     [   16.990706] proc: Bad value for 'hidepid'
> +     [   28.060178] proc: Bad value for 'hidepid'
> +     [   28.874229] proc: Bad value for 'hidepid'
> +     [   32.685107] proc: Bad value for 'hidepid'
> +     [   65.829009] proc: Bad value for 'hidepid'
> +     root@qemux86-64:~#
> +
> +The systemd maintainer has dismissed this as something people should
> +simply ignore[1] and has no interest in trying to avoid it by
> +proactively checking the kernel version, so people can safely assume
> +that they will never see this version check commit upstream.
> +
> +However, as can be seen above, telling people to just ignore it is not
> +an option, as we'll end up answering the same question and dealing with
> +the same bug over and over again.
> +
> +The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
> +systemd 247 and above plus kernel v5.7 or older will need this.
> +
> +[1] https://github.com/systemd/systemd/issues/16896
> +
> +Upstream-Status: Actively hostile

Just a tiny bit of nitpick, although I really like this new 
classification (as it pretty much sums up many things when it comes to 
systemd), it should be `Denied`
Nonetheless I think that this is a very useful patch

> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> +
> +diff --git a/src/core/namespace.c b/src/core/namespace.c
> +index cdf427a6ea93..f8fc33a89fc2 100644
> +--- a/src/core/namespace.c
> ++++ b/src/core/namespace.c
> +@@ -4,7 +4,9 @@
> + #include <linux/loop.h>
> + #include <sched.h>
> + #include <stdio.h>
> ++#include <stdlib.h>
> + #include <sys/mount.h>
> ++#include <sys/utsname.h>
> + #include <unistd.h>
> + #include <linux/fs.h>
> +
> +@@ -859,14 +861,34 @@ static int mount_sysfs(const MountEntry *m) {
> + }
> +
> + static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info) {
> ++        _cleanup_free_ char *opts = NULL;
> +         const char *entry_path;
> +-        int r;
> ++        int r, major, minor;
> ++        struct utsname uts;
> ++        bool old = false;
> +
> +         assert(m);
> +         assert(ns_info);
> +
> +         entry_path = mount_entry_path(m);
> +
> ++        /* If uname says that the system is older than v5.8, then the textual hidepid= stuff is not
> ++         * supported by the kernel, and thus the per-instance hidepid= neither, which means we
> ++         * really don't want to use it, since it would affect our host's /proc * mount. Hence let's
> ++         * gracefully fallback to a classic, unrestricted version. */
> ++
> ++        r = uname(&uts);
> ++        if (r < 0)
> ++               return errno;
> ++
> ++        major = atoi(uts.release);
> ++        minor = atoi(strchr(uts.release, '.') + 1);
> ++
> ++        if (major < 5 || (major == 5 && minor < 8)) {
> ++                log_debug("Pre v5.8 kernel detected [v%d.%d] - skipping hidepid=", major, minor);
> ++                old = true;
> ++        }
> ++
> +         /* Mount a new instance, so that we get the one that matches our user namespace, if we are running in
> +          * one. i.e we don't reuse existing mounts here under any condition, we want a new instance owned by
> +          * our user namespace and with our hidepid= settings applied. Hence, let's get rid of everything
> +@@ -875,9 +897,8 @@ static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info) {
> +         (void) mkdir_p_label(entry_path, 0755);
> +         (void) umount_recursive(entry_path, 0);
> +
> +-        if (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
> +-            ns_info->proc_subset != PROC_SUBSET_ALL) {
> +-                _cleanup_free_ char *opts = NULL;
> ++        if (!old && (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
> ++            ns_info->proc_subset != PROC_SUBSET_ALL)) {
> +
> +                 /* Starting with kernel 5.8 procfs' hidepid= logic is truly per-instance (previously it
> +                  * pretended to be per-instance but actually was per-namespace), hence let's make use of it
> +@@ -891,21 +912,9 @@ static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info) {
> +                                ns_info->proc_subset == PROC_SUBSET_PID ? ",subset=pid" : "");
> +                 if (!opts)
> +                         return -ENOMEM;
> +-
> +-                r = mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
> +-                if (r < 0) {
> +-                        if (r != -EINVAL)
> +-                                return r;
> +-
> +-                        /* If this failed with EINVAL then this likely means the textual hidepid= stuff is
> +-                         * not supported by the kernel, and thus the per-instance hidepid= neither, which
> +-                         * means we really don't want to use it, since it would affect our host's /proc
> +-                         * mount. Hence let's gracefully fallback to a classic, unrestricted version. */
> +-                } else
> +-                        return 1;
> +         }
> +
> +-        r = mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, NULL);
> ++        r = mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
> +         if (r < 0)
> +                 return r;
> +
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
> index 5eea78eff353..84d997196cb6 100644
> --- a/meta/recipes-core/systemd/systemd_247.2.bb
> +++ b/meta/recipes-core/systemd/systemd_247.2.bb
> @@ -23,6 +23,7 @@ SRC_URI += "file://touchscreen.rules \
>              file://0003-implment-systemd-sysv-install-for-OE.patch \
>              file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
>              file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
> +           file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
>              "
>   
>   # patches needed by musl
> 
> 
> 
> 
> 
