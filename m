Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 3854 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 May 2018 20:08:12 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0046.outbound.protection.outlook.com [104.47.42.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9674774BEA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7RwfGhYxxO5kJ3ZnSjwRHibvOa1MLr2pjdRCdMGMYzE=;
	b=VReikmdfytzAfxJyS3ds6olzRdlYu06EpoXWta0w8FOfYSlIvdEFIroCSfITWhKtkojRh8v2uRdp/fnNwoumM6e7YvIRMuTmCr8DwpPnIR/4vbXcwsqhrj6NsMBtwksyHtRmSzobSL92kehvVV/6VDaQIJQ6G68ZdKY2z5vqWWo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.200.13.222] (4.14.243.50) by
	SN6PR0102MB3424.prod.exchangelabs.com (2603:10b6:805:3::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Tue, 8 May 2018 19:33:42 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180508184903.13506-1-mkelly@xevo.com>
	<20180508184903.13506-2-mkelly@xevo.com>
	<CA+chaQe854jAujaBtPOP+B8QoQ3FatBFwKZBmQMgZ=Yi=cSGng@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <60770784-fa69-778d-776e-3a51e656571e@xevo.com>
Date: Tue, 8 May 2018 12:33:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQe854jAujaBtPOP+B8QoQ3FatBFwKZBmQMgZ=Yi=cSGng@mail.gmail.com>
X-Originating-IP: [4.14.243.50]
X-ClientProxiedBy: DM5PR20CA0010.namprd20.prod.outlook.com
	(2603:10b6:3:93::20) To SN6PR0102MB3424.prod.exchangelabs.com
	(2603:10b6:805:3::13)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR0102MB3424; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	3:is4WUGER1OHxcKlI/CoEuQzUVAnHaOK/WJ+Am5mCimdecnOseoHzuVCdJD2CPzshqgYoxqXU2//UAWSf8gGrksV8x5j+EXbZxALZDDgf8WcuIZ7glmaEFbtFk2wSYC2S9f7LukgeaGM//RAAWofhHq22JYCJ9KEoleYpMDJXj5Hk18RImRMfX/ZBvRbFN5n6A3hu13PFx8bsYb4sSqXOsKmaSUJMWYxucUi06QzDhFIb5uC4Cu1g7ATrnij2e1EV;
	25:AA3c31ABkbvMKhP0M9OpmmK3AeRKmww9bo52x4T4CmWkPlpIsqXmimGihXwbWJkaXqecHJONp+HY0Yla0E0jEln2k0221Qttxc+ESG6rK2pcemhGhfWVuHzC+izUTH9/Tic3Ks+taOWxHJG8TfPR9qRpn/5MPYddnAAzUMLX+A5rAdLT5UiMzh8iplDG87lRmrPdax215yXC4gAVROPZl61ZaEFS71Ev+fV6KsuOI4HcQ7C40EMJFMBnufXeYYSXBF+442U/ioswVxjacPWMuh8LTeSRH8xZC6nXfa3tujQH0eIeMwCsnILccy+zgK60opJgU+LGVmzPRE0WhX00lg==;
	31:Mt+UbQHeXdW+nj/aF7xa2hLgdugyaocAntsKj4g78u6RImHb+lemhV5dKcVCZANYAip+mpAj97HRGO7p6GnIHokzTec2nuY5KaOy29GG/iQB5GEPiw6mxcwhGssyNVLiH3xGGfvFQVd26/ZBkLqsygVfPo6DX8BNySVg3Nq+QGVluSY7OjyikDpHsbQtdNy1LorzPYo2Lu51OHLl316AiWFhZqS1Uhse+cuC663S/Nk=
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3424:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	20:RhyokGbegP0n15Cyp9HoNcfXCjLM0EMAP5lz641WdvYWzr/kszzt2zgOvZcv9HF3Csvt/1H18yhU7Xm6KjvjrSD3tCf5hLmhFwCbi/Qb35mILouii8uZ+rUVWWqxmHQUuWUQZnkmPC54J8JzcgV864T81eyJDqP9OU+WWlzo4LW0gPnNZPVf1wXBxcv3fyXR1fkW3vcY4qvhokt95AiT23INNK+Y8gZEFoSmXLvtMBoLFUFGbDVKyLOcjjc2KhnARvWeZ6NfWxvK161a9+4sCuyqamPHRqffd9/fc+DoLzLxvKxLANU9OUc07XyGJiIAUy3VAl2NZujgXDv2+XQd/Uchy3rzHGnzkbH6ubmczPk6HCL1GC2h8a2pGPkC7ncEDjmBMUobrvV6FZ2kfJRvBqgYnT9Vjdz2Xx4fb8xWhAuvDedjCDvoVBKwe1EFPBhRHGKGLNfeTyOzVPr/DqK1Y2Q7ymL4ya8tXb7joS2nzf1/dxMn+cNLvuRsKFjOR6CD;
	4:ZKRty81lFC5IU9yARlatEyhqH+mEKQG7HJ19+REmiNKYAA9lbhlRUc+UegZZqntdxOEhDY10a/o49TgqLZRGfLaWEuwRHn9TsnlJNQx2Ae04mClmqWh52BBuKC+LfzNiQ584Kj7NP41dScV7mtB4PL/CDhxDOcIAqvkjQc1Hf3KeRRpgwHS1NuShzsRmG593BnbolSIQmYz/RtbeT9cUrFTsHRfH8EJ+nB+BBI7hHxb05BwpzUfRkD91uQAfOK2GyX0MkpR1hpQuNHmO1OfGtPzKBgHdTHF8K9lS6uaTZNT1sE98JBPrRoG5B9GhCsJ6
X-Microsoft-Antispam-PRVS: <SN6PR0102MB34247C9066D2622F1582240EAB9A0@SN6PR0102MB3424.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN6PR0102MB3424; BCL:0; PCL:0; RULEID:;
	SRVR:SN6PR0102MB3424; 
X-Forefront-PRVS: 0666E15D35
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39380400002)(366004)(346002)(396003)(39840400004)(376002)(199004)(189003)(2906002)(53936002)(47776003)(50466002)(6486002)(52116002)(105586002)(2486003)(31686004)(6246003)(5660300001)(106356001)(2870700001)(36756003)(76176011)(23676004)(52146003)(67846002)(305945005)(4326008)(6666003)(65826007)(6916009)(97736004)(446003)(39060400002)(316002)(486006)(53546011)(16576012)(11346002)(229853002)(956004)(2616005)(476003)(59450400001)(3846002)(81166006)(6116002)(77096007)(186003)(8936002)(26005)(1720100001)(86362001)(66066001)(575784001)(65956001)(31696002)(68736007)(8676002)(7736002)(386003)(81156014)(478600001)(16526019)(25786009)(64126003)(6306002)(65806001)(58126008)(966005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR0102MB3424;
	H:[10.200.13.222]; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjZQUjAxMDJNQjM0MjQ7MjM6QU83SjE5QytWZWNBZXc1MlRCWGFqVitR?=
	=?utf-8?B?SWRMNUVyQ0txcm9SdWZCTGRlNXUveC90SENZQ2hJVU9DTlE2eG42ZVBoYktX?=
	=?utf-8?B?SEJaZEx3OFJET2grUS9waFppRU9pT1pHYXdIUlV6d1dJS2doUzJ6L0JIa3E1?=
	=?utf-8?B?RWVzME51Nk15bkNCMWswc3BoREhCM1VibVBPQUZhb0lyUmFHOGZaajh1a0ps?=
	=?utf-8?B?czVWeXEyRnV6aHBVTkZPYWphZGFiWURhQUxCK01kcTA0MlV0UVlUeVlzOUlP?=
	=?utf-8?B?Q28xWHNTYjJnRmxwcjZRMzhibDhneFFjNWY4YnFpVVhReGxwbEl1NjdZdVE0?=
	=?utf-8?B?Q0d0U1E4dGt3eVFYNk9BMGcwVmR6clFYN3M2T09GK05keGZEL282UUdJSldZ?=
	=?utf-8?B?Ui9sUWVNbUpqRHZERjF5d1Q5TUh1d1g5MTFsUXRCOEpWeXlxQ1F6dkc1Y0xB?=
	=?utf-8?B?aFlFcG1oak9yVUxUanJIZTlZY2pxOCtMR2NxMWMzTTFCY3FRQWQxRlpzTzVS?=
	=?utf-8?B?SW9tblpCcW83emVYditScmpub0ZjN2xkbkhoV1hiZ3kvcVFtVHg0dTViQTQr?=
	=?utf-8?B?SjdPRWZVWmljaEhDTFhzdGVQZmxWMEVZZ25iWml1UnU1ai9RbjRFcGhYWmRB?=
	=?utf-8?B?NDlQS21kb0d2VDc5aGJ2My9tM0h5anBlaGorZlZMSDJINWtGbjBaTEYyTXV2?=
	=?utf-8?B?MzlMT3JPWE5lVnh3TUMvcjRYRWQwQU93dm5Udy9KaytiOEk3WEJoRlBQd0hu?=
	=?utf-8?B?QTlQUzNJT0VvOXViYmJtNExmdE5XL2VzeXlaZHNGVkN3Mk1kSk02N0JobUpE?=
	=?utf-8?B?VFdIdCs0Vi9VUEpYenFPdjJSVHR2QXp3QkNUb3ZST0Y3NDA3dkpvSk1PUWYv?=
	=?utf-8?B?NmlNMDBCN2VhclFTa2RHeGV5M1dxZFZTTnNVUTdTMmdIbWl3WC8wdmtZY3JP?=
	=?utf-8?B?OUNqUXBHREVhT3JVa1F5SVYvWVJLZnRGMU51d1VyY0hReEszU3IyUFNUZmxB?=
	=?utf-8?B?dmR4M29QTE9vM2UxU1Z6NTVnd3BvREU5dGllR2lKWVNNeit1bE1rMmJqU2pT?=
	=?utf-8?B?ZTRwU1hXYmdIUTBxNWJNRVJncHgxLzIreEJXYnBrU1kvRm5LZnRNUHo0cXZl?=
	=?utf-8?B?eGphMTRUK09BdnNIZFBVU3RGQm1KL0ExUFc5MHRzR0pTSlF1VkNwTjdGYitH?=
	=?utf-8?B?VUhEQ1ZLaGV5YkxzSE94V0FBUWF6TnZmT3hsNERaQXNVSmJVL1BZcnJyV1cv?=
	=?utf-8?B?VWx0U0J4WkV2RVl2MnY5bFRQR3J0UXhhMjhYc0owNlRRUGp2L1U0bGhIbWpU?=
	=?utf-8?B?NmNweFc4WDZYck9HVFk0bGdkcng4SzE4Q05IR2RoTUtpQjNHNG9acnR0cEkr?=
	=?utf-8?B?bCtTdGpmZStsZVNFS1JRNE5NQVJkUlBNRHRHUHVSN2NpQ0lIZDl5U3k1VEJ2?=
	=?utf-8?B?U2ZkSStIakJPaEk3UzB0enhoSFdZSEtKZGZzWWVuck5xL0w4a2N2Y1hGT282?=
	=?utf-8?B?K3FhUzhyaWlHQTczbTF2S1FmNWxqNEdCZ3p2bTkvbVhJdGNEZHJiYnBIN01v?=
	=?utf-8?B?YzM5WVJoOUdENXdSOHpVdVQ5clZnVENlakYvOE9tdnRUS0x5RXJDYTdrQ05U?=
	=?utf-8?B?U1YvQ04xbVNPc0czUzNGZ0RMREwvbzlpbVNRVlFCdmowbnNQaVU2c2FnNFlk?=
	=?utf-8?B?RXQ4NTBwU3FMcktkSE5hUW4yMDN2b3N2NlZQKzFyVjQ0UkJMZHNWaFdhUy9T?=
	=?utf-8?B?b2JtQWh6MkVGbnQ0OXBXTC9qZWVNaU5KQ0Z5Vk52emRKd0ovOFlWTWUvNENY?=
	=?utf-8?B?RE5BQ2piZFdzbzdlWE01MEwrbmF5V0N3N1lwVlh0OW91L3IxL1Vtd1QyVGIx?=
	=?utf-8?B?ekYvMVdOZi81NENrdERmQmVoTUkySjl5VmNPS2FHdFZSTkZzSWIxYWZ4RDhI?=
	=?utf-8?B?VUd0Qlc0OVI2czNQdTdRbSs2WkpUajhPMDdtQXFJLzR4ZG1uRXdZN28ySUdE?=
	=?utf-8?B?SXZPU25lZVlSZlgxa3NXck5TSVhZYzNobHAvTktBeXNuMmFpUHJtRTNMYzJY?=
	=?utf-8?B?cDJhczczbUZZdmlzQXdYb0NlMzVlblJJZ2tzTGE5WTRRb1JPTzVXSldkazJj?=
	=?utf-8?Q?zRk/YyrU6VvBS5WcigRstd8hw=3D?=
X-Microsoft-Antispam-Message-Info: FvP4AMZd8c89RFUTdOXNHMi2b4FLMFtabtGBqBr3nTU8lxVXzY9VbOZwgbeInA2yOl5vIRuXAfnwxM6nanJ683TJpxmJgCAS8H9IVHwlooi9fe/0VM79dOGEHkJeeAusd3MDSAOEsEYK0b9gGWli7gMR7qnVdFvYo7j5bU+am77ZI9JZ6ADmW6mlfcqrSP2Y
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	6:5Ck3QqeWa6LQnTRJZoIYPwrjJN1c4+5h/1DEBGxAV9zFA9Tdr+s+BSEjhLSrCZUmXrjpJ82eP6R5c9IMcMV56BkU+usqOrSKO6L4yNDsFzqEORRvpPI30feO9dIPieyynFnSW5PABh6S/jtSfLpDQoKZBJCljciDUsUkMgUoWHudnFyX0txvQ0cXIzKqAGmz8LwjtT0UFzyJA0x4tv9S1OeZv7zKpydGLrrN5DmCS/qkGeWVHBCXOSTLs+dyZ4dsVTM4igVqEmxc4a7e+RVrf1Eqebywh9b2s0j9wTiSsouCmKvZZSAC9tdAgVJoeH8p12z3Cpd47EzWqTFNofGKFWfq9CyxmMIC+f3jCnxRl4iva2bzMJiQfz8tx1r1M/JzLek/v5zDjJ6x5OvhCAmfgRDu8mT0Hadl3RU1ZqWExw6i6o+et8/dajuYuM9Rq4Arx1do7lI5FqFsvU0t7UgpuA==;
	5:gc64LO7cmtCGEfuB2IZId6h4Rx3kSdJIVsFULGuykiADWHecobHZL582TfP7AMh0WVTQNMwDSs2aGgFblBWZ2biBOmIS3VjxbmI4WbouzW2ncfh7XQk1/+rLHZsIaZL3H2qrSBKOL+WCZCB9F3Wj1/B2mjEqHaDQ/9O5MtXRSPI=;
	24:1I1o/MjWCaHKOaU+c3FK/aGQQdhtU3rUC3SRV8zffA1PbeERs0UPPeu84kM6XJG1fw1O1H899mWR2bVGjfiD9WGzFQ97KAcCb5YKol1i0Xo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	7:S9GvxWwu55X3mn+NJGd7nM3TJ+q3+KoYqmCe2ynvIFOES2UK3LnnmYMRMJp572rh6Bvob4dm/Y630gt5NXbcapiWDak/TCZic/4U3VieOJTm/+AsaFROPNNwjgBfYH3BKW8/q+NMxbih5INZoFui/PnDVqEpZVMgtuznEMXIwcL02XOyXUJKxObWJ2ObFWx3m7BdAyeJxUKLR+Fj8n2f//WPDGMi/1nGYT+T2J161MlbY5u/Vq4H+AMJAxMWk++s
X-MS-Office365-Filtering-Correlation-Id: da1c1643-6d61-4445-33f9-08d5b51a9b74
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2018 19:33:42.0123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1c1643-6d61-4445-33f9-08d5b51a9b74
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3424
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] modemmanager: upgrade to 1.7.991
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
X-List-Received-Date: Tue, 08 May 2018 20:08:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05/08/2018 12:29 PM, Martin Jansa wrote:
> Hi Martin,
> 
> all meta-oe patches need to go to openembedded-devel ML.
> 
> Thanks
> 

