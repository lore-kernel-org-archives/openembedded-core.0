Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.116])
 by mx.groups.io with SMTP id smtpd.web11.37824.1600678743333074586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 01:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=V8V37/IU;
 spf=pass (domain: prevas.dk, ip: 40.107.22.116, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUNUdAWMTj7jXxz/5mkQaKI7otg4sWVuVMduXw/5ONrynMryrc1vOoVw4+u6Z+XeQwefcZ386AGzkbYSEyPfcB36GXmdWC3ufizCEqmC8iwjX8FQ3GcymkfpqTRfjSAlgolC5yicDpX1jIYftptW+7d26GifvF7s7r8hdwhO5bvpR4BRmDI/mqzr8ZkFi0q2mfaWIfLymxxK/J/hAzZ8FM03tJGl3cjxL6lWfJy+6aoC2eZQfr+8LBhGcROPKYI6M+x2plYVhSocmLKgA4raozbmCyhe/JyYSNAIWVaKucN9cPd8toFOwwpsDYAYQ8ZHoQUKIYoSgAPHeKe+gYnv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b59v+5ZUrBJzOYxyhKhxSTLNfuPpefdNtqka/HuCvcc=;
 b=ibBoi5xXwDUdNSwSlcChVX1CtAOSItfhn/9t4QkVMWfrYec03ML5PrERMu+YhlFC35ORXr18vunwPQIxXFGrMTVBTwUcZ6oepHJWs/9iVIlhrrinjP2eiH0mXmUtSov8W5QP6nT2MpPydUoPcrNtiOqq5A8FRt++DPa0iGNfeQwMJkX4cx4U3ss8/0uuPvs5RmhVUNw+/d7sl7R6FqiFkktK2ImVl5H57XPk69TqGngRJMOLIYgJ+GdaEJC6Ea6LOPi9DxT5DJqKai1Fxg9l2q05u1rZgwQRUv3Mr8LgzwuZTGgJGIJ+1Vi3DHleaU9mRa75eteGFZtwghAO91xhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b59v+5ZUrBJzOYxyhKhxSTLNfuPpefdNtqka/HuCvcc=;
 b=V8V37/IU144dlpPSaSXiYpQ3BKspwk0vpH1zUg0V04DhUoqRILWyGIb8UJ2RoDMMvO7A29JYhSRNqrc4Rw8kdDdjC+tnRAWCqLW+WjPRGt0gwqGoc6ekaNlJQJiGIqZwCF1d8eNO7J/5u/UoYBeFfX64124XgQP9/eYOtI4lqvk=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM8PR10MB4100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Mon, 21 Sep
 2020 08:59:01 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2%2]) with mapi id 15.20.3391.014; Mon, 21 Sep 2020
 08:59:01 +0000
Subject: Re: [OE-core][dunfell 23/25] kernel.bbclass: run do_symlink_kernsrc before do_patch
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Chanho Park
 <parkch98@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1598810890.git.steve@sakoman.com>
 <4425ddd70d77fa0b45ee08e405937ab5f31f16f8.1598810890.git.steve@sakoman.com>
 <CAPTzV15cU7POhAMFoPhqkCBT-9jsHJ_6z3XKWMPHF81dJcBz3A@mail.gmail.com>
 <16341EFF0D914A74.16354@lists.openembedded.org>
 <CAOSpxdZDfGUw_0b6DXpcfrhSUvMabYZjvV05P6UCEcXFJbQHHA@mail.gmail.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <0ecef1fc-578b-d22e-8790-bdbf41f0dfa5@prevas.dk>
