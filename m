Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.64])
 by mx.groups.io with SMTP id smtpd.web12.375.1592443019668768529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 18:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fsnabKW/;
 spf=pass (domain: windriver.com, ip: 40.107.93.64, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAq+G5tE4pl3YtdKj9p8qRICNVuMEcyVFkutYXuA/yxhp3zWPF+NbRxDyh0hoLE4pBxvCikaEnEQZuOJmCRadF0TndPYyRjF72qFwC4Cwb1I44aKCzT1ErPr1b9IVGZmqpeDjXCB3WpJVypKo1jl5789Q5n4sNPxGk6jOKi8zX5zZl7hCgbkMd6eSAwel+jnXSLmJSbVo3eoUFhRGr5kbLxGj4+YnzOE3Z/eIvJZyC/3mzvpFyM5PRDUjukZY4HAQ3JnAuU2XaotUr3QpeWg//YFCKLZSPAGvYid/y1apDwqVzaDGDmkzzyoU91II8qJqUEt/bvdUeLh/OpAFeiUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ+7zkcq3UTPPOqotEs1Adxg4GPGWMO9+TFjZfOeWtk=;
 b=dBzvZuIo3PGLAGVnKthijZyQCGsV1PQG3OGZiXC2rtFkP3p2XJ6NkVUfJ3WU6vAbJ8ZXzqgs/h+UTuUuCcU7jTps27op7UbXVK9+xyBW1WPluxddCzFzhe7/WAq3kX7KCTsI415C5AKJhd+5MxhqXFXjaaK3602NnIkmkw954llXb9Q8uS2Rbdh1770Idg4uIRKOk6RHn1teT3eKO/GwK/Fq0+V2CYO7Asf53tAQ8jarCx8wW+pUYYW/pJTVodEBBcyDs5VRcvMsDxrnTWqX/LZ7aUZw/c6s7KDlplYcxvD9Ioiwswx0soH+V4O8yACOI0hK08Wig8T1SJvGKifdBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ+7zkcq3UTPPOqotEs1Adxg4GPGWMO9+TFjZfOeWtk=;
 b=fsnabKW/nd9UVA0W/E8ZmOD2DT3FIOkKdf8fszLqgMmI8AmgYxtGjSeZvtgLoNt7xTXZ3av6KeQbxxxuZdvu4CJLQ0dYlHgAeEj9UORpuXQmJ1AHbHIs5YT2t5Mr4SyZY0oiffs9RiD/bzi1E8UdtIxZKG5cpfeCOhnqm/cjLEc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 01:16:58 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 01:16:58 +0000
Subject: Re: [OE-core] [PATCH] mime.bbclass: change postrm to prerm
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200617080740.1527497-1-changqing.li@windriver.com>
 <CALbNGRRQG_J+xDg_WLJ4a5rNngidU4AvcSRBm=Bt5sjjSZcx+Q@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <711e79cf-d374-26d2-c725-9352af2c9a68@windriver.com>
Date: Thu, 18 Jun 2020 09:16:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CALbNGRRQG_J+xDg_WLJ4a5rNngidU4AvcSRBm=Bt5sjjSZcx+Q@mail.gmail.com>
X-ClientProxiedBy: BYAPR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::15) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BYAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:a02:a8::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Thu, 18 Jun 2020 01:16:57 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a44b9a6e-f98a-451f-5fa0-08d813254bd6
X-MS-TrafficTypeDiagnostic: SA0PR11MB4592:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45928A959C204F588C5D0F59829B0@SA0PR11MB4592.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u9pFdxfDdotKhr7wzeOav8l85T7j8Uzsbhj95dTduPyE/XRVoruQkqb4z5koEIrApYXJHO0BH+mRWae/lEhL2mkahS0+X9gqUjY+TjE69iAxTU0XtyL2xFgDu0J++dubEOMn0HfBUs8DjdrAt7SGgBPDqjSwzUkB3Hev6vMno1kfceFMvpTxd1KS9b2naw020qcnh/b9w0XZHgiBwlaiguAZqbzB+WQaP8JJWdH7/LiXvjAZB9R4/YnVf0rdItxV8QWcHX6NLC8JTeC/PjLNDBqhFk9PXmQrZjjmezfa7LD8WgNiX2HmNJupL0mt9eX0yMOKUq+aOo+zw6RK4CPKMjQDzIG0Wi8gAQ+i0qnrYy9ToOueG6iXbmKhtJMatst3RvHzfXOjv7qVy31VhIdqwMQWlTSOBSd3VF59JloHqpVjxoTTF0RUuLK0AZFuTZh3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(366004)(396003)(376002)(39850400004)(8676002)(6486002)(36756003)(5660300002)(2906002)(478600001)(8936002)(6666004)(6916009)(4326008)(6706004)(44832011)(83380400001)(316002)(16576012)(2616005)(956004)(66946007)(66476007)(66556008)(26005)(186003)(16526019)(52116002)(53546011)(31686004)(31696002)(86362001)(66574015)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Hwfd8Lj2zTiV52qI0ypN8Uhq0wgkxx6zbKfWaByI0tfqBxFN1idx1ouAHkm74o7yHvMGw/X3C0E+HrK8z5ETVfkmqSBJrtd1FZ/iElhlBjFxGi9GrGMEgc4unKcrDt1qS9KjPUTCsDY1DokXI17CLYGIlK5lNOxx7LsIyL/FGFP0f5ONGV54Gvg2Kex2swbbEXqEvHJ2420ZtjtERv8OumTL6b8y1sj7d9mAfTMecPkQT8xPgKUu2nMCY4SSdGVNdAEYSb/btFzmUxbYg+14riBsPd2Cxf7LbTqvUWYWLkyOOswkzrmbpQNi9nr78Jy0/DfLj+7MtFDrAA5YEzrYtgrbYcVmO9Zp/10DbPX4GXgbAxagx8mdEJZ8Q831OKjryraSK/NyqB8nSAFQrw27s8yy6DepwLw7I48CA7rERE+b7oPNpMYRTfIJOIoBHlW6mcjZkNu8tm9DnODmP7MhMrO0V6OtIVDtuBp9Un9nk34=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44b9a6e-f98a-451f-5fa0-08d813254bd6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 01:16:58.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQft6b7LKMvCXXLdpzpjKxuVtqenMOE+U510YkOcZD7iqp5ZDcOlULVxVEdm78ru31z8TWJZ08F4SpmTwRMYyAIlhiKtzCzXo5BMzT9l/VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 6/17/20 5:50 PM, Andreas M=C3=BCller wrote:
> On Wed, Jun 17, 2020 at 10:10 AM Changqing Li
> <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix error during post uninstall:
>> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
>> + '[' 0 =3D 0 ']'
>> + set -e
>> + '[' x '!=3D' x ']'
>> + echo 'Updating MIME database... this may take a while.'
>> Updating MIME database... this may take a while.
>> + update-mime-database /usr/share/mime
>> Directory '/usr/share/mime/packages' does not exist!
>> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 sta=
tus 100
>> warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet fai=
led, exit status 1
>>
>> when run post uninstall scriptlet, /usr/share/mime/packages has been
>> removed during unintall, while update-mime-database need to use
>> /usr/share/mime/packages/freedesktop.org.xml
>>
>> correct by change postrm to prerm
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/classes/mime.bbclass | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
>> index c9072adf3b..a0943b4476 100644
>> --- a/meta/classes/mime.bbclass
>> +++ b/meta/classes/mime.bbclass
>> @@ -17,7 +17,7 @@ else
>>   fi
>>   }
>>
>> -mime_postrm() {
>> +mime_prerm() {
>>   if [ "x$D" !=3D "x" ]; then
>>          $INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
>>                  mlprefix=3D${MLPREFIX} \
>> @@ -42,17 +42,17 @@ python populate_packages_append () {
>>                       mimes_types_found =3D True
>>                       break
>>           if mimes_types_found:
>> -            bb.note("adding mime postinst and postrm scripts to %s" % p=
kg)
>> +            bb.note("adding mime postinst and prerm scripts to %s" % pk=
g)
>>               postinst =3D d.getVar('pkg_postinst_%s' % pkg)
>>               if not postinst:
>>                   postinst =3D '#!/bin/sh\n'
>>               postinst +=3D d.getVar('mime_postinst')
>>               d.setVar('pkg_postinst_%s' % pkg, postinst)
>> -            postrm =3D d.getVar('pkg_postrm_%s' % pkg)
>> -            if not postrm:
>> -                postrm =3D '#!/bin/sh\n'
>> -            postrm +=3D d.getVar('mime_postrm')
>> -            d.setVar('pkg_postrm_%s' % pkg, postrm)
>> +            prerm =3D d.getVar('pkg_prerm_%s' % pkg)
>> +            if not prerm:
>> +                prerm =3D '#!/bin/sh\n'
>> +            prerm +=3D d.getVar('mime_prerm')
>> +            d.setVar('pkg_prerm_%s' % pkg, prerm)
>>               if pkg !=3D 'shared-mime-info-data':
>>                   bb.note("adding shared-mime-info-data dependency to %s=
" % pkg)
>>                   d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFI=
X')+"shared-mime-info-data")
>> --
>> 2.17.1
>>
> If I understand this correctly
>
> * The error pops up once the LAST package with files  in
> /usr/share/mime/packages is removed. If not something else is wrong
> * This is not a fix but a workaround leaving mime db inconsistent with
> entries removed later.
>
> Andreas
Thanks.=C2=A0 this fix is not correct, I have send a V2.
