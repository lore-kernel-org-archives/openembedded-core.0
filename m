Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0053.outbound.protection.outlook.com [104.47.40.53])
	by mail.openembedded.org (Postfix) with ESMTP id C923877E5B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 05:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=F7Om+pwM8ojMclkeXvi++SQz0jFXrZKsi/UwDV9pYxI=;
	b=i09IT9mgav2MbkqPNgXqXkUMUDN5o8JaA4nVtBEhDApsIzI4d+IO9l793f6Uaqc4OIMRsv/nkqgUe3g2B9Ng5DYUZ99+zw0+xUyAI5tyvwd34dfciBfmWQj6SeoREaU54PrtdRFX2hejmn10hJyQ7VOsTPj62mcQqmpd/3ecVis=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.10.63.161] (210.131.143.241) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Thu, 1 Jun 2017 05:45:23 +0000
To: <openembedded-core@lists.openembedded.org>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <05d3e7e8-853c-61a4-0cc6-dcf3628e0a44@xevo.com>
Date: Thu, 1 Jun 2017 14:45:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
X-Originating-IP: [210.131.143.241]
X-ClientProxiedBy: PS1PR0601CA0036.apcprd06.prod.outlook.com (10.165.208.46)
	To CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-MS-Office365-Filtering-Correlation-Id: 00818caa-eb5a-4758-05e1-08d4a8b16661
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:h3Is2h5o5cUFKhXHWYXy3FIE+TJiOlRi28JAbELKpRbk8uFl8pwCtEkr3AdOSMOWAPHHfsViKrwXM+4s0xqn9w3I+n+5vbDiWoEFgxuHAJGUzov0j9f0Oq8J7YLNW9MzXUUwHQNBOgq2S2+BTwlIsHoDjHnMe+BU//VYAvg1x7HXdoZG2NM2rO6iQlrdq0IL5ggt6sFUeA4tOotIf7UAuje2hxUD5Hw9Ifl/osGVxHhpREE3UTZ5Wxbbik2m/OW0Po4/xfPDf0VAFq52ePexp5XzwWziIUylv9tqm8vtSksEghr+OrmlQOyMaqK/MnSStsNY7FjfGYfJ0L23E71jdA==;
	25:H1P1InjcWDPpUaDn7vlwYQHmEPRkzQmuw6U/Ui9AO9qsSN21CYdGf7ySDDrXA9anpC4LZxtUnbSbi82iRleJrC10AwD6uKjcmTeqmPijq8i5GH87KuVOhWc0DGwGMO6WYCXP32oOykYqQCwvn7i7rNOHUMHiuMjFAk8vW1R9NTP3ZjJeORdTmeWB2bQshc+t0rf/qAlTTAVaVooAUSyFn+hBZfqAvByHBek/lDHyEnTaLv3S7CnqYI5mO+61hQvPGvDhqp2H/gQNiSfkkQevO4vnsc0aZaWAyyFEuSzycirKMvxxhz6u01xRwyC18mIpMrRJzI3dx2nuC3Od/3D1PAXt/5bPhLw9DpB4TQgvchvYA+8n+9nm4P2uZSkmjCLcQh4ncH76JtXuMT0OXOXkb5pVuqzUiBBgBDgGJ6Lympp50qhLiBlGHKAC4It7xW18ieba4xpXqNYSEqoeHoPsunN11UP5dhy/EPFpXjRR768=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:nybg7rbaAupvfkS+M2yALSJUlz5K3rVDxwbENZl1RNCRr3P2miGg8mlHnxdK/UxrRT64tEbj47RHLFbwJYTRe05K+LH0KFjefg8EOiPlMrEPrBg2X0a50K1YncA7eFNdvsD+TpCW3qHhTIkFo/Ut8BdApsh5tsTNRvw1mzR3A/a5wcjtGbLwbRzUayexNbHbXSpVMCz/l1GoSWntbEq/aaVJ23WhefHfKpikewlefxFTIAtJhAdtO6e4vH30a5Oi/7HAcDTTMqjXGdRlQdSNQw==;
	20:J84Kh85absdWIY377AmGRQkmKwKcQ8/NsbpGrbmecoFo5FLJ9w5XI+YkgYwkPXitb59mbgX3j2LNf7Os/4O7thS9dWzOHjBiAHowykoiCJ+LwCkcemxeK+a1/EY1vKEV+Dky+G9/mpV8Z2rerIo7WWXf+j3wdaXqi0nXJmCNTcwQciznQUwcfw54Jhz50xCrCWv4Cs+qJlRxqrl7d9iRjlChZRpLscDEzzxejOPcCbpzf9qSdceTf97YBdoy/aNan2VcCfA6mOgLLZtviHkZbiOdNAQ1c94+sg7Ctrj0uONZBhcoiPLua43L2HRVOsi0PumrTsg3O0044bGLJJzFzg==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935E5EE6B33AFF88AA5AB63ABF60@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(126837547833334);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700082)(100105000095)(100000701082)(100105300095)(100000702082)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703082)(100105400095)(3002001)(93006095)(93001095)(10201501046)(6041248)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123558100)(6072148)(100000704082)(100105200095)(100000705081)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800081)(100110000095)(100000801081)(100110300095)(100000802081)(100110100095)(100000803081)(100110400095)(100000804081)(100110200095)(100000805081)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY4PR0101MB2935;
	4:VgKsBT1a9OgP++fM06zSjxf//d+YXO1817Hx?=
	=?Windows-1252?Q?qZIRUagrKlGpq8WVr7rvYlBE5gMrA/ZSgnFKc7o40mGKk29W2ovt/0N0?=
	=?Windows-1252?Q?+333C7aTNgU7JZPTXHSv8RNdgxksSPMsbwqqzYLLQ7wE4jIylxkkMlDn?=
	=?Windows-1252?Q?GJtCIHGJ1kZ1YXzuRSr52bkYqxvf68h1UW3CWDmH0mTck7k7dNWo/SPD?=
	=?Windows-1252?Q?9f44xW9Sh9Uc+kfqTlQXPRH2ihDP39C3vxa5EVJ2Tbzw5H3K2EY692/A?=
	=?Windows-1252?Q?/7WH6uCoYnpUF1X7YiyUAgKzxsLNO2pyKFXfVwLPkGJaOXPwAXfumd7G?=
	=?Windows-1252?Q?KlMS7Z1wAxPxSaBIKcSHRyGWmOub0hORsjLKNhorQSwY+8PVcznP+Z1w?=
	=?Windows-1252?Q?c+M1TsNSIqJ2+UDbmIuzBelwyxZB8FV9+qLIt2wuCgFQDdC6B+NcNUGk?=
	=?Windows-1252?Q?Cc42ehOsf08aM8G4N4CZY7czS5aIfwgqKV2b/uLOkdv2WCgNAszw+NBw?=
	=?Windows-1252?Q?I35r7RNz3e3DCuq9O5BJKFVdM83Zpo/H8LlHgE/Oe4J0FLIoQVqz+tm5?=
	=?Windows-1252?Q?Y+9yYD/V1eq0qwsJ/g5aTH53YBAqgHZ+gdEhkIZ7WLkLvjaBsjGiaAkJ?=
	=?Windows-1252?Q?XBtkwmAKqd+eE2PHSq7aIchIjAXV4J/kAdp/2Tt3m9QuMCqrdjWvRtsU?=
	=?Windows-1252?Q?7OyGlJMNi3PrcSnmZxKlqhvKPROMJXhF1+DmVwNrRWrZxry04K9ww6Om?=
	=?Windows-1252?Q?LnhqWZmG8KN3XW+WW8KFUQrfg15osFBynrbkVeM/pgLygcS8O5jt3MVh?=
	=?Windows-1252?Q?ArsgMzK617wO7RC40nkMNB4e2H42YeCsjSdajq3sJ18Fivz7wSQqmJWu?=
	=?Windows-1252?Q?d9gxEtKh6cbEmKgdIxyW8wmJa5zpBIEDCTOwUVRzvtXftezNlCtFbzk1?=
	=?Windows-1252?Q?Apfxkwknq1UUa97Ce3p9BUTZlzKcYzAlVm7LgD3T6E7Bs6UpnRlpS/o9?=
	=?Windows-1252?Q?ycBy7V83I63O5mOUZ/xpH/6YQ19Ixg8Z8h2BHIqfXpIzaH4GdOpY0Qo8?=
	=?Windows-1252?Q?eK9qC78aSoHLvv6gLi0CVCLpP79d3wqQ5JBtvHCFD1svc/ci76AnQvrf?=
	=?Windows-1252?Q?a21m/34epGQZPzsOBfhq4yFumxLV8aOx/K0oIkMJfhBDWCs98FXBLr91?=
	=?Windows-1252?Q?TRNtjiVX3fzknBwQwh/w415tGshfO6few4LRxvbMcseVa4LBJOojM696?=
	=?Windows-1252?Q?D7KS+adg903J92y94NIQ11ExFw5aiNNwkJeR1H8=3D?=
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(24454002)(377454003)(76176999)(4001350100001)(110136004)(23746002)(81166006)(5660300001)(86362001)(6666003)(33646002)(6916009)(2351001)(7736002)(8676002)(31696002)(2950100002)(229853002)(305945005)(54356999)(50986999)(478600001)(2906002)(42186005)(66066001)(47776003)(53936002)(65806001)(83506001)(189998001)(65956001)(31686004)(6116002)(6246003)(77096006)(3846002)(38730400002)(90366009)(64126003)(53546009)(50466002)(36756003)(25786009)(6486002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935; H:[10.10.63.161];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY4PR0101MB2935;
	23:aee7ZWuYWe9tN+GeTZdrTCELL3wDHBkOvsa?=
	=?Windows-1252?Q?0D/Jzzt1oPyFHjRcSpBcWVcS/7SP4/z9rGltpql0SmTv6ibVG5QIZfvT?=
	=?Windows-1252?Q?7Bqp4rMdTzdOTD3ZkTs0nL3mO3Xmky4Yojl80FEuBP79dgri76BKe90t?=
	=?Windows-1252?Q?vdXmf+IIr6vEYcNncEQacz9X72hDi/99aosIyDocSsDte8KRgIBk64Mv?=
	=?Windows-1252?Q?h0vVup2vcDc+IBs1mGegDgr6+3wvetzERiFdi2n9zwniPoD96VZD/j+E?=
	=?Windows-1252?Q?9C+G6YZSTye+NEOagAYz8ABVQRRKP108aSY/Ah/z8yYe/stZop4lrrJ4?=
	=?Windows-1252?Q?lFDqwHKIjnEoudGjVSX9Ut6GAIPQHmqEhbNwr9E6g5CIdUdo9LzXmoHN?=
	=?Windows-1252?Q?MUhTxkXBrYyOWJzthXa4fyqo2wNGocFjcuVMUsp6OXo+UBcygOlQ7ifv?=
	=?Windows-1252?Q?SIKAu3kdOkERTqawaMn1BdgYnPJneYVt9D8RYLb+S7vloduw8kBcAetE?=
	=?Windows-1252?Q?zPiYXvOYNyyHEukAeh1S6mVsRzxukZRMAzmnqwdDzRM4Swae5qXrp1mW?=
	=?Windows-1252?Q?ZOGuV+XIiWyiWkNkR/URmQfJoVlz4OwA2s4SMeQxDQhQ1mHIc7y0mTYR?=
	=?Windows-1252?Q?fB6PRFRlVGglyvG4P0+EeozyqG/uzO7Iw0SwakQ2j4SFJP7DxfkR8VIv?=
	=?Windows-1252?Q?/fDIMLo/Ik6jdGh5Yb7Hi7fA6ih9KGtr+ssOEBNvddaVUkFJD+o4fEgi?=
	=?Windows-1252?Q?mdGXqvaZ/ziPAZgmFM9Cx2vs0gNulPXX7k2JrcRqvZFqoiz/f/LhM7jS?=
	=?Windows-1252?Q?LEG/HYXcf9b0T60jZvrF+KTumYw1mflj90U8s3Zb3NGKDvPxiAcuyuRb?=
	=?Windows-1252?Q?RovQv5BcC+Z3YAYSxSKj4WH/fYuSSEeXdJukX0/Bdt+QJiVkVC0vsFph?=
	=?Windows-1252?Q?PQZpDkCSRGhWM6YyIsxH8hckM0Nt86X1W5xy7I8LiZw51BUWve3HfBZ6?=
	=?Windows-1252?Q?R07fdnuQmYrqpRvKIqdRlblUs0fDJ71/nhlQvWbD3knFm40vlb7dq4hz?=
	=?Windows-1252?Q?My7qj8bMD2cjkOG/42Oz7fGOiPSMlcel/7eg4ianp3xpUuH4xFBFu+if?=
	=?Windows-1252?Q?hR7Z1tu5G2/YtiQ/ZuLTpzJc6WIFbEQLapHSa2vYY/nWgHEVWSRPVYDJ?=
	=?Windows-1252?Q?OhQDJtnXSZTki6/3cHKvMRkqKmSRpfkUuC+1sKtLRLchSLKebox0pWLT?=
	=?Windows-1252?Q?za/yYcXJ9EcOKgBUmaXt1FGtBK8x7ar8Qvvpb7SZyMMaQXRGWuJBEE2c?=
	=?Windows-1252?Q?0D9t/OU5uUixzVphge7PpIMEYPck9MUi40IjisGfUkkCNVoW+w/jCtCv?=
	=?Windows-1252?Q?WbkAZ1IE6o7yA?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	6:CBrlAbRsFpHOE25kltLQtrfMPZRhszz2LkTjVznSrp40bsI2s/I7lgdWoA/x1gpmGJzfY+U/5j7jB9JFj57JhU84WPHi86LzZpNSkFQHof9ggmdOxTgYgTk/gD54+EeUR5ujhJZIQCT2FBBfwwsyj5oNmopseOmMQC9ahrRjN+xskhQ3dVg1VjpApB8aOSGlsEZsUT7dUIf6801n4xV9wIDH0CV0tiX0WF7WMC7GA6KOiYdunSz2H9QDgi+EQFlXmYdUammQ5NWBaiEelW8hAvxnVhOBSSBvRhigFMTKL/E59D6eFwe6DhBbB1Ix+m0Fv+oETO/Kk/6CsAPGIaAK3IavKoFHDBzCe3nCIsV6KAEepU1ppHfQ+y5fTVG+15FYZ8EPg0AYEWAqPilzi+SBSN1eYdm9+WDR72sWAmZtXZLIZWebrF1sZ2+MufDoLSTUPfm4DtxFHwiOv6WD6OZ/UET5etGrQcTNW+SCe6dJlXzANiOzvlvBa7fldAwmfSI9CZpC4SKc8flq56zQM4w/vQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:TikrYttAFCbJdGBBvC6xQieDdpyVn901q3yrEzZVw+2UfZyBxMbNtkQ0e30SP53IiKbaKo4Odg1PtclyFHtVu+eJdXWLsfI+DiQM2XeVzR496AVH+vO5kBYO08YXPcssvcDdvstXh51WVHa2JxRuzkuj6nS3qs4BEpbCpZoEjcWoQE5ESPPJB2ijsU7RP0nQIhQfWiRFQj9coA3IZg0agV032Mdh7SsTOf2nH/BoglFAkdH0g8HQSEyu/u/Xp75QoIWxIOJQQWK/sPJSbCp34TTJvyuSIlwxALIpDXkCTSF48wCvmzngSbXuutMDpK3bWjTRKX6JsZbZb7oEkwEzEMeGasJXYrNZCoRTgg/zvlJGzrXa/POmXr0wDy/AYZG/X16y/g0lGMAcOD7DJgMEo3Ox749IUNuFP4ymqkAVwYEJFreQ9uR18Cc5v14i1Eapzoq27Yp6JRjCM/Z3ncWoKO/Is5kO5yNhiwL9c1Ebn6bVJNxiWd63w/VxgLmUKdfv;
	24:VQtl60HE0qzeh2iD4IKialSz8ZRQBk0v0ayuA0yMGlvjPeN3Gayr+ieQwO639hpnSMq2GML0B8qOL8NSxk+FVLqX6lRo3N0xlkJzDTpczA8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:/hrS7tBLfHdFYdpCF9W4IxP9yjOggczp+hX17mf780VnvsvFZ9s3186dxh4PS3nBpaRH5EckikPZainkbpk7ONJDBdMPrhpYy3+Yfwz1RB6utlu5airc5OlaTCcybPf/Erx7zixdsjjA+E/NVIHA8yfSdg/8JDhL1DlCJLexvYUeoA9a63w61d/3dCvscpknPH8GuOyMQPVYvgQXX9J78Ut5CbuEkKno8ViQNapG4Z4G5FH2AlO8Jt8P6A5bpqDySUHdXbIw4qUCAFiAPHI/YwGUTpGuHGmZ3swwk48gK4pqBknPGbarc+nlVu/VhfMPSze5slIj6nmOpXrgNCpucQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2017 05:45:23.9009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Thu, 01 Jun 2017 05:45:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2017 09:17 AM, Martin Kelly wrote:
> On 05/02/2017 01:41 AM, Martin Kelly wrote:
>> On 04/30/2017 08:28 AM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> The upstream init script uses SIGUSR2 to terminate that daemon because
>>> SIGTERM is ignored. As the killproc function does not support specifying
>>> a signal, switch to start-stop-daemon. Drop the retry loop because
>>> SIGUSR2 is lethal for agent.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Thanks! I noticed this bug and was planning to look into it, but it
>> looks like you found the issue first! This was bringing shutdowns to a
>> crawl for me.
>
> I just noticed, I think we need to fix the same bug in the systemd
> service script too.

OK, I sent a patch to fix the same issue in the systemd service script.

