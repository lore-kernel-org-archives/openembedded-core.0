Return-Path: <hannu.lounento@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0064.outbound.protection.outlook.com [104.47.2.64])
	by mail.openembedded.org (Postfix) with ESMTP id B1FBF7500C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7MP8CnOga4m99vMfWsVpC03eQP+Kf7rPussoezI7gHI=;
	b=n5JCxyoPBGHFNh1l6wwjunKf9poldE2lx441j8wNTzB5ImxThn1mdoNs8STuVtLDI8gToS56MQD8wCeLSfoPc0SVpf6tt0JRdBcY+L7y5J9i9feAby36Bv0tfinvtTTGGAaohu1YVBohp9X/6vwwMxHaJcywFhk5o1j34YzXJRE=
Received: from localhost.localdomain (193.143.230.131) by
	VI1PR0602MB3503.eurprd06.prod.outlook.com (2603:10a6:803:10::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.863.19;
	Mon, 18 Jun 2018 11:24:40 +0000
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20180525065024.105455-1-hannu.lounento@vaisala.com>
From: Hannu Lounento <hannu.lounento@vaisala.com>
Message-ID: <c616d6c1-0ad8-da7e-c904-347514430f45@vaisala.com>
Date: Mon, 18 Jun 2018 14:24:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180525065024.105455-1-hannu.lounento@vaisala.com>
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM0PR0102CA0014.eurprd01.prod.exchangelabs.com
	(2603:10a6:208:14::27) To VI1PR0602MB3503.eurprd06.prod.outlook.com
	(2603:10a6:803:10::30)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d266627a-277c-492e-487b-08d5d50e152c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0602MB3503; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3503;
	3:5wI1RHg8rBY5oKy7iF6BZXSKgmpOrAIeunsE750ZEwVD5ZuQmIq8IhFym3AwjCCCQYQUHCjWRkNRzvK76xZAs/KCzm3CgzCMBJNUcGw9iNXC1zTQRWF839j8xc16vu97ziqaImAJ+atVE8aush/eTnATZpz0UKtANMUyLau+lWX5/02OgeoEkQ+ILserbbgUA4+nLwrpeLhLWdfNdasncq6On8TM+J2pp8q+goswLS22s5ZknKuLngJRnshIiV+b;
	25:30IVL36RaRSNL9WFEDhiRi1YDlF5MUGGhOkE9XLW4gkbdUWYCOdEibJxEzsNcKOFZiDXnG97rz+o25rR1v8z3A8BCqHNcIfiG3h9Qa5UDM0oYed8nJwu24oKmMFVATHCBxoDmpYdBsvZNMxe3dGIb+SKEJpUXeTBBojJ2K4hJzoq9SNpDbG9to7XD+4dMtPWDE0XJDiH9LlHQlfxod2se61jYy75IPd1owO1soeZpJ0TVVz1GKbmDvUKiFuFeZozIrJ4ic8WH/tTnidR3Z3ZajYTgxJ1EzQRwKdM13w7BE/jZNUSMUvv9kr3m9GSL3KevlFv8oc2IN7jR/nj3hPKpA==;
	31:KFkowOcOtsEBjtBMAcRankLC9jABHM6e+gCFP9drb0T1NH1QoS+l+GFewhS5NYlGSS0Ap/m6DnRJ9LSDE0Q7YsaBd8zxOoNA4jipX1f4LlSWqyTqlCRKjH8ZZpeJH8d6idF+LzR34ussruIQZfhQ92FP+wIIM6cPvfjVyS81d+fpPQxtBIGxxpkivhuTudla+XALQxQL4dqwf9w/T3ZdYxAsCtcqTnnKQpnwvXgeqxY=
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3503:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=hannu.lounento@vaisala.com; 
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3503;
	20:jQfinMPd2xYS1rMXyrzIM80whH5hoERsNg5dBSHI+aekREH1sOMFhqHcUQmFI9Ms8wyXKZDB5Pz5oxIQnB9v/5k8UvrzIKMmbrissUttiMsRLqtlGnYVSpXUOdD2OYEylWeoExgx6wEHSBAgI2P/qXbXxf0W+tM9fpLMpLfM2hk=;
	4:qUDHj3x9In+F7hB875OrgF+6IlduniUPXW/eL01e91rLBLmG4wrinOViKnNaIKwr0ZL0nBXBQFYlnPaVu0pc7zjCCxqdtGOpxoqGASYd3m3XL6Iz6yn9qmYX+KM331L/bPzeGNh/F7xHVsNt3EqEcNH9IXnstUOcp2dXqsVa2DDNfjozzneuwdV4kp5dF+HNjMynpSeDH+Gx7hyFlQn9EiSV2BpieJWQUKGCksLLnUJTihEk6MZOejmDMroqZ4a93COqjAnK7cc9p8NAC1a6Ug==
X-Microsoft-Antispam-PRVS: <VI1PR0602MB350368B8AD186A67D11188B28E710@VI1PR0602MB3503.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR0602MB3503; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0602MB3503; 
X-Forefront-PRVS: 0707248B64
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6069001)(376002)(346002)(396003)(366004)(39380400002)(39850400004)(199004)(189003)(2486003)(52146003)(2906002)(6506007)(386003)(52116002)(31696002)(59450400001)(53936002)(23676004)(106356001)(86362001)(76176011)(6246003)(3846002)(31686004)(6116002)(67846002)(6916009)(58126008)(6512007)(66066001)(6666003)(68736007)(36756003)(316002)(65956001)(5660300001)(50466002)(65806001)(47776003)(105586002)(64126003)(97736004)(81156014)(81166006)(8676002)(230700001)(11346002)(305945005)(7736002)(8936002)(44832011)(486006)(6486002)(65826007)(478600001)(186003)(229853002)(26005)(16526019)(446003)(2616005)(25786009)(476003)(956004)(53546011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0602MB3503;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2MDJNQjM1MDM7MjM6MmRKcG1xbnF5b05leDRGWFlvTkhTczZX?=
	=?utf-8?B?bDZNckhtRTVUZVJpTDJPRlgzWlFyZ2YrWDB2eUI4d1kweWZUWXY1S3BWOVpW?=
	=?utf-8?B?NlRWeFJWM0NDMnpQTFRxaTFGYTU0T29pdEY0N3lwTEVuais5cEx5VlE5K0tR?=
	=?utf-8?B?bTYxMjZpNlNNZE05WFBiTGdsQkR1OWxvL3R1MGNYcnRVVnlsZmNCaVEwQU9G?=
	=?utf-8?B?VTdlNG5YQ0hQa1F3M0t0YlVmTFFMVWRSZGtteWtHazZtbkUvWVRHOG15Q2VN?=
	=?utf-8?B?NFJGa0NwdjJhSVBJV1E5ejBPREpEeXZDaGZYR3pMd0RqYUFZNmlickdSK2NL?=
	=?utf-8?B?bTNRcUw5b2Y1M3RHc3lhYnV0SGY3N2lrZW1sNnBuM20xVndReUo2Q1l2dFEz?=
	=?utf-8?B?VWJHUkY1ckplOGp1ZExYOWxIMnVYczR2REkrelowck1EVXUvV2xOZ3Q0VmxK?=
	=?utf-8?B?ZUJtejlmUTZ6VlZ2bUgyMFpWaW1jUDR1NU85eWRtbXRrUHZsTzdyeG9UdWUw?=
	=?utf-8?B?SVdqZmVRYTRmS1JFeUlXZkFXL2txcVlMK1NoSzBHMWt2bGlENXNzT05qbWV3?=
	=?utf-8?B?dGhtU2RKQnBMV0ljeTdCRWZSTGJHZXQ4bkhIY0kxN3hEd1hKdjdYaHVsT2U0?=
	=?utf-8?B?cVMxbzMrVXZlK3hqWDh0bUU0VXNXNTIxaGFILzViRzN6RTEvTXJobTZScmxZ?=
	=?utf-8?B?ZkozbFBnZW9LZUhlTUVMSktUdmh2Rm50TWxUcFFxM1ZwcUhSamRtM2ZMdDlY?=
	=?utf-8?B?cGdFb2gzOEV1clZxVGlwdzE5K0hCU09IQXJoa2NmbDlUdExSZXFVTlcwZEVQ?=
	=?utf-8?B?d2tnY3F2UDNyMkpSZzVSZmR4L1JIWGZFTzc4VUdvQStBUlBhR01PME8xeHVO?=
	=?utf-8?B?VllLeFhMeUcrY09UbzFwQms4bmtYRWNJblUyQy94T2FFblU2Vlh3M0dodkQz?=
	=?utf-8?B?eitzeDBabTl5S2ZZcXFDd0VJWmdZSmxMam1qWG5Sb0FvUHRuUFcxbHJQd0t6?=
	=?utf-8?B?SlNTWkhrem5RMjNxajRNbTBHWXUvTDByck8wTGQ0a1VaL0ZGMXp1SE80bjU2?=
	=?utf-8?B?RXFqT3RVaUlQeUtFakpXeDlxLzNkWW5vUzFDRjFkNU5TZmoyTXZJTXhxNWho?=
	=?utf-8?B?aWowdW1lOWRCNm00bFd2T3dTR3JzOVh6UzNWNTducHpxWHo4RjM5SzV1RTI5?=
	=?utf-8?B?aDdHUTBQWjlVRlNoSm11M2NlYXNwODBDTVFjZTRvMUc2bHdBcEZXUXM4ZTM4?=
	=?utf-8?B?YWZzZkM3bTRLOHVGRUJBaGFucE9XbEJ2NmwraE1uOE9VbUMwdWtyNnBEUlha?=
	=?utf-8?B?WHF6WnRDdDh3cGhaSnAzK3RtcTRzWFlBTmhmeUxKZlNGbk1MVlBLRlU2RklJ?=
	=?utf-8?B?ZVRjMHpSWUdMNXk2THI0eDV3MzRhUVJuSkIyNjUzMDdhc3lNN1VwV01hQTJ3?=
	=?utf-8?B?MFNtcWVieXBJOHhBODNpSXVTZ0N4STZwS0N6NXRvOVkxQjBBdTdGMGEzZDc2?=
	=?utf-8?B?TVhmSEcycmJBQlF3OVRyNFdjK0s0NTJWUDdKNW1Fbm04NGFrRG9leVZqVDJG?=
	=?utf-8?B?d3B2ZW1uRENIQlFwZUFVM2xRVjg4OGxKRHlrZERydjhKdmZyMzdVcXpRMnZR?=
	=?utf-8?B?Q3pnSjZRZ25PM0NoNXZieTA2dTdqT2M1Y3dXQ0tYSjFobEpoUHozSE5vSWo0?=
	=?utf-8?B?WDZYR3UwanhqVEtKNzNIYUlZU09Kemk5Tld4ZndMZG9XaFhXa3hxYXY1TUpi?=
	=?utf-8?B?V0FNQlhZOUVFZ3loYnhReExqSmpneHhIR2h3SEJINC9DSTBqYzNYY3ZzMWhr?=
	=?utf-8?B?ZmNURzBWRVREdVJGUW5VR0Zja3hJcWNwcEowZCtyc2VsTTc2bFk2cXlRT3VH?=
	=?utf-8?B?WmxZYnZPbmtORTRQdnkyUkE2NWwxYjVJZUdPT3ZuMHdTcHV2U09IODNZcjg5?=
	=?utf-8?B?eUpLWFZtQ1VTbFlRZStndko2d2xuU2d6NFU1cXp6MzU1SHZWZGhDbjVOcGFO?=
	=?utf-8?Q?7kGsI1K/?=
X-Microsoft-Antispam-Message-Info: A2DulegvquAJHUMzaaKcyPx47ISGVWAsU9qzWhD7JJnOkBhWFGnHrd0yrtcj31PLwquaj0MdqjxGzVl/vP2ngg5VgaDWqFL1Q6vUZdRR6DaLGN/XHMM1/pe8kt+abjSOU5sUk6MPZH3jmxI10jXdHsqjteW8LKW1ZSyhq/tWDA6/KVzQ5kyCNRjL91ygFdo3AHTNsAenk/7SBOuY+K+475nUwRyblq+A2NhTLtKGIz4+L71tc0wsFBsrQxm+q8LnuhMfGvbWrCSXKLGXFBJ+8dpd6te1bYFzdgTHgKJL4YRnvt1mW9WgzpCFrPuBbSOsSgRi38OfaxicQERZs14PUQ==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3503;
	6:mvFVw0WzV/nu1YM+ZO5jHlnHskDnw3KGElh3Tc2Fa8MmpNjfcwLYHUessxBGjubCLB831dQ5FYPC+ZP/7EzyS3YQl2GOdRvGm6KyIB4nQ6IkPlrPFoz5eSeHX+z4vcLNOUZrjsiiMz0rpdE2Iu21WGPBJoaeWr7h0L9z6yBoGR2IVYNa0FyTPgl69H+7vp1skjfCKJpH7jDPgr6q7pNI9VpI4xhEEAPjzXXOAsgoRd56dMSRMdr4BdXPJKEkZ8cNI7VOQflIS45cVZle9kiK8pGMoHqxmifd4eTWztKXi40T7laMR2n6VJWYeN2Xb941SsO+xm547zuncC+FEuIIouhni7EiduE+BhqLT+f+7nL8bi1ah5Nm5fkXSD+KwrxM6VkrMQ7aEtALle0fJvSOZjnETes3W7F7o9LIM9rGG92/YNvFOJ8HCNCN8WP0Xzxz7lepBcnS/IQrGVvzYXjpOg==;
	5:Cq9PGBUFquHixkWAr9qNtnDc9WB3LgCuATP96hz7zZSuVdJh92z3IxhI/JPBXKAryMqSSW1F2TXZwK8tZAOTmPUBdKkRQZDK7+p+eITGbbkzfund2seRgOUsyD8DS1WmHmTgOKvIF+yYMfgbLamikonB8EYhws3OKsjvRvxgJCs=;
	24:1pghlHOn8FtBUb1/8gmpWXIZKTwOLQUEHfW1XaHTXpMQ8LtZoYzj/AAFD99fov3K6MQ/ZYEyCsa440dLKFUyjoN492Qxso16nNijmptyji4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3503;
	7:2qSLTj2r/HkcGH7p6fvmcyj0A2QfOeI9wewfYJfv95I/q7fA9OrBZcFoAOnB3Yf15wDXzhJvMc0Hy7nxETebDvswPH4UTtrCCg2Th4jCLU3MKcFYR2Rya/PGzvJy36fln3GGodkd8iP3aQKQSoAO3g5w1d80VKHvCdcfHQjLG9nnegxMNkp7BjqcUtodnFSRoKKemiiQ8ucUgygYxOvlNNXwJdqvFQih39VeF8upLYxPBZjU/qTz0H1vfTeM8EGH
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2018 11:24:40.2394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d266627a-277c-492e-487b-08d5d50e152c
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3503
Subject: Re: [PATCH] systemd: remove the group 'lock'
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
X-List-Received-Date: Mon, 18 Jun 2018 11:57:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/05/18 09:50, Hannu Lounento wrote:
> The upstream commit 61f32bff6130a44d077886d38cff89ad161bf177 included in
> the release v229 removed the use of the group ['lock']:
[...]
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index b7c2113255..46bc30b478 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
[...]
> -GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
> +GROUPADD_PARAM_${PN} = "-r systemd-journal"
[...]

Ping.

As far as I see there is no need for the group anymore.

Thanks,
-- 
Hannu Lounento
hannu.lounento@vaisala.com

