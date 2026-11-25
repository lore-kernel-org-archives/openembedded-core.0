Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47948.1795630260325075966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 10:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SyTLw2+9;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: amardare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=41444; q=dns/txt;
  s=iport01; t=1795630260; x=1796839860;
  h=from:to:subject:date:message-id:mime-version;
  bh=yXmfs5xH3LWg8OpbwRVBTGzHtpfH436FOwD2elwu/nM=;
  b=SyTLw2+9VGWpFxZTOf6kk1NTMY35hCiC9EmlVCH+Y46P9+5y5qbh0HqC
   vitnUY+nPOg+ZLPgSfr9XCXWyVXgnZbZhACohRe6IIOyVQ0xBzv+d8bcQ
   g+aMO/NFEwxQK3398rWf+mOf5LqGk1HeV4mc2mvdcm6B5lL8dOMURPR3r
   yDjLjs82imFJ8eqX6o4dApfNpfg1zazyhICSCwF72EIf9P4YpRD5FpbSa
   2DUyfjC8tfYPyF4lXapYu33zB0tVHfaYBi0x/T4O1UHx7xXSUlvOGtiTL
   ovPuRqCQWe1da+EDexKvl2cF+1g17JHLQ2I1sOfAakMZagwTIL7CDG8xb
   g==;
X-CSE-ConnectionGUID: j+nKSnL4QDeFaOBNVOI3OA==
X-CSE-MsgGUID: G/TBKqJeQEm7r9LNfDZZSQ==
X-Files: remove-elfutils-patch.patch : 6636
X-IPAS-Result: =?us-ascii?q?A0BNAwAXIwdr/4v/Ja1aHgE8DA4LLoErgT0xUxZ1gRESS?=
 =?us-ascii?q?YgjA4UrhlmCIYEWilOPLoFNgUgUgWoIBwEBAQoFPRQEAQGFBQKOIwImNgcOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTwEMkBIBGBUGXgEZA?=
 =?us-ascii?q?QIBAiEBBgkeERQDBgkBBBMIBgYOgmGCGx8DNwMBAg4GQK08cwKKHXiBATOBA?=
 =?us-ascii?q?YNwGNlCDYJUBgELFAGBOIFYTIMegwAgASuBMwIBggmBd4N6gR0nG4FJRIEVQ?=
 =?us-ascii?q?oIyOIJdICIDgUUcFQmDdoIwBIIiehIbgTkeZIwRAoFJggKGVIJCLAFVExcLB?=
 =?us-ascii?q?wWBaAMqLy1uMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIXwMgXUCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSU+BRJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJ?=
 =?us-ascii?q?C8FGSY8GwqBDCcdHhkOAikGFiELOG09NxUZAwSBNQWREAwEIQ2BWmKCVjMRA?=
 =?us-ascii?q?QFSBSMTARMWAoFFGx0BBRCTWI9OggELAYxTlChxCoQhhmODM4IOjz6GMheEB?=
 =?us-ascii?q?I0UjXCBAIJxhCmDUYgrj2B9I41nhAqXBgIEAgQFAhEBAQaBNDsMKYFGDAdwF?=
 =?us-ascii?q?TuCZwlKGQ+XN8kneQIBATsHAgcPApMRYAEB?=
IronPort-PHdr: A9a23:GJ5+yBVP/1v6LbAJ323wI5SfWTrV8K3PAWYlg6HPw5pUeailupP6M
 1OavLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:zpMBtqpMalYEB3CydQb/aFUtSWteBmLBZBIvgKrLsJaIsI4StFGz/
 9Yp7Vv2eKrXPSSgZowqPsjyrBZFpNaEioU7VkI96XptJ54hgZTIXdjDdRf6bnOZc8HKRR48s
 ZxEN4iYdJs4RybVrxqjb7bo/SQtjv3VTLamAeXOZXt4TAE+FH1+00o+kLU3i9MAbbRVe++ok
 YuaT5r3ZgH+hVaYS14p1p9viC+Dndz+s24U5VJlO/0T5lPUxnVLBpkSLPq4JiSkHdEKQOTnT
 s/Oneqzlo/7E7jBKT8EfpLTKBBirmv6ZFDW4pZuc/H8xEUE/mpiiPtT2MM0MS9/ky+Ok8161
 OJDvJmxTRZBFqDXkYzxaTEAe81FFfMAouCvzUSX65TJkRSfKSa0mZ2CMWlvVWEm0rcvaY1x3
 aRwxAAlNnirm++wybSnfehg7uxLBNXrJo4WpkZ7xjjfC/s8KbibK0kdzYYFtNuYrpkm8cf2P
 6L1WxI2BPjzS0En1mMsNX4LtLzAak8T3NFvgAn9SaIfuwA/xeHquVTnGIK9lteiHa25kqsEz
 47L1zyRP/0UCDCQ4TjG9FGXgMuTpA/2dos1PpuG0d8xp3TGkwT/CDVOPbe6ieOyhkj7X5dUL
 FYZv3J066Mz70esCNL6WnVUolbd4UVaAIUWSbBnrljWm8I44C7BboQAZjdEYcYqvdU7bTcrz
 VSO2djuAFSDtZXIFSjAq+3J/Wra1S49Aig+TwwdbwY8zty8utAXqBzjfORYKfvg5jHyMXSqq
 9yQlwA5n7gVgMsB2qm38FyCiDW2q7DNTxUp/UPQRm+j4wZzaYKpaoDu7kLUhcusN66DRVWH+
 XxBkM+E4aVWV9eGlTeGR6MGG7TBC+u5DQAwSGVHRvEJ3z+s4HWkO4tX5VlDyI1Ba67opReBj
 JfvhD5s
