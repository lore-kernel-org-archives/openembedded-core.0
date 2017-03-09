Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0079.outbound.protection.outlook.com [104.47.32.79])
	by mail.openembedded.org (Postfix) with ESMTP id EFB566E650
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MJ6pcVCnH3veQZZhPd7J4wGEXPskIIn2432ffe+vj1o=;
	b=3CmgUBVIKe/ZC03wqQDSgu418/ThxX3finnuEn5pgIsPmnLTCenslH68fJowbPjw8t5X63uK12rjQbDLb5SN0dmNQz0Y4G2VphV6wXTLUNSoxdu0ff9TN72WdKkAmDUSxpH7U2CYdAiTlCAQTr4hgP4YjrX+2nSJavAAGPZYLhk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Thu, 9 Mar 2017 21:37:49 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <7f8eeb62-a767-0882-dcc0-9a6882192d82@xevo.com>
	<CAMKF1sqAw-rwkKYuEsY4QN1rA-YyQcx5hjpzux3cLk+4qxAemA@mail.gmail.com>
	<CAMKF1spRq0quE-B+T5Wio_z5FmfGNkeGrE=dcd3H-KT1KNP4HQ@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <93a813bd-0faa-0585-9f6e-7a49d1282616@xevo.com>
Date: Thu, 9 Mar 2017 13:32:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spRq0quE-B+T5Wio_z5FmfGNkeGrE=dcd3H-KT1KNP4HQ@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: CY4PR09CA0092.namprd09.prod.outlook.com (10.172.133.158) To
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28)
X-MS-Office365-Filtering-Correlation-Id: 23713893-9a9b-4f07-881c-08d4673488c2
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY1PR01MB1406;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	3:WZOQ8VwtHNkYlqX55xbEVyACb2Je3z0ejhj31v4fbz/5bZb1BHbd8bscyZsTGFJ2obQMWyVaOVu92amORJPklAjbwm9Jy0nkiRvq5yrOiA7NNy8oQ0PftuPGPHuFK6i+9MGowo5YnfDw4jR4h5SzVECu9/t7WIE5Nzqig2iVp4IKmvbZGp2mmSMihxQwbyim56IYETIzaEnIl2Oi7FqJxkqiHpc43jMxs8gqa0PoqQbXCsZrLO5QMKUnBGB1MigZl9yEh3EUju4fiRJKoLDS8Q==;
	25:D5aqqSExHxIIkETqygZ8JKeUl53NzEb4bd51s+1nrVggqKIS9VIMz1nScNnB52jXsWq/eXPKXmIbSDFZOfC0aXU8a6iLxF6C8S7/OcWy4LVaj4OzNYj+EnARvAd7+Ee3ZEi/TzoRpNJG4ARg8NXHHTdxZwFjUf/HHfgip3ote2UCEYXRTXZ+Y/4Z0iMK6eZRHoX2gAADh/AYtNrBTP7Es7UhWljv8JnK1qCoS/WJNyx7PpNTXcFpa1RnW+/guKNPBl5OEgz/W4/2o5hp3eRlU3k+RvZJXhe1cMRlvgEcSWsAuCskHbQdwh7HLz/kCtwD9w30BT5wHhh4MzVpbtDj3LX7c/PM7A7IJkSGBICbB2ZXz3oDhuXwCB+nTmoPN6Wpem1dbt7Jak9zMCBVjGHwoumCbCHG2FdYQDm7OdSUgwb35fxtdfKu1lFqJ37NCce5m/URivqQ6wV4EsCI6kml4g==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	31:bHazL8e8VCE4kEIMZD66WOOtPpua6LSUab4V2BZekiOEVYIDr5VJpEQb7dOiB3wI+Ym/R02Q/L9nFS1Yb5mzPSBk87cOuoKqIBBwcwpNaPjjJwyEcjORQVgyJ0HH7wyAyz/R/zfNU6BKHGIzckaHL5ZrO4R7eoJWdpoydyoKvTXNlBdYLml6z/Lsi4BNVpvg6gkAjyLP77Fe4HS4/sGb3tpFD6BAS6u9oWI9wTtrGUP7Jh3NIDBWffQlmKYya2JF;
	20:FlVa1b84grS0GDjUGKGH+sws5J3XVjUs1Eh8u7iGWQHPV6g/tgGlwrXAe8Ey7S7i3zefH2kPLmZGvM2q9mvWRhFzyNennlap1zd03eNekA+WbuQ4aG0kTrSbkyXyO8MiYJHJ9D/7EaihryT+jogkIGyjME+Hvtqc5s2HPGfeqyoJ9CpefOsHmZa32TB9pdjNq6YDllhLt2ofNOZE1rCMGvU8zOuhVCU1S9R6cOh6wIuGkJoNJK3HEWz76hAjfRQ5B1nButCm5Sdp/97L00Uw5orYI6ynk7fFOC8q6uew7j3tFu2C3g9DDH+JzO6/9JamgnlTyH4T8iVxzOELZvtaHQ==
