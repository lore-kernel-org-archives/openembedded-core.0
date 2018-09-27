Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 54109 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Sep 2018 10:04:44 UTC
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00135.outbound.protection.outlook.com [40.107.0.135])
	by mail.openembedded.org (Postfix) with ESMTP id 64F8E798BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=A8qxsHf5bfopyqo2HKprjx1LWcTBBgqWugyoz4uR0j0=;
	b=vfLmYe31Yp9Qyf2RinpITvNj6yQka5Ulk9B5jC28JmMOeYlOa6FqUP0DFx5X0Uva3rFLBsk67gBF7rNN5bBYUPx/R2Ulzm1wfXkbr0dbLrifVjkB6TBobiM5iHpGMbi6AFxPe5XZdpjZ4Ya2DcoHThFpJYX7B5sZ/qKDeNrpnt4=
Received: from [10.230.70.56] (213.126.8.10) by
	HE1PR0702MB3643.eurprd07.prod.outlook.com (2603:10a6:7:8c::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1207.8; Thu, 27 Sep 2018 12:30:14 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1537806578-16616-1-git-send-email-jhofstee@victronenergy.com>
	<d92bbf72bd1855ffa5fedfedcac3c5b8be94b836.camel@linuxfoundation.org>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
Message-ID: <896b0e18-07ea-8e6c-4386-fd56671a200f@victronenergy.com>
Date: Thu, 27 Sep 2018 14:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d92bbf72bd1855ffa5fedfedcac3c5b8be94b836.camel@linuxfoundation.org>
X-Originating-IP: [213.126.8.10]
X-ClientProxiedBy: LNXP265CA0042.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:5c::30) To HE1PR0702MB3643.eurprd07.prod.outlook.com
	(2603:10a6:7:8c::29)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b1c03f9-448b-4647-4612-08d62474f9c9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0702MB3643; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3643;
	3:LaK9cUjpt1YNZImGCdotVnQlysu8DKx/fr+ENkXlcXRJScZGf1gIbeB72UZmwcnXsFFIYioVZ66jpINVFnZLX9JP83Jroi5jYe1yuPUNaIrgJ5wkibMtI0nvI2CBPe4Ydtc6oLBSefmy3HehU9JcQcgyWluXsg91/tKFvLAu4yLy0WOiQWWZfb/XjOhXs61A56j1gKaQOqo07Dz2D5H+FNpWzU+HVOD0UITt2hoLNg+fbqYbM3UovlHS2sNDtshS;
	25:aUr2BD/GqK5X51qh7fibzVRVMUWrSUm+jF6GpHFdn8l5fYqiPUqP0unGlVVnFFHJoZ4kFTQQX3z1pIV+6XWurENT6OrkMXQQYjcMIP0zlL6dzvkY/xk1hPV3b6jwnXJsi9KYewYJYjmxemk4JuHrO15MqBEQD9yoL6lVk7BkMDhFhVwAbTIXxvPfGOw2C6SNI3T7tNgoUdWDWKnXTW4/CBi4ysNkgAwIrZduk73nskZwe8b0MKSadQzq8GSOqnsVOc+GeBMEcZjfT4hWxBABOeM06wA5WejZvDKS7vSBECVNkwGRPETuyj6RVAXvDwqw/2tYVbdqlsG79YJrzcSIxw==;
	31:14oLPOI9W9nHCRH42ddlO6UcNlQgDKPFaQwuA5GwabpwdpAssHofthy5Cw/jgEK67xB86uo62e5L4Gb7agMsxlQvQxmWFR2S8M7idLgu42XbIfFTCgU8FPYw7GKVb5/9JzNXhfZupJEIx/7iA5e2kzKf8uuNGU1utDrTybGjVs98tqgUg3nKeQENrTBXSN8aHkjYSRFaIIZX33PzZGEFPFJVsnAKa/vkRVaOLLCA5uE=