IronPort-HdrOrdr: A9a23:u5sCdKBmtliaeh3lHejKsseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskdtZJhBo7y90dq7MA/hHP9OkMIs1NiZLXLbUQeTXeVfBOjZsnfd8k/Fh5RgPM
 5bGsAUZqyTfD1HZK3BkW+F+qMbsaG6GdeT9J7jJhlWPGZXQpAlxT1UTiycFUp7ThRHA50WKL
 qwj/AsmxOQPV4sQoCeHHcqY8jvzuenqLvWJTIWDR8u7weDyQiv9KP7FBag2BIfWSNkwLsp82
 TJ+jaJq5lLtcvV9jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8RryrplkO0a6SwWdvtO
 OJjwYrPsx15X+UVHqyuwHR1w7p1ytrw2P+yGWfnWDoraXCNXwH4ot69MNkmynimgkdVeJHoe
 B2NqWixt9q5Cb77WTADh7zJlVXfwSP0D0feKUo/gNiuMMlGcFsRMokjQ9oOaZFOj7m44Y6F+
 QrJsTd6PFKNW6+VRnizy9SKBjGZAVqIv9AKXJy4/C9wnxYmmt0wFAfw9FalnAc9IglQ50B/O
 jcNL90/Ys+OPP+QJgNcNvpe/HHfVDlUFbJKiafMF7nHKYINzbErIP2+qw84KWvdIYTxJU/lZ
 zdWBcA3FRCM37GGImLxtlG4xrNSGKyUXDkzdxf/YFwvvn5SKDwOSOORVgym4+roukZAMfcR/
 GvUagmSsPLPC/rA8JEzgf+U55dJT0XV9AUoM8yXxaUrsfCOuTRx5nmmTboVcjQ+BofKxDC6y
 E4LUnOze17nzCWZkM=
X-Talos-CUID: 9a23:JTRLqmDUoGgc/Zz6Eysk8m0vHOR5S1HQ4n73CWmGLkcyb5TAHA==
X-Talos-MUID: 9a23:V0bqtAVV0MNo60Xq/BCruBtBLeVl2omrV1pctbMIl/u2DhUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 18:07:55 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id D858A1800020D
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 18:07:54 +0000 (GMT)
X-CSE-ConnectionGUID: eij/ZpJzQsW0LPp2SNRFcw==
X-CSE-MsgGUID: q/gj073eTRa8zyqS2mXaQA==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,233,1787011200"; 
   d="scan'208,217,223";a="76849057"
