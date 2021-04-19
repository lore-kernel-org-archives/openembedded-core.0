Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.50])
 by mx.groups.io with SMTP id smtpd.web08.4466.1618804369495102602
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 20:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nPiVmA85;
 spf=pass (domain: windriver.com, ip: 40.107.77.50, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ognn2M1mImacCyNU+eDPGk89dyDw1iqX2atwpGGXiwor/k0RR2Dj8h7g8DlGSKwjz0IyQoQ+N6AUOoYP3h/BTBOfy5YN1I1nJX79DoF+lJkL2YoWtjzTyOVd3qF7c3RarNv3CnWDBF3GSumj72XvbUw9ekWIOvW9zjzMa5ArH58tmUa9Osk2o6i9DCH2Nty2AhM9Zgbqv3bVqU2XGcS88im2uCb9tSZ02gV0hsxlbw3al1WrXJE8LGBgGGf2+UbObBW7ZfU9VG7GtgxWo/vLJO9wInE0REpXVqXPW69331DEnXOFOBJzWjgDF132SSNfIlhjlTI7vb0eqYK5LBVK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWfMwxidoMRd5ZEPfU4VjNoXXoV6chWVln4YThR01h8=;
 b=RPBtADsVly4lIPXwpK6Kp60hjGHZ0TFNcFik5vNGDkpOi8nRq5cYQ8C22X91TUUCI+3TSHKpk+2Yy0KtI0rHIgx1hlcUw/Rs7eApz93rqd/Ztv+Z3ndb7xemrboAqXjM7d6yqtVJLQ4NIwBvi1+asbM29D0FNeWpiJkise4qo+7j5akOM+Y5SiqbHNsKm4sxDWALeFPPPES7A9sQZojVPwcijdh6b2UGBADlo3Oo5Isrdq+dRh8vPwjdK+jpUg17sTDhNYuH93XUKZAj2PSYTSCmUAJY05Z5MjHQeVY6zNVFoQGIWkgOMRBEarYOsXw0PWWn2iwUanTm7DIqmdeFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWfMwxidoMRd5ZEPfU4VjNoXXoV6chWVln4YThR01h8=;
 b=nPiVmA85Lj3idy5wEoy8jTpg4JxyTNzOoSqg9MgTbeGtHgNgOfRJ9Odn4v816CDEtURBJXmeSm0S02t+md5scsxJ+KEhGUcCswJF/ZGlWULVBAwHa7e9A3okt3KLpRZBjm8eKVJ5RsXNaxFaZy5fYcKflC6EAAryOAwBjTZ5HT0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 03:52:46 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011%6]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 03:52:46 +0000
Subject: Re: [OE-core][PATCH] parselogs: ignore floppy error on qemu-system-x86 at boot stage
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210409090329.3177554-1-yanfei.xu@windriver.com>
 <b98452fc42b604fc8e2c0593d58c125efc0011cd.camel@linuxfoundation.org>
 <1675A5CF675C50A9.32393@lists.openembedded.org>
