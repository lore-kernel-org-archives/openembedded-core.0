Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9BA78697
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 22:19:41 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vBCMJRgB031476; Tue, 12 Dec 2017 16:19:40 -0600
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0020.outbound.protection.outlook.com [216.32.180.20])
	by mx0a-00010702.pphosted.com with ESMTP id 2ere7vm28v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2017 16:19:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AMh8uu35xDGe4YZuQV+G5mtbhzSb4dbX1vQK/C2nQrE=;
	b=IsM1E1DAEeL9i2ZSs/CgY7zXRZCP1btmd+kdg4tGz6ArNkmXXIX95cD3gxd1voWWEkq5Y4debQ7669t0DVXl5WilhnMnr/1w/OtL2NVz6G/KLn7vTvKyAERn8Dqxi2wGtqYOzJERh9mnoIF2H1uKgif1PzjF0elHNdToCX4wh0I=
Received: from harisdt.amer.corp.natinst.com (130.164.62.150) by
	MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Tue, 12 Dec 2017 22:19:36 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <1500479806.27323.202.camel@intel.com>
	<20171107184039.31164-1-haris.okanovic@ni.com>
	<1510179606.1903.92.camel@intel.com>
	<f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
	<CAJTo0LaZ7cQFyvMazuZ9PAFMdFgptBHovLBpsHsBmQbmo+19qw@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <47b7ee7a-938e-a893-10ba-f766a3f16060@ni.com>
Date: Tue, 12 Dec 2017 16:19:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaZ7cQFyvMazuZ9PAFMdFgptBHovLBpsHsBmQbmo+19qw@mail.gmail.com>
X-Originating-IP: [130.164.62.150]
X-ClientProxiedBy: DM5PR1101CA0004.namprd11.prod.outlook.com (10.174.246.14)
	To MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9e941ed-8e16-43aa-8ac3-08d541ae6dfe
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307);
	SRVR:MWHPR04MB0705; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	3:iWLQ4bVYAgs6ssyYG+oQlufonGq0QLHSLka26R0k9YIMVwAqwQ4QAWdh3K5wJGAZQdFx5dijHD652R3e1drQOjA5oDjcasORPkLxzGdQJ0V6eeSwvbOl7A6vQYneFoc0unlzO0zIEOwBi7rc6aRkMTcSDb8Q1B6a3OrLxDavRfRQ+Jr3HnfBoaN8RmCLfPGlE1yPRD8kCH7h/PY4svn+CnbMD6aDLE0mIXEVQdHQAsWeaoexZbTA0P3iDBPmFaQt;
	25:0mVzgyCxh+/h5dGNjKFR0hjQypY1A5oTI6UiwjaOk82vmgC4GE9/Dw6tPMEqvcozXI3s1XAiTBHS/Z22PKXo+LTXfFet8EcXeDp9JtRJN1mhrV469+RQikSMX2q7iKrOLmz7K9+XsU48/8wSsrhPBy/iVzY87aJ7ZPx/ZWMoxqN2nGPCdYx2wcpbRqjo2+99fLst4kvK05iJUBJ/y0dj+oYYDxZbFiawYeaFI84x2lkDhi6Apj37coMFc6DkTJcAcMCCuwhR7a8FuEN6Ikkztb9kjuHm+UFqSLI7vd8z0gBIklzr929e9mMfNjDJhNx+9lTpYDsgprYcDCjCLJD0UadJdfAkuF9Py2Lzr8Ah4ao=;
	31:GQkTeiWLKDHYyJPDw3B7K3zEk5R0XqmqHgM4+5iUzmz9h/Pjf/tJz06TMUfRKsh8dE6DLfrkpY9rhjq3H3hpd2BcK9Wm2T05UsbWQ7sGVrZZkaqPt1AuYiajNG+w1b5rw8m1E7CRY3ps/66dIoUDZIAoOsoOtwvnXdLwjSBOqartu2MzCLQW8UQ6iC0cWE7c+JYC/9j2QY3UF87oknTmVMN/9UHBnIPupC6BUWQhCEc=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0705:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	20:ux5YurLZUJfKJ+sEZrX0NlsRUclni1ncrFoLlbgpzNMFR/O2ZbqGH0IrVEm0dD/GHHRGse8D1T8Q81ZqftHzPVgPrUtXhBp/RlGQWS7E5JzyNsou0c4EnxrNVMNo7IPB+7JlMjZve8bdGlAaL76L2+cVxakl3Uy8Q+1PvcxmUpLn0VMeHXpzDA+Bkt5zlw0RRjFmZ9g2l5cZLsTEwpG3NHNn5Ruyacas1kvr8whHWMp1mLdbVXzOEhcr6Ie8w8bHsfo3WGRYbQCu6hNEqM8maFwEFtfnP5yjbaYLImJiHQgPcIpRqeCtDFMZ+XT/oQ2Uk7J7tYGMW0zuUiVFNT2BR6AgxTKkp1+TA4pQfLsgMu4OUibfIXnq2GPdj11sGzqDf3mjhKjOt38rv7QAw8yHYvV9GcjdqTy/Jvuxi5s1DuHFRiioL9eFgA5cb9kPzFexrSFPl/Mpxtu9Pc23hpQy7Qo5sPAl6wxmGBZZbWEZUtbTns4ELSJ2666opHEAcDLgicyhp4DNdV+P/MsKu0KCsyXtXc0u1FJxHah3fx+aoZl3G3lMrLssPGTlZwRDTRbgs2iWkDmaZy83f5YRKY5/aaCv21J0xdpyWX/a4RoF3lo=
