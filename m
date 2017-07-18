Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4422778049
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 13:34:57 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6IDVgHM011705; Tue, 18 Jul 2017 08:34:14 -0500
Received: from nam01-by2-obe.outbound.protection.outlook.com
	(mail-by2nam01lp0180.outbound.protection.outlook.com
	[216.32.181.180])
	by mx0a-00010702.pphosted.com with ESMTP id 2bs7x2k0sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2017 08:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=amTlhGJT1vGJ+/j6L/r7Z/fDFNsCs5G4gDRVHm9AblI=;
	b=A5oYATzMglccUdrSL/iS+u7aDfYJDhK6VT2iQGff2cEXSJTYGv7TCfBvQbgWpOFjkMwTIdWQkXCTxps+FvDmiI3nQYLXc0rnU2TmSmu4s0+Hc7o/cYHHChsbchJIBMrEIl/FSRv/V0xl+NhIoBz0FIGjYivZKKc4yf2M+btbmjk=
Authentication-Results: ni.com; dkim=none (message not signed)
	header.d=none;ni.com; dmarc=none action=none header.from=ni.com;
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Tue, 18 Jul 2017 13:34:10 +0000
To: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170705173334.25041-1-haris.okanovic@ni.com>
	<1500323515.27323.139.camel@intel.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <0f5ef046-a46c-b24d-8572-775d1fa1b1cf@ni.com>