Message-ID: <1f6581d4-e4fb-6040-4787-fac9af30082b@windriver.com>
Date: Mon, 19 Apr 2021 11:52:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1675A5CF675C50A9.32393@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0021.apcprd04.prod.outlook.com
 (2603:1096:202:2::31) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR0401CA0021.apcprd04.prod.outlook.com (2603:1096:202:2::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 03:52:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eed73819-5cd9-400f-4b61-08d902e6980e
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB38948C20CC4EC3A1A5C27DEDE4499@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xBL68LJKI+G7KsjFzM0cxdPk6EHwlRb8BrAUHbng5MlTmx/G1DI1vQeEEht5V00CmBl9pKHd03Ro46xkSClUuCvPHvhqHYfiymo7OMTGm24+ifNwjL95kdjI3S0CsFPgJynuWjjjeyDllW8CIEzoEzRDyR+Ejrbk2uP9marclcXZ91axYqPBlRzNCflwMiPxqPEChzZCy5jJPj2nVaA7yMZGSMuVRY71u/pDwTU82/OTsouozMbmbsiU12ElWcWfO9EEtIRgkAeHD9lecO2mL7FBF3RJXct/Mm/eekxm8e1jA4vO2H7juMsUVo8FFhnh/0C3kTErGi4i5n+aM1FXrqGJz+XGLb5RTKujFnJq1iILduoP+KZzE0qnzANz/mAfLgPnYvpCMWUns3xlbX5cLF9yr/NKTpp8Yv/u7Bvf9ccx3A4xzrL8MoKEmttqPXqCux9Ebcw5uY4S0AeQHPHyianXslwJ412RXsBHt4Y0X00O1hmLeKwHsYRhHRrgeWCbvIFU0pnX5DUVdTzrE56t+ef6pmZOS3LlMMdi3U2GVheO+JwVLCLWxA9MVSBW1yRWJVV4toGFIA0qoOVErLhNeY49fOo25T3YIdpwcbRs2F63O8uh12NX7T3O2dsSBfIJ8y94LGch642HQ6iY1VZ/4MJNORMOGVU3j+WomE68T2PZQ5Ask5ht03C9OaXEdcMY74wAHU7BXqpAXyzMRmL9kwbWneAM//SNVMpIflwgIU8QlnO87F6sYP88BDQ9sXMD3ZFZMMjxouSzboB5szx2O5Nsqg0qjd4vvYCr1HFCI/XTypyzQeT0/F9lH7x7Be3K
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39840400004)(966005)(2616005)(31686004)(52116002)(53546011)(26005)(2906002)(6486002)(16576012)(8936002)(38350700002)(36756003)(16526019)(316002)(31696002)(38100700002)(6706004)(956004)(8676002)(86362001)(83380400001)(66946007)(66556008)(66476007)(5660300002)(186003)(478600001)(6666004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?if+hx9cXr4EEVf/73cWgAkCnleNXQhCJBTX2/BPGApWAan8JKd2rfisICul7?=
 =?us-ascii?Q?0/uIfTQWQdPYhpmLTylexdBFRtx9xFPiFQ/jFJxHBSGQi4Zhbjilxzs1tUU3?=
 =?us-ascii?Q?IKF2bP5tHCIpBqPYfyT5fIO6seM1fUSZet+waIXqcb6Ni4WdRFJsAM1zdGLo?=
 =?us-ascii?Q?wTJpLU5ALPjSjU9+rhLh+YSpuyEDnP7OK8AQi4LKpud3JCsYlsrlOj01G+Uo?=
 =?us-ascii?Q?3YbIeD4EWMTSS/AfUklqHC0J3LVSCxstFivnjlqjwrsQhOTytj7QTV0jomGS?=
 =?us-ascii?Q?hv7WBI07RLs2U/imElbyaP9PZ0FKmjrwxfxK6sZUG5Kf5H+BYy6xNDYQZADC?=
 =?us-ascii?Q?YoHYWag/V8E/Q1eaGoRK126lXSwnvX3Lim+Zs3JOjZ6hyY2oQqwM1agziDbf?=
 =?us-ascii?Q?WmeWFjSxyNGqyr05nxsuowPpXNgjvpIKLeTLIBF9IlyNIGieGWN/6JkBX67K?=
 =?us-ascii?Q?MfT3nw+SIYvLfNK8AhEefIlJXM1xZhFfWtBZQ6xx47ingS9aF/k8Qqg6gjm9?=
 =?us-ascii?Q?hjc8q1Wx79Esjy++2hNVpYQtWzijLExSy9APHDCWebTbF7KGkdDUJQTOmuHc?=
 =?us-ascii?Q?Vp+aII6K8M6RX5j7WkVp7ht6bt/W2lYZcPOzesoukKA6RQpDGLLxLMHGfu22?=
 =?us-ascii?Q?aXYq7quJyXWh/s39gOMhpVoxM+yld+HO+9mgzLpV3QjVqXGSAatfSMRFvOl2?=
 =?us-ascii?Q?Or1vChNATit9cb29sgjQyoVWgeZMIJnFCe+IgCnTpxJy0E0XVkPxGDVYUHGH?=
 =?us-ascii?Q?MsiJMD76i1+Bd36pF342Vi4Qr1YM+BYa2sbIIvVenop2wtJteyoGZxkyIXf9?=
 =?us-ascii?Q?yvB9nlx4txIFVV7G1q7gbKF68M3FZt3SDzbsX0xRHeBmmSe4MurlAOskDfNj?=
 =?us-ascii?Q?eu05UN9h0nED1nR3GMP3VaR/j+HSLDjSAgAHJiyNxaHsUJbRZYmj0FROKf7U?=
 =?us-ascii?Q?KxFyRhy/p5TYpfEuiyM8mMiDent0l2QfmvIj7gs8DaL2NnHIedwVBMa6VUYS?=
 =?us-ascii?Q?/KIY0l7kFgmtbd8JFogbPZ4Jv7sBVi7ryrXw0N0igdZPMERwwV8KtvKNDXrk?=
 =?us-ascii?Q?TFdPrjdb9arPxhf0ESnfXm5Z9OHD9nnBs4s8kX6/A1lvBHcnBJEHddeOqWrQ?=
 =?us-ascii?Q?HL+AxHh6hCL2BBCmuOhUzgcUL0aez4URlsvu4u/VNJQeGqKG2BTEEkRpwAYZ?=
 =?us-ascii?Q?3UAEit3zgTufjKTXWZoxWYS4zDdUmOnTy4Gq+YjZEuzavlVNOepTnnVV++q1?=
 =?us-ascii?Q?s4H9jsQKZ7DpncsA4Qcyi/X2+eovdab7ARBdRFaEBt53Y5ACWEcnwedIr4gB?=
 =?us-ascii?Q?sSX52R7E9CGl8n+11d+pPzUs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed73819-5cd9-400f-4b61-08d902e6980e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 03:52:46.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayKv4McRoxN2cHLe2DYsQuMvi+zzmjbwfsgN5z+oTyho+XFUDZGqGmFTZqwCRS//bMY/XTKkYBvgbzAlQCKZ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/14/21 2:32 PM, Xu, Yanfei wrote:
>=20
>=20
> On 4/9/21 9:13 PM, Richard Purdie wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> On Fri, 2021-04-09 at 17:03 +0800, Xu, Yanfei wrote:
>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>
>>> We can disable floppy drive by BIOS on a hardware, but an empty floppy
>>> drive is connected by default on qemu-system-x86. Linux usually detect
>>> the device and modprode the matched floppy.ko at the boot stage. Due t=
o
>>> we don't specify a floppy deivce in qemu boot arguments, then the erro=
rs
>>> about floppy reading comes out.
>>>
>>> It is harmless and normal, so we could ignore this error message on
>>> qemux86.
>>>
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01402.html
>>>
>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>> ---
>>> =C2=A0 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
>>> =C2=A0 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py=20
>>> b/meta/lib/oeqa/runtime/cases/parselogs.py
>>> index 4714741aff..1bb0425521 100644
>>> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
>>> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
>>> @@ -88,6 +88,8 @@ qemux86_common =3D [
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tsc: HPET/PMTIMER calibration failed',
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "modeset(0): Failed to initialize the D=
RI2 extension",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "glamor initialization failed",
>>> +=C2=A0=C2=A0=C2=A0 "blk_update_request: I/O error, dev fd0, sector 0 =
op 0x0:(READ)",
>>> +=C2=A0=C2=A0=C2=A0 "floppy: error",
>>> =C2=A0 ] + common_errors
>>
>> I'm a little puzzled about why we don't see this on the autobuilder.=20
>> Are you
>> configuring qemu differently?

Hi Richard,

I didn't configure my qemu, and I made a comparison between my and=20
yocto's qemu command line outputted by runqemu. There is no difference.

With the previous email, the error log did exist in yocto's dmesg. But=20
it's strange why yocto's parselog didn't report it.

Thanks,
Yanfei

>=20
> Sorry for the late reply.
>=20
> I build a poky raw project and do some tests:
> bitbake core-image-minimal -c testimage=C2=A0=C2=A0 //the dmesg don't co=
ntain=20
> floppy error, as the kernel-modules package is not install.
>=20
> Then I add IMAGE_INSTALL_append =3D " kernel-modules" and use systemd to=
=
=20
> instead of sysvinit. The error appears in qemu dmesg.
>=20
> [=C2=A0=C2=A0=C2=A0 4.879016] blk_update_request: I/O error, dev fd0, se=
ctor 0 op=20
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [=C2=A0=C2=A0=C2=A0 4.880255] floppy: error 10 while reading block 0
>=20
> The log=20
> tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_=
boot_log.20210414061409=20
> is attached
>=20
>=20
>=20
> Best regards,
> Yanfei
>=20
>>
>> Cheers,
>>
>> Richard
>>
>>
>=20
>=20
>=20
>=20
