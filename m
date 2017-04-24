Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0042.outbound.protection.outlook.com [104.47.41.42])
	by mail.openembedded.org (Postfix) with ESMTP id BC69F778D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=L5YNsvZkoO5HIIZ6xGA2F959O84A12wSZus4tqnnNHk=;
	b=w4BZP/NJPRIi8xWLQB6hMqDEOo/oXoxwxLWBLF1hqZk99hVnIiMc9Ul1NSeovX8Pty7+Ak5RoBWcpCD8EoSvNRZZpnLbldTzu58oUII5FldkVPfSu88jaej9oMK3uvccKQvhuHjEQcb6df2yyv0pCKVwP5giSmmoLlzc1Xno60w=
Authentication-Results: windriver.com; dkim=none (message not signed)
	header.d=none; windriver.com;
	dmarc=none action=none header.from=xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	MWHPR01MB2687.prod.exchangelabs.com (10.172.165.13) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Mon, 24 Apr 2017 17:52:29 +0000
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	<poky@yoctoproject.org>, OE-core <openembedded-core@lists.openembedded.org>
References: <1492820479-2808-1-git-send-email-mkelly@xevo.com>
	<58FE2CC1.8030405@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <76fcb2d7-be03-ccfc-2ccb-47b85e92a712@xevo.com>
