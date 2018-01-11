Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0041.outbound.protection.outlook.com [104.47.40.41])
	by mail.openembedded.org (Postfix) with ESMTP id 24A017872E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2kB/NGZBDgBs33feQCwtSKqgnMkIi43S8oRK0n/CMM8=;
	b=NqgBBlojLcYVMnLNa6vBp7CJtzo2Q5DC4/cezKIDRc9/ZHd+IQgXeNLBNz1LePul7O6LL8hOyKUcIwhrGsYkFaVflg283bANG4IxPSpyGD/EWr1nnW06+8p6S6/D6zDwWMHd8l38oZ9oyqHPzYmsA05m9dcont+YAS8S7ESeAHk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Thu, 11 Jan 2018 19:22:07 +0000
From: Martin Kelly <mkelly@xevo.com>
To: Jussi Pakkanen <jpakkane@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
Message-ID: <aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
Date: Thu, 11 Jan 2018 11:22:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR20CA0019.namprd20.prod.outlook.com (10.173.136.157) To
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be1412ff-8ed3-4629-3b4d-08d559289b29
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020070)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	3:t8/b0AapGELod3lGESoTKrUSVVI6/raJEz7JJiv7cfxR5fs81VnSpQJ6sgm2yU4TWFYYHPTG1d3FfKUC23ePtC72amHhqoiEg9ixg1AUOg33/qgZcgjndHo2SecyBF3aCQ4dhkcOa6OJzaZpBPnWfq31MBg6ud6/WPPr8BjDi3El94jzx3D99fzKxcz6kVsOSlK/csCgsqqDHxMElRbzg+cexUJYX+CuwQrotfUcUmHuX6QfZJBDa1K7MG3H55yw;
	25:a1P8a/r6PJFhJsPfEFilL9xjlycrZomopzxMEkhMJB7F8UW9H8EZAtLx2P2Qy1NQoL9NriVFs9S8OQN6AT1mpsLXF1kGqiU/HrTtFW6auq6ums4zMA+E0EB1CezJG40+FIG4czRZu96FGXAgIw+u7tjDxJ3xNYIAOg3SPDY6fIYFRCTrhcXjjOpIpK3PT3jXY+aOqRRuLgOaFMQsIkMy50LZFqOhIk60e4UX18HmPuKxz41z+8BKI5KaGndIyKFmrL7jXYZVEdGcwapmJohYPYArdki5LNGJYCHDHTB4IjzO4p9kAnU8c+q2SZfGb4Fp0KjjtqvxGS/6jwitCzN8XQ==;
	31:pu6XFJj+LGbseLZNF4Ju+KBQTf9AxWfPKpEjuO0XeUABz76ZJ+Rt1Eo7Pw57WtOy3Ljn05zpFIrgvBJ3vv8emWzj+Keia2Kmsu0sigNsa2pN0dW3cJUNZ7SDPTxJYMi0Xj9UmlR7UVxIW/DK+Wq+/qloLINplIbTL3sRq0jby3wNId08ni++A/Ccmo1U/0SVj94jmQWwYk8cPuZBsuzryCuo/QI7KejKr1g+SqvtoZo=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2931:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	20:JhecJhDMOwj4MD6LVYeRvLGSfdruMd42k2moH36hcCkLPgvzkET9qoG+RPVr35/gADh7A0zBIETSmYIIa2nkuk3waaUot6b3YNFu7KtbgMl7hDmFeIuJFiG3PEcmxF1TvjPoZdSAPOJuPxf6Zc9dsg2WHfQ7udYtHUPVB57R5WpHFABZb/34WBhvfsXAQhRfb25CTGLQIZhEcdedJ0xLekSUu+wsxOc49zXK1oxrrXEi1wrEmfEdf+ORQR3i3Fh9L+/urhw5CZV3oJCCzO/UME6Zf5yxdqhnpzjEBrpY27pSPY8RvTyX6ylxbc5B4cViQXfYr8joXFjOn4s8etlMCmGksU3iMLdoHlby35IDKrkqPrLcBNJxIOwyquLN8k6p75qcANEZq+3Oy7411Yp+cfNq4R1AB5p/B5uHqsrvzfA=;
	4:SjdofB1uLeMqtpDZxanaNF1NUA/wL3Fyln96Ch9V8nB7akolY5svAVV62C+iTiW/pHu4nYWSUoX4S4OCJU591tIa5+3nRs2lDVPuAfDkvBcn6wn/Mo5w0gkH54ClMkkmABjtZbW7ZJ2rDSrolLjw5RZCzeqUobYZdYB9FaGe916P6clefYnbgC3yLobxfOWncL6EHTgh/2XIKkUX4BBLngLRAubjGoTqhA9hUlCRN+JXCW7gPDh0dzD332Dd0vt/b8DzA7w7R6scEpAxIGejJQ==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2931E73B10B62F07B8912B1AAB160@BN6PR0101MB2931.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231023)(944501134)(6041268)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2931; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR0101MB2931; 
