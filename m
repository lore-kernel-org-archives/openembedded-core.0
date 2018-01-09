Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 1076 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Jan 2018 18:36:01 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0088.outbound.protection.outlook.com [104.47.36.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB54788E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+kAjzbg6QgDaBr0TxlibJQKyTi+HghpiFBv8JS86mjQ=;
	b=azvh+1cPT0W0ov+dISib6qij7eQ622eiG8LqAkrX/xr8FgDk0dKCUBit7EyUatCpwVCbqmTwre9HOKpgDT4vrMB1S4R3jj2U2dkP1WWb8nWYuCxCWtd/deHpBrU4mv14oOBS4nj9dKfZcBE7MNJYUjqC1qyIE5wt47DoO+dC5DA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Tue, 9 Jan 2018 18:20:47 +0000
To: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
Date: Tue, 9 Jan 2018 10:20:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR22CA0027.namprd22.prod.outlook.com (10.168.250.141) To
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de731d07-3414-4de7-fdc1-08d5578db48b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	3:kibbjMXXJZJpDQD9Z3zEhgkIXu/cCoKCBC1I0cIcS0ihZQaDgFl/V1Z0QbGRgTKV0G5i1TLO6TTLgMGnu7pziPOWKSV5G/EdCcPLME1C4ymZhxX7W+kW9YRgtkcbETWrctaO7JWPUphHKpwlaqMfk+ucIAenpQ2Xt9WsDfT7QZb7ognCEQEZmtBPQLPtNbqyyh6gxTxJqXDFOwVqbV72SVViolRdqC7lozxK2z15iwi1+F7qx5fIp5OK4o9Yzdhq;
	25:17MSJsw1N5uUQ29kVA+IzmfmxNdQHMeX64QKf06+Ai5P1QBPnNirU9PNfhfYjXypJB8Pj4iZa+CFgA4IQQIBj8rbMOFsaUZEvCLdiwzyd35vkcFN1RED8s2mdB+C5h3gtt3zHzA3/l9LrJLr4U6iJy5iInn8gX9w3krAec8bFZ2WJEgjs7N9hCrkzbbc+4277Ew+vhW7UgvkpUDlKWJnOwL4UsjZ4Hqtx9c2aPVJKH9TNDcYmpT7FQv5+tVaIQAJ8AFkVzRPiFv15Dpz1Tlk5xaZDA6SIvy8TiNyF926k9Eq2Oz0g3tDvuX73KNwb8oIdfqccv0oggrsbUsSaYwY2A==;
	31:Hv4Lp0bvdBWHLzVcIfDFOkp3wqgRNF+S9qw893OiK5KY7EzXO1w8QW7Xs7aR7pmSjAc6ia+Qywkl+Umw0U8f/cPVyXYPhtS/gsQDM1WnrUbN5kKXtA0ht2zz6lBJfmgbk4CRgbwv1HCz6jTA1k3zMOuYKMXkg+46rdYaGt3hKz+3AZY9zgcFtneAqFQTJ3NHSaHHDoVBJ3QHi8JMYe35aAoaVBmsa71LrCeIZhJ0f5E=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2942:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	20:t7KXEBVN26U0W7uc94yXOXVKEl1Boui6sLblqJa1RTvMPmrVltnaBoZ561Xe9yN1uh5VwmokuEPD5YkLZ07WUtKkUARZalJ+QKK09dX1QNc0ormoH9qLCsUZhO9ylGypnMod7AkQkH8gTcIAF1gWg9z1IgwOTazaKhlFKJS8ihyh1GtxsPyLEUn4qHxhNxFZC498j+HfDwihRab5P5bEmuFVcAYp0HYI11Psrwd7HjDvz3CZD0bqvxZ6iADAu3EDZpmcWljwfmYa4Ycx07GQM0YkbUhgXKYaHGJ1Oh6VF6oh5ktAom1FyzrrhR3kmJqR0FW4m9YVNyLyYutFj1+bGYARLTxL0lf49GqLb+i2cgyQvZ+cV0FVuHZkGEzR/f7Pkr6G9QF4rDAkOQ4U1CESPzrp+jGkKhL8CrBiKjIb4R8=;
	4:vNLO0BlCsl+Mv0UecjVwZdfl9wl3tJUvA0ZOTDnJij1V5vBeSGxcdi8WXjrh761Pz13KAYpv0fgHAP8izxCOPMc4DlPdwSjfM91Y+AGFaFTo1z8Ch2PeTzB2Jomf/bMdhJd+oNNKnk0yMIF3xz/TJml5/6q1Ous9eODHyV94p5IQLMkH3Yh6KhmOtOSFlojSeAwAS+CdG5cEMthlPNjXIJO1L3Fl9umGDltptJGVC03zwi6EdtkL5hwpp0QzPF86/VGqeyET2hHq2sGt4E+4CQ==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2942DE0A49F91EB53AD02F93AB100@MWHPR0101MB2942.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501075)(93006095)(93001095)(3002001)(10201501046)(6041268)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2942; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR0101MB2942; 
