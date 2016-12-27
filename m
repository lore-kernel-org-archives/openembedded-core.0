Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 1057 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Dec 2016 17:44:42 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0128.outbound.protection.outlook.com [104.47.40.128])
	by mail.openembedded.org (Postfix) with ESMTP id E527C6079E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XAntvwECsRWPpB8+L/OFZ3Z2NNXqO9iWQJ7s3YDSuNA=;
	b=aLwosahSmMge+S4n4vV/tAedrqQAcZSU7wVMIHE0tEXM0YUc0clZVCfB7VQ/qknhjpHZ+Dq4C3M8f1omiUMF3PDmZjwCsqzk5oMaqEKaJoEcJsosmnKWMMZ1Qf/zw5pkZ8e0bftvEgjLKlVV4UMdIU9uFmVnmeeJf8g8J2YCmrE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.0.62.53] (130.164.62.126) by
	BN1PR04MB844.namprd04.prod.outlook.com (10.255.204.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.11; Tue, 27 Dec 2016 17:12:32 +0000
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1482461845.git.Qi.Chen@windriver.com>
	<95643e3c862b04090093f9806cbd0486ace51013.1482461845.git.Qi.Chen@windriver.com>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <3e663ecd-0b33-5374-74bf-454d546ea6e2@ni.com>
Date: Tue, 27 Dec 2016 11:12:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <95643e3c862b04090093f9806cbd0486ace51013.1482461845.git.Qi.Chen@windriver.com>
X-Originating-IP: [130.164.62.126]
X-ClientProxiedBy: CY1PR20CA0059.namprd20.prod.outlook.com (10.163.250.27) To
	BN1PR04MB844.namprd04.prod.outlook.com (10.255.204.147)
X-MS-Office365-Filtering-Correlation-Id: d84d042e-cd61-446f-4490-08d42e7b8c06
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BN1PR04MB844;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	3:7VD6sPxWamPVpizbEq+V36AYMiOonNHP5qhKcu7+OtmtfpGXjYLladhF/J/uVVParig5s4eAZgpVcqL+Tvzf+Rtxa0Y1++MRSx9JTMt7Ix8MRo3LXUyK4Jen0UAz6JnrGAUi+3DRrpUdrjWNPJAEHem/VmOCIlz7Hicxw2pBWvHrOFoK8nfGVFYLOhjnWwQa8ozXd6vfH1zRoorAUQTSrEpk54S3HWsEXCZ5H5aHtrMsarPTyABEYWz7ocWmyGgASwwT4im6IgEYK3kRwOGm8w==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	25:F4eWpUpQ8ph6e/t7H9ASjOjtEfZFOMIgT6UJCkrsxd1EmKcdM4+FjnDaZPsP3E3MVwJ4hvy7P3kluYI4IlFyIh2TllN/2Ss3auZOMl+dQFBdWYlTZYOw1l2FOTtLvg443EEVGYTe8eopb+VNC85dLrLysO9bQgEaC/x+Ac7fjMSBd1cErlKRaIT2SM0pSAo3ffHGgTQwEHOWYpWV3XFrIVktGAZB/j32AUEtqH7lYB86l8owzA9iBjG+a2M8wSsleDpfCiQbkcXZDQDErLBKs/qwPmFoJLQng/VUKn2D2af7V8Tk97t4o6wl+5gBv05GMTd8BAir56N/e+OfGVNhKL1i5+szKkiVps1/9uOYEuemSyWfw0wUx0YqXNGWdNczkQXcQuIrEtavy0mHuXVAHbqtkCBzLqgCQnW9ZTCeJfZWiCcopDNiffBHQ1HxvWAwC3pCM9zUVuFK54MnzXRlI7MfTxEonM7XBw9erVvyKl7mtTxLSAreQMlYqpCew+x9SrMu4LzsaJ98xNUw1dM2EmndBp25HNVX+lRCoZW3pqSpkuqOStzWAyaC7CJ1pwc2bcONcBYsGq+MQcsxKb0uUKSaxY6wOwteSTSZZOFZDw0has9gKOh2CPrq8BgRU1ZEyyXNPWaOJjNLPbiFLrDwr188T504IcCENL+lxkc9auYGAAIbNl5YIaJgKy/apzlNte/XJC7wlC8jaOQcnmu/tjktQVymjcUTrQDAtpLu/EzZYEFIlnILCnYYq9WpXSK304KA4JtuFjD0LRAzFdJ+q2hLnO33QgtGjN/tI9+Phi0=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	31:WKkyvMqqqVy79Zd6J97rOlvgrif1Ob1bPqC7lfNO/5c1MhZ5Gx+mVwQ015mRhlsD8136zezpY857cOezlUANVbl4W9A7YxXtvh9UuDeLoT6IMTK8rIfLlycHcF6oAiwIY7Bkl91ixLz3sbLJXB9/+0CPlfYvGBabzfYEDCB26oh5SRvASaTaKw9ssPIjALAe4nAaluBYIrnJ0GiJ6S1/AGg3AmwUahCT58SQy0XyWops+E8lK1tfLsmiVBoZlzwOuS2f2fNzxAhcMfKA/a2CEQ==;
	20:mI7EW0SXUyMye004UuzPctemt+1/atuhQ+cfw7fxMbuBHjFkc5+eQsdeENwkdzdaF5LA5Y8BC6RERlPXVgjcj6p0bZ5oWyNxqnuw9kQXCp0D4Xy03CsmSgPcMzeEtJZFbbIP8/hVrRxef1W4jrWp5JR1BcV6dnA8aBdmIbDZE9fC0cb9Tit65un//robi672s9xYOHCNuJ0RZiCIh7xLuJlc1xEjjQplFYuMjF9NcAHSyZ1FF/KMlCyDwrJUAkkjxWRVE3qq4U3Odqswyv49FkBZExtw+0TUY2V7m6IFJdK8eaaaJn6ocuLXUv0uSCZNtG0P9JmzV3I9sTrzi+nBZ/8GoTQgY99z6fhYuLguOaYX3+aA2I7vCfQjmUy3+QOlTT3bbvKHsTNI2+wnM5kF4kFarc8jzA7d94gaQezS94QuNJfuLCOstuPQsSR7yaC77T0scvKN986I5IRjvrkQ7L2X4xCMn3OetkIDeTE8J59qGs4dRUuy5m3duJ98E4gq7ZvciAGah4f3YolBitgEreY39MOBHBXBma5IxBrGAxjX+3+w7dFmaOAT/Vxjwdez24g6E01nStAeCRUMVr9m18Igy73kQc7/VUo1UOlwllU=
X-Microsoft-Antispam-PRVS: <BN1PR04MB844F35F9D89D5F80979180686690@BN1PR04MB844.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(215639381216008);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148);
	SRVR:BN1PR04MB844; BCL:0; PCL:0; RULEID:; SRVR:BN1PR04MB844; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	4:ISEaqF4Raocaw1o7x7pi/8YHLFMfj6yeVTjFIw3jDH6l3sqeBSt61fM7sKxO1mYYrfOv8tfyYXBuDnLnywbnJj+wAQcth3e8k1aehgTz8oHhg1pIotKnVwsrEWtejeAArGBvqnuMW2fQNd1ZDFSzrrRv4fKSf1UcjLqSppCLSDJaO4NgRwyJ8lHS3NER5BmASHI7l5wBJJ9OeHirhXf0o9OxEf4yjLUlpWUfxGzTFqNTg3aLYBsosgt2qFDTinCDYwTqeELbB/3yxHGJytTp947D9CsONWqCpvOkCAOk8/lsiOq+s8zaD1p81XY226ru866ASVAR8nAGh6J0qbgjfzNdUeSW7ustMlNU3Osu9xvGDQNvvivmnXxXubLKKR+IlY4l841odHtq/2FEu7+53D7LtpIop1yfAEMszCdLp/rIZ+vhmEbea2rbwVEGlyoCyJM7qgSXI1fEf+yJ8j/dSWBMDgjl88nuGtW14dPgF+AR2cnC3zOPvsp3xiTe8DnrSEFVqMc8YSthOxzD/zrqeGBQ4MEMpbMhfNhQAHL0T4xL7SKOVOBFijNMI0RDvZ1QMCjwGIu3wm6+AqkKZxhkO7Y+idhx7HwlJN8avbkh57czDfrXRoZ70EGVp8PFlxMu
