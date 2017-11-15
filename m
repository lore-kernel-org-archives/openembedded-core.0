Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 943 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Nov 2017 17:43:16 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0064.outbound.protection.outlook.com [104.47.41.64])
	by mail.openembedded.org (Postfix) with ESMTP id 45C60784CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JNR9Z87TdrE/7134IzTaMgOtlPgOTOaCCtThWk5Ou5Q=;
	b=cKDv3ni804ddkvguM6z92JJqVEFfDC54553uuNuwKAQbUzWiWB33QHRTu48KGlgqUpA0wUDWpAmDyWde9Lk1x5pLDhddLrMBzDmAtKahsrGUI8DDZR46yBavOi5mgnmRIcl4uNyPY79bQN/17smhQXu9OEdxtlRdYsIYyfZGvOk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.172.156) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Wed, 15 Nov 2017 17:27:31 +0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1510744037.git.alexander.kanavin@linux.intel.com>
	<e92a4137ae84734d1e3b5805964054305ce2388d.1510744037.git.alexander.kanavin@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <6031cd63-6acf-2737-8f0d-9a5516af80d4@xevo.com>
Date: Wed, 15 Nov 2017 09:27:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <e92a4137ae84734d1e3b5805964054305ce2388d.1510744037.git.alexander.kanavin@linux.intel.com>
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR1101CA0008.namprd11.prod.outlook.com (10.172.74.146)
	To CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5884e9f0-8306-4e84-6476-08d52c4e280a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:655tbxQCxEiL0PbC6asxmbD+HytKXwqEtI/ih/FT6MDc/gxI2QUBrun8FUxJ8KlvrhbxPsooNiT91+nn5eYonoUPQ1xd0FXk769rXCUZK4ozgx/a6ECCwuxL+pwyJiftIkLFQ2vTGAIsQj2riMi2eb5kMWLv/lCFs17nOCWiQ/lEdehAhxkb/HvBusv/OuMerqIaNMcgi/Vioxj7tQjSRJnnBbrR96fSTZj4Xmlw6pUs4+U/pQF0rMh8uECIL/81;
	25:ni9pOV2R91qe6Awbm5bbzsQBlKVl8uEZvou4a4Qx/x6NTjWYALlsSqG8enj4heAqQMK8i6gmnm1uHALdm0vLz7FiS15Lckal2FNTIAazlgpXhaNZ9r8X07509cdANbbemqhvFoQw+qt7g5NAsVE9+K6HWNBE9qCQHYlcQpH8LMSRaWdihenY69Pg7A3hmX+fWvOj4+bNncjYmZiqCJhV43QVRysPze02yBFOx104Be7kfhmnsJgfWu6WbRIiCIEnGChpLj0882KQRaJhoGRGUMZR9xV84q7l2jbPGTYeUVhXD7SliGwU9djzjhepTqz73hyvK78pqXGq7qFSY+wp7g==;
	31:9GRBgrBdWe2TQY7onDlZ7s+CcXgxLj4n5BJ2eMaCioLdR6ANAkoUS8omxCTSQlkftnkE5Qskk01P1JZjsc9Ex+4/R9wgvbjGewbaV9ByLyMUlIdTg4nTTAU/pGu2Nhg8vSumOGBUUfRkaRCh+Czavoji6enqi4x1CojFKc1fbbEGVuTvSiXFk4wjU4AuStfAa66fB48oemBr11xFkayTIF3JcDaIg+l4ScgV6Rdm0s4=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:DoNKIqKpEVIKEQgMLbUgMkMSNUJi93xjiDR8HLRfjXoZv3kEGEXzKObzOxaPaUrPJ0mekLtl17CuyMvzIUDF4J3BWveToDnWJvLmNN7g/Xsz4Ghme6EZq7l+npIbD66bFUp+Sg1oGnv5vnkVVeoveize1XRNzNV4Jaa5wk+9AJtQBsR+RASROd9LJP1nf89CiCYBofzgJ/2oWXrgDB5zLsLisHgqjT6KDnbBziRPG2/9nLcIbefFpf0G3ASnbaL6O77h5R06yUK6HbRac+dB+L1xl1iNOVKdpyre4jPtA1WdCVrKrzjT6hd1t4I5kpMvAqUbqdY2ayYXRmXRJk7WpAZDHcDwn4DbsnYW7VByGE2jbUYGa0p/Dhd/C0bGJmN9Z4YnlqTPaR4igksIjrwSAr+4c8/3IZAtyuQhDSntsxM=;
	4:NZLqDSXtprrbFMkw9d1dbEj3yGWu0WqpJlN4aMqui+zja5PZ9wRhpLVnbJMYYPauYxsNecOt/W1EpzHwMylf5HvV9gn1Y8c2OGZ2qlVU28rMFhGwwIy4dvt0OHZ28KlT+4IQ3KE3JN/RUyOi2n1rtUWMy/BEEoYWc9V28tFmqG51DQQszfxiEmyP6wIzMTkc1EHzn0Pm3HG+zFkGo2iA6aG/QqbyAlX1N7d6qeo6zvQjN4mDWuDbXP0Utf8B9B305QMYy4HRARbq++Zq7HzsaIdYHL7opquGSWk/Co2KUpgp8fPsv80gdBePEXhvHVqoxrxjkJIWTSLk/rMWm4+dlmnF4+AzyyLxtmrVqqmvu7NTO59Xx3xv87VVmxT1WZQh
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2933C44DC948293DED186C4FAB290@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(788757137089)(228905959029699); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3231022)(6041248)(20161123562025)(20161123560025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2933; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(39830400002)(346002)(376002)(199003)(189002)(24454002)(77096006)(5660300001)(478600001)(53936002)(6486002)(6246003)(8676002)(33646002)(16576012)(58126008)(6306002)(68736007)(53546010)(64126003)(2906002)(316002)(6666003)(23676003)(81156014)(105586002)(65826007)(86362001)(90366009)(67846002)(16526018)(81166006)(189998001)(2950100002)(53386004)(575784001)(106356001)(8936002)(97736004)(65806001)(47776003)(36756003)(66066001)(65956001)(31686004)(230700001)(50466002)(31696002)(101416001)(25786009)(83506002)(3846002)(7736002)(117156002)(229853002)(6116002)(76176999)(54356999)(50986999)(305945005)(11771545001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzM7MjM6Q01qOG5ab08rMXdKM2d1bG9aZkIxRlVS?=
	=?utf-8?B?YXFtYUM4WmV0OFBQZWtJWSttWUlGVjJUblVOUzE1NVdBV0NNeURlNldyUUtG?=
	=?utf-8?B?UGQzVGs5eTVaTXAzQUU5MXJ1REd5bXl3d3hBTlpoUEpqRXoxeG05ZGFCYXdW?=
	=?utf-8?B?eFh6T21Ia0plVUc1Wkk3SmtWdy96QUx4TUJ1QzVoNndNV2NxbStiMlRIVndo?=
	=?utf-8?B?Z1RnVzhGNUFLN2hxTnhNQTdMeXJlM0hlWHhudURocFhtb2dRUmV1eU1JSXY3?=
	=?utf-8?B?YXNXRVRyN0IvSExNSFkxYmF0YnpIUVJaZjhDTC90aWtHNFh5bmRwVlY2TjBw?=
	=?utf-8?B?ZzBUTmNzWDhDeUQ3eGhiVnlBTTFjQkRDbFZsbDh0WWZFWHR2V0xDTHFRUTY0?=
	=?utf-8?B?WXZBaWtCbmQycDc0TTBKTDhxRnprWGxwVWJVS1MreTQ5bWdGK2Fud3NPZ2dl?=
	=?utf-8?B?YWNMSVNmdnFqNTJobFlLUm1nb0Y3aVBUN1ZVSkE2YksrVnIrZTdBWjhENXpt?=
	=?utf-8?B?cWVxRzZWSDdvZms5cElYQTV2VmFlTjhoQlVqdVVoVG1yVXJaTGI3K2MxUU1v?=
	=?utf-8?B?dHV6Q3JEOStkYnF1UmZ4V3piWFZMeHBZWTFUV2pBNktpVk1zVGxVK0lDWEp6?=
	=?utf-8?B?YndnSFpxK21zOEtPbGNsOXEvb09Xa29YdVVyeGphdFVvUkhBdFNDb0w0RXYw?=
	=?utf-8?B?ZHlIcXhSOXJxUGh3enRscFNEeldxRHdBeUVJRmttNkloTkFZWnVsRHNpVVlM?=
	=?utf-8?B?bmwzRTZhZVZDcXE0cUl3R1E3blZHYXNDZ1Bpa25IbDBxSnEySlEwbmJlVjRD?=
	=?utf-8?B?bS9ZdmFMaUNTRjNHWWcxdDRUWmtwQWJXc3cyREJXdDU0c0RNb01kTytvZ0lO?=
	=?utf-8?B?OWVKUTNTSUloSS9NK3E0Y3g3Rk5VMlJZU3EwTjVPU0RPQTgydTlkMHY1a2ZD?=
	=?utf-8?B?SkFOenU4WkZPRVZqWVVPaEw3d05mMGl4N1BBdFd1OHJSRWUrN21Nek01K0tV?=
	=?utf-8?B?RXZQazlHcFFGL1RQaTdITEJBSnlYMXBocWNaTnp2L3VKOFFZSUtlbE1YZGpi?=
	=?utf-8?B?bks5M3NsM0hTN0EzTTcwWHp4OHA0aERScUh4dVpiQW1KdGw3NktUMzF3cjRz?=
	=?utf-8?B?NlovK25zYTBoMGQzYjVYTjIzY3BVWC9tSnMzY2ZrWWVaOFVHellzeXRhVHFQ?=
	=?utf-8?B?dnppMmp1c3g0UU1UeVV3RFg3Wjh1WUZGREtIUVYzTkdySWJTbDZJTTFIQWlG?=
	=?utf-8?B?QVZjRXVQZGF2Rk02VkM5bk1rRFhGcVRBSFhjQUNUczlhaFhGK3Uxekw3YUsv?=
	=?utf-8?B?SUluOEdqNDFkM3NmdHprTW55cXdXTjVFSWo3YXQwUDdBdWVGbml5cXJvbXlx?=
	=?utf-8?B?cExiSlpwYVRJcldGcE55bHQrSVdzWkF5NWd5Wjh4K2xPMi9qRThRRmhJZk1Q?=
	=?utf-8?B?SUs5UThuOXVPSWVZYlBLdnIzZWNuSTdzVXU5NGd6ZTMzdnhDNmVVU3FUSEhK?=
	=?utf-8?B?ZzkyRTV5ZThHSjM0YWErczZzcWhmc29KM2dManY5QkdtR2orMFFVdkQ5QWdS?=
	=?utf-8?B?aHFDOE5ITDNTQ2h1a3N4dUtMK1FYZXBobkhFaDBxZzU5QWw0VjlYc1ErbmpW?=
	=?utf-8?B?c3hDNzRLY25yWThPUEpZclhlclhLeERKazF1THQ0UUphTVZoU2JKVU1yL1Q1?=
	=?utf-8?B?MFlDay9tbUdvZ1lTOHdMV0FuRFArRFJLczdMSEZRSVo2OWpaeElpMGNzdnFi?=
	=?utf-8?B?WHFTRUx3bHZBeEJtRndUTm1YY01jMktZcHFFTTlGUXl6Zi9BbkNKV2NIMWlJ?=
	=?utf-8?B?Q2NaVlF4QkZGejNUT2ZLaDkvUTVYUXl1cVlaUis2R09ldHJWVzdjdVBqUXpy?=
	=?utf-8?B?NFdmbTBRRkVGTnFuODhKL0lZQWVVN1hreXdqZURyZzBBNEpKaEQrN0hNdWd0?=
	=?utf-8?B?TlZqMmVNUEN5NEJGWHBieDY1ZElZWlBwTmsxTVN1OVR2dGtsSlJnZGl3L2lk?=
	=?utf-8?Q?lNauv6D2?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	6:yD41Uj9YsGNstibDRaGWsWc04e+kXp70dzpSetTKDGhxWa7enlNKf9q/esDHWBDEZICOcSzPIY7/ZqgWgLTp71ZmAiAWy9So6fevO47rKgw0jZEpH/xN5oPUG0uPTy+JOX/Rll1ueAypb+EgjBencUqY826bqCRZoyeAJeAJ8IqPkAdiAT44cwrueyIzOqX5n7nm+9aWpoVC8QctcKJyQqlqY1T43P5qj+I2QpIvceLDlJCsbOziOAGiW/rTuWHMevhPYiRb0Vsh2EZZF9MThEbtCERZHjd8h/Hi7eg+Z3uFewyxAEKC7nd5BUPtMvqHOu0ACFetLUgNQ7itsz5BVlbftq2Z6NMpAnsmqUWeobk=;
	5:gqq0zdihMqo7UUK/xiT4OKnuTUChBAJ9bvrgH/nusQ7ln//A2K7jg/3vAy4MTJf3dhwqsiF7omR/uXO0KJ0laoqWwMHH+mq0cXfQrGop8uwucyuzJNBl5npKZoN0SK5R1cEAhPLlzAvO/h+kHe7dGNGUwVH8y0TiKePrid7rQkE=;
	24:Enb8NQ8E284sbcbO4gMJHqwU37ZCJqj6J1MDJY+xBrDhrpUkBJEIvdpRMY7OfePTnKBGgWP9cuXffX7PrmLNJ4ztRVcrydLmrFAPxOQ7J3E=;
	7:UC/7P+j6mndzEMzA1cjh2u3Bujc+BICsFAzkfdOEIftQdHr3dsAbrjpAezbYAp/YvUBlW086IT3hnR5bzAD04V7gJDEKQWGW510lI1+3T0nDmb69wVlNcHlFcXKY5EQ+mPJroqVpNlB6C8j7pLY/JGQ3SX0zQZSj10ywVzsa6ah2L7HwVGtU3ioOBqmvMpJ+rl/895RDc6d8unv9hlIXZgWVP3bQ3cVfzyvNpdyOBMO583ScNwdBl1NOoXZ9Tmzp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 17:27:31.8946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5884e9f0-8306-4e84-6476-08d52c4e280a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Subject: Re: [PATCH 1/7] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Wed, 15 Nov 2017 17:43:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

It looks to me like there are some changes here on top of a forked 
meson.bbclass from meta-oe. Did you rebase the changes on top of current 
meta-oe's meson? From a look at the git logs and file contents, it looks 
like it needs a rebase or we may drop some patches.

On 11/15/2017 03:08 AM, Alexander Kanavin wrote:
> The original recipe has been provided and improved by:
> 
> Ross Burton <ross.burton@intel.com>
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Adam C. Foltzer <acfoltzer@galois.com>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Linus Svensson <linussn@axis.com>
> 
> I have added a couple patches to fix up gtk-doc and
> gobject-introspection in cross-compilation environments.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/classes/meson.bbclass                         | 103 +++++++++++++++++++
>   ...ix-issues-that-arise-when-cross-compiling.patch | 113 +++++++++++++++++++++
>   ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
>   meta/recipes-devtools/meson/meson_0.43.0.bb        |  19 ++++
>   4 files changed, 276 insertions(+)
>   create mode 100644 meta/classes/meson.bbclass
>   create mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
>   create mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
>   create mode 100644 meta/recipes-devtools/meson/meson_0.43.0.bb
> 
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> new file mode 100644
> index 00000000000..f6cf24c33a7
> --- /dev/null
> +++ b/meta/classes/meson.bbclass
> @@ -0,0 +1,103 @@
> +inherit python3native
> +
> +DEPENDS_append = " meson-native ninja-native"
> +
> +# As Meson enforces out-of-tree builds we can just use cleandirs
> +B = "${WORKDIR}/build"
> +do_configure[cleandirs] = "${B}"
> +
> +# Where the meson.build build configuration is
> +MESON_SOURCEPATH = "${S}"
> +
> +# These variables in the environment override meson's *native* tools settings.
> +# We have to unset them, so that meson doesn't pick up the cross tools and
> +# use them for native builds.
> +unset CC
> +unset CXX
> +unset AR
> +
> +def noprefix(var, d):
> +    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
> +
> +MESONOPTS = " --prefix ${prefix} \
> +              --bindir ${@noprefix('bindir', d)} \
> +              --sbindir ${@noprefix('sbindir', d)} \
> +              --datadir ${@noprefix('datadir', d)} \
> +              --libdir ${@noprefix('libdir', d)} \
> +              --libexecdir ${@noprefix('libexecdir', d)} \
> +              --includedir ${@noprefix('includedir', d)} \
> +              --mandir ${@noprefix('mandir', d)} \
> +              --infodir ${@noprefix('infodir', d)} \
> +              --sysconfdir ${sysconfdir} \
> +              --localstatedir ${localstatedir} \
> +              --sharedstatedir ${sharedstatedir}"
> +
> +MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
> +
> +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
> +
> +EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
> +
> +MESON_CROSS_FILE = ""
> +MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
> +
> +def meson_array(var, d):
> +    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
> +
> +addtask write_config before do_configure
> +do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
> +do_write_config() {
> +    # This needs to be Py to split the args into single-element lists
> +    cat >${WORKDIR}/meson.cross <<EOF
> +[binaries]
> +c = '${HOST_PREFIX}gcc'
> +cpp = '${HOST_PREFIX}g++'
> +ar = '${HOST_PREFIX}ar'
> +ld = '${HOST_PREFIX}ld'
> +strip = '${HOST_PREFIX}strip'
> +readelf = '${HOST_PREFIX}readelf'
> +pkgconfig = 'pkg-config'
> +
> +[properties]
> +needs_exe_wrapper = true
> +c_args = [${@meson_array('MESON_C_ARGS', d)}]
> +c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
> +cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
> +cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
> +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> +
> +[host_machine]
> +system = '${HOST_OS}'
> +cpu_family = '${HOST_ARCH}'
> +cpu = '${HOST_ARCH}'
> +endian = '${MESON_HOST_ENDIAN}'
> +
> +[target_machine]
> +system = '${TARGET_OS}'
> +cpu_family = '${TARGET_ARCH}'
> +cpu = '${TARGET_ARCH}'
> +endian = '${MESON_TARGET_ENDIAN}'
> +EOF
> +}
> +
> +CONFIGURE_FILES = "meson.build"
> +
> +meson_do_configure() {
> +    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
> +        cat ${B}/meson-logs/meson-log.txt
> +        bbfatal_log meson failed
> +    fi
> +}
> +
> +do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
> +meson_do_compile() {
> +    ninja ${PARALLEL_MAKE}
> +}
> +
> +meson_do_install() {
> +    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
> +}
> +
> +EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> new file mode 100644
> index 00000000000..ca3d7095066
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> @@ -0,0 +1,113 @@
> +From 15e054dce6ff11d2cb219c8c09a31b26f0e58b62 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 4 Aug 2017 16:16:41 +0300
> +Subject: [PATCH 1/3] gtkdoc: fix issues that arise when cross-compiling
> +
> +Specifically:
> +1) Make it possible to specify a wrapper for executing binaries
> +(usually, some kind of target hardware emulator, such as qemu)
> +2) Explicitly provide CC and LD via command line, as otherwise gtk-doc will
> +try to guess them, incorrectly.
> +3) If things break down, print the full command with arguments,
> +not just the binary name.
> +4) Correctly determine the compiler/linker executables and cross-options when cross-compiling
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + mesonbuild/modules/gnome.py        | 18 +++++++++++++++---
> + mesonbuild/scripts/gtkdochelper.py |  9 +++++++--
> + 2 files changed, 22 insertions(+), 5 deletions(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index 6ec7040..4cfaefd 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -713,6 +713,10 @@ class GnomeModule(ExtensionModule):
> +                 '--mode=' + mode]
> +         if namespace:
> +             args.append('--namespace=' + namespace)
> ++        gtkdoc_exe_wrapper = state.environment.cross_info.config["properties"].get('gtkdoc_exe_wrapper', None)
> ++        if gtkdoc_exe_wrapper is not None:
> ++            args.append('--gtkdoc-exe-wrapper=' + gtkdoc_exe_wrapper)
> ++
> +         args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
> +         args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
> +         args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
> +@@ -741,14 +745,22 @@ class GnomeModule(ExtensionModule):
> +                 raise MesonException(
> +                     'Gir include dirs should be include_directories().')
> +         cflags.update(get_include_args(inc_dirs))
> ++
> ++        cross_c_args = " ".join(state.environment.cross_info.config["properties"].get('c_args', ""))
> ++        cross_link_args = " ".join(state.environment.cross_info.config["properties"].get('c_link_args', ""))
> ++
> +         if cflags:
> +-            args += ['--cflags=%s' % ' '.join(cflags)]
> ++            args += ['--cflags=%s %s' % (cross_c_args,' '.join(cflags))]
> +         if ldflags:
> +-            args += ['--ldflags=%s' % ' '.join(ldflags)]
> ++            args += ['--ldflags=%s %s' % (cross_link_args, ' '.join(ldflags))]
> +         compiler = state.environment.coredata.compilers.get('c')
> +-        if compiler:
> ++        cross_compiler = state.environment.coredata.cross_compilers.get('c')
> ++        if compiler and not state.environment.is_cross_build():
> +             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
> +             args += ['--ld=%s' % ' '.join(compiler.get_linker_exelist())]
> ++        elif cross_compiler and state.environment.is_cross_build():
> ++            args += ['--cc=%s' % ' '.join(cross_compiler.get_exelist())]
> ++            args += ['--ld=%s' % ' '.join(cross_compiler.get_linker_exelist())]
> +
> +         return args
> +
> +diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/gtkdochelper.py
> +index a2cbf5a..19331bd 100644
> +--- a/mesonbuild/scripts/gtkdochelper.py
> ++++ b/mesonbuild/scripts/gtkdochelper.py
> +@@ -44,13 +44,14 @@ parser.add_argument('--ignore-headers', dest='ignore_headers', default='')
> + parser.add_argument('--namespace', dest='namespace', default='')
> + parser.add_argument('--mode', dest='mode', default='')
> + parser.add_argument('--installdir', dest='install_dir')
> ++parser.add_argument('--gtkdoc-exe-wrapper', dest='gtkdoc_exe_wrapper')
> +
> + def gtkdoc_run_check(cmd, cwd):
> +     # Put stderr into stdout since we want to print it out anyway.
> +     # This preserves the order of messages.
> +     p, out = Popen_safe(cmd, cwd=cwd, stderr=subprocess.STDOUT)[0:2]
> +     if p.returncode != 0:
> +-        err_msg = ["{!r} failed with status {:d}".format(cmd[0], p.returncode)]
> ++        err_msg = ["{!r} failed with status {:d}".format(cmd, p.returncode)]
> +         if out:
> +             err_msg.append(out)
> +         raise MesonException('\n'.join(err_msg))
> +@@ -58,7 +59,7 @@ def gtkdoc_run_check(cmd, cwd):
> + def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
> +                  main_file, module,
> +                  html_args, scan_args, fixxref_args, mkdb_args,
> +-                 gobject_typesfile, scanobjs_args, ld, cc, ldflags, cflags,
> ++                 gobject_typesfile, scanobjs_args, gtkdoc_exe_wrapper, ld, cc, ldflags, cflags,
> +                  html_assets, content_files, ignore_headers, namespace,
> +                  expand_content_files, mode):
> +     print("Building documentation for %s" % module)
> +@@ -111,6 +112,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
> +     if gobject_typesfile:
> +         scanobjs_cmd = ['gtkdoc-scangobj'] + scanobjs_args + ['--types=' + gobject_typesfile,
> +                                                               '--module=' + module,
> ++                                                              '--run=' + gtkdoc_exe_wrapper,
> ++                                                              '--cc=' + cc,
> ++                                                              '--ld=' + ld,
> +                                                               '--cflags=' + cflags,
> +                                                               '--ldflags=' + ldflags]
> +
> +@@ -206,6 +210,7 @@ def run(args):
> +         mkdbargs,
> +         options.gobject_typesfile,
> +         scanobjsargs,
> ++        options.gtkdoc_exe_wrapper,
> +         options.ld,
> +         options.cc,
> +         options.ldflags,
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
> new file mode 100644
> index 00000000000..f00b9b2a2d1
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
> @@ -0,0 +1,41 @@
> +From 84cb251a33190ec82faeaad321518af4b309c55e Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 4 Aug 2017 16:18:47 +0300
> +Subject: [PATCH 2/2] gobject-introspection: determine g-ir-scanner and
> + g-ir-compiler paths from pkgconfig
> +
> +Do not hardcode the name of those binaries; gobject-introspection
> +provides them via pkgconfig, and they can be set to something else
> +(for example when cross-compiling).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + mesonbuild/modules/gnome.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index ba7e4cd..00472af 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -380,8 +380,6 @@ class GnomeModule(ExtensionModule):
> +             raise MesonException('Gir takes one argument')
> +         if kwargs.get('install_dir'):
> +             raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
> +-        giscanner = find_program('g-ir-scanner', 'Gir')
> +-        gicompiler = find_program('g-ir-compiler', 'Gir')
> +         girtarget = args[0]
> +         while hasattr(girtarget, 'held_object'):
> +             girtarget = girtarget.held_object
> +@@ -392,6 +390,8 @@ class GnomeModule(ExtensionModule):
> +                 self.gir_dep = PkgConfigDependency('gobject-introspection-1.0',
> +                                                    state.environment,
> +                                                    {'native': True})
> ++            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner')
> ++            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler')
> +             pkgargs = self.gir_dep.get_compile_args()
> +         except Exception:
> +             raise MesonException('gobject-introspection dependency was not found, gir cannot be generated.')
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-devtools/meson/meson_0.43.0.bb b/meta/recipes-devtools/meson/meson_0.43.0.bb
> new file mode 100644
> index 00000000000..bbb48d9197c
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson_0.43.0.bb
> @@ -0,0 +1,19 @@
> +HOMEPAGE = "http://mesonbuild.com"
> +SUMMARY = "A high performance build system"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz \
> +           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
> +           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
> +           "
> +SRC_URI[md5sum] = "b0d389cc5937928c2f5114656dc5a99a"
> +SRC_URI[sha256sum] = "c513eca90e0d70bf14cd1eaafea2fa91cf40a73326a7ff61f08a005048057340"
> +UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "ninja python3-core python3-modules"
> +
> +BBCLASSEXTEND = "native"
> 

