Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0054.outbound.protection.outlook.com [104.47.41.54])
	by mail.openembedded.org (Postfix) with ESMTP id 04B2071D79
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QdpKmOzkYrYH+OsTk1rwc+U03qFibz9OfJANqcmI/IU=;
	b=Pll4gv4k4FcpieIHc76DlU/D6NZR1++TaCpeFv03OOcufnEX0vwGdW+XbCgg525/4HwZWjOJTt3JO5gIQijfH7cU0YWyDZyOcAqjkguVNV6N3S68rikXYdfHG6AsW0EKFwmqCvRY/G59C3b/pHLncrDa/opW9M2M3xiq7J3To40=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1282.10; Tue, 18 Jul 2017 16:21:15 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <20170718002129.8704-1-mkelly@xevo.com>
	<CAMKF1spT18TdH6FbS+L0xLrRRxofpUwhLtNQtA3PKxFTRoNCUg@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <1e22fdac-d41a-ff88-a208-e321b9820e9b@xevo.com>
Date: Tue, 18 Jul 2017 09:21:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spT18TdH6FbS+L0xLrRRxofpUwhLtNQtA3PKxFTRoNCUg@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN6PR04CA0024.namprd04.prod.outlook.com (10.172.194.34) To
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dcead0f-2316-4333-8295-08d4cdf903e3
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR0101MB2939; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	3:6uiKZRQhxLvYb8d3Uqpt9YIuVT5DSOKvaVrSU7OK0oWJE7oX0MqlFEJ5sl1sx1Y+9AKMwtNy1q8Ua5HMclMnHn7h+4Rg/aTXY7gbb36xGc2Fm0oYbtSw0mUHXJlrBMbnOLCv9HF91ZyuSb/LL99BxDMC/voVkzVUcA+Sj5ndxkEh/S3rPJtGFJJHVSeUopIA4jfjt1oYGN0itnQtPJFQxMZfNlyoPh1FHECDyLUMRG3Nhp/aEmnWmkNrNpfQa4ZduNRYNBd2hhPMADBzPQMMIJt1LoRMK6F6XnbvW4zrVYhpU/WZ9rqZOJLusvuGhlvRnyM9j9LduPySyseJAYD+slOiOMLdeC4G7ElU9mMJ29X08g2oCH8ZuZ3Y0toxoDFCforFOgUxDpyPUAZPc+ic+i6gV5RPJMsYaNc98DxOeSas56MLWXO7m31E8M7Kb/ABfzfqKoE9aCAmVrw6+CoptKVvLUzr5ITmmiO2fbQovmuv7PcV6ZvXUkjDg1LKNN3fBHONQfQeP5f3zqXb+RUpl8SmU/mQw3pTrXCSwN2IJT3LTGmZ+fFNhAZXsouvkXeurxJZCZuez6k/Uq5NDQOC3pQ9CaPNRt9xH2yS3kaxmIDfGwkoPIEfcQVuPiVecbI9PYaAYlM8zUBQMKMkPUTDzTzVcOdK1TJPC885F66whCf2mi1qD0H6yswb8TlgOT275LXccBFHRMf3AjwCi60CSwdOeV3bLxC2IiCd2EZSWP4=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2939:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	25:rUshHKAU0IawYVD9Rcs4mYPEgvXgP05S6JwKW4pHfKx4Rv/+9rX5DIfsZGu9XZ7tMlZS0l1QhJzqC7MAmAU0V4Jm8GXTJNHVgVhXTjmifZp7x5eUPkeA7Osg0NwofpfH9hZvLkfOaldKTg2epUwV9JmvKq5nIW8csFwBy7WAENrtja4dETODesTqKuliX7HMP93aA+uqjDwsBS8n99yV5NzxI4G264msi1AnYfJz3vU/Md6HAx/ezVE4d3mHrOb06zCX+WA7W7HLDdKhIEDFCmDTYva64iwpqpGvP+Itspkbfpdtx8hBsT8LgaOzu02x/9j9I4LwZ2/bIXVNsCNd/c9Ur1NpqnqtV68YJhnYTPCHNbGP2XowmRc3A6IdkZbiylIjT4kmC2HPmE0ik6YjWTcUG02NjOLg7hRKY3jtxfSXJuN2/wu9GMYcGjKV4r7lMp+GgKP2gNc0IaKOI/3Uaa8cjuGKjXLlH1aoLiSWZJiJ6MzzSH5hvmek2mNqpAsDBV1q7pyleUq0xg6TvYEMLMF9VlGnXKvAywjBkW5HMqqDWqtIjlQ1E9OjhKrq75tkj341uNjospV3Y71bvBo56gbr9cgjcgdCm6vsURogP2iPagMMgClJX9lN2ePg9s3GsYhh9YFLqq+VKeWCb1+clMgAEbkcLJPOJsox+XFnMYwvQrZ/umV8fTbqcqZlwZmX3YEikMOfziOCqSNf5rld51fsNIp0rJttdicSUPzxXTuX16hyZvD0oKbMPyE86vYdvrJaOAT8ZdyS+2ZU8e0ps0K65WwyLMu5/w2J3B6fX1ETWNgaOAdr5drHK/SXkGX9jVxU3qrb0QYmW45DT97deC2mgwDQGCj8aDrvM9eNOOPEM3FnR5t86BdM6vXTBWwK6hCSmtOXyeIEAxq3VRSIdDP4A/v/4collWllcbdj+lo=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	31:y6rLRJixKbwEJpzy/38ZVFOeevl7rFiIetmmXF7TJ8qeIPR1PrQMa1EbtjchuXZ8kFzSkRd73it5VYa2yGW31tFlTK5wW9ruEJgHdj7aXXvQUHs1yExZNclv0yTtMRhzOlMi6P1wUqb643QuHb7TD0km8V4D9u4mbRn9QIvvuEkg69ljlNPkf9PoYXd8ySsrXmKJ1cmHIMBRrQEBzMFcWfIiW3uIUSKWXO0TckHOQ0Mi+n2Ai5a+mbV1JDOHAXJhEdu8glCAbeUacGssWwvECf//ZnI5f0VLnfNHPZQwGOnbHTExLXfIkohzaQ0bMD9BlpBLCoQ3lPpg4os0CUWxCHVnl4D+gTSE8SjLNc0QtPGO8aZol+6dW1wg2bgxD4TpKobuc6WHmd7v5mvWRLQxzw0+Y9aAqBhxdNc6GBA+tlnn7EkZu8L+tzYHMwvUp9bQIIST7qeBpJF/BVmAq5b1W97CBjSziUjcnixOqeY7QySrJ88+JOofkwkLLAZRiMUDbPm/2w2ct51KSeG4+2jNuiv+DcGErhpC34F7QsboaWkNMNNThxlG1lKZ9S3rUy4mbMEO7ZU/fQPMnwzd5i0BGYYNbrBH1qa4qi6TKirGl/8ek7H5a78MhMDQgu4EZYMHAL30yJVuHqMVVpuTGdqXiH85ZoGgWjzLyNaUTcGXo5YAX6Sh2lep7GWMlhO3J4X5cG7PJ/6dsejSH98/Nljook7ywFgu5Ea1uG/wzEB633Y=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	20:qoZotRiAN7dMEcYT33dfD8/0XwoF1VsVBeN7DrAE0Eb/klhzMKtFbsjJyrtNcx0mtIV2uM5O/Bs5f4cEEFmNJQiX4DPoi0dVlwHDuZREQoitMzpq1Dq/qnvLzqdT/QBJq9oMIpAzptlKFBMr+EyoXPL3nByi2SXNmO46Z6+ss2/bIfqzHoNSVe6F2ZCVB/5CpSMA5jB+PUUmGN67m9vHOcNAthUgsReqeXq+DaTt9gvrt2q5zpBT4hxPHzGpEJKDW59iNmfpxG02N4NgBA3mukhRbPBDiuflV4OOtlVm+zkkmczzJ+MhoEgOgSjyIwvvYgrUlEhG4Ic9VTc+D9E3y4AtvU7VoUiSzvcdbS2U2f90wHeiyX6AiKmbIswatRF8DT90xv0c/hgQ9ykhNUkaTvDrldC9eJrS8NccWRU/bgI=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(264703809997249)(148574349560750); 
X-Microsoft-Antispam-PRVS: <DM5PR0101MB293997727EDEBEF2804CB950ABA10@DM5PR0101MB2939.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(2017060910075)(5005006)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123564025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2939; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2939; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7NDpVK05lbDJDV0NCNng0OTF3RFVGZWY4YTBG?=
	=?utf-8?B?STR1QkZiYkxkdFlQcmh4S0ZLTCt0MERVMUdJTWVoS1RzUnVZYytLVEx1TWxE?=
	=?utf-8?B?bHNudXZBSmZkK0tqSjlNSTlOVHZTT2dybTJNRnJOQkUvSmxCMk5VSVQ1ZUFm?=
	=?utf-8?B?L0UvbU9aQ1VTWXY4REhjTUp0b0p4VXFxQWpBUVBMdlI5STQ0M0JNMTJMR2F0?=
	=?utf-8?B?QlNsemNmTDJoNDM5LzJGcnpDdjY4N1FOUG1PQ2d5MDdKS2o5SzkwcVVOL05w?=
	=?utf-8?B?RXdlcHc0Q3UrMUhpVGE2bTJFT2xqY3hlU3N4WndOa1ZqQTNYMS9VR0d3UFpO?=
	=?utf-8?B?aCszVEpML29sSC9GRGs2Y1lWM0wzY1FFZ29jVU1pQ3ZOOGRNWDVsNTFkUnNo?=
	=?utf-8?B?TmpkMjJjMjF3Zjd4RGM1N2hOL2wzZE5vNU1xeFlIbU9HaWxNaFdscG9WSktn?=
	=?utf-8?B?aURtZ3JFK1VqMU1lOXhVUDN3TzVVRVRQREtEQ0xSeFhvSGhDSlBhOUFuZmVW?=
	=?utf-8?B?MlFGU2JRajRKamVneXRHNVJsMjVsdWQ4eW02dVk1Q05uZ0FBM3k3V0tSV1BK?=
	=?utf-8?B?RGFWVkxpdHJHSFEzdnB4bm92QjFCYjMyVkNvM2t0bEFNVHBtQWxQZUFodzZr?=
	=?utf-8?B?OWdUZkJxV2ZvOG5PVGZKdlp5R0FLV1JJZGNyNUlwMWRIazY3Qk54Wk1wWHh0?=
	=?utf-8?B?ZUlXOE9CQ2pzS0JybkJqM3YwQmVVQVRHQ3c2aU1KWFpQSCtLTURhQWlPdFd1?=
	=?utf-8?B?aVFDQU5JMlhwNFlnYXJHaGI5OWVsWmdqd3NXN250OWFid2ZROFVydGUvSGND?=
	=?utf-8?B?Um45NHgyekk4dUxQV3pOUUhUR2pIZFgyZ2x2cHV0QmZiUlJRbnAvZFlNRjJo?=
	=?utf-8?B?WkFnWmF1dzRwNFpQTXMxeWJINWVoUk1iRFduRG1rSVZoWFVHdzNJMmZpWVNV?=
	=?utf-8?B?NFVkajNxMVhQdjUwZy9FNFpGR2RlcGduZTVBcHZOckNzSzlNR2oweEtwdStx?=
	=?utf-8?B?S2hIY01LaXVmZXJOcTVKY0xJOFJOeURGeXJFcGV5VlNlWThLU2FhRkh5NEcz?=
	=?utf-8?B?ZllpVnBuc21VUkYzaFlyU2hCcW9SZ2hFbTRMTVBZZzM4SmhJVmNLakkwVkM4?=
	=?utf-8?B?QlZDQ2JRbWFIbm5TME55MS9xWGpRQVpjaTVJWUgvVkFwRnFid3J1cXN5ZlZy?=
	=?utf-8?B?U3AweFVJdllNLzRQVkN4ZVFPZnJ4UzdNSThlK3NoeUVEUXI5ZllUV3FYQTg4?=
	=?utf-8?B?M3pXYmJDUG01bEYxUDZhaGoyV3dEZDltUWZaKzhpa3ZTU2lHV00wWTZPTmtF?=
	=?utf-8?B?d0xTZGhlV2xDKzVHQU5ZRDgwTXMzbEQ2YmxRNVJQeVlDcTRLVDg2d1A5V0ZS?=
	=?utf-8?B?dmNoeDdDZUMvNFNuUmNrME85YmlKbFNhdWs3RnRocmlMei81bTcxTnhjdmJs?=
	=?utf-8?B?RXlUR1dYd1YyTG1PTS9BLzlJUUJPNGR4eUJPS1VYY3ZsVFBrOUllbmx0d3lh?=
	=?utf-8?B?WEVrQVpzZDV5R04zZjdGZXp2aWd6Q2Y3dzZoTVpjbEZUbDRSRVBtZTlIdkRq?=
	=?utf-8?B?SkZESFcwait2eWlrOEVKa3hqc0Z5c0NPMUlIZmN2N1lYcmNvUVlBOVhJZnB1?=
	=?utf-8?B?eGY1cEp2SjNHV1Z3anVpQ2hSZURrRFlVdktJVzRIRDhlbDZ1ZUtmem5EL3RQ?=
	=?utf-8?Q?Of+OAcGShqGHLRxL6109P/TxnpMETeXDARFqMbDq?=
