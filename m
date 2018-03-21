Return-Path: <prvs=2618a40847=alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1517896A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 18:56:19 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w2LIu4n3007914 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 13:56:21 -0500
Received: from nam01-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam01lp0114.outbound.protection.outlook.com
	[207.46.163.114])
	by mx0a-00010702.pphosted.com with ESMTP id 2gs1kbm9n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 13:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SlS6FuYHTu282brOHzCJwNAyuhIc3jrAtW+gMa73+xE=;
	b=Ilji2EWMvFuKHcNc0qYJcIeA+F8N/HCHdUfHJMWj1kJBaabD8J9twqdkMv2iTD9APAc5CPAscUPapUpAqf9WvTJ3pIDAV2HMQd+om8M8df+141xqM9Qc/MfNQZ/ErV5rlKsnS8Ip/O5r6ZVL6Bqp6GEaGZG+AxEcO1m8UEYPBts=
Received: from rtosams.amer.corp.natinst.com (130.164.62.179) by
	DM2PR0401MB0973.namprd04.prod.outlook.com (2a01:111:e400:3c0f::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.588.14;
	Wed, 21 Mar 2018 18:56:18 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 13:55:58 -0500
Message-Id: <20180321185559.30749-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [130.164.62.179]
X-ClientProxiedBy: CY4PR1101CA0017.namprd11.prod.outlook.com
	(2603:10b6:910:15::27) To DM2PR0401MB0973.namprd04.prod.outlook.com
	(2a01:111:e400:3c0f::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed95236a-dff6-49ef-d6fa-08d58f5d6e32
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM2PR0401MB0973; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	3:tRVvxiM+HG9GeJsiKPxZ/Lq1NqQD+1QoXiZz5JjqFT7rs5egFbWsDpH9rdo5gV0QbWNOYzLeilA3YYGGSiQI9NV0wmOkyi7hXQskks+Cpu6Z9Rixtz0cJ/9DQBPzQv9iMMTl93rq1oyWfEN3ygSqGYsC1ULKP7H/IxqSGe7LujaXCm3GhCUS4J1xOA3UJnLg4xCGNt0jpROGaURUoWQeiNr5xW+ht/5ALZvfp41ey5JXV4/FL0VVhr0K7p4fx1M5;
	25:AOnwwAlvf877T2xO+uBqJq33mcVjxGVkbpJ9JwzwWy3IgnyiLfAnvw+turw8nlfqchtfFStqZ3H3mt3wNbfPA0seFcT4uJXnioMKedvl6hjGsJAE5ek6WS2YHWR0QqxCbZebed9IvxS3IxuwdrfUb8iTQinbP8nvBkFCkwN2TnBJqpoMbbKs98i07c6UQ7Yo3TRtAnL/u+b2xdowZgxvomRLflCJQ5gFo5fFcu1v0AUV0FtVSjloU6LGUsryn2wKKCmL7OVVx8A4zAYWfsHBY3yuDbj3hWarbJLCp3VFTBvNKVUPu6g46hPazCx2N+f/d/0KmHgabU7jdJihYVjToQ==;
	31:rfMXDZjtLblL7WRPHlBWbQ6T1EjW6yUdMpezBxJW5gkH8gSH/mqBFxuOXRDXI3oYIoQzOwmemyf00FQgZVH4Ie5U7YUNuJ7BPduArCgl2Khrb9YsdpXh8JKgv0cpEXoG3ZIhkl7RSWDtvUXTkfytcgg7ubUTt6XMHRewXH/9R+JWGo3YZfVwp25bHJmCeSIQ7oJ6IrzvVsi/7mWSstgd8ISNx0BkXWOuGOqNUE/6CyY=
X-MS-TrafficTypeDiagnostic: DM2PR0401MB0973:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	20:hRqBvjVpijAaW1JZqa8nULIS8l62Te5J4k9d+WdThiz3PnQzASSSixizRlhKFi61m3+6/kRNMqxYo8lcjHM5SUa2NSYleaD/fspC5o9CBLjbk9piJlGyKk5H/l8F4pIg1jZ4PASeAjgczZhwI6TmWZ+7qa+J+NcKCjSaD8+m+bl6r6HWld8hslw8QwbfQDwWlzQkYfJ3o4h8W/cvaPKN0bo1QS/t50CHzIxN3KkcxVI6vnz6iMRQiSXSSacLdP9Nh12DzBOxqyvlVb820D6Dt0QWa5/jQMmEFg77vJ7if8noAaNeyQKcwBMh0ajKfNZQGIlz2sofbBvIKJRj4WxdqCNwglYAouMyIhvNvVzDF8Ctkm1jvThs3smszZs79P2Hb3buBzBJB2nFyDTKI7kjVO1rTm/kNGUbxN0v1Omt9D4PTh6xsRa22gz+EFzlymyOEQ/G1pqgsDHViAC0pFfN+GnNbjYYvpeydiP3VynPBw46XZghLU7F9QIVzTTn3ugKt6sqtEISGPggotQHpUUbL3AsOiFeo7/xuA24AVufc12EOj3ga7/LtnTwuOFKO9KsT2dHtZFQ1mOGGt6tBjAiZ3Kxa7DMuAwSCJVx/clpPOg=;
	4:rDIZimK1JD25DVEgOqDzx2uXQjge/VuGiOPJLqeDgt2T12U39A/KvfOFGJ42w43233bMmMS3rV4Iew63cWu5KoV3d6bdH8Hqe/cZSKzh8E0YDnbOWRQCCyO71FFvOKFjc/MhjkyiUo4S3A2fl8VgJkWWdM1Ug96z0XhcOdWGqMh+OJjXqsAfHb6REYtZV01+BJW0+zIZyGcbefCsxIzq3KpOlgVgU3X0OwwXeM0eNDN8yYoKhJ9QoAbdnwh9hy5uzR01SkWyX1JH0U6MpRareg==
X-Microsoft-Antispam-PRVS: <DM2PR0401MB0973C63BF82CC191301E2196FEAA0@DM2PR0401MB0973.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231221)(944501326)(52105095)(3002001)(93006095)(93001095)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:DM2PR0401MB0973; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0401MB0973; 
X-Forefront-PRVS: 0618E4E7E1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(376002)(39380400002)(346002)(39860400002)(189003)(199004)(6666003)(7736002)(3846002)(6116002)(2351001)(25786009)(4326008)(16526019)(52116002)(105586002)(186003)(2361001)(305945005)(51416003)(8676002)(53936002)(6916009)(1076002)(316002)(86362001)(81166006)(16586007)(59450400001)(6486002)(68736007)(6512007)(8936002)(81156014)(48376002)(5660300001)(47776003)(50466002)(1857600001)(386003)(36756003)(2906002)(106356001)(6506007)(478600001)(97736004)(26005)(50226002)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB0973;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0401MB0973;
	23:JwwuWWkoYI7HvFYU4z1ZJ4hDsfECheeUFsb8YA3?=
	=?us-ascii?Q?tx5ChMNwckZ+PYSxAr6dEVad4GNWwOfuDQ/yrQuHT1mfhQzRb2HbE1bAfGu7?=
	=?us-ascii?Q?E1J5X5mnrbr9Km5gLcd6BHbxN95K3SFBKGM6ZelODguJATxGK1iN1p/Me9Rz?=
	=?us-ascii?Q?phIvfTbPVUJuvBrowoNJRDO3ZnX6V0QFjReoB5MgDDr0QY6xqQEKWYx91AJW?=
	=?us-ascii?Q?yYjUPZImbPnAcSHA8WfEVSKuiXARYuzlWszP5+Fh3h5G0OL8bEILW2hPMHpG?=
	=?us-ascii?Q?TeW4QOGIMvcMvi6hJiZA3kc3Yi5oEUs1Q3uMGCHgF5F0hndYwCUxv8KiQ2g3?=
	=?us-ascii?Q?c8URKdVfsNhhJesdN5ZUTb/ndCsZkl7spKKBwfIKimcbBour8BmS2i6EibGp?=
	=?us-ascii?Q?jpjdSe+shlxCsf2JD6ODqII9lEBcm9KBcqKzXZ1/psPWUAila6cRaLT4eZMJ?=
	=?us-ascii?Q?xSUQbeN0EJEA5jvjjnKB5FWUUbevsz2XC8llMcBXKzDsubKnl448C22iY99U?=
	=?us-ascii?Q?lcH8q3f+Gde77D8cFuGoKExagxLxsVlCExNC+wBcPqr2njIqpCLch4GYA1d+?=
	=?us-ascii?Q?rGYb6Vmk96cFWwG6s9Wkv8wxtaAu3cC3uaiik4LnDgsAhz/ztv0T7avkmsFi?=
	=?us-ascii?Q?4/hYsvG+GIQo0OBvAp/8KR0FWLZO9zHMLDqoNWWBWGXrhPmGbttqJ5YO4ifv?=
	=?us-ascii?Q?UshAZHe3Sl7QTe/vuCDcc+CisO7L8AQpaG0fU8TLno5qCPtgaoVmFj5MZp1Z?=
	=?us-ascii?Q?LspukevCrRpm5ap1wMPsVwFDSmpdRYuijRCscJIC5di5exFX1EQq3TADXELZ?=
	=?us-ascii?Q?vTcOWDzO4LLGQy8jlqor40p9ZcDvvynqGVEZeElfnE5GbcOX1eOtgP4moBl/?=
	=?us-ascii?Q?gCNotkVrVnGGSP7mhT+ec6VR6Jfvmx6OP47XSlZmpLKsWfOk2/hNU7PGdSMk?=
	=?us-ascii?Q?kBEhSHoLpY2yRe8VlvpeMTSQUfAaDuAdDlYd7xUKgqhbMh/pz2RrGMTOzecf?=
	=?us-ascii?Q?5Sd03qFoIG6prvUCT+7Gk74ZEx4+kZaf7Xyea7iiWQaBxx7x8WF9TQTWyFvR?=
	=?us-ascii?Q?fjy9zmroKX1XHXuKcIWNbzuVkDazj7fmGknwYc25rrsbyVx2zzCYG7HMD3ve?=
	=?us-ascii?Q?eDzZf5oh6C7/8ezDIoZ93d0Y4G7i5foQQbHO8o0QhBQ7nR29vDyQTXA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: fpxp6a1LWUS2qffFaqgKnHkX6i8pMsvdrem8jGZkdhJwnj7v4rks9gjIyiZ7PWJI4Rb+Vci65Mk4Qa3/IJtaGHRiExWf/saYZ7kVdidDkNz28HZAcYqPNQ7H04x0OKvw3T+E/PxJhiz5iXPZPKSwF/tzzRipN6RsjCUWG7TKl0xh5inTl+AUitPcAPh+25F7
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	6:HvvKR9FNPb44Bx3yyAsNjnVL/gsxsC6alU5oSRYhT2TMRWHc93GAiIMxTktzuoopGJC25AETvyhO0jkzTOFS8pVc3d9idc37gNyksyqe4AZpdKn+Pgz8v9yGmLNOdghwjomX8rTyZvf+PI23jjwndXaLLGTyzu93cPWWq+H9fz4/cGSZGqeaRfC/LLQSlkmQkqNf1JLg8G24vvqWZHecdaJuiyHad9mXvsIo91Y+NqjCaDv9Ca+D6l9gy/Y/wTLp2B3VZmTP01qFUHH4MOiVehoEXy11Cu5u3G8h93GE34M/Ah7FUKL9rgCCBVZZ2JZeteksd8XY43vL7VkxNBNwzx5wdGIJ/2vRF4VeF+Qi7hk=;
	5:90iw/0y7rt/iIVIeuk3F7nQ73v2yKbAI8fkumHY49Xos0j6xDyuvR2o76Itp12QJNC1Ge5Cmik7OXMX+mqG42Q4MPo8pvQkH3mJrMWsO+X6m3EuTw0PsUbwwV4feKpFhT+YIyqOPNzLYa3yY5pPKx46JwN0h7d6aMDLqyarOvL0=;
	24:/tJk1lj94XBWlqGYVuzWeg5vIH4ALbS16UJLPjzL4PMFLJVL3LojYe8Ze4Ib6R1AS4G1iNmKlTPVDArlJTvbEuOy+68lxyJnximvyb8lrOw=;
	7:M7TSDFEK8A2G/INlxEex0tsl8Qv/rC1Mso9kn4s828NX61mklLnKjwjJV8E3zMvGGbm8SAJ/qGLmHbxxTiMLT6aH+vcUcsR8XfGgMgIVZGBqelO/6Oz6Bw27kl4yinMJmIgVJeh7VvGMLiCn9aiSuagmdG+botuK8NM0oVcBJRe6ySXTNx10wyJsN2k5CbvWb9Q7lVaVZ313TSIqgrrsFEe6wbnQUbwO4U3j0CGl2TzKYm74XdRIDL2KbvzymfLs
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2018 18:56:18.3693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed95236a-dff6-49ef-d6fa-08d58f5d6e32
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB0973
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-21_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=543 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1803210217
Subject: [PATCH v2 0/1] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Wed, 21 Mar 2018 18:56:20 -0000
Content-Type: text/plain

This is a resubmission of the previous patch by the same name submitted ~1
month ago, plus a fixup suggested by Andre McCurdy (calling getVar without
`expand=True`).

Otherwise, I have rebased to the latest master and revalidated that
hwclock-init, busybox, and util-linux build as expected from the OE-core
project and our internal derivative (NI Linux RT).

Alex Stewart (1):
  recipes-core: breakout hwclock.sh from busybox

 meta/recipes-core/busybox/busybox.inc              | 16 +++--
 meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
 meta/recipes-core/busybox/files/hwclock.sh         | 83 ----------------------
 meta/recipes-core/hwclock-init/files/hwclock.sh    | 83 ++++++++++++++++++++++
 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb | 31 ++++++++
 meta/recipes-core/util-linux/util-linux.inc        |  1 +
 6 files changed, 124 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
 create mode 100644 meta/recipes-core/hwclock-init/files/hwclock.sh
 create mode 100644 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb

-- 
2.11.0


