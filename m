Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0072.outbound.protection.outlook.com [104.47.41.72])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE0478842
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 20:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ehGgE785AXtmosZ15BscKiu8hnGTEJgxE17RA1mS6co=;
	b=Rev+thjJ0ob+CI95UyzZiFEeQKPc8nJWEUyUPWlM+ItAU99xt3R88R1DQfJlht433f9KettwQVfrqQW/Odizh2/OXX9IVZgBsilMTYNr3xQlESR/WK5Nxf09JqZLvOd8/8C+LQsPGGjulqhvnG1vcAPuEIpQcZtiSm1DA6fP2gs=
Received: from [10.201.1.39] (65.122.179.226) by
	BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Tue, 9 Jan 2018 20:33:40 +0000
To: Jussi Pakkanen <jpakkane@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
Date: Tue, 9 Jan 2018 12:33:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR13CA0006.namprd13.prod.outlook.com (10.169.208.16) To
	BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfbe0be9-acef-483e-6267-08d557a04570
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2930; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	3:Nh37zLUMMjXtWIZH6vI+5+iJRvokZn0IK13Cgj2LIbpJJkTjTo0lY+y2WQsljmkdX5wJE5qLcXLVb63sABswhgr7WPcPqi2TaJ5trwL0fTfjg2PpdNWxc+Knki+/yY6pdZSHZq+TggxTEMAkE650TacPAPyu0liqH65JVA2jB2nbUu4x+M+sA4xzEoKYV6+LfXJfXMS35Ks2vue6B+inMmWcT30DSdfEEcoeB50rmB0jwS/PHZr1+TN+IbZCKr1M;
	25:1xMw+GRhp39dXTM+F7D6+6sWlUbyDefGDOEIU0FF1Lsf68C61lO8jT6kVyGPAay+So160R/udU5aJiRfVWtkZMWBDLmVaB8DDPXVMHhdQIEc6gPvXA7hT2jTS9Jl2Nc+Nk1pAV3pxVjYm5RkqMsEaP3Lr+IbN64hM8dCV8h8pePUbpmp/2ElwX5jkVI+BN7RvWZbhQ0c4CXej49U6koABx8b903hFfyUmeqkKb6Kax2pPv5+im4esyddCvKK1SWuX2ne+2YzOpknQPCmVQ31IRAGsWr5DlPhIFkooPxijPUzxEY6Cl1FuiYE9+ygWWLnFPtNnYNnUx9EQpRFLtuWUw==;
	31:jk5SkkFPvywo0626581ouDO4d8KBKobdnKqjopGtMWZSne+xwpiCgDfaB6WzmsfJeOg84iwYWoAD5mdNjzppA28r4xf1I8KAuuOo8Ale6AzSI1QXja54aSlipS3ITOrIZCF9tL+lTEFqJPlNIvhxcWM7aNf7aafjpRBiFUu3P7bqzVyEbXDYDCxw2hhX1+AzAH4Y0NJx7ydprtX17PD+ParnYVW+YJlLrRuIIhdQlK4=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2930:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	20:YHyh3y7fYTFdOH8PYwIVm6+bFKWry3ohdMafsc/fQB/Myx2OBnn+uF7TKJRw2Gjd9iYXgL2RNJsPDwnPxXajgm259naFNabcYB2x2L84EviOZQ9zSeufeAs/8nhYBCBR9ehULpTRMcsIGvTmZMoPpWXfpa1ugtN/7AwgmzLef31CAQAJho5V+YSXIYarlFW8Lbckv3rJq8c1HVxXlXHjjlyja7PbyaBbppuV6ms///wmsZSGHHd0FsYkhzXe+Bww0su8t14eO6gmRygm98uKWw3fHN2dZv0TGAdkv9++V6MVjCIWZIF/8TyJFfmwjqGpbZWpwxYN+IOwKIMfhZv31MGsvv1FGG+ZjHYAodhdaS7fBXSJMEQGnZu8tilfFuiHT4wWPrGX4G57eQHIvR3/1XVscIKcRvWaVHZ/+65s22k=;
	4:CMfhtA2Qg0SqYUMQHrRULXf2LjcP0EKeR8GwZCZ++aYHcApkUlzQYuLGtW2MS/EahDFuzkE0lk3BhXLcJWFMmwFNGbOwIOcOMHfq/xC7GlGiCjxywXi4NvQzUpNcc8xNKuEnq9MzqL4bXjmeCRLu+Y674e2DroDLqWkiZDodtQfIosIwM2zseq8po80iCRIBLRnzB54suIu9St+RHEdqtB1fdThesQcE5PK7g/HCpn61nROG7lD2DB4XPHJt5HrQ+MKEBESLSeBYLH6X+9+V5Q==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB293006D711D55DAA39AF2FDDAB100@BN6PR0101MB2930.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(3231023)(944501112)(93006095)(93001095)(10201501046)(6041268)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2930; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR0101MB2930; 