Of course, my bad. Resent now to oe-devel.

> On Tue, May 8, 2018 at 8:49 PM, Martin Kelly <mkelly@xevo.com 
> <mailto:mkelly@xevo.com>> wrote:
> 
>     This version has a ublox plugin for expanded modem support. The
>     underlying issue
>     that enum-conversion.patch fixes appears to already have been fixed
>     upstream, so
>     we can drop the patch.
> 
>     Signed-off-by: Martin Kelly <mkelly@xevo.com <mailto:mkelly@xevo.com>>
>     ---
>       .../modemmanager/modemmanager/enum-conversion.patch | 21
>     ---------------------
>       ...odemmanager_1.6.4.bb <http://odemmanager_1.6.4.bb> =>
>     modemmanager_1.7.991.bb <http://modemmanager_1.7.991.bb>} |  9 ++++-----
>       2 files changed, 4 insertions(+), 26 deletions(-)
>       delete mode 100644
>     meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
>       rename
>     meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.4.bb
>     <http://modemmanager_1.6.4.bb> => modemmanager_1.7.991.bb
>     <http://modemmanager_1.7.991.bb>} (88%)
> 
>     diff --git
>     a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
>     b/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
>     deleted file mode 100644
>     index a3fb0f3eb..000000000
>     ---
>     a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
>     +++ /dev/null
>     @@ -1,21 +0,0 @@
>     -Fixes errors found bt Clang
>     -
>     -| ../../ModemManager-1.6.4/src/mm-bearer-qmi.c:774:50: error:
>     implicit conversion from enumeration type 'MMBearerStatus' to
>     different enumeration type 'MMBearerConnectionStatus'
>     [-Werror,-Wenum-conversion]
>     -|         MMBearerConnectionStatus bearer_status =
>     mm_base_bearer_get_status (MM_BASE_BEARER (self));
>     -|                                  ~~~~~~~~~~~~~ 
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     -| 1 error generated.
>     -
>     -
>     -Index: ModemManager-1.6.4/src/mm-bearer-qmi.c
>     -===================================================================
>     ---- ModemManager-1.6.4.orig/src/mm-bearer-qmi.c
>     -+++ ModemManager-1.6.4/src/mm-bearer-qmi.c
>     -@@ -771,7 +771,7 @@ packet_service_status_indication_cb (Qmi
>     -             &connection_status,
>     -             NULL,
>     -             NULL)) {
>     --        MMBearerConnectionStatus bearer_status =
>     mm_base_bearer_get_status (MM_BASE_BEARER (self));
>     -+        MMBearerConnectionStatus bearer_status =
>     (MMBearerConnectionStatus)mm_base_bearer_get_status (MM_BASE_BEARER
>     (self));
>     -
>     -         if (connection_status ==
>     QMI_WDS_CONNECTION_STATUS_DISCONNECTED &&
>     -             bearer_status !=
>     MM_BEARER_CONNECTION_STATUS_DISCONNECTED &&
>     diff --git
>     a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
>     <http://modemmanager_1.6.4.bb>
>     b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
>     <http://modemmanager_1.7.991.bb>
>     similarity index 88%
>     rename from
>     meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
>     <http://modemmanager_1.6.4.bb>
>     rename to
>     meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
>     <http://modemmanager_1.7.991.bb>
>     index e60cd4b74..4f9400169 100644
>     ---
>     a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
>     <http://modemmanager_1.6.4.bb>
>     +++
>     b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
>     <http://modemmanager_1.7.991.bb>
>     @@ -11,11 +11,10 @@ inherit gnomebase gettext systemd vala
>     gobject-introspection bash-completion
> 
>       DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
> 
>     -SRC_URI =
>     "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz
>     <http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz>
>     \
>     -           file://enum-conversion.patch \
>     -"
>     -SRC_URI[md5sum] = "06488186c7dd53f8104183b86f7a1568"
>     -SRC_URI[sha256sum] =
>     "cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf7926171c668"
>     +SRC_URI =
>     "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz
>     <http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz>"
>     +
>     +SRC_URI[md5sum] = "4efe6a240cef212bf8855c95424e7c7f"
>     +SRC_URI[sha256sum] =
>     "4e366243bd4983f2e6efe35cb901cf5da51939307b5d6299fe622a9fcf411745"
> 
>       S = "${WORKDIR}/ModemManager-${PV}"
> 
>     -- 
>     2.11.0
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 

