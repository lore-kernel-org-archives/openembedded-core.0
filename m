Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 15686 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Feb 2018 23:39:18 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0077.outbound.protection.outlook.com [104.47.32.77])
	by mail.openembedded.org (Postfix) with ESMTP id 9705B7838B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 23:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wwxPtN5i1Qtzz/rwQvImZs9vkaZjh40ey6/ZlGgTjnM=;
	b=mlHvoxYlcPrcZ7syAXaqgMlYRjocHiaujtphZlmuQQtwHbGjp+s8UNm6mbHCUVXERbV3lfpKLf/pDSHtLAWYxMEosGxOu1lIKY/6+C+jcd+bopKdLW0Y56X4f+B7He7UjzI0StutLzRms2/dYjE6vvVZ5mzlCNgx3U7rlvD2o68=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Tue, 6 Feb 2018 23:39:12 +0000
From: Martin Kelly <mkelly@xevo.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Jussi Pakkanen <jpakkane@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
	<aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
	<0f020bf5-d0e7-82ae-c2b3-e7ea5006313d@linux.intel.com>
	<a6f2ab9f-e466-6107-a8a5-12d0706277ce@xevo.com>
Message-ID: <36bec7a1-e968-ca73-0dcb-444ebc6da496@xevo.com>
Date: Tue, 6 Feb 2018 15:39:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <a6f2ab9f-e466-6107-a8a5-12d0706277ce@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR1601CA0013.namprd16.prod.outlook.com (10.172.93.23) To
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b828489-8f8a-4d8b-cd84-08d56dbad3a0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	3:+TzwnpfZCERgCMZQxZp2Sbd6ahTHlz9sOXc1/FKiRkW9RSDDxwSBByq3p5TpqJCYtONC0QwOgJQYYgdlpRvthbKT2VZjF51jkYvhZxNBnJpIDpYr+tZkVAbw4ExPRaxys2Nvxr2gHfC0obcpG09k+nAqXycFHfTbphn3HoGo8nyi2aLNrt3uedN+mLoo/iaCCNH41CEr0nIGTSs2EwmtUu31PIaW43R5cvuFnVjNgyY1nxFPU/+PG1kVdE1teNx8;
	25:gZwBo0D9/XgXi4brUX++lp0hR2+zajv+xqCeMignOmlUmV1s8KJIEAJ8hUeEt3Fq/7v0CIqcpYf9uRHrd4cTBUwE9wi1V/630x0VVBPlBeLXiER9ZoxWUJVjGUEjLlb2V12BJQzlai/o9zb58CNubjxShG7eLUXYKbgDSzGKzBSIq83stc6vsxpbLRp6vZAsKFvA1xUWYfneNFGaP6KoMRxEyoW29di+ZL3S0UrLy7zLi7P6OXXeHOylPbjR/vhpd9nRWZX4FTDx58A3CVzO/4PUJB/1s75AfEwLzZA93P5JLz9aRpDfie9kji8CxT1I+kcuLMpT5YDI+zmpwzSWbg==;
	31:qhEVuRr9XKnm5tXErFxuJpfJD/gXvVW2faMP4R6DNVapyHeANpMkkoDAm/VY8tkbW7iyMTuS7GixQzqLQM3cPmuFG7kcinfKRjoDKpMr2OrrGrGmigbF2RSyeP/zAMVfg/KC+LjpXetFU/XM/FKTxCRxYWxRur2BOxFS2xri2PM1vWKsqakx51lZkYk2Cmohy79aoo61pM57JcGrm1/CM7VCS/N/bpxJrFeTticDmvs=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2943:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	20:fH1UvrdtS/aXe7aUBKh6UxDsXmH3op06ib/Xf9+lRX+xHmiP5JvRGNo5q9G82pfDqk6axjOlrp7NFVDoSrBdoShr0nT7rkEsnJyS++vuX39REL0AkxR75xiYDe9yu9eMDjWlkjInixp2oNUC/nsN03gJb5+M1ahXXMjkbcRLuHP3uoqHHwIg8BbDLZ7kgGQHiLTbPAn672FyOwE5ZHxYz46g5Q/pgb5WIrPoJIRO+1aYP6ALzkF2kgCnKwfTQc2GCx546A6StjgVsMAesHZPNwW4QT4zBZoWaPMQcfPHkfg22C9MfrZ7RDjoRBYmEecyDoIXDI/eK8+YqhFUQBtFwOUviGlpTijIJOzF4zhSs9aTZLuVWtvGRq0OlWtyAHTBli7ixeom7IS+JOTcXH2v9EXEN21eurMY0GJFlpdocS4=;
	4:ZG2Ux6h+IV7AcM5WPCQ3TcUw6Eo73bNxRswCKwBERQ43eRp9IFa+AVHQ6h0eGttP9u0HCKYIi1dzlG9IxXIQviFPJ49Gs0IksTRTveM87ExAZP+auUjuBv2LMZN6XfkO4GhOMEWoujxTlqBFK49O+Zy5yyVBD41H0rakI347PCCnMt2H5LLFKCoo2sepmexDsAhaI9hxXC5+qK9v8eH9DKaEwLKc4py13zy4Z2ThqPcYCouPWSQHDqknXVCGXlWq4Wyf2AyieFspewAkFl8C3A==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29431BAEC70EA7E390FD8759ABFD0@MWHPR0101MB2943.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231101)(2400082)(944501161)(6041288)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2943; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0101MB2943; 