X-Microsoft-Antispam-PRVS: <MWHPR04MB07058CCF22BBFAF5469FFF84E5340@MWHPR04MB0705.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(788757137089)(264703809997249)(228905959029699)(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3231023)(10201501046)(3002001)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123562025)(20161123558100)(20161123560025)(6072148)(201708071742011);
	SRVR:MWHPR04MB0705; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR04MB0705; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	4:Qthk4ep4l1y+awnAd5rwbIurq8bN8yhAAZSaSMxefXqRr68nl/o/tkHqlKnsuOFH6t85jRwNeD+VTIrjNRJqNQm+lYi61QTeIHhrY+VVXmoEBI5cFFqfVbjrfZaSDSp1LddFUOf67MYOO1w4/KNqdFkWbFchBdqMS+O1SnVnAUvqwL7HY8dxA/U9qeCcpwYeBQox3rO6HKQ0yJxO03QxKHyx9Yl1N4cB7SImhIIuaLTSL0qfOf+vayHk0xsREThfbiKv3gEHjR1kvyaxLAKNLwyOwX/Jv6QwpYt9ijjQnlYZyQcCyuL08fAjlgzCJA001YUNirvkvFLCZjgEhaAKS0GU0Iq+mtFe8DHUc7kQabx80EnfVv4nbj5HBWigVyqbuPo4GHZ5toHa5gDOtMv0pGwLv9So37ZlyAJyuQoFH4GCb+2wMS5t2MZZa8LuUWqE
X-Forefront-PRVS: 051900244E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(199004)(377424004)(69224002)(189003)(24454002)(6116002)(2870700001)(3846002)(68736007)(575784001)(86362001)(36756003)(7736002)(2906002)(305945005)(31696002)(81166006)(966005)(65826007)(25786009)(2950100002)(6916009)(67846002)(6506007)(53546011)(386003)(8676002)(54906003)(16526018)(53946003)(58126008)(76176011)(5660300001)(83506002)(93886005)(4326008)(81156014)(6666003)(478600001)(316002)(6246003)(106356001)(105586002)(53936002)(2486003)(52146003)(52116002)(23676004)(6512007)(229853002)(1720100001)(8936002)(31686004)(6306002)(47776003)(97736004)(50466002)(66066001)(64126003)(65956001)(59450400001)(65806001)(6486002)(21314002)(579004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0705;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzIzOmRlTzNubkRYOGZxY3lJNURHM0lFNG53cVhC?=
	=?utf-8?B?THVHaTBiUmtEMjVhbytYOFRYMmJDUk1uSkhubjZRRlBBZXNYL1hLcUMrcVh0?=
	=?utf-8?B?enc2ZituMTh6RE5laFdvV2N5SDRSMnl0MXFGSzVrdWFveGE4ekNyQkQwZGR5?=
	=?utf-8?B?Q1J2M3E1MGVMcC9MNFdnaWpvSU1BemY5eng1cFdFbDdTbkNFNmVrc0dmWURG?=
	=?utf-8?B?d2tqREQ1b0NaQmFlcGtlTElYL1dXcXV6OFJnVmNxRUVveGR3d2tBWUhtdXJ4?=
	=?utf-8?B?c3FsU2ViVUlXOFlESC9MS2pNZEZmZ1Q0SXhFaU1Pbm5uSTI4SVdmM2ZkVzJo?=
	=?utf-8?B?dzh0YXpRSE9WcmlGVnBkVEhraUg1UlpMS1l1eGV2U3RYWS80dnFLR2c5amtV?=
	=?utf-8?B?aW9nYXdpTm8xUndLRVYrWDI5TWpEVjBxanBJSlFVV0h3VWNwVWZsN1QwTU04?=
	=?utf-8?B?dUc1SWdZWXV5TEVtdXBQR1RoN2w2ODdPK1phU2xUL2I4aFdlQUF3bmQ3YUJK?=
	=?utf-8?B?eWtSU1hxOVROdytVZU01NFN0ekswNkh4alJGSldQZWpnQjc2ZGd4eGF3czV4?=
	=?utf-8?B?enNSWW83eWRvVy9VY2tYZEYrVU96dm14M3l2enBqUmZjMUxVOE96WlVBWUJs?=
	=?utf-8?B?RmFJVGxmTk9YdkVuN3pTZWRrMXJrNDF1NXZlRUdTUkNsVk10QUdzc1FQTFU5?=
	=?utf-8?B?VHgyK0N4MkUzWlNtMmU5SWFNR1ZZRnJ1dXVDNit1QXRnL0JlWUFxRnNCbWZK?=
	=?utf-8?B?UGJQSnJNblpnZFFtWG1GL2tMUnZlTGlrMUp3YzZVdHEwNmU1QmRST0hScmc0?=
	=?utf-8?B?cnVMdm01bW9ncks1dHJ6SnVzeHlEWHNhT0VqSUZMNE5rWStsWDFHQU1oY0lK?=
	=?utf-8?B?dUlHVXFpejBJbHFmSXhUajUraHd1SGV4eWxwNmVMM21zYnIzRzdjaWpvSERs?=
	=?utf-8?B?Qyt3TzlaSTdnYlF2Zk9IUWEzNHNZR1U5blQwSmZzZHdkVVhFdXlQU1BEMEkz?=
	=?utf-8?B?NTlJTitCVUpUMHVyd2MwYk5nSnlvcHRpUElUTlpVZDhqOFh2NGdKaUttRjNU?=
	=?utf-8?B?em0xcVpDZGNrOVhFaXk1UlVrNWdUc1lZNFZETFg2Y2l5dmtCbmpScWtVOEVQ?=
	=?utf-8?B?YmFzbkVSQmRvakN5STdCQ1RBM2lMbDBtQmd5OUsyc2JQSjlVUUpoQVBlSlB6?=
	=?utf-8?B?ZE1zc1U3b0t1L1hsVDFLa2xSZVl4bkpIZWtyTHBqTklTbUlGVzlYNjc5cU9i?=
	=?utf-8?B?RE01SDdUVFA3K292b3dXR0xIN3lydDF1a1cxQlZwL29YdnRHbTFsWmsvR3hm?=
	=?utf-8?B?Ui9sTStVUENjd3R2UHBEaVRIaDZ4dXVmdUZjVm9EREdTQWdDOThZNEVJanV4?=
	=?utf-8?B?b1RZdjlac2RXOGtHSlJISUJwZWJEQ08vOGErSzVFcEYvY0VXQjRtRjZSVldp?=
	=?utf-8?B?TE1KT2VtYWpoM1N5dm5ZNVVKZlM1a2dFVVdISlB1WmlMaWNGT2R5MFZaK3Z5?=
	=?utf-8?B?QTlYTm1ZQlJXdDd6bFFjK1AxTGxWdUl6Tys0em5QV3F0eFB5c3NrcEJSYlI5?=
	=?utf-8?B?ZURTYnRYMUcyQ0Exb0lHVWV6a08xMEN3UzY4NHhZQUxvVU9GeVQwa0dCbVpR?=
	=?utf-8?B?K0FsNHNqdWVPZU1BMXd2aFF4bDRJOG4wTE9aM3Q5em4rOEJvOVY0QTFpeUcw?=
	=?utf-8?B?Nm85ald2VzhMWDBYTHpNdTZSZklGb1lwZlY0eEFRbVVEZkZuUHBhTE9YeFpS?=
	=?utf-8?B?WHI4NHRLbUE1Q1E3SG5KV1hOMTZYbi9zOW9iSjRxdFNPbWVaRnhlNDRaY21B?=
	=?utf-8?B?TXpZMGJTM2JnWnE0SWp4ZS9ZcVhNcC9NOEEzNkthWFdEci9SbmF5TVlFMUhR?=
	=?utf-8?B?VmxvQ1dGV0NPc1dlQThhbkhGUlRocnd5RGxwck9ybWk1R09iTXR6YzNtbnUz?=
	=?utf-8?B?d0ZvdXR4c2JvVDcyRHVZVmEzSGRHOTVocU1pYlJBc3gwNEVWb0trQzNGQk1P?=
	=?utf-8?B?elRYYnZMZzJiTjRMWXV4Wm5IcjRGd1NyamxId2VTUy9FRG56c1RRYlY1bWEz?=
	=?utf-8?B?VHlVVHBCNnptNDRxU0JXNnFiSUNkZ3RSVm1UQXNmenVmb29vYU8xNEJDeEpY?=
	=?utf-8?B?THc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	6:rLwDzHIxg0N3DnTZwXNGNKHQPIaUWypP6Xm0p4rEjwFiM0ORyLgcsxysEMjn/Y5/3goGET02tJf1jIvYn6uHRsZhD5qtPvnw7mwZ1BrWQmFiJ+fauUmm2ZPNrTK4UYrm49i3w2CEaraE8uHjRiIJFpYvrfxVnDt3Acwxu0s7RC6xSLc7ysfYpTIUnXML+rI67Y8pEFNTqRY44WcgMBXO9+0Q7q4hvqd9UqLtEc8IW2s7b3n2HiLiRKuhtv/7QgUrHPy9R+4Y5CeFb58FgJ8w8wC8yAMpk1p8kbdbyXFY/46o79NXcw1cBMQUGmjTX3fvvho34iz3ZEgmfVym9w2soue12rigTPlTG08uVK9uMWE=;
	5:IvBF2Maihq0B57oS1EdUNR7sdRjSdomM6kvIpWAROZPlkRvRZn9CofjliaG0aQ/PJOncl+1ZTL+IPQfZhp8dl+DAVxu3IJur/wOsYtz0vYR0zfWhk0nx85Hzb+Fd4c6eWQ4oIMayxW75efjcHqEq0rUI3aAJV4yVJVPcTGAtiwg=;
	24:2qHki4BOkDWeAx33B8wwi2Tu2fQ0ycXqOx18k71/mvxK7yrGQ5tHn++HKKkIXojonN8cad5Mmsl1OUCmO4nCasvVv2F4DL72P0AQVhOBpik=;
	7:WQqcJLrwgLKwEkDEgU1uPsdGfq/YT4SCrDw5ntF/0qveIkBX9zlNyemRP/p3rVeiDWYpp7DHTckwJukiV1MAYkDXtRyC3+3o3hfGkL7+3JxNlFr/sZbx6sW3UgvnClt0OfQ1nYBTigWXS7POM3ojoinKlqxyMLTWQ+Vf4ILdyhCWoOBsTN9AWA5WHhsqEunZIOBaSyXyMpCpVz3TfiXgmnXf6COhRygHn6k5imBZiY6t6oPx91Xa6jgah/Hc44hQ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2017 22:19:36.3931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e941ed-8e16-43aa-8ac3-08d541ae6dfe
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0705
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-12-12_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1712120314
Cc: "Ashfield, Bruce \(Wind River\)" <bruce.ashfield@windriver.com>,
	"josh.hernstrom@ni.com" <josh.hernstrom@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH v9] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 12 Dec 2017 22:19:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Ross,