Received: from mail-northcentralusazon11012000.outbound.protection.outlook.com (HELO CH5PR02CU005.outbound.protection.outlook.com) ([40.107.200.0])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 18:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hD3Xm7pqnz6IjrzK98fbuJDD8adjfO4sRYXwV6BzARgYAo/q9ZtiLQheUad+EjJNbZpUNCPGJCQWJzFfcbLyUj7wNCp6ncc6Yc6AF3+QbKWFRshjntMNUIDjoLb9rZXemFE3uM6oPFO4jiKfsnt/ZK0pk4Sg+cNY7OkzH4N3aOMZ1P2suezqhRuNGPBgqlAl16we9x37k+DaiXkvdXznTva2p0+92YxlG16FhIefVt5JrK9dZYumniu75E1x/tqb+IYMgzv8wGMjuBiUYXXfDHNjGjw1W6Dw0WPPH7xQwxSj5y9SlIjT1D/L7sudA5U4Rvzg44ZUgmym5F6FdWRUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXmfs5xH3LWg8OpbwRVBTGzHtpfH436FOwD2elwu/nM=;
 b=ax0QvDcPDBgGaHySSQulkA2rsnssc1+dmmrli/AWPLSwEaTOZuASL3X6h4K5BbsoPtI12M9dGevOP0iH7A735AYCVYl1QGdgKzeiL6YjcOfWhkqpIR+dvdNYyw1lypMWN4uwOlfScN9KItRYv4yzqt/pyJOdS3q9Yx4hjKSydjUbyIuLEsqIL7pHSdgqgxidIOa50K63ZNjIAeMQ/Kwk/TiCppsHFyvpPNPmfTeqIGjcsKLWjCiX7eJIs9EBgrg1YHy2xdUU/qJ/xpDyM9S6tOdPE/9YB3GP3FL5tc0KIlIqWeBvl4u8OILMcsDqX6EqGykWJ+zyvJq2w4y8CAYf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS4PPF6EA6DD735.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2d) by MN2PR11MB4567.namprd11.prod.outlook.com
 (2603:10b6:208:26d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 18:07:52 +0000
Received: from DS4PPF6EA6DD735.namprd11.prod.outlook.com
 ([fe80::e686:f7d2:c62c:d9e5]) by DS4PPF6EA6DD735.namprd11.prod.outlook.com
 ([fe80::e686:f7d2:c62c:d9e5%8]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 18:07:52 +0000
From: "Adrian Mardare (amardare)" <amardare@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: remove-elfutils-patch.patch
Thread-Topic: remove-elfutils-patch.patch
Thread-Index: Ad19B2ry0Y5rIQ/XR8u+LHQluKpLYA==
Date: Wed, 25 Nov 2026 18:07:52 +0000
Message-ID: <DS4PPF6EA6DD735F76F124E4E7191CF3350CD432@DS4PPF6EA6DD735.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF6EA6DD735:EE_|MN2PR11MB4567:EE_
x-ms-office365-filtering-correlation-id: 831ae018-3eb8-41c6-e629-08df4b1f05e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|6049299003|1800799024|3023799007|6133799003|25016099003|18002099003|29003799003|12006099003|4053099003|8096899003|260925021911599003|56012099006|260925022911599003|260925021311599003|11063799006|261022105027099003|261102123227099003|261022075727099003|261009223027099003|261021121427099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: o9UsgejEYPzBD7RU/DgkrUxKXXFY3K7qcDnF6Pry/aUkl4g6LPY4kX2qOxT1LhyweRGPMNwcpeF4eJnvfrPGRaYcQOiR245jL38DJnbbT7qql9hpViumM0ueF2UnASnJcAcz/bLsOWwIP4vO2E/8rT16DzmbzetynqUCTraHxYn2REuWtN9PGJS9YhSBFxUv6bwxXcpkx/Lc74h95aPH8pdiFGUpIew6mEfPyBJazwtszvDaicqC4zumiRmLmVjOta5eMa6N7inIS7wTPqAxev40sv8B0igO8d5AUQ3qr3g3C6S0f0iRFqz99ijvQIYoiuoh10UVNhMbewWO4/G+aTrQhklDO3T7AsnXg1SXNF83k2hUa/QVKDjnFKwhxyw6qLNN9DyE5JezGzVmbr5VPnUaXtP3/8hCx0zF7e815w1URL7sAZHTjPK+3arqaj7cg0ncZWe81TOPuph/+MtmGDwN/6ONWLN07DTzN7eU/7M6W6Va/GM5KPaUs9obIM4Zei+Lv6W0E+ClwaRV0HFKWOwYrfgnxvor+kXdgW77TSaU1xIIsWLtI18lsGc9szVySbhpEwVdCrX/D9npf9/GD3kp9KMtc+pdEK1r0qwVnjMVFlDJ0d1oGBAZtF8aDkupgcxIGa4BYF+zZd6VcscO6xYKg3RG2GwSyywFB4cnBxg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF6EA6DD735.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(6049299003)(1800799024)(3023799007)(6133799003)(25016099003)(18002099003)(29003799003)(12006099003)(4053099003)(8096899003)(260925021911599003)(56012099006)(260925022911599003)(260925021311599003)(11063799006)(261022105027099003)(261102123227099003)(261022075727099003)(261009223027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z9iQQcnLgbLKLvfadwku1sPnEPZWRMVx6xzZhWo3YF3Fuc2Tbsc/JyismUz0?=
 =?us-ascii?Q?7mhSmBwLzkhoTiLa0dcC1dIkM4PWU6CtABdWvrbeEn2Jh7m0NV9DxJ/N3mZI?=
 =?us-ascii?Q?2rtoKmDbw/aKYjMO4uCCLvVaXkJjpq8bC0zKwlk2CElVGiujXxSlaBjCfgzi?=
 =?us-ascii?Q?PqYm9VPE+1vvk9HKSBhWZw63Av5xxVD2dEGxePRmpSO1bVcHTaBrqPz+N5Op?=
 =?us-ascii?Q?UZocQWnoHPiq7QeyLtvaGE39UC1FQ8gdRMST86fkNO9tEeW6uElS6KLmdM+j?=
 =?us-ascii?Q?XuciCzW0Ykoo3Be7stWtfdvJHRjhe00scPUnNbXEGtyHjKTTAiFoPoiXokEJ?=
 =?us-ascii?Q?onu32d29GRIE0SZPiczFcuFP9X3y8mxNWFZDSnZCdHcN9SjAYCXdd+paahn7?=
 =?us-ascii?Q?o6tWNpUXeyTE6FVROteDGjr/HzhABhl8+p0N17ENhTGgfRChPPt/dDuOU1vx?=
 =?us-ascii?Q?VAPDOago1gz7kGvu+asb/G2VaRhbop3GqMV55edXiuXfeyqy11b5Ua5kdz7o?=
 =?us-ascii?Q?dE9Xc42Ind9i19KZyIM0QWReyEeHoHEsWVQjW/Fux4uO2vjYhEc2xqR1TZyf?=
 =?us-ascii?Q?L4DRR6deDeJkoGIYo8wRlzYeLrrEVHUaB0gNi1xDHFTgvDmhzP2XBysm9seJ?=
 =?us-ascii?Q?VvMTPfs4S9NYHD9GYr20Gd913KKDqd82EH1oe7UpNLZliLV8lReQVDmSm/qj?=
 =?us-ascii?Q?GQbDxS5nGCsntdTiqzXeQwkusxY+amRaU/rihR/fqy5AyL0ndZWKrxvzeMj9?=
 =?us-ascii?Q?eehst0fqPBi/YaDJbDTZNScxBRNXYluC8iUZDOwGTpNLXDoRIm7vdj9Gde3Y?=
 =?us-ascii?Q?27wnC26EzlVAElrjb26DP/eVazg3Usi1kG3R1nA5xxV50Q2TZT2l0KBCbIbw?=
 =?us-ascii?Q?mtGDsWWGmAraI7pl73VnSQwjUk6eV2X9QwmFsN97o/95pvt44EKRhrnJolof?=
 =?us-ascii?Q?NKPBYPkiB0tqNmUOyt4xVQ89AU+ZTkAf5pQS4Sl4fxFfkJ1sthFQAtbX3D9z?=
 =?us-ascii?Q?LfsC8QEhq4RaHjHmu1sYxLoMsPL+q1tRaepWCrNwMLYigTEXVgm/x1U884QR?=
 =?us-ascii?Q?d482ds+X9Tfvlel8rJIT2Qn2lf9eGK/4kPOpFbHUPeOf9PHHa6MfTsRz/f+I?=
 =?us-ascii?Q?xCdZHLK0+9rzK/GhAg1CFHO0MOOWVCAnmu6+T2VKRbLqaOOmMwPMG2+ueBhG?=
 =?us-ascii?Q?7IK+crOzSeop6KqZwXsNnVfzrFOoaBzcj+l6jfjAFI+SxU1Y0Cn0v3+oj14V?=
 =?us-ascii?Q?HRIyaKxyLiv1OavUgFn3MWECmMMyXl4Lvuz3Yi55QKswWiUZ0azp/ClzgW+c?=
 =?us-ascii?Q?XSzHu2prtKzX2El4IYHCSVatq7Z1q9yh7A0MfFh8tGqlQEYFr86KN/WN4TTx?=
 =?us-ascii?Q?THUltyYnLSQEiX1SmWenPr6Lm18khu+kZIhxxKs+B1TDC0RhSBPEePLQa8gK?=
 =?us-ascii?Q?bzK1Jx3MfY1ygNbC7ZVrskNJFyW21/I6c+Bu5j+5LxHB3PQb3L6Bqpx6GdQp?=
 =?us-ascii?Q?keXrpDEFKOs9+Y/z1QhT9aq/BORjWIaaUeA25l9rRyJa60eCYfBtOG5Vrl3u?=
 =?us-ascii?Q?IDM0mClqdHkY5o9/s0eO6bNL3Oz52Ms/Og+othk09D2r9bCiYAh2TN0hkkct?=
 =?us-ascii?Q?F7/2XN/ENGuxorReuuQeHGZX0qCh9AlCqJDj+gbzAZvVj79YLxtGCRP906MY?=
 =?us-ascii?Q?S8dghnXig+m7/pvdgTgMoFvx1s6eSMjZjw3WCcFaLEYaH/yr?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oBrK6AzuB4aoZ2GnMv7eyg3JOdZlwjtYpNoyZjShdWVPYuhagLG8ZqvQM0xKyp6eFzNc2fWHWP7KwA53zMkma6E/8EMYSg4vZb/qTVpUIsyQjQyS+DYiKme3tm4JkuCAhU/RJeN6w5O/Zfav5huMsQjT94KDHiijLaGlJQhipuXJX4RpZkqvrvGlMoBF1ZEKH9lyzXSzf8LFRKNU+bKVe5+Trqp4m5xbQkZZJgXl+54lv4jSiGWjf3aZIdjHsYQN0ddcTrtzi3voBLWbxcOxXUx2TPPzUZ0YY5ss/ckAyB6ItEFUNM1Et0LsrrtteQdJ8uA2F+x6MUe3cOjB+DgKlA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF6EA6DD735.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831ae018-3eb8-41c6-e629-08df4b1f05e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 18:07:52.4516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MUanCOUy5U+G9CT7Wh3uCqUi4No1OTBMHPtaQgdCRff22nhjcKWi/Wj9jicupLC9aeBOpsKaruA/KG0fZt36gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 19:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251242

--_004_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_
Content-Type: multipart/alternative;
	boundary="_000_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_"

--_000_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please review the attached patch for elfutils component.
Also provided below as text

From 58595d5a42d0f775c6dcf7038fdfaa1b1bf9c2cf Mon Sep 17 00:00:00 2001
From: Adrian Mardare amardare@cisco.com<mailto:amardare@cisco.com>
Date: Wed, 25 Nov 2026 11:59:42 -0500
Subject: [PATCH] Remove elfutils patch

The changes in patch
0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch are wrong a=
nd
the patch should be removed ( ** also see Note1 below ** )

In particular this change in elf_end():

                /* The section data is allocated if we couldn't mmap
                   the file.  Or if we had to decompress.  */
-               if (elf->map_address =3D=3D NULL
+               if ((elf->map_address =3D=3D NULL
                    || scn->rawdata_base =3D=3D scn->zdata_base
                    || (scn->flags & ELF_F_MALLOCED) !=3D 0)
+                   && (scn->data_list.data.d.d_buf !=3D NULL))
                  free (scn->rawdata_base);

is now conditioning the free (scn->rawdata_base) by scn->data_list.data.d.d=
_buf!=3DNULL
While the allocation itself uses "scn->rawdata.d.d_buf"
Line 333 does the allocation:   scn->rawdata_base =3D scn->rawdata.d.d_buf =
=3D malloc (size);

The patch introduces memory leaks for the allocation at Line 333 elfutils-0=
.191/libelf/elf_getdata.c:333
Two such leaks are detected / shown below:

When run under a leak detection one can see:

Direct leak of 626 byte(s) in 1 object(s) allocated from:
    #0 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22=
/10/llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)
    #1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/=
libelf/elf_getdata.c:333)
    #2 0x7f282bf8a586 in elf_strptr (../../elfutils-0.191/libelf/elf_strptr=
.c:163)
    #3 0x7f282c55d404 in elf_sym_str (libbpf.c:3557)
    #4 0x7f282c559564 in bpf_object__elf_collect (libbpf.c:3849)
    #5 0x7f282c548a8e in bpf_object_open (libbpf.c:7978)
    #6 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)

Direct leak of 321 byte(s) in 1 object(s) allocated from:
    #0 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22=
/10/llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)
    #1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/=