X-Microsoft-Antispam-PRVS: <CY1PR01MB14066F6A7C8316FB0295FB04AB210@CY1PR01MB1406.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123562025)(20161123560025)(20161123564025)(20161123558025)(20161123555025)(6072148);
	SRVR:CY1PR01MB1406; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	4:71c58hlZoP2t1WEInDTqLVli012gyueV1Q2783AcDEdkB1hVJOAepRfaYi2SaLh/RnWyzt9AFK+wrPZ/AzqzU6kHpJ9WAyqOyqdYZEyo1V5fKCYVIG1VL2eCiIOfbbrNWnHdpuyWGMUWMSEBSuy9FMmtgoMM5GJyIkRUKMsXnkhBz8iLRARogeAeKkrfPmVYOgBypTUNbJMHHUVYjGDtZ/c2Ax5pm9vqwoGHn9s1tqCegscA1ogHQDoeIDbtBpx+9dKLD9Ts9TLwxFKg8lYD1WXcKrZSoG2arD6nI6AxEYrpZCkbY6GuRJOO9n4yUr6BlS5972QboqKf7iO/bfrIzJx0dNDxmZsGrjIW4YUnDPv6R6pOm9gnT+tFZGoKXBnjix/LUW4sZ4egei71a7dehYlswUkuxcjQzhXfSVM7u/35fT/eOBdFZbq1aQvzbRGKYANe0HWUESAG3URxHUMww5DHD9NjaS7/YJhvj/KdYqFFE7fdvr6ELvAvax7RPvJ+JxrGTqBobBBPsRvKmXdBCuS/+BU46Ls3PyqtSox7dCu6pWdoT2dl3lIGUkWhxZScVH7IC5MOmrS6AwYaHflv+w==
