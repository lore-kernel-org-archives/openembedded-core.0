Return-Path: <Ryan.Meulenkamp@nedap.com>
X-Greylist: delayed 55347 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Dec 2018 08:41:06 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140102.outbound.protection.outlook.com [40.107.14.102])
	by mail.openembedded.org (Postfix) with ESMTP id ECCC66C503
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.onmicrosoft.com; 
	s=selector1-nedap-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JwbQ88E8sE5xueN7iwz3e5a0psC7jGmw4F6vyBAt3TI=;
	b=NPO2biEnXP83TIMuIQ/3IOs8i35kJSRrU8s2RWySrsjeJhcsGODiHLbAyY5XmQUr3OTQX6Ve4WwQnzuubqM57FL1t5taaFhXg3RgygHYtG7418vmSRp8TUdgFQnbT6Yjn3caZ3+1kFQeWfZ+smwmCNMAU1EqtucbB9cWKTByvEY=
Received: from HE1PR10MB1769.EURPRD10.PROD.OUTLOOK.COM (10.160.68.158) by
	HE1PR10MB1548.EURPRD10.PROD.OUTLOOK.COM (10.160.67.25) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.17; Thu, 6 Dec 2018 14:45:52 +0000
Received: from HE1PR10MB1769.EURPRD10.PROD.OUTLOOK.COM
	([fe80::750f:d3ab:8221:94c6]) by
	HE1PR10MB1769.EURPRD10.PROD.OUTLOOK.COM
	([fe80::750f:d3ab:8221:94c6%2]) with mapi id 15.20.1382.023;
	Thu, 6 Dec 2018 14:45:51 +0000