Date: Mon, 24 Apr 2017 10:57:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <58FE2CC1.8030405@linux.intel.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR11CA0024.namprd11.prod.outlook.com (10.172.48.162) To
	MWHPR01MB2687.prod.exchangelabs.com (10.172.165.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c51f1d3-0323-4e2e-43f3-08d48b3aad59
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:MWHPR01MB2687; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2687;
	3:IgyQtbcr82dCnU908/bbbb7Orhk+RCxOrDojq94rT8I8cBqC6RgDz6DwXwxvi2fqX4xx88oy6FVWjqdg0yRJxk4RVlj7dOFf5rYSTErYX0Go2nvxLA6VkXLP792SyX+rMEoWDESPiTF02jTYVzNwMIs0qnAMrBvpcNwrycSymIeD0ZszSyo+x7JMfYopcJtHEXb5jdODhDIXzzTOyhi8VJHZoblqq8aAhfgV4hZ7HBhoV3TrPmGGUO8FUsKRhdBHPx6g4vObsVhhfcE3zpAIX4dXp5YrQL293B1XAjcOqCFztL2Zpi520ZkQOlQjD4Yfh3WePm86X6XGFpelPb1hQA==;
	25:f9oXoHQZHAFk0aM9OxaYmmmCUFHfl8LbCAz6j+NL7IqxMBJ43aR8f8kdiREfPgPhLFGyYqWdEUqFO7kf/mWf5ERJoeSfr2xo9ATMxTQwwzmgknkTTzU1cTMquPJdf7UzNfqQ8QyTciSRiyhILlwSxWi+aB6cDqo00j0Cb3BNZxrrCnCEBRXH+Fe+EEiPtMTfAMBy8Fzzdv0ziAkVqtv1yELTd4DqRVa+IhtrrPk5guUtqSeehRV5uNgegDDc1n5OR0oC9MX7d/j5DahwJL1EXayHL68sLW0MUKp4k9ZamArfeG9LCbC/To3QyxXNRqNRosVSGjE0Dtr7NO3PPIV7ZXt4Xlc0ebdLpm5rSZZ/SeA/MRexEpFMuRocEwKEASIyJU/0DVz1lRdzKXyl+cHFY0LQWwAwbgxqyJocqeZMnlHrNYslKYo2zxSKeu8a6YB4s9uMW0zimZWzAIp0lGgykA==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2687;
	31:SWFDcE28q/8EH+y4Hpf5ZOiXG9xxnjO6qPuy9lZqx66Y/jBKXvYhynZyjYmRPQ+l+6eYnjBdwrBMpo847Bic1pkMtjc8c8A/YJclT6Jh5SdJknRIIw4OrwCLGzexsV/2fdLW3/oWx7A1GwgXiUMPdVEkBErTP9mRcDfWnaGKZwZb1DgRjqbmcXkCpca2aViF5n7PdnbaAjaD7F4CbN3qwqBHMYpFUOM09/U3q19JIyeo072chFYF14Nzrm9etAHCs9/Z4woO1FRXcOtdCMM3Sw==;
	20:/PYII6tZ43tY5FStzwsE3UvcTVUZBuwE34r5drdDHjtnMYYIxXvMZB9COyhDzSVUCVmAmXxC0pGeyXbngfufmdEpjqR9KzJjHbv5J6stNSzWVZ3Zq15pHSSqzbZthB5ib3Js/INHh9+W/ZqXIOZ7tlQHe1J7TK/dy3Pep2evD2e5lDOrr6l2BIumDegTFl1CSdv5aRYlw9ATdftXbsyMgZKjZ5cZ8KL7ThV7F1vOOoO6gRURkIqd7MKWV9i3ZM64GnIfSv7QWm6MJgOLATzMtNePJAGTsxo3eIUrXBkJpbbf7mfeKl9ED68yJZRrrAyng/2b4//pc/JDT8d44cICeA==
X-Microsoft-Antispam-PRVS: <MWHPR01MB2687AAAEE9F0160B8EE1355EAB1F0@MWHPR01MB2687.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(6041248)(201703131423075)(201702281528075)(201703061421075)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(6072148);
	SRVR:MWHPR01MB2687; BCL:0; PCL:0; RULEID:; SRVR:MWHPR01MB2687; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2687;
	4:8gniLTUmvMCt+MEwW4a//bqwBsSoULSOSv66iwtcmGaOTwAaScIgSnwMjNnAsq/A+R/h3mBmIOTgV6sS0Vi9pYKhFFgleJBETIv4d5jVE4MfPtkQmb1wENPWe4xKJDsWftk9bFiRbYWY6puFpkvuqhOccY0Sl8oMFqfpiAgrMJ49J/5iwvncHC2jFTNKXb18xDD0Fjs7sd2+GY42mrkbUmvXFTMI3Cw7EcACMrGoWhmn/32rSrPmVszYCECCI/jr+JsXOAVSE4yfqlNZFeIcG0cn7+Yh7Gi9TAIojLRD/JlfsKYXDxXd28MY3tF7XzZ7HOzbJ8Iwf5VfjJdQ6DJf5DdhxpvltMCNS2adcscj0w3ma2N3GppJ8h1BJ5en5QHKBv6cJwZMrQPaGORVr3m2v/++apJYxG0CgFkopqFiCbiLjcTqMNJwLkbbltblh5Gdh0MrxhEm/3SsyBWIKP4/8FJbpobkJ+xT2whPwspqXQfZzS2wgtHRFQGT/3H89bd7E4JZf3gNokoUvqYVEWlhb5vWRtguyy1BmtvJP+dvA6TmkWAkd9LtqjQ7lZLvrrc15PusZu36gluK/bGbQaZQAx4C5qu9n6XczhWnMF+9vmz3gG33ErB4wG+39esQaF8sgB5s6T23f474ILb1sUVDy6espcc9U5q236eMo4fxq3aUtxF85fNCoC90Gb9DSFJn/tm5LAKm2npxDEgSo5eb5A==
X-Forefront-PRVS: 0287BBA78D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39830400002)(39450400003)(39410400002)(39400400002)(24454002)(377454003)(83506001)(4326008)(25786009)(53936002)(65956001)(47776003)(54906002)(53546009)(66066001)(6116002)(3846002)(31696002)(6246003)(77096006)(90366009)(6486002)(86362001)(38730400002)(81166006)(8676002)(50986999)(229853002)(6666003)(189998001)(2950100002)(54356999)(76176999)(42186005)(33646002)(2870700001)(50466002)(4001350100001)(7736002)(305945005)(5660300001)(23746002)(36756003)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR01MB2687; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; MWHPR01MB2687;
	23:54ERS2IXNf0mjuvtegwX0SckIOwFVAMgAB49A?=
	=?Windows-1252?Q?rPrnGFF3BQJHzhFwTZHvH400l/xgeAIp9reqpbs/DeRJVkWwWPgN6m8+?=
	=?Windows-1252?Q?MNR0UD6PE9mM3291poFNVjZCpYEFcVtjQIXq/v1ZqYD3Fv33dFqpvNK/?=
	=?Windows-1252?Q?ph5oMLtEL1Jd4qYr7gRMfjRitZmprNI+jJ4Gd48FeauBscZwNCwYYzCf?=
	=?Windows-1252?Q?LeYSkv1hp2yn8zQYXo1qsLC39ZSvtj9HQxBEjivQCTvg/UV1T/1yzjEW?=
	=?Windows-1252?Q?57P4A0DudiediVf/JX+JhreCMT/bo6DD+Pwd15D/YGs0LpyAmZAWXimV?=
	=?Windows-1252?Q?DWvgHjxodQynq8J3Aojctsw6S2ZqytBlA2GHLq4T/AX0elgHD4o9kB7D?=
	=?Windows-1252?Q?FucCcDW+9WpVcd6uoe/65PkoEbqt1gOIBSApt9BYmxxfbQVGpaKelTZR?=
	=?Windows-1252?Q?Q+QUAJhkvx1ZCuO9QrCgehj6xH7xP+mhAYMd5iPq+Ty64yClUXgiAClu?=
	=?Windows-1252?Q?syv0+AcAhwxb4CKMuXeJn4ZIDyOU/LnL9vXfo1TW21rHtxAOLDRE8Z95?=
	=?Windows-1252?Q?qZaveCjLYLZghcOCx7VGimKxwFRM2HmUHGl3+YJwNaNeZJYa1duZX+Hz?=
	=?Windows-1252?Q?DWwLviBBxERmidZCFhe/JzKqEHIPs832mskNFU0pxPdBu5FvfN/wHeAx?=
	=?Windows-1252?Q?O9tSqH57lYMNfQdbwX0LVEMLlVJnZn6NAo7gPaRzzcKWZv7PhOdIltRP?=
	=?Windows-1252?Q?Ab45/L+JEoBoZAUm1vobc4WOXGPmgxINPWdsg7zWuCGTxJ64K9N1obQD?=
	=?Windows-1252?Q?uQtMvgYEiN8GzIA736lN0+ciTkAYU4yZppuQ/A4S0DqFkBgl1aSDg1sh?=
	=?Windows-1252?Q?2MpKe5sDXB0GXqM/hmE5K0ezHAIjclPy5pbEacq/vBCpYXCrNeLzV9ps?=
	=?Windows-1252?Q?iB3OUjDTnU9XDdKGJxXxf4SW2gZ/XZFfOpkHUWXZB6KpeeveRVCmmMnn?=
	=?Windows-1252?Q?3X7eBwXPX/r9K5/hSYibRYJO6WyPcT1SlXjhU6YtO466Qyn5QoHA8r4L?=
	=?Windows-1252?Q?/B4dmFLZBd81/VMvFc9OiBIKcHob0s1FVESPrhbmj/86cbkzbWeQcZfq?=
	=?Windows-1252?Q?RvZR1BBxVCH9oA+7Viqn0z9EU80jQHHc7R2LLRE6WLrIrYVK3zVuQGdj?=
	=?Windows-1252?Q?ZUTb7GToY2XnbAmRh/HofHihiSKzJ+FK106u9LT8cZaJEAC2Lu9CYeBQ?=
	=?Windows-1252?Q?YDWcH518sCzFHbMIpdjKLoqIX1mvbU6p7mAHDI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2687;
	6:KrcIhusLYYEQvUM4Z+X/Saz7+sZL47a7ApQFKgR1ZzG6INw/+x3Dq7DdZr7hPr+S7SjUG+NrmWLF6uNLa2H1MzmEUllzpiUcQ1tr7gYGafNihNiBRz3mUdCvxdaTuFrlmHwLUatqRe9raIyCFPHNCv9LuanPwhT3OEKp7hIKM5sJIjb4Lloy4+fS5ILSfrsHszCvtOAQKQwkZ6Cd16HYtDw1GXW4ogvzNaU2e3zMIRlqdEsmiBK6QGWuVTJms2oiTWhcJW16xyJM3AkU6RoUzmVWx0/9JSB48M7YF9r2nvOS7FFnw6BbZWA/bFzx5mjQfBdxQ48gMiBYYExY80ZDx5Ypx4kMYozGaFXDN2MJJSwDXd/Qkah8CQvKOXcoxr+C8kcB5RgIaG9bt8LBuS4JXYjLnVAz0KmRrDKLndBrxcIEWNYWlz/IRGAPlZyvcxbRsOojjEnDnixThZiiGe7j+2DTayqqCD/83mv7Xxs+qSMVUDgDyiXKEw4xIklbIU05K62lp0LCJFppRm23uq2wZg==;
	5:p0/xDTGzHEPZHbPpAVnFrNfX4rNhfZLZ8VouKSNAyWnYWcD1MgGEt/OYXkS0dsfiiOLC6zLX8USAh5FNqOmkkTE0D1VUoiGj/h2dIMiap9zUCSdH6xdj92mq1+VfaCTUJuttNgDEonheseB+BBRraw==;
	24:zyY/FcI0XTf8Q43k0mVy5m5WWBJ+xCHPumEvWKZHJEj58eOAhDsnidQr6oKbyFUktClQkZJfkf3JCfMQzvYzXgrQOmapkA4NgqI+AL0fv4c=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2687;
	7:RidTylYx3sZU7FUy2Vk2e8aMODqOUphnzKiq9II/lCgDtdmkdTCknf/G8Q0eNFRmWaDMHC+YPy63QpAxOyzZDWiaveqNGDGUpx39kkLOtcsPpcmW0yJJoAWvEvKqZ2eAxXNe6svFcgKwlpGA012nj5qYaegaGF4tTfldoL53O+BkUgjhBrSNPjwoiSgbBMCh41nwJqI5tmZ8eI3rueYcrDoroU2SY4rYuqMfsratC/cyFqGSn98Sy0iPiQe1atqJWEYnIXhE6L7V9xqs3jNKurDOaH56X+YmtvzizlIR+QS7PTTi6olKN3d7nsEIOEzOXtJ6Kf4CN5JK4vfEGVyEWA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2017 17:52:29.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2687
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>
Subject: Re: [PATCH] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Mon, 24 Apr 2017 17:52:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 04/24/2017 09:50 AM, Aníbal Limón wrote:
> Hi Martin,
>
> It looks that we need to improve the alignment between compiler flags
> and runqemu configurations. I don't know if is the right way to change
> the cpu's to pentium and core2due may be could cause side-effects.
>
> I think will be better to review the qemuboot profiles and to provide a
> mechanism to modify it.

If we go this route, it seems like we should make it modifiable by 
distro layers. Currently, the qemuboot.conf settings live in OE-core, so 
I did not find a way to override the settings in a distro file. When I 
tried manually changing them, the setting did not take effect because 
the setting in OE-core got parsed last.

That said, I think it would be more ideal to make sure the settings work 
by default everywhere, without each layer having to tweak anything. As 
long as the compiled and runtime features match, I think we can achieve 
this goal.

>
> I want to know, what was your build settings?

To test the patch, I did:

git clone git://git.yoctoproject.org/poky
source oe-init-build-env
# manually edit MACHINE to be qemux86 or qemux86-64
bitbake core-image-minimal

I hit the initial bug when building AGL (Automotive Grade Linux), which 
pulls in meta-qt5, which surfaced the issue.

>
> Finally this patch needs to be send to oe-core mailing list.
>

Sorry, adding oe-core now.