libelf/elf_getdata.c:333)
    #2 0x7f282bf8a718 in elf_rawdata (../../elfutils-0.191/libelf/elf_rawda=
ta.c:68)
    #3 0x7f282c558d7c in bpf_object__elf_init (libbpf.c:1556)
    #4 0x7f282c548a6f in bpf_object_open (libbpf.c:7976)
    #5 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)

In both cases the cleanup is done correctly in libbpf by calling bpf_object=
__elf_finish() -> elf_end() however
the bogus check in elf_end() skips the free (scn->rawdata_base)

After removing the 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-befor=
e.patch
the leak output is clean.

** Note1 **: The patch 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-b=
efore.patch was never accepted by the elfutils upstream community.
The problem it tries to solve is a prelink bug ( double free in prelink )
Quote from libelf upstream community comment:
"I think that prelink is preparing the ELF file, but then half way
through encounters an error. It then frees all the ELF section data it
believed it created itself. But because of the error it probably didn't
(yet) do that. And so frees some data that it got directly from
elf_getdata () and didn't create itself. Then it calls elf_end () and
libelf also thinks it owns that data and frees it again."

Signed-off-by: Adrian Mardare admardare@gmail.com<mailto:admardare@gmail.co=
m>
---
.../elfutils/elfutils_0.197.bb                |  1 -
...-check-data_list.data.d.d_buf-before.patch | 43 -------------------
2 files changed, 44 deletions(-)
delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf-elf_end=
.c-check-data_list.data.d.d_buf-before.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.197.bb b/meta/recipe=
s-devtools/elfutils/elfutils_0.197.bb
index 253e1a65f0..deca3dae90 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.197.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV}/${=
BP}.tar.bz2 \
            file://run-ptest \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch =
\
            file://0003-fixheadercheck.patch \
-           file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-befor=
e.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-=
C.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-che=
ck-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/fil=
es/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
deleted file mode 100644
index 47f28885a9..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data=
_list.data.d.d_buf-before.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6305e20927bc39367009efd1ecb71ce20a006ed6 Mon Sep 17 00:00:00 2001
-From: Robert Yang liezhi.yang@windriver.com<mailto:liezhi.yang@windriver.c=
om>
-Date: Thu, 16 Aug 2018 09:58:26 +0800
-Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before fre=
e it
-
-The one which actually saves the data is data_list.data.d.d_buf, so check =
it
-before free rawdata_base.
-
-This can fix a segmentation fault when prelink libqb_1.0.3:
-prelink: /usr/lib/libqb.so.0.18.2: Symbol section index outside of section=
 numbers
-
-The segmentation fault happens when prelink call elf_end().
-
-Upstream-Status: Submitted [https://sourceware.org/ml/elfutils-devel/2018-=
q3/msg00085.html]
-
-Signed-off-by: Robert Yang liezhi.yang@windriver.com<mailto:liezhi.yang@wi=
ndriver.com>
----
- libelf/elf_end.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 9df2e16..339d7ed 100644
---- a/libelf/elf_end.c
-+++ b/libelf/elf_end.c
-@@ -176,14 +176,16 @@ elf_end (Elf *elf)
-                                 architecture doesn't require overly strin=
gent
-                                 alignment the raw data buffer is the same=
 as the
