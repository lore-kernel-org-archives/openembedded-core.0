Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0041.outbound.protection.outlook.com [104.47.34.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0BC77BE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zeO5eJmWUgsQ0Ei5lgV4QRBIP1ZB+wc3aMx/EVuRfeM=;
	b=kv1wennKtVGSYtoD++Yyohs8hMoaSdJjNEnihL66XTmdRNlBiCzE3bMKmU4aXRjp9k1hyDE8oa+TDBvlfKKQryDrDkLyDuVQFcMlWFAEMuWgWztwJhqL26v1FUOieQPEu16XkCWvbm50MfDKJoWUaSO1KExelzbrfYN4oOykY+o=
Authentication-Results: xevo.com; dkim=none (message not signed)
	header.d=none;xevo.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR01MB2677.prod.exchangelabs.com (10.172.135.11) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Tue, 11 Apr 2017 21:42:22 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>, akuster808
	<akuster808@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1491508529-2862-1-git-send-email-martin@xevo.com>
	<becb96f0-bc8a-3a91-0649-cab9be51d6dd@gmail.com>
	<1491930851.12091.30.camel@linuxfoundation.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <a8ff712f-037d-be31-ab05-5d4f30d6f65b@xevo.com>
Date: Tue, 11 Apr 2017 14:47:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1491930851.12091.30.camel@linuxfoundation.org>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR18CA0006.namprd18.prod.outlook.com (10.173.238.144) To
	CY4PR01MB2677.prod.exchangelabs.com (10.172.135.11)
X-MS-Office365-Filtering-Correlation-Id: c835788f-8f91-41ae-5e59-08d48123a31f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR01MB2677; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	3:KSqAAHk6sCelHqzFo39LHDGVpCbdsGHvxTKMAXT3aLMt6lvaarV73ntXb0OYUflCWBPZfN7vWj1Ddh2ZZ5Sc9vt02Nmse7oSwNfaRFmIo30SsUQFAFT7a1RKfqLDWqXYwIQgmvUJ8fnPO6mmgBbGjEfzIOx5MSG/awf+/8aT7Z5SWktJWl66T5XKXxvhP85L0E8L52i9Ubt7ZtqOoC6rTQHVhruRxlzVV0U+aGuLzb8pqBzOhLxjKhlc1RHm4hrKUAusmViVSm4P2N7sDDfBPUKiX6vAJd5mD9m8QPxIDRAnzllvzL8yT8uVB3cl9q/8ciVH/rBtoLBZbOvWw2/N+w==;
	25:IyQOMuEQeEGEfZfYGrjWBqb1e1POzHG5LvzaizxbVAOcW4R+CQFVpW3CRK7aKY66YJj+vsDwy5wqzPVRV9KSR1AvCpHQomaVu9byHP7aQG7SMRn2Gdv933T7jRNefSvexZXipToK69sqoEp4knxN2XAoLpIl7B0fldsy4eM3K7FX/9z+rAFlJK6R3jNr081eZCX8C4a5c/43vVXh3fg6Q6hK1GV+113CWaCRkxz+iJRX5el7vg7IPhR03N04/Zxa4Ir0zIOuH+FHjCJUXQAL9NZs6Uo5CJlIGs5Mykc2901dEYv847J007t+IApOC+Q5ixqyLuy/797lzQh9ScgfdP0C8LWMqK4EzmqkoKlRnGLz0oR3Hpsq0VK1yZJBfukvDkhL03+MJtb/iYei9EwrW9iW2vliqladECMYdiPctMcrXW3OmlB4+HTBhLirPsNN6Klc1IoS08QZ8oiIyRoTUQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	31:VSL3d17pRu2TkdxoMXJXVgNjBkksZukvku92yFZzSvjWvsj6aYshUAcH6p+8w5Kb9hYA7vDztIB1ULw2dS5OoZWfbgl+U8UijhfQNb2Q/cvheWxQtzuUzUEaIc7iSwpFUcipgFIrzuQR0ck0dJqIAb9GrIyRhuX8HIh4H9LbXrEGZ8v0AaotvZGHQrvecRcAsN+mo0E5H7ES0oXLu92MVLHkBHkIZ/t0hNoZERwDnHUVIzV8zENqpGQpVXQz/E+BZm/zKtSaCcIuBrcy3v8njg==;
	20:XXNCCBdVSpyHE+Aw8t96vKsfFwmdCeUGza16yl6FXkybq7kInU/BgKuxwoefq0yPKk293SKSiP/oXTyB45h5wRURLl8YMWgkPRGTwilsFUpu974zSbO9KFPdTvAWUl1FSyquEa8247WXsXhpqchs8wuTPpZQU1HsccBLLKS87tXa/tx2W+5s6N+n7lOdMe13/X3JPCzuwJxXY11p15ZVaUJqGWc3j4kmzMF9x5EnRdzRg45JtapQDle/GvMiVt0mRdgfNuGisfpm0RYioOWiNAAaagag6Z/haVi/X57JYjHf8LNWyPH8GF6FlSKkZ17XONVerFo/kCZkqnG1MVuCGg==
X-Microsoft-Antispam-PRVS: <CY4PR01MB267749526CD38974A9FC9699AB000@CY4PR01MB2677.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(20161123564025)(20161123560025)(6072148);
	SRVR:CY4PR01MB2677; BCL:0; PCL:0; RULEID:; SRVR:CY4PR01MB2677; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	4:1sWQsWYk5OilL+g2Xnb1jnE/gxVXF0Z2OWeaojRD08enigshbrTF5dHoM3XZINUm0B2OtjmKH46DK1nHi8AP6EF5OtKfKAyqj5qwoZeVfLzmy3XS+jv4uB7B1qMn334PwadGHYDsaSGZocS0BDC/LbmKW3Q8pqqryMTYVDtC514RHVvHZl7dALQzxDjLkFdru+wYmw4CyTYNjod+oWP3CWFNJRcTHqyXSc2iR3f8C556LNqr3dWh56kA8uZPtJV4k11bCpb/1U9gAcRIrkE/m3ea40b8CI5rq4R9E3XB9Q89NYX8a9X0GFF6GABPxt0oAm02D3/o4jPqyrs3cYl+O8NOMYGBGVzQzXmGdKhk1jEvr2puBlJqWT00YZ/5pRLx6a0LebLmHfBPzt6crYdKJzMpROKLdjsmRWe5M4+L4zLcEElc31qctXeJmxhYsjhfLyndZQhAX36IvKiXNFk834Lg6rdDAoNvjv6bRXyBfVhOsZaMrGmGpgf4Pbd0QEuwe0h0LjWognScej27tAbU0CtWz6yvWQbW732AFVzCMgLMj1Y22DoCzy7hlxnL0St+WiAd1Jp1mITb0OIofEbkjGDkHxo6v7fINPTVb0e/NyrGXP4lx/4UetWICabD19yPDu9vYT02QR1AAqm9iouAvNPWR+xSPg4HG7HWsn0WflB2xl8tKdo/rEiJHgEWwlCaBuhXZ8jBtcbhtaIlCZyASA==
X-Forefront-PRVS: 0274272F87
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39830400002)(39410400002)(39450400003)(24454002)(377424004)(377454003)(33646002)(83506001)(54356999)(50986999)(2950100002)(23676002)(25786009)(42186005)(53936002)(76176999)(229853002)(4326008)(5660300001)(7736002)(31686004)(189998001)(4001350100001)(6666003)(8676002)(66066001)(53546009)(36756003)(6246003)(50466002)(230700001)(86362001)(3846002)(107886003)(38730400002)(47776003)(2906002)(31696002)(81166006)(6116002)(90366009)(305945005)(77096006)(6486002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR01MB2677; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxTUIyNjc3OzIzOlUwanVyVTFKNjRsWEhVRjJkWVhkeEIzVkdZ?=
	=?utf-8?B?SGZGM0NZb3lSQ3NCQk5WVnI3MVNkbHNDd1gySmZMYjhjRGkyeWRLVVFIaHNa?=
	=?utf-8?B?Q2lmWTVpZDZ6d1BZUSt4M0ZxVWMwZnNEcTBCbzI1OGdIOW9zOEZneWNlZUs1?=
	=?utf-8?B?V1pVMjdYczBOMy9GWXBURjZSZXV6RHhjZjBaZ0dXaU9MaWxxYXByMHVidndh?=
	=?utf-8?B?czNHUitScXRiMFFxSVEzZ2R4aVFsL2VuZDczQjMrdGRMdFZjRCs2bEY2NUM3?=
	=?utf-8?B?QURqNG9yU0tGd2xoMkhGVWtmeTVIY0ZqWTBxQmI5czBkano0bUV1ZEF6b1Mw?=
	=?utf-8?B?T1NWMEdpZ1hhcmF1QklRMjJTUk5pdHdocVBGeUZ1ZEtMVkg1ZGl4YWg0WkpF?=
	=?utf-8?B?QnVyejBvL2VnNEE1eUJJMXdmZWZITkRhR0Iwd3duQmhJMjJsK2ZLR0JDbGxD?=
	=?utf-8?B?NkNlQjhyS1M2QVhEd1ZvNFFtbXpZbVhWRHJ3S3ljY1dBc1JnTzhhOXhtdksx?=
	=?utf-8?B?ajR6dzg1a2l6YkRRalZKckZVYTBMdTJ0cGpwbzJZZDZsRjY3TWloQ2krRE9n?=
	=?utf-8?B?UDlUbmVwRW5XRTRra0hJa2t3SWVoZTl4SjZzNS8xdzdldnRwVUc4UXprd0dB?=
	=?utf-8?B?T1dTK1Zpc0k4YjQzWWtsbG9RL29mVjg5ZjNKbjlCR09MRkZVdnRhTXl4NVJR?=
	=?utf-8?B?TnZLVGpPbVNDck5nb0gyV3JEa3NDT2gxWjlMWFZGUnVqdmUzNU5pcGJXMlBt?=
	=?utf-8?B?a1ZZci9oajFIeUttSDdSK1FzNHZmV254RGthL0YwSWpUWnFhM3RFanNjN284?=
	=?utf-8?B?aW9rSnBNMVhLbENWMG83V0g0YVZUU2pDdDc0azdMdlZpaklBTVFyaUdBUGFP?=
	=?utf-8?B?RUdONkJZZzRDNWU1ckQvVjVnSGp6SG5hSk1nTWNlaHc3Rkw2bzZoSkxndG9H?=
	=?utf-8?B?bWdWTDRqOFovQzNxMm84cFZVcWhRUDVUdE5LSXNVb1diUkdqbXVOa1JpRlE1?=
	=?utf-8?B?bWZMSE9TRktVWUNPeTdpSFFvODEvblorVG4zMHhGY3RXeWFpTFZYdWNUcEIw?=
	=?utf-8?B?cHVodVFWWStVZDNwS3g4TTZkRlA5a1RZR0dqbG1vZWplQk9aZm1WaTRHV1Rr?=
	=?utf-8?B?QUpZdC9vc2pCVlpydVhJMVBrWWlxSm9FNFo0V0tFY2pJazhWVGo4QkZOeFpj?=
	=?utf-8?B?TDNyYTNwWU5XYXU1azZnWVJZVXFGL0w3SXM1aUhBMVpJaDNZZ1hEbkh3R2kz?=
	=?utf-8?B?Q3hjcXdZMEFJTnBXSDRpaWNXckxNeDRJQVJscEtMWW5nMjhKSU5NYytjVU9M?=
	=?utf-8?B?Z0xQNUNXWGFSckVSTkxlQjRwODY3VCtRdEJVS01yUjAxN003b3RyV3l4anNX?=
	=?utf-8?B?ZUZ3Yk9kVFZYbnRWWHRXQ2J3aGhEZHZxdTJqTEhSMElVT3I4VDZWRGR1WFVF?=
	=?utf-8?B?TFhkSjl1enBxekxkU3FZSXcyVytWZnI3V0dtbnQ0ZzlhcWVmRzJqMVI5eUkr?=
	=?utf-8?B?cENEWFJ0VkhBL25pT0lXWUNTeUJ4LzRTRXBYYWtiZDYvSkpxNW5uanV3bGpX?=
	=?utf-8?B?QVpuVE4rODkxTTc3MTA5dHBsR3VKKzcrd05tbXEzR1Q5UUUxaWh0OVBQdlNB?=
	=?utf-8?Q?e1ycXyIAkZBOIqLLuny3?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	6:6kurCOJq29KXnVkWs3SuNE6wJN9s4JmxIiJlcDlNYopU0sX6XACswlLn84yGkyAwLBNAV/l5r6It6UPA13W99yuRwLK3KFEyaMaopeF2Z6N9HLzoIywZPSAV+IAuZkB+LGXUQ1yQBJxX2Mck8y0Q9VigmVLnYhNNEC4dPjKKkloFBNZ/n25yMtFOVeOgy4uKTv/PHJINkSRBrEmpcoR9J/7z3aasRXIArAWpNhXC+Km+QPF27rNkUx6XxQgNIPEpNbl80qoPwjHI1fhPATUNqEJO3w7yNUJuIDAyoTGnu73QiBR1BDpxmzKu4nCwvtmkMzyGt3mMWx/Ry5Z/NX0m5mtRRJLzCkSeBuHB40NyioTj13uPVz1z5v/Q32K2sdUu9KkwC6SzsA09CHBUx6LJBFUX/NBZ4Bk0lA5zB2n60yMoTK29BwTHvy2vlNpVs92KPiWao/j/Iqq3qZmhxmWOcQ==;
	5:9Rr4gCST4cNAwWuq93fLkTQLoc0E4tzNJDtiwm0OABWfoEVn9OtaT9y5Ru8ICIHDLi69EmmmVLwOn9+YACoYcbRPH/53BpOF8UB5ETZ+oNNxvS1bKSzQP5yXgSDxSEYfB3oNNOOEsVp7+OgjmkD1AQ==;
	24:MexWrQxggS94YF4viFY7S7XRfejzBnZzRKUp8BBqVMkVw9lDQE3m2Qq71Vrg3NNuS+GVSwAQ9CIFCvls4j0ZbTiQ/z1v3K6RVmuIWEogXKU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2677;
	7:wVAA3sJb62QDmVTPjWwXsLUZsYZpxRog2IzsMegnBauuLZNexQT8ZU46PbgYl+u2wSqx2vEoD0FyEeZ7tA28uTR/UGLJmFhjxOR6eHadK1rp/0g0luS+m6VRa2arOx2ZXno58FJ4AVv50aQOdPaJBzsx26aeH2nutatp1Rkoju1v3Ndt/b4coMGvQMTQCxXJaOsX+NwlTk2q+fO3NMvy3mibj2kPnXc/yNOEVzx0DJqe8VKDKJcyIs2+VBnerw+dhnN1HHZcrS/7gSlVnDN5YV29b9baG3j+eQMx1y5WuHvccZx/tOUWsriGOucUCrvLBvHDNj87Ipvsu32Ovtxulg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2017 21:42:22.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2677
Cc: Martin Kelly <martin@xevo.com>
Subject: Re: [PATCH] libsdl: enable X11 for nativesdk
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
X-List-Received-Date: Tue, 11 Apr 2017 21:56:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2017 10:14 AM, Richard Purdie wrote:
> On Tue, 2017-04-11 at 09:34 -0700, akuster808 wrote:
>>
>> On 04/06/2017 12:55 PM, Martin Kelly wrote:
>>>
>>> From: Martin Kelly <mkelly@xevo.com>
>>>
>>> Currently, the following situation fails:
>>>
>>> - Build an SDK and image. Make the image support graphics but not
>>> X11.
>>> - Extract SDK and copy image somewhere outside of the Yocto
>>> workspace. Do
>>>    runqemu on the image.
>>>
>>> This results in the error:
>>> "Could not initialize SDL(No available video device) - exiting"
>> This seems to have fixed an issue I was seeing on FedoraCore 25 with
>> Morty with the same error.  Did I miss comments regarding these
>> changes?
>
> No, I haven't directly commented but these changes do worry me a bit in
> that we're setting the PACKAGECONFIG to x11 for some nativesdk things
> and ignoring it for others. I don't like the inconsistency.
>
> I'm hoping the patch from Jussi today will be a better solution for
> this problem, at least for master.
>

I like Jussi's solution better too. However, I don't have a good way to 
test it on my project (Automotive Grade Linux, which uses Morty), as the 
patch does not backport well due to other changes.

The bug is very significant when your workload hits it (makes images 
built by a different machine unusable). Is there a good solution here 
for Morty?