Date: Mon, 21 Sep 2020 10:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAOSpxdZDfGUw_0b6DXpcfrhSUvMabYZjvV05P6UCEcXFJbQHHA@mail.gmail.com>
X-ClientProxiedBy: AM0PR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::14) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.132] (81.216.59.226) by AM0PR01CA0073.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Mon, 21 Sep 2020 08:59:00 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c51a8fd6-3068-4858-bad1-08d85e0c9534
X-MS-TrafficTypeDiagnostic: AM8PR10MB4100:
X-Microsoft-Antispam-PRVS: 
	<AM8PR10MB4100772E6AAA2BDF63C51111933A0@AM8PR10MB4100.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f8ztRGty3+geccadi0hWEXJXbRFpJ6GLb+2WE2N7qADYnE6kGIHYNnmFEy6wHDyQC4ASPIll/dPHOhzsTJsqkZ0N2eazKKYj7Kz1OC244OOHuqRaCTuO40dXykSCVDXTLjqdS/A6FHOjZkQpKhiaBPt6l5Se96mFtc/HfC87jewD0ZC9RwRy4Eojv5EQWjR7+JYcatAm73eUaCEY9X4fG8Q/YNUjEOYMXp0JbdqnfvK7R1pmYa5fMjDlyNa60K4kqmePDfM6Ey9FUWoQ55MFkdxkExWMCcCAROeGDMdfE9a/B3BoV6Kb+QLf5LQw8IGT/7VxNxkPe61bLJJ/Lw69OhOTYl/HjPXmKyFMduL4PPbUCMPZMoJRWJYwtpq4WEl1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39840400004)(396003)(136003)(366004)(376002)(346002)(16576012)(6916009)(52116002)(2906002)(26005)(186003)(4326008)(36756003)(66476007)(8936002)(316002)(66946007)(66556008)(8976002)(83380400001)(54906003)(956004)(16526019)(478600001)(6486002)(31686004)(31696002)(5660300002)(2616005)(86362001)(8676002)(44832011)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	zL52g/+emZ/WO3dBcO6SkF9PTptbaroTW/1w126KSZvScCfCEGHXj4mT8fJQdKWmwaQTTNGWEVfDp6dTfSvf6sc9gQD3rvTeXu1EBm18VElmfQ2zID/RfCIOIza9Xd1En85Vt4C3PfCxdpqeLXeWQKziR2h8WtdJ4Cv6AxZF7p6FJmiGMlYhSVlCj6Ccw+CNjop0uacFnybggTRtmJNHdOsm7nzGi+kw0DZHV4ije9wKuaKR2s+njGjcJ9gDYKhXHQf2Ccm6TFBqcNgqwUSIHFH1L1JL1M/Kxbk0bj/3sk31uGEFjEzzrIe9b0SWiJg+G5XU62KPUprbcAYxbjxqLIF5ree+uveVzvhBt4fYb9kLIePPsDoymx6L8EbGGYF0dUGRquQF46S/mfRoJvPtXvN6P/plu/vN1BM6XGY3SFCdUrYjv+N6vngZojT4Dw0tH8zMSLal63l5lK2hVsosB4aVq5pQ3M5HDBtiZEJXhzWOOQ0tqw5O51XlH5bkvOL4Q8GtG+cLHTH1mH5AAZetAepTXRQ4RLec18qhw1D2gPgNSFzciNR2ucig7vtg86s351AOob3Ij0rEFvgwGbHHwapnmHPt0yBHUdle7antbWZZkwpFvBdapURAXQQvBzOfO/QOQj9Zq+ubHTBmdr89cg==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c51a8fd6-3068-4858-bad1-08d85e0c9534
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 08:59:01.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mshH28MDLq/chBo9xuUanfGEhXTwZ6VfQUDtEj/8Lmk3+99ByfMQlQDkc4mhcrILU1F5eDt7CQu+QrIdMP4/DVcdUrVzWObdNTSrEiYWfqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4100
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16/09/2020 17.18, Steve Sakoman wrote:
> Since there is an upcoming dunfell release and we don't have a fix for
> this issue I am going to revert this patch.
> 
> When it is fixed in master I will reconsider taking this patch and the
> fix for dunfell.

Sorry for not seeing this sooner, and for the bug in the first place.

However, looking into externalsrc.bbclass, isn't the bug there,
considering the "if we delete do_patch, do_unpack doesn't run" fixup
done - kernel-yocto.bbclass has a similar fixup for do_kernel_configme.
Why doesn't that class just set [noexec]=1 instead of deleting the tasks
outright, killing all those random fixups?

But if that's too invasive, I suppose just ordering the symlink task
before both patch and configure should work, i.e.

--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -172,7 +172,7 @@ python do_symlink_kernsrc () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-addtask symlink_kernsrc before do_patch after do_unpack
+addtask symlink_kernsrc before do_patch do_configure after do_unpack

 inherit kernel-arch deploy




Rasmus