Date: Tue, 18 Jul 2017 08:34:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500323515.27323.139.camel@intel.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: MWHPR14CA0002.namprd14.prod.outlook.com (10.173.227.12) To
	MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 542d204e-136b-4ea1-122b-08d4cde1ac7a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR04MB0705; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	3:07j1s0HLuu4lbStyVp7oAMUOV8JMNNNy2d7AeuRsZ8lm4eX8dxihN9aeH38bfm0vt5JUvt8SbepqeJ7WKulQtyrPd5DoE7mhtspv8rY+t0X5GQNU+Im4jxQEKNDuniTz5OXy7y0uU7HnOmtYMnrzT7KFQCfKMkK+4HULxw/DAMw6bW0n4JjtVTmhKIPp4ETcb9dmR6T0O7v5W+8cAKiLxoHapnDF37DVoFOwwQk87fBcaVHpXAwoNG8CpVqx8q+Naz9PeXtmEI4DtlJTUcjVZnVp+0T4rAH/Y0r4IIyxAXIJVposWA0s1GkTiH5sP5h6836uhR/Fq5iDSpnxhd0d7rX4mhWQwBSV5ur2cKCSDwVu7TOx4VrV+IOtrJ0yZvTdcAIvYpnrpJqDNZ5lL7sroCQiGy4RcXreKd07zpFF1c/F7lvhMJn94ww5P8CpN0CrChuvANlhamJgSK4pV4RCnpo9VBAtSQ2rQZaHeu7DXRRcc9vboUAdwOHtU1DHAxsvcC3T0hKaY+Ix4XLCbEj/I/yAHGPDyAeWdEPjkWxLkKlK7p1qE7GqCZ+WWe65qHt7hp1SQOLdqPyFo4gqi/gWSb9cdEbI/31mD+11BIDe6hmTDj8Om7JJ6RdGkjwXfu5Arwbu3WeMXhiBGJdzk4+vJFndzQIlzaDVulskmyveJZQ2NWb/VOaT6M/psH55DNyV5KcZMfE3CI3SHb1tP2RiA2F2zEVqi8CbhdzA5lsKRso=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0705:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	25:AcTefEz3AE283EX6u0MMft3mbqdh24/w7X2fyzWG6wp8HIoEJ+PEWNcijN7BjT02RWzPi60BMbv7HbeNTXXxlUncctXTuV/bXlASgyU6cMbW8DrmPUMwj6cgOuaFfE/7b/Jqt44rKO4O4dEaSgR5pID39N8dbHD57WBNBWw4B2iCed9VSJOHxy7CCSvBahx5gkmf4XjzX+oT669HdPK7cYA8IFRFpeYEp8YDKFHw4f9yFhdKZy+jhbIbPEChGMRmgm+WXxuUtgXYBTIMZzXB6YC0iLi+Cl66tv1zEOT5XSjHzQ0yRLOsjighqFFkJm54FeWMbhMClsvWBmxvzMnMFIvWsoZIzQFL4AgcBw3Eq7CMvqVKyeSv8l0Oi+Aysrw5RCPYANZRSTmKynFAVP+V4iJkzubNJMzaqaxIywKuGCJga542fAC5mPhsgaQHpaPRCrPCZ6cmMk1GTP7CsJ0VxybTkGOSIsBw3rTMBMguEYdJ+QQCj3oqHc6+VkOn105KztgPM2+GAz05clleRMPBzaxhJcUXXbMfz7wwkYkF2Fy9kRJsbLGHDOa6zEHn3NAu0c7bYh/96vF+dqOb0eJ6ROLXU7cujBAaaRlOZ9rFBzHEw30em46V5g5hWof1UKIM3k08eXx+UCcAYmwXaLC345TWtM6STNd/0/R/nqC+GCK5J2z5Y60uNy0ExOdb1nl7XH4E/5VpxFP5vSNw5QYMAFIK5dQ0Ix3wzMdfaNkuU9xubiDAN8a7QvbmM3bvIp4EBtRffDo5YYTxhwtCODbqllr9FjFRuO9GAyIJPNn+hitu6F46xHODZ07ccgFdSZ6xO1IVSDmCGfcOvmKyOJEAxffhHgmUTaOKj4jqDUFwqWgwbwZWeTvF6Zov3MyPsrSWcca6UCcDvMX8wISyJRddQTdrt8L6eIXMqr9dLFTOkdI=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	31:PWqG/GSi/oZIzfmK3906VAKy69Kbmc6rQiBhi/BhH27yqQIIwRJ9pDli5u/M5VHzDRW0b8V1miU2mmEacxpfsNtqnX8UNMTmym1G+KHzJ3mZVo6hUEd2Wfzgsq07gDXbGHimwbLESpGnMQRuTwdvBzjpL+52U6gUlgvruL969fq3Ggj/FsQ7NdkpXJqAIdyv3mi40K4UyJwTeSg81iogASjXezEfMTY0ixGZ7aJX9B5BuBoPm5mJZUFZGO1XCWbM6ofmsfG3UXzjWtEDeqpPa1MnlIHX0D7++XNdMFSqikj+ZVxOK2VuecdmDD/PCV7XXjW3VklHH6rnrncbGzhJxok2UKqv8VT8jwUu4uRfhilysqQSxlmXKZ//02MEPcKo3JBEPdED2P6qvi1/kXpvIEl1uVDksHVE8sZzxvOwBmppl5twxm3UTmFlP2Ds+uRpHfu0+/ZeZGcsn6ec/0qCgr3FwyOG43cx69k4rQidMs2pgiPrne5AwQ8nNZNURd/ztPCef/SA5Kq7jEjIlStxDaV4v6SNxqVhFKD1NazAjwOgjShugqmO/H9Y0mQAcX7o3+wS12HpjgYjrat2oeAkoU262m3mmkVoVnyMNwefcAlqpMyhkCg8v+GGoq4b3cX2v1elVj/BlZ7tzTx0+tB64ldfFXXD/0v28pRtl6LQMEI=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	20:gG+Wm47P6h1f+upu3pNjUnjjgTdzH/F2Aj1XwJ/9UZZBQCWdjUX7zI0kQkys6UziRoUeWIIHs7r3FzSJ5VuaJYJ2kVhjFi6iCJvjNIusk5R1VWZ7jB+AChkdAMu6p27KP2JUtRd8KtJbLilgKgo6ULPZD5OOXQf8X5ozfY3Q0+tqpPutHWamCk6PSq69wp8eYEjPiDjyESoYxXFTQHoZdf0REbCKI2S5aypXXhSbega8u14j1yyyLWGuX5g/J2IGbFoY+dR5v4yRvGzBVJodoEap6Ejj3jLbpGiMXouOAtaBgOSaDPHpsf4MmlIClQn8K+N6S1GhcrrgqfEs3MCxnD9Efkk9gWICwOt25WXBaV6cXMiKE6JdB+9yYnIpgZAl6h5LR9ZOhSzKja6QnksspVm1nE1WfJsmBmq9OmF1IJl8awbS7OBKinnkpkn6CCKKAsuTMVqmN3T2Eb5OGUFjrt5jmsBB4sRafjRmZDWMuSelrqiWJtDZAehwnSiQO1bXMvNp3jasfWmvsnvszHyORYUc0eaLbAwuwUb2so00r6YSkCcZ5WbAn7oB83jNAZF6U2LSpb+K06k0k/GR0J4iEqMTIvK9UAmlM59XKHjHbP4=
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(236129657087228)(788757137089)(264703809997249)(148574349560750)(145744241990776);
X-Microsoft-Antispam-PRVS: <MWHPR04MB07056EC1473D46549D9FDCA7E5A10@MWHPR04MB0705.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(2017060910075)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR04MB0705; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR04MB0705; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzQ6MjhaL29xV0txY2hPK2lycWZFM04reWUrVjh3?=
	=?utf-8?B?bWhRVmJpUW5yV1d2TXE2cDFqa2JQdVIvUXk0bWpETmVyQzlwN1d5YmVDMEEx?=
	=?utf-8?B?dS9WSHB1SmttbzRZQXk4S1I4VXUrNUZaVG5kelBlZ3FKZlBtNjJiSEZ6b21m?=
	=?utf-8?B?b0NnQVM1N3YrLzlSZlVhVW9XQjFYUHpIUEhhV3hTcmtyZHlHa2dJTUU5TlAw?=
	=?utf-8?B?ZmpRNURuVEJRNUsxYmoxZ3dZajRFRXBhcGpFVXZhN3RGZi9iTDd5TVd2UFlv?=
	=?utf-8?B?L3hnY1YrZG5ZSHlvYkNQSEhKUGRiV1RhRnRNQWlSV0U0UEZTakEyRmhMWDBl?=
	=?utf-8?B?ZWNoWlNlT0RrQlVKdlRRcHlqNGFlZEZwbkM2MHhVSW14SE1Qdjdzb0xYUVEx?=
	=?utf-8?B?UCtXUHVmSTE4Q3RyZGZ5ZHpGUHIybko5K3FmSitLakhDdDJZUWJRMEtHeW1r?=
	=?utf-8?B?WW42eDhYckxWMGE1MUZPZEdQQ3dTSkhRWEFZL2p5dllObXpTcU1IN2J0NElO?=
	=?utf-8?B?cWM3cE1wNlBCZExxWGVCeE81S0E1aHZWR3JoYlVYRWF2aTRLRE5rdmU4S1Np?=
	=?utf-8?B?dVFEblFGOFZvRHdETy9zSUlBTUVZU0EvNVZtQTB0TjZuRUo0akxnYjFtMlJp?=
	=?utf-8?B?OXF1bGpDUnNFMnByL1JQQkNyNjJnd09vZ0ZDd1V0eW9GZThra3dGeFlDTFd3?=
	=?utf-8?B?aHYrQmJLYmdGZFBzcDExTE1IcEorOHpqeG04c0VYL0hxdGtwYk1sQ2NFWkZI?=
	=?utf-8?B?K0VtcjMvS3h4UWU0ajNZSXFvenBLajRlSUgrTmpwSmxia1lRZThLRE1ZWVZj?=
	=?utf-8?B?RlNkVWdobEdKM1JlZDVBWkIyOFZoZWp5aFEyWk4wVEpiODZ3QVBxOXpZMU5t?=
	=?utf-8?B?TlFJNlBjN0xkRXB5Zk5GU2hZaTRBZjFSR3UrUGMzbWNNWDRYY3pnRWpyTWJS?=
	=?utf-8?B?TjZJR0Z2U2FqRlpLOFVrMFBqcWNha2FEV3NkeHpQamNzemFFUjJNTEJzOWpG?=
	=?utf-8?B?RzMvQkRVU2NSNGQ1RmJSSnIxOXlDM1RlTDlLOGFrRnkvTmM1eWFhUzFoeVNt?=
	=?utf-8?B?NytLQ2xIdjNzR1ZNZVdjb1E2VU1yUllERkVzSVN2bnZBb3hKdWkweGFRMGNK?=
	=?utf-8?B?Vi9nRW9JRmhhSFdkdkYxTkpHNFhKWmlVQ2FDazNBdFpzZjVPRC8yRldzRUE5?=
	=?utf-8?B?WmpvRTVnaTVMa2U5bi9aUnVYcEpvVUltVk9tRDIycHlWaTZ3aWdPWmNKUVZM?=
	=?utf-8?B?ZGtaeXFXbkRTcFp0d3huZ2Zad1FNRnRCVUpyVDlWRnBNcFNWVTVjOE9FcjVV?=
	=?utf-8?B?bmMvQVBQOHE3a2NNek9Wd2tzbm9uKzZlbGQ1YUFJSDJtemtTcnZWSmlTUndJ?=
	=?utf-8?B?U1NHeEV6UXpLdHorRGRLRzRqUkw3SGt3VVVSOGw1MXFHUmUvUjBwQjdZdUdq?=
	=?utf-8?B?YXplZlhDbi8vVW04L2V1cDcyVS91aGRFRURhUkdaMlAvWFY1dzlVK3NjSHpy?=
	=?utf-8?B?Zi9EU2kveXk3bS9vcisyZ3gyb1FRdnJtOHFGZkd6empUY2JmSTZlT3FHYWh3?=
	=?utf-8?B?N2VBRTdBdkNTaVJmaTZvRk0wTC9BN0hjV05oUjhHK0lPRjlIek9KbCtaR1Ir?=
	=?utf-8?B?R3pIVll2Rm10SkVlTUhRVW9RRHovNmFKMWZvTGFJTlpWNjF3QnovNHJza2VK?=
	=?utf-8?B?OWswRmFzK2U5aG5yRW9Sb3FrRUxjWmlrYmhzc1pCSitWOVlvb2hFa2tkc0VG?=
	=?utf-8?B?K21QNmpZWWxNTmVhd29zaWJHOHcrQ2RJTkxZS2hzNmlDOFZSTlVCTWJGeGg4?=
	=?utf-8?B?Zk5SMXd1aTVmUlZJVmxHYWpxN3pudkt5SW4vdGd4MG51bFYrNmRla01rY21k?=
	=?utf-8?Q?ueZ9loP+Cz/7q9Xj4vlMKKXhBm1HBXP?=