From: Ryan Meulenkamp <Ryan.Meulenkamp@nedap.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: page allocation failures
Thread-Index: AQHUjWbyWmc5ZANfLEuJETg0lydYjaVx2Wsy
Date: Thu, 6 Dec 2018 14:45:51 +0000
Message-ID: <HE1PR10MB176991EF66A834F4C0A01A7CECA90@HE1PR10MB1769.EURPRD10.PROD.OUTLOOK.COM>
References: <HE1PR10MB17696D9BA67E830F1C419FFCECA90@HE1PR10MB1769.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <HE1PR10MB17696D9BA67E830F1C419FFCECA90@HE1PR10MB1769.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Ryan.Meulenkamp@nedap.com; 
x-originating-ip: [87.249.123.12]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR10MB1548;
	6:QlGwFkaGKhZJeqWiOOmMNOl6rovcWAA1n27H3WrRbdANanqFIR+rGfIWjbi4wsfwqeXv1hdRK1ZTMAGTtPCFDJQDox58CHHPqX+xXC4l7kcBP0mqObDmqaV72PXYs3raS05Bn+kgvM0YllKJ/zMhlYylgkqHVh7v/SugMgDhKfo0ZBmpG/zEpkTtsRZt6Tl3ZPfCptkUdJsRqtZ1ZBbBXPww23uUPtM5t0DC9PAa6BE1agGWP4b5TbYRRepZLjkGlise0vzlEWAhVk8rfNlmy0McQ6HStBERlbnJ8YCvL4vvPKIcoV6XiVf23Mza5nrlnS0NHYzaLdOhPtjyADWAo8P5Z6H5QSjV3Nvju/4tQxxvgsOsc75kQdOriqkesJjrhzxmRvhBSETfIcyM52KiQrNKISkhttDG521Y/2GnWieycVU722I8O9EEyhMdL2+aotAWKfN9ywXfaUYJuNQpYQ==;
	5:gr8WTaKAXnbDMlWgvgkrL/3DYp69v7XS5u9kEj4ZYpQj9he6gSxUnUd+VTquAUt1n+nc/v0zRgt7GHg8Nk21lqXAbJLA+mfudmkKBQk5hGxExi6L4eGN1rbS3QAz0Cogc/uBUv79c+G7HhBMAGCaDAuq1KXNknhY77z/PaZ5C5k=;
	7:2eMnfnrFi8f8pxBjgA9DBZKnDuGDPzKRCdkYatg5cgFryWEVTu9iIrj8f2RftQnQjkG2Cx4k/UyZOuG2sgTpXQMvZdiYWsoBCR1FF7voDGoiBKYH7KTp351gBR7l8wksfP+wlkmwjmccIZACY4wvOQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 9023673a-136b-4c84-119c-08d65b898502
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR10MB1548; 
X-MS-TrafficTypeDiagnostic: HE1PR10MB1548:|HE1PR10MB1548:
x-microsoft-antispam-prvs: <HE1PR10MB1548BB7F1C1F9097217DFA71ECA90@HE1PR10MB1548.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231455)(999002)(944501520)(52105112)(3002001)(93006095)(93001095)(10201501046)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:HE1PR10MB1548; BCL:0; PCL:0; RULEID:; SRVR:HE1PR10MB1548; 
x-forefront-prvs: 087894CD3C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39850400004)(366004)(346002)(376002)(136003)(396003)(51874003)(199004)(189003)(53754006)(74316002)(105586002)(8676002)(53936002)(11346002)(486006)(55016002)(446003)(9686003)(3846002)(6116002)(476003)(8936002)(93156006)(305945005)(81156014)(71190400001)(71200400001)(25786009)(5640700003)(14444005)(478600001)(256004)(2906002)(99286004)(81166006)(6436002)(66066001)(68736007)(5660300001)(14454004)(7116003)(72206003)(97736004)(6916009)(316002)(575784001)(86362001)(6506007)(26005)(33656002)(7736002)(186003)(102836004)(7696005)(3480700005)(76176011)(106356001)(2351001)(2501003)(2940100002)(133083001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR10MB1548;
	H:HE1PR10MB1769.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nedap.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Ps72zG7ktwD6dsrikXcDkRbS4/xwSzT9nFRwdF47/8h3KchCD9M5KmvpM+gy/wVNFREst0VwfvHM3iXWRZ4+sMIRVy2Su5Yxk/dbohgZ5gJJHsNijiEXhIJhVjfmvG1OH6RmRCVcaptMGlhPBk7mdaYRP44HWKe4qAs1DzSmcpldP6rClU3v0MvnmqGvszdTegI8yQ9IqGKSHQts8bMucht/5uB4wCOClY6GZpz2xC0fsNL3m6h5Zw7mwAXNS+2OfRdX/WShWhfZoq7EMEzkQjL/cjhABWd4RFx6Kl4FFQvleoueUXbRHidTTz8GtW2hgxyuLUF/Hb95Pmg452pUNLQNDefwk/MSLXuAWh6UDuw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9023673a-136b-4c84-119c-08d65b898502
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2018 14:45:51.7785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1548
X-Microsoft-Exchange-Diagnostics: 1; HE1PR10MB1548;
	23:IZETU0B4dYlcan5hTRgItHpmJOaxGdhQrgQhADDoEAZglC121+53WX+BP0zNsivzGFQOdlbRFTcBhcZYET0wKStVLVT6lQ/laWrZwkok1P7BjC1igsoSEVWhL8vYDUuL4hkUJmZesiuiDSv3xCII7Q==
X-OriginatorOrg: nedap.com
Subject: page allocation failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2018 08:41:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi y'all,

I get page allocation failures which are not correct as far as I can see. O=
nly a single page is requested,
albeit atomically. But it fails even though there are, in this case, 48 sin=
gle page fragments available.
Why does it still fail though? What could be going wrong here?

[19119.398437] java: page allocation failure: order:0, mode:0x2080020(GFP_A=
TOMIC)
[19119.398437] CPU: 0 PID: 19293 Comm: java Not tainted 4.9.28+ #1
[19119.398437] Hardware name: Atmel AT91SAM9G45
[19119.398437] [<c000fa64>] (unwind_backtrace) from [<c000d520>] (show_stac=
k+0x10/0x14)
[19119.398437] [<c000d520>] (show_stack) from [<c0088468>] (warn_alloc+0xf0=
/0x118)
[19119.398437] [<c0088468>] (warn_alloc) from [<c00887a4>] (__alloc_pages_n=
odemask+0x27c/0xa9c)
[19119.398437] [<c00887a4>] (__alloc_pages_nodemask) from [<c00891c8>] (__a=
lloc_page_frag+0x140/0x174)
[19119.398437] [<c00891c8>] (__alloc_page_frag) from [<c0346600>] (__netdev=
_alloc_skb+0x98/0x100)
[19119.398437] [<c0346600>] (__netdev_alloc_skb) from [<c02eb7f8>] (macb_rx=
+0xc4/0x38c)
[19119.398437] [<c02eb7f8>] (macb_rx) from [<c02ec6a8>] (macb_poll+0x50/0x1=
14)
[19119.398437] [<c02ec6a8>] (macb_poll) from [<c0351c90>] (net_rx_action+0x=
1b0/0x2a8)
[19119.398437] [<c0351c90>] (net_rx_action) from [<c001bd24>] (__do_softirq=
+0x128/0x268)
[19119.398437] [<c001bd24>] (__do_softirq) from [<c001c15c>] (irq_exit+0xbc=
/0xe0)
[19119.398437] [<c001c15c>] (irq_exit) from [<c004979c>] (__handle_domain_i=
rq+0x64/0xd4)
[19119.398437] [<c004979c>] (__handle_domain_irq) from [<c000dfbc>] (__irq_=
svc+0x5c/0x90)
[19119.398437] [<c000dfbc>] (__irq_svc) from [<c024cc1c>] (gpio_to_desc+0xb=
0/0x11c)
[19119.398437] [<c024cc1c>] (gpio_to_desc) from [<c02c47e4>] (atmel_nand_en=
able+0x14/0x20)
[19119.398437] [<c02c47e4>] (atmel_nand_enable) from [<c02c4838>] (atmel_na=
nd_cmd_ctrl+0x28/0x64)
[19119.398437] [<c02c4838>] (atmel_nand_cmd_ctrl) from [<c02bf688>] (nand_c=
ommand_lp+0x110/0x314)
[19119.398437] [<c02bf688>] (nand_command_lp) from [<c02beab4>] (nand_do_re=
ad_ops+0x16c/0x578)
[19119.398437] [<c02beab4>] (nand_do_read_ops) from [<c02bf234>] (nand_read=
+0x5c/0x7c)
[19119.398437] [<c02bf234>] (nand_read) from [<c02b4db0>] (part_read+0x4c/0=
x84)
[19119.398437] [<c02b4db0>] (part_read) from [<c02b2634>] (mtd_read+0x9c/0x=
cc)
[19119.398437] [<c02b2634>] (mtd_read) from [<c02d2224>] (ubi_io_read+0x9c/=
0x2f8)
[19119.398437] [<c02d2224>] (ubi_io_read) from [<c02cf8a0>] (ubi_eba_read_l=
eb+0x94/0x4b4)
[19119.398437] [<c02cf8a0>] (ubi_eba_read_leb) from [<c02ce54c>] (ubi_leb_r=
ead+0x74/0xb4)
[19119.398437] [<c02ce54c>] (ubi_leb_read) from [<c01bb5a0>] (ubifs_leb_rea=
d+0x28/0x74)
[19119.398437] [<c01bb5a0>] (ubifs_leb_read) from [<c01be260>] (fallible_re=
ad_node+0x40/0x164)
[19119.398437] [<c01be260>] (fallible_read_node) from [<c01c04a0>] (ubifs_t=
nc_locate+0xf8/0x1c0)
[19119.398437] [<c01c04a0>] (ubifs_tnc_locate) from [<c01b2844>] (do_readpa=
ge+0x180/0x44c)
[19119.398437] [<c01b2844>] (do_readpage) from [<c01b3d2c>] (ubifs_readpage=
+0x38/0x50c)
[19119.398437] [<c01b3d2c>] (ubifs_readpage) from [<c0083040>] (filemap_fau=
lt+0x46c/0x618)
[19119.398437] [<c0083040>] (filemap_fault) from [<c00a42ac>] (__do_fault+0=
x6c/0x108)
[19119.398437] [<c00a42ac>] (__do_fault) from [<c00a7c30>] (handle_mm_fault=
+0xb00/0x1464)
[19119.398437] [<c00a7c30>] (handle_mm_fault) from [<c00118a4>] (do_page_fa=
ult+0x220/0x2ac)
[19119.398437] [<c00118a4>] (do_page_fault) from [<c0009418>] (do_PrefetchA=
bort+0x3c/0xa0)
[19119.398437] [<c0009418>] (do_PrefetchAbort) from [<c000e504>] (ret_from_=
exception+0x0/0x1c)
[19119.398437] Exception stack(0xc72adfb0 to 0xc72adff8)
[19119.398437] dfa0:                                     ae878e4c b6fa71a4 =
00000001 b6851904
[19119.398437] dfc0: ae878e4c b6d9c3c4 00000000 b0ef2c00 b0ef2c00 b191f0c8 =
00000001 ae878e24
[19119.398437] dfe0: 00000001 ae878cd8 b6d05c38 b6851904 60000010 ffffffff
[19119.398437] Mem-Info:
[19119.398437] active_anon:25949 inactive_anon:47 isolated_anon:0
[19119.398437]  active_file:760 inactive_file:542 isolated_file:4
[19119.398437]  unevictable:435 dirty:0 writeback:0 unstable:0
[19119.398437]  slab_reclaimable:255 slab_unreclaimable:1023
[19119.398437]  mapped:1694 shmem:80 pagetables:199 bounce:0
[19119.398437]  free:768 free_pcp:26 free_cma:0
[19119.398437] Node 0 active_anon:103796kB inactive_anon:188kB active_file:=
3040kB inactive_file:2168kB unevictable:1740kB isolated(anon):0kB isolated(=
file):16kB mapped:6776kB dirty:0kB writeback:0kB shmem:320kB writeback_tmp:=
0kB unstable:0kB pages_scanned:252 all_unreclaimable? no
[19119.398437] Normal free:3072kB min:1408kB low:1760kB high:2112kB active_=
anon:103796kB inactive_anon:188kB active_file:3040kB inactive_file:2168kB u=
nevictable:1740kB writepending:0kB present:131072kB managed:124364kB mlocke=
d:1740kB slab_reclaimable:1020kB slab_unreclaimable:4092kB kernel_stack:131=
2kB pagetables:796kB bounce:0kB free_pcp:104kB local_pcp:104kB free_cma:0kB
[19119.398437] lowmem_reserve[]: 0 0
[19119.398437] Normal: 48*4kB (H) 16*8kB (H) 8*16kB (H) 12*32kB (H) 5*64kB =
(H) 3*128kB (H) 2*256kB (H) 2*512kB (H) 0*1024kB 0*2048kB 0*4096kB =3D 3072=
kB
1743 total pagecache pages
[19119.398437] 32768 pages RAM
[19119.398437] 0 pages HighMem/MovableOnly
[19119.398437] 1677 pages reserved


Some background information:
- Kernel version: linux-at91 v4.9.28
- Relevant configs:
  - SLAB allocator
  - Compaction and migration turned on
  - Swap turned off

Thanks in advance!

Ryan Meulenkamp=

