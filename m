Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0053.outbound.protection.outlook.com [104.47.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id BF117787BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bQMfkwIyjmgjmM/YGHFhyQxsJdwgsMudVQOkBqUVvqo=;
	b=OX9x8PylqyZZOxYQexZP3jxlEi2EzfRretnJj+edk9ZxUAYn497rgiIAPvB3xBoYtTr+nB96eifIScSuC8505btoIhNFBCAokWO8SUSWkru6U7phPYZNjwFLp5n9sWiV/j0MQWdk/iCXQCR7jbQFcuk+MzWjmGR8cf5ODrHumq8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	DM5PR0101MB2937.prod.exchangelabs.com (10.174.183.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Thu, 16 Nov 2017 18:18:01 +0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20171115175303.3557-1-mkelly@xevo.com>
	<20171115175303.3557-2-mkelly@xevo.com>
	<27aaaa3c-05e1-bc1c-6416-cc869aa16f76@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <7db9ed06-d48f-3a9c-3339-cc7644bdf9c2@xevo.com>
Date: Thu, 16 Nov 2017 10:17:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <27aaaa3c-05e1-bc1c-6416-cc869aa16f76@linux.intel.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR02CA0017.namprd02.prod.outlook.com (10.168.209.155) To
	DM5PR0101MB2937.prod.exchangelabs.com (10.174.183.12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae14461e-2d19-42cd-93b0-08d52d1e5fba
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM5PR0101MB2937; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	3:mDbnMPK9sgjkhGBiZHube++SxEnN6ZD5Ny+/BSdVVFRijZwW3tSnR+JV6qNEJ5coneJoGl+iqwDX71K+jjjAcL6sjjcUzSJT/m1JHqGRr9yIc+AbzN8rPTqwg7xMULyoRzFQaG9pO2IdHmzM63+62L3kh5IrR2e6NeB7656LJZhyU3vwXC01Jxs1nXcakwq9ZBgxl1zkOkXRRDzGfaBcCEsVNJ4ALFcxszF88QU/dW45eC63e/QQbcB0CJGFkOIN;
	25:yfGTmcA9hFsuq6aRLxzuWqQ2QCbO2MmR3yWNmvvNreeCOTGwS2bOgAJ2ncGYaFrp+obwM913YSnj7dU6EA+AvOj1zgLk8Ka/X0OHn74RwHBGnZqZDdeqydW+C72HONbDhzm3hcFBtAZ1W6dgtA6vucjZbpERa0TbPvzBnDrovbef/Sa54YpTAU8eEOqHmxRUy+IC+LR6irTLdXFNT26Qiu7tY2VCt/ZwulTC1FmOwH35F50x/UVZs1KWzP88YAGaFZ9E/dixqxwWOidShlxioLQ+I7ou2fhXtt2qzq5ja//V6Q1xuz3l5EaDlgI6GwjeHXL5uPJEanBPVDHcx7imxw==;
	31:+aZtlYirKYjr1iJbElE3nP82uej4ct+1/mS129VZUw9oSnop6cN/tRjuIKSlbyeuVvucHwjKunDltIcQbzMv4uD20DL7CainNDTMvqaDRaeubhJEBdtoFV4y8Ciaq2z/q/kLtQPtAqi7ff1l8TzfjZW5GY98/bWd+5Bsw+9fvmYjReghdSiqOS1r+5EQLXd1LDFKSx72w755aXue8XettLhsy30wnDE9zTOMZRSAVuU=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2937:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	20:DkRKSzf0onrEmzsLPByWB34keIhcLlucVG04S097FX0aB8tv7uHWEvS0HuiA6+1cgkr8mwc5r4G/GjCy/DnvMNsj3yOXgPqr7GSqwIbf+r2pH/gsoyTsLwsItPxtS/bxRbJJpdZB+Xj68Mjk2KZ0uDXHWOGuteurq66wBTzbnOojDmWlea03nOkwfCU+hk+vPGdHGDz8WggC5vNYV4S+1hSWioj50JXfdKtxM9ZegTjqCRAe8bMpgILXJr+HqYBOtskbTJkZkfp5GzbiVI8yDFbjbH+mntR6j+qJxoBz9FKz5UVSvTSCD5wT4fusRb4yRrfMFwkxP5ajzpgn9AuAnjAHHvf1IZHSQj4D7vnahGBMn0Se/NFZG976Q2x0JPu2DsrvM00/q0IHvLAGnF2Cxh6C1nVDX4tWB3LHuPRTzvo=;
	4:Kmc5sl2vB40ydv0wQpzQsBOOZn4/LO0zhQFhH+/N8nIHNpH5pPZjS5IJ6Xaw+KISXGtEEIVb0LhKLnn62DzE+wyfkPjVJQYAR36JZnfrqo4BbRf8yhlvI577KVP/+4GR9v6ifYjo8Kn/O+aFazyc2uePHl1a0GyYVEffrq6ayVcAep/BHf/a0wkMa9BARmgKFpYnf950NMXUwUpbSfee7IH5DIRolE/t9oqZnyv1s6nCJWbyS0rVFRKE1gmaS5O0veTzq5hzWgnem33sMLWs3w==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB293755E805F400DA78402CC3AB2E0@DM5PR0101MB2937.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(3231022)(10201501046)(6041248)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123560025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2937; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2937; 
X-Forefront-PRVS: 0493852DA9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(6009001)(376002)(346002)(39830400002)(199003)(24454002)(189002)(65826007)(6116002)(3846002)(81166006)(54356999)(65806001)(31686004)(76176999)(478600001)(7736002)(305945005)(53936002)(83506002)(6246003)(5660300001)(8676002)(86362001)(25786009)(53546010)(316002)(36756003)(189998001)(67846002)(2950100002)(97736004)(23676003)(6666003)(16576012)(50986999)(31696002)(106356001)(33646002)(68736007)(50466002)(2906002)(58126008)(105586002)(2870700001)(6486002)(77096006)(66066001)(65956001)(81156014)(101416001)(90366009)(64126003)(47776003)(16526018)(229853002)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2937; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzc7MjM6T2pzV3Rqcmx4VUk0WUZzYVRzcE1HR1JI?=
	=?utf-8?B?UDZjcGdYV1p3b2FjYUtOQVZRblV2RjNkR2ZwZXlHeW5xWFlOUmM0c3RsTEN6?=
	=?utf-8?B?QmRpczIxSjJyTU5sa2NLbG94aEN1OWZHaDVneGZjVjZkZHhORjltMkswOXAx?=
	=?utf-8?B?RTNMTWl6Q20vclNGNnNIdFI2aExQTmpVeTNucnJGNnZhZHQyTUx3NmQzeHp2?=
	=?utf-8?B?OWRMMXN2bkhOVXpMWGpBVTloUExZemx0bzFpVkdPamhQcnRlbm83dm1LamV6?=
	=?utf-8?B?bGRmaHZGWkppczZRc2xmZXFNUzk0Zy9HQ1U3cTNBaWU5SHZJSkV3NDdzV2M2?=
	=?utf-8?B?QnFidkUyZkt5VnYzTG1FMHZVV2ErUFZRODlrYzdUZ3A3ZzU0RDNlQXpnVTly?=
	=?utf-8?B?dUZEc1UrMWNLUm9EcUZVS3FDdmw1SEZSOUJSTDdhV1Q1Zk9oZVdNRjlDZkQz?=
	=?utf-8?B?RDlJV09ONzRIOS9xV0Q3VkdZWEo0UTlkcFZnUTcrTzZwaUdsb0ludkRwRTky?=
	=?utf-8?B?S0tRUFVIVkNCVk4wc3JuaXdoNWpmdzdlZjhra2ZScGdKdmdRSW9nWVBLei9P?=
	=?utf-8?B?ZjFHNDNhNnYxQlo1dE12ZGdYRnMvVWhxOU1TNWdyMjJKYnZrZkN1dUtCZk5k?=
	=?utf-8?B?ZklxcVFndERaVkl4N3VTMUh1RWQ3ay83UEk1elpPUDF6eWVNVUMyQkhSUC9L?=
	=?utf-8?B?YlcwblFzc2R2SkdUUDBxbDRsZDlTSUtEazM4a1JqSGl6NkdMbldkWXIrRjZ4?=
	=?utf-8?B?L2FKNGpCTVpQYnZoWUxXUWN2eWZwVno1bnpUbWMzRXV4UDNra2VYU21xaURx?=
	=?utf-8?B?cTBHVVRyRlVzbGl6UUJyWUZPaEkrSXpBekI3OEpwUXBaWkpYTHlVdnVrM0hv?=
	=?utf-8?B?NjhWOXBvUjJmdzZBNjREKzR3R3VOUllrZENRK2c3YzQrb080dEJxUzBwWWdy?=
	=?utf-8?B?Rlh4dXphY25oR0l6ZThzbmxPMWFyV2tuV2t0VytkKzZKZ3lJNWtrbi9XdDJp?=
	=?utf-8?B?YVpZSXJiQ241OTFNc2kxdG51ZG10UFNjLzk3Uk5NYmlUaklKcEJMY1NHNUs3?=
	=?utf-8?B?azdMRlRWT2xrdnI3NWxIdTB4MkY0TWFUUGEreGlIeGpQelhNdStaY2pmZUhh?=
	=?utf-8?B?V0dWL1ZnNHRCV1FZUTVSL0ROeDJ0KzUxRVkvTHZWVFMvRVNTa3Fid3NNOUd6?=
	=?utf-8?B?aytjV2d1MHB2WWczbnFlZmxaSjVHYmRuUStrNExUaGhwTU4xa1VPR1lLY2Uw?=
	=?utf-8?B?R0FUTVowdFJ2Um5BWXlXTW12MCtQTGNOM2l3aWNKRGN2YzMzbk11aGtwNFRJ?=
	=?utf-8?B?VUM3SXNDWVAvaEI1ZzlURFJvVXN2aFJwS3hncVV4clZ6N0tKd1NpMFZsNUQr?=
	=?utf-8?B?S1FQc3B5aUducTFkVnhVMEpIcnpQWGZ6Z2NRcDZMUGVBUFNibmIwV1ZLUmw3?=
	=?utf-8?B?bGlpM3hTdUJZZUxOUXBhVWRsY3BRV2s0S2RnL0NOWFZTYWc4Y2REQzNNeHNy?=
	=?utf-8?B?NmxxTWh3UWhBb2hTcnNEWGRMU1VEcVVCMEU1dGpkaklZNWVYa201MlJFajMz?=
	=?utf-8?B?anFyWGFYS0I0MjBNVGJtaHJ0SWgvWEdpV1ZkNUpsOHpNaXhqMk5kck5PTWpo?=
	=?utf-8?B?YjAycmtMTi9JYkpkVHRKbVY3VjlpaUtoc2s2cml4emtzZkpERkpkcUptUUxu?=
	=?utf-8?B?S21GWTYwNE9VWHd0Z0hqYmJpMm1iQ0o5VHVmZ2QxdE9QU2hQZXJrRnJCMFZi?=
	=?utf-8?B?bkJsY1E5RG9COS9YMXd6ME5MbGpCWG1tS0ZHb3FnQ0M3VHhBOVQ2N3AxWEhv?=
	=?utf-8?B?bmVMZmVFZHVRYnBLeFFKUG1Hc2lLekJJaFNXQ3lYOW1VSE5oQT09?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	6:h6uU3wVQA/xFqWBunCBQ5Ru5Cs8I+zaKR2RTlXjePOVdzZ/fKcCBLSTF2M2XLghY4LbIxYHFgHalZii1cJ7iUUGaGvE74o3ZtV0Sl9MTbQIyDNsKZy48BFSBB++MkT+XjtRpcFWcDUjOCYLExiW/owYz36kX4Phm7fXLUoGTVy6B3ExmBdwz8mhlo7YubitzsSSiXtw43QFF4lSjOUQlbAJ7hElV5cRfUYsrKePUDtvVFKkOdYam1r3YVOXy9f42EKhJfPIkDgbjS+aTOlg7lBRH4Uw+ISMpxCWUPXhM0sjwHrcHA9iTNzloeES7EJt2e17k7o44muWHuRufz4J7xCxqdll7yq9Y1EbM6VYdhuw=;
	5:6Z70ZnU6qG5rUZ0DqGv0uFGEuWSO0e8NiIDa6/4Apn4aMntZD5GoAYQ/CVRRhGyR6B7DtVrrPptdw9w5DWV2uAg6KiVO/vTna5A8BFjpVnxaU4I8bGt8qOw/S2fcLghHjNSX2UfDvBvBmWxiuijEq1+x9X7KGL2YD2VGKmq/6Cc=;
	24:Ubo+RN7tzc1kheocdPPKLBTXarF3AOVNbLSepxPqTUooXi7+83HGYzcWcBsu/1cSk8U1Ul8UkOBt5AmKMnGs8lQQbyp1YcmFRgBwEaVdNr8=;
	7:tC55SNlVxvuBO3oJAoVEojizQJsOJ2PAtu2WjFvi2RCB+gKFM7P5RYusvOpmmRR+8OpzwhZMhuWEW4g5oX9ZcYsEySa3qzq7ptL/ZwiVycYH4xNpoX9Hp3JoSmwljlP9VIguIDSuEzCw9qatGWsVbeBgZy2tZ2g9O3a1pXI5QsyEkFW2u2JXKu3TDp0RD5izJvRWlwKdbTMXbUdArUenNx665ry5o6rbH42a+TLSjFEX43I2a5ujUG2gJs6AuHxP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2017 18:18:01.9562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae14461e-2d19-42cd-93b0-08d52d1e5fba
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2937
Subject: Re: [PATCH 1/1] meson: export native env only for native build
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
X-List-Received-Date: Thu, 16 Nov 2017 18:18:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/2017 09:52 AM, Alexander Kanavin wrote:
> On 11/15/2017 07:53 PM, Martin Kelly wrote:
> 
>> +meson_do_configure_prepend_class-native() {
>> +    export PKG_CONFIG="pkg-config-native"
>> +}
>> +
> 
> What does this bit do? Should it go to a separate patch?
> 
> Alex

This is from Ross Burton's patch to meta-oe 
6e2d975fc16f4228a2d952bde1a874f337281ada ("meson: export PKG_CONFIG to 
use pkg-config-native for native builds").

Since it's already present in meta-oe, this logic doesn't need a 
separate patch for meta-oe; I just moved the line into 
meson_do_configure instead of making it global. However, your branch 
doesn't have Ross's patch. Ideally, I think you should first cherry-pick 
Ross Burton's patch into your branch and then put my patch on top of it.