X-Forefront-PRVS: 0169092318
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(7916002)(39450400003)(377454003)(199003)(189002)(24454002)(65956001)(65806001)(230700001)(47776003)(66066001)(23746002)(305945005)(86362001)(31696002)(7736002)(8676002)(5660300001)(65826007)(81156014)(81166006)(68736007)(101416001)(50986999)(76176999)(54356999)(36756003)(92566002)(97736004)(50466002)(107886002)(42186005)(31686004)(4001350100001)(33646002)(64126003)(2906002)(189998001)(6666003)(2950100002)(110136003)(106356001)(105586002)(3846002)(38730400001)(6116002)(25786008)(229853002)(83506001)(90366009)(15650500001)(77096006)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR04MB844; H:[10.0.62.53];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN1PR04MB844;
	23:2yJ6C91gQk2CsV1B8juWat1m8KOaOSQQr9abWe?=
	=?Windows-1252?Q?HwUWeCsmXLXwiLrvlxlzIP64IPyv4fLfEpA/5frXmFKJHG0goM7NGqV/?=
	=?Windows-1252?Q?KUs5J1kYME8EREPu796hnHmTE1CqzpJClQSo+C2ykSuEDismiouEsarQ?=
	=?Windows-1252?Q?iluz/pCnCbWHG8lSE5iqyWIEROwprKIQJzlBhf+HzMOD9MnoP3YAKyn9?=
	=?Windows-1252?Q?bgDedrpZU1r5LgaBwH03Y7MH/+KdehVKBaRcgL1ACjz8NxjOF2VEZORT?=
	=?Windows-1252?Q?Y6DOjt8DeAkRCbD/s3cJOOCu9uj5PrWn1BthOu41vmGU/1927pd8Sdgt?=
	=?Windows-1252?Q?/HDu+nSW42fU3EeRJ60yS1UdlPVkrdZtK7zqDr2vR4DAXE+svVahg5DC?=
	=?Windows-1252?Q?Q9d5ERtriKYaBMrdmLHIEyckpBbNXDowponyFB0hAPsAlcu34fZ28vdp?=
	=?Windows-1252?Q?XnlIC98OjtC2VtNHbXqU25psukmLhf9nNXlwLp/xq6pjsuh3/xWqzYgU?=
	=?Windows-1252?Q?TBgGbWwKfJmdXr7DbpVfoZmvsg5INRmosoZB00Qy0TsL0nMzHfYExf3N?=
	=?Windows-1252?Q?1T0zCKWncYbAVQv5fGXzJSWka5fdQuRQRu8W9i0F8shYaj/gCQLgDAWP?=
	=?Windows-1252?Q?4t2zd4QN+gutXCLJIw3b/+rdalEWK/+dvBqTnQL2ENKirFoDskmRGwZr?=
	=?Windows-1252?Q?RgbtdjMU6Igkplvi1GoT+mPahryCcbkduuJ9icnaXrfKHxcjD6HOSWCM?=
	=?Windows-1252?Q?NEWqCsax+jdkovLOdNQzmTB7/ykvizLBtjLWFeAo6fBPIg8ZwTcIqSCf?=
	=?Windows-1252?Q?qkB6BhF0LH65hCDUI66NZ4x6jmTJydo2HgM5o0LnGnjkHaoC75SzKqBk?=
	=?Windows-1252?Q?qwSDpxoCu667UwpH7KVqoEAs5T1QcN+I4OJXyFaoBDY3uBABUAqA1YWG?=
	=?Windows-1252?Q?xZwXyO8XyYHXoiGXdH7tssEUmKsJtF0p/WPHpUwd2VrLOkCUB1RuCZ4Q?=
	=?Windows-1252?Q?j/+RQ6LaqkWV30N/1njE1ODZ92POfTSkH3pTGmrisWOqd8moP2XV1F40?=
	=?Windows-1252?Q?ItmHXu9MlwQL4M9zIzTmcwcrTM7z9J1nxmH4K+Npke56DktyIk65+V8J?=
	=?Windows-1252?Q?bmclqr5q1/VIf5FyXUA//LZlR3cwjv1ghnp/M/vURRsYXYNJvzf/hF9+?=
	=?Windows-1252?Q?dPpZHC4rq9nrFXHhjGbOZh6tQOTj2IgqaM7eZo/O52xiEysP0uwn2ri5?=
	=?Windows-1252?Q?ISh3rAdkPVT1KPhOAqTcgltLB6rLDwfUxJ5IoNdhKK0hyx6nkhg2KEQ/?=
	=?Windows-1252?Q?yPYoXjrpb4I14RKUYcyTwm+IzfXe4UwLwoszSg2+w4n0Qg4ljGel6FD8?=
	=?Windows-1252?Q?ebS+TYI+4e/yZAc1WrFi37kmxl24QzjZ98xVDxEKOz2VqYE4hNnqxdll?=
	=?Windows-1252?Q?KdCoH1rLKIPqjsIq1FKCdhu7ONG47/SDCqpNg2gg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	6:73o5nEzDxZ8jQjiDAMVyvx+fNWi76TIsbaGiEhYhqGyV6xUVfiHpCEomlfs71M+63LbGOVUEndR97oEYAOgXJG/z8gEp9i8cFuRTplpDsiW8vTRPZPJ2+PlnZ/nFBNqcY4ITtDLEWlnSM8UvV73OU4bhvZ1DsKV5T2CzzJ9IVsZjC6A0INZzgC5drcI9xm00v/mo2ksGsePIzFPKHOoKcuECfOoX0BXm/mxrIife9uC7A688zaALmBKwyVK1XWfhn2+6imfKDlibWlbxvyyr5tXic2a8LCRLEJo7UadmE+8NjV9SywVCgwlW+13floEfG2f38C+QcO554P6tKWAB0fKZveaQfbSTRjZdo3G6R0WMlCv/OMvQhETszQ8VLN3FDnHWDUi1Mw51eMRL7HZIgw5NYhsTnC5p07JicEjTtmo=;
	5:96TLduNQ3Nr1+uXvaoJDZSDGp/WpGQriHLU5Shf8B6hKxKjqUwtQyJ16ZCHrwYMn78hX/xTkPFhidYv4H2tsWQ6HixhkQbVtToTOmHEKkFanIeKEFP/h0LoXzeccplZe0LJ2nZfcF3Px4tetrPnE8g==;
	24:kKxIQAIt9DKEFdib3KuS57IGTnYa8oDjVEDPKSP6UIVWzZd/mVdxIIbYxaQqpq2f9/n3LxIgL03GmJKyijMh5pxnEk5Riwv67FpOLViRBrY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	7:UUOGGjYOEPg71nuZ0bUTUfNu0BX26RuzatxvOH80tXEn9OFDyU8c42mcWmYpSjwlMUyKEidV2flnOPEm7hPgRxikwrRqRMTEcGOQNsrMqbPAwN6QhF/Gh75sgTBlbcCDMFfsovBg2yzQVrsXsmsflRw5rVkUpkU44JpIJQNBB1hGd8FD8bXSTwLHZOuAjFL12Cj4EAYn1UYnC+jdEA12/J+J2x/aZjQcFOTImoc0Rop66lNldJAKxTs2+ZMGzOyP0tJcWqac6UiHCaYS8hD8ybrpCUpkvnGuY21x6xVPJevjDi6L7wSzv8s+GmQO3L4K3+EATkxazyUZd9GwHRfYKMakbIn9kJvzhg6rdlmlJZXTFuX+udwr+9ytOlc8ob8LLu793O9Q281oswLWJzm8DE9dKgvcRhzOIcuXMvaY8BMy86rZDTIytQyeUi9qPAsSog8/jzmlQY+nGPka216I4w==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2016 17:12:32.7605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR04MB844