X-Forefront-PRVS: 0549E6FD50
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(366004)(396003)(39380400002)(39840400004)(376002)(24454002)(199004)(189003)(16526018)(31686004)(67846002)(52116002)(4326008)(25786009)(39060400002)(6666003)(6916009)(52146003)(65826007)(106356001)(23676004)(50466002)(8676002)(86362001)(53936002)(76176011)(81156014)(2486003)(31696002)(6486002)(386003)(305945005)(105586002)(1411001)(64126003)(68736007)(77096006)(2950100002)(6246003)(47776003)(53546011)(230700001)(478600001)(7736002)(3846002)(90366009)(2906002)(8936002)(316002)(229853002)(93886005)(66066001)(65806001)(6116002)(16576012)(58126008)(83506002)(97736004)(54906003)(5660300001)(65956001)(81166006)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2931; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7MjM6aE1Ja0pKOU5JbjlPNk95Q0o2blZWaFNm?=
	=?utf-8?B?eXMvSVptZjF2cU5qYjBvMDV1b2R6blhXQ2UvMzI2Sm5EMU9oaUJOZU12bUxP?=
	=?utf-8?B?aXo3VExnbmVPWVJ5Sk9FLytlYm1mVlNiZW9HcWlTV0tZZjJ2Z1Z4cFdYSFor?=
	=?utf-8?B?ejB6eHZqanppK3lSUzhPdWVoZDZXc1JzMGFJWkJWYWwzMDZVeW9RWk53MXNh?=
	=?utf-8?B?WmtOV09jeGFTOFIvMjBjVlJ0TUgzSlVNNlBjT2dwdlp4Q2IrQnIxTXVaY0ZW?=
	=?utf-8?B?b2RUM1FMOTRIbkEzT1AvRjdnMWNGc3hubXRMNmhvREZBbnpJYUlCS2U0Tjc2?=
	=?utf-8?B?NEpQbGVrY20xTmc5Y2diSHRlMFpZeHRiZnBvTGlFSkI5RG9QUDVTWkRwSHJs?=
	=?utf-8?B?Rk9mVFdwcmV5NHBDV3A0amt1RWdhYWs4VHlacXUzQ3MrTnNldUFCbmpDTFlR?=
	=?utf-8?B?RVhKS0RjVnNjWkZodlBTNFozajE1WHZCYm93T2toVFZRS29ndnp1bkovSHRM?=
	=?utf-8?B?SnNTT3UyVzFVTGNqeVlEelpBK0RIdW9sNTdaMlg1YnB0ZlY2cFNYTkNvaklo?=
	=?utf-8?B?bG1OMnZvRFVaM2tNRTRjUDRRTmZxYkR1bllBVzI5TlExenBoSUk0cjZpZElS?=
	=?utf-8?B?SmlVUm96TGxGS25rMjJLc09EcE8zM0JWMHNWUUFXY3NNYm5LMHEyZjBTK2tk?=
	=?utf-8?B?cWVhV1ZEbEh6Y1RxOU9lUUYvVmRaSHlQelZFSGwxbVBZenhMcS9ER2k5aGhw?=
	=?utf-8?B?VS9DdkpEb0pCcXNXWHVpd2FIWE9pWUYzOWR2dVpFYTdnbHBPbUdxOWRMcWtY?=
	=?utf-8?B?dngxUmNwYWJuamlkalcvTkh2MTlwVWJtTTZHOVp6VlhxdnBmYjJYUUJiRG5o?=
	=?utf-8?B?V2pCckZkYlBCeVJ3UmlIb2xvWDJPK1ZIYkc2TndGRTdDVmpFVjZwZTkvNmhm?=
	=?utf-8?B?d0llZ2xrNVNYRHdrT2JXa1JlUlZZZDBLaERFaE45VWRXWFRxWFNzRzlkZysy?=
	=?utf-8?B?QjJmZDNzek03VjczVXJZQlVqT3kzSVRFME44dEo1WUVFMnFZSWpMNCt6N1g0?=
	=?utf-8?B?dmpUVUJZN3hIN3BGQ3dIWnhPTWJOS1Q4OUVSY3cxZlFjcVpZZEd0RHpxVndR?=
	=?utf-8?B?eTBXOXdzc1VXYVlTSEFhcTdnWUVsR3Z3QTBaamMzbUM4eUlkVnBtcXBrWVNN?=
	=?utf-8?B?V0R1cis1emM3T042MDVQNXZlaFZ4VWYvblNFQ1ZEcmZOQVpLdUl2eFEyN2ZV?=
	=?utf-8?B?cTI0d0JUMUNuRHJVOUVmTjNqNXRMMEVxbk1XWDFsTHRkZHVQamJubEEyK1A1?=
	=?utf-8?B?Y1laUko2UVVzVE9WMERXVTI3RTREYVBnOFM3dDNDT3FuVEhGQnhIeEJXQUdx?=
	=?utf-8?B?c0lQMDJBV3c1SzFuWENwUzhWM1gzWHpQdGdUVVFvc3d5Y05lT0ZpYXVNaUpr?=
	=?utf-8?B?VkpBQ2NMakRXcVBreFB2ZFNkTjZtUkdSa2duYTJ1NGtJQlBERFQySTBsRWlS?=
	=?utf-8?B?SmRaZXN2UmtrQ282UExsNzMyOHFOOHhXcHJvcElvTXUwTDFzcGFIdm1JamVE?=
	=?utf-8?B?QVA4ODBvbkpFSWVqcjdpZ2xQakludmhFcDNRQTlnQU10TFdoWUcrOUhtNEpW?=
	=?utf-8?B?cHdXU29TYlB0SUQraEZJT2N4aENvaFFzcklYMUQ2elhrQ0FTUnp2c0RBSCtN?=
	=?utf-8?B?VlUyNWY2aWlpQVpHM1BvMnJqSzhiMTVnbUlaZDNnSGw3dm9GUi9iaDZQbEg5?=
	=?utf-8?B?WFVWTy9MQzUrVlNwbTAwYzd4RjM2M052MUU0RHBqb21GVmE0RVpId0tUaWpQ?=
	=?utf-8?B?aWlHM0p2ZjJGdW53WEt0QmY1YW4wUnMzY3J5b2Q5T3NLdFk4VVNBVVNnSnQ1?=
	=?utf-8?B?YU9jbUVidllBS1Q1Mlh0TzNCRk9LVklxRnBPc0FHd0RLUW9zaXNLMHd2UGtQ?=
	=?utf-8?B?UGxyWDVrWXNSUVJDWlZ0NE40TzNDR3IzRGVhWitrQVJLRHFidmJ1OGcrektW?=
	=?utf-8?B?bUlNUnVKQjd3dVR4S0FGU0ZDQjJSUE1VZ2h2UDVBPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	6:9vDyGloo0mvoMt12u66dBeZyWXfMFQE1ka5eWcyqp3eCp7oOlkpZ2dVTYQPOBrLkQ654yrJK39VCb4j4E2fC6htmyMRh6ma07fR9f5ciJWrd9MqGEd1V3yJOGfyg09WQ/YbjfCDjBPp+vEtwDt67Y9NYkyoaY+852szicyylnVGvBCPs4qAVKHE0r+DTwx+Qqovd+hrE9hV2N9Ir0CK8F0If0Sr9fUQqVGDgOfHI8t6DLjwN0QGcnr3adnBk8OKVwp5lSaZp108K3T3PAUOtpFnonXawXlmYa5DFQQ9TtLiQjO384qS5oo0v+7t2e7cuQA5bVXG0ZNnyAOcPK9fNMnLK3+0bJsslRMwDlO8A+Pk=;
	5:W6wBxEuoxIM5SNsmjT7yfHsgh5V3y8KKA9ZJhFn0hvUlrCE6t5ylHz4CdVSvUo97y4k/XNOiCjGjxu2FsFjNpXvkSKzV5Vz4BmgPSaY7Nq05MJK8VpqD7Efy5jfAzjjDijLNGOsboxQ9jA58xrLw4Ro8t48xnrlKQ0gSirXnK1E=;
	24:CQuC2XyXYOzlVhcO94jQppmxwYlGKbB6lY9W9tXHzMpdDkyNvkseVLbNa4mEv7vy7/lpSgX9BsFNrmWrussYRQT2dHpOpF0FHAA8SFkTILE=;
	7:OJZvSV4HoiPYonE3qPyBPwAvEG4ZYAJltYhw+l7NIGlQPKhNiPBIhWRVMga59EJrRnlhX9VOlOzijBQ/ts3ab9fijDrGJUFnIecSozcfpf87gbLjCrW9jxgBBOkyBG7FMcL+oLRJAIqnzAxe9Zh079ZzU2Ly5Ht8WR0oTxMuW09nWSC0hBXJjvliq8PgSfx2g86RqPnbntwgPoXnNRgiweOGw/Chtk+Eq8ymVstn1OOC9yC/IYFzuVyclIAVzFhO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2018 19:22:07.2497 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be1412ff-8ed3-4629-3b4d-08d559289b29
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2931
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 11 Jan 2018 19:22:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Khem and Alexander, could you comment on which solution is preferable 
from an SDK standpoint? Otherwise, could you nominate someone else to do 
so in your place? :)