-                                 one used for presenting to the caller.  *=
/
--                             if (scn->data_base !=3D scn->rawdata_base)
-+                            if ((scn->data_base !=3D scn->rawdata_base)
-+                                && (scn->data_list.data.d.d_buf !=3D NULL=
))
-                                free (scn->data_base);
-
-                              /* The section data is allocated if we could=
n't mmap
-                                 the file.  Or if we had to decompress.  *=
/
--                             if (elf->map_address =3D=3D NULL
-+                            if ((elf->map_address =3D=3D NULL
-                                  || scn->rawdata_base =3D=3D scn->zdata_b=
ase
-                                  || (scn->flags & ELF_F_MALLOCED) !=3D 0)
-+                                && (scn->data_list.data.d.d_buf !=3D NULL=
))
-                                free (scn->rawdata_base);
-
-                              /* Free the list of data buffers for the sec=
tion.
--
2.34.1


--_000_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please review the a=
ttached patch for elfutils component.<br>
Also provided below as text<br>
<br>
From 58595d5a42d0f775c6dcf7038fdfaa1b1bf9c2cf Mon Sep 17 00:00:00 2001<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">From: Adrian Mardar=
e <a href=3D"mailto:amardare@cisco.com">
amardare@cisco.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Date: Wed, 25 Nov 2=
026 11:59:42 -0500<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Subject: [PATCH] Re=
move elfutils patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The changes in patc=
h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">0001-libelf-elf_end=
.c-check-data_list.data.d.d_buf-before.patch are wrong and<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">the patch should be=
 removed ( ** also see Note1 below ** )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">In particular this =
change in elf_end():<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
The section data is allocated if we couldn't mmap<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; the file.&nbsp; Or if we had to decompress.&nbsp; */<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (elf-=
&gt;map_address =3D=3D NULL<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((elf=
-&gt;map_address =3D=3D NULL<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; || scn-&gt;rawdata_base =3D=3D scn-&gt;zdata_base<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; || (scn-&gt;flags &amp; ELF_F_MALLOCED) !=3D 0)<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;&amp; (scn-&gt;data_list.data.d.d_buf !=3D NULL))<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; free (scn-&gt;rawdata_base);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">is now conditioning=
 the free (scn-&gt;rawdata_base) by scn-&gt;data_list.data.d.d_buf!=3DNULL<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">While the allocatio=
n itself uses &quot;scn-&gt;rawdata.d.d_buf&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Line 333 does the a=
llocation:&nbsp;&nbsp; scn-&gt;rawdata_base =3D scn-&gt;rawdata.d.d_buf =3D=
 malloc (size);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The patch introduce=
s memory leaks for the allocation at Line 333 elfutils-0.191/libelf/elf_get=
data.c:333<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Two such leaks are =
detected / shown below:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">When run under a le=
ak detection one can see:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Direct leak of 626 =
byte(s) in 1 object(s) allocated from:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#0 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22/10/=
llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/libe=
lf/elf_getdata.c:333)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#2 0x7f282bf8a586 in elf_strptr (../../elfutils-0.191/libelf/elf_strptr.c:1=
63)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#3 0x7f282c55d404 in elf_sym_str (libbpf.c:3557)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#4 0x7f282c559564 in bpf_object__elf_collect (libbpf.c:3849)<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#5 0x7f282c548a8e in bpf_object_open (libbpf.c:7978)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#6 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Direct leak of 321 =
byte(s) in 1 object(s) allocated from:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#0 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22/10/=
llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/libe=
lf/elf_getdata.c:333)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#2 0x7f282bf8a718 in elf_rawdata (../../elfutils-0.191/libelf/elf_rawdata.c=
:68)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#3 0x7f282c558d7c in bpf_object__elf_init (libbpf.c:1556)<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#4 0x7f282c548a6f in bpf_object_open (libbpf.c:7976)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
#5 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">In both cases the c=
leanup is done correctly in libbpf by calling bpf_object__elf_finish() -&gt=
; elf_end() however<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">the bogus check in =
elf_end() skips the free (scn-&gt;rawdata_base)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">After removing the =
0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">the leak output is =
clean.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">** Note1 **: The pa=
tch 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch was nev=
er accepted by the elfutils upstream community.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The problem it trie=
s to solve is a prelink bug ( double free in prelink )<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Quote from libelf u=
pstream community comment:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&quot;I think that =
prelink is preparing the ELF file, but then half way<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">through encounters =
an error. It then frees all the ELF section data it<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">believed it created=
 itself. But because of the error it probably didn't<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(yet) do that. And =
so frees some data that it got directly from<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">elf_getdata () and =
didn't create itself. Then it calls elf_end () and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">libelf also thinks =
it owns that data and frees it again.&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Signed-off-by: Adri=
an Mardare
<a href=3D"mailto:admardare@gmail.com">admardare@gmail.com</a><o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">---<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">.../elfutils/elfuti=
ls_0.197.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 -<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">...-check-data_list=
.data.d.d_buf-before.patch | 43 -------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">2 files changed, 44=
 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">delete mode 100644 =
meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.=
data.d.d_buf-before.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">diff --git a/meta/r=
ecipes-devtools/elfutils/elfutils_0.197.bb b/meta/recipes-devtools/elfutils=
/elfutils_0.197.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">index 253e1a65f0..d=
eca3dae90 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">--- a/meta/recipes-=
devtools/elfutils/elfutils_0.197.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+++ b/meta/recipes-=
devtools/elfutils/elfutils_0.197.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">@@ -14,7 +14,6 @@ S=
RC_URI =3D &quot;https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://run-ptest=
">
file://run-ptest</a> \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0002-Fix-=
elf_cvt_gunhash-if-dest-and-src-are-same.patch">
file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch</a> \<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0003-fixh=
eadercheck.patch">
file://0003-fixheadercheck.patch</a> \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-libelf-el=
f_end.c-check-data_list.data.d.d_buf-before.patch">
file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch</a> =
\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-skip=
-the-test-when-gcc-not-deployed.patch">
file://0001-skip-the-test-when-gcc-not-deployed.patch</a> \<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://ptest.pat=
ch">
file://ptest.patch</a> \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-test=
s-Makefile.am-compile-test_nlist-with-standard-C.patch">
file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch</a> =
\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">diff --git a/meta/r=
ecipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d=
.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_=
end.c-check-data_list.data.d.d_buf-before.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">deleted file mode 1=
00644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">index 47f28885a9..0=
000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">--- a/meta/recipes-=
devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-=
before.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+++ /dev/null<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">@@ -1,43 +0,0 @@<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-From 6305e20927bc3=
9367009efd1ecb71ce20a006ed6 Mon Sep 17 00:00:00 2001<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-From: Robert Yang =
<a href=3D"mailto:liezhi.yang@windriver.com">
liezhi.yang@windriver.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-Date: Thu, 16 Aug =
2018 09:58:26 +0800<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-Subject: [PATCH] l=
ibelf/elf_end.c: check data_list.data.d.d_buf before free it<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-The one which actu=
ally saves the data is data_list.data.d.d_buf, so check it<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-before free rawdat=
a_base.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-This can fix a seg=
mentation fault when prelink libqb_1.0.3:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-prelink: /usr/lib/=
libqb.so.0.18.2: Symbol section index outside of section numbers<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-The segmentation f=
ault happens when prelink call elf_end().<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-Upstream-Status: S=
ubmitted [https://sourceware.org/ml/elfutils-devel/2018-q3/msg00085.html]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-Signed-off-by: Rob=
ert Yang <a href=3D"mailto:liezhi.yang@windriver.com">
liezhi.yang@windriver.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">----<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- libelf/elf_end.c =
| 6 ++++--<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- 1 file changed, 4=
 insertions(+), 2 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-diff --git a/libel=
f/elf_end.c b/libelf/elf_end.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-index 9df2e16..339=
d7ed 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">---- a/libelf/elf_e=
nd.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-+++ b/libelf/elf_e=
nd.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-@@ -176,14 +176,16=
 @@ elf_end (Elf *elf)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;architecture doesn't require overly stringent<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;alignment the raw data buffer is the same as the<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;one used for presenting to the caller.&nbsp; */<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">--&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (scn-&gt;data_base !=3D scn-&gt;rawdata_base)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (=
(scn-&gt;data_base !=3D scn-&gt;rawdata_base)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbs=
p;&nbsp;&nbsp; &amp;&amp; (scn-&gt;data_list.data.d.d_buf !=3D NULL))<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;free (scn-&gt;data_base);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- <o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* The section data is allocated if we couldn't mmap<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;the file.&nbsp; Or if we had to decompress.&nbsp; */<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">--&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (elf-&gt;map_address =3D=3D NULL<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (=
(elf-&gt;map_address =3D=3D NULL<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;&nbsp;|| scn-&gt;rawdata_base =3D=3D scn-&gt;zdata_base=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;&nbsp;|| (scn-&gt;flags &amp; ELF_F_MALLOCED) !=3D 0)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbs=
p;&nbsp;&nbsp; &amp;&amp; (scn-&gt;data_list.data.d.d_buf !=3D NULL))<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;free (scn-&gt;rawdata_base);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- <o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* Free the list of data buffers for the section.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-- <o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">2.34.1<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_--

