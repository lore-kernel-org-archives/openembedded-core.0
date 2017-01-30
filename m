Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 4693 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jan 2017 19:29:42 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0132.outbound.protection.outlook.com [104.47.34.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9D87746C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GG7EIfNNSKH/csqOmnL3XEZSWEt9oYUlnkLY6CzZVzQ=;
	b=Www4SUQpvELtKXK+dqcF2dWY9Tzbj2KiGk8v5QBahIszXCmEaiUOM2o7cINlfU47iihakNCRIymZNC3N0eefqRETomohD6V21243rTrY/AmUemxRVr5LJPRjhx55vw3u7HoPy3taMPU9gzjhU7HLXx1Qa297fqO6Wf7JuqVwUyQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.0.62.53] (130.164.62.126) by
	DM5PR04MB0364.namprd04.prod.outlook.com (10.173.169.9) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.874.12; Mon, 30 Jan 2017 17:55:35 +0000
To: <stefan.seyfried@googlemail.com>, opkg-devel
	<opkg-devel@googlegroups.com>, akuster808 <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <aaf83c503ba53bb6f119b304ef2b38f5@agner.ch>
	<AB8FBD55-FDFF-4637-AD25-16BCAED0FEE4@dominion.thruhere.net>
	<5718F627.7050105@ni.com> <4883d853ca323f08e48c24075ed182b8@agner.ch>
	<57191CF6.2050905@ni.com> <c00176f0e8131187bd8dc4bf50cb5f5b@agner.ch>
	<571BDDD4.9050909@ni.com>
	<dfe31524-4786-4be6-8d4d-c6ed9a34c67a@googlegroups.com>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <93aa4a7b-6efe-51ea-7ba2-bc6a0c21f16f@ni.com>
Date: Mon, 30 Jan 2017 11:55:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <dfe31524-4786-4be6-8d4d-c6ed9a34c67a@googlegroups.com>
X-Originating-IP: [130.164.62.126]
X-ClientProxiedBy: MWHPR14CA0058.namprd14.prod.outlook.com (10.173.97.148) To
	DM5PR04MB0364.namprd04.prod.outlook.com (10.173.169.9)
X-MS-Office365-Filtering-Correlation-Id: 67886de3-6ee5-4956-2cb9-08d44939320e
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR04MB0364;
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0364;
	3:sn2vcjuvlP4X+LVASZaWHiyNASOiLdFl306fk8ZbEP1aQwACST54XBTIlNG3xQvn6ELWd4bmYXpPNnN1+fo+Fv7wgMbMDZX9iMDAiuF3vOc0/BHFE9ZGFdWcCv2784DRdfoCsW+55tUSDXc1KKUf4fgurXgQtEAoG5v1LfUz2cCXqdTuHewPYNjsHtZKdFF0cqE4OwVQL/Dzoa6f5DOyAXrgrRnEcbWS5lmF2hsqbiSEpdFFHx/2H3aN2K2A5UG7Yp9cFLHBGhffXNljs3bR9A==;
	25:kn3bUlTAo68ojZ6BGYXhEv/pGaREm/IZs1E7JeiEMqAP3i6wGANxwY+GStgI7lwUanxkyJNJ98HNys/Ekk2Adzx3S1NMZ+FyJvYRAMuCOpShtCIOM01j4pIXVGKMyZfNOoS8aYv/13qZicnlLQwKzG/ia9NlaUQgJMMJBfITkBXAlsOe5D+4wuB6tUVPmfbuoXYSxsKEw9MAH9kIkj3/6+DP4WDU4UoCbsCih4XQT/jNzVs/3V8WZUi+odqYR0EUQ11WVipyoXhS65/mrS3gyyMPMNcXnL63kVUlRgT/T+8CfPjaIytcKpHkttXeyiVbVCAiKRkZJnwmP+B0JG58Ln2s0mLm4SX1u4puDLqmBAsnP84qTvE78AG8Vh3G6MSEFykXhMt0f8lE9WkEl5IR/hHkdoB4/VYWTFkTPZbe9yBu29tkApiTPy2pMslYqChc5+dGx02xOqVH2K7HOji6CQ==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0364;
	31:Tg4sR84AE3xF4ztSSnkAyN30Z2LlfqfKTIfvVpEqKg0q3qNmkVUMBbzvzy0t/xt3FqqCPuRggptJ2/mM9KBslD1sIrw9AoMcx5qGqAM/XSIv+R/RzeGDqZr0blt88TGo5nZ4Kq+egXtbWJanjfDffUGzi9Hu3OlX0h2ofZwq7IpcM6t5ju+9XjLNR0oh+frTa2EXLQYfoV5BFHNInaUtYcP2u/VfTIO+RD57pcBx3hiU/7vRGoewO6IszAHOWpM5bEiwTWjG8i7M80TMfxEgwA==;
	20:wYkh0I0VXdS9/BexIRLwoSoSySlHqVt+RsFdmJbI6zqOzckrZsJRrk5I2rtNEWt4PA9FajEHbBShv/u+qgzlRprKXIzbGnrhc9hO4zqysJVI4TyGn2rXVUsdqC3Dhxr2t3W4ogp4ykHrtRtLW7WcuZ9nKFZaU3X4vh2tJfkgCN/BXZ3hKnoNVBLJbr00dH+vBRUZeb2jSiSMlc4noZrLNML0w2L0tKs2T75PupirIjxbNUl5QD5aZ/jAVkMIAYrrbi1mlCi8sJqMrgG6fPuBjVjb0B0U2LIWqDS84tFh8MsFF26kZKUg2VTMqfc5mMSkkAGPrT4+puZdjEJ+1+7G/y2iC3LQREoAJMG1PNXIIZkvWqLeSfUlYnLSVNQWRqsRfq1kzt8ExkCbl6VSt4cS/HTcBgA1/9BSBxxBaLMMO9DgHLYHSCHfOBKxBvu+RYpyR+bUznBFdZlr9q2ymYGZWZYrfOi7efDEMA1E/ZdyUtEED0wVvlYW0BRDElfnZRKVl4MpZ2v4Zwa/8/tbsRTVK/eSRt096cwXLTIBI/kLuZ1aPfGdjMMPNP/5L+9yJFqs498KZzx1y+tSdcgho20JICqkM38XqF68hHNN85a0T4Q=