Here are the possible solutions proposed:

- Generate meson.cross toolchain file at SDK extraction time.
- Wrap meson with a shell script that dynamically generates a toolchain 
file and then runs meson pointing to it.
- Change meson to support pulling in env vars in meson.cross, and use a 
fixed meson.cross file that references the env vars.

On 01/09/2018 12:33 PM, Martin Kelly wrote:
> On 01/09/2018 10:40 AM, Jussi Pakkanen wrote:
>> On Tue, Jan 9, 2018 at 8:20 PM, Martin Kelly <mkelly@xevo.com> wrote:
>>
>>> Note the "native C compiler" line, which directly uses $CC.
>>>
>>> I'm not sure if this is correct, but an easy way to fix the issue is to
>>> ignore $CC for internal sanity checking when a cross file is 
>>> specified. In
>>> that way, meson would probe the system and use the normal gcc for sanity
>>> checking while still using the cross file for the actual build.
>>
>> That breaks the whole reason the sanity check is there in the first
>> place. Its point is to test "is the native compiler the user has
>> specified working and capable of creating executables". If we change
>> it then that becomes "is the system default compiler (which we might
>> or might not use) working". We need to be able to support the case of
>> users defining both the cross compiler and the native compiler. So
>> something like this:
>>
>> CC=/some/native/cc meson --cross-file=mycross.txt <other options>
>>
> 
> Yeah, that makes sense. The issue here is that the OE SDK sets CC, CXX 
> etc to point to the cross compiler, not to the native compiler, so when 
> meson assumes it's native, things will break. I think we need a way to 
> specify both cross and host compilers separately from the env vars. For 
> example, if the binaries section were split in two: "host-binaries" and 
> "target-binaries", then in the cross-file case, meson could use 
> "host-binaries" instead of looking at CC and other vars.
> 
>>> Right now, the SDK contains fixed contents, and there is some 
>>> top-level logic
>>> for rewriting a few paths to make everything relocatable. I don't 
>>> think OE
>>> wants to inject a special-case one-time generation of the toolchain 
>>> file at SDK
>>> extraction time, as it circumvents the normal build process,
>>
>> Would it not be possible to generate the cross file when creating the
>> SDK contents originally? The only change it would need is the same
>> kind of path fixing. The setup does not really change.
>>
> 
> I think it would be possible, but I'm guessing it would require some 
> special-casing that we may not want to do. Khem probably has a better 
> informed opinion on this than I.
> 
>>> Another approach would be to generate the toolchain file truly 
>>> "on-the-fly",
>>> such that the meson command points to a script that first generates a
>>> toolchain file based on the contents of CC, CXX, etc. and then runs 
>>> meson. I
>>> think this is a bad idea because it is complex (will definitely surprise
>>> people) and slow. It also breaks people in surprising ways when they
>>> accidentally use a meson from outside the SDK due to the PATH setup.
>>
>> This is, roughly, what Debian does currently.
>>
> 
> That's too bad :).