X-MS-TrafficTypeDiagnostic: HE1PR0702MB3643:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3643;
	20:PaxWwDwpCVysqEdK39e+jK5GDrxmhvzz6ickbNADBqmo5Kwn8K2dLejukOqMQ+Gi0b5mjR1UHuGN/+PKJOYqsRwCqyAKSmxohKuVedJ1rtD9ECku99nvn0AS1uDBdr2CBy8SRXhYX/3wtMS8k9wIAL+DCb0hnWlv6x4IYOYqO39sIsDYf47JJD6H/CJR7QMqzsq3TigdsckP0dQPSoK+hLX2qtTRXN5nX6w7+E8EjZyvqMpzVjct131Sk10BAO2I;
	4:T0gTmlRJNlu+bGOpo0VMMj2hHcEMb18ESQwnVd298Pkk26XfInOCcO3oU9IpxTvvFboprguSU3RCO3W8wt0XN/QoHCdmCM3mp9492qebo1r/HHKz07FZkxAbwStUtHNDJ1OwF72x6yz3iO1fTDfSmEgQMnNoTZTX5fp8WxyouUNkv44W21FYQyqBsg2nxShTBQ0Rc19CUK2Q/t7Qtej1vspY/jwrzNeALwIyKil8qZeNOo6j3iQTuZH7TppMevlXBm9soZhYi8pAsEsLRLP1KKFXuCZD1tGz0kDzyOzgux0QrQOlxgL/VEJ/7Qen0ATs
