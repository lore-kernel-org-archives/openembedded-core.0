Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0108.outbound.protection.outlook.com [104.47.2.108])
	by mail.openembedded.org (Postfix) with ESMTP id 783C2788B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZClWnnA+iOED0f/rakdtTdIXdTOb21zjbCknsXICF+Q=;
	b=V+1ms8eSvNpxeTVCnP1jsl/IlEXcJtM0LXiuOHyl2B+Dwhm/zss8FFhJXw60YgHqKfhwLUjzks0x5HQMswemLixFiakU1cI7Nt5JYYFBktxUqg31+gfZqBabiv0xMKrxkUJcI0tZnqhoGK+EAaJOHLVwZ/j//56lyMOqtWJClfU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.21.3.182] (87.54.42.112) by
	AM4PR10MB0115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:2a::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Thu, 8 Mar 2018 07:25:50 +0000
To: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>,
	openembedded-core@lists.openembedded.org, manjukum@xilinx.com
References: <1520433689-6357-1-git-send-email-vineethchowz.chowdary@xilinx.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <2b8a0c5f-3787-23ac-d371-56c805064949@prevas.dk>
Date: Thu, 8 Mar 2018 08:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520433689-6357-1-git-send-email-vineethchowz.chowdary@xilinx.com>
X-Originating-IP: [87.54.42.112]
X-ClientProxiedBy: HE1PR1001CA0022.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:3:f7::32) To AM4PR10MB0115.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:2a::7)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d1879f0-20a6-41c4-8787-08d584c5d22b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4604075)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7026125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:AM4PR10MB0115; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR10MB0115;
	3:UXfyOoHWdW4/KMjdkXs/N6tL7yddH0jrr90XgCpumHRZy6M2QJThhyl6wbW6bvpgH/Ae1DWUnSjdrPew5RU9+c3QfTKoruRoiDa8nddWOPrtLYGyQ6cOQcdiX/yBwIElGK7DHyvcoIH4d1plQ2G8JRA9CV3zd0Npu09PcCvUAl5AheEtEa2QTPLVrCR5G5B0euXz6Ju3H1Ell+HD0eWY2qcvHCnmtKjgIZiGJiCagZtO6VHYOydPphTTjv7qX/E5;
	25:BVWmPljEKjGktJ+JAU82KZoTUSVXcReN63O1vBrkRngU9aDdY+vku+iZWFT/1JOPvlQFTUMP/8yfNblGjUoxOf04VHzl6p0UUSNdPn/LKhQ911/Q6TknUfDDvA1Zsb7Pgc/Y9fff6ISV41ybTvz6uwfVUGelBATiwlNn4RzPmTyF/jDDi8SPZkQ/mc4y5/DK8GkkoXi9VYqDP5J7jrSN+dkzP+AWCMjwLaO4WnOsDDZyQmFuu44Dytz3V8nsM0OZ31LQw5VEmeyePcMft222HVM3Hk0OLlbgO3P+m0DEK7arIMKp/LS5X0fGvs86ZgSCVRmPIGsMn0R54juFc5hH8g==;
	31:bFQGlMAEPx6gfIAbQYxT4QgtJ5STUu966gAytOlQJ+zHSR6auU15GpkDdaAfhQcR7SDetk0Z/2hFNrQrG0Z8yVt0Q8C/1tnaHnzdtLdZ1d7Avsk31qp93hj/J2ZBOyEMOMxxo0iLNbtSHU9w8aRiaQ8bZ2niLFRd0Q7LmX+g8ZD/Caz4yp5lAyVVDiJyd42e6AGMfz+F3oROvKkmXoqD4YgbdAgyXmcyCSDHIe1QUys=