X-Forefront-PRVS: 0547116B72
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(376002)(396003)(366004)(39840400004)(39380400002)(346002)(53754006)(199004)(189003)(24454002)(36756003)(52146003)(16526018)(6116002)(65806001)(77096006)(23676004)(52116002)(2486003)(47776003)(3846002)(97736004)(65956001)(66066001)(386003)(81156014)(305945005)(67846002)(53546011)(6666003)(90366009)(6486002)(2950100002)(76176011)(8936002)(2906002)(6916009)(86362001)(106356001)(50466002)(8676002)(64126003)(7736002)(81166006)(31686004)(65826007)(6306002)(229853002)(478600001)(68736007)(966005)(16576012)(25786009)(6246003)(58126008)(230700001)(54906003)(53376002)(4326008)(39060400002)(105586002)(316002)(31696002)(53936002)(83506002)(5660300001)(460985005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2942; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDI7MjM6YTV4bzdXaXk4bW1PMGdyZ2U5N21BVXVG?=
	=?utf-8?B?WDcxRGkvM3oyZkVsdW54WHZMY0tSTHBuWGd6c2ZBemtIL2RYdURVMUNjWVZC?=
	=?utf-8?B?RysrVnNMM0g5SXZOaGtVUnQ4a1B2b3hIZmJ0VktXaU9pQWowcGtuRFlmWWl1?=
	=?utf-8?B?YkJycFhVZVdBdkgwQlhlUFpnbmFzMTRzMWNrMWp6aGRSUUJMak9Bd2ZvOUJV?=
	=?utf-8?B?OThWODVzb3ZHSEl0azlwY1d4cWNiVTRDMHgrdEJpRnNzVndvbjdtaXpCajR6?=
	=?utf-8?B?aDJ4OEZsSkxhTWtFSUtNTU42c3Y4RW1IRC8xaHNWdUJEOFltUUZmRFpSRHJ4?=
	=?utf-8?B?VnF3SWlxcWVpM1B3cVZpQnUzT0tBb0xpQVhVUmJWUG4yTTcrS045OFJQSFRK?=
	=?utf-8?B?clJ4OUZzZHZNTHZxY0QwS1Avd2xsK05Ia085QnZYeE4vMXprSVI0bkZONGd5?=
	=?utf-8?B?OE5UU2dIV0NJcnNyTG8rUnB5azZhU29TbGxUOUNpck51elNPWWZuMXE2bHZt?=
	=?utf-8?B?NXZodXpyMDhZdDkyZXlyWUFGczlGTDA1bXMzSW5SZlZlUVhoZ2I3eFNIc1Rl?=
	=?utf-8?B?dVFZRG9IeEluaVVyWFRhRXhZVzhQWlRmall3MFpkUEtIU1ZFQnJBZWVhZVZw?=
	=?utf-8?B?WThBYWg5V3VOWEgramVZaVdJRWsySHJScmFPa1BWL2ZIaTlhRE5LanNVQWdJ?=
	=?utf-8?B?c2NtcnBnOC81R29OZThUMzNjMVZnMWc5USt6TjNUdUx6VytkVDVJd05Ib3ZK?=
	=?utf-8?B?UVlVVFRqUndLL21UTFpUb3VoQVp1TVJVTE1YaGxsVy9NNWVvU1Ixb3ZPanpK?=
	=?utf-8?B?dE1SWkNOQ29ZK1lEL2lRTnpHUi9BcVU2aWFGaFpKdWR5SDBGRUlzaHR6bG9i?=
	=?utf-8?B?L1JBdUVxQzNLNGRNZHBDT3RMRGNxbjNvZGx2WDlQUUdteG5DOXQ3QzhXSEx5?=
	=?utf-8?B?NmY3aTZ6RUtKcTdnVkVMcUdEdkpORkszVFBlL0N0SXorRkxIMVhORUpkcmJI?=
	=?utf-8?B?bW9aUUllVWpNcFZSWXBnMm1ESGwxcWVoTUF2SU42MG81MFJuM0dvS2JiazAz?=
	=?utf-8?B?dnp1SU5BdHZFNnpValJWTjdpY201T2VRdWM3dFd5NHVCTnVGWDZCVGRJNWRE?=
	=?utf-8?B?ZkxxZ01EeGNxWkF6UGZkTXlrWWNzUWV2Mmg1YnBzYWw0UXFGZUZMUkh5YXBN?=
	=?utf-8?B?UldWNUFMZk1lNnJyTm42MmllUjZNSTg3Z1MwOFlMRE96M2NQZm1oK3AvdUZM?=
	=?utf-8?B?TWZJNHhic3JHTWUxKzlUYVdyb0NBcVQ2eWlDMEc0Um5RNzh2dG82M295Z3VY?=
	=?utf-8?B?bTFScGZjOTRRUzJSdCs1dE9VWWR3NzVKeFl3ME5YT2NKbDNWN3AxRk5Mb3Jz?=
	=?utf-8?B?UEhWTCtJNHhBOFpQVk8ycDluNjI0T0tjNVphbkUxSHJHNWNhb3J2SDFMVXEv?=
	=?utf-8?B?ZG95YnVHdk1QeTFYQi9kUWZuTFJ5czJ2U2t0ZE5heTJpSEtEaXFCeG5nL2hF?=
	=?utf-8?B?VHd4a3JmRWxIWUxDaGduMHJwRVlsUXJ6SnhnRE9aZUlPRXZuZlZkR2pWSjZG?=
	=?utf-8?B?V05QaUw4djhEbTJPb25HRWk2cU54Y2E3YjJJblBoQ1duM3RMUVBZRHhzRjI3?=
	=?utf-8?B?MW9SVzJIT2NuT2cvN1lQSDFIR3hUV0dFclZ5ZnZrd0lGZTd4ZmNvbVQwNVRJ?=
	=?utf-8?B?b3hzNDN6Ym5PcklVWnhUdmgwa2ljZDRvZ1dhbmljaWE2dUQ3a0M1YVphN0NS?=
	=?utf-8?B?L0o5M2t2RHVkNGFJS2hMVGlENEpXWUJhek9McWZpUjNBK0IxV1BDem5lV2pJ?=
	=?utf-8?B?Wk1IVkxWL3VaSDJrd0FMazR1cWptUzJXNEVEZHdqNG9QZG9wemJlUWRxVk9Y?=
	=?utf-8?B?eUtXdlFteVoyQm9SV2dEZno3d1UzU1prNGJRZnYrYjl2d1o0VCtTdGNQdUdM?=
	=?utf-8?B?QUZib052ZDhlci9OSFNHSU1MZWRJU1NpV0YrQWMzVzhuZVFReG1mQ2FZaVEy?=
	=?utf-8?B?cjNYYVBiVU5sVFJKY1lmUGQ4OXdJaFdJQXlMK2l5REhkSm5OYXpOWVRWOXlV?=
	=?utf-8?B?bDdrRFduSWFIcUlBdTB2TzkrKzNzQW1QcDJsdkM0dTVCdVlFa1MyQWZkTU5Z?=
	=?utf-8?B?MkxtUT09?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	6:lPy6riBAldqhsSdHknnu61o6Cb2fw5B6IbSQ3rYTESfhe+6p+zvukRK4ttK5V9A0ybgpCdTpDOTUGXU6flLKsljPItmrYYvwX9lNvVbPwjx/EDdYCvWfXU5eYifNaJXWKkmnwZgbCwoWUafvTYus/GTP4mz4W4Pbexo6nFPCZpzdDu1WspLXEGSY0uv6/UXsXvIXup7vQGoXzBXHY6KjWNNlfFJEnQR1RVhB46VWlKpvYpf9fRqWh4MOy4ew5Rx4JvFU0ESLhUCesaPNQiwn7CwSdFNZ7HLplLIV9/7k8SljhfkvkbKSf+o8ZAB6HbMBT43Rayu/TJkXdA7E4zE7DFa+WQjjC8YEoYhEPz4FW8k=;
	5:uOMAOrCSMnMVbPMe/UcpvGVeDfH+Kj5O/mv5YL3n4qrRNb7DxjhetJcK27QzbFSZ6nppP6kKG5JQVDj2/kBxu2Afz82Soo3s8/nGbdjwRraMBg5dIC2hQUIwlUQ5ntIYhJY8DTbNGTW3fLDq+a98Q1yQWLlZgLE5ccutKZISXlI=;
	24:IqjKUOWXMftNkIU/VlfAJ606sgFqqWU8zrvXy65RkbDmUpN+shxQdb9pZG0TZ0gxXNs6yiNpx3SprwE14vHGcS0KjnmbFI1WdGj7XbI9mgg=;
	7:3klwOIP6EPYYDuAnOvcARTbxcxJ8Zx/FwEb5snEqxXlGfALDVLDW/nTLxn8L2TivHuC+Ct/5VHvNFEh+vT1KVq4AykdgdbYw8Sz/xXl8mLOvtvZd5N+aVhrKSvQMYRm/MlblT2F+rL14iU+uKHeiMWuBtnAVTH7xFyb8NmltyIc1wmHe71cPqiUMbfCqXoNnNZDHk2G2AEKO61zgjy5Bl1ThJ0AfZ9hCUlV/gYGVUTRrNIYCSqM0TNKB0xeXCEkd
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2018 18:20:47.3403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de731d07-3414-4de7-fdc1-08d5578db48b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2942
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
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
X-List-Received-Date: Tue, 09 Jan 2018 18:36:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

+CC Khem Raj, who has done a lot of work on the SDK and may have an 
opinion about handling relocatable cross files.

On 01/09/2018 01:50 AM, Nirbheek Chauhan wrote:
> On Tue, Jan 9, 2018 at 5:21 AM, Martin Kelly <mkelly@xevo.com> wrote:
>> [Jussi Pakkanen, Nirbheek Chauhan, I know you may not be on the list; I
>> added you to get Yocto/OE and meson upstream all on the same thread to
>> discuss integrating the two]
>>
>> Hi all,
>>
>> Recently, we got meson added to OE-core as part of Yocto (thanks Alexander
>> Kanavin!).
> 
> Great to hear that! Thanks for your work, Alexander :)
> 
> [snip]
>> - The cross-file does not support relocatable cross-tools. This is an issue
>> because OE SDKs are self-extracting shell scripts that can be installed
>> anywhere on a machine. Once installed, they populate the env with --sysroot=
>> and other flags pointing into the installed SDK location. For example, if I
>> install an ARM SDK into /tmp/sdk, I would get something like this:
>>
> 
> It does support that as of 0.43:
> 
> http://mesonbuild.com/Release-notes-for-0-43-0.html#can-override-executables-in-the-cross-file
> 
> I believe this should solve your problems with cross-tools at least.
> Note that this also works for pkg-config, g-ir-compiler, g-ir-scanner,
> etc.
> 