X-Microsoft-Antispam-PRVS: <HE1PR0702MB364370C0ADE648B247B188FFC0140@HE1PR0702MB3643.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(22074186197030);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991041);
	SRVR:HE1PR0702MB3643; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0702MB3643; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(366004)(136003)(396003)(346002)(39850400004)(376002)(199004)(189003)(14444005)(65956001)(53546011)(478600001)(3846002)(66066001)(6116002)(67846002)(68736007)(229853002)(305945005)(6486002)(47776003)(64126003)(6666003)(76176011)(2906002)(446003)(476003)(65806001)(486006)(23676004)(52146003)(2486003)(956004)(2616005)(52116002)(50466002)(11346002)(386003)(2870700001)(97736004)(6246003)(86362001)(31686004)(81156014)(81166006)(8936002)(25786009)(105586002)(34290500001)(16576012)(58126008)(65826007)(6306002)(966005)(106356001)(5660300001)(53936002)(316002)(31696002)(16526019)(6346003)(36756003)(77096007)(8676002)(186003)(7736002)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0702MB3643; H:[10.230.70.56];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjA3MDJNQjM2NDM7MjM6SFJnbFkySWR0Rm9CMzZKTGY2SklDNHJE?=
	=?utf-8?B?K1BWWkk5bDk4aHpkc2kzR2s0b1U5SHErT2xpdUYrc3lza2FXODBDbFdnTjhQ?=
	=?utf-8?B?UHJDbEV5MEhrSzBNeDRjRWFoTnJRWG9qTFZLblFKeUpId0l2MFBpTzg1Sitv?=
	=?utf-8?B?SGtxU1hjb05EZHRnRWgwQ1RZUmN1MkJ3QkV1SERZL05TVTJEUTBCMUY2aHhJ?=
	=?utf-8?B?blJRdWtoUXd6b3U5dUJpNmFmcnFBekNjVUxOb2EzcXd0VVFWcGhuektKSzhj?=
	=?utf-8?B?UytNaW9mL0E2eG9TZTNIRE53bnBsVmNxOTNKTW1xNytQa0hHcGh4ME45Zytv?=
	=?utf-8?B?WGdnM1dBTyt2S0srOVowK0pTM2dFZkNWVGxhbE14c2NBenB2UmVyNmlvKzB4?=
	=?utf-8?B?V0RWN0dzWmE1M2ZBZElseWoxSmRpeVY2R2RsTHU4eHpBZ3dxWHc5bUdCQjdM?=
	=?utf-8?B?QU82V1A3MFFBR2QyaWtIbVcyVWdNUTlaZ0hPckVud1hEVy9pQU51b25LTXBU?=
	=?utf-8?B?Ty9KMldqU055OVV2ZzZSSmxoVytua0VSZlE4THRZY0FqUzdOaFpCamFnME1x?=
	=?utf-8?B?QlNMZ0t6RjVFS2dlckFON0tuMjUyaEErWlpRSDR2aUkzeDM0L0E2YnMwbzJx?=
	=?utf-8?B?bXZJdkcvUjlOaHFqYW1vRkVHeWJXeU1Oc0hTKzFXeUVFWW5pd3RaY3pUWlFR?=
	=?utf-8?B?MG5wVTQydld4Rms1dlREemJtdVhleTVFRDBpeWpuU0RlZ1gzL1BZRXdVVUUv?=
	=?utf-8?B?eS9jSHQ5QzB0djdWK2duQzlzM21OQzlwTi9hY095cy9FdWNmQ3ZEV0t0emRr?=
	=?utf-8?B?N0RnKzcyTnpNQnIwSy9jVlZuSDNrbWU1VlFTbEwwN2F1WHdKNVdITHUrenJX?=
	=?utf-8?B?MDZUUU1oWDRzMld6bVhSWkdnbnE5aGE1KzhCNExlcnJJdDBJanBKdTVHeXhW?=
	=?utf-8?B?djVERWJLaHc5QmJtMGQxa2ozQmRROVJtaWJSb2NxcFVudFl6cTdoS05PbEhr?=
	=?utf-8?B?ck9MY1JTN2MyRnIvQTFyNzVXQ2x2VUdDd282YkxPQkswS0ZFWVRkMUU2dHhQ?=
	=?utf-8?B?dkR2T25naXh0c0tkS2NBdlBrdnlCVFpFRnRzUmtVRXlMb0ZxNmlEaTRZbXh4?=
	=?utf-8?B?cVlrOFlBQlR5UzFFeW51WVlDcDQxNytiSUxYSEhCYXZZSW5KZExBeWNxZldm?=
	=?utf-8?B?M3h6OFZ0SVBnUmpuVWxaNnNxbHFEeUFHK2o4clp1NGtLRnZmd2ZxbnJtTkcw?=
	=?utf-8?B?b1c0M3lDbzdOcDFxbUR2SkgxNEVCZGpaOXZHYjY2cS9wTnRZRzJuaFRxdENC?=
	=?utf-8?B?dWJENU5UNU15TzJ1VjVqeVNYdXUwSXZnYmU4ZkFnNy9iQ05WUUJQWXgreFFx?=
	=?utf-8?B?ZGZnaHd0dVkrSU5JSEJ6dXliNkoxa2V2MkZmUGpJWWxQditSSzAxVGtRQ3Zn?=
	=?utf-8?B?RTFoNmUzeEhHQjZTeWM4R1VDSTRSTjRTYVpqR0d3ekNPcE8vL1kwSFJpQ05a?=
	=?utf-8?B?SGYxZG5CS0tQQ2wyQ2cvSnJvbEZSUTZXdW1KY2VNMHFEa3o0dnh0eHlaWERk?=
	=?utf-8?B?N05zdU4yc1B2L1dWOFNYWU9HcWRiVmtRRENaQmk1QjJtek5uT3poWHM1R2JY?=
	=?utf-8?B?YStVN1ZMb1VCdGZrOXRmTzBzdXRiUUtEdGdpQVNRdmZTcllqaW5sZVlvTDUy?=
	=?utf-8?B?TUpkSWlEcUZoZ0ZTV2t3NDNsUEgwVmRjUVNueDRURVRDU3A4Mzl4VFZPWmlB?=
	=?utf-8?B?UWZwVXgwcWgzS0w3eGRZeEExQ0UxK29JcnpPN28xQi8zUm9MNjk2K2lwek1K?=
	=?utf-8?B?bCsxaExucTcwcWVBaWhXdFFVdGx6UEFDa3d3QXptL3lQV2puVFkxSUxya3lz?=
	=?utf-8?B?S2FVdjJpMFlJN2RzcFBXSmR0NVVGZXphdS9PMW9RS3pPai9kbXVHYVZ2Zkli?=
	=?utf-8?B?bWNleFV3Mm9xeHdQaDBaRktHdmNSNFpNSHN2NFpJcEdQVG9WMlRjbFE4NmZj?=
	=?utf-8?B?Q1ozYWZKc245Mys3enNYYUtYWXZpNUFpYW5GNWZnPT0=?=
