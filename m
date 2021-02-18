Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web10.6439.1613653579770526485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 05:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=eL5+Qtwd;
 spf=pass (domain: siemens.com, ip: 40.107.20.45, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSdHR/xFakPIMaFfokfS7STWnTGlx0WJ40eyNSXi+mU/axwOvZIWHyJO1lQCe2orbz0xFYLipBzWLWr/mmTdgw4FJzKfyWr/Zdzs6RTmAdTwSD7HGU7dMq7lfeX2kEppbTJbVXZzgRTKhQ7yJNDls8sBf64riYySIetDXW63Q+cLO91Tl5L0+T7QXdOjmaV/m5hSzFeLxmOw04/DZMQwqY2mYZqeeqtSJiufYxAxz+6TCRGYzmsT7YyhpgPlrEpQTOj5Zb+bJXs+QSa7LQYQTVeLRyMVLf8fWknqnhuDwC2r4M5ZL6o11Jkut6NxUXsRpIddlotpt+3ZlD+und6WjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NUtKw1ra9zF1BZ0zaGYcqnWuXOcpsBmJpZkDR3Ktf0=;
 b=VWvSC27PFwsIHJ7F+ZyhX0xtpBise+SDZ6ayz3t2GOnLxiAUtA0FlNCYkirfYasfyVlxMSKnFMBynbCrichTxJ3s3Vs+6nj7/RjO427iJu9bCckA8Y9TmtQcrFTtCqv/2jyUQDEr92/K6kP1Tymbtg5w9R2vPKOJdj3aBrxqnMQ5ryvnKuTJgGTzN+3IhLE3ol+xiT9iheRDKTuAg8mPT2AQhHi7jUEQuPWlWP/+eLYTLmfWakZJX9XB2zO+PhfKa/qr7WaC1pRYfjWQMxgnxfF/wN6PkAttrbdTALIZPodfa5BTgB8CYZEjURGvrdFp/ypXsi43G+ul6OlPsWJtIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NUtKw1ra9zF1BZ0zaGYcqnWuXOcpsBmJpZkDR3Ktf0=;
 b=eL5+Qtwd0QIzjp3qggfbhzHIHolvTAFEmG21skxHzhDfbxX2SeJ4KJYkfiL49E7sUpx0L4vdp4oEJN/jA//0maVLQboMEKZqsBdmAKBa1a1uUDSFQTQCJ7W9qJkzE+S5sk8g1efJGwazr0UklVoAjOW9FGs8D1soQr8ySasuHdw=
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM8PR10MB4036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Thu, 18 Feb
 2021 13:06:17 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301%7]) with mapi id 15.20.3868.028; Thu, 18 Feb 2021
 13:06:17 +0000
From: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
Subject: [OE-core][PATCH 0/1] wic: warn on usage of Y2038 affected file systems
Thread-Topic: [OE-core][PATCH 0/1] wic: warn on usage of Y2038 affected file
 systems
