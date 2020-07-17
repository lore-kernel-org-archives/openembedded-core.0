Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.72])
 by mx.groups.io with SMTP id smtpd.web10.6835.1594971410589994426
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 00:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DDut7892;
 spf=pass (domain: windriver.com, ip: 40.107.220.72, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg1GJ+Fe77krRna+Oe8u6aQdKDtfWHdY0KA2Y5HReQ9Z6tFsyOvKgKgNykYobtelWhC4MbGUPORbsFXll+/ixhtMFBg125TDnilHEMbR8OQWmRvCOFuwkLCdXBsZgi9IcuNtyeBjxsCrjleH9UVKyQ1WxZCX3skgdZdZo4gzn3Gz+0AV3nVUGfgRW6JbofME18T1leLsmLxKfEk50uvmbwwHbkboDL4XFfsyJp/VU6t4Z0cqmAp1FDphbhqrqwkcvP7g7YeqA8s6pbWd34DzJ7jHfBs5aELbzWjPIHitH1WCR5Pi/kEjmzAk8NGNifzonKX13XGEAxjpKm0xzwu9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kQRzqntiVEyPyH9PZF1pQvyeOlH5eI2QK1t/vXDrhQ=;
 b=FdGHKRFTipgwIQN/+wHEX9JAZGSbrxFSpuYUfWcy3BTVv9HOnOJnVxkovNc2cBiVR1Ra8XWYpKAHWVs5KowIFucx6U8omSIjnpathvWXqO1+lfRJlZzAtT607pvBbelYtBtOlvUNkZMZRLY5QNGoifFNRpcY76uDBJlPe3kQehPuCR9tTrnjHuQphOzJcaPkNCpmAFVran+SXr0S2G4wd6JvnUy4LqvtpCkEXopYaghD/MMJByNvXPDooAPsMeeGQN7uYhAvJ7tlLxtLjcUei9eOvuXVPhAaWeuQApy8Fg4gqbuwL7RmSZaBbeOHtj6bseh0bDX4dJQy5TcbcBj0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kQRzqntiVEyPyH9PZF1pQvyeOlH5eI2QK1t/vXDrhQ=;
 b=DDut7892oEI3ksGV6FAtd22mYQ72AWBf4l+k3O7ZzfYSpHS00CjvNLG7e1cqI6ObDt8lAI78r4K+qsG9pPYdkjiHJEPhTu5AH+8GQ5oPKr//9b1kSCc6dwQPohKMOQGVVcs+FF5AiIEGFBuwUDKZhHIWfglaj3MOK6qgVuxzY0s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3358.namprd11.prod.outlook.com (2603:10b6:805:c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 17 Jul
 2020 07:36:47 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 07:36:47 +0000
Subject: Re: [OE-core] [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200630094907.1396284-1-changqing.li@windriver.com>
 <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org>
 <61ba6f0c-0bb3-42fa-408e-c2396d5a2773@windriver.com>
 <CA+chaQc3oXSrbDYdWKRyFEbqn9oNHdeiAVexmzVndwcyYFEBog@mail.gmail.com>
 <100548f6-240a-4ba1-0aeb-bc301d066c52@windriver.com>
 <db248f93-870a-bff8-4959-29faa8fa7c28@gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <ae137063-cebf-8af8-383d-a707de2556ca@windriver.com>
Date: Fri, 17 Jul 2020 15:36:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <db248f93-870a-bff8-4959-29faa8fa7c28@gmail.com>
X-ClientProxiedBy: HK2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:202:2e::26) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR06CA0014.apcprd06.prod.outlook.com (2603:1096:202:2e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 07:36:45 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e88e7f4-be41-4e42-503f-08d82a24294f
X-MS-TrafficTypeDiagnostic: SN6PR11MB3358:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB335829EB8CB5906E43E5CF01827C0@SN6PR11MB3358.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TD2HUiIQkmlQBVxRhpJ1uAkAygsLo/4UX08ymvLTqoAhHsfrCVv76IrqmSjO9OB81Hqa++ZlydY3uzG29ko8y+HU1jRRWPZkwyWuAFa8Yo5J4VQVt+jla3iYCsP6pEHmExqqLWUwVCu0Td3PkgJ5BW5F1uL04t9Igef+a4y3erch5zyEh+BYfhGZ9jBSTKAzq8IXVW9BFSt9cqd7/54KPMIWy9fEyVjgH0RGuW4yKrDOncmfxC9q8LWNkshS942FZFhPEzdyFC4GFerDEznMx4Ehf2kjAXbpt2jNiBk+JdOPBOOQKrCFkCzGwPkRQ02e+jBfePice4TgB0OfhcElk02Dx1y11Wdg7gK1vzbtMszpPP0cJyYXb+c5w/BA3OJ4Nvb0TRU5PugUxavpAx2uCFicjXOt+LlpVVUuQMAPHGS5n0J7HyEzpeiUVkKX4dnpY0j84tliQpwgLvdihF9+DzUUpG738xFiYrLALGWKZK1A+0tckAs+BNB+uMixV03R0f5nVUwF7e608kATE1RRcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(39850400004)(136003)(396003)(376002)(54906003)(31686004)(26005)(6486002)(86362001)(478600001)(110136005)(6666004)(6706004)(83080400001)(53546011)(186003)(16526019)(5660300002)(956004)(15650500001)(316002)(31696002)(52116002)(966005)(36756003)(66556008)(66476007)(4326008)(16576012)(8676002)(2616005)(44832011)(8936002)(66946007)(83380400001)(2906002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4PXdlk9E/MZ6em1SToKOjA5TIeEvdVUWKGcvQAZRW2gwullhSqlFl6ISQ0GiD9GnK0+4CvA0n1bpjd78LY6VdCaep/xmRizPW6nC234ILjY+2xOALhHFT2JhyiwMT40MduSPdPjID9tH7RgTYalF7PNhgy2UiTkEQfUKG4M0CWxNUKvq2Ptp9CubZUaJKYmYyFeSqRu/Cn3rWoCdRGpiiURDpeYGnwZ+GCjscpCZaaW9ZudgCXjIn4JovTYaxML4Oh7vZEFBGhiEtyKMULEvRPRu8F1xG7QHWEZC+IhANJpCUOQVn3ht9/b+vq1vtbpYs2Z11r+7Gob1raQWzOkLYzyPGPiaOGiRf5PHuB3CJbqvUKp8GGW8SKpjzv8hdVgpn4qOKDQwOem7IPS87BEYwVPTQRxoY7DA/fXwCXPDOSj+/ZxpBOiOG2mWnExXJF0DuMFbjbIoOoajCpbwknNbDHUPgoMQv9f016E15OzjKFY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e88e7f4-be41-4e42-503f-08d82a24294f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 07:36:47.6976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZMvI2RE54JYPLfoSpWI4NO4JlxJBytoN5ESaN9Ifnkx47DyI4odh1yn7az2OYut8RWYiXLqmYDBhTiaxix3zVz+JNnKzaIMfkfY3YVtHGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3358
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 7/14/20 12:30 AM, Khem Raj wrote:
>
>
> On 7/12/20 11:03 PM, Changqing Li wrote:
>> Hi, Martin
>>
>> Thanks for tell me the problem.=C2=A0 Maybe I don't understand you=20
>> correctly,=C2=A0 but I don't met your problem, below is what I tried,
>>
>> if I am wrong, please tell me how I can reproduce your problem, thanks.
>>
>>
>
> since gtk+3 or perhaps even gdk-pixbuf is not allarch package being=20
> added as runtime dependency here would mean that any package thats=20
> inheriting this class and allarch class will have the issue Martin is=20
> seeing, one way to fix is to call it abi safe using=20
> SIGGEN_EXCLUDERECIPES_ABISAFE but since its a class, I dont think you=20
> can easily call that out in layer.conf.

How about add it in gtk-icon-cache.bbclass,=C2=A0 and check the arch first=
,=C2=A0=20
if it is allarch,=C2=A0 then add gtk+3/pixbug into SIGGEN_EXCLUDERECIPES_A=
BISAFE?

>
>> Here is what I tried:
>>
>> bitbake adwaita-icon-themewithout my patch, and then build=20
>> adwaita-icon-theme with my patch, and then run below command:
>>
>> bitbake-diffsigs=20
>> 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.608eb6ea5873c19534fddfeacee=
59d81fa799ce6c965217ffe76a0141885093a=20
>> 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.b10948f26bfd089980c9f9af928=
e108e9764627201dcfd9db43efc8a455b181b=20
>>
>> NOTE: Starting bitbake server...
>> runtaskdeps changed:
>> ['autoconf/autoconf_2.69.bb:do_populate_sysroot:virtual:native:/poky/me=
ta/recipes-devtools/autoconf/autoconf_2.69.bb=20
>> automake/automake_1.16.2.bb:do_populate_sysroot:virtual:native:/poky/me=
ta/recipes-devtools/automake/automake_1.16.2.bb',=20
>> +gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot,=20
>> 'gnome/adwaita-icon-theme_3.36.1.bb:do_fetch=20
>> gnu-config/gnu-config_git.bb:do_populate_sysroot:virtual:native:/poky/m=
eta/recipes-devtools/gnu-config/gnu-config_git.bb',=20
>> +gtk+/gtk+3_3.24.21.bb:do_populate_sysroot,=20
>> 'gtk+/gtk+3_3.24.21.bb:do_populate_sysroot:virtual:native:/poky/meta/re=
cipes-gnome/gtk+/gtk+3_3.24.21.bb=20
>> hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot=20
>> librsvg/librsvg_2.40.20.bb:do_populate_sysroot:virtual:native:/poky/met=
a/recipes-gnome/librsvg/librsvg_2.40.20.bb=20
>> libtool/libtool-native_2.4.6.bb:do_populate_sysroot=20
>> pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native:/poky/met=
a/recipes-devtools/pkgconfig/pkgconfig_git.bb=20
>> pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native:/poky/meta/reci=
pes-devtools/pseudo/pseudo_git.bb']=20
>>
>> Number of task dependencies changed
>> Dependency on task gtk+/gtk+3_3.24.21.bb:do_populate_sysroot was=20
>> added with hash=20
>> 60018dc07fa11c46226232c0923871b65f88f51a0b7665045f779a1111c1e1dd
>> Dependency on task=20
>> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot was added with=20
>> hash 17cd8a1fe76fa0b342dc50b8e2d71d8d88eec93d0367ae48629ae66f41eca11f
>>
>>
>> On 7/11/20 12:37 AM, Martin Jansa wrote:
>>> With this change now in master and dunfell there is signature issue=20
>>> in allarch=C2=A0adwaita-icon-theme now runtime depending on TUNE_PKGAR=
CH=20
>>> gdk-pixbuf as shown by sstate-diff-machines.sh/bitbake-diffsigs=20
>>> <http://sstate-diff-machines.sh/bitbake-diffsigs>:
>>>
>>> bitbake-diffsigs=20
>>> tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-linux/adwaita-icon-th=
eme/*do_prepare_recipe_sysroot*
>>> NOTE: Starting bitbake server...
>>> NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP:=20
>>> 127.0.0.1, PORT: 33511, PID: 36423
>>> Hash for dependent task=20
>>> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from=20
>>> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to=20
>>> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
>>> Unable to find matching sigdata for=20
>>> openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:d=
o_populate_sysroot=20
>>> with hashes=20
>>> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 or=20
>>> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f

Martin, Khem, I still don't know how to reproduce this error "Unable to=20
find matching sigdata for ....",=C2=A0 could you send how to reproduce?

>>>
>>> On Wed, Jul 1, 2020 at 3:39 AM Changqing Li=20
>>> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote=
:
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0 On 6/30/20 6:01 PM, Richard Purdie wrote:
>>> =C2=A0=C2=A0=C2=A0 > On Tue, 2020-06-30 at 17:49 +0800, Changqing Li w=
rote:
>>> =C2=A0=C2=A0=C2=A0 >> From: Changqing Li <changqing.li@windriver.com
>>> =C2=A0=C2=A0=C2=A0 <mailto:changqing.li@windriver.com>>
>>> =C2=A0=C2=A0=C2=A0 >>
>>> =C2=A0=C2=A0=C2=A0 >> fix error:
>>> =C2=A0=C2=A0=C2=A0 >> + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loade=
rs=20
>>> --update-cache
>>> =C2=A0=C2=A0=C2=A0 >> /var/tmp/rpm-tmp.mdYxY6: line 12:
>>> =C2=A0=C2=A0=C2=A0 /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-
>>> =C2=A0=C2=A0=C2=A0 >> query-loaders: No such file or directory
>>> =C2=A0=C2=A0=C2=A0 >> %post(adwaita-icon-theme-3.36.1-r0.0.noarch): wa=
itpid(2961)=20
>>> rc 2961
>>> =C2=A0=C2=A0=C2=A0 >> status 7f00
>>> =C2=A0=C2=A0=C2=A0 >> warning: %post(adwaita-icon-theme-3.36.1-r0.0.no=
arch) scriptlet
>>> =C2=A0=C2=A0=C2=A0 >> failed, exit status 127
>>> =C2=A0=C2=A0=C2=A0 >>
>>> =C2=A0=C2=A0=C2=A0 >> when install adwaita-icon-theme, which inherit g=
tk-icon-cache
>>> =C2=A0=C2=A0=C2=A0 >> on target, above error reported,=C2=A0 fix by ad=
d needeed packages
>>> =C2=A0=C2=A0=C2=A0 >> in RDEPENDS
>>> =C2=A0=C2=A0=C2=A0 >>
>>> =C2=A0=C2=A0=C2=A0 >> Signed-off-by: Changqing Li <changqing.li@windri=
ver.com
>>> =C2=A0=C2=A0=C2=A0 <mailto:changqing.li@windriver.com>>
>>> =C2=A0=C2=A0=C2=A0 >> ---
>>> =C2=A0=C2=A0=C2=A0 >>=C2=A0 =C2=A0meta/classes/gtk-icon-cache.bbclass =
| 2 ++
>>> =C2=A0=C2=A0=C2=A0 >>=C2=A0 =C2=A01 file changed, 2 insertions(+)
>>> =C2=A0=C2=A0=C2=A0 >>
>>> =C2=A0=C2=A0=C2=A0 >> diff --git a/meta/classes/gtk-icon-cache.bbclass
>>> =C2=A0=C2=A0=C2=A0 b/meta/classes/gtk-
>>> =C2=A0=C2=A0=C2=A0 >> icon-cache.bbclass
>>> =C2=A0=C2=A0=C2=A0 >> index 91cb4ad409..7f218ce7ae 100644
>>> =C2=A0=C2=A0=C2=A0 >> --- a/meta/classes/gtk-icon-cache.bbclass
>>> =C2=A0=C2=A0=C2=A0 >> +++ b/meta/classes/gtk-icon-cache.bbclass
>>> =C2=A0=C2=A0=C2=A0 >> @@ -4,6 +4,8 @@ DEPENDS +=3D" ${@['hicolor-icon-=
theme',
>>> =C2=A0=C2=A0=C2=A0 '']['${BPN}' =3D=3D
>>> =C2=A0=C2=A0=C2=A0 >> 'hicolor-icon-theme']} gtk
>>> =C2=A0=C2=A0=C2=A0 >>
>>> =C2=A0=C2=A0=C2=A0 >>=C2=A0 =C2=A0PACKAGE_WRITE_DEPS +=3D "gtk+3-nativ=
e gdk-pixbuf-native"
>>> =C2=A0=C2=A0=C2=A0 >>
>>> =C2=A0=C2=A0=C2=A0 >> +RDEPENDS_${PN} +=3D "gdk-pixbuf gtk+3"
>>> =C2=A0=C2=A0=C2=A0 >> +
>>> =C2=A0=C2=A0=C2=A0 >>=C2=A0 =C2=A0gtk_icon_cache_postinst() {
>>> =C2=A0=C2=A0=C2=A0 >>=C2=A0 =C2=A0if [ "x$D" !=3D "x" ]; then
>>> =C2=A0=C2=A0=C2=A0 >>=C2=A0 =C2=A0 =C2=A0 $INTERCEPT_DIR/postinst_inte=
rcept update_gtk_icon_cache=20
>>> ${PKG}
>>> =C2=A0=C2=A0=C2=A0 >> \
>>> =C2=A0=C2=A0=C2=A0 > This isn't quite right since the postinst may be =
added to a=20
>>> package
>>> =C2=A0=C2=A0=C2=A0 > other than ${PN}.
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > You need to add the RDEPENDS to the code:
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdepends =3D ' =
' + d.getVar('MLPREFIX', False) +
>>> =C2=A0=C2=A0=C2=A0 "hicolor-icon-theme"
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar('RD=
EPENDS_%s' % pkg, rdepends)
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > later in that class.
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > Cheers,
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > Richard
>>> =C2=A0=C2=A0=C2=A0 Thanks, I will correct it.
>>> =C2=A0=C2=A0=C2=A0 >
>>>
>>
>>=20
>>