X-MS-TrafficTypeDiagnostic: AM4PR10MB0115:
X-Microsoft-Antispam-PRVS: <AM4PR10MB0115F35EF2D407179E2180CD9DDF0@AM4PR10MB0115.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231220)(944501244)(52105095)(10201501046)(3002001)(93006095)(6041288)(20161123560045)(20161123564045)(2016111802025)(20161123562045)(20161123558120)(6072148)(6043046)(201708071742011);
	SRVR:AM4PR10MB0115; BCL:0; PCL:0; RULEID:; SRVR:AM4PR10MB0115; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR10MB0115;
	4:0HXC8V+VJoUwP/p+PgXTCZ1kULjvKrpsEF/6/I67F4J7MsPtI1Wm6mhC8yDOX67WYkTV6N0slLI5DUy1rH0ZgGKBd/RY6ZHi6QVSehe9oY9Q3xQdFY+QibFxaTPuQ0IEe5uaFWYoAE86MvFvcgfArca4mH8DuIvh7iett0v9uuAH3QkepT6ZWm79jxnRrzi0PLnCxesLqNETIV/qFWJxAKELT2eigZFyHY24gBfuzpewOwevt9WpW4ACxXphdWcPoCx11YO6eEQ8fAmyG2rnxLKSPL3aU2z6EaUn4QGif+Eqgyizd62YiuQM6mDZwX6A