Subject: Re: [PATCH V2 2/2] opkg-utils: warn if update-alternatives finds priority conflict
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
X-List-Received-Date: Tue, 27 Dec 2016 17:44:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Chen,

Could you send the opkg-utils patch to opkg-devel@googlegroups.com too?

I would gladly pull it in

-- 
Cheers,

Alejandro

On 12/22/2016 08:59 PM, Chen Qi wrote:
> If multiple providers for a utility have the same alternatives priority,
> which one would be chosen is determined by which one is installed later.
> Our alternatives system should be able to detect such problem and warn users
> so that potential problems could be avoided.
> 
> Modify update-alternatives to warn users when detecting multiple providers
> with the same priority.
> 
> [YOCTO #8314]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...rnatives-warn-when-multiple-providers-hav.patch | 26 ++++++++++++++++++++++
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  3 ++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
> 
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
> new file mode 100644
> index 0000000..afce1e1
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
> @@ -0,0 +1,26 @@
> +Subject: update-alternatives: warn when multiple providers have the same priority
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + update-alternatives | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/update-alternatives b/update-alternatives
> +index ca01d5d..ffad853 100644
> +--- a/update-alternatives
> ++++ b/update-alternatives
> +@@ -90,6 +90,9 @@ add_alt() {
> + 	local path="$2"
> + 	local priority="$3"
> + 	remove_alt $name $path
> ++	if grep -qw "$priority" $ad/$name; then
> ++		echo "Warn: update-alternatives: $name has multiple providers with the same priority, please check $ad/$name for details"
> ++	fi
> + 	echo "$path $priority" >> $ad/$name
> + }
> + 
> +-- 
> +2.8.3
> +
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 19a852e..7b01bfc 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -10,7 +10,8 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
>  SRCREV = "3ffece9bf19a844edacc563aa092fd1fbfcffeee"
>  PV = "0.3.2+git${SRCPV}"
>  
> -SRC_URI = "git://git.yoctoproject.org/opkg-utils"
> +SRC_URI = "git://git.yoctoproject.org/opkg-utils \
> +           file://0001-update-alternatives-warn-when-multiple-providers-hav.patch"
>  SRC_URI_append_class-native = " file://tar_ignore_error.patch"
>  
>  S = "${WORKDIR}/git"
> 

