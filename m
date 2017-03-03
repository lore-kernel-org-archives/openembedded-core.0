Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 1975 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Mar 2017 20:53:39 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0062.outbound.protection.outlook.com [104.47.41.62])
	by mail.openembedded.org (Postfix) with ESMTP id 02BC877701
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jc2QQf78Emiky/NRgIaSf5nTAl8duAt0Ao3vbxeVIxA=;
	b=L7xZvDmO7yTKM+uhiKKGn2DUmRw/t95817kH2AQwFOZj8i1CI20zW67FzjuOmojMC2Ian2X4q9Z4o4MGCCkH/XdTvSXYUxWcd/45x5HLrBABjh/VxKtH//eKzDH9Aj2XmkOoB+FIQWo2VIWve1xU3p7iePzkhiAJ/5eCUSMjpPI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	CY1PR01MB1405.prod.exchangelabs.com (10.163.18.27) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.933.12; Fri, 3 Mar 2017 20:20:43 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <119c985a-4527-9ced-6cfe-46ccdecbba67@xevo.com>
	<CAMKF1spQU9cmk22_Q7VtwKqJ+vVji-YfOHewUr8sz7ykkJaG3Q@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <7333db9a-fda0-a8e3-6a3f-9d7700e9eda4@xevo.com>
Date: Fri, 3 Mar 2017 12:15:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spQU9cmk22_Q7VtwKqJ+vVji-YfOHewUr8sz7ykkJaG3Q@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: CY4PR09CA0090.namprd09.prod.outlook.com (10.172.133.156) To
	CY1PR01MB1405.prod.exchangelabs.com (10.163.18.27)
X-MS-Office365-Filtering-Correlation-Id: 698adc1f-7231-4351-ef6c-08d46272c4e8
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY1PR01MB1405;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1405;
	3:TrHgBLAefNkekGlsVr1f5kmwmY+HTbu2XY8u0VxQufBgC+YRpFyY2KG152b1UzU17DoYBu84Va38nY0qZQ63hL3nskS2ax+EB7sxRf41tdxwJdGs0x9feD0LZ+Qpe9xr4WSvhX6p5D0S6ehqBQe2/l/fdHIQO1ClMjZ3T6+r+Ww2GjfPptcoj0DMEzrmG14OxPJ7b5wpZgYZDIPJHjAcfvZifrX+Pl/bpjsTZI8WoUl0XndKLRftazVdJLLsdemLAMzQ1PPFH/7JonIYGfa0Uw==;
	25:adXcqPqu0n2Eo0+RV1I/z9Saytsq4UwwY/G/qL9z/rWrEWY7OLfAn6DnpvgkM5kV00yccR8lRFvelEBP3Dgs0p3lUt8xtPjuVxeWgSD1mh4+uNMD1pN/DTOSU20pEbqpDqPzFhk/C2TxnOMbMA/RGZn9POPpA0D1DLUZjgRNYyY3EbFXDZEAqAZmVYBoG/87+Arsc9Sk1jOyjxL+6kPhPkZGogDEjPNxX4Yhrw/B/q2di7a6tNqelOExTdzPGQa3wWe44ZS5ayuUh3pjPJdQEqZjn4jDUeTlCvTBT59SEpOGjY31aRp0PXONM35x7JpY/p8qUTGCVhIFHvTtal65Urp51rm96Yp8g/lOTXIpIHYRbk/47VIBAM7ZyKzI2zaLb0k6zb86k9WZCNgSudv+PkU8QT0Xmgvf4tLbuWBaIYd/dNJoXDUH+uf/N1Eny4WjRGdW55k9L8YkfFJpYOkP1A==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1405;
	31:wbYB1v2UeNlD+85huWQGXvieB8H0brRQQ5TDXsMV50b44EEVxpj40uI/1khdQFW6pMsqxAPPwUlesyT4WXfZUCUjbPE6Bcd5n/8OBtkrIencWq8Docw+baRcBsisxSHrH0QR1r1myEBw3Xb40CDmxPGV9Hs9LeYuMFcT7g55dhmm+tGmGLvzxO00QCsi2AceWlgIVn6NenQvb7lRR4yQCvcTR7wumY61tVT73SE9iqMdmtQ0hwXS0jJoUt0PW8d4kL4ztUGu6OOpOz5EqCqfwCcTuiy2mp8X6bjLchVIFOg=;
	20:vN0Ghf0hP0gofv19Ckgi5zv+8GxMU6D+BFYJSBGWxSKXt/CuUQ/jGTzNQkbdIGLq68kK5Wl4qJwv84uCgOsf/YUSff7hxiFHz/MYTAbD6poTeMX9BnPx6VXvN4tFShEFl7kSNUXk+dkGOY9EnZvYRPpHinkj0pWKxhglLfUHNid/g4l9Uf1oBRPA0gpUaBRnrzIenIbgjagCb8hbDnChNsT4kgPEb/JRDd1I4BTUQf70++pRMRckAAv+ta0HSuWdOk6PLj2iDEPEyYVrQuibYqdT6wN6NvVmsSksYfznubgQtIUdLgRawKq9ob86IH1yJWE5Aqy9mfckiAdNJjBHBmdRhNl16d/dv7AHGueTkbxK6Y+sky9Iat39tmH7NB+EzXc7IScThpy4ROaHz5vh+gjeKIYrb9fiWiJHxJIAvIY=