On 12/04/2017 10:13 AM, Burton, Ross wrote:
> I know I'm late and this has gone through so many revisions, but I'm 
> seeing unexplained changes in buildhistory:
> 
> $ buildhistory-diff
> packages/corei7-64-intel-common-poky-linux/linux-intel/kernel-image-bzimage: 
> FILELIST: removed "/boot/bzImage"
> 
> Doing builds of virtual/kernel with and without this patch and comparing 
> pkgdata directly confirms that the /boot/bzImage symlink doesn't exist 
> with this patch but does without it.
> 

I can see a reference to "/boot/bzImage" in both buildhistory and 
tmp-glibc/work/.../pkgdata [1] after running a clean rebuild of 
virtual/kernel [2].

[1] file paths:
 
"buildhistory/packages/qemux86-oe-linux/linux-yocto/kernel-image-bzimage/files-in-package.txt"
 
"tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967-r0/pkgdata/runtime/kernel-image-bzimage"

[2] clean rebuild command:
  bitbake -c cleanall virtual/kernel
  bitbake virtual/kernel

Which file are you diffing? Could you share the full path?

-- Haris

> Ross
> 
> On 10 November 2017 at 21:51, Haris Okanovic <haris.okanovic@ni.com 
> <mailto:haris.okanovic@ni.com>> wrote:
> 
>     No problem! Thanks for all the good feedback. I think we shook out
>     most of the gremlins in the last few months.
> 
>     Let me know if you need help with boot loader integration.
> 
>     -- Haris
> 
> 
> 
>     On 11/08/2017 04:20 PM, Wold, Saul wrote:
> 
> 
>         Haris,
> 
>         Thanks for your patience on this process.  This version works
>         well, now
>         I have the extra work of getting these kernel known to systemd-boot!
> 
>         Acked-by below!
> 
>         Sau!
> 
>         On Tue, 2017-11-07 at 12:40 -0600, Haris Okanovic wrote:
> 
>             Some distros may want to provide alternate kernel "flavors"
>             via feeds
>             or
>             within bootable images. For example, readily available
>             builds which
>             provide certain diagnostic features can enable developers
>             and testers
>             to
>             more quickly resolve issues by avoiding lengthy kernel builds.
> 
>             This change allows for building multiple flavors of the
>             kernel and
>             module packages by templatizing kernel package names via a new
>             KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults
>             to the
>             old
>             name of "kernel", but can be overridden by certain recipes
>             providing
>             alternate kernel flavors.
> 
>             To maintain compatibility, recipes providing alternate
>             kernel flavors
>             cannot be the "preferred provider" for virtual/kernel. This is
>             because
>             OE puts the preferred provider's build and source at
>             "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>             "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>             "tmp-glibc/work/*/$PN/" like other recipes. Therefore,
>             recipes using
>             the
>             default KERNEL_PACKAGE_NAME="kernel" follows the old
>             semantics --
>             build
>             in the old location and may be preferred provider -- while
>             recipes
>             using
>             all other KERNEL_PACKAGE_NAME's build from the normal
>             WORKDIR and
>             don't
>             provide "virtual/kernel".
> 
>             Testing:
>                1. Add `KERNEL_PACKAGE_NAME_pn-linux-yocto-tiny =
>             "tiny-linux"`
>                   to local.conf so that linux-yocto-tiny may build alongside
>                   the main kernel (linux-yocto).
>                2. `bitbake linux-yocto linux-yocto-tiny` to build both
>             kernel
>             flavors.
>                3. Verified image and modules IPKs exist for both:
>                   tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>                   tmp-glibc/deploy/ipk/qemux86/tiny-linux* for
>             linux-yocto-tiny
>                4. Verified linux-yocto is the "preferred provider", and
>             was built
>             in
>                   shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>                5. Add `CORE_IMAGE_BASE_INSTALL_append_pn-core-image-base
>             = "tiny-
>             linux"`
>                   to local.conf to install both kernel flavors in
>             core-image-base.
>                6. `bitbake core-image-base` to build an image.
>                7. Verified image contains two bzImage's under /boot/, with
>                   "yocto-standard" (linux-yocto recipe) selected to boot via
>             symlink.
> 
>             Discussion threads:
>             https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=cJkppECRP9FwMwrmn-tbJfRpffqbPbeRXS1uCu5JsB0&e=
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=cJkppECRP9FwMwrmn-tbJfRpffqbPbeRXS1uCu5JsB0&e=>
>             er/thread.html#114122
>             https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_t&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=B73w8-RIOKqgiEjZMC2ra49Q1594cWVJp9c6Yx6u34w&e=
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_t&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=B73w8-RIOKqgiEjZMC2ra49Q1594cWVJp9c6Yx6u34w&e=>
> 
>             hread.html#139130
> 
>             [YOCTO #11363]
> 
>             Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com
>             <mailto:adrian.ratiu@ni.com>>
>             Signed-off-by: Gratian Crisan <gratian.crisan@ni.com
>             <mailto:gratian.crisan@ni.com>>
>             Signed-off-by: Haris Okanovic <haris.okanovic@ni.com
>             <mailto:haris.okanovic@ni.com>>
>             Coauthored-by: Gratian Crisan <gratian.crisan@ni.com
>             <mailto:gratian.crisan@ni.com>>
>             Coauthored-by: Haris Okanovic <haris.okanovic@ni.com
>             <mailto:haris.okanovic@ni.com>>
>             Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com
>             <mailto:josh.hernstrom@ni.com>>
> 
> 
>         Acked-by: Saul Wold <sgw@linux.intel.com
>         <mailto:sgw@linux.intel.com>>
> 
>         Sau!
> 
>             ---
>             [PATCH v2] Change STAGING_KERNEL_DIR and
>             STAGING_KERNEL_BUILDDIR to
>             the
>             "work" directory in alternate kernel builds, instead of "work-
>             shared",
>             so
>             that the two builds don't clobber each other.
> 
>             [PATCH v3] An updated version of this change rebased onto
>             the current
>             OE-core master. Changes:
>                - Remove PREFERRED_PROVIDER check in linux-yocto.inc in
>             alternate
>                  kernel builds, since alternate kernels aren't the
>                  PREFERRED_PROVIDER for virtual/kernel by definition.
>                - Remove "virtual/kernel" from PROVIDES in alternate
>             kernel builds.
> 
>             [PATCH v4] Another rebase onto master; no functional change.
>             Improved description and testing steps.
> 
>             [PATCH v5]
>                - Warn when PN == KERNEL_PACKAGE_NAME (bug # 11905)
>                - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions
> 
>             [PATCH v6] Add KERNEL_PACKAGE_NAME to
>             kernel-module-split.bbclass for
>             module recipes; fixes lttng-modules build.
> 
>             [PATCH v7] Remove second definition of KERNEL_PACKAGE_NAME from
>             kernel-module-split.bbclass; apply a default in two places where
>             KERNEL_PACKAGE_NAME is referenced.
> 
>             [PATCH v8] Rebase onto current master and more fixups.
>                - kernel-devicetree.bbclass: Fixup package names
>                - depmodwrapper-cross: don't error when called from alt
>             kernel
>             recipes
>                - kernel.bbclass: Don't install /boot/image symlink in
>             alt recipes
> 
>             [PATCH v9]
>                - Add feature tracking tag
>                - Update testing section to define vars in local.conf
>                - Add KERNEL_PACKAGE_NAME check to *-rt recipes
> 
>             https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=g1DTbKMM_NmbTwVK6ABKrg7v5Qst-DAX8wovpBEZiQQ&e=
>             <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=g1DTbKMM_NmbTwVK6ABKrg7v5Qst-DAX8wovpBEZiQQ&e=>
> 
>             multi-kernel-packages-v9
>             ---
>                meta/classes/kernel-devicetree.bbclass             |   8 +-
>                meta/classes/kernel-module-split.bbclass           |   9 +-
>                meta/classes/kernel.bbclass                        | 114
>             +++++++++++++--------
>                meta/conf/documentation.conf                       |   1 +
>                .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__depmodwrapper-2Dcross-5F1.0.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=qlgY-8Y1g9Cq89Pn9M5yTk4r8YvbySKJLXNiZXT9HbQ&e=>
>             |  14 +--
>                meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.10.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=uYMHx1CaQM9mvkTAOhJ1-8y0C3YmbfKIQbs9BLe7J5E&e=> 
>               |   2 +-
>                meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.12.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=_oN3Rf0BYilWc5XSBIjUTHmA1U91aV_nw8qmd2XCOOc&e=> 
>               |   2 +-
>                meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.4.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=5gPtrJeah56v8FQaPyMAlG97S5Po4b9odaMPEULAc4c&e=> 
>                |   2 +-
>                meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.9.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=dsIUW4hBrziD1cM8dWZANTqlqlUz3p6T9ZsLbn4iy6c&e=> 
>                |   2 +-
>                meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>                10 files changed, 94 insertions(+), 62 deletions(-)
> 
>             diff --git a/meta/classes/kernel-devicetree.bbclass
>             b/meta/classes/kernel-devicetree.bbclass
>             index 6e08be4b70..4f80cc62eb 100644
>             --- a/meta/classes/kernel-devicetree.bbclass
>             +++ b/meta/classes/kernel-devicetree.bbclass
>             @@ -1,10 +1,10 @@
>                # Support for device tree generation
>                PACKAGES_append = " \
>             -    kernel-devicetree \
>             -    ${@['kernel-image-zimage-bundle',
>             ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>             +    ${KERNEL_PACKAGE_NAME}-devicetree \
>             +    ${@[d.getVar('KERNEL_PACKAGE_NAME') +
>             '-image-zimage-bundle',
>             ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>                "
>             -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
>             /${KERNEL_IMAGEDEST}/*.dtbo"
>             -FILES_kernel-image-zimage-bundle =
>             "/${KERNEL_IMAGEDEST}/zImage-
>             *.dtb.bin"
>             +FILES_${KERNEL_PACKAGE_NAME}-devicetree =
>             "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>             +FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle =
>             "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>                  # Generate kernel+devicetree bundle
>                KERNEL_DEVICETREE_BUNDLE ?= "0"
>             diff --git a/meta/classes/kernel-module-split.bbclass
>             b/meta/classes/kernel-module-split.bbclass
>             index 1035525dac..73c7f18c78 100644
>             --- a/meta/classes/kernel-module-split.bbclass
>             +++ b/meta/classes/kernel-module-split.bbclass
>             @@ -30,7 +30,7 @@ do_install_append() {
>                  PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>                -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>             +KERNEL_MODULES_META_PACKAGE ?= "${@
>             d.getVar("KERNEL_PACKAGE_NAME",
>             True) or "kernel" }-modules"
>                  KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>                KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>             @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>                           postfix = format.split('%s')[1]
>                           d.setVar('RPROVIDES_' + pkg,
>             pkg.replace(postfix, ''))
>                +    kernel_package_name =
>             d.getVar("KERNEL_PACKAGE_NAME", True) or
>             "kernel"
>             +    kernel_version = d.getVar("KERNEL_VERSION", True)
>             +
>                    module_regex = '^(.*)\.k?o$'
>                      module_pattern_prefix =
>             d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>                    module_pattern_suffix =
>             d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>             -    module_pattern = module_pattern_prefix +
>             'kernel-module-%s' +
>             module_pattern_suffix
>             +    module_pattern = module_pattern_prefix +
>             kernel_package_name +
>             '-module-%s' + module_pattern_suffix
>                      postinst = d.getVar('pkg_postinst_modules')
>                    postrm = d.getVar('pkg_postrm_modules')
>                -    modules = do_split_packages(d,
>             root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>             output_pattern=module_pattern, description='%s kernel module',
>             postinst=postinst, postrm=postrm, recursive=True,
>             hook=frob_metadata,
>             extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>             +    modules = do_split_packages(d,
>             root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>             output_pattern=module_pattern, description='%s kernel module',
>             postinst=postinst, postrm=postrm, recursive=True,
>             hook=frob_metadata,
>             extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>                    if modules:
>                        metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>                        d.appendVar('RDEPENDS_' + metapkg, ' '+'
>             '.join(modules))
>             diff --git a/meta/classes/kernel.bbclass
>             b/meta/classes/kernel.bbclass
>             index 756707a3c2..48b718d777 100644
>             --- a/meta/classes/kernel.bbclass
>             +++ b/meta/classes/kernel.bbclass
>             @@ -1,6 +1,9 @@
>                inherit linux-kernel-base kernel-module-split
>                -PROVIDES += "virtual/kernel"
>             +KERNEL_PACKAGE_NAME ??= "kernel"
>             +KERNEL_DEPLOYSUBDIR ??= "${@ "" if
>             (d.getVar("KERNEL_PACKAGE_NAME",
>             True) == "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
>             +
>             +PROVIDES += "${@ "virtual/kernel" if
>             (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>                DEPENDS += "virtual/${TARGET_PREFIX}binutils
>             virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>                PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>                @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME =
>             "${@legitimize_package_
>             name(d.getVar('KERNEL_VERSION')
>                KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>                  python __anonymous () {
>             +    pn = d.getVar("PN", True)
>             +    kpn = d.getVar("KERNEL_PACKAGE_NAME", True)
>             +
>             +    # XXX Remove this after bug 11905 is resolved
>             +    #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand
>             correctly
>             +    if kpn == pn:
>             +        bb.warn("Some packages (E.g. *-dev) might be
>             missing due to
>             "
>             +                "bug 11905 (variable KERNEL_PACKAGE_NAME ==
>             PN)")
>             +
>             +    # The default kernel recipe builds in a shared location
>             defined
>             by
>             +    # bitbake/distro confs: STAGING_KERNEL_DIR and
>             STAGING_KERNEL_BUILDDIR.
>             +    # Set these variables to directories under ${WORKDIR} in
>             alternate
>             +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=
>             kernel) so
>             that they
>             +    # may build in parallel with the default kernel without
>             clobbering.
>             +    if kpn != "kernel":
>             +        workdir = d.getVar("WORKDIR", True)
>             +        sourceDir = os.path.join(workdir, 'kernel-source')
>             +        artifactsDir = os.path.join(workdir, 'kernel-build-
>             artifacts')
>             +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>             +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>                      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>             KERNEL_IMAGETYPES
>                    type = d.getVar('KERNEL_IMAGETYPE') or ""
>                    alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>                    types = d.getVar('KERNEL_IMAGETYPES') or ""
>             +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>                    if type not in types.split():
>                        types = (type + ' ' + types).strip()
>                    if alttype not in types.split():
>             @@ -55,15 +79,15 @@ python __anonymous () {
>                        typelower = type.lower()
>                        imagedest = d.getVar('KERNEL_IMAGEDEST')
>                -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' +
>             typelower)
>             +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname,
>             typelower))
>                -        d.setVar('FILES_kernel-image-' + typelower, '/'
>             + imagedest
>             + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest
>             + '/' +
>             type)
>             +        d.setVar('FILES_' + kname + '-image-' + typelower,
>             '/' +
>             imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' +
>             imagedest
>             + '/' + type)
>                -        d.appendVar('RDEPENDS_kernel-image', ' ' +
>             'kernel-image-' +
>             typelower)
>             +        d.appendVar('RDEPENDS_%s-image' % kname, '
>             %s-image-%s' %
>             (kname, typelower))
>                -        d.setVar('PKG_kernel-image-' + typelower,
>             'kernel-image-' +
>             typelower + '-${KERNEL_VERSION_PKG_NAME}')
>             +        d.setVar('PKG_%s-image-%s' % (kname,typelower),
>             '%s-image-
>             %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>                -        d.setVar('ALLOW_EMPTY_kernel-image-' +
>             typelower, '1')
>             +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
>             typelower),
>             '1')
>                      image = d.getVar('INITRAMFS_IMAGE')
>                    if image:
>             @@ -121,9 +145,9 @@ base_do_unpack_append () {
>                  inherit kernel-arch deploy
>                -PACKAGES_DYNAMIC += "^kernel-module-.*"
>             -PACKAGES_DYNAMIC += "^kernel-image-.*"
>             -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>             +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>             +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>             +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>                  export OS = "${TARGET_OS}"
>                export CROSS_COMPILE = "${TARGET_PREFIX}"
>             @@ -339,7 +363,9 @@ kernel_do_install() {
>                      install -d ${D}/boot
>                      for type in ${KERNEL_IMAGETYPES} ; do
>                              install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>             ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
>             -               ln -sf ${type}-${KERNEL_VERSION}
>             ${D}/${KERNEL_IMAGEDEST}/${type}
>             +               if [ "${KERNEL_PACKAGE_NAME}" == "kernel" ];
>             then
>             +                       ln -sf ${type}-${KERNEL_VERSION}
>             ${D}/${KERNEL_IMAGEDEST}/${type}
>             +               fi
>                      done
>                      install -m 0644 System.map ${D}/boot/System.map-
>             ${KERNEL_VERSION}
>                      install -m 0644 .config
>             ${D}/boot/config-${KERNEL_VERSION}
>             @@ -393,9 +419,9 @@ do_shared_workdir_setscene () {
>                  emit_depmod_pkgdata() {
>                      # Stash data for depmod
>             -       install -d ${PKGDESTWORK}/kernel-depmod/
>             -       echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
>             depmod/kernel-abiversion
>             -       cp ${B}/System.map
>             ${PKGDESTWORK}/kernel-depmod/System.map-
>             ${KERNEL_VERSION}
>             +       install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>             +       echo "${KERNEL_VERSION}" >
>             ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-
>             abiversion
>             +       cp ${B}/System.map
>             ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>             depmod/System.map-${KERNEL_VERSION}
>                }
>                  PACKAGEFUNCS += "emit_depmod_pkgdata"
>             @@ -410,7 +436,7 @@ do_shared_workdir () {
>                      # Store the kernel version in sysroots for module-
>             base.bbclass
>                      #
>                -     echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>             +       echo "${KERNEL_VERSION}" >
>             $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>                      # Copy files required for module builds
>                      cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>             @@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install
>             do_configure
>                  # kernel-base becomes kernel-${KERNEL_VERSION}
>                # kernel-image becomes kernel-image-${KERNEL_VERSION}
>             -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image
>             kernel-
>             dev kernel-modules"
>             +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>             ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>             ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>                FILES_${PN} = ""
>             -FILES_kernel-base =
>             "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>             ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>             -FILES_kernel-image = ""
>             -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>             /boot/config* ${KERNEL_SRC_PATH}
>             ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>             -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>             -FILES_kernel-modules = ""
>             -RDEPENDS_kernel = "kernel-base"
>             +FILES_${KERNEL_PACKAGE_NAME}-base =
>             "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>             ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>             +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>             +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>             /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>             ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>             +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
>             ${KERNEL_VERSION_NAME}"
>             +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>             +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>                # Allow machines to override this dependency if kernel
>             image files
>             are
>                # not wanted in images as standard
>             -RDEPENDS_kernel-base ?= "kernel-image"
>             -PKG_kernel-image =
>             "kernel-image-${@legitimize_package_name('${KERNE
>             L_VERSION}')}"
>             -RDEPENDS_kernel-image +=
>             "${@base_conditional('KERNEL_IMAGETYPE',
>             'vmlinux', 'kernel-vmlinux', '', d)}"
>             -PKG_kernel-base =
>             "kernel-${@legitimize_package_name('${KERNEL_VERSI
>             ON}')}"
>             -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>             -ALLOW_EMPTY_kernel = "1"
>             -ALLOW_EMPTY_kernel-base = "1"
>             -ALLOW_EMPTY_kernel-image = "1"
>             -ALLOW_EMPTY_kernel-modules = "1"
>             -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>             -
>             -pkg_postinst_kernel-base () {
>             +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=
>             "${KERNEL_PACKAGE_NAME}-
>             image"
>             +PKG_${KERNEL_PACKAGE_NAME}-image =
>             "${KERNEL_PACKAGE_NAME}-image-${@
>             legitimize_package_name('${KERNEL_VERSION}')}"
>             +RDEPENDS_${KERNEL_PACKAGE_NAME}-image +=
>             "${@base_conditional('KERNE
>             L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux',
>             '', d)}"
>             +PKG_${KERNEL_PACKAGE_NAME}-base =
>             "${KERNEL_PACKAGE_NAME}-${@legitim
>             ize_package_name('${KERNEL_VERSION}')}"
>             +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=
>             "${KERNEL_PACKAGE_NAME}-
>             ${KERNEL_VERSION}"
>             +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>             +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>             +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>             +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>             +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel
>             modules meta
>             package"
>             +
>             +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>                      if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>                              mkdir -p $D/lib/modules/${KERNEL_VERSION}
>                      fi
>             @@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {
>                PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>                  python split_kernel_packages () {
>             -    do_split_packages(d,
>             root='${nonarch_base_libdir}/firmware',
>             file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>             output_pattern='kernel-
>             firmware-%s', description='Firmware for %s', recursive=True,
>             extra_depends='')
>             +    do_split_packages(d,
>             root='${nonarch_base_libdir}/firmware',
>             file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>             output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
>             description='Firmware for %s', recursive=True, extra_depends='')
>                }
>                  # Many scripts want to look in arch/$arch/boot for the
>             bootable
>             @@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-
>             ${MACHINE}.tgz"
>                MODULE_TARBALL_DEPLOY ?= "1"
>                  kernel_do_deploy() {
>             +       deployDir="${DEPLOYDIR}"
>             +       if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
>             +               deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
>             +               mkdir "$deployDir"
>             +       fi
>             +
>                      for type in ${KERNEL_IMAGETYPES} ; do
>                              base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>             -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>             ${DEPLOYDIR}/${base_name}.bin
>             +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>             $deployDir/${base_name}.bin
>                      done
>                      if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
>             '^CONFIG_MODULES=y$' .config); then
>                              mkdir -p ${D}/lib
>             -               tar -cvzf
>             ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME}
>             -C ${D} lib
>             -               ln -sf ${MODULE_TARBALL_BASE_NAME}
>             ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>             +               tar -cvzf
>             $deployDir/${MODULE_TARBALL_BASE_NAME} -C
>             ${D} lib
>             +               ln -sf ${MODULE_TARBALL_BASE_NAME}
>             $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
>                      fi
>                      for type in ${KERNEL_IMAGETYPES} ; do
>                              base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>                             
>             symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
>             -               ln -sf ${base_name}.bin
>             ${DEPLOYDIR}/${symlink_name}.bin
>             -               ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
>             +               ln -sf ${base_name}.bin
>             $deployDir/${symlink_name}.bin
>             +               ln -sf ${base_name}.bin $deployDir/${type}
>                      done
>                      cd ${B}
>             @@ -650,8 +682,8 @@ kernel_do_deploy() {
>                                      echo "Copying deploy ${type} kernel-
>             initramfs image and setting up links..."
>                                      initramfs_base_name=${type}-
>             ${INITRAMFS_BASE_NAME}
>                                     
>             initramfs_symlink_name=${type}-initramfs-
>             ${MACHINE}
>             -                       install -m 0644
>             ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>             ${DEPLOYDIR}/${initramfs_base_name}.bin
>             -                       ln -sf ${initramfs_base_name}.bin
>             ${DEPLOYDIR}/${initramfs_symlink_name}.bin
>             +                       install -m 0644
>             ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>             $deployDir/${initramfs_base_name}.bin
>             +                       ln -sf ${initramfs_base_name}.bin
>             $deployDir/${initramfs_symlink_name}.bin
>                              fi
>                      done
>                }
>             diff --git a/meta/conf/documentation.conf
>             b/meta/conf/documentation.conf
>             index a55e2836b5..2c88504fb9 100644
>             --- a/meta/conf/documentation.conf
>             +++ b/meta/conf/documentation.conf
>             @@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] = "The type of
>             kernel to
>             build for a device, usually set b
>                KERNEL_IMAGETYPES[doc] = "The list of types of kernel to
>             build for a
>             device, usually set by the machine configuration files and
>             defaults
>             to KERNEL_IMAGETYPE."
>                KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that
>             need to be
>             auto-loaded during boot"
>                KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for
>             which the
>             build system expects to find module_conf_* values that specify
>             configuration for each of the modules"
>             +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
>             Defaults to 'kernel'."
>                KERNEL_PATH[doc] = "The location of the kernel sources. This
>             variable is set to the value of the STAGING_KERNEL_DIR
>             within the
>             module class (module.bbclass)."
>                KERNEL_SRC[doc] = "The location of the kernel sources.
>             This variable
>             is set to the value of the STAGING_KERNEL_DIR within the
>             module class
>             (module.bbclass)."
>                KFEATURE_DESCRIPTION[doc] = "Provides a short description
>             of a
>             configuration fragment. You use this variable in the .scc
>             file that
>             describes a configuration fragment file."
>             diff --git
>             a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__depmodwrapper-2Dcross-5F1.0.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=qlgY-8Y1g9Cq89Pn9M5yTk4r8YvbySKJLXNiZXT9HbQ&e=>
>             b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__depmodwrapper-2Dcross-5F1.0.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=qlgY-8Y1g9Cq89Pn9M5yTk4r8YvbySKJLXNiZXT9HbQ&e=>
>             index 44d013f29d..2eec921728 100644
>             --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__depmodwrapper-2Dcross-5F1.0.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=qlgY-8Y1g9Cq89Pn9M5yTk4r8YvbySKJLXNiZXT9HbQ&e=>
>             +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__depmodwrapper-2Dcross-5F1.0.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=qlgY-8Y1g9Cq89Pn9M5yTk4r8YvbySKJLXNiZXT9HbQ&e=>
>             @@ -23,17 +23,13 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
>                    echo "Usage: depmodwrapper -a -b rootfs
>             KERNEL_VERSION" >&2
>                    exit 1
>                fi
>             -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ];
>             then
>             -    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-
>             abiversion" >&2
>             -else
>             -    kernelabi=\$(cat
>             ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
>             -    if [ "\$kernelabi" != "\$4" ]; then
>             -        echo "Error: Kernel version \$4 does not match kernel-
>             abiversion (\$kernelabi)" >&2
>             -        exit 1
>             -    fi
>             +
>             +kernelabi=""
>             +if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ];
>             then
>             +    kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-
>             abiversion")
>                fi
>                -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ];
>             then
>             +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [
>             "\$kernelabi" != "\$4" ]; then
>                    echo "Unable to read:
>             ${PKGDATA_DIR}/kernel-depmod/System.map-
>             \$4" >&2
>                    exec env depmod "\$1" "\$2" "\$3" "\$4"
>                else
>             diff --git
>             a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.10.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=uYMHx1CaQM9mvkTAOhJ1-8y0C3YmbfKIQbs9BLe7J5E&e=>
>             b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.10.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=uYMHx1CaQM9mvkTAOhJ1-8y0C3YmbfKIQbs9BLe7J5E&e=>
>             index f93d9530eb..894e2ffbf6 100644
>             --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.10.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=uYMHx1CaQM9mvkTAOhJ1-8y0C3YmbfKIQbs9BLe7J5E&e=>
>             +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.10.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=uYMHx1CaQM9mvkTAOhJ1-8y0C3YmbfKIQbs9BLe7J5E&e=>
>             @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>                # to build multiple virtual/kernel providers, e.g. as
>             dependency of
>                # core-image-rt-sdk, core-image-rt.
>                python () {
>             -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>             yocto-rt":
>             +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>             d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>             "linux-yocto-rt":
>                        raise bb.parse.SkipPackage("Set
>             PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to
>             enable it")
>                }
>                diff --git
>             a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.12.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=_oN3Rf0BYilWc5XSBIjUTHmA1U91aV_nw8qmd2XCOOc&e=>
>             b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.12.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=_oN3Rf0BYilWc5XSBIjUTHmA1U91aV_nw8qmd2XCOOc&e=>
>             index c49a9340f8..be4d163ff1 100644
>             --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.12.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=_oN3Rf0BYilWc5XSBIjUTHmA1U91aV_nw8qmd2XCOOc&e=>
>             +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.12.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=_oN3Rf0BYilWc5XSBIjUTHmA1U91aV_nw8qmd2XCOOc&e=>
>             @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>                # to build multiple virtual/kernel providers, e.g. as
>             dependency of
>                # core-image-rt-sdk, core-image-rt.
>                python () {
>             -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>             yocto-rt":
>             +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>             d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>             "linux-yocto-rt":
>                        raise bb.parse.SkipPackage("Set
>             PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to
>             enable it")
>                }
>                diff --git
>             a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.4.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=5gPtrJeah56v8FQaPyMAlG97S5Po4b9odaMPEULAc4c&e=>
>             b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.4.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=5gPtrJeah56v8FQaPyMAlG97S5Po4b9odaMPEULAc4c&e=>
>             index 25d88833a9..e489bbb9f2 100644
>             --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.4.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=5gPtrJeah56v8FQaPyMAlG97S5Po4b9odaMPEULAc4c&e=>
>             +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.4.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=5gPtrJeah56v8FQaPyMAlG97S5Po4b9odaMPEULAc4c&e=>
>             @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>                # to build multiple virtual/kernel providers, e.g. as
>             dependency of
>                # core-image-rt-sdk, core-image-rt.
>                python () {
>             -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>             yocto-rt":
>             +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>             d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>             "linux-yocto-rt":
>                        raise bb.parse.SkipPackage("Set
>             PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to
>             enable it")
>                }
>                diff --git
>             a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.9.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=dsIUW4hBrziD1cM8dWZANTqlqlUz3p6T9ZsLbn4iy6c&e=>
>             b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.9.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=dsIUW4hBrziD1cM8dWZANTqlqlUz3p6T9ZsLbn4iy6c&e=>
>             index 6734dc0d05..8212b1445c 100644
>             --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.9.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=dsIUW4hBrziD1cM8dWZANTqlqlUz3p6T9ZsLbn4iy6c&e=>
>             +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>             <https://urldefense.proofpoint.com/v2/url?u=http-3A__linux-2Dyocto-2Drt-5F4.9.bb&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=dsIUW4hBrziD1cM8dWZANTqlqlUz3p6T9ZsLbn4iy6c&e=>
>             @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>                # to build multiple virtual/kernel providers, e.g. as
>             dependency of
>                # core-image-rt-sdk, core-image-rt.
>                python () {
>             -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>             yocto-rt":
>             +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>             d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>             "linux-yocto-rt":
>                        raise bb.parse.SkipPackage("Set
>             PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to
>             enable it")
>                }
>                diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>             b/meta/recipes-kernel/linux/linux-yocto.inc
>             index 9c1f61be75..8a70eb5018 100644
>             --- a/meta/recipes-kernel/linux/linux-yocto.inc
>             +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>             @@ -12,7 +12,7 @@ INC_PR = "r4"
>                # PREFERRED_PROVIDER for virtual/kernel. This avoids
>             network access
>             required
>                # by the use of AUTOREV SRCREVs, which are the default
>             for this
>             recipe.
>                python () {
>             -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>             d.getVar("PN"):
>             +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>             d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=
>             d.getVar("PN",
>             True):
>                        d.delVar("BB_DONT_CACHE")
>                        raise bb.parse.SkipPackage("Set
>             PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>             (d.getVar("PN")))
>                }
>             -- 
>             2.14.2
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_mailman_listinfo_openembedded-2Dcore&d=DwMFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EP5lwXBRFEqw5QJPdVYpiQb5eB78E4pv78trR5xxbos&s=MFcC28RFVfuPEIG4-wKAWkyoD2OBChADq7nxN9-4kMM&e=>
> 
> 

