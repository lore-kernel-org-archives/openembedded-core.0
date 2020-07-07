Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.57])
 by mx.groups.io with SMTP id smtpd.web12.13853.1594119974411071490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 04:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector2 header.b=Zz79fjnU;
 spf=pass (domain: vaisala.com, ip: 40.107.1.57, mailfrom: hannu.lounento@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlQk81sqeLwSJToQ01tqe4ePh4Cy6rC/GS76ysb9YeXL/DqTXhkEbIsIOtFFADAUtAr7FdV7ef4LxQSmPJ/jbQ0gl6NOMm8/CuW4As8928xWlBYE7Ky5HeldjfkU1msgqB0sME/JD6MSS+Fz0rn0EQQcHqJAvMKuLjX0su9a34UPdC+ru8ViWCMhk9eiGBplntzloOY29TqmNUe1f2u43JARVVFsqfGFXVHfk2JEajuBi9o+49ZAuXMjdadP+N+wt3l+V9sos2wawYcyffZvbXuY8CS1faGFo37xr5IhBVICdjzYEcQ2YSv9QTDdWDJwG9p8bEp8lhg8SqLS+tTBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc8sfkdFGiGx55oEygJtxdpjOlcrwgwrFodqXOQAwL8=;
 b=TohNpA/aLnAtOQ5Gh88xcfR/1EZfHxAci0qCYZ5ZBsplbgEJW5Ir5MlHe++OOurOy9UevgCaxJLUtya9uHcQLiGWyeXFs35SRIn5vAO4AcoLoau9mi8YHo3S3D7cxAU5NsSQ4pDvkFK119ncHCouzl09iIPgYtox7RxgISsP95QkxZY1hnpM7IfOHWstXqwopjmQRYTPLanz9Xwu0l/NlFwEq574NTtMHOeEUJTYWBaUg5yutr3kS0HElbnzXy79HcWw0X9yHg9iNldm1HK7LEHNCNJKDNbm4g2JO0UtMcqzspStrFzjht4JdHCzhI51g0tRQ5FdFXuzv6u2G3TJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc8sfkdFGiGx55oEygJtxdpjOlcrwgwrFodqXOQAwL8=;
 b=Zz79fjnUTHyPcg1+AjfRXKit6BLWfoJDLGoR/IPvxTWbb0yfjzYodMG/QFH1Z7thOsvNjq1vX+f6vKX8RXLprRAD5mqobynPCHHakqodtMqE0phX2AmpVERDr1RMolB3nqXsNcAzi7Siptge8JlIFEp2M1PIcZPURJo5OOpTddI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from VI1PR06MB6639.eurprd06.prod.outlook.com (2603:10a6:800:18e::14)
 by VI1PR0602MB3277.eurprd06.prod.outlook.com (2603:10a6:802:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 11:06:10 +0000
Received: from VI1PR06MB6639.eurprd06.prod.outlook.com
 ([fe80::f5ca:52bd:a228:68ed]) by VI1PR06MB6639.eurprd06.prod.outlook.com
 ([fe80::f5ca:52bd:a228:68ed%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 11:06:10 +0000
Subject: Re: [OE-core] [PATCH] openssl: make ${PN}-bin rdepend on ${PN}
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200706152325.4075747-1-hannu.lounento@vaisala.com>
 <f929bc5edd891a8ae06736b423f95bdf1c240d59.camel@linuxfoundation.org>
From: "Hannu Lounento" <hannu.lounento@vaisala.com>
Message-ID: <51cc5d44-db7b-1ead-4b07-0c4b12465117@vaisala.com>
Date: Tue, 7 Jul 2020 14:06:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <f929bc5edd891a8ae06736b423f95bdf1c240d59.camel@linuxfoundation.org>
X-ClientProxiedBy: HE1PR0102CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::27) To VI1PR06MB6639.eurprd06.prod.outlook.com
 (2603:10a6:800:18e::14)
Return-Path: hannu.lounento@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-r90xmr7m.corp.vaisala.com (83.100.46.136) by HE1PR0102CA0050.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Tue, 7 Jul 2020 11:06:10 +0000
X-Originating-IP: [83.100.46.136]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20296e19-76a5-4e0d-ce4c-08d82265c185
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3277:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0602MB3277361A1C04A4FBE308619B8E660@VI1PR0602MB3277.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dr0+usbAneupO9fr805SPYUb+4bL/ihXQb9n9mpy6E/NMSzUlnWcJZPFpqgS5YwcjMl7UyEIeJpOsLrY3togcoILQGlqUC4/iReqdQj1i/03eI0Ikltw+vVs08otfSJVGBYZFoRtxo5ECNN0n7PN/Gp/HVefkEoKqVwTYB+QNXeNC67v+Ry2nZheFxomNvHqJ92qjpObkqXok3Gh+LVzi71VjKl6ZKagjQoEpgcbZDtN32+tnTVOuRksn1vQn+aG2j4cggY7TBCHryk+6h/NRCq4JHAW1SJmHLCx4CqPLK/HXhSUnm7zvUmXdowpfSXOxC4vlV+IyPAOxm5Zn5BRk9HE5d4lrL1vFufh8yL5CvgpD4vYDcTDYNfw+VhB5alMDAhVdcaCxfwNQyatetL6zy+pMMAHyx8xbe8x7Bq4kWx6DrLcYeNTbuJEbxpJiDRNlkJdjDYFbuJdyZmbnpk66OMFWJY+xLNOYl0rQzw6714=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR06MB6639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(366004)(39850400004)(136003)(346002)(966005)(316002)(8936002)(36756003)(478600001)(86362001)(186003)(26005)(6486002)(53546011)(2906002)(16526019)(5660300002)(52116002)(31686004)(7696005)(66946007)(8676002)(2616005)(31696002)(44832011)(66476007)(956004)(83380400001)(66556008)(228453006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LGnbZ/JdlvDNbr1b+qKaxEPeBgyGBUrXoTf+zjYZQY7fIGgpAD44lQDTLmP6mKJvvMfV9Bc4Fr/W3IMjmPAVLsBSgdwf+6UOEsy8ONoSDz5/G6X2BRScT09DjfUNclmVOnCcwCnmWbRTI3OPr2lAu9RNBReQrZWcBGPUbk1igRpBIK8NkRXg4SdWZDsRlXSEVgk+VH1/9Qq8C7gXUA4Uha+MVZLTPwGU0Zmwc36lqQL60UwJtBSyTneHg6HHJFqsvAhUkTKKDTGhMSsrdVqvp7Ag1XOEj0YAQrUr7Y+58iB3MVUU4msEiLhPxmGoUpQUAq5241ePDjcpSNFx/UdtaZo84eeE5sPbEhSIe7hnS+II2C63ah9oakdNOmQROLNZUfLAObb9y93HCBM7fWLGZ/UWEvJ11JXco+B+rP3ZB+jop9hj0BtH7A2CXrmryNrAU2ao+sT8ceQAgKLAEOVgEnbze/h1o8BgzBfm4Z6Kv3o=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20296e19-76a5-4e0d-ce4c-08d82265c185
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB6639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 11:06:10.7952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki0TGYIoNcbRjBbgtUXc9phNB2ppR0loeMpB1t6NyZH6ECh1k9tGbQ7EJV4MH8TEN+qotuOleUv63kV5BMhaKwxGo4PCgbyAZeQPj9bcFR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3277
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/07/2020 00:32, Richard Purdie wrote:
> On Mon, 2020-07-06 at 18:23 +0300, Hannu Lounento wrote:
>> Some openssl command line operations like creating an X.509 CSR require
>> the file /usr/lib/ssl-1.1/openssl.cnf to exist and fail if it doesn't
>>
>>      root@qemux86-64:~# openssl req -out my.csr -new -newkey rsa:2048 -nodes -keyout my.key
>>      Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or directory
>>      140289168594176:error:02001002:system library:fopen:No such file or directory:../openssl-1.1.1g/crypto/bio/bss_file.c:69:fopen('/usr/lib/ssl-1.1/openssl.cnf','r')
>>      140289168594176:error:2006D080:BIO routines:BIO_new_file:no such file:../openssl-1.1.1g/crypto/bio/bss_file.c:76:
>>
>> which is the case e.g. in core-image-minimal with just the
>> package openssl-bin added to the image by declaring
>>
>>      IMAGE_INSTALL_append = " openssl-bin"
>>
>> e.g. in local.conf.
>>
>> The file does not exist in the aforementioned image / configuration
>> because it is packaged to the main openssl package
>>
>>      FILES_${PN} =+ "${libdir}/ssl-1.1/*"
>>
>> (there is no other FILES specification that would match the file either)
>> and
>>
>>      path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_64/openssl-1.1.1g-r0.core2_64.rpm
>>      [...]
>>      /usr/lib/ssl-1.1/openssl.cnf
>>      [...]
>>
>> Hence make the ${PN}-bin package rdepend on the main package to have the
>> required file /usr/lib/ssl-1.1/openssl.cnf installed.
>>
>> Note that the openssl recipe has the comment
>>
>>      Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
>>      package RRECOMMENDS on this package. This will enable the configuration
>>      file to be installed for both the openssl-bin package and the libcrypto
>>      package since the openssl-bin package depends on the libcrypto package.
>>
>> but openssl-conf only contains /etc/ssl/openssl.cnf
>>
>>      path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_64/openssl-conf-1.1.1g-r0.core2_64.rpm
>>      /etc
>>      /etc/ssl
>>      /etc/ssl/openssl.cnf
>>
>> /usr/lib/ssl-1.1/openssl.cnf is actually only a symlink that points to
>> ../../../etc/ssl/openssl.cnf.
>>
>> Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
>> ---
>>   meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Perhaps the correct fix here is to move the config file in /usr to the
> -conf package?

Ok, I sent v2. I also moved /usr/lib/ssl-1.1/openssl.cnf.dist as it 
seemed closely related.

Hopefully the v2 is good because based on some quick research there have 
been fairly many changes related to the configuration file and its 
location due to various issues.

What I found out was that the commit 
4d3c79df13920b4f095ae12caf43e866318c3143 in 2013 moved the file from 
${PN}-misc to ${PN}-conf package and made libcrypto RRECOMMEND 
${PN}-conf. In 2018 the commit 13e0be4efc23fcc1a71adba1b6707ecf59fbae29 
moved the file into the main openssl package referencing a discussion on 
the mailing list:

     openssl: move the libdir openssl.cnf symlink into the openssl package

     The openssl 1.0 recipe puts the libdir symlink to /etc/ssl/openssl.cnf
     in the base openssl package (along with the libdir symlinks to
     /etc/ssl/certs and /etc/ssl/private). Keep the openssl 1.1 recipe
     aligned with that approach until there's a clear reason to do
     something else. For more background, see comments in the following
     thread:

 
http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135176.html

     (From OE-Core rev: 480335803928c95e7948f8c949127ccb5cbc7dbe)

     Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Additionally there were few other openssl.cnf related commits based on 
grepping the history but those didn't seem that relevant:

bd6052d9d1 buildtools-tarball: export OPENSSL_CONF for openssl
a842b02a87 openssl: Handle -conf package file conflicts
f9ad66da9f openssl-nativesdk: Fix "can't open config file" warning
c1ce0d9a9e lib/oe/rootfs: Fix DEBUGFS generation for opkg & openssl-cnf

A change related to the aforementioned mailing list discussion was done 
and reverted in 2017 but didn't seem relevant either:

7fe30a5df4 Revert "openssl: Fix symlink creation"
070f3aa74f openssl: Fix symlink creation

 >
 > Cheers,
 >
 > Richard
 >

Thanks,
-- 
Hannu Lounento
hannu.lounento@vaisala.com