X-Microsoft-Antispam-PRVS: <DM5PR04MB036429525AF0226CD13E8075864B0@DM5PR04MB0364.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(8415204561270);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:DM5PR04MB0364; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0364; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0364;
	4:PU2Nvt1ZHLps0fhKpD2LDdsWaHDNYuXs6n9Rtma90OKXXpcY9IWS6lULRT+vn4O989E5aTHPkgWE5WEkt+nkC2G/p7q02xkyG8wHPIRqBDgbyi9FJlNd9WAsV30QZNusFMX8dbeYL8NIJlqAkG5A/Ms4Zn1bsGJDZ+AoD+QiiNxHUhegJevNc2nUqsqer/BAmKw207asvEmGsTXZLdxEvYpRiZJsz30PPA1UtMtwMUcZv8DU2JJSrkSsZkSzn511nQlmXhBzFuikHYzRdB+86gcaaZEj5jPfc4J2nQJYiziUTTGFniCvZZahNJyz36gxdltfN92RKYt8wHdEPjFAnoOvxPGeQ7niIta9JSPMcXLeR6ONIZvBH92dvypW5vgLfcijsKTLI5hWVZuh2ni++gJMP56zT0BseDOYrRauTf5NSa8x8x/WIsjcqO4eHcnQlMDi7bD+cMNJQs6BQJ7jxJlWoICjdWglpp3cZY81ctxpuVb0gqvFL5XmaSjQBK3DsxaaF0bPEUFITka2rgkjxFR/kkXKVh4RLc9fpys5ZNwikAmVeZp6rmrExIAsBt4+aJYXbbp01Jgmkq4JylV28aVLC6R5jykhmAda5M6U4jk0nS/8NgO62fbh4LmENR6kA+kDBDziyMd/5dyZjfSIrg==
