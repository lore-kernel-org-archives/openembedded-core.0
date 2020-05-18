Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.110])
 by mx.groups.io with SMTP id smtpd.web12.40234.1589803968051864429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 05:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=AYufCIXR;
 spf=pass (domain: prevas.dk, ip: 40.107.8.110, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4hSpBjnGQnDggUg34zksv0flbbjJRQXnTHG1MbThGEwKHhXpbh4R0Kxnu+4aN5VM+9csquHPZK61hWHf6L/PEAn9pmu610r1qz9OPYLv/SMC7Pw/TsGn/lAyB9D5lOYSOXRKXlK8V9r3qLvD8RTJrnS55196EhCMw0Ys6r9vmuTobRgS9/SvKshsrBWlkl0lZMwHgNh1U4QVg/wt/3CuUUAb3qgdT8HsSHlzwd3PDLu0WynKIIuGos9DjziY77pImItbt1P9QOj2vE1MLRlpRzQC6PCTw/5+XCDnYjls9RGmOv75NZ31f8WbNnPTFAQUusVud2/4p3pkKFOSj5Q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI2UGpmpYpv3lwxW4/pIgGl4pa5e38oUnkoo2kcW/Sg=;
 b=YbC72lOlgXozMTr30Yvn/aUx/j/ZSckOB7i7P4YZxPhu2LRPYVPFr4ScnLRopKmWhB9KwJx7nm1LObMrSEz7FoDDrOqnFEvugNkKVIyMoVqUBNblSgdkfKUPwli9h2UI+adpssD03G1/sNESML1Z0jciyGuJNlT4AM5Hn0/ggaC+UIWUjRjJxSAe6QRZYTs9G/regHCR75vQyw/CaKgJxotQ5yBnZ9/D3j7JBI9Io4myVLcZMigMd6346nNMdOuUYi+OlO+cZJ6oEnt3Bmpm0N5eeZ5rpiSXjubx+AfibA1XHMZlJbIJFwWd5mu5fctH8XMpamCLgOLf0CLtn/on7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI2UGpmpYpv3lwxW4/pIgGl4pa5e38oUnkoo2kcW/Sg=;
 b=AYufCIXRXY58es6JQ3PgrSFOvrJEhxr8NcTD1Z+DEet8Ogs5SRkdoyhkuRG86PfVyeRHEp7R+JmFcl37ORU3v3YIS7J7G4b+nnPglf6ykAB7yhW7LncVw4BVMV0LqG3cRo6xyMkYL0ga/rjsjf6mHpeVDETbAyDfmpp30vu/JpE=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB3743.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 12:12:45 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3000.022; Mon, 18 May 2020
 12:12:45 +0000
Subject: Re: [PATCH] glibc: move ld.so.conf back to main package
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>, Andreas Oberritter <obi@opendreambox.org>
References: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
 <CA+chaQdZQRYMwbaAdE-TE9SNuJpwO=0Z6Qy7SR6kZxN7kpJ3qA@mail.gmail.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <0397befe-9f5d-a704-be07-00926fd3fffa@prevas.dk>
Date: Mon, 18 May 2020 14:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CA+chaQdZQRYMwbaAdE-TE9SNuJpwO=0Z6Qy7SR6kZxN7kpJ3qA@mail.gmail.com>
X-ClientProxiedBy: AM5PR0601CA0053.eurprd06.prod.outlook.com
 (2603:10a6:206::18) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM5PR0601CA0053.eurprd06.prod.outlook.com (2603:10a6:206::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend Transport; Mon, 18 May 2020 12:12:44 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ab1fbf6-dbae-4223-f404-08d7fb24c5a0
X-MS-TrafficTypeDiagnostic: VI1PR10MB3743:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB3743D61772A43B23A9B426E893B80@VI1PR10MB3743.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bWRsEfmGY4Cw5h7FxTRc0+dl83THPzb0IrP5VUrx4XBB76/rM/OiJJpgmkAkyUU2ZgXHNjHcgUxFLHFqu/vXUtGDcnz3+8Tofp+HedipILDwfHdy9tQrSw8gbniq2WllOP3JqEFtSS8xzzhDuz9huGVJeXvJcVDxDeb36L6k3ZXhl0yaO/McMQeTxEHRP5/wAiP8gRG05bEElek4yjc9zt2Fvc74lDEIBgn9fy68Y9svjS1SuC74V/38KkwDpdhqnZhptyXkJGhkSviucF0jtMJuxD+I/LPVIL/bLJ3elA6JuyDB9wbSARqvpWb0qipJ20qDEu6QBw9HYo2rFskQdut+D2guibg/VQFdu0dyzzCs0jpMS3p+o87riTwLQOXrCdw0OZSGGan4CjV74ZnJt06ASBZDla898JqpDa4WYssIzIKMWc7OTH/CFIDDFipeo98S0ax39c0USMPZ9iZyKZD6hd2WWmduth9VfV4t8JTpHcmvUe3S/TyzlcXE42gh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(136003)(39850400004)(396003)(8676002)(5660300002)(54906003)(86362001)(36756003)(66946007)(316002)(6486002)(4326008)(2616005)(956004)(2906002)(31686004)(52116002)(16576012)(478600001)(31696002)(16526019)(186003)(6916009)(8976002)(26005)(66476007)(44832011)(66556008)(8936002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	pTtO6B1BQvJ+Z1cKLwnGK92d6RcYgUiUydgCeM/MnEQBh09ZkllXA95lr5GjIKm+bBV+we19e9gPoR18w8q4uRRJ7DvyglKne51+xyANTZqaLxKX3VB6lxX+4jatJxB9vg3UuPPy1Jwv79IFqlYx//hgkhYqew9XWTPnBkC8J/tIya83OvxN9K49pMkayBfGcxdNJ5pGumu8Yb8J55SoGwMFeoa5MXPv5jb5ZqTCCJriqq+BJTdJVkhmTEZW8R7oYzTOYCEHDERTWXpG4LKwlxJ8xw4vByre51qWpDul7YNZwTJ+J8uyvJhJzhy/8wVtIwmx9fGywwcR63HLlXzhZbHrP50skKt3OKTayo559Rkx6Bh1u1t7PR5QhJcV2nPyYBbHmwWLjOD4IpnK/momJ4Apv6zdO0i/c/V3dZ9IhzzGDV6Y8Vzi8GKtdkZ5h5vjUlJ6sxH0oHYfL0eLrEosPlNkDebj+K/ovDjL9F+klgw=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab1fbf6-dbae-4223-f404-08d7fb24c5a0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 12:12:45.0298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhn6qVHmalWJVxrmN0ZYyEjOnh5GKa2YzVdS4kh7kwH4MSYYM32V+EPhXWqW9asxrbKRmkZb4SWVdP3FIespCEQPvMyDtCPakLRAl8z15ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3743
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18/05/2020 13.55, Martin Jansa wrote:
> This won't work, because as soon as glibc is upgraded with package
> management, the ldconfig files will be restored and there won't be any
> do_rootfs hook to remove it.
> 
> Why isn't ldconfig installed in your setup in first place? RRECOMMENDS
> should be enough to pull it into every image by default.

[At the risk of sounding like the lady in the Monty Python spam sketch:]
I don't _want_ it in my setup - it's a gigantic 700K binary that is
useless on a squashfs rootfs where for obvious reasons no new libraries
(or new versions) will ever appear. So no, I don't have ldconfig in my
distro features (so it's not even rrecommended), and I also don't
install recommended packages.

I just need a ld.so.cache built at image build time. Which works just
fine, except that the drop-in dir gets ignored due to lack of
ld.so.conf. After ld.so.cache has been built, the configuration files
are welcome to go the way of the dodo.

And I'm not removing the ldconfig files if ldconfig is in distro
features (or if someone has explicitly RDEPEND'ed on the ldconfig
package), so there's no issue of those files getting "restored" - if you
have ldconfig on target, they never disappear, so them getting replaced
during a package upgrade is not a problem.

I'm certainly open to other ways of solving this. But can we agree that
it is a bug that the ldconfig done at build-time does not take
/etc/ld.so.conf.d/* into account, and that that should not depend on
whether one has ldconfig-the-binary on target?

Rasmus

