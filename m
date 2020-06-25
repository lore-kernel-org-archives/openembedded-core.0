Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.58])
 by mx.groups.io with SMTP id smtpd.web12.3260.1593116228217007073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 13:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=PuiKK0Tb;
 spf=pass (domain: outlook.com, ip: 40.92.89.58, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW4QJmGF0iNw6ws1j8vRAdDIXvVzaUc9E17oXDECJFCdzrFQPS0iyhsMBghngqlNHgJlTyIxYVM49BH5zS+ggGtegq9YovKN7VWuakECeA4GxCSnqyTfp/jIEiWVfhA/hiMXSl/98z2yhGluyj+scxMWIGNATArne9D9teeOxtO4eBEIYwqMHTyPRMVVs92TYfH6zBIREaOZlPoVvW1ALvGBooPIDkCPSwo3fSyXhXjCLPF3BdXvGQq0lMLYsxPi6cQDKqiLGW9Ib7HULwJwguxhrGM/OtAys/P6jklxXE3+jdWOrIw8om2YhncPY8n/ECcZuWbXZiS2JjhgizX1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NZucabaMvBsv1XlEeoYgzW6wQrBX85q20tSfJ3I4lU=;
 b=AsgypTlR2rAq1B/xkZkouu+KsdPoR5bbBhnLhS7WC3MYhb+6e8j3sZIUT/85uLMple77OC5T2IyXLpFED52GlkFZM7npK/tK9tNx/+ij3L+gs3DCKh5vpHHRAsY3wcO+vRJxnwtYj13P90DGJwHoH5WhSKMfhNSF3yhZBM5KzMQaHvsaATaPOH6LeR3iEfw8PDnUindhyY4JuuCx2AXOxbqsfoSIFhHcC/iMJggbaprfDoDxFo4fYVuXvVBasT7HcO9vCHWm+HNK2FfPwLFZ2z6cJczSqO4WaR+2mSsTYL9rfQsb3bXR2qHW/Lm+WdwS+zcyiVozlsCuHYgjga+pXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NZucabaMvBsv1XlEeoYgzW6wQrBX85q20tSfJ3I4lU=;
 b=PuiKK0Tb2URfJtQOwWaGF6MSK3f72bWuYk37ch9TfX+LgDajBogwnHjRxxDse1N7p1iHzScE3zJHoUgzkCivGOi/vSIY4YaToA/94qR0mj/berpgdXXHzdn4L000FiLuRtDf0egpWb9Y1wI3V8t18uOWzfUMdYrBszo+jeXslISDJBQL8aSeHoiHI8PxZj4hVPe20uBE8J+3xugeA823VVf4Bnjf23uRnUGnwXrYlaE615ahhO2sqKkZexjySupX2H6w1lsj59AmZSBeshoA80jZue2IEK133FkC0IBeTdeVbPBwkzSGWu+Y66MxJuL9VdTxbmaYLERcLR4IORVJkQ==
Received: from AM6EUR05FT004.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::43) by
 AM6EUR05HT169.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::203)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Thu, 25 Jun
 2020 20:17:06 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc11::52) by AM6EUR05FT004.mail.protection.outlook.com
 (2a01:111:e400:fc11::227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Thu, 25 Jun 2020 20:17:06 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:598F18DEEA5079EF55387EF43BD7D49B14CA5F4BDD9D78A9479E973533998128;UpperCasedChecksum:E45FD58E4FCF61494279B554599CC3CCE8C0C6370694FCFB13FC14ADDF064095;SizeAsReceived:8802;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 20:17:06 +0000
Subject: Re: [OE-core] [dunfell][PATCH 2/2] runqemu: add QB_ROOTFS_EXTRA_OPT parameter
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <20200625201309.11441-1-kweihmann@outlook.com>
 <161BE290B27F77BD.5977@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB68813E32630EEFD1767D0AF3A8920@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Thu, 25 Jun 2020 22:17:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <161BE290B27F77BD.5977@lists.openembedded.org>
X-ClientProxiedBy: AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::29) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <109dbd8c-daf7-04b7-c95e-a45c900089b3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.150.47.161) by AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23 via Frontend Transport; Thu, 25 Jun 2020 20:17:05 +0000
X-Microsoft-Original-Message-ID: 
 <109dbd8c-daf7-04b7-c95e-a45c900089b3@outlook.com>