X-Forefront-PRVS: 0203C93D51
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(7916002)(39450400003)(199003)(377454003)(189002)(24454002)(66066001)(2906002)(305945005)(4001350100001)(5660300001)(97736004)(47776003)(65956001)(65826007)(4326007)(86362001)(31696002)(3846002)(77096006)(92566002)(7736002)(230700001)(106356001)(6306002)(36756003)(6666003)(38730400001)(83506001)(65806001)(33646002)(5001770100001)(966004)(64126003)(8676002)(229853002)(81156014)(68736007)(81166006)(39060400001)(189998001)(76176999)(54356999)(50986999)(31686004)(54906002)(101416001)(50466002)(53936002)(6116002)(42186005)(93886004)(25786008)(105586002)(90366009)(2950100002)(6486002)(23676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0364; H:[10.0.62.53];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA0TUIwMzY0OzIzOjAxNmJ3eE5aNWtBYWhBRjVKbWovU0l3b01D?=
	=?utf-8?B?M0xIcFJHRVpZdzBSeFJ2bndoMGZGQ3dRN2EvQVJ0YjF0SG8vcVo5dnBuZzJG?=
	=?utf-8?B?NWhmSUlMM21EQWhKWnlTL1AvVzE5TU9SbEwxOWg2cjlvRUlZeXlXalJFdEYw?=
	=?utf-8?B?TjNuTzRTK042cXY3SDFueWRWWG9BU3hCWkhkTE50dldjUzM5MjV5ZVZmaTlM?=
	=?utf-8?B?VVNib2VBSEM0TWdLR0pKTFdCNFliR2wvNitrekFDQ21UZksydnd2SHBHMnhz?=
	=?utf-8?B?M1JoQ0lRUkJrbDRSbmRQYkhiRWRPVnlZVHVNKzFRblNOMzZsc0pMUCtnRW5p?=
	=?utf-8?B?S2lteDNZZW0wSFAvYnBGRUpLVTJIbWUvL1c0RUpqTVlGRzFwRytWZktaa1Rq?=
	=?utf-8?B?WHdWVVFwRFo4Q0s1M28xRmNmbDRXcUFSY1FHVVM0a3NDWVVWZnZWV3lrTDFU?=
	=?utf-8?B?R2dRcm4vNHhiVDBwUm5RaVIwMDlwUFBERkRycnJPSTlzS3dnS2ZhTHFkSHha?=
	=?utf-8?B?MXJFWFFvbWhMdVRVSzhxTWltUlhaNGpYdHpZNnpGQmFBOXQyNmErNk9rZGgy?=
	=?utf-8?B?MWpHNWRiMHBQMGpRN3cwblBKWmtOMTBGa3hmSnkyR0VwTVBwSW5kMHhOVGU3?=
	=?utf-8?B?QkhKcExCTGdnc0R4cUVTay9Yc3lZZjkzZ1R6a2FRalFmTzdIZEJpbVB0czJt?=
	=?utf-8?B?NjF0U2JMeFFmWmdJd2tEM01XWEc5ZnV1TmtiVktxT0hxUmhCSERkZGVxaWRT?=
	=?utf-8?B?QlJ0TjN6VWJScGZBNkQ1Z296NGc5d0YyNjRuU09VWHg1eXpKVGRNMDZuclJl?=
	=?utf-8?B?ZFgvdW90cVNLRTVSeFA3ZTVuYjJNcTAvMmQxU1I5cm9kVis4amZSNUhDZ3or?=
	=?utf-8?B?bVMrNndwald2elNrM2xtRExpMi96Zm1OL3pvMXloSTFtYllrK0JvU1VjK1RI?=
	=?utf-8?B?UnlGbWozeno3dHpzWU9zcEhCcEVFNWEwaXk5Q3o2bkhmOEFUVlVSSXlMVVVJ?=
	=?utf-8?B?bkk2d0cwSFMxektVVFo0S3BqV090bzhoNFJzVGpWUytxbVRaYWR1STNUV2kw?=
	=?utf-8?B?SXRORVdHQVJ4RkZxSXJRQjAySUVxOXZrRkREWUJWT05GZFdvZG1DWE1zdXZm?=
	=?utf-8?B?MVJ3RmxXbXpUK2lWVXFJRlMrbEtUVXNyWGFKcWJtMithdnhCZ28wTTQ0R2F2?=
	=?utf-8?B?OGxkdHRJNXVEWmZESnV3Mi9tOThVdGF4ejdjOHF4aCsxWlB3QWdTQlorVU9V?=
	=?utf-8?B?RjZjemJGS3lSbEpBa01XOTNXWFUrVDJxdXdiZVB3ei9VQVZPNUxjOW01K20y?=
	=?utf-8?B?ZVFwYXpLSnVVcEtqVkpsbTFLTkhqMlJIRGs1cFlOVVhiSW1RdTVnOU4xN0VJ?=
	=?utf-8?B?TFRZZjltV1BMdW1uQjh0UUszZzVXeWhSVVZ5UmpaaGF0SUhRWjUrekxXbTZ5?=
	=?utf-8?B?eVd1dmkvcDhwVWxjL2ZnVmtTUWZuOVZaOVJvSmJQY21YZ3puN1czNFA2QStU?=
	=?utf-8?B?aGRyY1ZHNEYrci9LRXZtUXhEeTNPMTZLOEI2dTF5MjBOaXpnYnZUUG0xR25M?=
	=?utf-8?B?MlB2Tnk1c3ZVZTl4Y0pNSEUrVDFKL0hIY0ViY0ZHSnBybnFPWG1FWUNXWURS?=
	=?utf-8?B?Q1o5bjBpUGF5RGc5UExmNGhnVCtDaU1yZTd3WW5pY2tRa1JleTl1OFhIdFRH?=
	=?utf-8?B?QlZSaEJEeERTZm1lMnhsMFhBMUVobGhGcFBoOXIzQlNqRnlqdXJnMHJ2M1VQ?=
	=?utf-8?B?aHcwRjAvd3M4eXJoSzNpVUM0N2E4WGNES2M2aWJwZVJPZzdsN1hQR3pWTzYw?=
	=?utf-8?B?cXhNUUNDUzFIblA3K3FTV2lWK0lodjZoNE5mRFNkOVRIM0V6VTB6YXJZTXJp?=
	=?utf-8?B?eGw1cWp5eVNtS0xtQlZpWXY4NHVjUHkwOHMzQ2VXSGJaVm1tcUtJRytsMHlt?=
	=?utf-8?B?TXJqL3dwdUxHK0VyTERzcTRBNWZ1bjhVL21wSllybHN3V0xzemwzOEVtQ3RZ?=
	=?utf-8?Q?nmz0bv?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0364;
	6:eaB0zFhlfZeVfKz+IjZDA6j3db15H16NS4cb15FMWAxqgOa6me9zMdNtvPSh++Fpgv+WjOuKKzgxdRL4wkwQkFphgyQ3425aGuEFsjyhvuCIdRHAmcOljE7ECOw0+KGM3bdq1FXfsWvLF2GbxfElFYIfVol9JpfwAhShNPznbrk4DGsHrOwMunWK9QcXVG2s7yJJcxWzr2CT3EVOsqeV45MABh4Cs5mVAk2I6ZIxp/zHJA9CHt2JJ6IZn2Q20hiQJj7REXERfVBVKv8MJQxGzbW8n0NjTVr+aIjwfiI5Y+UuEJhkSMQTb+FZE876LqMmyjz2MxEfMJk8n/45O0Z6bOdhSCds2UOgQ1V++Ozw9l9GDtrnEbchQ49MhApw6i9fyApXP/OndNIZuayDDemkR48hXxsou2bKk2qULeNilr0=;
	5:Cwt7PlinPV8IH7QsfJ5uGdNPpxz5nnz1QDP+0eM+ScrYda018Xmb4AAwMBuysBqkrwI3rBMOTjGVYcUbAiNw+aMMXwId4afoplW2BNHeukGlfcksMF6CnMSuhe2z7wp17Hmbuojjc94TLovCBRuPyYpl/Zl8ZklddQLiwLuQdno=;
	24:0nL3hkHV33HfkEf3f0Hwn9KH5miyT8CaXdTaUbuzaaHnXPeH2HDL+pq0sf3MF5gXLCrFBvvHGvqW7mmNjUVR59X3MCbMJZ0yICIzKtK9ABI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0364;
	7:IHfNtaKWGNqlbeVM7zyOSujMeWPmvTqE1uldpM9G9YMx6jX6Y2VMbqtvxOaDxKxY/qMlvZl3nakwR9o/WiKXmgbga3AvrmS9g9g4J3O74uBrBZli5hZhwn69wv0SH3r8x02k83qkgwDdxWCG07dHk4F/zQ3kYPiGaeHJy5G0C/cYiK38+PBn5yOg5tCk/myUYB149wYxcAp25/osCx7OahwAaMKTbLpCwemCTAKwUv5gS7WDhmgCQ2M3KfmAKh1OfnUVcnNF9rW9f7u8STEhXv18PegdtZhvdwntLd8naTJ2eCrPE4IzD3FRFwECGXhOewhWmhaBI+2Nc3UavkBqJ63/heiAZnxMkmNETC04K0RMOy6X0TJofUV/xHHwI+S6YKvs6lqmmULo1aaLyUOIu0Drn5PSIaGcKKjBKJRrgooLzi8S9eEttg4aAnV1VxxgNdmPCvwIIZZHX6xCMphAWA==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2017 17:55:35.8237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0364
Cc: koen@dominion.thruhere.net
Subject: Re: [opkg-devel] Re: opkg tries to remove package twice
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
X-List-Received-Date: Mon, 30 Jan 2017 19:29:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 01/29/2017 10:17 AM, stefan.seyfried@googlemail.com wrote:
> Am Samstag, 23. April 2016 22:41:17 UTC+2 schrieb Alejandro del Castillo:
>> it should be backported to krogoth too since the next release of opkg is 
>> scheduled to June (too late for krogoth). I'll reply to your patch on 
>> the openembedded-core developer list to suggest it gets it's way into 
>> krogoth too.
> 
> This fix never landed in krogoth, and keeps making opkg look bad.

Armin: the following opkg patch was submitted for inclusion in krogoth,
but apparently never made it into the branch:

http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120610.html

can you consider it for inclusion in krogoth? In my opinion, it does
meet the urgency bar to merit a backport.

-- 
Cheers,

Alejandro

