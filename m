Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0075.outbound.protection.outlook.com [104.47.32.75])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7B171C3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:09:38 +0000 (UTC)
Received: from BN6PR03CA0018.namprd03.prod.outlook.com (10.168.230.156) by
	BY2PR03MB176.namprd03.prod.outlook.com (10.242.36.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 14:09:38 +0000
Received: from BL2FFO11OLC006.protection.gbl (2a01:111:f400:7c09::113) by
	BN6PR03CA0018.outlook.office365.com (2603:10b6:404:23::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Tue, 23 May 2017 14:09:37 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC006.mail.protection.outlook.com (10.173.160.95) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 14:09:37 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4NE9YgS029059; Tue, 23 May 2017 07:09:35 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 22:08:02 +0800
Message-ID: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400221773893315;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39850400002)(39450400003)(39380400002)(39860400002)(39840400002)(39410400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(4326008)(104016004)(36756003)(8656002)(230783001)(356003)(86362001)(77096006)(6666003)(47776003)(5660300001)(5003940100001)(2906002)(6916009)(498600001)(81166006)(305945005)(2351001)(105606002)(85426001)(8676002)(50226002)(8936002)(38730400002)(50986999)(50466002)(110136004)(33646002)(54906002)(48376002)(106466001)(189998001)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB176;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC006;
	1:18yG61Lo0olOddzjLefMpbkl2zLhuJEbvDHCqdJKGdTHYNVva9dsh+eeK0IeiJZuhCoGVN+fBauKfz14AY0yV+Mn8bv2s0OoXpw6cTb+FneuYBgKUlpyaOdRwfWSKxYhfyHw/bC1rZCqUVJaN0Y7PNPAKpsuhl+0waaM/CkmMFbZMwt63/qcsSYDtzFl7TLwk4aGpgVwvo1o4pCnVmlENY3dmiv8Xy4vZ4NPioOZzn59lsvDL4PpI1JlbBoJN7s6pXdPWsTwh+5uIIOEFh+809Rkq1CwnDJwNXhMpJoGJMMmQdo0XLYk/dwsgEw/LDHllSHnOJPxMPlgmFuNlNkU50bkfDcHxL/q5UZO74py5byzgJyiBgA+S6wTruDE3mgtoD0yFLw5rq0rPGQF9ADpp8iWIPRDQ6zkEPV5TEck70CdgIdzNR6q2p6fnzrzmtfsYvDCfBtYNevqtrsb9ujJeWfFAnFcMa1OzyWzFLyL753yJjBrgtqqoFhd3PlbJyddRGAKGhn584XoI/y7R8uQXhGWyGsxwTobc4Um2du7ozANOCHpir1ksKs8dhfiO+9rTC/DPG1WKL6O54rkpyYBAaDzxG//PbvpPZ+bygHGOVQE1j1XhKaZHOVCm6OwlXXm7Pfpq+LTAJRhCB71K3bLflILl/AzU9dlxykRcFY4FuncBKqygBZF04j6jSFfwSgLu4aWyLavSXKGYdI4JeIHmFmu4GbeLpu0dqHY4M9b1FGFK7KH22poBeNGqovfjUlPTHVXf8VXXZbCd40CJGHP3g==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY2PR03MB176:
X-MS-Office365-Filtering-Correlation-Id: 79fe2de0-e46e-44e8-8ec3-08d4a1e558b4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BY2PR03MB176; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB176;
	3:sWQoEggzdGCe8r1Z8S4LppEfChB+92r8qKvR3eUNzs0AziNCePXUdSmgEc1nm/EnknhGkeP4DsMrKpbU7W4uJFvptIgnBok7Ii8y2Y0u+e+u3jCqMtUoasHxXoVb8fpMPJi61XM4emm9B+WqD8Wu72cSX3DxWaJvfUoiF10FmfGAB1D3X+JsfcCYOtnm+g2ACl2VWOglBgk6VCHnhFOT6mJS4frZerBHOE+us++uroFwKv5Z7Gkuxzou/CuflQc6WNnv59rowsXgDrds/9Lhg4KVNYJ8KfdfpE2sV2gDewU0RH5fZ6jHH1NWQoRQKtTQf7WSTvKfmVIHkkpUgkxdd2BhnfRiQ/WeyqrJlRh5tuSlMNQRrwC+vrSydFRL4BzLfXvUfPWeeqy4VAG7PhMaUVNcndFWDo8iLIQ1Tvg3u0N3IUWIFUChsQPL/6BzyFfX;
	25:yBMIarmnglg7zZR7vOy49D28jIB1uBER1CDLSz3bVAFxHk1TuChJDClpDDn2gnpY2nqGDauQJ/B3lx127RKQ1shgSwN6Ng9z/UYgLbDBV67f9oNkb4+g4mCXG2L4oFKFgI1kAbzxAx9WoHUsPDzBA17jjnpGf1V8XxiwDN0VNDUGeEu/uey0IWl/MltaATJbAGpb3IRax+FUWfPQJ+gGM+XcrXFJGZeCeM0RJw6DLvtCSrEBVAI0Q67xo4nmKwsEXS1HkMjpvL0YARBTMqRHhcQGERSomnn+ala65UIj+5JqoA5UeK9uyr4kq0DkHD5jrTG8YN0SNXPL3Ey1W4Or/0F9m7P+YC2c7nszssN9lylnxf4mAfsE8Yp10hbN+HIqJtoQxUoTFPsh6fzM4ymkYm0/LlyUFmJcZlgVgBbUKIsmoL31agYAYonMK5hhwf0f9W2YvIf83yWV999yBBGnzmikLuYS9ez3+7P96i2V4bo=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB176;
	31:Vgu2mbSEhHxaTK/TXAotvdKVyL1Ra/v5SV/fjLrdBmhRpZxh/wGK1IDx4w2er+VMu6E4QwCx/kIMNRcBBiXTxU21Yp0Bk5KGTcvCYzYhAFaW17HnWiCzImX2cpqj9AeTc+NZjI5xuNaffBoiS00H6kpHqnfTZIbWkc46dOLSulrdnVOM99TGqoRdsBuN72ED2l3CyUAEeSZIjBVYiz8X+NRLQTeVQ+IEPHcIgW/uR5lnceXjE8GGAxk9j8rtWwA7TAtqltmXChYh3meIu8pIMw==
X-Microsoft-Antispam-PRVS: <BY2PR03MB176AE0841568E7FA2FE4493E9F90@BY2PR03MB176.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13024025)(13023025)(8121501046)(13018025)(5005006)(13015025)(13017025)(3002001)(10201501046)(93006095)(93001095)(6055026)(6096035)(20161123559100)(20161123563025)(20161123561025)(20161123565025)(201703131430075)(201703131433075)(201703131441075)(201703131448075)(201703161259150)(20161123556025);
	SRVR:BY2PR03MB176; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY2PR03MB176; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB176;
	4:U6rG3bcFbr/Tp1hafcWobBEAomEqwbtb2Dl4YHLdXUmDO65FmBW5FflMyJzUf7nRlB8QHYJBngaZnCWSm9y9deg7BuMWBK05yWVMh4ftQ/UDuUmLzyTSBZCSuuoKq073rhqeONHyOM8jp0SiNOO1lK5+Acb0ehDY+2l08IiAB7M0csvQdXfxk0gwmvR+95itp2eYKZdCPsVnwjSxrnv/uWjqJCHyUnxkIZUhogjMF1/dp3wD5Hvb7Gh7SaEZUAB3gci3T3D0pu1DudmkXLxEuxQoRsLOUj+yWG/ZEQjb6bHhm8w5o7pkn/zK1PJp8rmclhu2CV8ZOtdGnMczDD7m7riUDw5BCWi5T/nGmM7i3YryT2aGaFC508RqTDFx703v5uMlo75v3GeN6ZQrlDibr1KdwMQsGG2sVv00j59xBiJJv6h3yPnLw44jO3H/VYQ/5w1Q41B2GBaZ6sC83efG524OuCUDgwA3yXbhKbhIqCiF9fl8KYuZRwUDJVA8LDrX3fHQVxpYemt+ME0VPuIKyFXvB5G0Tggq8mXlPgSai19OTZ5Q6ZdzkdrKftpe94FmEh1fiLdp85PRXPIKnuYneVyWHrNx+2K6xnhpri5AUmvdmhjhOpm5fAi3JNaj5dtO8BoT7JOyTrW4MjrHin57zrMQhigKimtnc8XZa2rzzSwGcbX4zPyVjZNlx5EV9K0ieAKl7fIJNkcRwA4LSxEdGhYvzu8KUVIXuoiyvo1s1WbI7F4eeZCilh8qp4I59HzCX2M9MtyAdidK6WGZbtN6vdWonK6NoVUEA130S6JY9w89vnIdrxe0oSHXhPwfx2MH3SzbW+LW+tCUZXXLQmW02hpIbbutpO16jOzGFUjNmAG6LOR+KBpj2/dC0Hr02uwStM9e9IXmqlt7VDJGygBQnJtpxo7TdQqZoolLtBHw2c4=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB176;
	23:a3Ga5z/7rP3LBrtgpGtEJTeWZ8HJkyACTPx0muzpKm?=
	=?us-ascii?Q?SR0uqyS+CbOsuSeCXyBCNdeJUSpS2hToWVdd7Divt6mPUbhOY620uPt3r77K?=
	=?us-ascii?Q?dUBOjmNZpWuPM75SBpC9rHAO1LCj7+5Z2jRRqI0ZZ1x9F7VctkyELSE97064?=
	=?us-ascii?Q?dbZE/x1IM1naqIzQ2H53/uEKn28c/ws0eXDHu74luFt5quVHk+GAGFwlti6y?=
	=?us-ascii?Q?RUA4PraLK6nVUwR6hdmlsehdVLEvbwfBW8OkAFsv92n3Yi0BKHpCDoG1/EFW?=
	=?us-ascii?Q?04OcOAVWOi+p0l1o0JZ6ncbB8cyNVN3BhJOYTQiGDouFU6e5SgzC1jbad/Ts?=
	=?us-ascii?Q?xpAeOJ/4JMx2fXb5hso+YFoEJ2wbtph90qyfAgD8+EpQ9ycfBSK4DbCQDTtB?=
	=?us-ascii?Q?l3ZFbjOmikJon8o78O1foW5egYNGtpcIBhJK+sin4SV5ta+Dop7UX4vVi6Ej?=
	=?us-ascii?Q?KxgyOiOraBOjX88KOv8yQhDL45Fo+c0JqYtsANb29JZDRphfPh/wijrxnBp3?=
	=?us-ascii?Q?8sXHczEyLgVDDb1Ub9mMshARSnWjTCbhdg5a5l/fx7h0uC9zlURQczLaFmoV?=
	=?us-ascii?Q?uoReO9BGk0SS4bt6WaG6/GCtVodpg47TNhW2Yp6q5AJ9FMbB37Q0DQxtBNuj?=
	=?us-ascii?Q?PpQv8eCsotsg70CP7/oHoUaubYAvzMPZwvqESKk9RNgMTdjLyRrYIYh9BUt2?=
	=?us-ascii?Q?uB5X6AFMvaTAbMt4dMS7wLHA3TqS8NqDdw2L4Fid4UP9d7B4TLNCiGD6gN/C?=
	=?us-ascii?Q?PiCXmoT01Gm3b6z57Z7TAxP/V7Nf85MRt5uwD7taZKEuTWVY7xfPh5n5DmHT?=
	=?us-ascii?Q?YrLtJfRBy+D6BZIXkBThap58/k1iHEDleP3dNCxaHDDfUunxQoI1UxPsgwak?=
	=?us-ascii?Q?nH6dT3l1/EIFV8fAqZ50KwdZNEdG/7GlOrLqaqsgqhYydV2pTDc4KbhIwsYb?=
	=?us-ascii?Q?z4wJJ0dSpRPHG2ts8A3j72NDdU7N+gOCxMW/LCAbtHaWxKH85jvmd4Uq6PJW?=
	=?us-ascii?Q?kKSV1FOJ0gXFH5pQBwImKsPhNtCk1rZ9lP2QLRXtDAu9I012WfVa56H5A3N9?=
	=?us-ascii?Q?KF0tExKJ89LMlqknwQHK5REu85qLU114XSKUD0BBBsRBtL/7GIiMe8KPlmYb?=
	=?us-ascii?Q?wLNKkTGybcfJhb510o2YYpVJKXxYwvnGjuFnNSZMxtWYRJWiHkTWzEtl1ND4?=
	=?us-ascii?Q?w21MYMKUzx8CMVGKcjGYx7XKvzM5W62FwP?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB176;
	6:XGoRFqKiuPFu9MTFK7SDIphTLYB2FFWBgxRZIzfsx7Dmwn930sRjv4n5ov/lVj4jaq/XwSZ6DIHcSbsoiSOpWArNZYiXLorgbVFum/39bDfDAI/8q3thTYTIgUIoTkLuYroc8GSG4E74iM8780L7QPn0OrpMH/GYi3tQSSVWZaGzSbF9qgkjjy+6fKEwX9yYNwMlzITpfdFHSpT3oSdqxQgHbK4G5aHWLzrEZ4WQrw4SBoyDWa41/BeSzH2e/Pv22nlOx5GhqkXKvkOgO5kldPBNHG8iC/3VvWOmPnMuB7/E5ubYTx02GoR5+y9Hna5qKRA36eAzRR8hG0rk7C54MyWMSrzt2OjordqpXbwSmKq8WbEgjFtwSsqFb8YSyiL7U2W1LypBQbHg27XqT+/fV4H8qn40nxpANpPDIscmwg/guolbhaBQeANmXGvYWE25AGlJOM9M6CXvSmtY0oYW8m+kKdhAFvBRL5GbiFr8IcUCr1iy/e+T0joYJnl7oVmHI6H4DmH30n6JXjQzTrjtPQ==;
	5:fUoQAUXgbVHzvpFkUWMD0kmMSF8vRSbX9Fl7/CY/9ScXuvlFbKQkBxSJxR5n81KxAnnpzRNRbbng/fzc//lcIKSDtD8gm8RQTcWnkBZvh1NVgh+bhqYRqH7O2P9Up2nUR+aX4oBRBj6jy0+DRUZqcKBG6PCIB75cfqKmYaVxosc4Yc/FPRvIFjRMvmnykX4h;
	24:jUBNrKFFhBW+c4XoDgkfvLi+WsbDQ3EIKyEKzwMujDS9qrHo4bDPnBYX4oM41b+V+Rff2S36a1XSfdf9KFqs+q3n7PGM+8xBKDLe5ByGQAU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB176;
	7:BbAXAKhp2e2/LmXuGxuScgIFD/V2hKOClQmlfucolj+7vdPxNJbl9HPlwpVIz+8zHq14BxvkPKTtuUmGY88n7SaFVPGI4qEu4NVdKlrd1UizieyZs3pv7uLNxsMmnJ4X+TdYbL3r5IurOblI+kvYieHn8X6eiWF1AielnzzR3qywjxJQBfUDoQbX+4vcmkBPMXmG/KvQ4hf6cyZ1vLdktzUwGvzOKTo0SYBt+/CVf3UjRYEIF2SFXCuIPOTf26RShyYgr2b+cEyApY1nvVEjlZvvby35qv3hvGkKcDv5NuO4zXOiSaDnS6/KWNTERkpzwaa+qA2PcowE9pBj5DvomQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 14:09:37.2333 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB176
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad patches for pyro
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
X-List-Received-Date: Tue, 23 May 2017 14:09:39 -0000
Content-Type: text/plain

-Add some enhancements for qmlglsrc
 Some common features for qmlglsrc are added to make app development much easier.

-Add some enhancements for gstplayer
 Some gstplayer API enhancements are added to make it much easier for users to use.
 Without these API enhancements, some features may not be realized
 (like accurate seek, video sink configuration) when using gstplayer API.
 So it would be better if they can be picked.

-Fix a memory leak issue in glupload, which is common

Yuqing Zhu (6):
  gstreamer1.0-plugins-bad: Add two enhancements for qmlglsrc
  gstreamer1.0-plugins-bad: Add configuration for enabling accurate
    seeks
  gstreamer1.0-plugins-bad: Add get track number media info API
  gstreamer1.0-plugins-bad: Add overlayvideorenderer video sink
  gstreamer1.0-plugins-bad: Fix gst-player failed to load external
    subtitle uri
  gstreamer1.0-plugins-bad: Fix memory leak when use a GValue in
    glupload

 ...2-qmlglsrc-some-enhancements-for-qmlglsrc.patch | 170 +++++++++++++++++++++
 ...configuration-for-enabling-accurate-seeks.patch | 148 ++++++++++++++++++
 ...layer-Add-get-track-number-media-info-API.patch | 126 +++++++++++++++
 ...layer-Add-overlayvideorenderer-video-sink.patch | 138 +++++++++++++++++
 ...fix-gst-player-failed-to-load-external-su.patch |  50 ++++++
 ...-glupload-fix-memory-leak-when-use-a-GVal.patch |  29 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   6 +
 7 files changed, 667 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch

-- 
1.9.1


