Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.81])
 by mx.groups.io with SMTP id smtpd.web12.15811.1592221447055088675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 04:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P8Oh9Mii;
 spf=pass (domain: windriver.com, ip: 40.107.244.81, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZAfOBx6KSE2bmn8xpXEj0b6woc74GVmum7vKMUQASE/cN962kIn7P8G89Iojctv74itU6wi6T8al6Ie9KpzzivNYoylfiiMYQEz07B4k50gYzZRrMx5Ajh4dsEeblkxBC1FNiihymkv1DwIe8+wvNVBMZr47oZFDmUGvY+W/hxFqhbQI11mODvzUcTazJ5FODUBSWnOsB1ukWkGXURAhiD8TFu3pdYCGoXyWxLwPj5VYqo90vFnKLU1TKsJXKBm+gb2wT8DhNf7IKSpqoyOfgvRilyyANwNfTzMgmngYYKl8XivcXZzn6YURm71zPip9tLna/p3S0agJnOWYY0mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S8e5vLZW6EevDqq6drsd0ZQwO0yCZ0vsmlNhb/LtpY=;
 b=bADW56SWqOoQA6xFY0RKKd059ijUB3WhMN/2NI8OPq4zN9E7aJiEeDEum/T3m5nTQDrfuMCicpLyOoVxGBFrKUX9LoIQSoYVwzpQijbUy+nPUkSA8dxe1gZYMa34c8zVZwmjk9PGqu3xmZrsnkbeWo7xTdpTdMthRJh6KSJUb/xPXy4Z05Kbr1gRdY3bS/lTcTYIs5tR93Gm4k5k971vJ9diOhPsW+b9BPGj+qJMkj7X3Uy2rFpmEcCXQ6v0xnwBfiaO+q7xSCzRlInbwa1ohdB3TczHLTdAgK5pEmVqdAE9stGrBhps0bc/2NrhYuc2VBl3fWdpYDqC8Z8PnMTgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S8e5vLZW6EevDqq6drsd0ZQwO0yCZ0vsmlNhb/LtpY=;
 b=P8Oh9MiiGZ+q33VB2dPVrwPpqO/PfJxttFs2a9pjDitljTKoages03HJc0GstVJVTEe2BSwxIuid4I9maCzNPedJyhsjJX4HgBVZe/LvjzpNGZ013L6Z802WK/jitKPVZzEaWeQLWsF22thAL9xSqfWk0bJjkI29NJA4xEWmRCs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Mon, 15 Jun
 2020 11:44:04 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 11:44:04 +0000
Subject: Re: [OE-core] kernel: update rpm failed for the vfat
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: He Zhe <zhe.he@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1616D997B5533366.13968@lists.openembedded.org>
 <cbb726f7-954b-bdca-66fa-6ab9996eaa1c@windriver.com>
 <CADkTA4NX63Fgs-C23z8=uFmxsaR4PQY9WsRFNJk2jLHt6g47ww@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <e7f82bd0-9e1c-2e0e-bd81-f820f9bfc975@windriver.com>
Date: Mon, 15 Jun 2020 19:43:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CADkTA4NX63Fgs-C23z8=uFmxsaR4PQY9WsRFNJk2jLHt6g47ww@mail.gmail.com>
X-ClientProxiedBy: HK2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:202:2e::32) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR06CA0020.apcprd06.prod.outlook.com (2603:1096:202:2e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Mon, 15 Jun 2020 11:44:03 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02bbc1b5-f3c5-44a2-da25-08d81121678a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB367197566D6C6DBA25F770DFE49C0@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q7xrBsacXZYSmKnZjh6c1G76GS6PaN6BWm3JFTj1zywMbjxs6rdK1+Xk9wck4FMSO49BsqndwaM5/zmvKSy9fVX9xxnecfjDRMB/9L+fUNGkQNbwey2FVtVvbufaTj3B0uFp6uBZu8inwJPoI6OVWSICSsuVEyy1+oFV6rnWA1HM7aF353Ch5gXrZS7pRAnr5FMfGXPmqRkE86DmUbnaFKSuEI2xjLc8ehMpPg4icwzffxwsEApIk2FnkQkWwA/Ik9+mIbotA9+ViruLUjHmlB0RadqJqIr4DIN/hcDdRLalxXVCKSegKr7GvmzPC7QvJ6qVw+A0YqR0tQhi/lhT3BNBDQAgXaAeJzE02GZhpJnESzTlajILXfUtIgqKSlMV1zK0b+b8hNsBn7LGvNjnkEEnoEWyF8/9WIumIaw0KP1ld91RC6GG0dbHdSRIW4RSTWR9qJdTQrO9GHeQ/tOstsqnPXuLDj+DOou6hJC0tUUaRLBfPFF1ke2So26Cswy7juc1ORitRgjxHT568xhc+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(346002)(136003)(396003)(39850400004)(8936002)(31696002)(186003)(8676002)(53546011)(66476007)(66556008)(966005)(16526019)(4326008)(2906002)(478600001)(6486002)(26005)(6706004)(66946007)(86362001)(83380400001)(6916009)(16576012)(15650500001)(31686004)(54906003)(52116002)(36756003)(2616005)(5660300002)(956004)(316002)(6666004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	C5QaJvvNF2iT0OGgVDPztLreB+Bu6BoQMNVcl2sVJXVSI9qmogRvnP1Z1QG1cStQo8lTLB58wI+6937JvMsXhnU1ieF0JvebmL6UfjhfVz+JP6pqPGjEekED07j2OELpGh+pYIjtR0pBEViFRVx8EialEcXegV4bkail0giWgooRNEBN9M+qLzgarmPNPT1YdfqfhdIM76Dzd4pX2W/Sc4CbU/724Zw1hwPiJYpfu1vwwGpHHIEvYrEdO6HZRKFo+7q6Dwvu+4VelDTWN0oGMs7aeo+jPJsvRaN9TGSGqk4IjWAAAGnlYAyhDYeAQ6rn1HBHbfA6n6S93saqX6C6rWrjmzqatYvXLiy8eAIRw47Cwh+t7G7ImuZRjFs6FhPomafxpf553ZLl8lTGTkAKENzNkGOWrBqX7ljs1Lf9PO51HXhPvmBGFpDoRFdI2EfImTB7zUYZHoO8gBSOhxJW48Z52OjovnWRRKm+AaQ3x5o=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bbc1b5-f3c5-44a2-da25-08d81121678a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 11:44:04.4589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/X+bO3/fyiYAJGNdzWYw74rheGvfuuvvSfhyW1HRE/t80tpuiAdpO3LM1BnlyKj+GuELDd8/cGaBvxxkkzn+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/12/20 9:27 PM, Bruce Ashfield wrote:
> On Fri, Jun 12, 2020 at 3:47 AM Xu, Yanfei <yanfei.xu@windriver.com> wro=
te:
>>
>> Ping Bruce.
>=20
> Hmm, yes. I did miss the original message.
>=20
> gmail isn't as effective at highlighting messages that are to me (and
> also to the list) as I would like.
>=20
>>
>> On 6/9/20 6:32 PM, Xu, Yanfei wrote:
>>> Hi Bruce,
>>>
>>> I encountered an issue that updating kernel rpm package will fail when
>>> the /boot dir was mount with vfat filesystem. The root cause is vfat
>>> don't support symlink.
>>> --------cut here----------
>>> error: unpacking of archive failed on file /boot/Image;5eda8385: cpio:
>>> symlink failed - Resource temporarily unavailable
>>> error:
>>> kernel-image-image-5.4.43-yocto-standard-5.4.x+git0+f8c88c4331_9961cc8=
b79-r0.bcm_2xxx_rpi4:
>>> install failed
>>> root@bcm-2xxx-rpi4:/boot#
>>>
>>> Currently I have two ideas to fix it:
>>> 1. we use 'install' cmd instead of 'ln -sf' in kernel_do_install to
>>> avoid generating symlink in kernel-image-image*.rpm. And then add an
>>> postinstall to this rpm. It will check if the /boot dir is vfat, if no=
t,
>>> we remove the copy image* and make a softlink for the image.
>=20
> Note that for this option, you have to make sure that it really is
> done in a post install or you end up with overlapping file errors in
> scenarios where multiple kernel packages are installed (i.e. an
> upgrade).
>=20
>>> 2. we specially add an package type which doesn't contain symlink for
>>> the vfat filesystem.
>>>
>>> For the first idea, I met an problem when I try to add
>>> pkg_postinst_packagename function in kernel.bbclass file. Due to there
>>> are not package name variables defined for the kernel-image-image.gz
>>> kernel-image-image or other type kernel images. So I can not add
>>> postinst functions statically why that how many packages and packages'
>>> name are not certainly.
>=20
> You can still generate the package names in python, i.e.:
>=20
>          d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,
> typelower), 'ln -sf ' + type + '-${KERNEL_VERSION}
> /${KERNEL_IMAGEDEST}/' + type)
>=20
This is a piece of very useful code!
Thanks for your detailed suggestions, and I have implemented it basicly. =
=EF=BC=9A)

Cheers,
Yanfei


> that's from a patch that I've had locally for a while, that deals with
> kernel upgrade issues.
>=20
> Any logic that deals with this really does have to be on target,
> otherwise, information about the image (and partitions) is leaking
> into the packages, and you'd need to carry specific image package
> lists for the filesystem layout.
>=20
> My suggestion for the post install is that it simply try and create
> the symlink, and if that fails, then do a copy. That way there's no
> need to detect filesystem types, etc.
>=20
> You also need to ensure that you test the kernel upgrade path, since
> with copies, you may end up with more kernel images around boot and
> not get some of the implicit cleanup that you get by simply
> redirecting a symlink (but if you are always copying the active kernel
> to "image", then simply overwriting the target will get you that same
> cleanup).
>=20
> Cheers,
>=20
> Bruce
>=20
>>>
>>> Do you have any opinions about these?
>>>
>>>
>>> Regards,
>>> Yanfei
>>>
>>>=20
>>>
>=20
>=20
>=20