X-Forefront-PRVS: 0575F81B58
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(366004)(39830400003)(376002)(396003)(39380400002)(189003)(199004)(50466002)(2486003)(83506002)(31696002)(97736004)(36756003)(25786009)(64126003)(26005)(90366009)(4326008)(6486002)(77096007)(5660300001)(53936002)(23676004)(2950100002)(7736002)(305945005)(31686004)(86362001)(81156014)(6666003)(52116002)(67846002)(8676002)(81166006)(478600001)(6246003)(8936002)(316002)(65806001)(110136005)(47776003)(54906003)(58126008)(65826007)(76176011)(93886005)(52146003)(229853002)(105586002)(65956001)(16576012)(66066001)(186003)(230700001)(16526019)(68736007)(6116002)(2906002)(53546011)(386003)(106356001)(3846002)(39060400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2943; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDM7MjM6NjNlczIyQnZ5SlErMUZiME83b0taakNM?=
	=?utf-8?B?dUd1cW9aY2tZTitDcCtmUFZjY0Q4QzlGNm9GUFFhTE5XSFBIOTlFQmRKVlZx?=
	=?utf-8?B?VlRzTWFhOFhMcU95c1lLemQxQWRtUms5cWwyYjEwcDFiM1lQNzhKV2VWWlU5?=
	=?utf-8?B?UGNqOG8vcEZmaTQ4V0RSMzBWV2thMVVkR2QwbDJMTHdsQkZveUp3M1J4bXU3?=
	=?utf-8?B?OWlBSnEvak90L01Rbi9scUZuWUVKUGgvTUxJa0pDUkJSQlAyYkIvRWpUalhx?=
	=?utf-8?B?OHZURU5qazFlZm9leTl3WVZVbklyV3NLUHNudWRSRkNGZkJIN2t5amNzcDdq?=
	=?utf-8?B?WmdrUEt1TWdYSWxvdGpyS2xodk9FN1pHeWVqV082MEJvZjFvMHc4cklYb0Ft?=
	=?utf-8?B?TElkb0UxWHJLTkZ4Z1YveG5McWxGY3RNcHorY1hnd1lrcVlGV1FicjNtZ283?=
	=?utf-8?B?NHp2K2FyVklsbkpVRjBMNForN1M0d3lGOEJNTGVTR2srV240Y2ZCN1JTUE5M?=
	=?utf-8?B?V0FTNSsxMjB2NlFwaktjMUVMZmFITGNJSUsrTHAyNVdlam5QcmRKOG1GMHV5?=
	=?utf-8?B?VXZLMDZ6RXQvY2tRUURVVFFxVGFHNDFPakJzMGZkMzdDWld4U1dJYmRaS0ln?=
	=?utf-8?B?OHB2bkhoK1dHTTVRazBTWHNlcDNucVlsN2c1ZFFjOWxVbXFURUoyUFlNRmto?=
	=?utf-8?B?WkpzcXROOWhmTjFZTGpnVHlXdGxGU1BXQkFENmxidTZyekhEbHNEZkpVSTBG?=
	=?utf-8?B?aVRsSzY2SHZwRTQ1TVRnWDY2eXUzZEdTMDN5ZXBBYXRXODBZUjJTRDlpSTZW?=
	=?utf-8?B?eCtlSVJHQ2NVeURzMkhNUmJjQiszNG9NNkVwZXI4RTB1RnBNUW1XdytMSUpo?=
	=?utf-8?B?NnFoZVdmSlE2eENSUGRwaVVFZHUwck92VjRGZFJrVW16bHVndmlidFd6azZp?=
	=?utf-8?B?ckZtdWx2Y0cwa3VaQWViLzFaRE01NjBsdkpBUERTYVpvRmJZWFRmNnlKdzUx?=
	=?utf-8?B?V2VWQXBqSDBndEpJRXZSZGJtNHkzMjhGQkpmQm4wWktVZWxxUmNWZXBpZWph?=
	=?utf-8?B?YUpBL3VzS3RLdjdHczJMR3BuMURmako4dXBnVE5ISDNwbUdyVFBYNWhhQ1BL?=
	=?utf-8?B?dHRwczlndkJZTFY3bHdkWjEzMUhJdmVDRmJ0YlpoUGs2MVBqQ1VmeW01ZE52?=
	=?utf-8?B?eXAvcWVQZzJRNG90UFBTSkk5RFdReXJBQ2w0Z2VWN3lyWnRaR1ZmK1BrR0ZN?=
	=?utf-8?B?Z1ZHdmxNaWZxcVJZMHVGQXN2WGtQd0paenhRMEF5VHowYXlaQlhxbWhkVWtU?=
	=?utf-8?B?cFhCUGY0SitCbVRGNk5FTDVsMGZmV3hDVElFYUljNGVRdjRYUzFsZmpQVUd1?=
	=?utf-8?B?T3Jydi9Lb0JMVzBldng0SDNmc2UvRGtFVW1oM1krM3BQSzBHQ3BXT1dORmcr?=
	=?utf-8?B?ZFpVNTFSV0J4WlpwSE14VmttKzVNWkxOaGlqZU1peEorbnRZcUlUWTNQeFlN?=
	=?utf-8?B?c3NYaHdJVGMzTGY5QWdNQkJEN0RaR3c0a2tpL1RqZTZOc0t2U096a0Z2cGJr?=
	=?utf-8?B?OS91ZmNTdDNENWkyclh5UEJlZGJjVXV2WG9tTjFDSHpnNC9WZ1FQN2Fhd1cx?=
	=?utf-8?B?QmUzeTZRVGRCRTZNMGNIeVVFeXBsRmlpMG1DV1gyTUpkcUs2ZElIc1FsMmVK?=
	=?utf-8?B?L0lmV0F3VnVveE9KZTgrN1J5S2I2ZmpvcUovU3puVTE1enNnMDU1T1A3UDZZ?=
	=?utf-8?B?cHNnaDk3NHViU2VvdTBoTklEUnZiVFJnblhvQjB4TS91NzNmeWwwV1dtR0po?=
	=?utf-8?B?cVgvOGxSQ2VEU2FxbkQrY0VqbmhsTkh3NkFTMW5IZ1lwenRsa1A5ODVsRzI4?=
	=?utf-8?B?ckVnazVwcFd0QitrQjRubnZPdFZyYnNUanZkeDF6cGlwTm1nLzZ4MHoxalJr?=
	=?utf-8?B?YXgyVTR4aHlpQm52UDdkeXkwUEVuMm5JSVZiaDBPT1pYakgzNGovS2xwTGxi?=
	=?utf-8?Q?PgGX7S9d?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	6:j07eWysz+igzFIOsQLPDRinOylQWaTSrUoqExpb9u7QzsV779eZX9Il105Ye2P5aP7M++0eeAykvQvPKY3HB/oGT1PtIXfwFDLIba1V13F21Vb9kBOi2dw5QNojTGl3zLWGcPDecDG+H3Snf6fjTkL+P0+z4xmLAyZtbzzSP+pggDippj7wvZEA66j8ycFvoAYs18x43j29NaurAPi6EiCnrm1KPD7Z44TL0vdkoq0jY5zU/y4kNw2DTCvU4GizWUAQjdaVdHikSpY+QJBkuTq8IEwNICU7jiDa8pr/Pa9/TaUKciDoWYIkvOncYbOclUZdOZTzYadMg8y0EiQ3ohIUuM/WyTPr5XgdR+fyzIZI=;
	5:+VbU8agw4J3DNEH+w4HD3B8Spr60I//VfuQV3D9SY/9lNnkruPAXxyGuqjUSiniJ1pmvZ6NVM1PCWyAYkSpiSiTATfMbhEl0q1hAZiDwugY2CMcD7eMtaUQAQgggdTF/jcRi99UPblurFZRo1uN+ysne39VZrqP8uSbZSvYFzKI=;
	24:zBjdH2qSjNzvc+2+GwMVW3l8fL86oxRjQorkk5qe6G6jLKw6RbjUPbSFsspyjN3So5iLnNRvdrMxVboKO8KhGxvYAAB+o3FF1+/bJcqUscw=;
	7:NSR3pECwGSUnyXDhG0wOpcrMHSEY2w8BzO7UUNo7QpUDH5lx7+WYm3r/gG9nQFUIFh9AhjY8ze0E9yTzw7P56tvFYPav6a7Vm7l3+Jx3gCTYU72xXzOERRMwfLtRbAHWKF6X50sbmPjr+TY3Gs+RIg4OXUziDG2xWZhluN1Wr+A0EJ/KmKGyKGMo7w1GDvSQmMfMkfoP8U/Op1zw10qe9l9NShs39Oa7iOUALb27dQqoE2lH9Yxrk4ASROlhM4pw
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2018 23:39:12.4043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b828489-8f8a-4d8b-cd84-08d56dbad3a0
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2943
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Tue, 06 Feb 2018 23:39:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

(ping)

Paul, what do you about the options we have here for making meson work 
properly in the SDK?

To recap, here are the available options. I'm wondering if you could 
give your opinion on the best fit for how OE SDKs work:

- Generate meson.cross toolchain file at SDK extraction time.
- Wrap meson with a shell script that dynamically generates a toolchain 
file and then runs meson pointing to it.
- Change meson to support pulling in env vars in meson.cross, and use a
fixed meson.cross file that references the env vars.

On 01/17/2018 09:47 AM, Martin Kelly wrote:
> Paul, any opinion?
> 
> On 01/12/2018 04:35 AM, Alexander Kanavin wrote:
>> On 01/11/2018 09:22 PM, Martin Kelly wrote:
>>> Khem and Alexander, could you comment on which solution is preferable 
>>> from an SDK standpoint? Otherwise, could you nominate someone else to 
>>> do so in your place? :)
>>
>> I'm not sure who is the resident SDK expert, perhaps Paul Eggleton?
>>
>> Alex