X-Microsoft-Antispam-Message-Info: b3XUtboFds7bGz+l5POIBJVB86EfyaFZaYbMlRseRIGMjB3x4YotHAH/MvIh3JqI3NZYaLIA48fWe4DLneH1MH2VUflTb7wG++L5TjsFXGbZ4WkSDB/6OUvOHYqImt9+q16fCUeWweLUVH0wKAdD7sah09YqjP62dSQrC8uRgzStEBkydf1CSGeyVtSnmRrem9CYOqMnCZslgDPkVJKdclR8zwzpUGYeFAE88mVOutP58ONLF7B7xLTW5lWbIy/Dw9ptSy+0veVtPTni7f/seBWY49jYJ+RUCRJNMGouf9FDrCFTjS+atFRqkZxKPLqnCQERqogPr8LCZnr4/i0ZpNjY5vJaILhydo2JJgatNJI=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3643;
	6:N5DQxBAKtwMXyWbMqzY5NOAPdzwkrLHXUC2Atw6a5sUwke7DTGo5e97jr0tc5PPJS0060khswmZreBK+lKRjOFrYLGPgJynucFLLWNx7kpbZHAEt9lVBxG2zJPUCwWWu9uHj99lf6o4WMDX4UFU2Z/QCTRL1opXZ+f8egRB/xNGAbETwEfvAUMpbJaPnh01r7YqWBfvX/rBVwYTchNvO9SLIPcfm9YibbjC2xcNmXKJDePe7r/p6YhHTIIOMjYr+MZkCuMsjq4OXZfB4qnN/GMZ7RYjdhM1k7C0CrC61Oy1TXNUzKRTHRDlFtW2j7Oz3kdEO1EiBKsOPV9tCWxOAoDZQ/uNIINUvg6X4dv+SPHK4vZJhrpsew08oNVY3H/voP31XsSmKDnI1pLIfbLEDbue60w4C/QHKDeXqhx/l/c/JOIbPNtfB4cjmL3j99NzAf9bjqKi5G+xVRSw5kIcgwA==;
	5:DSNEPfodl2gTqxvpiu0pqn5dPniHmwix1g2YsgCkYLWO12qAFr/679n/Pbcm/EM76XLKLifSTVIlWqZynHdi/DafNx5sh99kwGpOiUe4TVv55VbLk2YgfHI6cvwg04N+D7RZBEjiwryR282Bw0PK8LdkfEOmukM7jph4xYYpDxg=;
	7:susv/bzuV8GL/JU+VIqijwT5Z3MOjdBntv6PPUIKe8BtjRzJMAQxWVg8/q5j09IZt9n+oHFjONORPp78j2qwjYlz/KL3XylU1uuLuOyyx7v66OOtl1nwFcM55BQPt5MNImPGQXUvfc5pENSdTUQjH7Q5IDmKOhkTnm2YN3gBCtYjP+x6XaN1mFAZ2DMSCYPFXKuHy0W9OPtBn0Gz4THzoLZ6nNnknUppDtBlIrnV4ppMkJNf/YHyOugTZaBEVVXz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2018 12:30:14.2645 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1c03f9-448b-4647-4612-08d62474f9c9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0702MB3643
Subject: Re: [PATCH v2] bash: 4.4.18 -> 4.4.23
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
X-List-Received-Date: Fri, 28 Sep 2018 10:04:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello Richard,

On 09/27/2018 01:05 AM, Richard Purdie wrote:
> On Mon, 2018-09-24 at 18:29 +0200, Jeroen Hofstee wrote:
>> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
>> ---
>> v2: add patch subject prefix
>> ---
>>   meta/recipes-extended/bash/bash_4.4.18.bb | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
> I saw a question about why this hasn't merged yet. The reason is quite
> simple, we're past feature freeze and we need a good reason to take
> general upgrades.
>
> There is nothing in this commit message which gives any idea how
> important the issues between .18 and .23 are, therefore its duly being
> ignored until 2.7.
>
> If there is a good reason we should break general policy, it needs to
> be in the commit message.
>
>

The issue we were having is that the bash in rocko can lead to a
indefinitely spinning process and a zombie by a simple $()
statement in a long running script. patch20 [1] fixes that.

I don't know about the others, I included them since it are official
bash bug fixes.

Regards,
Jeroen

[1]  https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-020

