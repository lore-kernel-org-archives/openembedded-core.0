Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web12.5850.1631703136552713144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 03:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=dymnU3iZ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.85, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wqhipor6YaKB2Efu5ApGszU35YsYyT6Vib7p9kr4ytp8t/E5OiGzPC0f5/68lvAUCZIe8ZCcaV4gS2G17+QPMeFn8Bktm9AicCr1wpdi2Q8dISM7huhqfOFqmR5Zw+xxBtWNuOeqTjChYeu36oO0BwrVE3o/VMNlvEApwSdmPZ8vmc10CKfeRMIP32ytvmfre2c7+53ELln0vZanMVLPdN7O1Ji+H5zHj2BdZ53k9ZtfJqFZHkb2c+/C8bY8jaVCPCCLq+Tvr4ZnKnQIl2H5T8i7Jc7Y+kuCVM5UI/+n1CstmonIxowf5YjOeUu7tV2gupWBS5ruT1y/7CobEG/fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wE5q41J9OFjV7PTnFFRuV+xNhx2CFmS7met8oyFuqGk=;
 b=I3vYR0d78zVTLfikxpT4T54tCK4nYGWMI8GkNQD0rxmWCKDF7mI9nKe3x6OzzlDBrE1a6f+ZAI384idPKwL64VD0EdF3mIya+RbrP6Uz0BlFc01xGuWNZXbPo4eXA0zK19QzzMPUOK5uh+ds9fCym5qW+Q+7bUiQ9rABOU2cz1ExlgYY6doCqn8N+lHtH6v8Zgi/iTGfVY5Hi2o45eVXEwByRIyXT3+VntBtzruEpqCEeSO1x0fDvJRKRR1ESsRkgI8vTGAdVmp9NeMTw+/PoWfTppaxXIeUhAP91T4BiGzUeeudSmHIXgP2WyGU8Ci0Y1WM2Oas4ZJ0eNe+iebmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE5q41J9OFjV7PTnFFRuV+xNhx2CFmS7met8oyFuqGk=;
 b=dymnU3iZ/DNNdbQENGLKK5IYwKnNa80nR9e8p3GuV+YlOpE8x17zuVkCoP3DVJzR3LG73MjKIKuvvXB9da8LjziDuQJEO2YX8i3OsTg0BnErKeFJMtBRm21G9PhMW+IpUGsn4Vye7xnCrX7++ouJc4JyEuEt2V7nAH/A3zwjU/8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8276.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 10:52:14 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 10:52:14 +0000
