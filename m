Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0046.outbound.protection.outlook.com [104.47.34.46])
	by mail.openembedded.org (Postfix) with ESMTP id D603A7521E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=w38phUnrr7PvtXpattBTwS6YNd77Y3jiOx9ppeKoDyg=;
	b=pqbSfDZgC5UF5/ELrsWp8EycBbSBvfGqOLVTOuq3TXFVlPZb6BHn7bkbpzvwGaCNvfH8xLLsMdH11u9jE63vxCigFkiZjEPaEz6hyScmuCXqCivMMN3Jpg/jMHX0lmUpylkWXIu86gHp6p41K9BRXsncbEwCJ8B/0eN4w6DsJlY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (97.113.238.55) by
	DM5PR0102MB3414.prod.exchangelabs.com (2603:10b6:4:a0::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.14; Mon, 4 Jun 2018 19:12:35 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-6-mkelly@xevo.com>
	<1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
	<5c2bc7c4-6a79-2775-af6a-30fb6d693296@xevo.com>
	<79a9b2f1db65d8cc4233f93b7b5213d025a6d262.camel@gmail.com>
	<0994b61a-1465-e227-81ff-6ef60e055656@xevo.com>
	<e2132fe30522a6ec140f036a244a71d51c476b51.camel@gmail.com>
	<d97bdd25-24ee-e7f9-0d11-a99489979e46@xevo.com>
	<c1afb473c30f4e3a0f53f3bd746df9d064241a14.camel@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <a9420254-e80c-627e-dd9b-cdbb6d4683ba@xevo.com>
Date: Mon, 4 Jun 2018 12:12:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <c1afb473c30f4e3a0f53f3bd746df9d064241a14.camel@gmail.com>
X-Originating-IP: [97.113.238.55]
X-ClientProxiedBy: MWHPR1701CA0001.namprd17.prod.outlook.com
	(2603:10b6:301:14::11) To DM5PR0102MB3414.prod.exchangelabs.com
	(2603:10b6:4:a0::15)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3414; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3414;
	3:4qjEXeii1CfLVQY/GyiQq5Jjm8Y3US1/O2sXLLji6CLhZuhLgIDpCmnXWxUGvwXgMITAeKjKMPHPn4C/w+YS9WcQWWEekFmbIeotGCJjWxRPSrGGDcsNjKPdhJjjyyMu3Ue8INX8osQsN6pVdbc1rI5HgMXscnjsiScF/6dUnCcAK2r+DyQ7xvqntCcmVvyfiX/inEIww4EKYCQlzWje94OyzgInCdSEQHRz4ZwaNuaXy/L1Xl4U4nUKpWCsSLWm;
	25:cSJze8Z0SKGYwhKTjW197VPkMnKth8BhSSMrsYaMmDtsTLkq+ZIL1nfbGOv3PCTNnreBv7DI2jCD96GVWx1Q4PmtC31TysrjiRKoA8s6UC8hsyTTU8uCez6qApGTz6Pb/sXPmybTxQEUcxR0TWJm2HmqGhFeUrDv1r/S3cqkYx1ZQl7GSYsAoZonNtku1QFMG0HYKLxHesnKLpbG5szcZxmadHbUpWnMgkrw0Ab0vR1GhdF8YkQHAzv29YBT4C6ogvh7l4aCIgRGNxsRG/lAN/J8THlOwbPapqz18E70p2pKjtd7MJgkqBH9nNmIYQ52EpQdgBAyVFiMn72bCpyOlw==;
	31:yt3ZheGRUcohLOhwgrLtzZQSzK8Fm2+0vS4OnmQxHVGWEPt67woOn9KyYaev1GKQ5Qp+f+ddJYyJXpEIknqhg5Tp0XwNAOFvZCneQ2H2r1CKLmzXvW/1E2uU+zR6usWn91X+6lqyiquWRcxm9HYo1MnKjjnwxcPfCAi9BZkWs2rXmk2deo0Et9TNJNoNyniLrhzUq5ne4b38P6WcvNDj3/BM9awv+VjrWnIQmBg6IR0=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3414:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3414;
	20:IRb+DzWlatwnEpUmrVl7/mZcUHe2AEif1VtRntZisdHf56gLtL+WWVMuIqDe8TCCc7gHQj3AC/Bk7MxeHfM6oLuAatEvJmlrscpS3V3MBCE+BOm8ylBu8NHRY1GOaxMljDgp9uAGvcbPxiZJhRnXm0hOEqSuScbc0l+kGXUeIYjehoGC56MEGQHYPOGKDdiyLSLGs/A8n17CFn4V0JQBuTsH/F13QlNoNjGmGDlubec5pUyx/IY/Pc2Wo0rOJSUEz4x6kgquGZmJqamPkYLDqEvPJRr5Ijt2u0E6R+UE9oBFYnB3hpM1x5pLQ5xXraQJcOjm/FxlwizOMCHVany/Ot1KDSr/itRpBGsbi4Ihv5J+lUWDUWHr3yxUoYNbR6WO0YSCXyPqtNInE17IHSkK0ODosadErWOg0m5ePuLyXUYl5YbCNlP9uYdA4w+1zzZYVh/Jzo9ibHpdEolKyHXeElkGipdejCJNReD8br0COS2dGd/XQ39xR2okgmJxtPCT;
	4:yEAG8WHGdpiSPVWyFnP8YokWzjMMKewV88/p5wNybiBpPoJVb8fcNKUwJLmzPSFEhu4woBs2RIS4+FnuUBUhu8x/aJm9VrA8nIBwuZnJCis3lfvDZH+5o+IOx0v5ySy8OLS2odoEN6XCPfHJCQr6C2itwTiZkITtFfF7ON04l7VLPrToVqotCr/equWawrRy46HVxinJIjDOoymHrcxU9uaLbljh50vGpibsjCOwb634cLV7XcOm287C9YrmGBH+/SlO7PJLI40LxFUE1r7ovA==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB341420C64D4CD6FB568A34AAAB670@DM5PR0102MB3414.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3414; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3414; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39380400002)(396003)(346002)(376002)(39840400004)(366004)(189003)(199004)(64126003)(53546011)(58126008)(68736007)(316002)(81156014)(50466002)(81166006)(478600001)(16576012)(230700001)(386003)(8676002)(39060400002)(59450400001)(4326008)(3846002)(23676004)(105586002)(106356001)(31686004)(6486002)(52146003)(6116002)(93886005)(25786009)(52116002)(76176011)(36756003)(305945005)(7736002)(47776003)(229853002)(65826007)(97736004)(77096007)(31696002)(86362001)(2906002)(6666003)(446003)(476003)(11346002)(2616005)(956004)(486006)(67846002)(16526019)(186003)(5660300001)(8936002)(66066001)(65956001)(65806001)(117156002)(6246003)(26005)(2486003)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3414; H:[192.168.0.3];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDJNQjM0MTQ7MjM6WEhjdHRrL0dqQjNBNFNLOWtXRGFuOXN4?=
	=?utf-8?B?U2pMUWUvZGt2NzVVblY5U3RuKzNiQ1BMcDc2ckpYaUdoQVlTWDM1elMyc0lL?=
	=?utf-8?B?bzRBY2d6Zk52TTJMbTRYMHVOc2xtRXlWL3Z5cVQ3MmxraFhFQlkxNUlUNkZD?=
	=?utf-8?B?RE9QMlNRdWlkdGxYajh2QTJpckRuSE13R09oQlRzS1ZwWmxWYXRTa2hoQlhI?=
	=?utf-8?B?ZWJhTkpKZHZkZHowc2NZMUE2R29XM1k2Vm5seXh6d2xFMEJCU3VZRWhUb1dp?=
	=?utf-8?B?VFF5ZVlZOXZXZG1nRVJGNUx3ZDRDQU9rWUdadEtLZlB1em5FaTMxSHJqRnI0?=
	=?utf-8?B?M0hiR05DMStKcWRScjdEckUzVUlIUlcvUjF2WnFib1ZjeWFVN3BrRTJzQ0RJ?=
	=?utf-8?B?WDZ3cGtvNEVPSjYyc2NpOEh6ZjYrcm1ubVZlU1JjRzZ3NWFtK04wRTZTVlkz?=
	=?utf-8?B?Z0I0RmplN243ZWlpVmFWVmNSYldGdnkyd1V4VjdjWkpjWVBrd2FwQVFYRjVs?=
	=?utf-8?B?S3F0b0ZsRFZsK0c0UVAwREVXK1RFcVY3T1M3MjBLZG5WL0cvNytRaitkbmJB?=
	=?utf-8?B?ZDBHcEcwVHE1Sm9tNzJHdDdkWDFuRmZ5amRkVGtRY3J0QnQ2QytIVWRMZy9q?=
	=?utf-8?B?TnNmQ2dXVGFjMVNzYW9jSlRndDNod1hBenRKZmJyWGlKclVQTDNrMHJ5TDVM?=
	=?utf-8?B?ZG50d3Z1Y2NEdmF6Y0NhTWMxWlIrL2Q0SmplcGVZZE12Y0V6YmtlVEdVR3Nz?=
	=?utf-8?B?dERGWG5Ua1l6dWh3NDkyOGkyQTdiUEJWL0haSHo5V0VBLytBeit5TURLOW5i?=
	=?utf-8?B?emlBVTJWbFpCd3ZWbkVHcDg0K2F2eVdvSVk5bERPeTQ2WitKTWNpbVErUTJF?=
	=?utf-8?B?OXpIWlFkb2szb2lwMVBBYXV2VXlZUTJPNDJzVTc5MXZJQnZNQU9TT2RCN3I4?=
	=?utf-8?B?Smk3NGNCZkxzZjQxMWFGVkJHeUprNzIxSnM3MHYvSVB2OTZpNGFLZXR2ZzJt?=
	=?utf-8?B?cm5yYXdKOGtsWFJ2TVJqV0ZNVzQ1WWp4TlFvbnJyQVArUTA0QUFycWR6RGhk?=
	=?utf-8?B?SFQ1Y0RDa0V0ZFlzeGpoeVU4N2V3VWE0YlhGU1dRbUthMUltL1l0NjJKUWV0?=
	=?utf-8?B?NExiU0MyWXZVNGFNTnFoUzBRWHBiQTZVOUJvb1hzWWg5THFwTVNXczRsVTRI?=
	=?utf-8?B?MmQ2RVR5dmwxSjhsUEVmTkF4K0dHQytPVnRoajlJY1dsWGxuZHk2SUFTNXVM?=
	=?utf-8?B?bTlKWXlFU0Q4dkFrOURaV29BbGZiR0VBWEQ5WENTYTJTOWVKeGNMV2duWE4y?=
	=?utf-8?B?em05aWNhNnZtU3VmZ0hVSGtneHFLZnBNcE5IOWhnWHU3Mzk4UkxtK2ZlWkNM?=
	=?utf-8?B?TjNOY0RNdXUyQTdQdndzUWxScHVmTHk3SXpDeWRiZlA0TVRMRmVrcnZib291?=
	=?utf-8?B?R2p1T1BiWm8va0V2anBqY1Q4TlVtSHlkUXkyQm9Wb2FYRnYvc1RPenBhc3hY?=
	=?utf-8?B?MmJKa3d1UXBqYzFnNG9teXRycm4vWXZ5cGNUdmsxeS82QU12K3NHNzArYmIv?=
	=?utf-8?B?UEdMTmxXeWZFK1ExQ1BqWEFjNGRhNnhTbitBcmhHWDI1S2tWYUpBeUhURkV4?=
	=?utf-8?B?Z2lhck5oakxmL3lhT1lZaWhDZVIvcjl0K09TbmlhR25uMzUxTzg4dEx1RWV6?=
	=?utf-8?B?Z2FtbUp1OUsrVW4xOUVPdDBzdVZFUHRSK0l6MmNUdWVDa1FYcGdTRTNMckpC?=
	=?utf-8?B?NERPNFcyQU9TL0N4bjFjcFBtMldCL2VPZ3ZQcm9MajdnY1pwQmdzdXRqSVJG?=
	=?utf-8?B?M3M5Z3EwZ0dTYlZySG1kbSt1SmhYQ1d0eGMvS09nREJ3dUY0cjQrVWZsaDQ4?=
	=?utf-8?B?WE9mOVBwcXplTVN3SlVSNlR1eFRDTUdPWDNHZHV5WVN6YXgrNEIwbks5My9w?=
	=?utf-8?B?U1JCWHIvcDFrUytVZFlHQTZ2a1hDc3hzNE9PdXNOWVQrVmdkbkR6c3YveEdr?=
	=?utf-8?B?clFsS3FrbzJIVmVoQ01uUFNhOUQxTDRVVldWOEc2cnJJSFIzUzFLZEVFLzZa?=
	=?utf-8?Q?2qm1wI=3D?=