--_004_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_
Content-Type: application/octet-stream; name="remove-elfutils-patch.patch"
Content-Description: remove-elfutils-patch.patch
Content-Disposition: attachment; filename="remove-elfutils-patch.patch";
	size=6636; creation-date="Wed, 25 Nov 2026 18:05:25 GMT";
	modification-date="Wed, 25 Nov 2026 18:07:52 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1ODU5NWQ1YTQyZDBmNzc1YzZkY2Y3MDM4ZmRmYWExYjFiZjljMmNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBZHJpYW4gTWFyZGFyZSA8YW1hcmRhcmVAY2lzY28uY29tPgpE
YXRlOiBXZWQsIDI1IE5vdiAyMDI2IDExOjU5OjQyIC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gUmVt
b3ZlIGVsZnV0aWxzIHBhdGNoCgpUaGUgY2hhbmdlcyBpbiBwYXRjaAowMDAxLWxpYmVsZi1lbGZf
ZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2ggYXJlIHdyb25n
IGFuZAp0aGUgcGF0Y2ggc2hvdWxkIGJlIHJlbW92ZWQgKCAqKiBhbHNvIHNlZSBOb3RlMSBiZWxv
dyAqKiApCgpJbiBwYXJ0aWN1bGFyIHRoaXMgY2hhbmdlIGluIGVsZl9lbmQoKToKCiAgICAgICAg
ICAgICAgICAvKiBUaGUgc2VjdGlvbiBkYXRhIGlzIGFsbG9jYXRlZCBpZiB3ZSBjb3VsZG4ndCBt
bWFwCiAgICAgICAgICAgICAgICAgICB0aGUgZmlsZS4gIE9yIGlmIHdlIGhhZCB0byBkZWNvbXBy
ZXNzLiAgKi8KLSAgICAgICAgICAgICAgIGlmIChlbGYtPm1hcF9hZGRyZXNzID09IE5VTEwKKyAg
ICAgICAgICAgICAgIGlmICgoZWxmLT5tYXBfYWRkcmVzcyA9PSBOVUxMCiAgICAgICAgICAgICAg
ICAgICAgfHwgc2NuLT5yYXdkYXRhX2Jhc2UgPT0gc2NuLT56ZGF0YV9iYXNlCiAgICAgICAgICAg
ICAgICAgICAgfHwgKHNjbi0+ZmxhZ3MgJiBFTEZfRl9NQUxMT0NFRCkgIT0gMCkKKyAgICAgICAg
ICAgICAgICAgICAmJiAoc2NuLT5kYXRhX2xpc3QuZGF0YS5kLmRfYnVmICE9IE5VTEwpKQogICAg
ICAgICAgICAgICAgICBmcmVlIChzY24tPnJhd2RhdGFfYmFzZSk7CgppcyBub3cgY29uZGl0aW9u
aW5nIHRoZSBmcmVlIChzY24tPnJhd2RhdGFfYmFzZSkgYnkgc2NuLT5kYXRhX2xpc3QuZGF0YS5k
LmRfYnVmIT1OVUxMCldoaWxlIHRoZSBhbGxvY2F0aW9uIGl0c2VsZiB1c2VzICJzY24tPnJhd2Rh
dGEuZC5kX2J1ZiIKTGluZSAzMzMgZG9lcyB0aGUgYWxsb2NhdGlvbjogICBzY24tPnJhd2RhdGFf
YmFzZSA9IHNjbi0+cmF3ZGF0YS5kLmRfYnVmID0gbWFsbG9jIChzaXplKTsKClRoZSBwYXRjaCBp
bnRyb2R1Y2VzIG1lbW9yeSBsZWFrcyBmb3IgdGhlIGFsbG9jYXRpb24gYXQgTGluZSAzMzMgZWxm
dXRpbHMtMC4xOTEvbGliZWxmL2VsZl9nZXRkYXRhLmM6MzMzClR3byBzdWNoIGxlYWtzIGFyZSBk
ZXRlY3RlZCAvIHNob3duIGJlbG93OgoKV2hlbiBydW4gdW5kZXIgYSBsZWFrIGRldGVjdGlvbiBv
bmUgY2FuIHNlZToKCkRpcmVjdCBsZWFrIG9mIDYyNiBieXRlKHMpIGluIDEgb2JqZWN0KHMpIGFs
bG9jYXRlZCBmcm9tOgogICAgIzAgMHg3ZjI4MmQyNzE2YmYgaW4gX19faW50ZXJjZXB0b3JfbWFs
bG9jICgvYXV0by9jb21waWxlci1taWdyYXRpb24vMjIvMTAvbGx2bS1jaXNjby9jb21waWxlci1y
dC9saWIvbHNhbi9sc2FuX2ludGVyY2VwdG9ycy5jcHA6NzQpCiAgICAjMSAweDdmMjgyYmY4YTlk
ZiBpbiBfX2xpYmVsZl9zZXRfcmF3ZGF0YV93cmxvY2sgKC4uLy4uL2VsZnV0aWxzLTAuMTkxL2xp
YmVsZi9lbGZfZ2V0ZGF0YS5jOjMzMykKICAgICMyIDB4N2YyODJiZjhhNTg2IGluIGVsZl9zdHJw
dHIgKC4uLy4uL2VsZnV0aWxzLTAuMTkxL2xpYmVsZi9lbGZfc3RycHRyLmM6MTYzKQogICAgIzMg
MHg3ZjI4MmM1NWQ0MDQgaW4gZWxmX3N5bV9zdHIgKGxpYmJwZi5jOjM1NTcpCiAgICAjNCAweDdm
MjgyYzU1OTU2NCBpbiBicGZfb2JqZWN0X19lbGZfY29sbGVjdCAobGliYnBmLmM6Mzg0OSkKICAg
ICM1IDB4N2YyODJjNTQ4YThlIGluIGJwZl9vYmplY3Rfb3BlbiAobGliYnBmLmM6Nzk3OCkKICAg
ICM2IDB4N2YyODJjNTQ4YjQzIGluIGJwZl9vYmplY3RfX29wZW5fZmlsZSAobGliYnBmLmM6ODAw
MSkKCkRpcmVjdCBsZWFrIG9mIDMyMSBieXRlKHMpIGluIDEgb2JqZWN0KHMpIGFsbG9jYXRlZCBm
cm9tOgogICAgIzAgMHg3ZjI4MmQyNzE2YmYgaW4gX19faW50ZXJjZXB0b3JfbWFsbG9jICgvYXV0
by9jb21waWxlci1taWdyYXRpb24vMjIvMTAvbGx2bS1jaXNjby9jb21waWxlci1ydC9saWIvbHNh
bi9sc2FuX2ludGVyY2VwdG9ycy5jcHA6NzQpCiAgICAjMSAweDdmMjgyYmY4YTlkZiBpbiBfX2xp
YmVsZl9zZXRfcmF3ZGF0YV93cmxvY2sgKC4uLy4uL2VsZnV0aWxzLTAuMTkxL2xpYmVsZi9lbGZf
Z2V0ZGF0YS5jOjMzMykKICAgICMyIDB4N2YyODJiZjhhNzE4IGluIGVsZl9yYXdkYXRhICguLi8u
Li9lbGZ1dGlscy0wLjE5MS9saWJlbGYvZWxmX3Jhd2RhdGEuYzo2OCkKICAgICMzIDB4N2YyODJj
NTU4ZDdjIGluIGJwZl9vYmplY3RfX2VsZl9pbml0IChsaWJicGYuYzoxNTU2KQogICAgIzQgMHg3
ZjI4MmM1NDhhNmYgaW4gYnBmX29iamVjdF9vcGVuIChsaWJicGYuYzo3OTc2KQogICAgIzUgMHg3
ZjI4MmM1NDhiNDMgaW4gYnBmX29iamVjdF9fb3Blbl9maWxlIChsaWJicGYuYzo4MDAxKQoKSW4g
Ym90aCBjYXNlcyB0aGUgY2xlYW51cCBpcyBkb25lIGNvcnJlY3RseSBpbiBsaWJicGYgYnkgY2Fs
bGluZyBicGZfb2JqZWN0X19lbGZfZmluaXNoKCkgLT4gZWxmX2VuZCgpIGhvd2V2ZXIKdGhlIGJv
Z3VzIGNoZWNrIGluIGVsZl9lbmQoKSBza2lwcyB0aGUgZnJlZSAoc2NuLT5yYXdkYXRhX2Jhc2Up
CgpBZnRlciByZW1vdmluZyB0aGUgMDAwMS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlz
dC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoCnRoZSBsZWFrIG91dHB1dCBpcyBjbGVhbi4KCioq
IE5vdGUxICoqOiBUaGUgcGF0Y2ggMDAwMS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlz
dC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoIHdhcyBuZXZlciBhY2NlcHRlZCBieSB0aGUgZWxm
dXRpbHMgdXBzdHJlYW0gY29tbXVuaXR5LgpUaGUgcHJvYmxlbSBpdCB0cmllcyB0byBzb2x2ZSBp
cyBhIHByZWxpbmsgYnVnICggZG91YmxlIGZyZWUgaW4gcHJlbGluayApClF1b3RlIGZyb20gbGli
ZWxmIHVwc3RyZWFtIGNvbW11bml0eSBjb21tZW50OgoiSSB0aGluayB0aGF0IHByZWxpbmsgaXMg
cHJlcGFyaW5nIHRoZSBFTEYgZmlsZSwgYnV0IHRoZW4gaGFsZiB3YXkKdGhyb3VnaCBlbmNvdW50
ZXJzIGFuIGVycm9yLiBJdCB0aGVuIGZyZWVzIGFsbCB0aGUgRUxGIHNlY3Rpb24gZGF0YSBpdApi
ZWxpZXZlZCBpdCBjcmVhdGVkIGl0c2VsZi4gQnV0IGJlY2F1c2Ugb2YgdGhlIGVycm9yIGl0IHBy
b2JhYmx5IGRpZG4ndAooeWV0KSBkbyB0aGF0LiBBbmQgc28gZnJlZXMgc29tZSBkYXRhIHRoYXQg
aXQgZ290IGRpcmVjdGx5IGZyb20KZWxmX2dldGRhdGEgKCkgYW5kIGRpZG4ndCBjcmVhdGUgaXRz
ZWxmLiBUaGVuIGl0IGNhbGxzIGVsZl9lbmQgKCkgYW5kCmxpYmVsZiBhbHNvIHRoaW5rcyBpdCBv
d25zIHRoYXQgZGF0YSBhbmQgZnJlZXMgaXQgYWdhaW4uIgoKU2lnbmVkLW9mZi1ieTogQWRyaWFu
IE1hcmRhcmUgPGFkbWFyZGFyZUBnbWFpbC5jb20+Ci0tLQogLi4uL2VsZnV0aWxzL2VsZnV0aWxz
XzAuMTk3LmJiICAgICAgICAgICAgICAgIHwgIDEgLQogLi4uLWNoZWNrLWRhdGFfbGlzdC5kYXRh
LmQuZF9idWYtYmVmb3JlLnBhdGNoIHwgNDMgLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCA0NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFf
bGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTk3LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTk3LmJiCmluZGV4IDI1M2UxYTY1ZjAuLmRlY2EzZGFl
OTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGlsc18w
LjE5Ny5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4x
OTcuYmIKQEAgLTE0LDcgKzE0LDYgQEAgU1JDX1VSSSA9ICJodHRwczovL3NvdXJjZXdhcmUub3Jn
L2VsZnV0aWxzL2Z0cC8ke1BWfS8ke0JQfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL3J1
bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLUZpeC1lbGZfY3Z0X2d1bmhhc2gtaWYt
ZGVzdC1hbmQtc3JjLWFyZS1zYW1lLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDMtZml4
aGVhZGVyY2hlY2sucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJlbGYtZWxmX2Vu
ZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtc2tpcC10aGUtdGVzdC13aGVuLWdjYy1ub3QtZGVwbG95ZWQucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vcHRlc3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFyZC1DLnBh
dGNoIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8w
MDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJlbGYt
ZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0N2YyODg4NWE5Li4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5kLmMt
Y2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSw0MyArMCwwIEBACi1Gcm9tIDYzMDVlMjA5MjdiYzM5MzY3MDA5ZWZkMWVjYjcxY2UyMGEw
MDZlZDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBSb2JlcnQgWWFuZyA8bGllemhp
LnlhbmdAd2luZHJpdmVyLmNvbT4KLURhdGU6IFRodSwgMTYgQXVnIDIwMTggMDk6NTg6MjYgKzA4
MDAKLVN1YmplY3Q6IFtQQVRDSF0gbGliZWxmL2VsZl9lbmQuYzogY2hlY2sgZGF0YV9saXN0LmRh
dGEuZC5kX2J1ZiBiZWZvcmUgZnJlZSBpdAotCi1UaGUgb25lIHdoaWNoIGFjdHVhbGx5IHNhdmVz
IHRoZSBkYXRhIGlzIGRhdGFfbGlzdC5kYXRhLmQuZF9idWYsIHNvIGNoZWNrIGl0Ci1iZWZvcmUg
ZnJlZSByYXdkYXRhX2Jhc2UuCi0KLVRoaXMgY2FuIGZpeCBhIHNlZ21lbnRhdGlvbiBmYXVsdCB3
aGVuIHByZWxpbmsgbGlicWJfMS4wLjM6Ci1wcmVsaW5rOiAvdXNyL2xpYi9saWJxYi5zby4wLjE4
LjI6IFN5bWJvbCBzZWN0aW9uIGluZGV4IG91dHNpZGUgb2Ygc2VjdGlvbiBudW1iZXJzCi0KLVRo
ZSBzZWdtZW50YXRpb24gZmF1bHQgaGFwcGVucyB3aGVuIHByZWxpbmsgY2FsbCBlbGZfZW5kKCku
Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL3NvdXJjZXdhcmUub3JnL21s
L2VsZnV0aWxzLWRldmVsLzIwMTgtcTMvbXNnMDAwODUuaHRtbF0KLQotU2lnbmVkLW9mZi1ieTog
Um9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBsaWJlbGYvZWxm
X2VuZC5jIHwgNiArKysrLS0KLSAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvbGliZWxmL2VsZl9lbmQuYyBiL2xpYmVsZi9lbGZf
ZW5kLmMKLWluZGV4IDlkZjJlMTYuLjMzOWQ3ZWQgMTAwNjQ0Ci0tLS0gYS9saWJlbGYvZWxmX2Vu
ZC5jCi0rKysgYi9saWJlbGYvZWxmX2VuZC5jCi1AQCAtMTc2LDE0ICsxNzYsMTYgQEAgZWxmX2Vu
ZCAoRWxmICplbGYpCi0gCQkgICBhcmNoaXRlY3R1cmUgZG9lc24ndCByZXF1aXJlIG92ZXJseSBz
dHJpbmdlbnQKLSAJCSAgIGFsaWdubWVudCB0aGUgcmF3IGRhdGEgYnVmZmVyIGlzIHRoZSBzYW1l
IGFzIHRoZQotIAkJICAgb25lIHVzZWQgZm9yIHByZXNlbnRpbmcgdG8gdGhlIGNhbGxlci4gICov
Ci0tCQlpZiAoc2NuLT5kYXRhX2Jhc2UgIT0gc2NuLT5yYXdkYXRhX2Jhc2UpCi0rCQlpZiAoKHNj
bi0+ZGF0YV9iYXNlICE9IHNjbi0+cmF3ZGF0YV9iYXNlKQotKwkJICAgICYmIChzY24tPmRhdGFf
bGlzdC5kYXRhLmQuZF9idWYgIT0gTlVMTCkpCi0gCQkgIGZyZWUgKHNjbi0+ZGF0YV9iYXNlKTsK
LSAKLSAJCS8qIFRoZSBzZWN0aW9uIGRhdGEgaXMgYWxsb2NhdGVkIGlmIHdlIGNvdWxkbid0IG1t
YXAKLSAJCSAgIHRoZSBmaWxlLiAgT3IgaWYgd2UgaGFkIHRvIGRlY29tcHJlc3MuICAqLwotLQkJ
aWYgKGVsZi0+bWFwX2FkZHJlc3MgPT0gTlVMTAotKwkJaWYgKChlbGYtPm1hcF9hZGRyZXNzID09
IE5VTEwKLSAJCSAgICB8fCBzY24tPnJhd2RhdGFfYmFzZSA9PSBzY24tPnpkYXRhX2Jhc2UKLSAJ
CSAgICB8fCAoc2NuLT5mbGFncyAmIEVMRl9GX01BTExPQ0VEKSAhPSAwKQotKwkJICAgICYmIChz
Y24tPmRhdGFfbGlzdC5kYXRhLmQuZF9idWYgIT0gTlVMTCkpCi0gCQkgIGZyZWUgKHNjbi0+cmF3
ZGF0YV9iYXNlKTsKLSAKLSAJCS8qIEZyZWUgdGhlIGxpc3Qgb2YgZGF0YSBidWZmZXJzIGZvciB0
aGUgc2VjdGlvbi4KLS0gCjIuMzQuMQoK

--_004_DS4PPF6EA6DD735F76F124E4E7191CF3350CD432DS4PPF6EA6DD735_--