X-Forefront-PRVS: 0547116B72
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39380400002)(39840400004)(346002)(396003)(376002)(366004)(189003)(199004)(24454002)(81156014)(106356001)(105586002)(81166006)(8676002)(229853002)(16576012)(67846002)(77096006)(90366009)(58126008)(6486002)(54906003)(65826007)(5660300001)(68736007)(93886005)(7736002)(316002)(50466002)(2906002)(64126003)(478600001)(3846002)(6116002)(86362001)(305945005)(65956001)(66066001)(65806001)(83506002)(97736004)(6666003)(36756003)(52146003)(230700001)(76176011)(23676004)(52116002)(2486003)(16526018)(53936002)(39060400002)(1411001)(31686004)(4326008)(8936002)(386003)(47776003)(2950100002)(25786009)(6246003)(53546011)(6916009)(31696002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2930; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzA7MjM6RGlOMHNaRkFaaUQzT2dzSXBRV1JoTDZl?=
	=?utf-8?B?dUVYMy9BdGM0SS9TNFQwWHZla3oxYUNBTkV0YklmWnUxSGV5aDk3Q253Vld3?=
	=?utf-8?B?akRyMUd6ampZYWpLbnRieXllL1M3S3JYZWlQbUQzSHFJMGtTS2tQeWU2M3ZB?=
	=?utf-8?B?TDM1elJMbG8wRE4yN2JWLzdQdXN4eDFtZUxtVFZZS2hxa2ZwRXVrUGJqbzBT?=
	=?utf-8?B?dk50SlpJZWF0YmVOd0hWbXlGRm8vZFZzMi9GMVhqK09yYUNGanI1Z0UyOWlZ?=
	=?utf-8?B?bTgyWFpiZDhaQ2Y4UWJyWHJnN3J0VnMzS0JkUHZsM0toYmRSbzJwT3pzeVdK?=
	=?utf-8?B?MXU4RzF5RGxXQlZ5TkVYaHpoOXpWeExDODZNdzZYZWw2ZDIvemg0UnNhbzFy?=
	=?utf-8?B?R2FIbGdvUjZMRXc3SDdZT1drRnVvNy9pdWtsVjJSNzd2TXNFZCtBQWJzcmZz?=
	=?utf-8?B?VStBeDh0R2RpZENPVGYxSTJEZ2xEMFdoZjRPQll4enRmdlk4dlpLWVYyNkJj?=
	=?utf-8?B?TGVvU00yRjU2T2gxOUhGbHZqU1pVck5jSy9XVjlITjUzNlVVdm1mNStKejNq?=
	=?utf-8?B?TS8vOW5mc3NxSXhsMjdkeFZ1Tk9mQlhjdDlCcnpCM1VRTWR3ZkZkVVdLVlk2?=
	=?utf-8?B?QVhBc0Vkd0lUT0l1dlZUWXdiMTYwdHVRTXY3OGl2eERwNFZVK241bHZCVUFj?=
	=?utf-8?B?SlVnQUhBV1R0TjI0bmpCR3cxUmsyazk0d1M4eVVId1dlRDJaSWduY2RlbHBs?=
	=?utf-8?B?bkE4Q1BqRXlXSHVaSkI4Y3Q2eDFiQTRCK3RsOVpPQUZsNDduMFV5eG1uM3dX?=
	=?utf-8?B?RE5TQmlZTytlR1d3amcyY25aRG8xNVRwbkQ2blRXb3pnSUtGaVFpaFF5RjVw?=
	=?utf-8?B?WUEveTJ4aDFUc3I2LzlOUm45dWdSMWZZRnZQRTYrNVNwRHY4QXBGU3lNQWdQ?=
	=?utf-8?B?NFNlcXNzOWFaNGYxRW1ncmJVQzNtTytuZ0RyRUVRNlJJR3czWGNzeUI4NDdr?=
	=?utf-8?B?elU0MTZNcE5NeGV0eEhud3cwdnlmZW1zRTdvdnNkV3h1c1pkUkVacmdRdC92?=
	=?utf-8?B?VU1wTmlYd2tPMDN6QVNYVnRHeDg5Wlg1QlZad253anEvaHpZRHM1OCtuWTI1?=
	=?utf-8?B?VnNwclVUcVYvblhMWlBnV0VLdUhyNE1GdVhyVWFTY3J0UXJpWGY4QjJHeVVa?=
	=?utf-8?B?c2dNbXZkVWxZYTNWMXdBVTlqektzTmFnUENueFRrQW9aY3ZTZVA3QWlGNkQ5?=
	=?utf-8?B?c2MvbEZSMGZSWnBsQUF3REE1NTZOanlzWVhFM2QrZGNtY2tCZm1KMWhTT0s2?=
	=?utf-8?B?OEU3NElWUllmcjVGQkw2L0ZROW95WlZ1UEZnWHdVQVA5ckxYWlFLMFl3aFVH?=
	=?utf-8?B?RXFkb1RqL1RrVjFnSlNKeHpxd1dJMC81eWhBWUg1enM1YWZ4NTF2SE1Jd2wz?=
	=?utf-8?B?VlF3LzBsNG9VYWdSVmQrQ3V4T0JPdEowR1I4QnF3UHZOWXZGdzZlbk92UExC?=
	=?utf-8?B?T1pvYVViQVY4QVdtbzc3Nk8vZU5nakhDa1ZST2VCclJnM1c2TU9mNXJtU2Qz?=
	=?utf-8?B?N2lIVXJ6QnkzdWhWOUtKcUhDMHBxS2hncW9vOWhBaHpKVmhaRjczYzVIS0pv?=
	=?utf-8?B?RGlNeEhpQXhXcDJxZ3pXTzQwakpGSkliaGRJWHF5SUdvYTJaZkd1OVdMTmNv?=
	=?utf-8?B?V3JEMWp5MnA3WndENW9ydFJzZEkzb09xR1NHWVlJUGlSQ1BsbDhVMWFFRG9m?=
	=?utf-8?B?Sm5EZkpEM2FoMWx0ZVV1MVFoeUkwUW5FYlF6Ri9SOU9yazVDL2JqVGl3WkFE?=
	=?utf-8?B?RjBNSWE2R2EyYVBoZUV1cVJET1BZYm9DZTVLWUpVK0FkZEViVXBXeERrVWhG?=
	=?utf-8?B?U3NhRzNqNk50UXpUZ2hrcU84d0VMaVVZVm4xUlBrSDJZVldZQVdoaTRDRmVm?=
	=?utf-8?B?TUFDOXFtcUE3N0x3N0FZUXNOMkxjZTl2RGlzbFh2VTFjNG1xQ3FzSjZheldQ?=
	=?utf-8?B?NmVOaE82dDVybDR1QkpHVjMzZjdmcmxud2dpMkRRPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	6:FOdNceRoTRS5dQKPy2sOisOUlIWZIx+ljiGhmsdIE1mGGa40QrAdDhbLbhp2KpE/EnrSrh68S/SPGRX2hl0sdg1XVkpXDoom0Q2p73K7Ayzu0qi2RW7YagqPUdu3t7MHZxhYwIFDnjYAGlEP7LGnNSgG8inmXavtt8Ki9ye0TNySrxTpaQ0hzBDZ/49xNT9KNgiWyy8VqvX1GMO5VUdvH8VxH7aKDRgPHYCCghY/2wk61geT4V49sys4EDREfXTZF/sKtNyIGZyr4B/9yK4JfoX9rsmsVwbn9e1INozMCsJpYBT7hEPjeSpd67z7lWeVVYrkrOpLQz6tG1tzaPlEo6xxZkXSAPqftnhgWBuMsIY=;
	5:Td9L5iRbFDlJ0fy9DBotcTlBmQvpC6XtOOW/8OGO0gbYLQkbe4tUgNNlqHvOWPlbujsVU6mBv6x8m+b6l/aRbX39ap1+6a/FbM03qESjOFRT7ih29bXbus9GwOwoRunlkM5sv/dkAmJUAV4QaXxp8UIJp/5/TAgKdXUFMDXnAMg=;
	24:TNqDzAX+LCoUaQZegB74l8lWjOtPonMDZkFsyXAWuRBVxPBRaygKdKlWTol47hmx7gLoY16T02kEJX5qRxOE7QNkYPCnus4t0irT8M3UKr0=;
	7:FOs+WnPeVOVo6F/VeFHaQwMUmQGAsuQn0173xFBZYeBHNpHOMgjDGj4m2jEtsMJwLx66NnhgIuEujWQ0VlJfidp1iSh5d4JaQzJ2DghhDPbaBJHOPj2659sfNiMrycL7zSUiELhRwNV9jQ8k5x+W6IhAGIKSAOJs0CjBTh5boE/IMmVBmoqqv6VNTH4a6KiJMoryfgs2h89tzcbslzUSkNoKrgdozXqYd9XJTGITgwamfApb76FBKze8EO8usbKV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2018 20:33:40.8857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbe0be9-acef-483e-6267-08d557a04570
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2930
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
X-List-Received-Date: Tue, 09 Jan 2018 20:48:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/09/2018 10:40 AM, Jussi Pakkanen wrote:
> On Tue, Jan 9, 2018 at 8:20 PM, Martin Kelly <mkelly@xevo.com> wrote:
> 
>> Note the "native C compiler" line, which directly uses $CC.
>>
>> I'm not sure if this is correct, but an easy way to fix the issue is to
>> ignore $CC for internal sanity checking when a cross file is specified. In
>> that way, meson would probe the system and use the normal gcc for sanity
>> checking while still using the cross file for the actual build.
> 
> That breaks the whole reason the sanity check is there in the first
> place. Its point is to test "is the native compiler the user has
> specified working and capable of creating executables". If we change
> it then that becomes "is the system default compiler (which we might
> or might not use) working". We need to be able to support the case of
> users defining both the cross compiler and the native compiler. So
> something like this:
> 
> CC=/some/native/cc meson --cross-file=mycross.txt <other options>
> 