X-Forefront-PRVS: 060503E79B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(7966004)(396003)(39850400004)(346002)(376002)(366004)(39380400002)(377424004)(199004)(189003)(6666003)(25786009)(81156014)(58126008)(65806001)(5660300001)(8676002)(31686004)(65826007)(229853002)(2906002)(8936002)(16526019)(3846002)(386003)(53936002)(81166006)(6486002)(65956001)(50466002)(16576012)(316002)(66066001)(42882007)(8656006)(67846002)(8976002)(2486003)(186003)(76176011)(26005)(77096007)(53546011)(52146003)(105586002)(47776003)(23676004)(8666007)(52116002)(64126003)(6116002)(230700001)(2950100002)(305945005)(106356001)(31696002)(6246003)(72206003)(97736004)(7736002)(36756003)(508600001)(68736007)(74482002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR10MB0115; H:[172.21.3.182];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTRQUjEwTUIwMTE1OzIzOnBJSGxmemNDU0ZoMUtzQzZnMWxYWXZON1B1?=
	=?utf-8?B?amJjQUpkekNjRCtJdE0wWVBOSWFQS2FIMUd6cDFOY3FTaWhndS96ejc0YmEr?=
	=?utf-8?B?eUZpUWtreGNaQlkvbE1ZVWVDUXErNzBubVNXWHZ6WWRLR3JlMjZ1blh5dzN2?=
	=?utf-8?B?NGZDUUZ0UWJEQXhMTlhncmE5SWxGbTB5MlMwQlFnMkRzaEVuSEY0UUJWdXFq?=
	=?utf-8?B?MC9DMkhNNERpcWhiTWpKK2JmbVYrMnR0NndJWkNqQTlqMFJpcG5OODg5cEYy?=
	=?utf-8?B?UC8ySVdlUXlBSjdlVEM2NGIxRVl3L2FXQmhXSENxdzZBSE1PYnpjbkhGdU1N?=
	=?utf-8?B?aVVwUW53RmlHZ2RjWjhWTnhsTXlORk13QzJsczc1aVdRUmpZRG9JZTY2R3RU?=
	=?utf-8?B?MXU5Um1RQW9ITDd4KzY0QVJodXAvV0JwQlBRVzd5N2FlMm5WQTRRSjhrT1lx?=
	=?utf-8?B?WE5oN1VxOC8vNjQzRFhCb2hrbG5QRXZhZkQ4T2dFZmFSZFVzUklPcTdLZ1dn?=
	=?utf-8?B?YVJCREFncHBSYVRVcjNXMForOFhYYWg0a1JDcVUwcHZJOGRYQWVIZWNrYzcx?=
	=?utf-8?B?Tm82RDdtMGhYd0sycHNheVVXV2xNOUJJK1JNN053RUhHd1k4NTB2WExVRjds?=
	=?utf-8?B?WDVnSzRHbkVtVVRxR3l4RDl1RjEyWmI1MDFpUFloZndPSEFDamlZR1l1dWJJ?=
	=?utf-8?B?ODQrS2pBamRVckZ1eTdBSFVoTnowZk9hQ1hIeVRyNHhlSkZhMzVVV2crUUps?=
	=?utf-8?B?elpZbzN3cG4wTmFiOC9WRGs0Q2ZtNEd0TERHbWp2cC9EdjI1Qm9TVzBob2xX?=
	=?utf-8?B?cW1tUXhobk5qRzZCL2tXOG9MVDB5SXl4TlRWZlRqTGlZWFRQTGNqT0NiU2d2?=
	=?utf-8?B?cUVwUHlaMW1KZFBRZU9KVGFBU3ZMT2U1ZkFQd01CN1JhYWp2a0V1OG9rVVgy?=
	=?utf-8?B?TjFkeFpTY0xpZUVhY3ZNVTc4cjhibDVkL3YvWVVSRGpib0doSWEvZzdNMlBo?=
	=?utf-8?B?WDVhNnFHblBFRzNZRlNwUXZEMTFrK1p5QXpjZVRQWGdKbG5sNjIrMWlkUEJE?=
	=?utf-8?B?d1BtOHk4dTNrTXRiaVNXdVJ5T3ZRRjVGNUpZYUFxZzlKdlpsb3o4NjB4ODNt?=
	=?utf-8?B?R0o3Y0MvTXBsTmluWTNsYVcwRnVWalp3MWs4MWpIenh2MktvbHNScFJzZ1dS?=
	=?utf-8?B?cFNnMHpPeCtHYWNJMnBvOGgxTmsxYUFOWTFJUDBPZi91S2JSNUMxRVRKOE1i?=
	=?utf-8?B?Zk5Ia2ZpWkRSYXQxUklEcVd1bFI0N0NGamk3ekNhdzdXMDlWTTJlU0FaMzhj?=
	=?utf-8?B?aFJqNm91SWdnczRmVnFTOS9xU0RXazYybXRKckxURlNhUXR2cUlKRGU0Njha?=
	=?utf-8?B?WG5KTHFtcjNzbmlBNTdoaDV4MWorQ0xHZW5KU3FicjlNRWkyN1I4QlN6bXE0?=
	=?utf-8?B?a2plTEpiUmZYd01tMWJ2c1ZoYTJYQlNZQVRDcDNTNEdXYkFYUzZDekJmc3Nz?=
	=?utf-8?B?cEtpVEYrb2xhdFFrSmI4K1JtVGN0bC81WnUxOG8wVkVmOEdtQnBlenMxZXBG?=
	=?utf-8?B?K3JSWFh3UkJjK1BlT09rRjcvN1UyK3dkb0RvN25yTW5NT09UZWY3bUprZFAv?=
	=?utf-8?B?MHllSE5zeVhxdmpRZVBlaEN6cEhYWFFnOGx2dVk3OFlGazZlOEVnWjQzQ1hl?=
	=?utf-8?B?a2M1ZmE4N283UUhKL1c0ODBxK0ROQlBnOUFpc2RxQ3VVRVdmWG8xTEFaTHg3?=
	=?utf-8?B?UG5mZXZJTTEvZlpCU21ORXJ3Z1FoZTRhZFdjaWU1V21iTUpKYVgrZXE3MzBN?=
	=?utf-8?B?d2lsYUM4aWZLYU5FWDh0cTNqWEhMOUNLTzFlRm05UHdrb292RUF5TmUvUFhv?=
	=?utf-8?B?V2lNZitvWU1zMWZBVlBZTzNaT2tpUitScEpLNlRTWVIrUlZhYkVDV0VJQ1Jt?=
	=?utf-8?B?V0doQUtmOXhrQlVmYldQZldveHhCaEdhYjVDVEJ6NVd5cDBhb1dxcHFQbUFZ?=
	=?utf-8?Q?X3Nxat?=
X-Microsoft-Antispam-Message-Info: 2IL57osjWXHCxTZIw6tyf/HW2zayhY/GyHtEa5fUWLOm9DUlCutAouwdZ7nrfT4iC0c5XqGSABZqCTg4OeS6EOcA21kfqd6bb9s4Js/IdiMIJU0yUGTpujCI2E8g7T16iLBVulucrPqNK+4POSAk3086ra2vIom2xJWNwt+LmNrfXDNmUqY/t+JlHs3W30q3
X-Microsoft-Exchange-Diagnostics: 1; AM4PR10MB0115;
	6:nTq6OPfmNGKfz2p+Y5bvmR7g4XwlHyWR61hzk554nglkNVxe2eJ3Xxy+vXIHeEhtDmwE13UP2yQoy0GjT+UpO3pUCcMQdgu/n4PCnd8gJ6SHRwa0y25eQfqRJogslAPjiZAeEN1taLNkqeYQ8zjnkNSHZjVakIgz2+7SreSjiLs7rFLlWOF7cFfvUccjbCk2OZkBKEnWzx9N7PHPQMeqdmSsOx5bX9OB4wzw+fBp9PLWpLY218JINU5fZPadLIELy5k71Ku5Lrz1RWaPv+TTXYXMJb19O5HzvsgTXshQjo8lmv1GRcJGHXQkQChrztVi1N3sDvApkKaR03tSQVS/pwInx6feyWr4uC4sxcI6Bng=;
	5:8yhDbkDsjBRgoBnImnEFsMuCugvLvzNOLc6OlbGP0vDZfgyfezL+IEs4uDRf6nYqGqHjBRMCm/i1mn+KbHYBanr6xvRscDhIH7hkxusQRFXw4lyPLPY1duSAmvT69gBQeJiNavHU++XUUE2KescHkumkwsyJb1wMvYxD+UI0EYg=;
	24:lje4Khdcl+hcms8jVDRQXVQZiZrHfaAioXFtd8c7lUVNeG1aeXxBlApbnH319NAfBd2ftVp83DwHIqWhp44t1QwnUGF1HIDl7/THWCskoJE=;
	7:zsXnD7EL8i/iIi0PMBOodfkJuDIBoJvAwE8jn+igYqwjOji+Vsiokt0RT22PLkSUoTRg6ijYYMlJklfhRE8A1YKIjnKkhyu3j61IXNqQr3IJB7jt1xEn84mPLx4ul534OeNmLkyvGlddU3RHn08g6VDUxLtCqETw5kBV3IwM8Ogzcx1Pu86Lrdi+MejKaklYzpdcnqW+lUroGNtnY0Q5R7oYwo9UxVVlHcfa6tvLCMkZo7IMkOxaCcU8uNsyWMF8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2018 07:25:50.8691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1879f0-20a6-41c4-8787-08d584c5d22b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR10MB0115
Subject: Re: [PATCH] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 07:57:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Vineeth,

On 2018-03-07 15:41, Vineeth Chowdary Karumanchi wrote:
> This patch deploys fitImage (linux.bin + dtb ).
> The use case is to have 2 partioned sd card, with
> FAT partition having bootloader + fitImage and
> ext4 partion having rootfs.
> 
> Signen-off-by: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
> ---
>   meta/classes/kernel-fitimage.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 50a91e1..25884d5 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -464,6 +464,10 @@ kernel_do_deploy_append() {
>                  linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
>                  linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
>                  install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
> +               fitimage_base_name="fitImage-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +               fitimage_symlink_name=fitImage-${MACHINE}
> +               install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${fitimage_base_name}.bin
> +

Isn't this already handled by the "linux_bin_base_name" variable just 
above (i.e. fitImahe-linux.bin-${MACHINE}). I have various fitimages, 
and as far as I recall, a non-initramfs fitimage is already deployed.

// Martin