X-Microsoft-Antispam-PRVS: <CY1PR01MB140531AF80D015B122151062AB2B0@CY1PR01MB1405.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123558025)(20161123564025)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:CY1PR01MB1405; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1405; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1405;
	4:Mrb/+BEK6KRFNKWSyo2snKEvkEe2vNbV2Xn5oKMAeuM4lOi+zf6z4++eeEgm1gtRQB9pOzvCh781YCAdqwkku9OcHLFn8PRM/Fg5rIbNa+IM5/aj6mLq8FblO1p5Ztj2grEj6RJmmNFElO7eReGlKeVqlxkjBbCZ45wIwmWvYdFt/Svotg/e+j8m7Ar8MHI3CxPUwsh/m8MhUc13bIO2nhNmw+f6uVbSugiIRyQFv4WOai+1D/hELEQ7WRSz1ljdmsNT4wEwHNmuH/vm7wK+E7etbaT5l55dmykrmnSKzmNpue3NXRC70bWJhG1E8SHuCOp1oBOW60z0iEt8w4QzrRJ5NqBkNQBpEoFDHN2F0q36t31vMK1Xxnhfz7AQsRmaZ7qhcX13CYccSS0KdERGENBf4yJxHhsIu31KfIOLuBFBNf1kgxCC7t4JF56s5zlObFFw3Zfo3snt3teJreQki7CD7dS83/+DzUoKgofDPUHXWPkBKukyJgbT/clYPVhgA10H2s8GAl8FdCQGdjAvCj5bJvaXkOanCbag2QZ3bHD3OPkZAmWRW9OTsnIMdEh8h3gf+OZqN09Eu45yJrAlRg==
