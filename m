Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 26264 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Nov 2017 01:21:07 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0078.outbound.protection.outlook.com [104.47.42.78])
	by mail.openembedded.org (Postfix) with ESMTP id 41009786A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pGs3YZ5z2Nm6NRv8/wAL8sxOjLz21nJhDjx4bEo19+c=;
	b=YyaD3ZSsO6UobXdjcCF8/YenqwVOcjOUembrapwqBLDjIIp7H2NfZPUr+aqfisOXKk1LJ5g7/OPLc6tQbmdDGFfITN9xS++ClKsqvgCMW7CPCB+hWaG8+cLusXynhPK1YJ+KPqZXwFziOlnLcsHJapCN86R4xEwKmX+msaOzkRs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.156.8.118] (205.175.118.197) by
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Thu, 16 Nov 2017 01:21:05 +0000
From: Martin Kelly <mkelly@xevo.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171016163143.22844-1-mkelly@xevo.com>
	<2eb1113b-b6c7-d4a4-5908-bf9ea2684513@xevo.com>
	<CAJTo0LanJvP1g4SgKmh8dx-z4Y0qRJ9O6dk92OSJCoF_wLreiQ@mail.gmail.com>
	<1848f713-8adf-1075-aa9c-db549bb89b33@xevo.com>
Message-ID: <0133e0f5-91ca-27f3-648f-d7d8fdfbc65c@xevo.com>
Date: Wed, 15 Nov 2017 17:20:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1848f713-8adf-1075-aa9c-db549bb89b33@xevo.com>
X-Originating-IP: [205.175.118.197]
X-ClientProxiedBy: CO2PR06CA0057.namprd06.prod.outlook.com (10.165.93.15) To
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 760afbbe-8f78-447d-a526-08d52c904f74
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	3:f5mg4RuH1k7phCpMyTKVE9Dgc61JQzz5JpR7OLuv8noLVCSWpqTSml8zm9vy9QcYP6DiYFVmmjNq3KzT5wKi2I/5omuHMJAGorlWZ2OOFS70grXP9mEYPot6NY/zzVLydwd4lYsNAJ6EVgc0YCudJwASYxjH+TGGym/cpf/D+mHowdWwZRKWi9otxu+TlgfalYVkrNLQ1msHGBTSe2R7dGGUUoectYD1/aWc47NVRw+Qfw1f9U6+KSa1KlAW1ygc;
	25:0vIiZhp8r2VaB03+qpbsIltCQO/ITLBq2Z4RHCc4dyG77dknEnKxUK+Lun+qXocXcSBuZsMv0PFi0jCpwwcpn2h8ojJpFCTHlBfMpzuFJeQt2ZFbCvvur2F9JZDRh/L9gGFbK61IP/q85fR8K0JNaHVMnpoq7XPZirOwWC8DFNw+dek88kvXT/Sb4SyOfA/Pg+wF1IhUqdxHMBOSrrxCnvsSu0/v10Gn/VJWD8SCR6dkAgDKulqnXGWm6Gto+yuaiSO5P7/L0YnVhsCjHkpTkkhIJIJmsttxNSombq5lYahUE9GivGdzHyGzcOiXhg0KwcTOXM40PPixZr+rMr0fzw==;
	31:zHQIabHHzFb/W8+UbuUiXwLT/o0vNu3wZih+qkUXguNbZnkvgbs6y2DB5w4N+tYb44r9JjlpmSsOSwjplqabY0A/qXGnrIbHJ0KtU6L8d9ExOLBPQ4F/CnBJR0470d2/GwzbpwFaEBc6VcjIz1JJnhJa+j/GTnJGyIE0eZ/7o7pFCESJsc/WSykzgE5iVNpVQAVOpnLEAj1szEeOfpnXkkUivdb7d3CF12c22nOrITk=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2931:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	20:ZgXnkA4qnwynMvRVqz/RPM0vdMmurJkQo5qI10Rs0mUwEEtOO+KyobiuQ5R6YpDolqRViS6P+bG17p7TmvnLqAGS54owaowf1TEVl5nJuhsC4g9XawReuNY+SD1W1grVR4Wa9OAU/4IPlSGghLYs/xkPXZxv/gaHGQhtqv8i59znEGxPxXY0zWRU9JnP99XxjWDkaT5MVxJM8PorFHnr/ZNsO3ssrWxdjtUqWl86EWYSgVmVeqgHTHCHSbAxLJeliUE24ZBOTT5lDxKcGIVZnok8DxlS4oLofJYRLtvtBApwQ1YTDk5gb8Qs+f+1cDajAuu/LyG3ve/BCqcgRNfONCRqg3hYPcmhmIv2f3C8Ub1is0f/lCc5Ro4iBtu3vrelcGZFVLtyhSOprGtiY9OjClVXC9vrqptShhpyckY0B3Q=;
	4:shJmpz2OVhuZJkwcuPnVNj2ZS4v7Y4OgM67J2iqN9dMtrd8BOthfpiJIj/VxWtMEXKpzZG5lV4c+6JTpsiAsGEvzVr0VEkfryvzSWkv6uNF4qb96+rjjD3uEOOjIhcMP6GA2J9KulksulI1u+P6KnB2Pj4BxkZk1d+e6m4127NmzhjVlmbCC4dhKVSXAibM11jgjmWZLJ0lJqy9/yLHpmDovUm29ilSljFOFCScKdLmDW4mVl9KmHIonFvrID0nrvMeIz+4q8rnlz3GDNZcCw48s2FZd+3MhK7rX/kDYEDEeItrjiVPgqceOod0vyIFs
