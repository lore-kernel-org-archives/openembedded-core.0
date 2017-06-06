Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0055.outbound.protection.outlook.com [104.47.41.55])
	by mail.openembedded.org (Postfix) with ESMTP id 9848C71AD6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=i+CEnpmO8+WRRIlQ/DpYMpeG+xut5rq6VUo53v7WJ6g=;
	b=JrN9Rr8rPMhDdWmGwsYDbT7/Bv1MuxlHayRTUFHcLa4hbekqMx5u0Nu5jqJyeCsUlZCqYEnJfVDTIjMVKrEbY2aa0On+pzaOttG/oZyJcLrk5AXwlnU6YYoxQSRmNqilbeR+q5voGo/ebZzLYOvrxV+/ydYkACP8vfAkYN7cZTI=
Authentication-Results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1143.10; Tue, 6 Jun 2017 17:28:07 +0000
To: Jan Kiszka <jan.kiszka@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
Date: Tue, 6 Jun 2017 10:28:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: MWHPR11CA0017.namprd11.prod.outlook.com (10.172.48.155) To
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2938:
X-MS-Office365-Filtering-Correlation-Id: db80de4a-284b-497f-6ff3-08d4ad01658b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:DM5PR0101MB2938; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	3:COKPW/fcdQWn1Fkd7oqIN3rZ+ZgarLGNF3ZD9gbngY0Oyo6bJhn6xKZf4tsoIPYB6rdxLgs1dCrzPE/+jgR/gtA9MuYukAnPTPyozpragwRLjpUJyl6szZDYKvac1+gqtqiBRL6eaHcnnZJsrccU8XyBp8dyO3wY3kOjNbZzrd8fNCTgka2uORkIgz44YzkkAZVGg3ocQaf30V+PoVoKUwr27E6jptlBSDFqWb3olAoH4CdvFG98K/PqedGQWUKfhpDOGaYtxeHd1vfYXYmjHuLJlGlCq3LLgj7vQjBQYUYOPYf0G/6yn57fOtl5qS/k1cNPfYYT+tQH5XRjoFTnTQ==;
	25:ECU5Pnney/+vK+sXVyJlCyHQUftoR7LI3xuk+UI9tswMNcOUqwmqt4pxRA1rXxPet+MrSl5eBVyWgX7MVME3vaUMJouL5+Oc4lq7MA33hGJrIG7IYyFk0uQ3Z3PxVjq7usgNhan+8M8X2cbMczWXvMO7KwSEIHL8uL20JN1F2tKCY9QXqvZKgcmWdPBzdDXJ04qfSfEYvysGhQn1+cfQLwgrMYO+2/YW8PN5RfrhvAP9/KRPzG50vpxXs/CdHnbxd3OeXdh96Rsk0xuMo4OyUJRE24GgHnoPKx2SyOlJna4l4s+JmwigYIbVp74jZqS6DVUvykxXUTHZgE11g0EwDJpeun4XSX0ueoI0cF47J2+JfuK9soAiursc8s4Qz9pN+RxZHCRKZjbd3NQO00KBhTChdLiBeqjW9IlZU8+r1hyjma1Kq96q5ouNqpdPAX2fM5Bak3mpqjiVY1iOTijtVNnTPZuoU0iUHfdLHM937/U=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	31:t1Gjl5IugKifxDmWeCs15LBaZqKHuS7EYMebUWBUKOR3jI3IdC9fjacL/YhUyErrpjfOkgY9ij+S9pj6sQjw/hxEVZuvtUfGmDlI9W9yWWXFR8iPlz3aBN9Kv8xU94liDY+oLWPidL3tL2wbDT5NJmn6eA6gz7ukZBQeTJ3m/XvoNYCyYVmjnfVH6j9siFKbvNUIuln0LfBF/GnB2azVg0qk95YFtFR7QJzdXybJ/puJ53UAs04N85w8s5711UaYL4EJ4IlQaO+cj3NxJJDKBg==;
	20:6DgUuYIGhOIHTVxIS82AaM7C3Acb4ahR0MQQTgZdNR+d5FtNptCdK+r9PFt92P91+0EmsP8cFkU3kYxEdHbL7jroqw3mY0J9ev3hF/QuFfY/xLgu5ieKaiPjW3A3rSOfoGn0wmHxfXiYzE5tt8TAAGTAClRj19OVkAypGCeaW38lN4A5N3dPZTPMBkafpmFjIAMu0IqrMcXyhxdct+EBUFEFQE6Of11G/h1czOP7MekFU7DrySJ//DHNpWhg3gYiE1gYZ/LXr/C5AncxRuWSUZIeEnRll/YqNVo7VeROCIn6odJaM5OROzlIFR3atsR25+WQjIxJFacwavcKOCuz4A==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB29385F9A78EBBCB474732BFEABCB0@DM5PR0101MB2938.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(126837547833334);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(3002001)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2938; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2938; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2938;
	4:bwzPZvuNabBHwim5qi/3lsZjhhIHYmJEfXgn?=
	=?Windows-1252?Q?vTDh9i0ukWPCsLdPKWVYOM2bhc7BPJB3Y4Z/sZhNqwYgaruGXPWvxRzn?=
	=?Windows-1252?Q?kuFNCT90//vtRdkJPwExzDE9Z7bYzKc1GMtCRewrp8k4iHLLeWm2fkus?=
	=?Windows-1252?Q?fzpkwXASfTdWAEzBbThz+7jg40au1PephpRi11EnnNJg+LofiYErZoR5?=
	=?Windows-1252?Q?3oFJi0vSeyFmHE1MwqvJEIKFO+QRp4L1BG2d7U30oSfJXsBdz+5hneML?=
	=?Windows-1252?Q?6zMqTd4EP2nMwzNboGT3h+5e5QCihpuvUO0421DcosF4IJB/lfDvaszO?=
	=?Windows-1252?Q?QiMpsWHS8V/Etm696tTW64tQ/0a9vDlcoUQ/3OFU32IRuoSwLVaEo8uc?=
	=?Windows-1252?Q?GMI3CwuBx5RQKzXjV5z5/3IGgsb5us1TmFBfx/nBNbkCnOMcnOPv+LJc?=
	=?Windows-1252?Q?TLESAgxuPvzfURVm4TgBxhLOuZwSfeGn8s0sQOVGKNoIq94MxBF1zMzf?=
	=?Windows-1252?Q?Au7DQxST/8Nxi2MgKHk/nlZik7Z4NTeAasJ8Zm3cvlVfAHg3TiMdRrfw?=
	=?Windows-1252?Q?CgBuRmhOh8a3m+Lfj9aOYaeoaO37G97nLsyKsN19TBT1YIqpwoAd7GMV?=
	=?Windows-1252?Q?SU92fzu9LtGpaAIKfWI93EQPLrpPTBpMcfs7Y+7l2xzsaf1AluJ7b5fD?=
	=?Windows-1252?Q?L/bfXvC5G3XIrMiigIxtEKQz8fJ7WvbvVwmyXl1fQNBCvBcJPg0NGrkC?=
	=?Windows-1252?Q?Qsnx46kRnJ3nr5Tkg4IbTBHY/CrEk3R05Uyj/KLWqmY3wtb2TlhE9gZW?=
	=?Windows-1252?Q?SCld6B3Lt/VQbOlPAIzDxOhF5fRdjjdXSuTpxLBFkkZh63Ll6FlAw/ZP?=
	=?Windows-1252?Q?Ba6RstnpmT26mqEaqsloGOATsEajtr6Hn1Ppuhup6H4dRGKCUh/ZEAYJ?=
	=?Windows-1252?Q?0Ms/56kZfeCUoTb5uZC1Hgtc0bw0ou+QXePw1XmsQTpJ/1OySmCF5raQ?=
	=?Windows-1252?Q?TUaxCvcGR3HOiIC5l8UFeE6hw7JXF1ArS1ALSgCQGf5/rj4J15fz25qX?=
	=?Windows-1252?Q?TWGkVI3ypYR1A7+qWwlgNE9/ZTeV3ww65ueXQ+Vf1Ar1SHYhkQydbK05?=
	=?Windows-1252?Q?ri4zSbZro9oDp/bt3hCBGLcRzrR0Uh8VyYal2HXM7SfAgjQlS0bjrcSJ?=
	=?Windows-1252?Q?D+bQhBVJ/rhSGCftU9FtaNm2k353eqWw0Zm4gZsTZqgBfrzJZfxUlond?=
	=?Windows-1252?Q?76qdRt0kzl8jxCgkIgITyyTbapbiGPq6e383Dcw=3D?=