X-Forefront-PRVS: 037291602B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(7370300001)(4630300001)(6009001)(39410400002)(39850400002)(39400400002)(39840400002)(39450400003)(377454003)(377424004)(24454002)(3846002)(6116002)(478600001)(6306002)(6506006)(66066001)(7350300001)(1720100001)(65806001)(33646002)(229853002)(50466002)(31696002)(86362001)(54906002)(7736002)(4001350100001)(2906002)(6512007)(19625735003)(305945005)(230700001)(6486002)(575784001)(83506001)(189998001)(5660300001)(65826007)(76176999)(23676002)(54356999)(50986999)(2501003)(42186005)(31686004)(47776003)(8676002)(53936002)(53546010)(4326008)(36756003)(38730400002)(6246003)(6666003)(2950100002)(25786009)(966005)(64126003)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0705;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzIzOk5yQ0llMGFKVk53SDJYTlhpc0ZWcERZd1pv?=
	=?utf-8?B?bnowc0hRcGx5djJFcUJVZzJrKzhMNkJCVXRRaWhtQUxKRWx3V3dkRWVzN0xr?=
	=?utf-8?B?Q2p5RUp5MzRIVFgxdkRMeldFK3VLbTh5aUhSQjljbVpuOEo5dGtjWUxPWXJ0?=
	=?utf-8?B?NmZyY0Y3ZzdRWVNST2hNOThxelhlcjR0ZzZESG91RCszU1hudUhmeDJoZUVE?=
	=?utf-8?B?SWhCeG1sN205Smowa2RQMHRrZk95cTh1VGYxN2w1d20waW9xK3VOdlNZT3V3?=
	=?utf-8?B?b3ZBOG5kdE0vVWtMcmpWNGVvWjJ3OVVrNFlUMEgwUzZ2Z0N0dHRMcGpJUUk5?=
	=?utf-8?B?Vk0vaXZtYjAzOE1UQW9taGRPTi9YNVE4bkpIZG1TRHIzSk1XdnNvUW50VHgy?=
	=?utf-8?B?ZWFxWDVlb01odVNJNldVem0zWWtEVDFOK3YzVlJKMGpLbWxpMjZaRmxFQng2?=
	=?utf-8?B?elNyQkZEN050UWNOT2d2QUxwZEhzdTk4UW9EWDVxa0QvaGZZS1lsdC9lR0pI?=
	=?utf-8?B?VVV1WTVrL2dLNkRYbCtKcDZTVDVIeWcwd2RONDFPc1dISG9LOGpDTXBYTUE1?=
	=?utf-8?B?Q0FjRURCSFgyZHg3RzNrMVdNekQxNVhHeFJWZjg4empJRStXU2FsUUh5WEY2?=
	=?utf-8?B?NVp4dEV0YVhhdWYvQk4vbTFXNlArdGFXL0lTNVQreW5EdGpGOWFuQkk5VllJ?=
	=?utf-8?B?dzduNys5ZkJUUTRnUmlRRjNWMTc1MzVIanVxazdZOEIwUVlZNzl3VnNtV3ky?=
	=?utf-8?B?M2M1bC8zZENWZ2lOZmVGRkkwLzFoTHBadCtzeGNxb1lSUTI2TFEvWjJQS2pj?=
	=?utf-8?B?U3A2c2QrUnRjd00zV2orQkpYc3pPTlllaHhUcVlKN3FxdWNwbkZQMHJpN0tK?=
	=?utf-8?B?cWU5ZFVhZmQvc05aQkxOTkRtYmhlTjMxaVZKZXRHQnVhbCtCVGVrVGM5U05I?=
	=?utf-8?B?UVpNYmVQckZGYUgzR0tjT1hLQ3dxbk96cFFhNllwQ2NVbEh6SmYxTlVrcnNV?=
	=?utf-8?B?b2gxZmI2NWlMN3lWUEE2YS9Ca0N6YlpNQWhqM21iemF6SW9qMGVpeWhXeTBu?=
	=?utf-8?B?SlYwQmxEaVlXdWMrb3ZPRnF1dkRodHlROUxmMkV5U3JhRk5Vc2V0OXVJaUdZ?=
	=?utf-8?B?S3pycHU3ZStqM0YrRFV6UTc0aTk4Y1dBTjRhZ3VxbENkK2JSSklDUHpQdjhG?=
	=?utf-8?B?QzlpMm90NUhvOU1PU1ZNZEJQUmVpL3NUN1JoVGpSNWI1ZVAvY0JPK25xT2Jk?=
	=?utf-8?B?QXJ5S3NrcUFGWUhwdDdyZWZTU3NKc3c5eE1HQWNtVHdQOHE4NjdqQXF6d2Vo?=
	=?utf-8?B?Z05ZT29UM0xUazdPZXVBOVJjMFZPS2FwM2tlUnRnQkNUMlNTRTA0U0lTN3FD?=
	=?utf-8?B?NUV3U3piclNJSGc2VllMS2U5VHdlSzZCZDJkMktKL3I4U3hBVkZsY0dIQnJV?=
	=?utf-8?B?V0taNGVoUm5rTHBOQWdZM3hhT2c0MTkvT2VraDM1V040Q0cyNC96UnRONGc4?=
	=?utf-8?B?N2FUT0lPUm5yNUo3cWlkSU5FeUpTbGtmQlhwa2xsdEg4WFNFeDNUZjdRWHhy?=
	=?utf-8?B?RUE2ZEdkK2I2OFBPT3p5b0RkcmJya2laeXEwSWFpMmVSWWZRdGxPaWMwQTYw?=
	=?utf-8?B?UTlEdEc1QlRUQnhpMlNVQk5rWWZ5eHZnalNqOVYxNFR2d1dKeG1Xc2xVcFZN?=
	=?utf-8?B?c2RkcHh3UkJqSkNpclR3Nm56VWlmQnZyUlFxT1dvNWtDL01HTHdXK1U3eklD?=
	=?utf-8?B?U3hLMzBLWnpqM2pMN3hRQW9aVUMyY1VwYm1qdldYbE04ODFyVUoydWhsaXJt?=
	=?utf-8?B?dko1M2J1Z1h3OERSV2JtOGhDR2J3ZmhhUkFwODMwc3lueXlIZ0tLK3RVRVFq?=
	=?utf-8?B?aVI5aXBkQllhVGtKVi83dTJXSTNNdjQwblRXWnFFTVdrMTZ4UFRJZFZ4UmZO?=
	=?utf-8?B?NTY0UjhpSmJHSVlVM0xweHd4UkdGYlA0S05LaFpPdnNZaWIzR1lmZ2t6Wksx?=
	=?utf-8?Q?aR1r2B?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzY6SGJ2MDNUK0Z4OG1PWGoyc1c4b0QwQkVYU2ZQ?=
	=?utf-8?B?NldObHVuQXZBQVVjWk42UDkxU1BJZXdGUnNPei9KNjNsWjhwd2l0RVBKNVBk?=
	=?utf-8?B?UTM5OThIMEhKdW5XZ016a3hQZ3JEaWhoSjBsYVNjbmFVSEtId09IZHFVd20v?=
	=?utf-8?B?NVdaTFVXN1d1eUJPdFVQTnVxRkdLL1VRKzFCMWlwZlFoTG5BODk1Q1h2eXlq?=
	=?utf-8?B?VEhMdFlZQ1hnQVJGWWJxbkt1ZTlENGxZNnp2SFZHOVRZb3dBcGZjWjdOUDlU?=
	=?utf-8?B?ZEFyV0dNZ3hTUFd4N051dEZxRzk5ZHQ2Sm5wQVY5aisvZjh5VzhvZno0RE9B?=
	=?utf-8?B?OEMvQ0pJV2I3VmJOdkhoRzZhMWtVZElLekZBVFk2UTJLNVZJWXI5bU1uQURh?=
	=?utf-8?B?WkVVVStCdVBIblhoN2JhcGhTMi9lM1RBMWZnb204OERuYnZIdjlGMm1UWG12?=
	=?utf-8?B?aGdHYzBIdjF5UTlreUlzSG5LVG0yNFZDYTJqSGhoRUhCOTVQWnJsZEVXOWlu?=
	=?utf-8?B?OStjdXJSQTNwWW1KVWpWeUFhdC9MemVOV2oya2d2bDNIOGh5a1FwSitoZWF3?=
	=?utf-8?B?d1lMOTBQUHJOZEEzUDhqSHNBUEI5QjhVa21LemFKMk1QS3l4TFFnb1lGYlNn?=
	=?utf-8?B?UHM4cTQwN3B1RVozYWxuZW1rNXp4ZStqa2NsSklHLy9YSnpHaWZKaCtnK1Zx?=
	=?utf-8?B?T0ZxUm42dUNxK1UyK3N0K3hJU3BRTElzOStrajVUaWNHekxxZHVMZHRwRXd0?=
	=?utf-8?B?SHZQcXJZbElrN0xuRFFtbmwzbmFNRjhSN3lyVFN4dzZFNEYzR3hGc0E5bE8x?=
	=?utf-8?B?Q3ZNN3NvTndYTDVaMTBrekI5VWpsMTQrTjR2N1Y1QUllaW1haWt4eDRiQURw?=
	=?utf-8?B?R0lYZERheWppNHRUVnFycTFSaHRsNlIwRUM3aUN4bGJUZGxUcVhHTzN4aUcz?=
	=?utf-8?B?K01jbjFrS0NwSWVaSEI5em01dVd0em1HaGQyRTRkL3pabFBIN0x2OFNzekpN?=
	=?utf-8?B?dTI4VlF4SFdEQ2VUSFk1eTBJTllzK09LMnpWRnlvZ0s3eW9JWGY5WDRVZGpj?=
	=?utf-8?B?NzJ6c0ZPSlA0UDZzWWppNnNKQW9uMmdmTzM1cnhaN2xIUnNYWnRTOU81dlJT?=
	=?utf-8?B?ZkVhZFA4NTJqbmRyVVpmaDJEViszYWtUT1V5M3M0Vk9rMFVEMFlya3NDa1RK?=
	=?utf-8?B?NUlUUjF0aWJvaEdtYysxUFM0VFpjYXlMdi84OHhCK2ZyRVRSWVN1enVPMTQ5?=
	=?utf-8?B?ZHV4K2RzZ2VENVlIL1BRdlh2QmlEcktVRDVPU2JMbUtuYkM4enBhWURWd3hI?=
	=?utf-8?Q?AgWZ/8gBPKGUjLGBun9PzmV45ABXVVE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	5:BDqRS+vg4+MXMB5ceJotrvL2vur3VnpePbWYz55xgKrUgofh/tO9sn46wpjsvD2HAGWNPPBmP6GSszYHRL9Tf70Yo5+ES/bAhTFmgu30IGIcraVtjGYOyXGaO54EVQuhw/IiwgdKsEvme486o7vkbyXbWiVqzDnv152vZicO+9jeccvaC6iUXYhlMcd63qVidO+dS0rcGl4hM7i3KdhrhF9RI/+ecftNQ8g1zhDTsaCd7KbmN6VF+UcOO842jYswVO8zavBqMfUPC5wr99mJaCU4M7Cm3/F6Y4B/JSQG+UnlJFBb8vxqPGY/xCCxwzKGnPPknNkf1OF+N4Nj7TeEupJ79PYh/OZAj5zwgVb5kOhDwej6Ujdvs8vjEj6KtrPf0MAH9Sju2y6gugO/i1LCgtTJX1USSR/tG2HY2CFCEOvy6vwVENJV3ZgAIAqK6NHKmW9qYYgxujiKgLWH0HRjBUCK5thYQRqsxpuunc4JgUGPHm8OWEgxLEVqTpNuw5eY;
	24:hltzMj+rcZ9qP8z0kbj2ZmEuYKLProQsJWBL72Aa7cQggN5ksdO/jt81a4VEOa/dYJWp9egXVgRr0yy9GLOpir+L9Wk5DUK7pGVaggyxAag=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	7:bPBwSy8gHt+CX1GJ6nWej0EFKMsHiVfn0oijmNKO5zoSh5wVOokxb99rkmPUct+lyqZIfxjU0C8sEOVItcuk2ifirNutmeF7H5eD+E+8qvu/F/ROEymxMhMjrqU52gg4r6s863zaVOclnBZ99vO35faA3FJFezLJMOhXg2Xj3fIq9B3/BOCRz4m7iTfWOKCPdck3Vpwk2Vk4YaumFyjqFdf9HGP67f29qsynVFrJr/Hh7Z1s9Ka+i7ihIIEZdoyoP70dmf+YVIsCSVE1H3WnEccbRXIimVb5fnyrTn24Zq3ggLhxuCiew+9Cj8WEEgh8BsoO5jdQLZ4Zzzab1/Rw3ecJAVa4GP87FtPXkFxGdsXC3XuE+qe+vsPdzrfgjS9j207C+fcFpJIln5o9sIL4CkFvdOBahezO9rGM47N1mMKxhogZrURtrh//LyWFZqdjFDnOqc3o8asJqYIhQwNdxeEUQsyIVnUTsvDWGLCyFhdwGzYwHToRXvUymq3JSCUDpct/edze5Kvkoh9OeDZwp+ZYcVclwftKutgnN8cokdPJS7kjhVzuKOx6WLmgZgsj1QEjGzDkZ2/FtOJrY/AwmTMd3SlvzXzlpbHk6CfbOXJlyolYtC4VKHcON1/0WK6q2dWpqnHkMEg61b8vKfzGTnwtwicTlEdHHFz4/A42rGgpkP9sNOiPcispHe1WH/XhPCXZXOlysB6YKCmeArrGlB5aGM/D4wTsZunWxRUMrN7juHiB0mIsr9WzXARcGoqCoxLptu2MDOYvdNipPvOXg3iTESp4xxt/9bUNotjX3Ik=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2017 13:34:10.3911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0705
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-18_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1707180213
Cc: "josh.hernstrom@ni.com" <josh.hernstrom@ni.com>
Subject: Re: [PATCH v4] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 18 Jul 2017 13:34:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/17/2017 03:31 PM, Wold, Saul wrote:
> On Wed, 2017-07-05 at 12:33 -0500, Haris Okanovic wrote:
>> Some distros may want to provide alternate kernel "flavors" via feeds
>> or
>> within bootable images. For example, readily available builds which
>> provide certain diagnostic features can enable developers and testers
>> to
>> more quickly resolve issues by avoiding lengthy kernel builds.
>>
>> This change allows for building multiple flavors of the kernel and
>> module packages by templatizing kernel package names via a new
>> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to the
>> old
>> name of "kernel", but can be overridden by certain recipes providing
>> alternate kernel flavors.
>>
>> To maintain compatibility, recipes providing alternate kernel flavors
>> cannot be the "preferred provider" for virtual/kernel. This is
>> because
>> OE puts the preferred provider's build and source at
>> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes using
>> the
>> default KERNEL_PACKAGE_NAME="kernel" follows the old semantics --
>> build
>> in the old location and may be preferred provider -- while recipes
>> using
>> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and
>> don't
>> provide "virtual/kernel".
>>
>> Testing:
>>   1. Prepended `KERNEL_PACKAGE_NAME = "tiny-linux"` to
>>      linux-yocto-tiny_4.9.bb so that it may build alongside
>>      the main kernel.
>>   2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel
>> flavors.
>>   3. Verified image and modules IPKs exist for both:
>>      tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>>      tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-tiny
>>   4. Verified linux-yocto is the "preferred provider", and was built
>> in
>>      shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>>   5. Appended `CORE_IMAGE_BASE_INSTALL += "tiny-linux"` to
>>      core-image-base.bb to include both kernel flavors.
>>   6. `bitbake core-image-base` to build an image.
>>   7. Verified image contains two bzImage's under /boot/, with
>>      "yocto-standard" selected to boot via symlink.
>>
>> Discussion thread:
>> http://lists.openembedded.org/pipermail/openembedded-core/2015-Decemb
>> er/thread.html#114122
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>> ---
>> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to
>> the
>> "work" directory in alternate kernel builds, instead of "work-
>> shared",
>> so
>> that the two builds don't clobber each other.
>>
>> [PATCH v3] An updated version of this change rebased onto the current
>> OE-core master. Changes:
>>   * Remove PREFERRED_PROVIDER check in linux-yocto.inc in alternate
>>     kernel builds, since alternate kernels aren't the
>>     PREFERRED_PROVIDER for virtual/kernel by definition.
>>   * Remove "virtual/kernel" from PROVIDES in alternate kernel builds.
>>
>> [PATCH v4] Another rebase onto master; no functional change.
>> Improved description and testing steps.
> 
> So I finally had a chance to get back to this and test build with it, I
> saw the following WARNING, which lead to the ERROR:
> 
> WARNING: Variable key FILES_${PN}-dev (${includedir} ${FILES_SOLIBSDEV}
> ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig
> ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la
> ${base_libdir}/*.la) replaces original key FILES_linux-yocto-dev
> (/boot/System.map* /boot/Module.symvers* /boot/config*
> ${KERNEL_SRC_PATH}
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build).
> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
> do_package: QA Issue: linux-yocto: Files/directories were installed but
> not shipped in any package:
>    /boot/System.map-4.10.17-yocto-standard
>    /boot/Module.symvers-4.10.17-yocto-standard
>    /boot/config-4.10.17-yocto-standard
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> linux-yocto: 3 installed and not shipped files. [installed-vs-shipped]
> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
> do_package: Fatal QA errors found, failing task.
> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
> do_package: Function failed: do_package
> 
> Something seems to be causing the FILES_linux-yocto-dev info to be
> overridden, I have not tracked down the culprit yet.
> 

`FILES_linux-yocto-dev` is set to the default value from OE's 
bitbake.conf. `FILES_kernel-dev` on the other hand is set by 
kernel.bbclass; when `KERNEL_PACKAGE_NAME` expands to `kernel`.

I think the real issue here is that QA checks care about 
`FILES_${PN}-dev` at all even though that particular package name isn't 
listed in `PACKAGES` variable. I.e. `FILES_${PN}-dev` should be 
disregarded since the `linux-yocto` recipe doesn't create package 
`${PN}-dev`.

Thoughts?

> Sau!
> 
>> ---
>>   meta/classes/kernel-module-split.bbclass  |  9 ++--
>>   meta/classes/kernel.bbclass               | 85 ++++++++++++++++++---
>> ----------
>>   meta/conf/documentation.conf              |  1 +
>>   meta/recipes-kernel/linux/linux-dtb.inc   |  2 +-
>>   meta/recipes-kernel/linux/linux-yocto.inc |  2 +-
>>   5 files changed, 59 insertions(+), 40 deletions(-)
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass
>> b/meta/classes/kernel-module-split.bbclass
>> index 1035525dac..9716c5937b 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -30,7 +30,7 @@ do_install_append() {
>>   
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>   
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>   
>>   KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>              postfix = format.split('%s')[1]
>>              d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
>>   
>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>> +
>>       module_regex = '^(.*)\.k?o$'
>>   
>>       module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>       module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>> -    module_pattern = module_pattern_prefix + 'kernel-module-%s' +
>> module_pattern_suffix
>> +    module_pattern = module_pattern_prefix + kernel_package_name +
>> '-module-%s' + module_pattern_suffix
>>   
>>       postinst = d.getVar('pkg_postinst_modules')
>>       postrm = d.getVar('pkg_postrm_modules')
>>   
>> -    modules = do_split_packages(d,
>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>> output_pattern=module_pattern, description='%s kernel module',
>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>> extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>> +    modules = do_split_packages(d,
>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>> output_pattern=module_pattern, description='%s kernel module',
>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>> extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>       if modules:
>>           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>           d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> diff --git a/meta/classes/kernel.bbclass
>> b/meta/classes/kernel.bbclass
>> index 7670c7107a..7fa4509961 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,6 +1,8 @@
>>   inherit linux-kernel-base kernel-module-split
>>   
>> -PROVIDES += "virtual/kernel"
>> +KERNEL_PACKAGE_NAME ??= "kernel"
>> +
>> +PROVIDES += "${@ "virtual/kernel" if
>> (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils
>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-
>> alternatives-native"
>>   
>> @@ -33,10 +35,23 @@ KERNEL_VERSION_PKG_NAME[vardepvalue] =
>> "${LINUX_VERSION}"
>>   
>>   python __anonymous () {
>>   
>> +    # The default kernel recipe builds in a shared location defined
>> by
>> +    # bitbake/distro confs: STAGING_KERNEL_DIR and
>> STAGING_KERNEL_BUILDDIR.
>> +    # Set these variables to directories under ${WORKDIR} in
>> alternate
>> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so
>> that they
>> +    # may build in parallel with the default kernel without
>> clobbering.
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) != "kernel":
>> +        workdir = d.getVar("WORKDIR", True)
>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>> +        artifactsDir = os.path.join(workdir, 'kernel-build-
>> artifacts')
>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>> +
>>       # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>> KERNEL_IMAGETYPES
>>       type = d.getVar('KERNEL_IMAGETYPE') or ""
>>       alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>       types = d.getVar('KERNEL_IMAGETYPES') or ""
>> +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>>       if type not in types.split():
>>           types = (type + ' ' + types).strip()
>>       if alttype not in types.split():
>> @@ -53,22 +68,22 @@ python __anonymous () {
>>           typelower = type.lower()
>>           imagedest = d.getVar('KERNEL_IMAGEDEST')
>>   
>> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>>   
>> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest
>> + '/' + type + '-${KERNEL_VERSION_NAME}')
>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
>>   
>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>> typelower)
>> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' %
>> (kname, typelower))
>>   
>> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-
>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>   
>> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
>> '1')
>>   
>>           priority = d.getVar('KERNEL_PRIORITY')
>>           postinst = '#!/bin/sh\n' + 'update-alternatives --install /'
>> + imagedest + '/' + type + ' ' + type + ' ' + type + '-
>> ${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>> -        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
>> +        d.setVar('pkg_postinst_' + kname + '-image-' + typelower,
>> postinst)
>>   
>>           postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + '
>> ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
>> -        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
>> +        d.setVar('pkg_postrm_%s-image-%s' % (kname, typelower),
>> postrm)
>>   
>>       image = d.getVar('INITRAMFS_IMAGE')
>>       if image:
>> @@ -126,9 +141,9 @@ base_do_unpack_append () {
>>   
>>   inherit kernel-arch deploy
>>   
>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>   
>>   export OS = "${TARGET_OS}"
>>   export CROSS_COMPILE = "${TARGET_PREFIX}"
>> @@ -371,9 +386,9 @@ do_shared_workdir_setscene () {
>>   
>>   emit_depmod_pkgdata() {
>>   	# Stash data for depmod
>> -	install -d ${PKGDESTWORK}/kernel-depmod/
>> -	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
>> depmod/kernel-abiversion
>> -	cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-
>> ${KERNEL_VERSION}
>> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>> +	echo "${KERNEL_VERSION}" >
>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-
>> abiversion
>> +	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>> depmod/System.map-${KERNEL_VERSION}
>>   }
>>   
>>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>> @@ -388,7 +403,7 @@ do_shared_workdir () {
>>   	# Store the kernel version in sysroots for module-
>> base.bbclass
>>   	#
>>   
>> -	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> +	echo "${KERNEL_VERSION}" >
>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>   
>>   	# Copy files required for module builds
>>   	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> @@ -486,28 +501,28 @@ EXPORT_FUNCTIONS do_compile do_install
>> do_configure
>>   
>>   # kernel-base becomes kernel-${KERNEL_VERSION}
>>   # kernel-image becomes kernel-image-${KERNEL_VERSION}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-
>> dev kernel-modules"
>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>   FILES_${PN} = ""
>> -FILES_kernel-base =
>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> -FILES_kernel-image = ""
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>> /boot/config* ${KERNEL_SRC_PATH}
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>> -FILES_kernel-modules = ""
>> -RDEPENDS_kernel = "kernel-base"
>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
>> ${KERNEL_VERSION_NAME}"
>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>   # Allow machines to override this dependency if kernel image files
>> are
>>   # not wanted in images as standard
>> -RDEPENDS_kernel-base ?= "kernel-image"
>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNE
>> L_VERSION}')}"
>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSI
>> ON}')}"
>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> -ALLOW_EMPTY_kernel = "1"
>> -ALLOW_EMPTY_kernel-base = "1"
>> -ALLOW_EMPTY_kernel-image = "1"
>> -ALLOW_EMPTY_kernel-modules = "1"
>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>> -
>> -pkg_postinst_kernel-base () {
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-
>> image"
>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@
>> legitimize_package_name('${KERNEL_VERSION}')}"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNE
>> L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitim
>> ize_package_name('${KERNEL_VERSION}')}"
>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-
>> ${KERNEL_VERSION}"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
>> package"
>> +
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>   	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>   		mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>   	fi
>> @@ -521,7 +536,7 @@ pkg_postinst_kernel-base () {
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>   
>>   python split_kernel_packages () {
>> -    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-
>> firmware-%s', description='Firmware for %s', recursive=True,
>> extra_depends='')
>> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
>> description='Firmware for %s', recursive=True, extra_depends='')
>>   }
>>   
>>   # Many scripts want to look in arch/$arch/boot for the bootable
>> diff --git a/meta/conf/documentation.conf
>> b/meta/conf/documentation.conf
>> index 35b9103b4a..e061b98de3 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -248,6 +248,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel to
>> build for a device, usually set b
>>   KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a
>> device, usually set by the machine configuration files and defaults
>> to KERNEL_IMAGETYPE."
>>   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
>> auto-loaded during boot"
>>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the
>> build system expects to find module_conf_* values that specify
>> configuration for each of the modules"
>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
>> Defaults to 'kernel'."
>>   KERNEL_PATH[doc] = "The location of the kernel sources. This
>> variable is set to the value of the STAGING_KERNEL_DIR within the
>> module class (module.bbclass)."
>>   KERNEL_SRC[doc] = "The location of the kernel sources. This variable
>> is set to the value of the STAGING_KERNEL_DIR within the module class
>> (module.bbclass)."
>>   KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>> configuration fragment. You use this variable in the .scc file that
>> describes a configuration fragment file."
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-
>> kernel/linux/linux-dtb.inc
>> index 0174c80d85..da6467bf9f 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -4,7 +4,7 @@ FILES_kernel-devicetree =
>> "/${KERNEL_IMAGEDEST}/devicetree*"
>>   PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
>>   
>>   python __anonymous () {
>> -    d.appendVar("PACKAGES", " kernel-devicetree")
>> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
>>   }
>>   
>>   normalize_dtb () {
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 637506a2a8..4e0ce029da 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -12,7 +12,7 @@ INC_PR = "r4"
>>   # PREFERRED_PROVIDER for virtual/kernel. This avoids network access
>> required
>>   # by the use of AUTOREV SRCREVs, which are the default for this
>> recipe.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>> d.getVar("PN"):
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN",
>> True):
>>           d.delVar("BB_DONT_CACHE")
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>> (d.getVar("PN")))
>>   }

