Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.77])
 by mx.groups.io with SMTP id smtpd.web10.9601.1585753882466603829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 08:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=siMB4fs3;
 spf=pass (domain: outlook.com, ip: 40.92.75.77, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEN6KRttAr+8pXcX8qpr802f4sF6KLnz9k2JsVQ4bjc25LS6e9N9jgdPRCh+ZBllVWfDtq+Wa4KJpoAiufl9gB3FBBd6P+Y94E8rkN5eNlioDI32FeBjwrh2D0PKaqwO3dTDlPMIHCVyjP3eLX4oyAD0JST4c84hI8RAjVzRZfQ/ib5Ma011AzZF8ErXL47vX0IjRXfBrSc2KqfLKx/DwgH4AdT8+cSjeZg+X36qyiYsA1d88tY4OH2CmtoJvxLSnKCieDqk4fIGhqqy++Ki3l3WMNnwFx7wcLVsUtaVQ+lUFiPM8z2Cax8+2NfN75aFRExXYfKHjGzLTIrl4k3Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYnzt4mwSk3mgilx4EmYpc9K4VoOqJyMpw9ShuDUiXY=;
 b=hQePdudTa45+4Oxh8uozYMqjIQEad5MCVBmSoYEnE6QK0rjzlNv3549QSB+aagbSoHsUbnbi7Snk/G1zJF8nY9CnRsCTEC9sAf5vX7PptnHENH+iiCcJkc6Ak2i1jSa1os/L0sqHDpIesZpZolKLqubAeZobP2q+jAkIv83Ws6rB14Ia04AHvc8dzepg7afCFPpseDP92MDDL1ju5dR+NR3Hw/3xvki1sD98Zt7m7jRVjA5iOkyiMQhrQC6WAzATZoBhpZpMwsDIkYKitlAnFmJyzRj4AGI9G1HpzUnEQxkkmEzRHuA6iLGh5t+2NJYtmQC5p+PXSo1fdxlKe8+/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYnzt4mwSk3mgilx4EmYpc9K4VoOqJyMpw9ShuDUiXY=;
 b=siMB4fs3wpM9WMkdRBzCxHRthWVi4VGMtsE8aQiaDlA56CMgYu62gVOIF3NSaH18UfDy7kSEeUxfxX4ZWgs1D/Z5zUV6k0AdeIqc1dPcj6gTB9e0f6nGXFevw5gJ/HrZWS+U1d6WfNQhmcx+ivuTI+YDC7k9v1hCcpefrHgCNHYS3kY7rUK+/NrEVgoj/NKQ6An2pvJyJbPJHxNI8Y6MLF44ls/b1IOyyPjFUvEFgAJ9lykaxNvDmm6wleVKMnmy5MIjsuacy/MzWTHSVS/CY5lvZCNJIz4lPso/3aOYs2nkVRP+fn6JMKqHk/KHXFUO6ZYlFlUbD+rcrIm8mbSlVw==
Received: from DB3EUR04FT019.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::42) by
 DB3EUR04HT095.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::186)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Wed, 1 Apr
 2020 15:11:19 +0000
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com (10.152.24.57) by
 DB3EUR04FT019.mail.protection.outlook.com (10.152.25.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 15:11:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1E93E6480BD275D94ACAA35965A55B8BF99487DDAF711837149DDB85D1E247F8;UpperCasedChecksum:EDB23DC41D5D62D3524E74C3177704F45001401E468C2DF2E4E34779BFF5C7B0;SizeAsReceived:8619;Count:47
Received: from VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131]) by VI1PR05MB4286.eurprd05.prod.outlook.com
 ([fe80::e1b1:4a5f:7dd7:4131%4]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 15:11:19 +0000
To: openembedded-core@lists.openembedded.org
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: oeqa: testimage.bbclass with EFI and wic
Message-ID: <VI1PR05MB42864DC8B61A9EBC70B45F19A8C90@VI1PR05MB4286.eurprd05.prod.outlook.com>
Date: Wed, 1 Apr 2020 17:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
X-ClientProxiedBy: AM6PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::38) To VI1PR05MB4286.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::27)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <0b24f5e3-a68d-9f1b-1eaf-93b844ea9380@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.141.94.21) by AM6PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:20b:2e::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Wed, 1 Apr 2020 15:11:19 +0000
X-Microsoft-Original-Message-ID: <0b24f5e3-a68d-9f1b-1eaf-93b844ea9380@outlook.com>
X-TMN: [ULLnwbZ3ruRjyPQRh29wkmo+u/nuRINM]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b163144f-8777-4a8c-f8f8-08d7d64eee91
X-MS-TrafficTypeDiagnostic: DB3EUR04HT095:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZyReC7mXQdZNYw9ETzTIwjPcb4CAZSsjHLCT7Z49SbAahlY6IcEueOzpcUDxclMO19SwqIMLV4ghlmATV6WeVJkGKQsEoL7PHlGUOt191yGUXax1SumSp2FrA4MMbZ+7ZGBQqmOu9HbvvW/HrYep+DTyeL6PDGV6MymG6z3c6lNioWxhdjALrakq673ZNMeZ
X-MS-Exchange-AntiSpam-MessageData: 
	2haKM5+HgrZXFc40NvGQOsKCHpOg8o/OmZbz7791Y2dXAMimaRXT19lTUW0URq2iSoquAg8JRhpxAp/6uzk7J+FiJFViD5oKPbTR34/iKJO5qKqH1qI5cFqFe+a5TBwdcq582OKaa8eTCLzFCOEr1Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b163144f-8777-4a8c-f8f8-08d7d64eee91
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 15:11:19.7419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT095
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi all,

