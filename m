Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 7291 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Nov 2017 20:13:48 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0050.outbound.protection.outlook.com [104.47.32.50])
	by mail.openembedded.org (Postfix) with ESMTP id F16C6783BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 20:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=oJ36LGpJtkrYnn1AX8FBkPjxaZcieWX+2tJgPWDMjC0=;
	b=DZGxNiHIMVX/bs8VbkZUc7F179X9oA9qXTnrk9kOczpULOsfijbL2KslFFtGo1gJfeRjtISkd83lFfjyDJYlo9mwTlKzOLmh+V7arG+yXIl/TkTz2diwJHQNwRVmCAJ08mlGM3I4N5McyYClnSsfIkthic55qdxfZJNnfw8o+/w=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.172.156) by
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Wed, 8 Nov 2017 17:40:27 +0000
To: Martin Kelly <mkelly@xevo.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20171016163143.22844-1-mkelly@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2eb1113b-b6c7-d4a4-5908-bf9ea2684513@xevo.com>
Date: Wed, 8 Nov 2017 09:40:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171016163143.22844-1-mkelly@xevo.com>
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR08CA0082.namprd08.prod.outlook.com (10.171.251.175) To
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8b34cf2-d7c4-4071-22a2-08d526cfcce1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	3:5PAx3nd/dqMAiGez89s72VwomoSh7YdIitiWdcTRDUPRb0ZcoBgUYW/dyJBv8Q4UhJcIsAgVybsSXma8xYNQbF198bWmRCeNmCALMgAZ/uUlj9MCrVvpznyvNbVLnoUmOs2cgPGmEy34+tG2yGAh+N951Xz3aqr1JunuuJsqvJogPYRUdjP5zvvBxjGHtoU8jg2mZtavrasQroe5zY/xac/B8gsimzMR8qTsF65xkfe0bw9QsiZYRQoDScEpgIIH;
	25:XwDrkEfd6UFHuSu3hqhrWjA5CzN45Rik7gwsDQy3gGorC5d46YmaHwCnnDPQhaB4pSmq10QmmlI77y4M2sSGWCfGAha2/vZW0cykhTmRDpTel9ysfRcHOCNxOA6O8zKkUTDMIeuNGSs+JhT2qizGVttnvd1HC1EpDBSuDqkAzdgr+Ci/JvjncVaWeULdAL10vPgGQVAxJoHypt8/8uGDufEhspFEZl/hIxqdU5jl1QqwREZ3fv7cldr1jARaOGCAdV6cjTedLyABGsWxo973uvTEi0DRT+ezxmlHQkpM2aVUCZUcuouJJUu520Pm3e45yT+sLNaAE7C8I4GfDUsn9Q==;
	31:y1tkuBIiF1xoVzINsiECh8A7WadRpzxUKV7v6LeXBFsrNUmfV5XTl4AG93J5VO1FVzV2X2t5hFY8bZuN+3DyomapPHNGzkcbzTzgh6Q5HL7CAhW/+epj/hKighgfENAIiezS0FY3fUJCipOuTvE27oOh5wL8cIVtmpnyGJ3LFanjAOlEH8FkH7E3gt8A8MwXpTNVivvHaQkhHK+sv0A2YUmSXg/qtw7MImJWXmfaxvA=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	20:KlqRF0dzZrztyJeD04kfBZL1+7xT0X9gtB4aRElRxIM7OpuILjoRH63t73FnYSoDwcsJOKJjABT6rb6GIWUCEFnlvygKw4Z3n1CR7n1zYEIW2Sv/pQMUiCExYxApiDmoRb8ANea3dU1b9gvOlvpWQVYOwZlnwyaAv5MOvMeONXKcbdCbn5HQzop6T4vJIUqtZUs0KX19OhIyyG8ik/5gheHSBw8aYa49HQiJ+BDpaB1bhibLh5t4679uSZ4Dxl/QImn8V6vne+moirwt8rS1L84uMG46uuTO1Wh1Np6bf0Cmmm0eD+PZxPOszCG/BG3mo17brLTMLDQU9F5fEKmkuhCTnx1e9bf8n8EY6uiegr6ShW7H7Um7riwm0Pr7i1T8hf5VIs7G7DSnrH9kR5i8xJ0plGaWgloHrWCuDjmRMQ0=;
	4:dRww5rE0HVxUBV2RvN5W4fsO6S2E8XklShGCk8mBQa+cy6BqSr4O1xlQXYYQ7StPYEs1QvTSjxmg1cBwG6WxDHMdfYRuapCmeLYV/3V87lPwM/REs+KHKbGXjIdf+PgNSm8JoukFCAKqFBr/9ODpPgGGD5VFwLVdK1/oVtZzR0vKybAnqDoZ0O60zUg/NjYFYqRNSqFThPyxgxUOPnGiyvYfYeuI9klAAJe225V0yO0itjWbKmm0Yhas1bPcsih+tO8je/fY2+/wsk4eFvUHgg==
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29447DA11916635FBC5A2A9DAB560@MWHPR0101MB2944.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231021)(100000703101)(100105400095)(6041248)(20161123560025)(20161123555025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2944; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2944; 
X-Forefront-PRVS: 0485417665
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(346002)(376002)(39830400002)(189002)(199003)(24454002)(90366009)(77096006)(53546010)(6486002)(97736004)(65956001)(16526018)(66066001)(67846002)(229853002)(47776003)(230700001)(65806001)(23676003)(106356001)(2906002)(6116002)(33646002)(110136005)(16576012)(58126008)(83506002)(31686004)(316002)(105586002)(50986999)(478600001)(76176999)(50466002)(81166006)(81156014)(54356999)(8936002)(101416001)(6666003)(25786009)(36756003)(68736007)(3846002)(305945005)(5660300001)(8676002)(6246003)(7736002)(189998001)(64126003)(31696002)(117156002)(65826007)(2950100002)(53936002)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2944; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7MjM6Qlp2QVJrZkFBV1ZQK2Vra2xnS2d1ZkRL?=
	=?utf-8?B?OGUwY0lPcG9BR0lwWllsNzA5d0JHVVdsNkxhSmFjZzNtSGxNc29Hb2phYzJk?=
	=?utf-8?B?THhpVitLKzJZTHpEazB6WjNZVjdKR2RPdVI2Q1VXS2Vxa00rS2YrVUJqTTRE?=
	=?utf-8?B?YXpnbnp1VG1INXhNdGxmUFdWUmEyUkZpNmJINUJGRDdpT0RpRjRmRlhOa1JZ?=
	=?utf-8?B?Z21mZy9SMXZUbldEZ2taYjduNkk4NUVnL3FydjlUVFd0WUNFR29rQWM2eTNH?=
	=?utf-8?B?NC82R0VscDduQm93SVNzZjJNeFk5bnpTemxYUmhnT0J2Q3J0bTUzbGgzNUcy?=
	=?utf-8?B?cC9oTytlODNWaC9OUkhHVSsvSnA4aUFZUmdXMTQ3OEg5NmlXYU5IUnNUckNv?=
	=?utf-8?B?U3NER2FDc1RraWdxK3lCOXB6cXgxN3ovTEtMWEtHVHg1WmU1SHlmY0JPb1dG?=
	=?utf-8?B?UEV6VlVBdWx2Zm11b3p0ZWxiK0ZYUUlha0d3SE14M3g5MEwzVlI3UWJKWVNR?=
	=?utf-8?B?a01Id3NEWERzNmhqZHlKSkQ1MTBRanB3S1JjK1hQa1A4UENaNENFZzlJdGI4?=
	=?utf-8?B?L045d0NkM1R6bXY0U2E2N0gyT3JVQ01XdzV3T2Q4TWRHT0lUM3FBckc1bHFv?=
	=?utf-8?B?b1ViRk1zQXFqZ2VtbUtVTkd0bHBIQmJnMXN4TEh0RFBHWHJWZzIwTWNpMGcv?=
	=?utf-8?B?TFlxeWs2aEdLd1RBSU1rL2FUbFNid2lOSWlLMk5FYi9nVTRYV1p1Q1pwTDVT?=
	=?utf-8?B?NXdpeU41YWtxVWFqU1Q3YjN6VDY5THNoUUp4ZTFRRjhsMkhGMi9nU0JrR0VM?=
	=?utf-8?B?Sm9pSTMxQkx2dDU0OU50RW5OOXVlS2pCZlI3eDZqR1I4VGZvMUFoZ0RzRXor?=
	=?utf-8?B?T3JHUVMrc3RzaVVuWTROSFdscGFJSGFmbVBCcDVEK1Z3eDhWNkVNUEJoQTBl?=
	=?utf-8?B?Sm1NcDBDeWpsUXd4YTBWR2U0NjZLNy9aRkhsNXYxbGZLQ2ljZEQ3Y2c4dm9o?=
	=?utf-8?B?ZXZKQkIvRE1hcTFnWTVCUjlmaHNldTZiMnZYeW1uaW5EeEJncHpJTldadGoz?=
	=?utf-8?B?TVRuL000bWRzOXlzdXJOZm1LZUdabUtVSnZtS2hTeXF6b3QyblA2eVREaVNn?=
	=?utf-8?B?QWRNeFpoQURtYngydTdiREdxeEtCcDRoWHZENVJvQWFVWFVWZ2NGbVlOb3Zu?=
	=?utf-8?B?NWp5TlhCTFQxV0l2a1dUdGorRXhnN3FKQWJuOWQxdFBXYzQ2OWZqdDQ5Vm4y?=
	=?utf-8?B?Zk1MMlZCVktydE1RS0RUMHR6YkgrbnhhMS9qMER1c2I1ZW9KOGd3M3FVQ1hO?=
	=?utf-8?B?SGZzSVBnVC9CUmgxK3FwOGp5UEZQVm50NDhpMFdRbTBUZXVVOE13WVV1cTB4?=
	=?utf-8?B?dXNnWFpDelpiMmVsU1lQN1h4MGFPcUE5TFN1SjNRVHNZekg2WGhEcll5ZnpZ?=
	=?utf-8?B?Z0pEYUNQYWxwZno4aU5YNWFOQ1MzUnZ0a29heHRjalhnSUIzMEF5ajN3NlpF?=
	=?utf-8?B?MlZLWE5BdnlWVHFRRzZSN1pKRVdabkdhS0dVSnVNQy9VZEZOZmpma28vQmtZ?=
	=?utf-8?B?Q3Z5SnVXYTNoclBYU2MxUFFhdm42RVRuNlhGQ1FqYjh4djNSNFlvblIrTSs4?=
	=?utf-8?B?Z2Q2U2drdjlGK2xXYlNRa2RRZ2wxWmhHMmRhSGtmSnplay9OcUR3UGxTWURW?=
	=?utf-8?B?ellhMitUcWVSUExlMlBJZjhRSTVpZEtEYklBSG5BY2hOcjhtK2NXMXBiWFQv?=
	=?utf-8?B?UisrRVVsR1RFUXYzWlFzQTlDK29LVXJlbktXUFhDY3Q3MkZTdExsbG9oY0RN?=
	=?utf-8?B?RHFTenAxUlpFS3hCdHBPRCtPOEczbFJJNHZFZVdBeDdEWDJXWFFDaTI5Z1dv?=
	=?utf-8?Q?Aedsazb0JWtg0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	6:M/Sw1/l9eWoKIvf/OvYdgky36MPN/Yne61UYsRKROle3xjD01E67NxKKm3ZwWjAARdB213CnjEAgb8qZRKiQeQmYLI+E4YdcctHsTnWhEW+htkX/JYjanAfvTh5n5v3FhsSpQ6wpaJSyTMoxsvjs0Z5bMh0J8+cF1/29sHCihri0q4LYtwnUg1nPlqO2VlpBQOBYizfhkJp8Tp1dHS29r3QWtFrAthaUBy1es4Nz6pp5Y4tOdjdXgZaQ08CWxNh4KpjAL5vGfKMafhPN+oKeQkhPCIULAX3m4OJiFeBcJ7Sp4d3kBhw5Z7XJQkxSgkWKNAq5i/sz6gM3FReYYYrsuCu/i1hG0ZoQ5qaqhDG/Q5Q=;
	5:R5bYBLN5JRxDcoySmKA7E1o6DTY6MRSiHmhP8vjqIr7H5OE4XQSYXOWCpXpG4fAcUtTJ3pu2FWUtyJKzQBGkR0rf9yEih83/zl2VLrR1JxI10Gt9FK4FW1ftWDF0po233YlWDmZ7cQFOWebuMhzIAnL1ycAniLkgg/DdtoibS1U=;
	24:2VSB59uauZaq/K/7ktdbJtjlIS7c2JwhXmTB+5FHBPAzGN14H8HWuNoaivW9kENfvLaW4HXN2B1DhtWaoNMDJPJrcGWgZdjsvIzz1PfJWzo=;
	7:QT5PUNdZN4QiFiPlzbkudHZtMso1GdD55L2yfNIpujtmhGHsn75KmIld60FwRNbHGFnSSXQ6W2k6djTL9K7bKv8aLPsRKBDmP+fyuFGvZccqlvzObCg4s3bGEGCO3TG0MSzHqABqKv1J1/xxo2D6UWh67lQF1QYtG5j5HFV5AO++39h0wAr4P4SThzeg/SFQvZjtzzVNg2Sa68sNOqfktISMqZFi+PxVTtOQfSVmGb3YdbBMGAkCdO0EowWWm60q
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2017 17:40:27.7372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b34cf2-d7c4-4071-22a2-08d526cfcce1
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
Subject: Re: [PATCH 1/2] systemctl-native: add target.wants to target regex
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
X-List-Received-Date: Wed, 08 Nov 2017 20:13:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

(ping) for this patch series.

On 10/16/2017 09:31 AM, Martin Kelly wrote:
> The regex for acceptable systemd WantedBy/RequiredBy targets does not include
> target.wants, so a line like this:
> 
> WantedBy=multi-user.target.wants
> 
> gets silently ignored, even though it works fine on a real system.
> 
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>   meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index efad14ce17..6e5a1b7181 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -108,7 +108,7 @@ for service in $services; do
>   
>   	# If any new unit types are added to systemd they should be added
>   	# to this regular expression.
> -	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)\s*$'
> +	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|target\.wants\|path\|timer\|snapshot\)\s*$'
>   	if [ "$action" = "preset" ]; then
>   		action=`egrep -sh  $service $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
>   		if [ -z "$action" ]; then
> 