This sounds like the right idea, but in its current form I'm not sure if 
it will solve the problem. The issue I hit when building actually were 
not caused by anything in the meson build file itself; they were caused 
by the meson sanity checker. meson appears to assume that anything found 
in CC, CXX, etc. are all native tools:

$ . /tmp/sdk/environment-setup-cortexa7hf-neon-vfpv4-poky-linux-gnueabi

$ echo $CC
arm-poky-linux-gnueabi-gcc -march=armv7ve -marm -mfpu=neon-vfpv4 
-mfloat-abi=hard -mcpu=cortex-a7 
--sysroot=/tmp/sdk/sysroots/cortexa7hf-neon-vfpv4-poky-linux-gnueabi

$ meson --cross-file /tmp/meson.cross build .
The Meson build system
Version: 0.43.0
Source dir: /home/martin/xlib
Build dir: /home/martin/xlib/build
Build type: cross build
Project name: xlib
Native C compiler: arm-poky-linux-gnueabi-gcc -march=armv7ve -marm 
-mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 
--sysroot=/tmp/sdk/sysroots/cortexa7hf-neon-vfpv4-poky-linux-gnueabi 
(gcc 7.2.0)
Appending CFLAGS from environment: ' -O2 -pipe -g 
-feliminate-unused-debug-types '
Appending LDFLAGS from environment: '-Wl,-O1 -Wl,--hash-style=gnu 
-Wl,--as-needed'
Cross C compiler: arm-poky-linux-gnueabi-gcc (gcc 7.2.0)
/home/martin/xlib/build/meson-private/sanitycheckcpp.exe: error while 
loading shared libraries: libstdc++.so.6: cannot open shared object 
file: No such file or directory

