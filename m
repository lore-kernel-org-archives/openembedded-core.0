Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0054.outbound.protection.outlook.com [104.47.34.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0801E6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Aos8PcpRHSRdfZ384A9yg7WgOGFgHDQ88AkxnCGS7u0=;
	b=pCWb4tTOFtNHBDuN638l8SPMSV7eh/HK224WmEeCLPK/hZhIapvR62EqnGw2PYixsBSvCGr/WQ3MP7vrZfuIlTkap7+a6Gja1SdDSdTMMeVB5JzeNsEImEuMY3/5/XTLI4MCQZBXPD/A3LXIpIjeL/DU3U0KAVb32mOPZww8wZA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	DM5PR0102MB3415.prod.exchangelabs.com (2603:10b6:4:a0::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.15;
	Fri, 27 Apr 2018 17:47:29 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
	<2607b2d4-c37f-5693-1002-db17f9e1024d@xevo.com>
	<CAJTo0LavpmZCQPHSTrsuJwEZHLT2eAhKLQR8A7Fj3kX6BTC0wg@mail.gmail.com>
	<20180425195437.GA2244@jama>
	<b640e9cc-0bce-0b7b-9639-0a37bf459695@xevo.com>
	<CA+chaQfHaSAPXrU5pk_=M8hEjScxdVrAcUudekjFbzCUpQxSYA@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <44ffb221-e22a-6709-b4ee-41f1be0fe552@xevo.com>
Date: Fri, 27 Apr 2018 10:47:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfHaSAPXrU5pk_=M8hEjScxdVrAcUudekjFbzCUpQxSYA@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR02CA0021.namprd02.prod.outlook.com
	(2603:10b6:300:4b::31) To DM5PR0102MB3415.prod.exchangelabs.com
	(2603:10b6:4:a0::16)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3415; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	3:AAKyBi0HoPAZMQrENawmQYJwhfjU0FC5Y503NeeUpjP1cWOrr4E8xtvxKXA1PQlpP3j4dSVauTQX2JqZVHEqeiQorI3qWe68hkLK7h7x+clrLV9X7JT0tK2Vn28YEK1MqqB7YhG/iR3UQ/iJW9ndrtHdRaC/YOtJQDBgJwqWucjyBbGLfxuFvFNGjgxhQ8JKrtGGGvhuf6fuznpoN7hcsZr8Tyq1aGAf3fA0O7XH2yzyOxBAwZgIjjvK45GjgmI3;
	25:Z78UzXpFgtetr08zqhalYTb3KPFbF4Q2QNVHRnzLfuXPRUNIC5V8dfZ1H1MNAZItPRB0XsnthSSTvNI6yi4qo8yap22ufpsaJp+qO4nJclvqbRm+Gr+xacG1tgzhfTHwKDdMlwGeh47+4gGKkGUd/7UAvQMGa6M6ElO0jdEVeOLkJTvJu0f1rURLKVWbVqr7xLFveblpxVDF72qgiOD3BGBX58fTrBXpRqx4JWJkwEnoZjzZNWLATjR9Ef4q+qnxgFDm7KtZwRMT6mGeK8AYhTbd0lDWXWk8K2uRroCqTQKXE76SflM/OxfJwc3hZm3JL4BNdNnshzUDUfXHU0d99Q==;
	31:z7VBScuW5UHKsfAPORquez6mY8hWYi5CL29s2QJs6q5yTc4+FUyzqAyDJ/c3pqApmE4kk1kzADoTJJ2f5dgnT1/4Sv0j0F9QTjBvLOXawCA1rBbMlNJSIWrN0DtSyHScH+zDtn9SwSdsTykASny7MgGTmS5+PK7lOTnIfpSzIzIR/tPr/un2s1032kA+bQwSkMS+11hUn4DQRb1/fVk2v0w/a4RoA5krInOle14r6TI=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3415:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	20:jLBf3wyGb0dij0CKd9OLfF+CWyXQ70TgnZwZTs2lWk+kWUkQ3T7n1b8Pox2EQS8ZH5nBd0WSTOxz72I/JRggct6Aeo8U/j4Nh5XjDmCskHvSis0ne1RCdWdKd4xEm6jlLmcpgghgxmcMfyl14SOf+Kcz5FL8jGV9L1HXGtaXJi4Uh2UWRTIzHgBHsQin2YobmOcPPd57YIMQaEBijZpajdSPPrVGJPe8WuB+XPSgRHK+Ki3jbO4qfW83fpyzF/er8NEjl74tiO2/FLzcuUX5g5WuNL9Tln4Em4FFwTpu81vsn3M9VHricee/K+wa5QKuvp9LQd1B8EVu2TzWqw9QDZXfFIK5co5/E0xeG/8UVB/YUpp3tHNCycci5aotW/QCGQy3cArpgufXziBOdHx/IIPKsKzV/J65bSImTuXhOy2/Syy3bQsPhisI+9xzXwhlsO2wu81T/ok2HHk2krIQj9HLSrruYd4LyX8FR0WYDhmwtHenM4++YozCOAA73qbm;
	4:pOPtDgf4RhaMrRgXPE/8U9w2ROWifZmib01AJKNht0gFy/YcLaHsb4Hni5lWvhHaKU3Whi7OMWVhJGnKMAnC5k5IL7q1lv4jvKWNXGZbBXchl8bxLvHcHAjFAcigm1NyTZfbavOi2AVhPI8q6aHJROiOS0ax9gugNlYQ3jQ7s2jRYJJE1ARA591vHyNrJd1TvqL7Jc49p1DLo9o4Zozc3TBONpK7PaQhThjmkCX25unL0pZT6DFxyMoVPFtLf66FWUcRI9cXVIy5zykTYs6vaA==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB341580553CCCA628DA85F7F5AB8D0@DM5PR0102MB3415.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231232)(944501410)(52105095)(3002001)(93006095)(93001095)(6041310)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:DM5PR0102MB3415; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3415; 
X-Forefront-PRVS: 0655F9F006
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(366004)(39840400004)(346002)(396003)(39380400002)(376002)(189003)(199004)(230700001)(53936002)(2616005)(23676004)(67846002)(76176011)(53546011)(7736002)(16576012)(386003)(52146003)(106356001)(2486003)(105586002)(229853002)(478600001)(31686004)(5660300001)(6486002)(97736004)(305945005)(8676002)(6116002)(66066001)(476003)(68736007)(81166006)(50466002)(64126003)(11346002)(65956001)(47776003)(65806001)(6916009)(81156014)(77096007)(54906003)(52116002)(3846002)(36756003)(86362001)(486006)(65826007)(446003)(2906002)(25786009)(186003)(316002)(93886005)(6666003)(16526019)(956004)(58126008)(6246003)(31696002)(8936002)(26005)(39060400002)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3415; H:[10.201.1.39];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDJNQjM0MTU7MjM6U1ZSZStqV2lEeGFyMFZLQVk5blRqT3Jy?=
	=?utf-8?B?d2RDU0JsYW5LT215ejZVV3pGUGgzUC9GcUdJbGxNcWFmVVdpcmdlc1Zhb2sv?=
	=?utf-8?B?TFN2Q0MzcUJEamxDZVZ3aEF6TTcvNVVYU2lIamkrc29NTmhIVWc1OW1SQ3ZM?=
	=?utf-8?B?VkVpYUZuY082R3hFb0gwSmlNL1J5eWNLNE9zSEdkZVlISG95aGRCZVZhM2RK?=
	=?utf-8?B?QmZMZnlOSDQ0VmNWUE5FNDBYeVExRXBCUFh3TE5vTDFXWHZtMDFrRTFtTThv?=
	=?utf-8?B?UU90cW5ZVnVPVVlQMVM3aEk3b1NNT0pXSTdyZlZxTVFlWFptZVF3TnhEaUZh?=
	=?utf-8?B?eUFFeDloK2lYTUxUZGNIa3dkU3BJdjMyUjlLK01DVEtLczA4YWJXTFF5TkZl?=
	=?utf-8?B?UzA1QUdOTDQ5Zmt4LzVqU2dIR2xYcDR2MGdCNmxhTytvT044RDhVZWhINVpW?=
	=?utf-8?B?aE50Ti9JcSszR2NsWExQNkJONzg3SWdNclZJSExlbWVkSSs5QkZnK2w0aEZn?=
	=?utf-8?B?bXdpTW9pZW11NmRvV2R0RFFvQ1JJWG04cE94MmRLTTJoc2o5YXNiNWlmQkpW?=
	=?utf-8?B?L29YbU5POFRNVVU0bGRhdXNQdkc2MlRraDFLZlFsRU1GNmxoWkd6L0ZzOTBi?=
	=?utf-8?B?bHJ6cVF1QVdKSVN3elo2SkUyMnVhUDlmWEhWRXd3OVhSVzlFZmY4dDByVWpE?=
	=?utf-8?B?OGtDeWxNTjlFamxCN2FnZjJGbzMvWUlDZStLK2FyeXdnNXI5dkd1MHVDQXRD?=
	=?utf-8?B?RFpESVVLd2FwTVZDVUpQZ2tmRksrcjFxZmhzMHNnRmR2MWtzUzFRQis0TGpi?=
	=?utf-8?B?Z2JiRlVHR1VjcFlHQVZoMlFRWjBaMHFNN09KaHFUNndJa3B0RnlyRWFrTlVM?=
	=?utf-8?B?bmF1bDVxUVhrekkwUEN5V3NhRDdUbm1xa0t2RHdOZDU5UVg1STdManVRZjRv?=
	=?utf-8?B?VEVRZ25FNld2ejZLdXBWenNiOGFrY3lYd3Bkb283MHF3N1dLeEZTYlJodXVI?=
	=?utf-8?B?SGlMZk1XOHpRN0lUdnFKN0p6NTE1SlVVcVcwTjJQMDEvT2pRMXJXV21iN2ts?=
	=?utf-8?B?MlZUNktFbDlEL0JnNzlRcXJaY2VBOWh6bnM5Yk52bSs1dHZuNHk4YkZhVjF3?=
	=?utf-8?B?aTNKbDlycDZYTGEwZGNWLyt6SjlwTCtiOXUvbitlckUwVEUrN0JBb1FSZE1B?=
	=?utf-8?B?Z2cyZHBMbnUxeldrK2QxZnFPU2Y1cCt1TG5zdGZHdTJ6N1AydjV5anRUMkFF?=
	=?utf-8?B?azBIdXNCU1FlNnVaUEdoNW1RbWRCcVAwbFludHRuT2NIbEx1YXhOOVJCTGd5?=
	=?utf-8?B?TXF2bDZzeWJnVnRhblBkNjdBcXlWOVpQYW9CTldmK2NwaHZCbGQvQXlrOXRP?=
	=?utf-8?B?M09LVGVQRnlUTEh1bWhxV2tQL1RZV3ZHRG9Ib3IvUTY3UFBicU9qbytsUzRE?=
	=?utf-8?B?TU0ydjUrazhZYUcwZ3Bta3BsQlNJVXNQckZoSjhwWnpDQWZUN3JJbXk0Vyts?=
	=?utf-8?B?VUJhUkVhb3R5N2tCYzk4anF4T2svR20zREo2Q0dZLzBvTVVSVmhZRVpZS1NG?=
	=?utf-8?B?bXEvZ3Z2YWw5ZUVvMEZSaWwyVG4xR3ZaazBxMHhjT0lhbHJobFZuSzFNNjFJ?=
	=?utf-8?B?V2VqNktiL2gyUUEwWTdvOWRuNEl5UjlNUUI0VFI5QXY3RHdSRUhXWjA3a2pz?=
	=?utf-8?B?OUMrVEJjRlpwUnlKeHFuMGNRMzMxOWxnNDdwb05XMnE4cUpyNnRNVkJ5REhx?=
	=?utf-8?B?bHFOazJFYzVBYXplcUJDbm5udDc0ZzNWUnZ0S0RCL0w2ZjltU0l1Tk03N3Q2?=
	=?utf-8?B?aTE2Zk1HNXhiNklZNGdET1NsZ1RTS0VMaDg0cjNkdzY2Q0lvRnZTcjVTYyto?=
	=?utf-8?B?NzhEN1ZWVVdqSmJzWGRvZEZzQkVEL2hEaVhNS3lQR1dFUWV3NTc0Z0gxdEZu?=
	=?utf-8?B?SDhtMWhGWi9jS05YNW0xdS9mNUFRTzU1djhoZlJtM2FhRmdFdDY1cEEwYTJj?=
	=?utf-8?B?VlJrUlRWMit3SjMrYXdLZ0VKN2V5RGFUczc2b2VKSXhqL3B5c09zeStoZ1hW?=
	=?utf-8?Q?9hszCE=3D?=
X-Microsoft-Antispam-Message-Info: Npadp9PCxp9vMUc0eD7AJ+usPXLrmzMMy3NSD2cC9dYB1So1kQbkSvm53gdY03iyXlIMNBLstzqq6zzGQr7GQKUvKVoOP+q4YyEQrIJSrZLmRv6y+MJXnAaVCyoBDfCl5dWUZb1j1Nm4mLEt4C53AKtH0T2Ms8yHu/iF1MV0vyP0mhTGI4nIBcOqc21ke7Rv
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	6:slqWLQvWPC2D/lCNhncwdyhHo5qcGkqZERbZIIOG5gxoH2it2S8varRqmiDjJBmIGz/SNTKebdjz5BFmMO9sA6Zptnoo9iAMyxGpyrOKBcgTw9vvgJxnXQNtJQE+j/HqH53kvBLfy7uOvmXBNYS+skmoRxSXNz6+YLRv6JzANlsRq7qOPdEouA3Dv7i3gts5n5Hv7REnbLiH27i6yNtTbSl7P3hxa4TW0HOynYjOb1xnfqUwGzhRaZviQNoOoGQTaSp92zQc0UvX6aF8yjXPuVuDtK6DhVbtfXpZBrlrNGnH7VQLV0+xKp/xYt95VBZ16Vh7gZ7mkuQB35RKkCay/XpixO2PoM5QOjf3+uAVdu8SjpKuTZgGvQgvmbPaWKHHUG05C69wpffu+TomXvqpWyxYF0y3KeP79pEEtsssa8Q5expnhgD+dvN3/P7+KNY9UuuIBIVe7rUz1PCOAChOAg==;
	5:DwaceO0n1HF7TsL4eB1n7QfbvA9woDGTuLSMc7ZS2vcia10Ahq5Nu5+v7edj5MKi3OcxRrOfsGAwq1flvi+K0pDm1RUEgPHQ/AfIq57ClsVYlS9i7hyGh5qRIs+to481w7yJVNAchbrGEWznA7UquTwMkqqOs81byn4FVkWY65Q=;
	24:My5pt1ovY5SBFw70xKabqUhzNtZvX0S/koydEjEU/lXJ1DsyPcWKfAWA0VQj5E6/T3OHZjtZRHPYlPomHc1C2y6AYiu/nAujd/W/GTFHhVo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	7:loJ4fYxat9haJTqq21SvS7d153nuh95qszzFBE1Cp9Y9Xz7NGAj1xXAsWOvCQDSeVWJvSZ03HReRQkGNRF72vssli6/eosFqbDrrC6Bz0tSk/rqr6lKZiFI5UeO3Tm3o/uHhUlK6GwkTsbj7GcbewhntTJOvrJKbgYFB5FyROPnkb4VTQucg42CgkRxz/UOPENqSjj3v/9XuL6QaGFFye6aTq57On7L0H9sbfTP2S4zvXLMNLKLC0n2Tb2T6DVRQ
X-MS-Office365-Filtering-Correlation-Id: 3eaddb07-7be2-4500-ce2f-08d5ac66f28b
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2018 17:47:29.6027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eaddb07-7be2-4500-ce2f-08d5ac66f28b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3415
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Fri, 27 Apr 2018 18:19:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/25/2018 04:11 PM, Martin Jansa wrote:
> There are actually 3 we need to consider for lowest common denominator.
> 
> The one we build for, the one we build on and the one where we will run 
> the qemu in the end.
> 
> I mean the core2duo is probably best match for core2-64 DEFAULT used by 
> qemux86-64 MACHINE. But it's not good match to emulate with QEmu and KVM 
> enabled on the host like my.
> 
> It's easy to work around this, we probably don't need to change the 
> default values, but it would be good to document this case and how to 
> override QB_CPU_KVM if your host doesn't match the features of core2duo.
> 

Agreed. I just sent a patch to yocto-docs to add some documentation for 
this.

