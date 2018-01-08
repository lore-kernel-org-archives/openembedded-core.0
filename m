Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 1937 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Jan 2018 00:24:14 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0080.outbound.protection.outlook.com [104.47.41.80])
	by mail.openembedded.org (Postfix) with ESMTP id 655C1788D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 00:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jm78v6XAI1iR7E8n4TMVjP7gExUM5nVqp5jT+VrHEOY=;
	b=rL9WhczQ0Z0RdaA8FnkhnTs0Q8eHj9RM1H7zcHckZ/R6aB/zfSYYB0pXdOB5589nNN0YQNhL7g2D0q4ITyPu7GBIYR96DrQIAliThBsqTmZET6vyKAYO2CKiVNRAyFznGvgyOAhS26uVqyL+NtAExEz3Q4Nipv4wpV32CICLAaA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.156.10.210] (205.175.118.51) by
	CY4PR0101MB2936.prod.exchangelabs.com (10.171.240.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Mon, 8 Jan 2018 23:51:58 +0000
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
Date: Mon, 8 Jan 2018 15:51:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
X-Originating-IP: [205.175.118.51]
X-ClientProxiedBy: CY4PR06CA0046.namprd06.prod.outlook.com (10.173.44.32) To
	CY4PR0101MB2936.prod.exchangelabs.com (10.171.240.10)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1913265-d961-43ea-9864-08d556f2ce1c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR0101MB2936; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	3:ry0stFGZsTCpzJP9cklCruPBogSJn6KAiVBLwKRLQEkkEnvNfH9HGQr/RqWG/sM2YJaVJ/YMxO00UTtBConOiobkz1CAoZGWRwk8LERK4cTUOwCuJaVkjba7iV8qS457C0sJyfqbM8dSXA4E/VAb7BflRyrMUtZZ6XPQReCs7cMbkB3preIXGaC3T/V2WaUzyMp+K9agoVhZg4U8mp9fl+6Xl7m96Nz7IB48qyDiu/UZeebvOgsrPEBUJj/cZfvG;
	25:02ApT2A5NboqTUC7PPMxVAtFNrkF7ieprQ1ZdI+KrnYNev39ZkN2THoTjonCdD9tDZKKEvh//nzaiBagM2q1dknxGF9KhFSmuua0uR6XxUEytxWXKg/YhJQkg/EWbNz1QtC444i+SMWaUco4ipG8dL+v+xeW8xnrs8zdQ4NKoxW2fL9DRbJsvyuU2BH6Qx+1hXrMC1XXGGqnweyEOGWQwSFNKLzlu6KyDgl3ItI5Xo1XLyA276e0xnKWG8kPaiNevlCAbkxT7p3GRMaUkEPjuzBDOhWs3LHhJaRbZievpuVQGWqSzSaA+3t5kJLqRnEOlR4u2XVrJdI5JAz1CiOgYg==;
	31:Ob/BjH06csz4eLIdkm55iuO/P3prFNGl9QDnj4QUmRWCjnLG7jgBEA2y+bIXa0LAHWmUCNM1DCDj0MNvTLswJpwqCMmaWdoccLj51aHz254NsMrYl1YOvO8hc/8fRK9RT5zm3il7Vu7nTHrxQuWPkTtHYRBPP/XMHSziDqm3nw8zUUrEHkZIWA8Wlpw0Am7gZ1R6JGvV+ChqeJOG2RLwQnvbtO3kdGKjljHwn6vkZ6Q=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2936:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	20:Vew9HnbW7r+n4RkbePiZQKu67vPlqs+alaWjiRz/cpNfpOMtudopkXK0JHq4moF0yjEFF+JnTiLMj+vFxJdQSzayiZp2UTzuU2BsJiXQ4lrkOfwntEbc9WRMuZokReiIySkjXikMuarfFrXE6lPYDLpRTgXieEoDpkNjogsfNpwH068X8UvYBZOv8t7jvd08KxS6zwLiu1OT59FknMdB+yHDzUDhit6dh217VM1m3nbg79RXXRrIvNPU+tjKXIr9zUlflTStOhNvHZA8qf1MLzJzBoji/7o9d+jcJHbIZ3jyd99UunRreGgnp7dNaePAPwZ4rd2zY5bpZuDDXHSOvIW5CKdnt/fGi6f9qHMsNqz/jVfPMpV/IfvKBIrJTTWjMCUOJ0mSkOBzAdTHqri/X62zsO3jZeVQO/2QpOwdEa0=;
	4:oxU+X+kJUvj8SVtcC6djnreHDQW4lasCc0BfLl/ZiWNWqbq7iEo3+JsV805c4mNTYXPsqBSAL4RUiDk7rcxIy8zuc5L+MEZ88VzDc5gHFZouh6G4Vyrd0vv5lq9wW9IelxFeZrKdrppi4wM6qp4s2lW81UO6kIThrbV+lKL7NLWqQE9pSO6jlzz+DFDl5XuYH1devdeV08nsapgFlg2YSmT5kkEQ8GaMtkMRdCQ2wbrjXfhbmmWAiX20BkBBRVkcZtg7UTVDlsNEFt3/75ghhw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293667D04864EA76C07EE1A3AB130@CY4PR0101MB2936.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231023)(944501075)(6041268)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR0101MB2936; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR0101MB2936; 