currently I'm trying to tailor a solution to make testimage.bbclass use=20
wic images with EFI bootloader.
As the code internally is using runqemu, adding the wic and ovmf options=20
wasn't that hard, but now
it seems to be stuck in the bootloader

That's the log:

[2J[01;01H[=3D3h[2J[01;01H[2J[01;01H[=3D3h[2J[01;01H[2J[01;01H[=3D3h[2J[01;=
01H[0m[35m[40m[2J[01;01H[=3D3h[2J[01;01H[0m[37m[40m[2J[01;01H[01;01HUEFI=20
Interactive Shell v2.2
EDK II
UEFI v2.60 (EDK II, 0x00010000)
[1m[33m[40mMapping table[0m[37m[40m
[1m[33m[40m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FS0:[0m[37m[40m=20
[1m[37m[40mAlias(s):[0m[37m[40mHD1a0b:;BLK3:
PciRoot(0x0)/Pci(0x6,0x0)/Scsi(0x0,0x0)/HD(1,GPT,3B615D71-1C90-43E7-8B1E-50=
B8684C27A9,0x800,0xBD94)
[1m[33m[40m=C2=A0=C2=A0=C2=A0=C2=A0 BLK0:[0m[37m[40m [1m[37m[40mAlias(s):[0=
m[37m[40m
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PciRoot(0x0)/Pci(0x=
1,0x0)/Floppy(0x0)
[1m[33m[40m=C2=A0=C2=A0=C2=A0=C2=A0 BLK1:[0m[37m[40m [1m[37m[40mAlias(s):[0=
m[37m[40m
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PciRoot(0x0)/Pci(0x=
1,0x0)/Floppy(0x1)
[1m[33m[40m=C2=A0=C2=A0=C2=A0=C2=A0 BLK2:[0m[37m[40m [1m[37m[40mAlias(s):[0=
m[37m[40m
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PciRoot(0x0)/Pci(0x=
6,0x0)/Scsi(0x0,0x0)
[1m[33m[40m=C2=A0=C2=A0=C2=A0=C2=A0 BLK4:[0m[37m[40m [1m[37m[40mAlias(s):[0=
m[37m[40m
PciRoot(0x0)/Pci(0x6,0x0)/Scsi(0x0,0x0)/HD(2,GPT,74BEADE6-EBE3-4773-BB1F-6D=
CD513A6BA4,0xC800,0x2B69DE)
[1m[33m[40m=C2=A0=C2=A0=C2=A0=C2=A0 BLK5:[0m[37m[40m [1m[37m[40mAlias(s):[0=
m[37m[40m
PciRoot(0x0)/Pci(0x6,0x0)/Scsi(0x0,0x0)/HD(3,GPT,41D81223-0D78-4BD4-BFC8-D8=
C233C10C69,0x2C3800,0x2B69DE)
[1m[33m[40m=C2=A0=C2=A0=C2=A0=C2=A0 BLK6:[0m[37m[40m [1m[37m[40mAlias(s):[0=
m[37m[40m
PciRoot(0x0)/Pci(0x6,0x0)/Scsi(0x0,0x0)/HD(4,GPT,6FBC37F2-D83C-43DA-91C5-A0=
2396D224F7,0x57A800,0xBB8000)
[23;01HPress [1m[37m[40mESC[0m[37m[40m in 5 seconds to skip=20
[1m[33m[40mstartup.nsh[0m[37m[40m or any other key to=20
continue.[23;01HPress [1m[37m[40mESC[0m[37m[40m in 4 seconds to skip=20
[1m[33m[40mstartup.nsh[0m[37m[40m or any other key to=20
continue.[23;01HPress [1m[37m[40mESC[0m[37m[40m in 3 seconds to skip=20
[1m[33m[40mstartup.nsh[0m[37m[40m or any other key to=20
continue.[23;01HPress [1m[37m[40mESC[0m[37m[40m in 2 seconds to skip=20
[1m[33m[40mstartup.nsh[0m[37m[40m or any other key to=20
continue.[23;01HPress [1m[37m[40mESC[0m[37m[40m in 1 seconds to skip=20
[1m[33m[40mstartup.nsh[0m[37m[40m or any other key to continue.
[24;01H[1m[33m[40mShell> [0m[37m[40m

On the bitbake console you'll see

| WARNING: Qemu ended unexpectedly, dump data from host is in=20
/work/test/build/tmp/log/runtime-hostdump/202004011124_qemu
| DEBUG: Stopping logging thread
| DEBUG: Stop event received
| DEBUG: Tearing down logging thread
| DEBUG: Sending SIGTERM to runqemu
| ERROR: testimage received SIGTERM, shutting down...
| ERROR: test-image - FAILED - tests were interrupted during execution
| DEBUG: Python function do_testimage finished
| ERROR: Function failed: do_testimage

After removing the tcpserial option for testing the boot continued and I=20
could see the kernel being booted.
I tried a lot of different options to add to the qemu command line found=20
in different mailing lists, but none of them is able to make tcpserial=20
catch the correct console.

Did anyone ever tried such a thing?
Am I thinking in the wrong direction by trying to attach tcpserial to=20
the framebuffer device?
Or would it be enough to just skip the bootloader shell by either typing=20
some magic command or just by ignoring something?
 =C2=A0-> If so can someone point me to the code where this is actually=20
happening?

Thanks in advance
Konrad