Yeah, that makes sense. The issue here is that the OE SDK sets CC, CXX 
etc to point to the cross compiler, not to the native compiler, so when 
meson assumes it's native, things will break. I think we need a way to 
specify both cross and host compilers separately from the env vars. For 
example, if the binaries section were split in two: "host-binaries" and 
"target-binaries", then in the cross-file case, meson could use 
"host-binaries" instead of looking at CC and other vars.

>> Right now, the SDK contains fixed contents, and there is some top-level logic
>> for rewriting a few paths to make everything relocatable. I don't think OE
>> wants to inject a special-case one-time generation of the toolchain file at SDK
>> extraction time, as it circumvents the normal build process,
> 
> Would it not be possible to generate the cross file when creating the
> SDK contents originally? The only change it would need is the same
> kind of path fixing. The setup does not really change.
> 

I think it would be possible, but I'm guessing it would require some 
special-casing that we may not want to do. Khem probably has a better 
informed opinion on this than I.

>> Another approach would be to generate the toolchain file truly "on-the-fly",
>> such that the meson command points to a script that first generates a
>> toolchain file based on the contents of CC, CXX, etc. and then runs meson. I
>> think this is a bad idea because it is complex (will definitely surprise
>> people) and slow. It also breaks people in surprising ways when they
>> accidentally use a meson from outside the SDK due to the PATH setup.
> 
> This is, roughly, what Debian does currently.
>

That's too bad :).