X-TMN: [ODGFSpyGLHpFlWs4Wv4F1GP/8CMncnT2]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 446db4b4-b3b2-407e-969a-08d81944bb04
X-MS-TrafficTypeDiagnostic: AM6EUR05HT169:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	++OSI9Q4h7c82CKicv0PHYybr4Tx1gWE43anLfcrbgTMJOe9Ry9/mK4Id0Rsyj2/5V1ny45Gk6Q88PxUv8cf78lfM+78FAITuRl4XflMvpaaq9UjKY7AIRuS86kFe28VWToG2oxJY3XVhJx0DwwBpYTyRpgQuVjOyPpRgYxoTV9J0kOMBPj7RD84xGRypEE2Qn6rbPMrJeAAIo0XjR7zDQyPctLo8Y67kUb4RRkUTIKJm87vYhUUNtMkKF9UOBbz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	kxorps1pJeJ2Z0jhu0RyQyczIZRlRZ1r4ZT9YM7HI15Uev9QWUwxG99ZO1FsSg6mxmSCy5j+Bi4UV+9AUre7JnkMlp7yYudhQAc5j9xhcc+HL8yRqFiROJ8iatwXOasMInng9hxjawn0voC+raVqdQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446db4b4-b3b2-407e-969a-08d81944bb04
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 20:17:06.0847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT169
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

I'd like this to be backported to dunfell, although it's something in 
between a bugfix and a feature addition.
These both patches will unblock the usage of wic images in combination 
with testimage class, which I otherwise would consider broken for this 
use case.
So I really would appreciate if they could be merged to dunfell.

Thanks and regards
Konrad

On 25.06.20 22:13, Konrad Weihmann wrote:
> Content of the optional parameter will be appended to the rootfs-device
> in the qemu configuration, in case QB_ROOTFS_OPT is not specified.
> By default this is empty.
> 
> Example use cases are:
> 
> Defining 'readonly' when using squashfs, so multiple instances of qemu
> can share the same base image, something that cannot be done by just
> specifying 'snapshot'.
> 
> Defining 'bootindex=0' which helps to get past the EFI shell in
> ovmf-binary. This also enables the use case of running WIC images with
> EFI bootloader through the testimage.bbclass.
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 8361b47d7ff190f84e8bd81507cde01d74ca7c1c)
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>   meta/classes/qemuboot.bbclass |  5 +++++
>   scripts/runqemu               | 11 ++++++++---
>   2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index 54044c38da..99da543f9a 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -65,6 +65,10 @@
>   #                   " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
>   #                   Note, runqemu will replace "@PORT@" with the port number which is used.
>   #
> +# QB_ROOTFS_EXTRA_OPT: extra options to be appended to the rootfs device in case there is none specified by QB_ROOTFS_OPT.
> +#                      Can be used to automatically determine the image from the other variables
> +#                      but define things link 'bootindex' when booting from EFI or 'readonly' when using squashfs
> +#                      without the need to specify a dedicated qemu configuration
>   # Usage:
>   # IMAGE_CLASSES += "qemuboot"
>   # See "runqemu help" for more info
> @@ -77,6 +81,7 @@ QB_OPT_APPEND ?= "-show-cursor"
>   QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
>   QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
>   QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0"
> +QB_ROOTFS_EXTRA_OPT ?= ""
>   
>   # This should be kept align with ROOT_VM
>   QB_DRIVE_TYPE ?= "/dev/sd"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 6a77e3db9a..310d79fdc5 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1196,6 +1196,10 @@ class BaseConfig(object):
>           else:
>               self.rootfs_options = '-drive file=%s,if=virtio,format=%s' % (self.rootfs, rootfs_format)
>   
> +        qb_rootfs_extra_opt = self.get("QB_ROOTFS_EXTRA_OPT")
> +        if qb_rootfs_extra_opt and not qb_rootfs_extra_opt.startswith(","):
> +            qb_rootfs_extra_opt = "," + qb_rootfs_extra_opt
> +
>           if self.fstype in ('cpio.gz', 'cpio'):
>               self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
>               self.rootfs_options = '-initrd %s' % self.rootfs
> @@ -1208,14 +1212,15 @@ class BaseConfig(object):
>                       drive_type = self.get('QB_DRIVE_TYPE')
>                       if drive_type.startswith("/dev/sd"):
>                           logger.info('Using scsi drive')
> -                        vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
> -                                       % (self.rootfs, rootfs_format)
> +                        vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd%s' \
> +                                       % (self.rootfs, rootfs_format, qb_rootfs_extra_opt)
>                       elif drive_type.startswith("/dev/hd"):
>                           logger.info('Using ide drive')
>                           vm_drive = "-drive file=%s,format=%s" % (self.rootfs, rootfs_format)
>                       elif drive_type.startswith("/dev/vdb"):
>                           logger.info('Using block virtio drive');
> -                        vm_drive = '-drive id=disk0,file=%s,if=none,format=%s -device virtio-blk-device,drive=disk0' % (self.rootfs, rootfs_format)
> +                        vm_drive = '-drive id=disk0,file=%s,if=none,format=%s -device virtio-blk-device,drive=disk0%s' \
> +                                    % (self.rootfs, rootfs_format,qb_rootfs_extra_opt)
>                       else:
>                           # virtio might have been selected explicitly (just use it), or
>                           # is used as fallback (then warn about that).
> 
> 
> 
> 