X-Forefront-PRVS: 0241D5F98C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39450400003)(377454003)(24454002)(5660300001)(4326008)(8676002)(50466002)(6246003)(81166006)(50986999)(64126003)(2906002)(53546006)(33646002)(83506001)(38730400002)(110136004)(305945005)(77096006)(6486002)(7736002)(25786008)(2950100002)(229853002)(6916009)(6666003)(90366009)(230700001)(36756003)(53936002)(31696002)(117156001)(3846002)(6116002)(76176999)(54356999)(66066001)(189998001)(4001350100001)(31686004)(86362001)(42186005)(23676002)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1406; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA2OzIzOjhuZnREMFM0Yk9QQ09TN3J2SjhtcVZZbmp1?=
	=?utf-8?B?OUhTamgwVEd1elIrb0xwck5RbnZVVGh4OFo2RmE1VlBGRGE0dkZsam51VWRk?=
	=?utf-8?B?L28xNWtYSmt1aWJyUDUvMWxmR3dLVmZqdngwTlBRR25OVnE4Z2p1ZEZEb1A4?=
	=?utf-8?B?OHY1cjFPc1ZPRDZoYzROM2o1MGE2VnRQSkVaMjdUMnVNK0ZFbnh3MFpKOW9Y?=
	=?utf-8?B?akpuWGFDR2wxYWc1SWRMNXV3VkI0bXJXY01pZ2k2dXQ3eElrR09aRGhtRmRl?=
	=?utf-8?B?U1d1ZnN2dnh0bHlHeGlIdnR6dCsxbnp0ejZoa2piYmFndGF4amEzYTg3a0JU?=
	=?utf-8?B?cjRRaVR0ejN0QUpXb24rcjlLY0o4MGNvTGdjVk1zeCttTkphM2FPSmw1YmU4?=
	=?utf-8?B?dEZGcE1JSWQ2a2p2TElmK3lyZk9mMmRvd2dzY0tHazIzTzlvOVF4Y2ZxVHEx?=
	=?utf-8?B?SmFSTjRtb21FbUh3N3BWNUlGcXQxSzhJQzlaMi9LaGd2OHF1aFh5TVhwVS9o?=
	=?utf-8?B?MjJHUG5qVlFWNUYxYjR3Z0QxcHE5NnJFcTA5RFRpM1BSSnVWMGhtUUVGbnVh?=
	=?utf-8?B?Y1FDbEREMVF4eDE0UWtRa0NNRUNpRTMrWGk5YmkzZldqKzlFZXJIbVVWcS9V?=
	=?utf-8?B?azUvRm9EUEhZSzVxQXI3V0w4ZysxdVkrNTl5eGhMUGFnZ2d5c2F0djFhdm84?=
	=?utf-8?B?L1pZajdKUy9QNlgxMlBNSWVhMDBuV0pramFTR0dFOTJuczc5bnhIUDU2aDJ6?=
	=?utf-8?B?cndFcVkya1NxQ3kyemthNGZDSitFdlI5dm45UFFXRThEVkZvWTgyK0htRUZp?=
	=?utf-8?B?a2tZUFJiMGtUR3BZcHFjOVVGc3grc2ttQ0ZhWUxsYWZoc3FscmUwZHkxQ0Zu?=
	=?utf-8?B?Y09QSmhFeXNIY2l0Ly9hL1dIbWZXb2FQY1hCZVFGdFpITHB0N1pLWW9aR2l5?=
	=?utf-8?B?eVhNNDQ4SHF6N1J0c05PTmZDWnRpS1MxL0JMUVhJOTBuVk5NaUh0N3FRenpx?=
	=?utf-8?B?QkdrQ2wweDRIY3dQVTN5bVNCOTcxVkFaemZ6dUdwVE5nZGp0Rk1WdVQ4bzhW?=
	=?utf-8?B?bXpaZTFWUktIN0RXb1RuR2pYRzVwSlZwUzMyU0lzcDYwN0hXN0xOWlMzVVpJ?=
	=?utf-8?B?R1Z6NlJ4WUllQUdhMXVGWUJWRkE5QUV6bWRYRlBXbnhpT21OQW1EekdDWVY3?=
	=?utf-8?B?KzB5ajdteUxuS1BYZ29DYUZ3N2JKQTFIZ0NsVXFYMkpMd2IxVlh1amI3SzZV?=
	=?utf-8?B?UDEzTXliOUt0VS84bGN1WGNBdUJmUnBoc3RCWmRTNytaYld0QVVVME9nandk?=
	=?utf-8?B?eUJna0lDUFNUMmJCY2RoZ3Q4OUpCQTQxUU00eXk2STRNTDViSnpkdXJxeEdm?=
	=?utf-8?B?YlZHclE4MGJ0WXE4WkxNVEVacDA1YXVlczUvaVNjaDJmU1ZNa29oV1Vuakty?=
	=?utf-8?B?c1JWRzVHNkxlN3BCNTIzYTJ0TjdXWjlaNVJkNWEwenA5TUdQYkwrdlFFUEJ5?=
	=?utf-8?B?dURENlJ1SWVDV2tDczRBWXF1ZDczdmlGWVg5SzBxYzI3dGFrRWVzRTBjeUlT?=
	=?utf-8?B?K0ZrdWU2KzJldTBINkM3bGtqVjFuNGc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	6:tiAUJWTwkfc5bVyDbR/Usse9hI/5TlPeRMBfXhLunKSHyOiFGdetF5nyr6goyURtaZDKJ0DEQRoOX6d7HmrYLoVKjjzPnZnRuw4nEHXURvFYbAI4ZID+c7ygZ44IRpvHjR7UqwBlFXqgKOiaJ8MJCW83okkzNug5ADMO0KWtBLNZhrWQyyIsQLDvR9hmP82hA+FWI8WReuRZDdTLfXpQ3YLt8c/Ox5d25BaO5uwN+Nbz115gsqRaqCqRu4iH0er35+kt83LPacIaMDc6t7050hX9B1gf7OqaS/zJAr4JSaaCSSkWD+5pvOIbXLK3JebBa+rF5hToX7UJnyQN5QEpNeyiVGFT9vw2IlgiplBMJussJ4M8uwIZBAfhfUrf0toZaqybr8/5B1OxgFjOTRq9cA==;
	5:0hW86Kmb6x6YDbt9jCR7uZb87Wqb9kV+cCVwjmR40Rc8Ud/fT1Qu2x8iABJ4aWOTdhdtRvQS5khNGRIv07ilS3IPfSJQirxcaVCc3W4SrPa3Cav7/Vb9MYS3YaYIsdXKfveD8AO0k8ue0gDTYXB80odeaUOrAIAv03BX8QtIwUM=;
	24:eu+6xZqBg6RqH96XoeVdjk9wZ3iESySSCd4MmTuLD0lDrpV2a69x35uN8VW7MhIcxk5rV/B1z79MH8DwFwKOeT9OuPTCJP0+8Lb1bqxMKAc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	7:YwdlMXyVMLH+P+au2YJzKB/DzYO7FIMHI+d3CSbINhHhrr687zj9Quf5ts40DaRxYJKzxogD3IL095mmglHFfNi+OQJvZkMm1NkP78gfLZePCBITcQ4M4G/H+Po+11SxrkhIur/wTE6MAR6rckqmhhZOfoZs5l99RaopWTc/enF+z/L/1NK8AsxUgfmQ3PkI6ufD4/bwUGhD+UgfcKrTQCRg7yu9n0+DToFSMue+Df0XreRRqvctTyVIu31CR7JRIPms3AbD/BpsQEPnUhUQhmC2s4HwPJbfChBqXyxQEVfP6qjXAX5XGsCm/bIBOax0ZumwGL3zj2HWI/NSzMwQ1w==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2017 21:37:49.3524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1406
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] LLVM shared library support
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
X-List-Received-Date: Thu, 09 Mar 2017 21:52:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2017 01:06 PM, Khem Raj wrote:
> On Fri, Mar 3, 2017 at 12:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> meta-clang has only provided static compiler thus far, so using shared
>> or static did not matter as much in fact it could be helping with
>> faster compile
>> times that we see with clang. However, there is no binding to keep it static
>> link. Feel free to send a pull request to change it.
>
> I did try this and I see a considerable slowdown in compiler speed. I changed
> two things at a time so may be its the other
>
> diff --git a/recipes-devtools/clang/clang_git.bb
> b/recipes-devtools/clang/clang_git.bb
> index 6c6e66a..7de2be1 100644
> --- a/recipes-devtools/clang/clang_git.bb
> +++ b/recipes-devtools/clang/clang_git.bb
> @@ -73,7 +73,8 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
>                 -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
>  "
>  EXTRA_OECMAKE_append_class-target = "\
> -               -DLLVM_ENABLE_PIC=False \
> +               -DBUILD_SHARED_LIBS=ON \
> +               -DLLVM_ENABLE_PIC=ON \
>                 -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
>                 -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
>                 -DLLVM_TARGETS_TO_BUILD=${@get_clang_target_arch(bb, d)} \
>
>>

Those are the exact changes I have been testing with; 
-DLLVM_ENABLE_PIC=ON is certainly necessary to prevent QA errors 
regarding text relocation, so you can't really make the changes in 
isolation. That said, the change is still very useful, as there are some 
programs that use only shared libLLVM.so, and without them you can't 
really use them with bitbake.

I hope to have a pull request for you soon once I iron out the rest of 
the issues.

