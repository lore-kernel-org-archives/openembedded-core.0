Return-Path: <gratian.crisan@ni.com>
X-Greylist: delayed 5588 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Sep 2016 22:36:04 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0125.outbound.protection.outlook.com [104.47.38.125])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9D960670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 22:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zwpXqlfs4lGJHhqM5TceGPy1htn2+Rnem8iwT7RGqXU=;
	b=TgpJep5DiCJZ7h81Q3b97UAMN7Ezy7VzyfA6nOuABuKOsANIywdaOpz9/ZTtW14Ek1hdkIKz9LLn0ZNuvt509b8i8J+EiQ9wfPrOLnaRgFSALjEUAkacxnkKJrAiSqjJsBPCaEzTi7XobM+6J7d7P8VWIiEAxqesURcC/5OMPKM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=gratian.crisan@ni.com; 
Received: from kerf.amer.corp.natinst.com (130.164.62.149) by
	BN6PR04MB0259.namprd04.prod.outlook.com (10.168.224.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.639.5; Wed, 21 Sep 2016 21:02:56 +0000
References: <1474483225-29817-1-git-send-email-gratian.crisan@ni.com>
	<CAJTo0LbJjuxq5=Gj=Qb9La-D_z0c2xaGmRVTUeS6B-w1uNeg_g@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 24.5.1
From: Gratian Crisan <gratian.crisan@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbJjuxq5=Gj=Qb9La-D_z0c2xaGmRVTUeS6B-w1uNeg_g@mail.gmail.com>
Date: Wed, 21 Sep 2016 16:02:52 -0500
Message-ID: <8737kthsoz.fsf@kerf.amer.corp.natinst.com>
MIME-Version: 1.0
X-Originating-IP: [130.164.62.149]
X-ClientProxiedBy: SN1PR12CA0040.namprd12.prod.outlook.com (10.162.96.178) To
	BN6PR04MB0259.namprd04.prod.outlook.com (10.168.224.144)
X-MS-Office365-Filtering-Correlation-Id: b4226e7e-ceda-4599-d57d-08d3e262a9b4
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0259;
	2:O+OGA2IqGVrIhJ5BMabPAfk6cci6ndskzekRh1iG38JOcAAAwdAA922ba7hijA94tpw055fDljNAnDMjXZZLdmTy74KwXIEjEQ+d7O5KG6IrLwaimqRE3mvjZeguJQvOG13S5lT8z1Hu6M11K7gf/c6RTkN/XeQNKJe1B0ZvGfVbkr00A4DzMuVNp7t+jc5F;
	3:qXTkurykWN3MFsx7xTi/ocarUfPaPFeRrbnKEvbGCTH+Ue6MHC4cIaGZffOD3ngdXPIp2Akon/N7XnYV2tshahnjtqDHsRAQSF2PN/ZfRBzWm3J0HrRWAvIgulvEpLkJ
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN6PR04MB0259;
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0259;
	25:BpQ90hNq5XiyPY6nLA1wqLPeKbH4oLBZ3jVTlBel1eZ4Ud+OSHL75DhqbjwKE9K5mnV7tNzxZg8RB3JwjXqpycl/vYnKdTX7zGIPT/UgIppAk6vmvplkUiFq0Hwfh7sIu7h/5alqoLoV2L3QM3tt4muYzsqaGtou7tI+2OiKU920zYS4qDULGbsNeyAcBlvkw0Sjbu7NlPI+YHC8rH5bzCE4POfgd1IpbiYl1Wfml147UzMgooLFmo3frcHzEEGns0ar/WblEV/B/vIo03ZJ9vospYwlMstzq3UVOixMSubPGWfRxtDMzvnmvwIU5XYBpSCpPcsOLADxdgZUP04Ul90epWiybQQBiBndZq/3EmgR2D7bImqRrpwnysE3Jjs/vm9mM/EX36Z2X3Iro4HURPSGWJ8lNcGnAoIFpA/YenKUo2HgYPuf9UomucyrjUDKeb5XB67BJLqhDLNr9xMZ9EvffKzsbeT44ZOgRExOLEQy/LMk3LrhKm4snHssmNNs8qw1MpcZD9jKVDKSbiZ3x1FMa+3+X0nSFcdwUWhL2sqgRFuvNAUK6C5rhVbEI8Zpjqo5ogha0ByocPFi22dLy5u/fOOK44s1RhQw/jkMCGCy1m/gxGagQlOZEn2hRy5bAIzqJLHyMMG5XlPzlDKE1zckZDTOjVIUpDm3SElBK+HNMzUYCXW7jGrirY0OCXyy;
	31:TXZ+wxeULmCDrGxXpMN8TyDg+kB++6VR8YvbeIs0ibqOOlxst82IMdcuILdnXWPRbMkJrEGjpM7qH5agMV4ZsNdtDFaaZEa6ztdBAlljpxJm/Zc6htR9k2pBnhKimYbrpRBHyHAiML6ibjMGjPV8XMK/CJ8hau40ELkOYs3b4pnuAiWH+eE6+zuVoGibV/bU6emlJcODPOOOyQkN9UfaU2PY+DVdYkawLZ7jsSHWHfU=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0259;
	20:bqyNGxxrc/p5RL7HiOkY13iYj30UCtS9vjGVj3p+PqDemPADKNnTgS3MKBxZVc58t4AAQq2xvBqsNGpcVSOg48iRnC/D7eWTLt8Azsa+yTS2mAmiLqxPus5iIe2YJN/stKIKbmiZXuIQrP62RBBfY99N1RAj9wQ2jmfvrrX/0nC0lVDzHytZZccSpn4iaQDToGDeDH+XhrUjw6a81z4WG1OVlfxgLRO3iZo1AmHaCNs2z9Lkm0msnmpsRa7wQPetGpZGaffmMisxlgyT7HcURXCa+l6eYNo+ULT6H270UlkV05NFoVUBoI6aqL3/P1X1hjMdwPDsKHhiBIECr70ixlHjuYnycIuoZ9T1yjAS2Q8IlgCsVqWQcEaWejXIfcDeiUF3qYduZKrcJkRGih/kugjWbCVI3g/lVprPTIFqo67M9uP7Ie9kRhehWQi+O+7qrlhGPenK0iAzL+3ZIyXHxa+7KYdZEqgviit5VE9jfDRKWcMsLJzpwLHCxrs2/KXT6kORac2459Z+Jjprtq8HWHMTUyp9lY8r7VT0pmB+2UH6Dg4oOCmDBRLoOI+O67VcY2QxYfpX0YR7y4FQeXpz6vZIG6ULY/oVSWKO1PzoiLQ=
X-Microsoft-Antispam-PRVS: <BN6PR04MB02595F2F95B22327E8119051FEF60@BN6PR04MB0259.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:BN6PR04MB0259; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0259; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0259;
	4:DhinAGsfl/rWg3Y0W739OQQwUrx9pTAjlriRC/kGWvqVxuH7/hKNK/pfhR3h0sn/l8E1QmkIaMJBapGR4XAjDxn/nDpxonVWSH8mJZgKKyYAU4k92/O5vjtfrxFWcU2pNTB2KXAzJbuGUFYb+grqSe4RG4dcDTp2q273faGktM5pigZERMt48m3OZWC1nRPSw5H+WlU+SyG4zn3CUytVNJMd+LprvghnDLziXADedD0Ytpd63IkwJg0g9XlHcwdVuQd7ynP92fmMpWodPxzkJZ14rfCNRRxBZ4Ywm+pONLtK+05UF3B8+ndzzoc6VFB5AiHkBp0hftYUYCttO4DHTMuBSh2PTHafV35IDintn5KXMiZrA82+GNaQJrwIaDwFClmQKx44xQimY5Nh7c4uqiYeu8rpTdgrJt88suROWRs=
X-Forefront-PRVS: 007271867D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(24454002)(305945005)(19580395003)(3846002)(66066001)(19580405001)(5003940100001)(6116002)(92566002)(101416001)(42186005)(68736007)(586003)(7846002)(86362001)(105586002)(106356001)(50986999)(189998001)(7736002)(97736004)(4001350100001)(54356999)(110136003)(76176999)(9686002)(48376002)(5660300001)(77096005)(83506001)(4326007)(2950100001)(2906002)(33646002)(47776003)(50466002)(81156014)(8676002)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0259;
	H:kerf.amer.corp.natinst.com; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0259;
	23:m+itpo84tUO3sMd+5sf+7JVjWIQwWmuk+qks2Xau/?=
	=?us-ascii?Q?9rzWWvlHjUTAWMUCH/FUWIEUBQfHrFJX2OVs04L/sjxz5FFVWfdS5jxgszTm?=
	=?us-ascii?Q?aSO1SwgM16vIY+gXY86qVsB8alePTRlJq08t4cFxgKMyfgZ2p5dGHigCttkh?=
	=?us-ascii?Q?QSP5waLYTUnBC9D592S2LVP8oKNhjBY9+ConKoYulaxKl6NXnDPxpNgz29Sn?=
	=?us-ascii?Q?bBJXICokbLio02x6O1Yh7LwbNrSQv4p+8XMqh1cVruVMlDU/Ikjne0EgLLSg?=
	=?us-ascii?Q?/qROx08ItMKefkJoqPkLh0ZLjNMbu7axVeMCT0kBAGeRYH1WWx43CtJ0D6yF?=
	=?us-ascii?Q?lBC9TmsIvg8OewdD0Dgv2dgtKfjjRHSXjU7aj2ZNp8eQe97ocCS11RHlU773?=
	=?us-ascii?Q?V094TO6dIYXjgMPZTUPI5NMM5phBzGEI5fVFOHEuDGt54qniZoGq77R1Ak40?=
	=?us-ascii?Q?l4Pwmng0yRR/HKYEBlVzOUxhkJL9vu7X5s3Xd5uushNLQFMl27BvJJAJC0xJ?=
	=?us-ascii?Q?SMD/Au1U8eAskcOiGi6svhOH2ph+TLtSmPnuo66H3CwIobXRaIW4KEeppnxU?=
	=?us-ascii?Q?yybOanx6cOeCdiUYegw6Fg9tUtYRb3rXvSiEPE4Wl1fRZttd3cGVvPvHo7ky?=
	=?us-ascii?Q?yYYnzsjNHEJ4xEQ3OPh3ZbOw8JAdll60ju2FZ3cIobgA8OcF+01yDVn90mqS?=
	=?us-ascii?Q?JjYFtM/tUTPvcd3JHLGxl8c2TKc8YKh7A+e/GP5/8BSoMgr2z4xHP6YqN4AH?=
	=?us-ascii?Q?YSvguK4j8G0xlfy1f8s1+c3mHUKfK+JD3vdvvAIWmm/olmGUS4AO7MxLm85k?=
	=?us-ascii?Q?gRSiqKkGC1dkySBb86dVDauZ4Z5GQOBLEwRE2cVb9HvD2TVMzjkyMbySzMm3?=
	=?us-ascii?Q?IC1JxoIBUr+IXowB+JZH6sKBSpDRVl4lkJn/9gG3fyO3v41LiAP+0pTIYpZY?=
	=?us-ascii?Q?M+teUblEttCQkw3sGUVf7CuLvSJIRDJdnT+oIJPO/B2qfZryVKy4lKKCZ/4h?=
	=?us-ascii?Q?dgawAl91jh33ZC8VxuuacxsmsFHytYQn8T+IXw5bVK8KrRHfZF4woRO4mzhg?=
	=?us-ascii?Q?A2JR6nsr1Jjr77jei+mSWCXOs1WB7kHGUydSSXcXwiv3zfd3g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0259;
	6:lKaGdvW6Xp1wAla1Vug21pF/5RsGo79ZWSGufZuT+JCPDcgYvlRu4raBxHd+fn79Jdj9IHN17MB3yQAWoC7wo5fJm/OQDQUE/oHxd2M8UZRDpUX0tGa6NfIXrBOP00e5SjDVvaFh1hgqpS8WN7ma2oblHbvqYzBSZC7kzA7pdm0P5xAkFJq3DJ8PJdH8Fo1tFA5pu6k8ahy7mBxcUo4XW6JQ+lvv6NAYZNjWm6UeX09INQ2oMcj5e6IzdZFZLsI2JeU3rsuUO4H85gMBbZx+1UiPd+J0WNB5r//hID/EPJc=;
	5:QDwvig24C+pN2se9WSc1/M+RlS79PeqhoaM7LpBWeMGWsf4FRJ2Gx8YNHeuOzjSqect73E/INwHeiMi3ViVuJvX5pTQtBVXV+qlz5zL6N9LmJiIukaqttP2CaH35f7S9vzu9iumnDEnt4+Mk8EWb2g==;
	24:AKysJ+PDFW8OrhBmf1o5pw7vC+F+wRv2mcLMnUG01c9GtgpxTG4LsUmAMHCoZbQNtuH6JH2uVdmHTruBkI1ds8uR8GMa1rsM+msgdwh3h8w=;
	7:zZS0bk3OljKL9+pXdmOEYqfMNsCeSqTfzaBy4zNBarylkCkQleLzNJgetaoL1B11P5P1vCCQav/vJxFeKdmU6oJ2M2CkV+r398g2oercCemsF8/iZP2p/j36WEGJDpw+UWipCigpI9DmPEIW/OERURCKSyHeMFmdQSu/vbMffmL8CJdoDaXmaJ9iPbZUoE5rcPIcj93kmpiwMfa4A4nZUtaJgAW5zNb8tPpjbzzk1XLbK0rRrcHGmEIDCo7KWr8ksF2ZLxE5d57wK3SDGtgUFBTpk8pI40Cn9Tx6ZDLHefGGim7K10d/Y21UEgNCXOTW
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2016 21:02:56.7271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0259
Cc: gratian@gmail.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] encodings: Add dependency to mkfontdir-native
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
X-List-Received-Date: Wed, 21 Sep 2016 22:36:05 -0000
Content-Type: text/plain


Burton, Ross writes:

> On 21 September 2016 at 19:40, Gratian Crisan <gratian.crisan@ni.com> wrote:
>
>> Instead add a DEPENDS on mkfontdir-native in the encodings recipe in
>> addition to the mkfontscale-native dependency it already contains. This
>> solves the missing mkfontdir in the native sysroot problem without
>> introducing a build dependency loop.
>>
>
> Have you tested this in a build where encodings isn't built, but pulled
> from sstate?

If I understand your question correctly the answer is yes. We use sstate
for our builds and this was tested in that configuration (i.e. with
sstate enabled).

Thanks,
    Gratian

