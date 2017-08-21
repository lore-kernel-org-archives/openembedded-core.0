Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA5778295
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:46:12 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7L7k4FZ018325; Mon, 21 Aug 2017 02:46:13 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp0024.outbound.protection.outlook.com [207.46.163.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2cfkhq0yv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2017 02:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1gLdExpB2ZMMcjC142RwJZLmlRAb3ZoD5VSjXY3gM8g=;
	b=MyD4EO8wGroET9i6SQOduHUYU11zZWYQnsLRtp/3e4tug8jIKiAKUesAqvTKeWZ1A8imGG2W7G+U2CChxovv587bX5GyCQYNQJVt73RvZAo4bvjXrkYgLi/m6i+3oXjAk4K0xQ4aEIkoxWdKtUCIo92BTeyel4J7V5Go8/wBriM=
Received: from adiPC (79.116.51.90) by CY4PR04MB0502.namprd04.prod.outlook.com
	(10.173.190.11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1362.18;
	Mon, 21 Aug 2017 07:46:11 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <1503050017.32591.7.camel@linuxfoundation.org>
References: <20170816111355.11347-1-adrian.ratiu@ni.com>
	<1503050017.32591.7.camel@linuxfoundation.org>
Date: Mon, 21 Aug 2017 13:45:52 +0300
Message-ID: <874lt1jj1b.fsf@adiPC.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-Originating-IP: [79.116.51.90]
X-ClientProxiedBy: DB6PR0301CA0055.eurprd03.prod.outlook.com (10.168.69.23) To
	CY4PR04MB0502.namprd04.prod.outlook.com (10.173.190.11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 767daef0-6701-4be2-9b41-08d4e868b1a4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR04MB0502; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0502;
	3:xNZioY4NN3xyxBZ79k4diB6u2PGb443DOL5jwqDvyRBbeHIujBz8obsqtidyziG27wXNiiLjgADiBqRq1QEv7/yitoHLbUWlD2T9nR1kr8DHb/cr9FvmBwLMRT3dmMOPa//+FijSESzuDmatLP5CrCGr3WUWJ6VDDzcNFlFQ9+jmiJb8/27XtcqFhaMFBEa1oDEGCftY6MbwNfIt7PbDKlQLyQkbkp5nodX7rBa1LJqMDXo++ktkFk+f8GUcCgLh;
	25:HwxXAcLd7/eV4exHUU3/3fSKMwm6MIKY+5WFvE6gIIofLn5vFec082aBblOD0zP0f3UoQpUvF1ljckpdWYI1prFZRgo9kt03dMQ2Nc0L+gBc2sxKqddGfED130y33jbpG9kKf+MG5IkFxk/IUSpmLxUeAtdvE88wbYqIDXIF5R1KBzq0Kn/Rh+LMq1TU0UMyyJ6iiKgbegKJ8KaUhMgouH5wOYLuixDv2k6uVpeKAQyBneJuUPm60D54zGxRJa1JtjopFIJCGZ2/KsyYeCOb8Rum9vquSRIP44kms3G6HGwHMlkXR2DpeykFNkwgOJvCxypu6U37LS1gAG1ehuk92w==;
	31:G3MOIRf7+CEh3xRn4QSpgyT9E9IgZ3cwQlduCANcZJBhqt/2wt9NsShVMZjhzBPpx60svmGa9WqSRzvefXfSV5g5Bg2BiBuTThEKax0p6pt840iAOrY4lUTPPCV3/eKFaiWdplfjXbFBeGnSPpDcdnXPgy4rw0dGkFQh21MN69YrM/65T/ujktUDfmCVlZ6x6DTEeFc9U6YUlme4VNum1Q0eJq/YHsUyVUKmfTkTjVM=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0502:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0502;
	20:uB4tI1aI5URzV7VrfrYOWySDHlsV2ZTYsnbiRKwn5zIxay+34R4T8cXUiGpP/0REeXw+7q3Hx0c8FUgKNbhHF1aeaHA8HqJNlkbT/SDlWG2EoCM/yLFCucxM08kpoIi9es7Ue/hsak1NiC/lgSTHeF78trbkzA/iK3LXo6781DcgU/gsKn/FQRe3eDcyZo3LZfkJKADZjDhLHnerhwgsD8vrUKbGr7iyx18GCFP5GZb4xgIlmqnDPN6y0Um4wl87lGrRDvvkH97P5JmBcIKHmghLpZs7GxC8IyISQwcFGnibL2PsAsXQ1dWc33fu7Xsw662G50shjRTUu5pyMgNpG2eD8xydDyzgagHeB6ECqmLQcGWPTg/FLxJoLb/d/2GQh+iosa4glpzym9ArbW/pV7BQRmjdACcCj8oeG5q3RjZPltmIEB4Fp9Ukh3S7d4IrXSaGkqTTg98l2DA/whJjXYZXttq0VyXvMphcmLJo+T7RWGZDNEq0PwuEg+UPm/10lru1tLMpW7j3gyLCnWNakj997Wc/YOu+eY/CXNO3lPoCJ5ZzmpG12rACvnodtq20dv3qMBBgk0Gc4zkycmEqEvl8e7WNrUBBLxf0cnG8qiE=;
	4:5lsdMPmtcbwCnylQLZwfdv/lxtQ8CvrxOvGuyt0ygWp30mF8ZHi/wXYkt0ppUs36B72UE3Us+smCx1wAXVTVcZhVxtVCOTPNYapqE2BUHvu31qNDVLBAe6+AvGKpugCpSRMlLPc5B3rhPzg7pNmJyJrlIExd3wCwm3qf1BQnYy17Q6bm2KSUaipzTG+7/YMF8GnTqQCPygOwwojrDiT04hwgEA0kLg0Qbc9e4cyx3297JywnYx+qhOvPBqClFogu9daO+Fruet908OGse3CDLtWTSPl1dbYbbFESjl8wOSI=
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Microsoft-Antispam-PRVS: <CY4PR04MB050251697ED63FB7F6138854F6870@CY4PR04MB0502.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6041248)(20161123562025)(20161123555025)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR04MB0502; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR04MB0502; 
X-Forefront-PRVS: 040655413E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(7370300001)(4630300001)(6009001)(252514010)(24454002)(199003)(377424004)(189002)(229853002)(101416001)(6486002)(50986999)(5660300001)(76176999)(2906002)(54356999)(9686003)(97736004)(189998001)(53936002)(6246003)(81156014)(6496005)(68736007)(23676002)(42186005)(86362001)(110136004)(7350300001)(6116002)(3846002)(4326008)(81166006)(47776003)(7736002)(25786009)(478600001)(50466002)(33646002)(8676002)(106356001)(305945005)(105586002)(6666003)(8746002)(2950100002)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0502; H:adiPC; FPR:;
	SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjA0TUIwNTAyOzIzOmdzSHQwMWlnMU8vK2h6a0FrMU1Bd3FXd0ZH?=
	=?utf-8?B?TlBQblBGUjYxanNrWVNWSDJ1cVdlT2F3eWdScTdvUUN3UVFqaUsrdG9Zd3Jm?=
	=?utf-8?B?em9taXhEdFlHd3RyOE9lVk9ZYW9ZUDhpdXIzWWNES2w5OEVEVGFXR0N3R1o5?=
	=?utf-8?B?RUVwa2RjdTFMb1JIaVRZZU9qM1lsN3lyK3dxam9vUkwrV3dweGpqMUpSVWFq?=
	=?utf-8?B?MDYxdHNlY09PdWpPOUV6Q3djbkMwUGxGN29RK3FNY3QvS3BTNiszVGt1N3lW?=
	=?utf-8?B?ZkU4bXB3R28xRXpWSG9DQi8vbXR6dnNJRXB3YTBTNGFCZldLZUpjR01nVWVO?=
	=?utf-8?B?Umw0Z2dGT3FKUGFRV0V0d2haZDY3RWJIU3NyVlpkNURwQlVGc3Ewbi9oekVG?=
	=?utf-8?B?cGpEbGV5b2NSbjRYVFo3M05HdzJjNkgyNGVMYnR6b0ZaMXpJNzV5cCtsTE9Q?=
	=?utf-8?B?OHlJOHA1R1M2U3ZPbEVTTUlJbGc3TU85ZXRvQjA3dEVsYkg0M09aaCtyV2Yv?=
	=?utf-8?B?a0JINUpDUUUzN1U2OTJsd29jeEg5TE5OTHEyeXI1SnMyQWpYUjAyVlVITGJ1?=
	=?utf-8?B?SS8yd3V5MEhmRXVjejdKRjNybHpnandndS9vQU9QMmV6c0RMZk9tdnJXNW1V?=
	=?utf-8?B?dkUyU1dHRWtkVDhBSERza2FrMjlzMkZHTW82QXpqTDBjYVNUcHA3ZFFVb1JD?=
	=?utf-8?B?aXc1Y3MyQW1URDNRTE5Uc0lxYm5MRzFjTkVxVENCUlg2TmJ2Y1lsazU4aW5L?=
	=?utf-8?B?OVNURTFzc0Z4eG5Rb0N3T3RTWFlDVDdjUGxxNmp0M3JFWmhCT0t4dStzWGVi?=
	=?utf-8?B?dTk2K3NpS3NiUVBRMERSc0dMRHhhemZZd084NXRNMGZVNVJyVFc4aWZEWTFG?=
	=?utf-8?B?TUUxaFhiK1BCZVJCR1VOdzB4VXVyVzJER2ZlVS9iT1k3UkVhYXhTYWxlT2g5?=
	=?utf-8?B?NXZJbFl5alU0TzBoSzg1YnV6REhiemlIWlhRTTR4SlhweGtyVHFBTkdlTk1z?=
	=?utf-8?B?bCtlWUlxZGRwT1IyS05TVVBLaVFsakRjL01NejFjVDVtLzVkVExqeCtMMkl5?=
	=?utf-8?B?eUpVMUI1Vnc2OGZQdkdnU2lWbEk4eU5tYlVSU2dSNXppa2xUN0hLVWtUS1p2?=
	=?utf-8?B?ZEtJbVdDenhLUVRFbkVPR3U4cGoxc1djdG8vYTZaSyt1TDBvb1pBdzFLUUNt?=
	=?utf-8?B?YWVmQVZib1BJdmIva0lIRDhsaWtOWXJyR21MVWJtcjNDWjYyY0VxMm5Sd2FM?=
	=?utf-8?B?bnFSMEZHa0NqcmVjbGI4cWw2Snp1K2pFTmhMNk9LRGxVZ1BoaEdRRWQwUnJ6?=
	=?utf-8?B?QzNnRUVsTnhLR0Z4NGpwaTNQaVBvK0hrNmdGbFRSL1NUeXdqekZOZVBKajE0?=
	=?utf-8?B?TnVBODNxOERCelNFbUtoVTV2Tjc1TTAzUDc4Q2ZaZ0Z4bFFVa0xhQ1Nmanp3?=
	=?utf-8?B?L3NJaXJWUE9DaFpYdnE5K2lsLzVGV2tRdk9WVGFhcVZVMTJZMU9ueXluQXFL?=
	=?utf-8?Q?MO4CVXyZ6Ta+D6DCuRiabiBVqb3Ug6Gy12lGgnV7Jq/09R?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0502;
	6:xHJGXmVvwzaRv5m0m5kKXhlT6gDox9shNtbhs8txP0lHKcFjqiP5JuHSqGHulrqzSF9Aytb0BxfcHp59d1f0a8Ok832pv7pzu8X9NK+8+jUEHrPJZqpWSuLv9UmqL9OdIh18CAIuMD47ZYWN/DC70rSZcH9Hgzybazmn1DtQqTXdDIfPCVL0NDdQSkiqQiNLLaHiPXjDV6JAGH52VgnB+aM7oXZnwZeCds7ZRaJXMQFCT/MWi4bYRqYV+iuRxBSOFDReSC7G3DNyfpxn0bvQVlkYlnLHsfEn2pjJmswJdebG8VVNGhNZ4D5XktFFF+ytZ+DSPjwha+NunbSMNiPANw==;
	5:C1/3oBelCgsw9RWzIyuU6hiWP8Ve/0OYpaXSNNLq52dYJ47uj5HFu0pik0MRtXkCKBbjfP21ZQEz1LC4vC9nlk7381fNXExvTSWWlb/vf6qmLT9htITYhviu8z2Aw8+u9opiVvEoG7dyhr0IWCgt8g==;
	24:qJN4zGk4jrVDoM0NDAG/65kEBBLwt7NbkKtsFhy9l0hbGQHZBPCOftEMjkOI3cZoZa0BMJX8Ol28KLMIMkLdRLn+eDQPRhUp/pz4E/btwGY=;
	7:+ikTBZSDUDvUJgkzl/QaT7e0Rlzr8Z5C2DMEWupy3V1XZCyH0S2IOpxEsll+sAcaBVyEYhPookIvsVnM9t52XfYu1V2wknf0ss3NwZFnawbAjoaKABpjnwR839iWGsKczfl5w/pSa8Q+5+UlEtGFdVI0MSsvKQBAy3XOdsJxHKXj8NSOFgQMqnSv1UMTt3HVZ8baUXRHgh88eVuTLDHP8a2vq/qm6RwH/WvEd2smwC0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2017 07:46:11.0367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0502
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1708210126
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: Re: [PATCH] oe/path.py: copyhardlinktree: don't overwrite existing symlinks
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
X-List-Received-Date: Mon, 21 Aug 2017 07:46:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Aug 2017, Richard Purdie <richard.purdie@linuxfoundation.org> wr=
ote:
> On Wed, 2017-08-16 at 14:13 +0300, Ioan-Adrian Ratiu wrote:
>> Starting with tar>=3D1.26 the default behaviour when extracting is to
>> overwrite symlinks and a '-h' flag was added for tar to follow them.
>>
>> The primary use case for this is to allow ${DEPLOY_DIR_IPK/RPM/DEB}
>> to
>> be symlinks and avoid copyhardlinktree replacing those symlinks with
>> a
>> normal directory.
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  meta/lib/oe/path.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Does the -h option exist for tar < 1.26?

Actually it was introduced for extraction in tar 1.24, but for the
archiving command it existed much longer (I went back and confirmed
until release 1.14 in 2004 where the tar git log ends).

The tar git commit which added -h for extraction in 1.24 is:
14efeb9f956e38d7be (tar: --dereference consistency)

-h is set by default when creating archives for systems supporting
symlinks, but -h when extracting is not set by default.

Sorry for the 1.24/1.26 mixup, I'll ammend the patch msg in v2.

Do you want me to do some version checking? (GNU tar 1.24 was released
in 2011).

Ionel

>
> Cheers,
>
> Richard
National Instruments Romania S.R.L.
------------------------------------------------------
B-dul 21 Decembrie 1989, nr. 77, A2
Cluj-Napoca 400604, Romania
C.I.F.: RO17961616 | O.R.C.: J12/3337/2005
Telefon: +40 264 406428 | Fax: +40 264 406429
E-mail: office.cluj@ni.com
Web: romania.ni.com

Vanzari si suport tehnic:
Telefon gratuit : 0800 070071
E-mail vanzari: ni.romania@ni.com
E-mail suport tehnic: techsupport@ni.com