X-Forefront-PRVS: 033054F29A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39410400002)(39400400002)(39450400003)(39830400002)(24454002)(377454003)(377424004)(33646002)(65826007)(4001350100001)(93886004)(6306002)(53546009)(50986999)(53936002)(77096006)(8676002)(25786009)(189998001)(54356999)(76176999)(90366009)(36756003)(23746002)(81166006)(6486002)(83506001)(4326008)(117156002)(47776003)(305945005)(6246003)(7736002)(478600001)(3846002)(64126003)(2950100002)(6116002)(230700001)(2906002)(110136004)(31696002)(38730400002)(6666003)(86362001)(66066001)(966005)(31686004)(229853002)(42186005)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2938; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2938;
	23:jObxCEspm6S3Ql4TVdsEDzUW1x8aE+w5Ebj?=
	=?Windows-1252?Q?ab3bPob+PQ4RhuCrLfxBj6zGUzspMAARqBF2nBpprNwXtC3mnWkX264s?=
	=?Windows-1252?Q?5sC6jKAHumiK8GU56VWaXnht8OItV5xC1Ptwxp92vUFbHXQpT1ALWLqZ?=
	=?Windows-1252?Q?ANLiuOT8ZdJJ9VhfKQkhtU2h3tx2MxNMJWkvm0YZdYqQxbohocQYiMX0?=
	=?Windows-1252?Q?R3nl36HvBtRSHu7vU6WQBD0kqmOVL+VZM9Ns2zrl/wJ93o4YRewM78Dw?=
	=?Windows-1252?Q?oYy7zNEXbRfCNr3QiMRj4kbRsws7q3d7zmf4/jCFXlS4m3MGRQufMaBd?=
	=?Windows-1252?Q?OPywuQr+WNqlf4Vgtt11Ae8ba58mmOVAG7AkiVpVDLOL2oQ4ga4Lqzd2?=
	=?Windows-1252?Q?SvHWU/YH4endQI6Q9L5IuUnXNFvDAzZojz8OhWVDXV04cbEh+geW0Cn7?=
	=?Windows-1252?Q?RprQ8DZ1+sffcEVoc3yIUdyIpXPVVuCw2nDivABQujr74kBuPgSz+xJ0?=
	=?Windows-1252?Q?149RCqCrtF7NT7q9s574MJEtEQTycHracc7OwPPGWob0vQIC2QGbZAtt?=
	=?Windows-1252?Q?QkOXwU8iOSHGAv0Oq/LXI1IVTiIphG/4Vs/zxNJPkmbs2m65/UckqL/c?=
	=?Windows-1252?Q?98Ftk4fxPFetUwx44hKVEqL3/oMEbxYbvMGdF2TCcVOOr+9Pjb3hr1tg?=
	=?Windows-1252?Q?H/Tx/2wTqVQzKnKJr3LGwU31Y6zOlt2wKbiIr3G9yhB4zCxsDiR53Hw0?=
	=?Windows-1252?Q?RR7xgF4E8NrpMIiTeTOatslUS/HLUygKQRC5QwfPW+o3yDaZB5nIEige?=
	=?Windows-1252?Q?iV99Tebv3jPUUtn/OVkAVgNcZYLVPsufOvQOjXJMSGc623uBkzkx47Ab?=
	=?Windows-1252?Q?oeoy1kBUtBZc7DkFQtZBDD4POMSiDvIHa84TL9D2Pj0mdDptLwgR0UgY?=
	=?Windows-1252?Q?zbn3oT+PkFoqMX7eHgtHRnMkt0AWFMt66pK+0lfofgW8BGpSVWpl77Vw?=
	=?Windows-1252?Q?VmUjenAF+S6+IxGse541Zyru+RLkWLOHCa/RWa+AtDBEHMIZzFzp2tmf?=
	=?Windows-1252?Q?JwS1bQ60d2YXVOeY7syifIolEb0AwfLGwsEspsEMTNeuUQjl9hSaZuDN?=
	=?Windows-1252?Q?QATG+vYZkXO0xAnwp0Cm+I2LITMv9Mh43IzM9k5X3gqr2utjelqG8Ta4?=
	=?Windows-1252?Q?wfWfGmYnbW6Bm7bqL5ujTxGstCLGiU5gURzkQRhJaQ3RJO4T6ZZSDYMH?=
	=?Windows-1252?Q?1ocscgGymSaERflZORF0uzI3YqsFQkbZM8+/ZeMtnLHxTK5ySklgY84R?=
	=?Windows-1252?Q?VMFokqUmWPnFwL6PLNDESpXqQNhK7s8D/yW63WYHf6PU2dEyVGKx/Vsp?=
	=?Windows-1252?Q?IBiqfEqTgEvD5OEQH6yEQZpSVdoyyObbc/+DmDHvgp5JIpVZ5ShRh6ks?=
	=?Windows-1252?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	6:uOlRMAJmCcpdKDpGrpsfivPXHODBsBLrkUzUtNc7kgJl18ChIVoajVGXOECed0RyZZw2L5jC6/wFfuG/PiLtFk68lgpNR3+eTG/CQlUKANlebe1laWWveqVhhGbq6oTAEHl5ioyNZ7A3AotbxRKk8n5B8wCT4rkk8tMlkAD0D5z//6jcG1uui2gQtzatNCeO8hHlrqAELPoAGyFyyjJ9KyEJ1ZhgNbizpFj3fXiLWmEkx92H23xBn+E/Bx5GhcIMRk9nMvJIy7M13lE2NkZKb7uTMiDouLvbGEXSDBiHZIwlIUbuRMdTe3ztyR/epIj8gGeQdvpMCciQzm5ByX5EMx5kR3EEYsoSezqjqbqgHUowGP/ilpzMaHU0z3kCpou6KcvwS0AcuEslBxzQKlmS1NAwek77iP4XuYC4JIa1o4UOYIv7lus6oPX29BZIvprzrr+DiU5z+7Bzjvd9urSsI5qD/PywvFNxc5wxRrU/47coT8Ir6QDyYvkLD6ccg+2hooxLuUaixVkR7GuLJu5onw==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	5:wB41vkkeLspcXF6gUkbb7rOZ7rNE65viFlmcwtLrWKiZVUMO0mUDKN2E8+vzlWwLLrYtaMGzF5iRWJUi4pYQTpxTqcP9YzZhYcW8hSi04O18lfnzoSxs68S/2AABeD0xSKcrz9YItM7eg9P/39KKd0dUmaRxjOINaw9CmF4WMRzRt769sw92RcyKKHJY41rK0Yz0Z5Kfv91dMgcz1q475dKLpt8uT9IFYaHPxfe16IisBF4xE1EGpFkBkmGLlfCKitmJD7SpSdtawH211VeO1mb32rIM7bGYIo1jT++eektKKAqaV8B4WfkYBpoqraN0AJWN4IHyq40hG3Y/wqaJgI2InKZ4p/TKw39HB3X+ROnMqZtQLaWElgKPhiWNorvMGZfZS4hKAcWJvlQhbiPxlDXLLEk3bR4FTd2AS0rxIVtKFj343Niqw29TmNP+O2LRQ3bYgzuBkUkOOSgXAUPSNHn1oo6HkA5NjXDdtb4j2vB8YUB35GlSqoYL4sRmcOIM;
	24:YKqOzImY1ovQKdTdAGoz2n4H+jdY6naK2+nLWJjuLdRqp3sVY7cFeUTLRT1+OQniPXmMmYvgHFnYyE4a2VKJ51DQddHhNMhyn8qeYnE0yoU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	7:uBIyG0xIaWsv34hwUoO0pCFF/LWEPHtwzlYIMPCcdHIL6wVS+IZ6bAWmPFkFrmjAaJvl7GiLRJrJG75fo2Y2/XHD/bM0bQ9x9sdgqUFiDmwRxmhSsb8OfM+t+Hp23HmojziGXA2uj0mfocLRdHUL8jpEYvt6UqG9vV2+sV3WFlL+6jdGRyJ94eRzm6v41IzL5XKYBevBRahtt5htYcYx2lZzFL4/WO8z2o9NHsrgsebRgbz7vUIxmENh3pssFDX5F09gq04VyBJUnMjaLUWF+e/3AB+wBNTu0tkXkGJDaL4DOOwGAsbhY55vzdNFCmq2BsylGuSTYW38sjfeS1BY2A==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2017 17:28:07.3010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2938
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Tue, 06 Jun 2017 17:28:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2017 03:11 AM, Jan Kiszka wrote:
> On 2017-06-01 02:17, Martin Kelly wrote:
>> On 05/02/2017 01:41 AM, Martin Kelly wrote:
>>> On 04/30/2017 08:28 AM, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> The upstream init script uses SIGUSR2 to terminate that daemon because
>>>> SIGTERM is ignored. As the killproc function does not support specifying
>>>> a signal, switch to start-stop-daemon. Drop the retry loop because
>>>> SIGUSR2 is lethal for agent.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Thanks! I noticed this bug and was planning to look into it, but it
>>> looks like you found the issue first! This was bringing shutdowns to a
>>> crawl for me.
>>
>> I just noticed, I think we need to fix the same bug in the systemd
>> service script too.
>
> Does this block this patch, or should this be done in a separate one? I
> noticed that it's still not merged.
>

I sent a separate patch for fixing the systemd issue, so I think we can 
merge the two patches separately (they're both needed):

https://patchwork.openembedded.org/patch/140355/

Neither of our patches have been merged yet.