X-Forefront-PRVS: 037291602B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(7370300001)(4630300001)(6009001)(6049001)(39830400002)(39450400003)(39400400002)(39410400002)(24454002)(377454003)(305945005)(189998001)(7350300001)(5660300001)(3846002)(6116002)(110136004)(6246003)(38730400002)(966005)(53936002)(90366009)(478600001)(1720100001)(65826007)(6666003)(6916009)(2950100002)(4001350100001)(33646002)(2906002)(31686004)(42186005)(229853002)(76176999)(81166006)(8676002)(47776003)(66066001)(50986999)(65806001)(54356999)(77096006)(575784001)(31696002)(86362001)(25786009)(83506001)(6486002)(4326008)(50466002)(53546010)(36756003)(7736002)(64126003)(23676002)(230700001)(6306002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2939; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7MjM6bUVrc1BCV2xKWVJMNEprRW9WRTg3UnE0?=
	=?utf-8?B?dkhHNnlOcFZRMDNOVkl5N09QUWJhUnNYMlVVMmpFeWwwV09xWFZpQ0hwaEM0?=
	=?utf-8?B?LzVlRUxUcER0V1dxSjFGWGR4VUJSWUpyRjRHS3YxSTVHbDFwOTJLdmxKNjYx?=
	=?utf-8?B?OEZ1ME1IQXgxSCtoRlFqV0xxd3VnUnFZWkFIa2JXMlYyNmN0RjJHdGl3S08v?=
	=?utf-8?B?ckljZUJvRE9MK3liN204R1VNbU1NVFBtUnVVbVdTNi9FM1ZEQmQxUHhTTzln?=
	=?utf-8?B?MUZiRkRiTlF5ZVQrcVVLT1oxd203MFpFaXdqVXJiNFpLUnExbTNHMDNHM0FO?=
	=?utf-8?B?QjFWQnZxRVhnd2RoTlpCSnZEa1lVL0x5RFBqR2dtek5MUmM1U2FQY0ZkRXZi?=
	=?utf-8?B?YWlRb25SaGRvR2FYdHMydWRZTk5jQzRwZHowQnBXUXhQdWxYN1FBcWFrRklK?=
	=?utf-8?B?TlRRczZCSnQ0VFQ1dG9ud29mOHFpVWNyR1h0d1dIbzJjejFSc3Q1UWEzbkdO?=
	=?utf-8?B?YU9uM2JscUZYTUp0TytuYVF4TVdCakZSU1Y1YUFWUXU4T2lDVzFoMVlKTksz?=
	=?utf-8?B?Y2xua0hVa0lwMWw4VmxGTWJqZlpvWkxFNUFDb3JtL0xNbGlaWTREZ2hPbU1v?=
	=?utf-8?B?dlpLcGRCMTZFMkQxWlhTSWdib0N4NStXQ0FUd3hvRU1MeVF6Uk1Za2Zhclc4?=
	=?utf-8?B?aHhEZTNYekNEN3hwdDBjUWlValJDenpBcG9hdWIvdUpjWHkzemlCVzNkOElz?=
	=?utf-8?B?cm9HMDJZNkt6MnplelFIeVMzeGh5R2RSc2Z5cHUrWWwvaGNUNEF4SlllSzYx?=
	=?utf-8?B?QmIyMXpyMnEyWStzbThUR1cyRWdzSm40UWRhZU0yOG5vRGFuMDVnSUFZSzFn?=
	=?utf-8?B?Mmt2N1F0c0lSbHkxSXdiQkhpWkRWanYzV3M2SFpTUXZjUjV0dE5keHZEcXFN?=
	=?utf-8?B?dm83dVJhMHU1ejg4aUp1S2wzaG55S2JMUThNQTdqRWZUVEg5S2FWUVlpNUtl?=
	=?utf-8?B?bUZkbjh5MStQRjNBRi9yd09jd1d3THg0NElDcmNtZWYxZ25vMkU4V3lkSzZ3?=
	=?utf-8?B?YXlzanA1Z05CNzJyWGlWMjRZL2d2OUpPWnRnU1NKMUJWQk9tZmx0OHRzcm5k?=
	=?utf-8?B?WnIvRXdPV2Z5dTBjRmY5bTlYMUY0U3ZkaXR5Rkk0R3pvd0ZkYXh1U3Rha0lM?=
	=?utf-8?B?NnI4cXJZZ29ONjg5bkpUWmlsMXJqUHhYSnNHZmRPM1VaSXFpejF6dVZvNHRy?=
	=?utf-8?B?ZHk0NjNJYlFpNjh5elFxUFJxNXlVNTh3dVl0NllJY0cza05KWWpxQzJkWGVv?=
	=?utf-8?B?L0hMZEZBcWdPanFRSTkyM3NnS0xzeTFPNkRBak9HTkEvb3ZKeHV1U0VMelFV?=
	=?utf-8?B?blgrTWpPc1lzcm5CSUtzbks0SkVxTUpKVWdPYmF4MFNtandzRzFiM2d1K2lL?=
	=?utf-8?B?VVhDMXh6RjNMenFnVTZzRjhydTg1Vi9Pdy9SbXJVU0JSbUFacy9FZ1I5TjVz?=
	=?utf-8?B?bndrWjJOU040ZkkyUWZGOWVqSVdxbDlUSTA5ZGhMYVZ4a043TzFkUjRUQjYx?=
	=?utf-8?B?ME1oV2h2QldXbDBLalQ5aGdlY3Y4clNDZnc3SU9UbWJjV29QdjdqMzRrWGtj?=
	=?utf-8?B?Uk96MkNMSWgzQ1h1VXJ5STBIOHVHYUJqVVFCSWQrZC9qS3pvejM0Rjh1Ym5m?=
	=?utf-8?B?OEN5a041dm8yM1poTW1VZElYQjFuTEhoZFA3MzVoeFZhRnA4Q09pblBJUnRu?=
	=?utf-8?B?WWFUQnNkcWdrV3dCTVRZWGV0L3Jjb2liWGp3VmlBT2R3d2JnM1BJS2FYZ1Ex?=
	=?utf-8?B?dHh1TUxZRkRndDJoTFZoTFlaTzJTK3dNbHpmT1FoQ3h6aFN1M1JmRGpSMy9q?=
	=?utf-8?B?cmhwZXdGRlB2R2UzQ0ZnOHhQYm5DazhQMUtBcEE3WW9YdzB0aGg4dlpIdnRh?=
	=?utf-8?B?S0hWRHcwUzZpTEE9PQ==?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7NjplZE9tM3F1VEwzelMwZFdnOTZ3Wm5kMXJV?=
	=?utf-8?B?VVc4NGNySWtPMzZTaklOTk5MNGxjMkZmZzBkdFIvaDYzQWlNeitsSDFEbDBZ?=
	=?utf-8?B?WWhMWlc3bjd3aGtWb0JpSzRLSWhHSk94Vm94bzBnT2hDQW1zY2M3Q1MyTjJC?=
	=?utf-8?B?OHc5MlYzNktJeWZ3V2wyZzB1cmlNZXZjaGprQkRlSUlnZWhQbDJzRkF1ZnYr?=
	=?utf-8?B?aDhUU0xPRElXaVNYYisrUWEvZTN4MFJIbGkycVY0M3VyZGh4aG5XZks2WDJn?=
	=?utf-8?B?a1pGWS9tZ0dJTUtBKzJmWDFWNDB3U1VTcXFueXZOUUt4K1JQSGw4dTlZZ0tT?=
	=?utf-8?B?Tjk2MGNHVDhMMVNjZEdkNGZtRDh0azRtdllLcnhKRDdJb2RjY1Uzand1STF2?=
	=?utf-8?B?SXlMWDJtUVBsNDJZZnBlWmNNOGZxL2FzbllKd0x5SjNEWFhZNVArT00xWEVV?=
	=?utf-8?B?TStDTHgxbHFGL2gwSHN4U3E4SHVNc2FXSU1YaDZvQzdrWkZYWWQ0ZW9KdWk4?=
	=?utf-8?B?TVV4QkxRRDhFZWlBVTM5YWpOZ1B0TTFHclVacytyRkZQN2pwaHVTRkpNU2E5?=
	=?utf-8?B?VHVkL0dZM215UzR2cVNHc3pvZnoxZkJNRThWeXFROWo3WHU4L0dSUnN6ai81?=
	=?utf-8?B?WVJVbjJpc2FROGE4b2xud1hPRlJPNWJxcklUajY5dk85bUd6b3lraTJkWGNC?=
	=?utf-8?B?YjBSeGJROU45cWcySTU1R0t4dllWNnlaSXdkUVZ1dk13d0lYdGs3dlZzME1M?=
	=?utf-8?B?Z3BhS3N4bFNWNDZCajNXK2d5cHFyTTYxK1cwbk5BWEhNdE1sRVpHMnFud0JZ?=
	=?utf-8?B?TjFtU1BHRC9TdGJDMmtqZXZTRDNDNCtrdVlsZlVzTHBwV3MrQ1VWaE9tYU50?=
	=?utf-8?B?Qm9oclc2S2Z4MThFTktjZys1aUxaVnNyZDhheHhDbHhUQUNzb0ZWbjRBMkl1?=
	=?utf-8?B?bVFOUXltSDBpN3B1UkpEbHlGMnNIcW9Xd3VZZHArVWRqYUZ5WU84VTRPT3NJ?=
	=?utf-8?B?NXdXNG9UTmVyM0pqTW9iWCtSQUp3VjVBR0hGekU1Ukh1eVhjTDZudkI4SFpS?=
	=?utf-8?B?M2loMDBBMDVKK2t3dG9tMnp0OUM1ay9kbHl3VFkrRzQ5SzNsVVJmdTdJcW96?=
	=?utf-8?B?ZEsxdGlkUVN4VzRNQnl0M0trbzNjTHJkbmFXOWJ1WmZPeDNNWXo2RG4zNDR6?=
	=?utf-8?B?eVRvcUttY2JSL3FLWmRRcHJqZXF0YjlZVWtxaDZlcGdlMWgxVG5LVDVIb3k0?=
	=?utf-8?B?ekNUSGpzdHlOWTlCODM1WTQ1eVlrWlhrd29JaVRWVUNZNURBVTYrcDdLU1I4?=
	=?utf-8?Q?dBiKPx3OZc9oqlJB9WeGCqKvzIHYbaXfI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	5:CZ/wEspOrQyioBePfo7R+PDqhM6VEyEqwphwBaL0g9hHJRMVSoHjSYdT8hFkyMe5LsdcmrgMC7jMYuCp1u5I1Vx3GjiNlU5IbqJ8rgzBukO/tEEtR9pIxpqj4uARq8ulxqrgHnn6RSPtbZTTl82F7DD0DAGXY1Y+wAuoPiIr4ft8StQiPQFIKZ4JaqAW0cBTN0XPCPbjxj4e5EZlcHwAg/i4KII5fNREUPz+xMNlsUd1Az+/1VbQ9Kn1pKLja5XI+MUM4lMc5aodxHfzPfC0oRhcQfOIfwYqY+tQBTybF5E8eLTBROxppy+qIN2XkaZRPmn8xFHT+LFEr5/rykcJydH/zlKSstFOdGsUyQzLnGZQwG3TEfP6TMKuTH/tZTUNoTinNyB0aWRQdb7tMwH8kSaakUwOIUbeXYPmzyV4A+YW7kEcky6B2Fqm0eCodMGjk9e0pSUn8x4wFAEjr77c17PAgmOmkoRWEWdFOzhbwU93LrS8rWsXD9PXgm9OY8CG;
	24:QAujupC2tx9prrk4HZb/508u402lCjKOzF0RMxqnS4Gpb7lqRVqhTwOQxn9DPJQ6m2rYgTAPnq+UBXJDTeot/DMiB6oZ3kh4OZSabu3/Zwg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	7:eMpqsvtfL8DjqiFdjrQoLO5IKeqm0wRvXI+1Ba6vQ8CKoeDG5srypmnZDYbhuKJqTrAUyBGesukpv04Ys1l0bQE+Qqc7CVCtU9mG4FFgMouOhrIOHQ6kF3Lwu0CMKW12FQH7/aQBYKbm3CGvjDu+Sx42RVAssGLux4nbEfPoYmUU/6Gt/omsJ9carcaAwBmDrzo4KOsvlrntOqMsi+nklmCdPJdyoYsoLMHwM3Vp5vlX3LyQRmIGDTPq91LkHiO2SUXTnnIudTVsVc7uDND/HhurnG3bFMRvCqeMYNWU9MRPgDe+s3h3n+2RE1VCnq0XPjCM0pd2EDJiRokmR3i/ywamwicbL5ClntSHBI2SOGqYKDTQ89qxcAnUzCJCal8HzvBEqEwGlVbrExhcEHq6C49YIQ5WOfYJ2SEKTibm6yX4IVPAewWP5fv0xyvcusqOqmQsw+GJMJZEk+8JMDNWuBIxncArESy/guCXObDqtAzva3T9ZKOVlabhudPqWbx5qxOyn8F8zlyQZy2monIyEcYrtZWjO7i9S1s5kbwXw7XnH623k5eKrgz5e4dnCHTbe+Q4RqJhJmki27WQR76AOPWTirgqxllBUmq/EMegSYxaN9H98M7qC5fRN6tkLsgbaAyUsU0a41OXtkASrdax7lg3Eu2zu2mD+Q3PJb37APRsysLoRctd0kjUr5nvm4rtoJ7dhvU4hrXrdUnxPXUdMsRZVcePJbcvGUFGy6S9nQtxnPCNj7XwXTr8Kgmcy37lA1U9KbLbJYq9qrUwYTMzWjkXIjG92ED3iIpdbz/yreU=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2017 16:21:15.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2939
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: add new recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 16:35:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2017 07:47 PM, Khem Raj wrote:
> On Mon, Jul 17, 2017 at 8:21 PM, Martin Kelly <mkelly@xevo.com> wrote:
>> Previously, we had a gst-python recipe, but it supported only GStreamer
>> 0.1. After GStreamer switched the Python bindings to use GObject
>> introspection, we were no longer able to build the bindings, and they
>> were dropped in this patch:
>>
>> https://patchwork.openembedded.org/patch/93793/
>>
>> However, at this point, we have a gobject-introspection class, so we can
>> use the bindings again, this time with GStreamer 1.0.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>  .../gstreamer/gstreamer1.0-python.inc              | 35 ++++++++++++++++++++++
>>  .../gstreamer/gstreamer1.0-python_1.10.4.bb        |  7 +++++
>>  2 files changed, 42 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>
> I think everything in single file would be better
>

I'm fine with that, but I was just following the convention that the 
rest of the gstreamer packaging uses; all the recipes in 
meta/recipes-multimedia/gstreamer use the same convention. I figured 
it's cleaner to keep all of it consistent. Would you prefer I diverge 
anyway?

>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>> new file mode 100644
>> index 0000000000..3299b89daa
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>> @@ -0,0 +1,35 @@
>> +SUMMARY = "Python bindings for GStreamer 1.0"
>> +HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
>> +SECTION = "multimedia"
>> +LICENSE = "LGPLv2"
>> +
>
> this should be 2.1 most probably
>

Yes you're right, I'll change it.

>> +DEPENDS = "gstreamer1.0 python3-pygobject"
>> +RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
>> +
>> +PNREAL = "gst-python"
>> +
>> +SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>> +
>> +S = "${WORKDIR}/${PNREAL}-${PV}"
>> +
>> +inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
>> +
>> +do_install_append() {
>> +    # gstpythonplugin hardcodes the location of the libpython from the build
>> +    # workspace and then fails at runtime. We can override it using
>> +    # --with-libpython-dir=${libdir}, but it still fails because it looks for a
>> +    # symlinked library ending in .so instead of the actually library with
>> +    # LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use the path
>> +    # we want, it will break again if the library version ever changes. We need
>> +    # to think about the best way of handling this and possibly consult
>> +    # upstream.
>> +    #
>> +    # Note that this particular find line is taken from the Debian packaging for
>> +    # gst-python1.0.
>> +    find "${D}" \
>> +        -name '*.pyc' -o \
>> +        -name '*.pyo' -o \
>> +        -name '*.la' -o \
>> +        -name 'libgstpythonplugin*' \
>> +        -delete
>> +}
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>> new file mode 100644
>> index 0000000000..1365f7c6dd
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>> @@ -0,0 +1,7 @@
>> +require gstreamer1.0-python.inc
>> +
>> +SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>> +SRC_URI[md5sum] = "adcdb74f713e28d0b22a0a1e4f831573"
>> +SRC_URI[sha256sum] = "59508174b8bc86c05290aa9a7c5d480ac556a6f36306ddbc1d0eacf4f7868212"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