X-Microsoft-Antispam-Message-Info: BvnezVzY0dY7OpmV927hfnOuG3Qt7+MoFnBHgUJyStl2TSag2bjW3eJapoNlafFKM6vywQo7FdToGg9iSVn8TyydparNPePVWtsP09dDIfLlCpI0+IORfoeoOjAJmW+rPgi3ShkodPIJCP7KmtS8f9V08oYo6gPM7Nq6I9FLi/PvC/FZYUsmHHKtSOc2kFbD
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3414;
	6:AnXD/Y8EJOe3Mq/dwBZzIyEXzLt7D3gRQ1wYuVaa0HHAB8h8FrdITVJqJsUEr2HeuofftnPMeJ7Yjop104MVT9XMC9Pw2W1b8QZnNuWuJkvGSs5I1hkU8Jlb+ri9OF14AlHOhKKssQ1lQt0915O8qtCGxDL5SXNa1vQi1Qm4PKETP5sKPfwppq0UvKTUB8ZkG0mR1+0UAs34shXu2r1PW9t8rcNOrCDrRcdCaoUphSNE6N2auDSJcQVDzCyM//3f/IvMzWGfmFr3KMSmLPVQ43RG/cspj5kpoXKztm+U3+FT4hjZ58S5wxSElNYaDwPFPTFiaPh67X2UWqoNVGNrp6fdTm6oGWI+uMkTkx/HujHuucD3hhiznJGnal0iZnI6G3aUOZPFTH23GQvBwbvIWxN3tPUQYZS4Xj2hmAyzmjTaENmcwvGg9IYm0S5GXD0Q6l1aPqQWoHodev+p6N4Jqg==;
	5:KYdeICAm/7ImfSwUUyCk1WgKxCx7u32ky6kzYkpwA/oxPMUIz5gsh68Va+FuzYE30Xv8Xj3ByHTtAEOgtVTvhnKhxtvrsXyA/KiVLoyYrpKNa+3c7W8OUUhoWIfadOBVqayoFuHCqQcclnqsyaDveslb1iOyi0SAzYVWN69sUBY=;
	24:XGmIRXtmO8zWBJm3Sbx2Xbp6dhD8RuyBEZ40mp5gl90kZ061X790vbSOB07c+pRDbdelRIunxmfWSUErF1NcwgsnW2n9Pn7GnA0tqfCAla4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3414;
	7:KM9Lmwbh9zAZJwVX17xx4AsW7mXezXE8EzHGeeWGiGXy5bUCowX9tdzFpDsAiAcbvy0MLrqsMZ6K4CTwgalUyQtyacccKMI3ZcajrQ7Kwc4b8ZU6JywZyJzF1pHLVdyUrhjeByUdVRghpN3dKTvFS/16YGmZ2NhE0qeupKl0u5hd+K6yQK4wpM8iWJ58tuJyiVRxga8i0VF1KweukDrmc8VWQ3jRh5q9my065bLOfnJSlgaxT7VAHPA0QHLODir0