Date: Wed, 15 Sep 2021 12:52:12 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-skeleton][PATCH 1/2] hello-mod/hello.c: convert to module_init/module_exit
Message-ID: <20210915105212.u2rrkryn7vc7vaqq@fedora>
References: <20210915003804.34746-1-twoerner@gmail.com>
In-Reply-To: <20210915003804.34746-1-twoerner@gmail.com>
X-ClientProxiedBy: AM0PR06CA0116.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::21) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR06CA0116.eurprd06.prod.outlook.com (2603:10a6:208:ab::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 10:52:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c49c51d1-74bc-4721-e31b-08d97836e0af
X-MS-TrafficTypeDiagnostic: AM9PR04MB8276:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB8276FEBED6A071B21447261CC2DB9@AM9PR04MB8276.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IQ/CMIuIxiHK+cYSlLujOwMcKH00QLimn0Hw/kjVYnmssVvWgQNTvtKaDnkZPxmTEj3eJYTK4QrqsqNjvxnlUv2Ke/PRTHEb+G7Pi1HCe1I1pRfkA4LZlod7O7HbXpbxOUzHskhJ+dwlVzM/+5k6CqwjyqyN5pDHXJLbhEN1PvWJypJnxqZjyK1uZbBGNR+rs9TyPqA4OLDnIMEd3kW5LUj8NQP+MpFCYSd5WRhG0yHKNDilV2YwwR+z+YHzqRc8rhDkxah+pqWp+oAKiYiXR+UvEkfKZbHoUuN9syK9MsHX5q68LRD87dMtb3L4rylHxLU0hLJZt6lV9HMu6qstVmiX3foIywOJkSUiBxw85L0d/jFgk3X8deaRHEJLcxvWp2kesUbnHv0w50UK4EsV1TNG/2yRBq+0QSV3OTdv/eJNXti4SEiJvsze8caRS+A2L1QcVjaD98Su5815f85723e+hLLomRyS9kgpZDiM8BGhyKoiUjyZdwcyIrq+ECY3tBmlgrR6woyFc0cb/vCk1r28h+IRDCLA/JoOPLOkw5wNRz/1Qi/Fq6x0o3T1ktm7IcZjadcjbt1XDVylae0vY413BhPmj44kayfUzYwGSjUPXNhYePTi6BM+kzQvRk0K79/QTnqJ+GJTxfOOE3Kv7tQ2A9VrtW7ku5rG+8tgsW8pC34mEzjUHStwb3wI37SKACgAq+b1o3MqcQPxpHv+Vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39850400004)(346002)(396003)(376002)(4326008)(66556008)(52116002)(4744005)(9576002)(44832011)(8936002)(2906002)(66946007)(6916009)(478600001)(9686003)(38100700002)(86362001)(6496006)(38350700002)(26005)(33716001)(1076003)(8676002)(186003)(66476007)(55016002)(5660300002)(316002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8+HzqU3bhAJcG0urHJRmMUYQ6yFBdn21mQRJrK/h9g1+HgmTD3JPA/q7m7N9?=
 =?us-ascii?Q?2tLMajJqkonoRYfL8yj/bShx2vLMYpk2tNttRlwm8OgUYh+f9CKpdoGjToi3?=
 =?us-ascii?Q?weYcQ+gZdghfvTw7pCGwBS2MEAvTY4qyT8qFKSxsB2gncbQ4LP5ooZn+TnR9?=
 =?us-ascii?Q?ZZq+8KKA0fCqWSewmgaE4dLVF/r8einbDae00/I+RRQe21Q66b+4VHQGLeoI?=
 =?us-ascii?Q?RQY31pMXe3E9279MDiwaanXAquqEwRFEiDW7UNKSjmkNOLuutntOFbh4kl3T?=
 =?us-ascii?Q?P0HwXl9qlwxShTYeJnwEdwW+L8UMt5/TPoKfxPHlhnYlI/wkTUKG+UrnzmG5?=
 =?us-ascii?Q?fkT7EEp/Xojj3KdQzeuR1aeIp9oJ/vj0V1q4mw8Er7q2+8Y4U59iJy3cXua9?=
 =?us-ascii?Q?YUrbSPOOB1CsmrqCxl5TShPjGkb8YmRH432IUbX8Updq9EodiZs4vvPeTrt3?=
 =?us-ascii?Q?/5cGlyjIzb3yJs6msg3EAXdzizMO/bhYVdtmcrPwR8E60mjIY9w4WzA8hXvy?=
 =?us-ascii?Q?Xv5j7yRrII3Jhoxea4WPSGvyRc/XiRbPtkLPuKQxpE3reQBhNnvCps72ZaTB?=
 =?us-ascii?Q?vmDVzN6m7VZu6JQFD0MHfavgaVv7JB+nmWPhj1cr39B0CubiB5JOEfAHJ/5C?=
 =?us-ascii?Q?Bq7uxQk9hp09dsLikkU2zx/PebhzejIUMZ0RhUQhIqzFUd34zRK8cQxI7JMW?=
 =?us-ascii?Q?7t6AJ8L3NI+wJ3sLpHiZCDgw/Fy6rfBLq9B+E79I3al2mezbzsz1wbH1rRyw?=
 =?us-ascii?Q?FlCADZJ4JYYMNDF+qhJDKIqBO2CYkyYKaA0z6cB92uk+CdeDtX7QmSgWjDlK?=
 =?us-ascii?Q?mUU75llkUunzC1uhkqZeGP0wXazK9I9GDltyTpEP4wfYpKa8WuiZY+Q0CSTA?=
 =?us-ascii?Q?IbZjY+m6FKGDu/bEf9uYqV6ja6G1942oqQ4bP3VWQ5VczhNM8aEZ3KoCWVAB?=
 =?us-ascii?Q?UeJVSkwKUxr2gQUazcmntR91ugCOwbhIyNM/D5V+o7gQaMmkpuA4HxuR11+e?=
 =?us-ascii?Q?+gjwD5sNjCODpn6Iw3wQ0E4HyvIlEqS3Zs+QDPlxRX9y5EI4LqOuv/96exvT?=
 =?us-ascii?Q?R2L3aGPpl+Up/Eaf0Ny17UmwMazn8DsEXGhe+qO+4aH0Ois5GYQ5nHHdl3K3?=
 =?us-ascii?Q?Zp7t/65+EGU5RG0pCCri4hu43k+DTQVag/RP52q89Yg1ra4NbF1itil6qbzb?=
 =?us-ascii?Q?8sEcXWgob4etXcMGVL74/GlgnwveD9I2USrnfyt4fDOxvXB5wNqvgCZWwdPM?=
 =?us-ascii?Q?4f1rgZnHn48av5y1yVB5zXlcFTgd4PfrvW7YGOYW37fCek9t38hzQmf612/S?=
 =?us-ascii?Q?oyMNbEUc6yvxy2zb33KAW0in?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49c51d1-74bc-4721-e31b-08d97836e0af
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:52:14.3625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gLUAlaJbJt3bY1XF4ACxwYdSsa3oI8RnYZ4pBnxya43TlXiyJmv2DgJTbIvONcwq583jKkgLdV70e6mRCHkSLtRSjkt/oCNqCunTmj0UQqv7bAdrZPvPu9KqETPFKw5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Trevor,

On Tue, Sep 14, 2021 at 08:38:03PM -0400, Trevor Woerner wrote:
> Switch away from the old init_module/cleanup_module function names for the
> main entry points. Change them to the documented method with module_init()
> and module_exit() markers next to static functions.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