X-Microsoft-Antispam-PRVS: <BN6PR0101MB29310D5A35BD6410BDEADDA9AB2E0@BN6PR0101MB2931.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(3231022)(10201501046)(6041248)(20161123562025)(20161123558100)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2931; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2931; 
X-Forefront-PRVS: 0493852DA9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(346002)(39830400002)(376002)(199003)(189002)(24454002)(68736007)(54356999)(86362001)(6246003)(2870700001)(2906002)(6116002)(53936002)(6916009)(3846002)(25786009)(2950100002)(5660300001)(6666003)(65826007)(316002)(31696002)(16576012)(8936002)(58126008)(64126003)(67846002)(50466002)(97736004)(50986999)(90366009)(229853002)(6306002)(76176999)(65806001)(47776003)(65956001)(66066001)(23676003)(4326008)(77096006)(101416001)(6486002)(478600001)(93886005)(106356001)(966005)(33646002)(31686004)(36756003)(83506002)(16526018)(81166006)(53546010)(8676002)(1720100001)(189998001)(305945005)(105586002)(7736002)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2931; H:[10.156.8.118];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzE7MjM6b0JSVFd3NmJOUXhiUkJlTFZxQkE3SzJy?=
	=?utf-8?B?SUZEUUxpYWI3ZVFlcEdDWHZxSU1qWFh6V2UvN0pVaFVmY2NJSExsOTF4S2NK?=
	=?utf-8?B?OWVSWGtXUzRNWmNsUWpwMTVQZ2Z0aGEwb01JUU5pc2xpemRRN2dKeGlNUFJs?=
	=?utf-8?B?eHpzQm1Pb1k1eGFYQU9oUVBidHBjUTFlUFVVVFZ4elhXQlZmdWNFTkNzT0J2?=
	=?utf-8?B?R1o2bkVTdE9vd3BVRXJMa1lHNVRhY2c2TVQvUlZnSTh5NkhSdmJYRXdjNDRy?=
	=?utf-8?B?cEZ6cFMveTU1MC9nOXhkOE9Bai81cU44VG9GaG45V0MxRVdPNGRGbHJ0R3Jt?=
	=?utf-8?B?MUh5NUZYTnBOUkppUExyTjhwTDgvbUJCc1Y4aVJwUVhMTE1nSUQ5NmdKTXFi?=
	=?utf-8?B?UmErbytONXZhVHpIdnNjSUR3cm9ia0M2RVBSK2FmVzhwN1A0TzFuRndvWUVw?=
	=?utf-8?B?dk9BZytlRWxmUEE5SG9HQmlDR25ZemFUTUMvS01FaVpsUkdtaFhBeER0Vk9U?=
	=?utf-8?B?QisvS1Q4NlF0RW9WdW9yVUdPR0FFWjRqSDJhNE1WN010M29xc0d2WEp1b09Y?=
	=?utf-8?B?SGt6c0E0cGxEcWNBcEpIbTM4VVhrRmRjM0NZMFNuRUo3TVBJLzBwN0pZWFZa?=
	=?utf-8?B?Z2lrN2s5eEFtYlFHUFI0VlRNNldMSEZDM2Y0bzVGNXVkSlFSRFVYdTdQdGVC?=
	=?utf-8?B?WGM2YmZVb0ZyOCtKNmI1eDQ2NUdyT3l0N0VOdGttRTc0RVZaNERjeHJ0VDZi?=
	=?utf-8?B?TGRsc0w4RUNBRHZGUWdyajFjNFpWa3VpcENCR0Rmb3QxUXQveVppV2RWb0Jx?=
	=?utf-8?B?Y0NjOTkxd2xkMCs3aEoyUjczN3lrM0lMVW94NkRtT1pkTFJVbG5GbFZSSGc2?=
	=?utf-8?B?SGliaTRweElndWhoTXErYXVMblo3bVBGdmFOb2thKytucUFSa0lDM1M5RFY4?=
	=?utf-8?B?NkNhaXJreUJ1Q1ZLVE1CeldNelhTYkY0dU9rcGg3UVU2R2NCTFREYlNsdHZV?=
	=?utf-8?B?UmRoVkNIcUY4dzRoeTZvQ29CdmhLK0dVRTZaalVEYlJpMXl2bkswYXErL291?=
	=?utf-8?B?R3lEa2hVakNKN3RVRGE5YmlrMGo2K05WMWRITFNuSXB1RFlaRjZtQkRvaTE5?=
	=?utf-8?B?dThkYnhRQUJKRzFCaXcwTzVQTjhpd2NYVFJEOUNaOFlrSUhIVTBab3pUQkwr?=
	=?utf-8?B?Yi9mRldESnl1TFp1T3IyRFpXcEQ0QWwvUzkyWUJIbHBTSlFGdWs0T1hiTThz?=
	=?utf-8?B?TnVVQUJlVkcvODh4U2hzNDUzamRHaWJ6S2JCM3NYUTN5NXlQaks5UXBCTHJ5?=
	=?utf-8?B?cXRzdFczNGQwbzh5dlVuYzgxSm51cjhoNHl6YVc3WEVyNkpLME5aMGlKTzdO?=
	=?utf-8?B?MkV5blhEV1lmNmVNYzdQdUtVakgrUFVpOUR1TkY2b2RxYndCVEhxWFB6YzR6?=
	=?utf-8?B?SDZyZnNReHVlVWJuM3RDRVBvazE4ai9MNk5lTTVEbEFWSW9BZ0dJUTYyTkhO?=
	=?utf-8?B?bGROZHNDOEJtclQxLzJSb1A1RE5xN1I5eWUyM3BJN1Y3YlBOMUtsR1JIL2N3?=
	=?utf-8?B?Q1dCLzZoeEY3am80dVEwTEx3eWROcXp2MWkxM3NGaDFTWTVGTXpHRDVTTFFk?=
	=?utf-8?B?a1RubHlmWXg1SVVIeHp6ZnBtU3M3TkpKNEJ3ekU0OFY5M0YrbUpKRktVVTFQ?=
	=?utf-8?B?NzJZWWdsM1RrRk9TcGVZMm1QV1dRSU5BTCt5aFB4VHRFQjhoQ2t3Y25sZk5V?=
	=?utf-8?B?dlNGTmJsNks1a2lJc2VPdmFLanFqOXQxSUhNeXpaZVRlZitWU21WMktYMkpi?=
	=?utf-8?B?cS9kZ2F1V1dTaUluNHlKN28rbkdXMUJEY3cra2tuY3NpVnVEa0hLVU1wT1Y4?=
	=?utf-8?B?RTNiNVhNTnE1K0hjNTFEUGNFbUx3eEhqMk90SFBORVdVbTBPcldBNDR2RHpx?=
	=?utf-8?B?MCtQc1RWWnFRbU9UVHZCR3gwcnpVN3Vsa3R1cUhpOFJzTkV2SUJTZ0dyNzdx?=
	=?utf-8?Q?dSM1+4Eo?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	6:LSP5+lLIAaEI65FeC3Tx7x8paN/pNW8CrZuJhPocTUkcgstTyc3rr426YphrIIepxtwg0s29hJDf1cDzdfBshvw85E/vThwFQdw3m5wtk5d3v9Uvi00rOf+NXvX3kg0Em97vSrEI2AX4WbYmFfgIJnUq2YRCQ+xwL81CEw6BzBTE8Rgjq9fueuIpic0u9oDWGllexc16bBAsaHHi9LZOjWVgyU6lEuipBGpUD1Xcsi4iJtoeXpDQuhU8nUmykdNxK9Tf+oC4vN+7j/1qeXee1/wnQqTBgEN5/VxMKLOw/HOmxxU+2pjx+7JZm9N74MnlE8IshzW6Ls5EylqsP87wdXhCK4yQLCl7F7erB2hkgAQ=;
	5:BnhX7f54GtbjARGD3lO2gJ5Zk5XZVB5FvLcciL9gNzwy/q9T+y+rCuEIJzx7aC37CfRGVXcrO6gfsROUWyLJHno/Cw9WD68fOmaYiq7+U2EoG4+waSUfZkfxqe22kd1P30BJLOsEW1qvAAicJ2zlnnliT5ZCgzQNyS1UtFDGGmg=;
	24:/JTG5KoXo5ztThiYM5LIXblIDv1DOt4zZd5h0uZg9MKAETFRnugcyDFp3pGyN8T24NRTiO0zUWn3itwSXSabj0DSVfhlb8zPhwEno0DKP+Q=;
	7:koyQdGH+zcqiMuWiEiyaRIcnVKdWtHn6vUCKzluofNHEP5NxCqehncw1h7iGcpdD5fb5p8LKV2QJ0IzBghGK96+mgxAipStcBhnVRfp/1BPcwj3OU1pDFeEhECf4tuBu5auy6b6ErKxL3a9M0yJ/UDBPewtRtxGHBMtpoDUwbXunnRtlA0zFbbd72S1wo9KtH+zW7RtK1opVGyDcOBJU913mmLc1MHUWe0HiS0F/vWT8GsyrapHSMjhSlHbreH+f
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2017 01:21:05.8927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 760afbbe-8f78-447d-a526-08d52c904f74
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2931
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemctl-native: add target.wants to target regex
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
X-List-Received-Date: Thu, 16 Nov 2017 01:21:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I looked again at the log failures, and it's hard to conclude anything 
without more information.

