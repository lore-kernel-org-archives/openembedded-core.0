Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0119.outbound.protection.outlook.com [104.47.2.119])
	by mail.openembedded.org (Postfix) with ESMTP id A268B719E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0Cf2Hp9kqolaU5MBLTVY4/XOWuCbglS5+mUyrS2dAJQ=;
	b=c7qh9vareLnW6Yjmr9V2sxaZqQ5kAJoGTStiCPJsaL3SGKJtR6uPYOXDPk6uFrcXw7a4jJyPpHyNRNMk1iwglBJTJLljvHky9EdKoRlN8Ykub68FmcsulqkubAyqYct3QOL5fKI/xpfgYR76X9wm1zUFnqECnU8ca2YA+FXPPpk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from [10.9.21.51] (192.89.120.53) by
	DB6PR0202MB2728.eurprd02.prod.outlook.com (10.171.71.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.669.16; Tue, 18 Oct 2016 09:59:55 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <1476198850-1529-1-git-send-email-samuli.piippo@qt.io>
	<64ADE2BA-C5CE-47C5-975F-05C11DE145D2@gmail.com>
From: Samuli Piippo <samuli.piippo@qt.io>
Message-ID: <e6c381fc-a7e3-a1ae-399b-636bb1208130@qt.io>
Date: Tue, 18 Oct 2016 13:00:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <64ADE2BA-C5CE-47C5-975F-05C11DE145D2@gmail.com>
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM3PR07CA0012.eurprd07.prod.outlook.com (10.141.45.140) To
	DB6PR0202MB2728.eurprd02.prod.outlook.com (10.171.71.138)
X-MS-Office365-Filtering-Correlation-Id: 00ca067f-d99b-404d-3414-08d3f73d8337
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	2:B2QyCSWNJkEr2wMEEYNdLbyF/7HWL9fQ6R6MMb97BqyBUG0mjs44mv2kXfnL8l7GeI49hY21k2N97hN0XgqwRSFUM15nRKxlKDAB9joDwqCWPu0Y4jOgkEaluUg9/S052uycyNxrEUQ7u2G5sHWdQsQbahJGljuMLOW4bc/4iyodUAUQQZRYL7SR1e7px+ecXjfCi+tAOjfVE8OL+CXH/w==;
	3:rPld90Z6QqlFItT38rOMhcK0ERskij7WQadBGZYQ7Q+JEYl0zIVJKFhfSQeysooRhtlCg2j/Wd9pH6JtP3KEKZkUzaL/T8QU6ixQxrpBjOQZta6vaZlOsJkzFRzlQ/XItRzccxTKmrTuuvMim7P3Eg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB6PR0202MB2728;
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	25:EaqVSOPUxUvRI6mZAt5pAMy5WoSArxkmFz5uEglOZZca7K6Aw/px6Xy4mxCEOhKxS53qQTP3kKt//HPz908+utgD4hCM65QL2SYPpOQvfCmaqH1t4sS6KvHcCScoEL24+1iqxp2nAbX7RSuIDtmukxHolo4H2n+qdKspB1wYTJG5D+aJL+ulYEeBwBoF7TzgtUts0J7DT+Qmim51k7sJrLKJecsCxTWfeHyINLWFN9ZiD5OklksbdTfvJQoVuSQieo+sovGXseGSwkSuX2wEnjeI5aPnYkdnOXd0uAxld7i3+Vf9pw2vMz+3DHejEOpXuTxx/VI7/FquvtmpJ22eZhKShb1Tc8LHLuGw9+8jvlR3wL8WdCdqOqcstYSX0W6CRQR3QmRdn1Kkhpe1Jc14Fwei/Ua95Lsa9a5Y2C00eXrXI1ctrD/IkPNj2u1cvDF1SuA+Pg8Bm4/Fp/Sy3+M0YnM/rXNF8/bMCjjMLiprnbdPl1DkG1rNaRjMuGirfGRJ0ITIVEmHlMUzyIN3rlWRlZ02nxhz6+A5/9V8nMOBCkyYtqzw2prBKd5as2oTQpHZPmIoIleqDNXyVotMrgWMROsWApSDJanVNU11c0eKFFL7Zbin3o+4Y89kl3RHBfFwf4A0k+uguuLFtMTkmWIGHTlRzyhUKZvIcb5ZJeyomW5ZLxgYGu9fGN95klB4Ze3taqCAfCL3wZid66J3FsFJe11Eu6C+RfGSeJ69oGPxOoiUNIA6ihpNCQ5mH5vsZHQGQLcdvG068tD9FwwHOUMxbHqlaB84qHZcGjytTrf0m+5tI/0Fq6EEwMxG0AEZ72nj
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	31:jg08gSMmoXIw9Opz6Cl39DZPMY5Edz9MuI5eMGn7DbTpDrQpPNdfD1SP2MlufhbH1C3UwYyX1PhnALXYyuUODdTCwrhx3RaS4pdwvEy9NSDupyel3SI5mIREqHQ/2zOHmHdwkNdOwUIMjKkyJYyf/3BvVmmOuTprZQAddEEjuDQean5VOJkHfofuVY7+4EuJKCwEAz7RGok8JCA3yEm0+qWUqUMwoh5a0EqgYr6B2P5DU/Jao5a5HQDvMza3tOVx;
	20:UJmMasb8MmL0Q3rkAlSxLiecoUM9XeuGUPDnE/Okzva98zG/PKfGdZUgjxWHPg29C+MpIB97s9VciPpjfL0xqNP/YqyWDOxbh/L4tBlVB/AUwu43UO2qHuN02wqUt5JHoIW/amDk0DNy/Aw8ylR8f0bv24RwcCn2XSAxZYYn8vkABI3dnDTlicFAfLxQzFmuSsn1GCYxu0buKZjThpzDwrJ7SBCf0f97neYJawegcYPk7W7Y5cnaa5lLut1dYTrZ
X-Microsoft-Antispam-PRVS: <DB6PR0202MB2728E085B4F3456BADE6B383E9D30@DB6PR0202MB2728.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6043046)(6042046);
	SRVR:DB6PR0202MB2728; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0202MB2728; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	4:IKZY6yCK+E+ZDNO9BIeHjOkpDKM2ThFEMPdsuExbjp1HvM3Gyo2Jar135HAvbxYoPQETPXU9e55JQ/+AXlcreiStyvoFssNa7Jlw9OcVmSGO1IKhROtitdmvfek3cQFkaPAMV0hsrBMJRyIeXH8/KQJjiwjQe+Q+wMR3JNebw5+kTViAwNzyP0H/tC59aupGWIvpkZvX36/+wQDpVfX/9AOj+aMDlEY3iVZGyEuwkUCB/LDMWsLajtEWYuSTi8JzI7VZx/yyF5yroOYJEAnjfcJKxi6EuxrGLs0NcCwTjJ3ccuu2O2BbA019D3s20wv+hwjbWGlEMDCfA8XGN71xzxs134eWGRxSYrdNVIkJ4CFTk//P14iYqPrhrmzj4iQSpHCTNO/kbudHpYOubTpHWaTRB7rxiCb4Ddv8KVhSJc8y8Vjl9EM8f1FvPLjBJ8qkac49QegIoFFl7q6iI7FKbEhrG2GdwAfPkGD3MFTB1c4=