Thread-Index: AQHXBfbXdapzdhrNREqjjctgPRwPHg==
Date: Thu, 18 Feb 2021 13:06:17 +0000
Message-ID: <20210218130559.43404-1-florian.bezdeka@siemens.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.29.2
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [178.27.123.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 06115b28-c183-4c2d-1047-08d8d40dfa8b
x-ms-traffictypediagnostic: AM8PR10MB4036:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM8PR10MB4036CA5FED87A2EEBB489CD1F6859@AM8PR10MB4036.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VzBsG+GuC85CkZVCXsXWQJ9CYd/p0/Di38qYoaCvXadKge56VNJL+Vdujl2RqLRsF605ENYGNw4SnKP9g4fzLDClkomG58ynv2Z/83uCU5X2r9vf8UBdqlNswytWDRR4JKHakipMZnChsjjA2l2SU8ccYOFETFl8JuHoUfg/AFQGMaOpQMx10O6wHGrZFrICVd9pfhvHgCMPDqspUvY2LIVHNEqyjQc+SuN7Q0KwMv++x/YILklyUjnEPREbZf/V/ZXRC2TLZ/wQfrhVmjBd/js0jimfbwi0HjlUAzxn2rplnV4fAGCmUYp9+NWJl2GFBAdes1LhBhUo3QZCpjT6ce+kLSyHiQggrXyeNgNZEhADUAkzx8ORKWGL2X5vSrxzdu0jRLRtULIyqiTuXqu2+o8Ei92cxMrGYQL6A0RX1o8WlZgmQzgKA/DE1B+SMpP8sudCN44OTstEfekrPpBw/m92XOj1bce1QWqBF1OIt24BV8srfb4aHs75eSHMJi69koMV+U5f25f2g/vqdRhtvw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(66446008)(64756008)(66556008)(66476007)(6512007)(76116006)(2616005)(26005)(83380400001)(4326008)(66946007)(2906002)(5660300002)(107886003)(8676002)(316002)(91956017)(36756003)(478600001)(6916009)(1076003)(186003)(6506007)(6486002)(8936002)(86362001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?o6zApvpgm96Ykc/jVyY5YukTHMuLpQMt1Js7wg+Is2FaG57S+6g07QN1CT?=
 =?iso-8859-1?Q?J1TdozeGfWqkFpkyTSVaHIZw3MYAqPVWEvgWRrjGS1rmUElckzGc5HNEnG?=
 =?iso-8859-1?Q?zmnLjp4/6+UIsFMlcPsCMh6sZ8nHJ1u2RldnAcvLlkZl5mmHWQSlAzBbEG?=
 =?iso-8859-1?Q?WJMuQ5es2Mc5a9IRL9dRl7sD6EcghB04PbNw/j5sqYyX/slWZoVPPrSlpG?=
 =?iso-8859-1?Q?f3KK/pq+IcxZkwyNXFoRY8Lza0kKEZA78VbKdJbRVRsgvtSPbn72uNhGEd?=
 =?iso-8859-1?Q?ojCdkuBIwk7l6OY5fjHEweU/a4pyChVckV7CRXVYn6qNZ9tmZfCJVhtMWJ?=
 =?iso-8859-1?Q?WYJklvdnIf5eOzrRcLVLol/KdsZzscXdLSbDyk+C8O1f0SJ2DYTuH1B5rc?=
 =?iso-8859-1?Q?OTHVey+b1sNKDu0jw7P8Sa6nKfMRzFygR2uEHiY/BXulIEM+olJQ0ES1H3?=
 =?iso-8859-1?Q?aBcvccdco4nI0XJsBso0TxFr6Fw3HLm+RwRmZ/URkQoND9FrjLEUGgWqOK?=
 =?iso-8859-1?Q?s5JXzCQwf4PDjA4dChBm4+rgySrCsIuPPKYKwD7rFHzRNnWSvllqPatCVi?=
 =?iso-8859-1?Q?H2z9hzLkzAsrmzVXjfLntmu5SQs5BaDFkD8x/ni1XlpXO5UOCOP4Em7KG/?=
 =?iso-8859-1?Q?vWZhUoZeMC37EORuxwy6SlE171M7c9YuUzb/BVEEx0eINAHYKHv3HgskNu?=
 =?iso-8859-1?Q?T7THzaRgVhOo1IDieeY7t0SNFmCYBTvMaRjOdBG9EstRDyexaRtTE7AMN9?=
 =?iso-8859-1?Q?NDk+pD9ZhvL+L6Cxk7GcvZPAEcF2aNBei3Ew65NkGhRe2Ru1CMy3nLKdo0?=
 =?iso-8859-1?Q?8c/w6/baoYneGd5RWqsX3vnnUOMcsg5KAlt5FGtZW9P3uhfEGYXji7EsQi?=
 =?iso-8859-1?Q?HWRkDjGe8oJWElznE+njX4n0kewthtL4950Pf81lstno/0hiLobHEFQTkI?=
 =?iso-8859-1?Q?U33h0droPUY7GN1Ps1CJ1V4825w4SRSlvVE3OwBk7I8+BGt9f3oHcPRepB?=
 =?iso-8859-1?Q?uygPWUn1O6S1XR+HCTvvz1equikjhY9gr8Zl5VBwIuU4W1m9llSm25r0GF?=
 =?iso-8859-1?Q?uI505N96YtR9AFUdXviIXgVzBFrECy7x3quREbh/RMgGD0cHxEJA9zabZV?=
 =?iso-8859-1?Q?AUhy5Mwu1I9wnl+TbiKbKx5rGfr3TS99orqXSd5EUm3tixGmXTFR0vVCdo?=
 =?iso-8859-1?Q?MoDDOeNAHovzC4uoMMUlvf7dE6lYRVzwD89Y0eX4gb94oJXfnMOp/fE2K3?=
 =?iso-8859-1?Q?qs5Vv3aH1OsHv/y6Cjo+3jjDSML51Ew/l04T/7FE5VBqYBaMgVxWRSDfPK?=
 =?iso-8859-1?Q?MmaKpvI07igS0ajEYpG6AHfpQSi8/ipnfBDNgJTV0cZonAUOlkxrF8FYiC?=
 =?iso-8859-1?Q?EhEPeypLAT?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06115b28-c183-4c2d-1047-08d8d40dfa8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 13:06:17.4996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQ0to84kmEHzto52uYdXrAP77ylTWk2tfNQoMP15B8i2DSPS67GbNhld2KZNGRQ4v3E6IB/B34uqDupjZEVeMeKQzFBQ1XbLA56VRod2bGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4036
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Florian Bezdeka <florian.bezdeka@siemens.com>

The following patch is the summary of a nice journey through the file=20
system jungle regarding Y2038 problem. It all began with a warning which=20
is reported by kernels >=3D 5.4:

ext4 filesystem being mounted at (mountpoint) supports timestamps until
2038 (0x7fffffff)

When reading this warning I was surprised. Shouldn't a modern file
system like ext4 be Y2038-safe? As it turned out it depends on the
inode size if an ext4 file system is safe or not. So why was the
inode size not sufficient in my case?

The inode size is chosen during file system generation and depends on
the size of the file system that is going to be created. For details
let's have a look at `man mke2fs`:

-T usage-type[,...]
    Specify how the filesystem is going to be used, so that mke2fs can
    choose optimal filesystem parameters for that use. The usage types
    that are supported are defined in the configuration file
    /etc/mke2fs.conf. The user may specify one or more usage types
    using a comma separated list.

    If this option is is not specified, mke2fs will pick a single
    default usage type based on the size of the filesystem to be
    created. If the filesystem size is less than 3 megabytes, mke2fs
    will use the filesystem type floppy. If the filesystem size is
    greater than or equal to 3 but less than 512 megabytes, mke2fs(8)
    will use the filesystem type small.

The relevant parts from /etc/mke2fs.conf:
[fs_types]
...
        small =3D {
                blocksize =3D 1024
                inode_size =3D 128
                inode_ratio =3D 4096
        }
...

So whenever you create an ext4 file system with less than 512MB in
size you will end up with 128 byte inodes and your file system is
not Y2038-safe.

Some words to the other filesystems supported by wic:
 - ext2 and ext3 will overflow in 2038,=20
   The user will be warned as well
 - squashfs will overflow in 2106
 - btrfs uses u64 for time representations, so Y2038 safe

Florian Bezdeka (1):
  wic: Warn if an ext filesystem affected by the Y2038 problem is used

 scripts/lib/wic/misc.py      |  1 +
 scripts/lib/wic/partition.py | 38 ++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

--=20
2.29.2
