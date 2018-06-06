Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0055.outbound.protection.outlook.com [104.47.42.55])
	by mail.openembedded.org (Postfix) with ESMTP id 5E92B74BBC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yw2LKQM3xQ10YXNKFIXVI4sPShbi2VCQByfY/dJSnhs=;
	b=oZ7ZRLzXBJdNlWRI5+y+TvaoThikr26QhKwM3cQQ33lTE6EHIAzevwqCJCr1qHpkmiNLhpKau8fq9jS7vSvFt2CZbXtB5nn+Z6jMFTsFAecvfxQkAopJtTHuFfkh84KbofKo7j2IoNVoCA0lc2/4jJLbADbzIRGy3yGljjMLN2w=
Received: from [10.201.1.39] (65.122.179.226) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Wed, 6 Jun 2018 17:34:10 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180606152444.21911-1-JPEWhacker@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <44937c9c-f2ac-8945-2a32-c0da62bf1d00@xevo.com>
Date: Wed, 6 Jun 2018 10:34:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180606152444.21911-1-JPEWhacker@gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR14CA0052.namprd14.prod.outlook.com
	(2603:10b6:300:81::14) To DM5PR0102MB3416.prod.exchangelabs.com
	(2603:10b6:4:a0::17)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3416; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	3:zn2bvNhDT45pGCJKqqYp4+p4Bd4Ts6aZRjihJHQmwKuSZPkAW5F6XxkyyFOasNrY2OynU6QEqSx7MGccrurzizV+ROYn99EtcSIU2TT8I+C1gJqn6OHxMelChza/czv/Yw2tQJCUdngUDMF5I58b6Y4uPW2oDTy79KV6rdjpaB3D3odwVfWdQImy74OmpV0uhM/GVWsC4Ctc/UlrJSF5D6h5WDSSVrqWJiQzUk2eVNaVydHN8YlVf6xnN2bAcMuJ;
	25:/5EH6p1Kk5FQBwSFfurXJlBY+W23Vif2wA7/RQd5/p/kmS9PQenZisUoQnJMw6HoKveiqiM35nsbV6OQi7PjLObhzyaH5A+6pMhanas5NgiZ0j0HU1ig8qQwtbbGYQw2mu32r5ccQNJMk3MX8J6wIdA1hP959E+IGRjpPSxHeAYY/zNg/GKj0ICFGNmJKLkk6oXbhEUrzUIf9PO8TUmhWWyEt8h+pip7NxnBRUmtPM0tQ6lUjcfo4clDdyrmPuUVLf/Tegg6F6xPQTqINpZXdo4zJystE3OfX5bOCRjdRlQgVn8KPdtRzD8aaoV458fAC2svmqRrO8qT5v0Ht8XTsQ==;
	31:q9m1ND0WXKet/dbuGT5SONEYmx9uv3p8ihNyUtJxS5kM7IntMazbmf6G+cnNMlctEyqWNePj36/lYATFYMpTk93dcnlqDY18q+Wcqa/70JDE/U9FjgkobgX4s3QWSCFlq+v2OxGbCwzwyE+XMNt0E1fHrNwj/YLlOa4t7Mq7y8rRFmiHsg6j9S8fs0qiQuw/n6mX3ndORHqAuQaZQPEs/+8Gccl7x3RXaEQEQP8qFdE=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:QKgfdcxssall5QSK0Spn1Ws2zMdfZLcSMVepa+SCXctTE53AXc7wqvjvNf8sVALwiM7QAQc85jFSGNGPXFUYKjxJux5/M6sietQHHwX8oHGQVznDqgiC2UagxfWfYvb/A2f/dWTN3ECh+pqyiZ0jwAILtVdh2UfCHORmU9fonrjdSrgAkA1bkPbpKcMLqS0DNw+51QhF95HopKApdy7b+iNieJk4KWJ2Ih8kovHMMRwtRDuepONJitm7rZDI6yRsyI8CPW0siKquAJD4+yE3FSbHpGPHr11wJas5bAZwuHNxFGAcLnTrZz3cO64A6PpCzyvOLAH/ztkT3jQ7Uk8JASZzZP02uMRirUZAGqpg8Nxo3I2oeSFtD4IcgY5CFgqY6qfbm5aeptQRDMSwyfQ+i6YazPZWl50l5xRdangaj9g6amo/pStgnWC+B3sF9WdSb715NxsKkYUYpSAzyyFaqV6lg9YMGd3ba0i/xyf9ZpqKv1g7mZGzPBTUCKrBKniA;
	4:CBq4CTiSRZLS9/5fMJxH1DEYvDLhk1mM16nwMfkqCTK2Vtb1Yy1hWjspccngZtLufvwYAwyVu6CPLbNTU69/NORlWE6VjLqAwc0d3TYxkVA8rYIVxW3fYebP0bo5SQ/wkuNgBkNg7HcIeDJud6CsiuT9DmNEcSRXZT8rh3mlQbe+99lhXAH9o6AfqvtkgeJcqeTXTSIhVH6PghNRyyQ7d3Ye7M4SZgBO/QpJUsZ8CK2cjxkaJfJRn1sCEuuVq4QwQERO90IgsqKoHnOJOAa8Dvlp1G3Uqzyy2ezZuAigWCqfA04bZLFsWosWwFt+/epB
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3416DE3E4AEC8AC2DC12BDCCAB650@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 06952FC175
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(366004)(39380400002)(346002)(376002)(396003)(39850400004)(199004)(189003)(575784001)(81166006)(6486002)(65826007)(11346002)(53936002)(446003)(8936002)(97736004)(5660300001)(81156014)(39060400002)(50466002)(2616005)(16576012)(476003)(186003)(58126008)(956004)(486006)(47776003)(316002)(8676002)(26005)(16526019)(67846002)(53546011)(76176011)(3846002)(386003)(2906002)(6666003)(7736002)(65956001)(65806001)(31686004)(230700001)(77096007)(305945005)(68736007)(66066001)(6246003)(2486003)(106356001)(86362001)(23676004)(25786009)(478600001)(6116002)(52146003)(105586002)(36756003)(52116002)(229853002)(64126003)(31696002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416; H:[10.201.1.39];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDJNQjM0MTY7MjM6aS92enlTNDdBQlJtSFlSaTRhemRqLzlU?=
	=?utf-8?B?VjlYVUM4UjkwbFJwKzl2TUU5MHJ4MCswMzF3QzI5RXF4SkZMWWsvSTRwN2oz?=
	=?utf-8?B?dWZZUjNBVHFibHVreU92MlJHMGU0QVhRVXlHaUwwenBITkVDL0pGTkY3ODJE?=
	=?utf-8?B?ZWhFTjRmd1BKYUJINjVmZDlhcGY3blpHdzlPNktGTkRPaHowRFNXRDBCTUxG?=
	=?utf-8?B?ZUJOcEI1RFRFcXc4dmNMVXpzbndHTldxamZHZVBnOU9FUXZXNStnZ3Evb1Bj?=
	=?utf-8?B?cnZsb0pIdllTOUF6My9ydGE5cmN4ODA0WjZOTFBJdWVTL09pUjdoNm1WMXk0?=
	=?utf-8?B?dHNCdkFoZW1RQk5HcHZpYVFiYTg1M0o4VzA5c2pIeUFwRXZnN3RFSzlkNTJ2?=
	=?utf-8?B?SHdXOUdlZjRQUENBQy9WMHltalg4MFM0bmtlbHY2QnZybnZtRUJGcHowbENl?=
	=?utf-8?B?M1lwSFFGd1NVYnB2ZEdTVnBtSENuTFBwVzFZcVpGc2lxWkVLL2poZzgvRktF?=
	=?utf-8?B?djM2UVJlOGdWOEVPSVovZkpWdmc5dDkwU2xvSTB3NFQwM1hJN1BUTUQ1Qm9S?=
	=?utf-8?B?bTd1dmYyWWtBRzF2YmQweWpzbitPK3ZKbElHTzlWWkJiY09yS2tGdTFkWWRu?=
	=?utf-8?B?bndlZFoyRlRUK0xrNmwvNTRiMlJHbWg4MmZSc0hMNHVuQkdGNzZ2aU16WWNK?=
	=?utf-8?B?aG9TQ3V5ZjFnaUI1NFFvWjE0ekR4L1B6NmljUmxvMzE0bEhUZnFlcFZLQWor?=
	=?utf-8?B?LytWSm5URTRsM3I2c08wOTN2STN0YmVtMGhVd3lFTDRUV05vZVNISWdPT1Y5?=
	=?utf-8?B?cUE0SDY3WHVHaUhyakFFZEF3SVVjMmxDaGFuZmhnY1RaUjY5SHYrWGhhZ2c2?=
	=?utf-8?B?TWVmZ0JqT2puaVZLMlNBSUZDd3NvVmJEWXlKeGppWDVpUmxDVi8wSHVUUTJI?=
	=?utf-8?B?M0dsMFVWSDkxbnhHdUxkQlJSY1NJMkl4aFpIS3VMTXhzd0N5NDE1azFCWmZv?=
	=?utf-8?B?TUdtWTR6NjFWbzFBKzNXK3JpbEtEWCsweWtQdHdHeUQwZG8rd2VtMFUvWDJs?=
	=?utf-8?B?RkU0dFF2SDEzKytaMERCRmxKVHdYTHM5VjkzaWE4R2cydFhFcXR0QjMvZXBy?=
	=?utf-8?B?blQ4UXpUQkc1YThnT3ZnazBCdVdYTG1MTjhFeWNOUEF2ZmRjeU5VcGMzT1Ft?=
	=?utf-8?B?VVd6NjR3d0Q4aCs3eWV6Uk9raVFNbWZ2YUE4Z3FTV3BZVkFUUlk5TVp3c2Fh?=
	=?utf-8?B?UVF6QjdmUmV0cVE1eWdoeWozdDE4TUVlU2lUUVdwNys2aytVb2RxYkFuRDAv?=
	=?utf-8?B?ZjVQQ0lYN3k2anUwNGR3MVY1VWFBT3ZwaGEvQXh5Qml3RGl2cVNUNkpUUGQr?=
	=?utf-8?B?V3V4SGRZeXdYRFYvVnBWN3FGVndDR2V5SFJ0Y204bFExTFI4bm9IOGxiQlJG?=
	=?utf-8?B?aTNyM2JlanludlEvTndzSm5rYzNHbWxvK1lGVEs2ZTNnTkVBMkR6czFYTzZD?=
	=?utf-8?B?djMvZk1vMEpqLzhleXdNME51RXUwRHRGTWhIZm1IUXlnT2kyeXlmakg0bFU0?=
	=?utf-8?B?NFBYMm8waER3YjliQ1JWTE1LQTA3blg2ejFnMWgveWJ0TzIrRm9mQzdyejl1?=
	=?utf-8?B?emZuSEhjQW1idFR3QXFZczU2U2pzVTFYcEJsSHZnN2JvK2hKbVVqWVVVVEs1?=
	=?utf-8?B?YjYyZHptTWdzSzh1aG5ESDNoQlY4TzUvZFBhTVFoT29pRkM0RWtuWWpUeWdB?=
	=?utf-8?B?bWJGQVhNa3RYUmN0OXpwdWI2eW9oYnZnQklQMGJKUlpyVXFtbkk5RVZXdXRx?=
	=?utf-8?B?L3ArRHZQZnh5YzFBWUhjdGZ4K2wrZnplcERLVk44RVd5aEpLdGpncG0yeHd6?=
	=?utf-8?B?djNBZ3p1RXRHOTYrS05KaE1SeFhXZGtFQWtuSlVSSjNwMzd5R1VYYUU2RzB5?=
	=?utf-8?Q?z0icWBI4j3lm/wbxwp8jgVppR2mdgxcI=3D?=
X-Microsoft-Antispam-Message-Info: 3KYijBfaBBk3iE1o/arFh3ZNwkMvl6ia0E9h1IZ9FEN++vUrVOKSu7kKA6kPZ/2AGcRU8/3WJQpI3RUitnyPTUnSQdvLlyYuyRBkbNvgc0Y3Dh0RCBFo1llbwIumzD/yf+w8WmPvSoFMSw6oOCND9zc2DpwtfeZQGMHNn+y6+GYQVFiepJSwQ5mrP5BghwpL
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:6PVZnKtFZgwqE34pIV+7WbX1L4ry6C9y2zxZMeiBcvF+/Z/+M7Gnd0hmE5WT8KakJUrXuylV5z32haNM8XeSRfOYIkL0Uuc5SsobpoBQiZENG6U5OPsR7YccxYGBhBoJRMnAIHWAmVrG8y94Rf4C0u8UTFv6sfpgIE0G1+BSlnb+6Dfi5MdAEZDGt1jqFUg572Ux69l/nHi1B9/MW2X8HgosQMIwzKfGfdAJYwn23ORPHw+Xcbb7C5WLE+xvG0+vzVeofhJvMnyHR3LDS/KMm/p5chksQ30g1bv2ESQbMsMIuxAt4pT6rAyuvVkB1AaH4eawPybJV32ibn0ymCfCwxySbN0yT1bTz/ch560OTp/pmbvJ7yPIi5ynFw0g1ozY83uRTmW7pFtgXq1TMW0FDbj3Gtc2GCe99DA9/I7aF2HyyWAfMk9mrOiIhh4eSgJhf9Ws/vQ4Fi3SjtTClJeh4Q==;
	5:0vP3aGzaUpNTbju1HMkm+Dhg9r+oLs7w+8HQg5jdfWSQ0PQWnYafkYDWqk0gihSH7xYkb84cyIEXg84Z0x2QBAYzLg4KPWrBqCv6u5qXG10pkUJ0U0GtYYJSxSLwnLn5GQmuRyaKMCjJb7FV6DpcweR1YxfWjBR4oxAHMw5EITw=;
	24:9WPK2ut3MW3D1sJfjvUVSdyVOcOl3O4dJ/Ik0tD5YcpwjqpIIW6oSbw1kJ/eT+q9wR9ynvDq6rvrb/wk/RbFBAXMDU6sbWlbOs5xYSFPL4Y=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:qCLnKZhWZncO5ANZfwW/MbvkejseoNp0iYKNEM++flwX2nOD+2MuyG2xoAHNfmF9rAjfVCIKhpwoZltH5sRHxzuZY3bG16GLhOF89WsN044WveK/IZwDBzu4bkp9LJbs08k08IwYYV0s3AA4eueei3QK+KGhfsWQGmK7n1pFpO+DoGLhh6S1Ha+UPutZJ8cxdCZb7K/u0IxPAVBMC0j9Bi7jbkiuHK2osGfv1lDhlnoMnVFh6PIoFOoNz+oEBm96
X-MS-Office365-Filtering-Correlation-Id: 6a3c2aca-184f-471e-07b1-08d5cbd3b70d
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2018 17:34:10.9843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3c2aca-184f-471e-07b1-08d5cbd3b70d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Subject: Re: [PATCH] icecc-toolchain: Remove environment setup
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
X-List-Received-Date: Wed, 06 Jun 2018 17:34:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/06/2018 08:24 AM, Joshua Watt wrote:
> The handling of the environment setup was moved to the post-relocate
> script handler, and so is no longer necessary in the setup script
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   .../icecc-toolchain/icecc-toolchain/icecc-setup.sh           | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
> index 04808265781..25250b7c0e2 100644
> --- a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
> +++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
> @@ -20,11 +20,6 @@
>   # SOFTWARE.
>   #
>   
> -# Setup environment
> -for env_setup_script in `ls $1/environment-setup-*`; do
> -	. $env_setup_script
> -done
> -
>   # ICECC_PATH will have been found icecc-env.sh
>   if [ -z "$ICECC_PATH" ]; then
>       exit 0
> 

Reviewed-by: Martin Kelly <mkelly@xevo.com>