X-Forefront-PRVS: 0235CBE7D0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(7916002)(39450400003)(377454003)(51444003)(24454002)(189998001)(92566002)(36756003)(4001350100001)(83506001)(2906002)(4326008)(47776003)(66066001)(2950100002)(6916009)(229853002)(8676002)(6486002)(77096006)(25786008)(81166006)(33646002)(6116002)(76176999)(31686004)(31696002)(110136004)(117156001)(3846002)(38730400002)(50986999)(53546006)(5660300001)(54356999)(86362001)(230700001)(64126003)(50466002)(42186005)(7736002)(23676002)(6246003)(305945005)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1405; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA1OzIzOmNjSU56aEp1VnJxVHBSY3o4TnVGL0JJNUxH?=
	=?utf-8?B?ZEFMOUtoRFhFVjMwdXJFTHkwS3d1VE5aNTlMWU1TZVAxa0dmWExqK0N5Q1dl?=
	=?utf-8?B?K291dzZIY3hEaVFVVkF0WHNHOCtWQmNvbElJem5yb0UvMktjMW1VbWN4dTRJ?=
	=?utf-8?B?WXpjaXVMdFRoRko1d2lHektrdGxCY2twUi9SNUlZeExjcEMxam9WVURCMGhE?=
	=?utf-8?B?bmJ0VWcxYVBoRVdoaXpEWjhRUHJmVmdjclBNQlN5dGVCR0xNNGxWRGxpRy85?=
	=?utf-8?B?MlBOQThKYTNxUEFXWDVxMEdhYnBEMjB2OVZHQkVINldIS0hIeVdmTU5LM0dM?=
	=?utf-8?B?TzFMTVBDOG1pM1ltUS94b1ZrbVVkbVUyOEdmc1ZsandQOFloME5PWVJ4Z1Zk?=
	=?utf-8?B?QmpmVTFHemFlT0luTEcvVmZTMXFvcjhaUE9GVmNTRjhrb3B6RmtzVmFhS1hr?=
	=?utf-8?B?Ulgza2d3dE9RcFdUS1NKc29UN1EyM3NKTHdmaFFJNHVaU3E5UXVVU0xhbHJx?=
	=?utf-8?B?M1NRaFZkM2hmOVlITlZZbHozU0NIejgxcFFQeVBYS2prUUEvTVF3M2tFUlZX?=
	=?utf-8?B?a29FQXJyZ2wwc056RXJMRVBjZHVBYlg0ak9vd0d3cVd1RktnYmhtLzljOXg5?=
	=?utf-8?B?VmJTN2cvYWJkOXI0am1NU2dNZlBXd2dKS29wNGJqR2t1bnJGS09peEV2bEsx?=
	=?utf-8?B?WkV0bWp1ZVQxYzNYdVB5T0x4NnhQQktDdjNlOGlLdjAzRjV5bm9IWTNwcHNk?=
	=?utf-8?B?c0tUQUF1b3pSMXhSN0xSaXkwZktCMEVpUC9lZkNPaXBqYVY4b0pzMWVmQUVX?=
	=?utf-8?B?Y0o3OFN4YjJmVHdOQjRBZnlkek1RUWV1OStrZzlnZ2tZMkV5RTdpaXB1bmdP?=
	=?utf-8?B?WnpqYTRXbC9weksxbnFvMU1GTGR3eFhoQzZYak43R2N3NHZ1amx4V3F4YnhV?=
	=?utf-8?B?bDJXUkN5NG5rM0ZKcGhvVGlxRFRlbTkxRlI2d2VnTlhwYnZUNWlTanQ3K3pj?=
	=?utf-8?B?VHJpMUZabnEyZ0pyTmxSaTN5TDRDdHkvWG4rNVAwVytNRHBhdUtxa1l4dGMr?=
	=?utf-8?B?dWV1a3ZqS1B1bkR4eGIzQ21nWE9pM3NWQld5ZkhSeHQwMUFLRm0yNDB3cEpG?=
	=?utf-8?B?OE5DSkdHbUhDQ2F3ckdvQXUwbjJoajRhMjVKNUJXREZpZ1ZJL0dpY3Y0K09F?=
	=?utf-8?B?a1NQMnJCdkVmWi8wVGFZdHI2NytoR0NES1dyaENwY2xqckVrclV4N0xxMHRJ?=
	=?utf-8?B?dHhVOGV4OFF0VkRqdDdFK1NzZ2FwZzBEK2hMUzBqRGI3NkZRdVBVQ0lScHNL?=
	=?utf-8?B?SFh4Sm1WNkxGY2g5OEtHTUlYTXdDTkRMOEw2cEZuZE9KUlJDRERPK0UrU3lY?=
	=?utf-8?B?NFlMemo4ajlwOFpGMEVsaHBDbFpJOHV6dDB6enNxbmR2M2JsU0llUzNubmY5?=
	=?utf-8?B?dWF6NUU4bXZEdEdlQWRrTnZxdXNPbnp0V0ZOM0F6R3FsOFhOK0o1SkJrb1J5?=
	=?utf-8?B?MFptY3ZRRnFKRW1HT3k2aUNKMW5QcFVNazFMdlRjdFhCNmNwc1Vxd2hqS3dG?=
	=?utf-8?Q?oqei/rVRJQpdemYz0G4mUVlZbFAdoiY886jYkPW7kKLM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1405;
	6:rK8qn6+0G61OAU5IqSV0DKq13ncTbBvLAOqhZQ/qfeqKsw94/5733ALr7yyRTIefL/hAfkoHjVtQFNvojet6YpFMrlIiEUZiGUhIohYZoAkiRbpvnJYQG+OmiET8hmzur9ZMkkJqJqd5KSCl/+e2brXXEYDijNp6YxdyiK5OFsSZwG0q/vZ4Wx8TiaaJaKhVdaK+b+saKsG+gUbOFfQlFNdPkHrqPGsn0FEML43WQC/HjaCE1Inx1LnF7ylsCZSAdCH7b1E+Cggg1CG3/OPIsVfKxJqbqdwzvtqsp4NZtKm4KlyI9X9SRc7s0SLbmN4uB9fyRWE9Stt1UldEk8zrx3cqM0GFY3bYWW3MFRQnJuWk1ARnjy6bysh5tE0OX4kbJC9LfSbZBvsx9eIb/zMMQg==;
	5:tMinpwOIC6fHWHXgP9uNn+YvpmLAc67qywhIO1s7vnZgxOgwGGt8sLQp9s9vAJtZ8nOKteCIRWEnK+egCcS3uXzHH+Gdrxodp6b54gwolj3kP9cTizUg64wZ4nBdkuDPKuAnhR2vKFf8we8KKk+8KQ==;
	24:sJlKStA+e0ZCtFyAobY0iYx5XnHaHxvl+M7tojjOqcRNGgL5ji3BpIGtvs9SjtQeHSIB8N7mpd5ASWTxqNKnBF2P2NEGPhORIfN+eYQDZns=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1405;
	7:k/ziNITsXbAqf7Cha4Ch8wgl+DMHtk6OPvmcgYgr5fhYg9OeC1tgetddqCvyXAv90U+annzLAt5+TeaDOFLgXi5sfRITLcnArACxaQShJ3mfrRVsAQzWZnRBEPvQpR1qBKzNFFKrbalIJycZmkddzPAKgYEq7XdwKf4tvQlijpQR2izVWg62voa5boh9MQlJIepsWW3vZa9SNaQihbqMf4dFwTcno6h3I20gZSJY+SG2uryU6EGlKYTRIittEs1fjQCesaqV2N9JayBI8IQAopIm6xM6t5Q+9NGXvwWomCN13zKpGwQeM7KhlntgkMbg574ubMpC0m3wF27FcNZXwQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2017 20:20:43.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1405
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] clang/LLVM versioning
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
X-List-Received-Date: Fri, 03 Mar 2017 20:53:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2017 12:12 PM, Khem Raj wrote:
> with  meta-clang there is no desire to support multiple versions of
> llvm and thats why versioning was dropped however, I would still like
> to fix the versioning if that makes it more useful.
>

OK, keeping a single version is certainly simpler. Could you clarify "I 
would still like to fix the versioning if that makes it more useful." ?

I may be missing something, but it seems like the llvm-config wrapper 
script's only job is to point to a versioned installed via 
WANT_LLVM_RELEASE. If that's the case, and if we don't intend to support 
multiple versions, wouldn't it be best simply to remove the wrapper? We 
could fix the wrapper instead, but I think that would have to involve 
reintroducing versioning.