Meson encountered an error in file meson.build, line 1, column 0:
Executables created by cpp compiler arm-poky-linux-gnueabi-g++ 
-march=armv7ve -marm -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 
--sysroot=/tmp/sdk/sysroots/cortexa7hf-neon-vfpv4-poky-linux-gnueabi are 
not runnable.

Note the "native C compiler" line, which directly uses $CC.

I'm not sure if this is correct, but an easy way to fix the issue is to 
ignore $CC for internal sanity checking when a cross file is specified. 
In that way, meson would probe the system and use the normal gcc for 
sanity checking while still using the cross file for the actual build.

>> $ echo $CC
>> arm-poky-linux-gnueabi-gcc -march=armv7ve -marm -mfpu=neon-vfpv4
>> -mfloat-abi=hard -mcpu=cortex-a7
>> --sysroot=/tmp/sdk/sysroots/cortexa7hf-neon-vfpv4-poky-linux-gnueabi
>>
>> If we want to setup a cross-file to use these arguments, we would have to
>> generate the cross-file on-the-fly (not good).
> 
> Out of interest, why is that not good? That is precisely what Gentoo
> does and it has to solve the same problems here that Yocto is facing.
> 

Right now, the SDK contains fixed contents, and there is some top-level 
logic for rewriting a few paths to make everything relocatable. I don't 
think OE wants to inject a special-case one-time generation of the 
toolchain file at SDK extraction time, as it circumvents the normal 
build process, which normally sets up the right environment for 
generating the right toolchain file. For example, cmake generates its 
toolchain as part of the build process and the SDK just extracts it 
without special knowledge of cmake or its contents. To my knowledge, 
nothing else in the OE special-cases its extraction logic, so it would 
be a special-case that would likely cause us problems in the future. At 
the very least, we would need to get more OE maintainers to voice an 
opinion on this.

Another approach would be to generate the toolchain file truly 
"on-the-fly", such that the meson command points to a script that first 
generates a toolchain file based on the contents of CC, CXX, etc. and 
then runs meson. I think this is a bad idea because it is complex (will 
definitely surprise people) and slow. It also breaks people in 
surprising ways when they accidentally use a meson from outside the SDK 
due to the PATH setup.

