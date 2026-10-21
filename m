Received: from mx-relay22-hz1-if1.hornetsecurity.com (mx-relay22-hz1-if1.hornetsecurity.com [94.100.128.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10248.1792586272480636281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 05:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=q+1Nr66k;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.32, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate22-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.84.103, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=oxLH0IMx2EF/IVu1eANJmBViKCVobhWroC3XNMQa/+g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1792586268;
 b=LHlBZjuxdMPsrBnIx7sbsClOtBJ+wE8RWYyEnfsAS4cbWo54/qca+NNRSje92Ltqg2U9rBPL
 yyZ5NiEZ9YCJu4WpjEJzwe5eAo2M3XCd7SB+QFQJI/q62R4jsPbfR/nDqlpxBStzB1Ir7kooR9b
 HUZNlolcc21GDNHAaFY757fJkTVoLlqrgIJHSOA0JLDxFicJZE+qPkTxJyl4NqisEVQsrOOCCww
 ZJ/HGbS6PryH8102UzhhDL8Y4I0thuy/GhePNBoBR1RIR99ixhSZpTVC1LVMxPl32nIX+aQg7ZY
 myKEzJhMhcUCJu6hFasMPas2mw+2lFGaKy4xw5+xvUdjA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1792586268;
 b=jN8vD57DPFdD6cegXnJcnukmZGCq+r3n66+FkbaZrjedW9LuL5NXMXAoJm+6EI1D4tbB56L0
 etaMvfi/nk9fwO6umPYTmhwEAMCZsaqxrn5hY+/Ds2oB26GVwfqS9HvRSFF4nSBYwLqcasEOUgY
 eQMTQsK7RG76dEEQzBzlzwEvXF/wNa/gOhMH/rjGmndecgmWEf9ehcZkv24obs4++nJWt2nZPgX
 X3sYIrZRuZDYtUcb2rbnbQ2KXEgFrGR0Eg1Eng+ocQoSxAt7GAyBeFH1SqlMZMybgEDp5hCikD3
 ADvDZolyt4WHQ+NfMEM8/ZPgvyRrTt6XnJJgGk5z+yNRw==
Return-Path: <tgaige@witekio.com>
Received: from mail-northeuropeazon11020103.outbound.protection.outlook.com ([52.101.84.103]) by mx-gate22-hz1;
 Wed, 21 Oct 2026 14:37:48 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+86k0kwFXYrn/LdzjIaxRWX73in4h7UEU2oWXxxe2SA7XlduK1kw6+b3xW69VTFzRCxO0Bcw/GBUk9nOzmHgdSubl6Gh9NRfsebn5L5FiJcrEF5ibfYAkdijhPI43FSBMPKHvO20iBpOsc6giwS81cPIlTlraODBW9/ZPuUJVqBEteKfZErX8kYjaOPnWIZBqC+iCkHzdyZ2iufDi0Sc5LGgN64t/a7U6iFMGCLUm25A2nIYwgZTthka8ind4FdWHGcPnYRCRQyb2RNUF3uEqpQ3+Vg/Zi+r+BU+NcKZihlhzVzQAZoxW7W1HgtXca5oml2QUoAmtqDwTFkeKZWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxLH0IMx2EF/IVu1eANJmBViKCVobhWroC3XNMQa/+g=;
 b=yZXpkQEzMQcRQ6MjQwaLnQletZ3hXy3B7XaZmjNJn4KvYDYRMbnyPuu6I09fO03HW0xOfgGuNTCM1a5Bp6CpEU2Cn2Q/ET/uT8+m7qdOQnMCz4XEhY/xQywaPU2xqIjC24a55e6qWgpVrRAbh2x5DIDKsWN19mXHgKCYVpziXsy62jGIVcswaeqCPvzfxviqHltHWSz+zlg9KeIMitSsM+3VDyniI5L/yXcZbO0BvVTmdLkRTXqJyfTYtaNUsydHnDvjZ6BzUlguuC9EH9hbRhtJEjQxz77c9UqrjjpW2Jy9pTD0P22rRfmyXL9DCT7yRDlhJp2j4bvNj3BLWZxCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxLH0IMx2EF/IVu1eANJmBViKCVobhWroC3XNMQa/+g=;
 b=q+1Nr66kpBa1ueMCr+3Bcv/O0KvG76H9gVP5LdU2GtW7uClNDUR7FH2nqkkiKsgY6fobkyxZwjYklaT842+SbYgYsw7ovzY8lpsMTNZDYO4Fb54rxdodfL+olePExuidWHy9EL+r/UTw7cwNt8fuwBK+zQEvGPPq5U5QJGhn2QpIU4Itef16nNWSy2s60lJhv9p8TSsrQEWFGlO44UsTQfcUiO9GPpHcvdXiDvmQXRoV4CcxC6n0ZnaklAVMY1ExfO3dnCHZ+o5DbQfxeGk3nv/V0+AMRTN8ToJzZETGob7VVyWeNBA9HrK9XKwnW5pMkXOPbCyrCUd5yj0OYhpf7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:51d::6)
 by AM9P192MB1016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 12:37:41 +0000
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58]) by AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:37:41 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Wahid ESSID <wahid.essid@se.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/2] python3-pyelftools: add missing runtime dependencies
Date: Wed, 21 Oct 2026 14:37:22 +0200
Message-ID: <20261021123722.2713530-2-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021123722.2713530-1-tgaige.opensource@witekio.com>
References: <20261021123722.2713530-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:51d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P192MB1862:EE_|AM9P192MB1016:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f1b16f-6731-4bb5-dc6f-08df2f70192c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|23010399003|1800799024|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: CwN/WeSw5brOietZ0DPfVgK+TTIBdugJK1n502MkHDTwQz5lnv1EnNpNR5T7+pVteyZ//4LelfiP4u5Fpz31QIPm30Jgkfy8msUZeAu4aVmJBJn6OV3lSepj1a2rIL7WntlfQhbwZ/0eISAOLDnHXPWCboG8E1KVYX58j6cOQCqJ9gDzRfcMs3fNG6aOLesrXpDLDc1u/e39nt33aAgPmKkp+Cp8AgrO0SFQ/wPfJwupja4uzzQM4ucKFEr9wyU9kGTLIffz6yAm96QS3qE9fuIQh4ILOEkpec21pNOQTxWoEGmaAb7RzVqx3mZBORuE9pg4wj8vvdmHhciRgcXSUVjOf2sxtOQqgLYyseoIsVr5L9RmMcJ723NXBkQPrZ4Af6GgrJw+HhHbNM631DrNj7StPjc8ZA7hm9LED0DxrNdGVnKWCtqNZ0WQYy+/wAfMbcfv0BA9kvNzpx/iIm4DQ+lFUp44D2XYv+TFB4r/lBoNJi09oLn4zpzLZieT/JxoeH2/2ZJ+B6iHJmNzh27gXHbuBo+SjP9HdkF2elrHUmeMpKJttRX0gwnViPyw01n3v5zKgcWysn7apVTJNTcX5abyu3LxP6+TfN1gGlJ2mEIpEePGgib4VD/OvyaRU0mfKbaNV+bCV4fooFuhzg7ZOachm9D9YW9HoG/8N0PKLB4DR/p5qlwde0otQaXVbIlTm902SS4o3x/2LB7GQCQKJZTF6xKkjnmIu8Cu31LoJ0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P192MB1862.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UaLw0WHKUOZ8LNrDHiREld6vEO2IoBxRAoxwAGZts6CkY14y/tKVeWXm3D6K?=
 =?us-ascii?Q?LtXwlRwvTQMBVVZoWTFkZmVthLcqRMkHp3JngXj4qMOloB48A0MowuBeiUle?=
 =?us-ascii?Q?Q/aR+Hh8HW+WLV8pCRBRKUn0KRJUd5CYwr67JNGjmgv48dds7HRvu0+r4VyQ?=
 =?us-ascii?Q?tBIb7jM3LGyuXQL3D5VgMq5VdEnB+dUxiuHO8bqewF838LuHenq6bmf7vVPh?=
 =?us-ascii?Q?uSFjK60QLtKwrhxDyhC4awYRbNfCNma8I4bnhRL0PThrzNC8pgzGdKVY1kzM?=
 =?us-ascii?Q?GXPKW07nrJSQvSta6oR00IaVysGbHzoyNjlzfbY26A8he08mTasNnECfPnIG?=
 =?us-ascii?Q?D+bWyjy2z8CPYcAwZEStp2VEYrvnlmqf/xDwk9WiQCSmGK2AcTVgU/VX5Mq8?=
 =?us-ascii?Q?4TEquwrM3YulAU/5fpI8mNWYXTp+NVr1kUhkkUJ1AOhJfpcxT5iop3ZS/RkC?=
 =?us-ascii?Q?A3pBDIRlLD1ahhCeGHN/vkVJNQiugI6MweC3H08g/sQuoxUFS/kbpG/EzZgp?=
 =?us-ascii?Q?n8JganhJJ/Y1EX51vvEc9GjfGGBIyx8IqAoDjvnXWLGR/lYGtJEtyS6IgRsK?=
 =?us-ascii?Q?V3YgoUn0yn0nF/fYzn8bd/lVbn4GZIaaUccZIwf3uuGvMtbLQ9DShFhaydnp?=
 =?us-ascii?Q?9DYBDshI1vlHEtJ+RTSMsLEVm1PegPFOo/A6b8Tk7zGHVhslW6GFMtKBEUde?=
 =?us-ascii?Q?x6uKa93xMZu416Hc3xpO5uOdEFeM5QawJGMIFFlcT8ESiCYYmLERePvvn5+R?=
 =?us-ascii?Q?8AuCvkIRZlNpUQhz39H7iDfNAJenJzfnRYaeNROHJafkM/VZ5ui1vgiUjxkT?=
 =?us-ascii?Q?fm9+IZWgg076H8cNF17ORuT8PlbaE6BUKqOD2f9846ajfg6pxA/p2nKqFJ2u?=
 =?us-ascii?Q?kseGQ9b/QWiDZsxg1qQqLkvrnSMfR3WxOnaVfcgtdZ7Hu5IjPNYFSbTuIIjY?=
 =?us-ascii?Q?q+jy4KuxE01Tib0IaKTcKLF1p9pborlApzM89JkiUS2BTnnfjKBTfAYN8YvV?=
 =?us-ascii?Q?GQR71oeuiVrga1Ecw8TKE3GsgQxCe5zWKjEg+M1gYsAUvS7bOsEOXuN6/wSI?=
 =?us-ascii?Q?h7PtElkNA0roAndfCNim0YAQ8Jiiw7OoGWNaRkJn2TqInBunznzhEs6+kM3v?=
 =?us-ascii?Q?SY/1W7/tpk38Z31RAkIdkwlBZIoloP4eXxTf9VZ9K7kvfR6uVlK3Vw6fcnKB?=
 =?us-ascii?Q?MwipSL4TMryLOh72OFU+8l4lBoNcfejw+Wixluay5NxB90wBU+XEouFSGClW?=
 =?us-ascii?Q?dXEjwZJEFZZi4YVIjYYt5IpH+8qRbY63H4Jj00jyJU2Esyw317VAgqYo4WKN?=
 =?us-ascii?Q?KM+NXBn0pLwZp0JYgSHEOgQXZH/Hsu02SpfTLBZ4v1AzO2edXczDSHhzDwUq?=
 =?us-ascii?Q?2ahrsX9WWUUH76svMsWEYij8dg0KOS9Xg20RHXLxTQZan6MzFrKFSxsJyzKb?=
 =?us-ascii?Q?OP4g6bOfHcgZCEiKjNgow/YXGjp1JmIAaHDlig6qQlW7JtBnKCKDm8enbXeE?=
 =?us-ascii?Q?Kg2RdDkbOOgkDhZ2FVNn/rtIZPffk3LpVQKqW87dia1QB33umRaW3ap/nwdP?=
 =?us-ascii?Q?uscf+GRTRFMquSa3CFXav4sMHZ3v0WfBQhHHy8Sd/GBkZPY1VP2YSPVD2amE?=
 =?us-ascii?Q?LbnzbNUM1nQ/AJYCkDRwdGCIYdJo5XRBQPm5iAy4qqGbH6QGLY/sahajJnyb?=
 =?us-ascii?Q?U6t0FJXHWqP6nRq10Eg0xoC1/6M6Pcp7zoSaD1drM2Xf+1eAtjGqsmyfjkUv?=
 =?us-ascii?Q?N1BZV21aog=3D=3D?=