Is it possible to get a baseline without this patch? For example, step 
53 fails with SSH refusing the connection. Does this ever happen without 
the patch? Step 47 fails because connman is not running and because 
test_check_rpm_install_removal_log_file_size fails. I'm wondering if 
that ever happens in normal test runs.

Another useful thing would be getting the output of the rootfs creation 
logs, which would list the exact systemctl-native commands used so we 
could see if some service wasn't enabled when it should be. Again, 
systemctl *should* fail and cause a build failure if that happens, but 
there could be some bug.

On 11/09/2017 05:01 PM, Martin Kelly wrote:
> Got it, thanks. My patch *should* just convert runtime failures into 
> compile-time failures, but it looks like we're seeing actual runtime 
> failures, so I'll try to figure out what happened.
> 
> On 11/08/2017 12:31 PM, Burton, Ross wrote:
>> Thanks for reminding me.  :)
>>
>> 1/2 is queued but 2/2 was implicated in a number of systemd-related 
>> boot failures on the autobuilder 
>> (https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/553).
>>
>> I've not yet got around to looking at exactly what sanity test 5 and 7 
>> do to trigger this.
>>
>> Ross
>>
>> On 8 November 2017 at 17:40, Martin Kelly <mkelly@xevo.com 
>> <mailto:mkelly@xevo.com>> wrote:
>>
>>     (ping) for this patch series.
>>
>>     On 10/16/2017 09:31 AM, Martin Kelly wrote:
>>
>>         The regex for acceptable systemd WantedBy/RequiredBy targets
>>         does not include
>>         target.wants, so a line like this:
>>
>>         WantedBy=multi-user.target.wants
>>
>>         gets silently ignored, even though it works fine on a real 
>> system.
>>
>>         Signed-off-by: Martin Kelly <mkelly@xevo.com
>>         <mailto:mkelly@xevo.com>>
>>         ---
>>            meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
>>            1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>         diff --git
>>         a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>>         b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>>         index efad14ce17..6e5a1b7181 100755
>>         --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>>         +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>>         @@ -108,7 +108,7 @@ for service in $services; do
>>                  # If any new unit types are added to systemd they
>>         should be added
>>                  # to this regular expression.
>>         -          
>>  unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)\s*$' 
>>
>>         +          
>>  unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|target\.wants\|path\|timer\|snapshot\)\s*$' 
>>
>>                  if [ "$action" = "preset" ]; then
>>                          action=`egrep -sh  $service
>>         $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
>>                          if [ -z "$action" ]; then
>>
>>     --     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>