X-Forefront-PRVS: 00997889E7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(7916002)(377454003)(24454002)(189002)(54094003)(199003)(586003)(68736007)(31686004)(77096005)(50986999)(66066001)(65806001)(65956001)(15975445007)(110136003)(92566002)(47776003)(33646002)(5660300001)(101416001)(76176999)(65826007)(1720100001)(64126003)(50466002)(36756003)(106356001)(74482002)(105586002)(54356999)(6916009)(19580395003)(2870700001)(42186005)(81166006)(81156014)(2950100002)(6666003)(8676002)(7736002)(7846002)(305945005)(83506001)(4326007)(23676002)(19580405001)(2906002)(97736004)(4001350100001)(3846002)(189998001)(86362001)(31696002)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2728; H:[10.9.21.51];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjZQUjAyMDJNQjI3Mjg7MjM6Tk5EM0RKOUw1YzYwZTk2alorbXE3Tkti?=
	=?utf-8?B?SHFTTE5GcVhhRGpuUDBBcUQyaXRNbmV1OEJnQTBHOExsSHRaMXNhQzdJbnBz?=
	=?utf-8?B?VUhzb2tOL1J2Mzh6SGdqRk9IMGNDVmkzZjFES2d3aGtwU1ROb3MzL0tLbGZw?=
	=?utf-8?B?N2V3UDdGMStYbU5Zb1QzV1pXa0lUNGdEWWV3VFlFK0FHQlZSb1J5cmhuQmhY?=
	=?utf-8?B?V3pLY0VyMWZSRXNqcnVuTkFOS2NPcHA2NnB0UjFEQnFBN2xLc2l2OXlBclJO?=
	=?utf-8?B?SGNFNDJCOFRhNitXWFNHdlZvS1RvaWFWTytwdVlobG15TjJZZEEvTVIvU1Fh?=
	=?utf-8?B?TEFxYU1zZ1VqSktuTzFQbHBXMXhYN0RhTWNYczFYUEZheDdvNGVqZ3ozU0d0?=
	=?utf-8?B?eUpRTXBYWUdrQms5OFJBeUhwclh3KzFHei9qWTRGQkU0VU1qVmdXZHRROTM0?=
	=?utf-8?B?SHZSaVV3Mm9uT2dPd212aE92c3RtdmpTTi9mTm5QR28xWUZqTk03dHZ3RmRo?=
	=?utf-8?B?N28rem1LTVJ4WFRISUZ3bTU2YS8vYmRydG82RkJLSVJrYmZ6bHdpREl6Nytl?=
	=?utf-8?B?K3NCRUFjN3RPaDhmb1M1ODhmWEhsM3hRRkZuczhaaHhZWlNIZjhQdGtMeXkv?=
	=?utf-8?B?Z0lvUkRGMGs5MUV5UWNTSnMxRDdCQlpWd0cvWWNxSStkN3pqNk5zUFpyaUww?=
	=?utf-8?B?YTg4TXF6UTJzQjVKaDduZDlDMitCcyt0YXI3VFM0Q3grTlBiUytoMkVHamlj?=
	=?utf-8?B?cGxVY3VVd09EOWNDMURaNE8zaFA5THZqeWZnUGs3Rk10UGxMT2pJUFh5MjIv?=
	=?utf-8?B?ZzkxbFc3WnFwWEx2ZFcvRDRlQkR0WGhiVEF1VEVFank5RldrY2dVWks1aUlU?=
	=?utf-8?B?L3orM2dTNkdMM0JlNmd6cUNvU214enZrTWRnbHZzc3R4aFVCNERyZWwxblVr?=
	=?utf-8?B?U29pZXNySUlDa0o2SjZCcTdsV1Z5dG4vSHZkTFA2KzY3Z2RVSnFTa21pTFpt?=
	=?utf-8?B?enVwUWRqSVZMSWpqL2pkZjBuWEhDK0hBV1R4R2RKdmUvaDZramllY2JXRDhr?=
	=?utf-8?B?K2VyNit0YUhiamxhNUZGTjVtQnIxSEphV1VpUkdubW1oNDIxK1k1aDE3dEZk?=
	=?utf-8?B?ZGVHcXVraHJNYXpTeWM2dUtyRVVRb1hxOXFMaWE0eVRwQktBYllmallKSjZU?=
	=?utf-8?B?bmdyTDBiMTd3Z3JZOEEwcjM3UzVsNlJLQ1ovSWR3VnNRMGZMK3VRMGhaN0tm?=
	=?utf-8?B?ZVVyS3NPS2pSWGMxM2lVOTUyKzJzZmpaN1daSDVqNm11Rjc1MFN1ZkcrcVNP?=
	=?utf-8?B?UDBHRnlaSHR3c2ZRZk0vZyt5RjhSRnMzN1lHTzRMbWZPclhDdjBOMVczMVFY?=
	=?utf-8?B?d0pSOThzQTIwRUM1V0UveVNsUHdPZXErLytvMXU0bXB5MExlYkpyaTNseWNz?=
	=?utf-8?B?ZGVhekV1Ylp4TUtxWGJRVyt4cjN2d2ZWcFJDbGxZZUZSeEpCOVpzdkFkNktq?=
	=?utf-8?B?ZXlIb0V4TE9jVGVsMTBzaVJwdkxlaHZMMkZpNHg2cHQ0VWZFcmJETGFuZTdI?=
	=?utf-8?B?ZG9LVW9ka3k1a2NyWGJWRDAyQk5lRDFPOEwwZkEvQmtXQUUyWTV2MzVoWmRk?=
	=?utf-8?B?OW1OOVgzbzA3RlU1dU1rRVl5WThBUUNYdjVPTEdaUHlaL0Vkb001eEhvWS9N?=
	=?utf-8?B?cTUvc0hhRXdMTFI4a0lTV2dNK0U0V0N5N0RIVGNVdndRWUdVU0pJclVTd1pn?=
	=?utf-8?B?NG1sVTlvVUxyaGdxenI4dXpXN2JHRUttS2ZoTWhGOVBXZXFZTGpXSjEwczZu?=
	=?utf-8?B?K1BDOHBXMHJEenk2bGlUVmtCMWd0WVJWcFBwTnByd0JJL0I5M3Y5Sk9LM2pU?=
	=?utf-8?Q?iQzUrZWjOhEJW5Ym8qBzEcw/wdRBEpGL5Q?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	6:rW1TnbcKUbIzESaGWt46WC0HGuKwj1eQ3E+dcIxiRqMoPmCHECyTa4zu9s/hl7VVteatVZXo/AV9DAqjJKwL97kDOQu5KWaYk/JZnWZB22vLHqUsf4K6LAZBC1lkBNJWGMDSyd9B3f7DZvsOyJjD2yfHxtjOZ0HHwVx8ioQhat9TAeZ0wqqCV+/4+aTteXeRHgisjFfRyEqanJIBZni45bwJoTSur5pd1IkCqCtaZOUjg0QyACZ5Ksud0f7PKgP0AHDQm4uB4XlU+EkFbpCOdHzoASWSCLn95kfhimjnraZb5cIkpdWZMDoOnfSr6droCKk+H9GUWImJeSbLGBDE8g==;
	5:I4SPXBxqpb1KmE+GjkezG4siPVINeBbz6t+hEDIGzi1/ghxSzjctlZ14ZaEF6ERnMEu6DbBgCpL8a+J9r9Uo0M7+NW6XLSIcSiOmpXMf9Ty4n6kjN7cO06bT61AO82nbLa5G+TlaD/LLwvphUaxajYLuF9uiDEFP4/VMAmYDqyg=;
	24:SyT7MVnwlTk098X9khdNAvFrvD3Ijb9WLOEC2qLyhQlM0aSrLKnqyFxYTYFv6ed0oJSJOHzjYRqRfM9IoJ67ai5Eonpg2QayQI/p6tryM1U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	7:aUsAz02PRYgjsLKhddI6P6sDjei+j087iabSUcxyXeQdXtogPG1qBfowBXD7Y34+n3iOaCFys1VSD/YYl1u0l+Uli44vYvnMU6JPrfKLYwHYm8faEb6hFlgcFiVd4K3ud3izKo/If8boVKeQa9h14Aq60aZbN1h9RKsRvKkJs9GamWYeBoOVG7zGf6e6AQ9Z8bXUpPw+xLmNU/Rx5qbhHyt8RWDejUWaLsKIaW+0BGAoOCCBfnU1BJEpdIP628e3NA0G3TI03VlWXSuUVJog9qOwgzHg78QvfJEcqXlG0mEN4S/QUPMWflHrxWHO3X7OIEST9Ji6Ge9oiLK/F0ZneoW9IV6FM7D9ovIeezE1A9c=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2016 09:59:55.2858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2728
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] systemd-serialgetty: add dependency to agetty
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
X-List-Received-Date: Tue, 18 Oct 2016 13:34:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 18.10.2016 02:36, Khem Raj wrote:
>
>> On Oct 11, 2016, at 8:14 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> ---
>> meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
>> index 768b130..c4e5310 100644
>> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
>> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
>> @@ -38,7 +38,7 @@ do_install() {
>> 	fi
>> }
>>
>> -RDEPENDS_${PN} = "systemd"
>> +RDEPENDS_${PN} = "systemd util-linux-agetty”
>
> Does it need agetty specifically ? since there are other providers of getty as well.
> I wonder if its possible to use those too

serial-getty@.service is using /sbin/agetty, so currently it's the one.
systemd also has util-linux-agetty in RECOMMENDS, but that could perhaps 
be removed.

>
>>
>> # This is a machine specific file
>> FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