X-MS-Office365-Filtering-Correlation-Id: c2688515-5513-4711-68e0-08d5ca4f217f
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 19:12:35.3205 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2688515-5513-4711-68e0-08d5ca4f217f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3414
Subject: Re: [PATCH v2 5/7] toolchain-shar-extract: pass env to post-relocate
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
X-List-Received-Date: Mon, 04 Jun 2018 19:12:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/2018 11:42 AM, Joshua Watt wrote:
> On Mon, 2018-06-04 at 11:24 -0700, Martin Kelly wrote:
>> On 06/04/2018 11:20 AM, Joshua Watt wrote:
>>> On Mon, 2018-06-04 at 11:10 -0700, Martin Kelly wrote:
>>>> On 06/04/2018 10:20 AM, Joshua Watt wrote:
>>>>> On Fri, 2018-06-01 at 15:24 -0700, Martin Kelly wrote:
>>>>>> On 06/01/2018 03:08 PM, Joshua Watt wrote:
>>>>>>> On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
>>>>>>>> It's useful for the post-relocate scripts to be able to
>>>>>>>> see
>>>>>>>> the
>>>>>>>> SDK
>>>>>>>> environment, for example to see the values of CC, CXX
>>>>>>>> etc. in
>>>>>>>> order
>>>>>>>> to
>>>>>>>> dynamically generate toolchain files.
>>>>>>>>
>>>>>>>> To enable this, source the SDK environment script prior
>>>>>>>> to
>>>>>>>> calling
>>>>>>>> the
>>>>>>>> relocate scripts.
>>>>>>>>
>>>>>>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>>>>>>> ---
>>>>>>>>      meta/classes/toolchain-scripts.bbclass     | 17
>>>>>>>> +++++++++++++
>>>>>>>> ----
>>>>>>>>      meta/recipes-core/meta/meta-environment.bb |  5 +++--
>>>>>>>>      2 files changed, 16 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta/classes/toolchain-scripts.bbclass
>>>>>>>> b/meta/classes/toolchain-scripts.bbclass
>>>>>>>> index ae7bbef034..5f99fd8c03 100644
>>>>>>>> --- a/meta/classes/toolchain-scripts.bbclass
>>>>>>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>>>>>>> @@ -118,11 +118,20 @@ EOF
>>>>>>>>      }
>>>>>>>>      
>>>>>>>>      toolchain_create_post_relocate_script() {
>>>>>>>> -	script=$1
>>>>>>>> -	rm -f $script
>>>>>>>> -	touch $script
>>>>>>>> +	relocate_script=$1
>>>>>>>> +	sdk_script=$2
>>>>>>>> +	rm -f $relocate_script
>>>>>>>> +	touch $relocate_script
>>>>>>>> +
>>>>>>>> +    cat >> $relocate_script <<EOF
>>>>>>>> +# Source the SDK env script in case it is needed for the
>>>>>>>> relocate
>>>>>>>> scripts.
>>>>>>>> +. $sdk_script
>>>>>>>
>>>>>>> I had originally done something similar to this when I
>>>>>>> added
>>>>>>> support
>>>>>>> for the post-relocate scripts with icecream. However, it is
>>>>>>> insufficent
>>>>>>> because there can be multiple SDK environment scripts that
>>>>>>> need
>>>>>>> to
>>>>>>> be
>>>>>>> sourced. In order to get a fully correct environment, I had
>>>>>>> to
>>>>>>> do:
>>>>>>>
>>>>>>>      # Setup environment
>>>>>>>      for env_setup_script in `ls $1/environment-setup-*`; do
>>>>>>>      	. $env_setup_script
>>>>>>>      done
>>>>>>>
>>>>>>> see meta/recipes-devtools/icecc-toolchain/icecc-
>>>>>>> toolchain/icecc-
>>>>>>> setup.sh
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> There's one overall "SDK environment" script (the one you
>>>>>> source
>>>>>> as
>>>>>> a
>>>>>> user to enter the SDK environment), and also customizable
>>>>>> ones
>>>>>> installed
>>>>>> by nativesdk-* packages (e.g. one that cmake uses). In this
>>>>>> patch, I
>>>>>> had
>>>>>> not intended that post-relocate scripts should be able to see
>>>>>> the
>>>>>> environment scripts for every project but instead just for
>>>>>> the
>>>>>> global
>>>>>> SDK enivorment (to get at variables like
>>>>>> OECORE_NATIVE_SYSROOT).
>>>>>
>>>>> (Almost) All of the code I can find that deals with the SDK
>>>>> environment
>>>>> supports multiple top level environment-setup-* files. If you
>>>>> happen to
>>>>> have more than one, the relocation script will relocate all of
>>>>> them
>>>>> (meta/files/toolchain-shar-relocate.sh), and the extraction
>>>>> script
>>>>> will
>>>>> give you instructions to source them all (meta/files/toolchain-
>>>>> shar-
>>>>> extract.sh).
>>>>>
>>>>> It's possible this is some left over anachronism and it has no
>>>>> actual
>>>>> use, but we should either fix it everywhere else or be
>>>>> consistent
>>>>> here.
>>>>>
>>>>
>>>> OK, that's good to know.
>>>>
>>>>>>
>>>>>> Let me know if I have missed something and not including the
>>>>>> other
>>>>>> environments could cause breakage.
>>>>>>
>>>>>> Here's what I mean from an example extracted SDK:
>>>>>>
>>>>>> martin@columbia:~$ ls /opt/xos/nanopi-neo-plus2/*environment*
>>>>>> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-
>>>>>> linux
>>>>>>
>>>>>> martin@columbia:~$ ls
>>>>>> /opt/xos/nanopi-neo-plus2/sysroots/x86_64-xevo-
>>>>>> linux/environment-
>>>>>> setup.d/
>>>>>> cmake.sh
>>>>>>
>>>>>> In the above example, we are currently sourcing only
>>>>>> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-
>>>>>> linux
>>>>>> and
>>>>>> not
>>>>>> cmake.sh.
>>>>>
>>>>> Sort of.... environment-setup-aarch64-poky-linux is going to
>>>>> implicitly
>>>>> source the cmake.sh script (see the for loop at the end of the
>>>>> script)
>>>>>
>>>>
>>>> Yes, I see that now. Given that the top-level environment-setup
>>>> script
>>>> implicitly sources the individual project sh scripts, isn't it
>>>> correct
>>>> to source only the top-level one? In that way, if the path to the
>>>> individual sh scripts changes, this code won't break, and it
>>>> leaves
>>>> the
>>>> top-level script to the single source of truth with regard to
>>>> environment setup scripts.
>>>
>>> Yes I agree. I think there was some miscommunication, I wasn't
>>> suggesting that we should be sourcing those manually. I just wanted
>>> to
>>> handle the top level environment-setup-* scripts in a consistent
>>> manner
>>> to the rest of the code (i.e. make sure we source all of them).
>>>
>>
>> OK, before I move to the next revision, let me make sure I
>> understand
>> you correctly:
>>
>> - There may be multiple top-level environment setup scripts.
>>
>> - The environment setup script that is always created
>> (environment-setup-aarch64-poky-linux in our example) sources all
>> the
>> project-specific files.
>>
>> - Thus, we should source all top-level environment scripts, but not
>> any
>> project-specific ones, as they will be pulled in implicitly.
>>
>> Is that correct?
> 
> That sounds correct
> 

OK, I'll send a v3 soon.