X-Exchange-RoutingPolicyChecked: 3gwfEauCjclYI0GPjjElrqBc4svz+o5MPL0lDCZYpolNP8v3mMR3cApv3Em8jzAsl3RDD9XNPKS0THwtr0lEt4aB5UXnYakBcDTQSzlskglHT0jnfdXQHet6ovTlvImP+7dpMUaCy6KwbqKvXlXxvSU76br1knjO7qlErxROtjxMMGqkknwuYZ4PxnCowH6QmLygeTPzKgvdxYOk2JiMpa2fJb07kfn2AH8vv6pvvNZqgmeaesFr5j8Ton8lZeOnmvFtcBuJl32qWdcQi5L7NUvE2jDzBUObsQUYcQlyUSG1pfwdaCNNiRvuy877d4Xy7/63Ji6DLU0gDzbvknqYcQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: arV8lRV05p5062LYhOEXi5ZPJ3Gk61sw6yg2RMsmeudIowzny7NSCH/b1n2P4+3acWEdLYzTV48hKUKL6cw5TJRjSVzRv/j1wb/jYlmnr7d9o1NiFMaJkdZBTY+rnY3MrKwQ6TOlz3x0DwqM+wRZRvUVVV/VWIXeOYunxriiXML4qhZvhguB5NeGhyn5EguyjBUlh1Yya2cMJ9G6fmt2j2+DpVNv+AQ6jnRegbE1qZAF3EYvs49hyjJC3Xbg9cgZFXtbnj0fBwe5aCcmuAQF4dHVrsvBJj6y/zwVf15gQ+iD0pEf1k+iszuZY64463BKNriRKxBEysBVoDzx3eZ5E5H7g0OKtkKWjZM4imQtYVVPNETHd+8ekNEUPgj1zVQEa3+PbELScC1vzTy7EKakCEP0b5T2DWZ71SpUIcBfPwo/c9lMv2pBncZvtzrdyGMdMzPdadb5YvvHxmNcSm+0N4DqtCdT0zA3MgBibrhhNUaSxYO5J81D9FOhs8ojqsLWv3ySq5b13g0n6Q3KdX16d0Sgg2VTSt48PvS8NLtTxLtB+krv4AATrsJcOHAzirXN/3iM09f/huNbO6ZNfV3wj/XJzI3VJSbNp3218BJCmbHkzDKGJlj/dn3usiWCXnej
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f1b16f-6731-4bb5-dc6f-08df2f70192c
X-MS-Exchange-CrossTenant-AuthSource: AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:37:41.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9L961A6gjC/EqJEwvuI18cggHijL7Sm5yoRjh/sVBNv3rUQPcKNQa8030cqMl9vP9n4srNVJHDgZmL0wR8DesQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB1016
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate22-hz1 with 4j8phn0tX3z2Bqxs
X-cloud-security-connect: mail-northeuropeazon11020103.outbound.protection.outlook.com[52.101.84.103], TLS=1, IP=52.101.84.103
X-cloud-security-Digest: 3c97836533b6006ce948183319edef66
X-cloud-security: scantime:.9642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 12:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248396
Content-Type: text/plain; charset="utf-8"

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

python3-asyncio and python3-json are needed as runtime dependencies of
python3-pyelftools else the readelf.py script run into the following errors :

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 87, in <module>
    import asyncio
ModuleNotFoundError: No module named 'asyncio'
```

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 77, in <module>
    import json
ModuleNotFoundError: No module named 'json'
```

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Wahid ESSID <wahid.essid@se.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0dc1a2f9df58cf2dd1418426e38e95372aecdcde)
Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.30.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
index b799f5acf8..bc981051cd 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
@@ -12,4 +12,10 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
+RDEPENDS:${PN} += " \
+    python3-debugger \
+    python3-pprint \
+    python3-logging \
+    python3-asyncio \
+    python3-json \
+"
-- 
2.43.0