X-Forefront-PRVS: 054642504A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(39840400004)(396003)(366004)(376002)(39380400002)(53754006)(189003)(199004)(36756003)(106356001)(67846002)(53936002)(50466002)(39060400002)(90366009)(5660300001)(86362001)(105586002)(68736007)(6666003)(6486002)(305945005)(16526018)(7736002)(81156014)(8676002)(77096006)(65826007)(31696002)(6306002)(97736004)(6916009)(31686004)(65956001)(316002)(58126008)(8936002)(478600001)(52116002)(6116002)(52146003)(47776003)(65806001)(54906003)(66066001)(16576012)(64126003)(386003)(4326008)(25786009)(83506002)(2486003)(2906002)(230700001)(81166006)(23676004)(966005)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2936;
	H:[10.156.10.210]; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzY7MjM6cGh3TFdRdlB4RHREM0RJeDhXamJ3UE9N?=
	=?utf-8?B?VVlCa0hUc1lHN29EcUpLU091OGM2YUZzWCtQYlNISi9QZUEwVFhYV2Nhdzcw?=
	=?utf-8?B?cUd4bVM5eno5Z1pIcW5lekN3SndkZkdCSndUenQvdVVDdit6cGtaLzY1bTFm?=
	=?utf-8?B?OG9DdERKT0ZERjh5Z1lCMWRDeW04N0Zrbk5tQ0RNbjFpd2dXSk81M3FCMllR?=
	=?utf-8?B?RmkrSmg3ZFQ1bm9HVFI5T2p6dEk4eGdaYlpMV1NqSCs5UFpiRXlNZjRLQXY1?=
	=?utf-8?B?bGlqWnJ1aEQ3VGhrdWtPbFBpNXEvd25TM3BNTDFYQStRU3VaRjFNSTd0SXNE?=
	=?utf-8?B?UmppeEJ6MWNnYUR0WGtLSVZyL3orR2xtQ3ZadnpNdEZqZlRxWHBBR1QyTUU4?=
	=?utf-8?B?d0QwSjdRN1EvRlptVnE5SCttUUhwL1dUVENQb2oxbUZXUXBKdDZxcUlOQjVn?=
	=?utf-8?B?SjdtMXNPbVloL1ZkZEhRc1Z5L2hiWTFBdko5L2h4aE1UM29heFBnRzJJOGxZ?=
	=?utf-8?B?UnF5L2Ewd0NuVHdmRmhScDFDR2dORXVLYXJDWVIrWThVSzZSM05FdEhpSnBJ?=
	=?utf-8?B?MjhOYTZrd3ZjbDlKUnFVZlozOHVpVEkvMXhpUnJGdXozVG5pQXlkaFMza3Jt?=
	=?utf-8?B?bmo5MU5LbElSOUVYSVNoNG1tSUgyTUlZc21oUDVSOUw5aFZERkQvSVBna1Yx?=
	=?utf-8?B?UkpRUTZib3dVc01uVnBkbndIcWZ4NmlZRnVqUTRqbmtYWDFvOWpkSnBIZldx?=
	=?utf-8?B?TVNLZXIzVlZ0S0lqMENxbDc5eFJwTWx2eXh2UmN0YkxJOUJEZDBNeFdya0ZS?=
	=?utf-8?B?Mk5XYklrWW1UQzFNUVZjUUcyOUhiTDExUEFXRzlIMDU5Sll4M29oTXgybDc3?=
	=?utf-8?B?d3hRamlqS3FFcko0YjkvbkdTZUU5NytabU83VUQ0d3BKY1ZhQ3NFSFpMcldS?=
	=?utf-8?B?b0hINDJIRkdkSHJUYnBra0UxaEl6d0JTcVdiYjdUWE1MdUFCTjRmL1MxMjRQ?=
	=?utf-8?B?NjFzQzVRMXFSU0hEWlpBUkZCeWw1NndLVWlLaTc1c1F2NWQwRkY3WG1ldXNy?=
	=?utf-8?B?V3k3b2JFQXF6NHVpMllkSFZtKzBVblAvaDF6Sy8yckRYYnVxdWZWUzQvTllw?=
	=?utf-8?B?anhKRjM0S0xNYzdlNTBhbzBkd09EMTNTUm4wMHNEa2IvSVBURGFCckZRV3Fq?=
	=?utf-8?B?KzJmVUtkcFNnUkdJNDMxVUJ5c2FVY2c2MkQzb1FwZUduZXRUYXZPaE9JMmp3?=
	=?utf-8?B?VFZaTEg0eUhkQUsyZFlMWDVSUXJoY25sb0xrNHRlTDNoYXYwQzhPalZBUWhU?=
	=?utf-8?B?aVM3Ny9OZ01manJBTWNoNWptbjkxVWpoYTRadGpXellXSHJPWGJrL05mTkl5?=
	=?utf-8?B?WmhXNitBUDdyUnF3MG9vcGo3OFN6YktLL3VvcnA4RlJKVGFNSEM4Y0FaQ1dY?=
	=?utf-8?B?Tkd6cUladVdMYURXd09MWGtXZ01MWFBuZmdNeG9jMVk1RzFKZ0lYU0k2OFBT?=
	=?utf-8?B?enArMXg0Rlo1ZlE1MU13L2k5ZUhsYU1FYys5ZVZnUWRjc01Sbk94bk0wNG1Q?=
	=?utf-8?B?clRWUWVFbXppdXk3SURPcnpSclQ0YUN3cTNnaDdGRVY5NkZLMmJ1SWtjcjE2?=
	=?utf-8?B?UEVac2hsejJJWW54ZGY2UEVDTFdqRlViNUl1MzNQeDdGcVIxZHMvSnM0cEEr?=
	=?utf-8?B?WEVQbldZZm8xQUFac2xrV0JUVTMyN1R3TkxweTZoOUwycFgvZUQvYU1XVnpQ?=
	=?utf-8?B?b0ROODV1RlM4VGUzRWVSVHBmTHdVWlNzVWx1TTBDWUUrUTV5aEh1UHNVQXlN?=
	=?utf-8?B?WE15SEc2U2oyV1lYQXNPa1EwMTVKN0gwaGZXem9PNWZ4V3lZbS96SERvcWd3?=
	=?utf-8?Q?5e17xX4+6cOi8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	6:ALH7H5T0C7hUrttLnZcIf759StA84Zdbz0SAWUHzUINbcEbJWNx8iOKQx95cfBIaKB/t4wNX0v/PRyO4rBzAr3DPVEtn+B2CSaW7/jzWcvCSIfhjyLpqA/5dH05Phs96ff+Ytpz2p5YIsuzoIPfiN2aec1iphpnzLLcTzdmcS95qyupOQ834juOb8VT96F8dCRSloo5yR+hCY4PI/jgoRRsWVhS9qPsMqO42UrOiq+srZ5NQrpxrn7bm601oot6srsKmumPH60qDE5BH5PS3krT1PHmfC/fGZCM+vn+Vofck8xYXqcn9Uh3j93zAxNcPCjnMRdRfiKzqoTYc5fRhU9jSGeyFfA8EqN9ZPzZHw9U=;
	5:MQIu5H3uJGiWDmYIAwFf1EWPHtW696mSZCUqCEl8hNJIRaOGQrmO1yF53BOit9A/HMmUFYkoEHcK2rlcG04Cj8JSMOFj2xtEuGG2tK2qickfIR7+m+OjwT9TjvOXMxymRcRXM4vXoGgZA98iuejSanWHC0QGFfiPbSPw1tHx114=;
	24:lw63hP1lKTguiy5bmH/Jg7FPgliIK6aOZosSjTy27WkAJfECE+k2osGZQad2esJgq+IXRiJUau961fEWQxSl/kBSgvz7aHou/Btod4RoqTA=;
	7:+7ALfeIFdbfyVj3FIm/U58XprnvzaOmGEpBxufej3q0W7DBGVLd/ceFxwMSGDdsvaC/lUnAK1MEp9EdZH6yA2qPLQt7xuPhfrXrg+IBKLbPoxOb9uJa9O+ZyJj4s39FW2lVsr/hyAAfNZYBymJq9hCto5/g0nYYFEpPXajBZOwHfqraVBp2JqSDwtOJFdEDRWItlSaucMEXY1HoiToU0ufBsRSm3FG1zrzfN8WoTg+HK96FGJ4gp0ceudHFv2wz8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2018 23:51:58.0816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1913265-d961-43ea-9864-08d556f2ce1c
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2936
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Subject: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Tue, 09 Jan 2018 00:24:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

[Jussi Pakkanen, Nirbheek Chauhan, I know you may not be on the list; I 
added you to get Yocto/OE and meson upstream all on the same thread to 
discuss integrating the two]

Hi all,

Recently, we got meson added to OE-core as part of Yocto (thanks 
Alexander Kanavin!). That said, it doesn't yet work with the Yocto SDK. 
I tried adding SDK support to the existing meson recipe (BBCLASSEXTEND = 
"nativesdk") and hit some issues that require some thought.

I wanted to get OE and meson upstream on one thread to discuss the 
issues and come up with clean solutions for solving them.

The issues I'm seeing arise because meson and OE appear to have 
differing views of how a cross-compile should look. Specifically:

- meson assumes that CC, CXX, CFLAGS, and other vars point to native 
tools. However, in an OE SDK, they point to cross-tools. Thus meson 
fails under the SDK when because it tries to use the cross-tools for 
native tasks (I get the error "nm does not work" because meson tried to 
use the cross-nm for symbol extraction).

- The cross-file does not support relocatable cross-tools. This is an 
issue because OE SDKs are self-extracting shell scripts that can be 
installed anywhere on a machine. Once installed, they populate the env 
with --sysroot= and other flags pointing into the installed SDK 
location. For example, if I install an ARM SDK into /tmp/sdk, I would 
get something like this:

$ echo $CC
arm-poky-linux-gnueabi-gcc -march=armv7ve -marm -mfpu=neon-vfpv4 
-mfloat-abi=hard -mcpu=cortex-a7 
--sysroot=/tmp/sdk/sysroots/cortexa7hf-neon-vfpv4-poky-linux-gnueabi

If we want to setup a cross-file to use these arguments, we would have 
to generate the cross-file on-the-fly (not good). The way the cmake 
toolchain file solves this is by encoding env vars into the toolchain 
file, which then picks up the dynamically set CC, CXX, CFLAGS that point 
to the cross-tools:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake

I'm not a meson expert, so I don't know if these are the right 
solutions, but here are my proposed solutions just so I can get the 
discussion started:

- When --cross-file is specified, make meson not assume that env vars 
like CC and CXX and similar point to native tools. Instead, just ignore 
them and look for native tools in the normal way that meson does when 
these vars are unspecified. We still may wan to inject CFLAGS, LDFLAGS, 
etc into the build because people may mess with them interactively 
during development.

- Add the ability to reference env vars in cross files to support 
relocatable toolchains.

This would basically make meson behave the way cmake does today.

Of course, others may have better ideas; I welcome thoughts.

Thanks,
Martin

