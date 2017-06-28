Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0040.outbound.protection.outlook.com [104.47.41.40])
	by mail.openembedded.org (Postfix) with ESMTP id AEB1377F79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AOJ/cU19BQ78ilRoinDP836ct/dB1/IKUIyPUcdZeAU=;
	b=HeucKgyuvV6CF6CAiiDvFAK4XH8Pc4PBerrGDagLt+zMS/GeMBWon9/qmO/0Rry9fxpLxzQ7okR08BSUCTxOJ58lpyJx1P7/eJSCvyWZUNHkLQSQljNplTDnzTi156p6kez60qlMRNSmztspGEsTkMWM3UmqrLGQ/dxTEibCVyg=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Wed, 28 Jun 2017 18:06:34 +0000
To: Mirza Krak <mirza.krak@endian.se>, openembedded-core@lists.openembedded.org
References: <20170526070344.6053-1-mirza.krak@endian.se>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <cda9bddb-3f96-4c9b-1c9e-25dbd5afd7a3@xevo.com>
Date: Wed, 28 Jun 2017 11:06:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170526070344.6053-1-mirza.krak@endian.se>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN3PR03CA0083.namprd03.prod.outlook.com (10.167.1.171) To
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffc0bf77-73fe-4cc2-0c94-08d4be506a18
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	3:zPBL3GtQzeu92ysRb87/mFRX/2Tz6qO6IGbZBM3honF2bneAAfAAeVSOAQ0EVYKxVG8WMopQVz5wMNLBsgr2LRLm2FhOLo4kxzNYk5M9En1w8c5TUAEwfKfCEGPbndlJeMHmSFxbNT5sy75JB9htJVwoksqx+dipUCGZyHSz0/lHbyH9zMVqN6oiSHt6+1AdJjQYWOaTgP4ty1rqSUd+5nVsCpZuH8jTeCTPNtLH2Ji42LZWmVpDdev2Yi8amHumdvLH5G4SqGdsnaNyysd5Qcr7HY/6BT1lOh2nfg++3QW+BmDwjySFInZoQcwmpk/va073C1Zu+YRBAbrdK6puis8ltWIJrsZ7P6ITW2trhq0D5udiI1K8vTaOQ+MyBJt4SIYX6vnnXZJqKJ3BbWH5c+UtPR/xy/Pnp870mDKX7z2f7AHgsdsX9N+mBda3W+ps9ck6SmKFsoTc7YuSz/Rox43syRZssYxy6XV/falxJgf2w7NsSi3L8YvqzgtCAD4hvN+0FzSytENDazCGb5dXLmkbw1xLIsvb/GnYMQ1TvaT4CLKqponJPrYJAfk5wBXsCjJZ06Hx3IcWMWlO1rfloazP8OrBNh7V3QCctj3QT2Yk+6F8AZCcTDFSGfLS3xqA0pH/Twg39pibbxj2DBJjrgpX+pi4PLCit2n7EIxc8MkZLkNoxLuj4KvD16EEncH6hJ6pz2nDkPEtxbHs/yNIUaytS1v8LDx7rJ8N0xvTdA8=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2940:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	25:vmIiPReCdqXOO4bpLS1lB3LKUTp56jnEfH1akDk9rQGs1MHeo3baPf5jOhRKvVWOS5dgMHzhYFnhYs2hYAHDLIRqeHXcC7aOWAVS0iND5Wpgvbm438Z6c4XrJfWKcaiShmoc7Ap6iesOPuFWiyDsOaNur2ZQLIiF/Gg63zRn0ildOaXjHM+htSpwcQ8wmUbykeDhp7ValmiOpsNaWaN/38O/0e2jo9IOzBVczvoeSGUs9URxO2m0D3tfMUUSV3x6RidCnen1H3BRWov1peEB8oCI0QbJexrO8EvqMjCs5oQX6lburgeN8sFVQw3Wkkrw65sV1JDf2qIjJtY5b7uWBoB5L8EdntYq8SEmKgP1VaYSzBpTb+EV3uXwoEmEHecS4Q6N3eWXjoWEa3Vy2bpLxzOTtDXjFiVrNLqsKy3OV8TtLaMTQD/5mkiSRBb9WGqlHrb+Wea+f1tEeUHPBp1/rh+NQcciqqi3cQe5Q7BCBis4jUhW41CVuqFiTb14zns1QlAlHFdft0qWp6nL6ZmEgHiJXpGKuzDntyrfC3oGf3SmhU3+cj6Jq+Xy9X9MB3pL2IGmx5aT9Cz9SOviR5DNqYBPj+0jceeme2QJeTJ6VWRS2H36WCTRrrQaR0+OYnyoVmxC8RSw033Yj77Ym59GdfONoOpbWA179laV9jZwrsp5/XvbNBcciTI/UFi9KGXAcEiGNet/DLhQQDGJrHRezpw8BcBPBk2bAImZ5k1IjNfvYrz7lyUKtXBo/6zu0KIU2qIm+gRQYb/ST0qH2n6KxDMP6Hn9RlExiNh5b+rvM5yLTBskIAG5pq3+lpST84AIo5mQ1XyXUSAPPAfHdlW1axgF/goRN93teNVh1Rw2Z9ZX+vBRlW2YFnNSXj0rJaYN6kQLukYGw7Y2gylwY70v1182mbUzHclBKi+B+3hjk4I=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	31:YjutQMp8yILHpOs9lHxPwcqbp7rplJJiEtLJ1Dirt4/QOvzng7LFYi/15DZNsJ/WxLJb+TL9Z222Zlgj08GXqU7xF6CI5ccag7QfDsjG1UvSy+Via7xu7eafo75aAt0rhkmRIJ06/LXCWwunM1wbFe2bpL8GVKiaxffxGp4vuTeK4/4sG/k5GqIB1zDc5g7HPqaPm7L9edlBFTmG3fIlE6RWQgvO7tPIbJOc8mCLGJpUWLNSII5blXx2oynj3ch5l+yB2ZMmMDAOCSDHe9JElr+F3We8r2EFX6R1BuiJ4TBbEpFXjpH7h0kqtOCSCXyrrR3jdIWKwQVS19Ib+EZrJGbHN8QEv1WOWaTbLygZ+wZ8cqlSw1a6/0hfH4azMWiJOdQGyEstb/bpaM+eWxw83RBNd0sXTU4wJfhLQ/6vifriCFtRy6y9oxhCinFiUUp134RSeqOXV9ZSAcmUZG2dm2ZWF4D9LAJZ1PZg7Z9d2m7cdjAKC1p1FEbasamIJWZ84VXcPnF3d78G24U84qp4EDmwXQPGxVwl/IWwDsFyWTGYoCrW2xBBXyytSS4jWmJ3PEFQPWgtmIIw09CP5Z+VNJS5+gZ4YwBVC44OmAgjbkaCNlYDiZ3p9h6a+KUjTYGxTR4hy+93Mzc4/Yqve7e09OaSeNzIje3AXLANF2U2/Zya82twiDfj5np2S6p+UI0dOskKwQGxmdmHyqR2ct/9ZA==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	20:kwtDEVQH4QqdpejAgIwcvzrCYb8mA94cbepZaj7V/gcXV56H+KPBYV5qq84PLsiWz5c92XvBZbbKul6gn/4Lmq8hhWcm1oSQ89MTFiDlZ1sAQXUgGLL/zgdiXb9G1sixoAi2EwNatIQVv0fevChEJni1vzbG7VcI2PGabYBdUIKj4fo8zI+pHA2L3AQd7PUxALXPXnMDN/Vrzq1BqXag8mFm/Dm8HA+T6JjGX89RfqNm8vQ7MFtx6IU3SEXcxZBL78/XslFPVKW2A+zflxvdPlyyuwbXsZ44/GlDqDKk/tAcmycb97Ag8onshzdNViYhe+HcX8Q3Ua1x91e6PGyJco6UnRJmnZ7c5txQ1koUV5A3N9kRuE7zLOJ5bM5u0Q/R+r4kZ12spFsaiXEfVOM4fZ/AQa4ozAU3Sk9Gqu4jhjc=
X-Microsoft-Antispam-PRVS: <DM5PR0101MB2940B7BA8C72C54F11FF502EABDD0@DM5PR0101MB2940.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(3002001)(10201501046)(6041248)(20161123560025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2940; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2940;
	4:jjJmvya9P0hAJKploLKJ/fbGhexgok4zP19O?=
	=?Windows-1252?Q?i1kHr4/ehC7Kof6Znw45DiMu8ZXKll2WE8q6MFaUj1Akybtk4m2kqwtM?=
	=?Windows-1252?Q?kIKQqHlKY+bcTXp2L6eeSx3DF88SGBWo8+eD2QJVTx5HZYjanNvnRwd7?=
	=?Windows-1252?Q?62Gpcu1QCuemcGoHAqx62ajvB4XoUTpWlCeeGIicAqm9mLwXZFkJjCgf?=
	=?Windows-1252?Q?qi1LUjhqaksHqNWkhV4ec5nrgPvcGlMpyuI9kR9PdbAn+UJIbT/cCMlp?=
	=?Windows-1252?Q?Wt9SvPN26yAdn3JFs/EAfS78JV0afe9DCVVFzST5qfcN0IUpy+aGliiV?=
	=?Windows-1252?Q?S4RCwYa1LNAanz3aesnJoE1F6Wyjl0Ymwp5woJGvBfHOEtkzNltAnG/P?=
	=?Windows-1252?Q?wJuoMuhuRpOGjT1KfuP7bFwy5FHmIJYPE/WUgPGD6kE7xfgmM6BSzHcs?=
	=?Windows-1252?Q?4svTKAAeMfQZWkopVKC8JYSnIIqZfE/II1jgaDSeiq+nxKC4IMjYtlM5?=
	=?Windows-1252?Q?3Q4EW7m2covRQHJIVqPlX5PNXnD2ks3QlA2FZ2VJ/fZUCKx9m5LZF9aq?=
	=?Windows-1252?Q?qT9FLxqi1lGnTfPt0TD6IklfaS55tXilcHyvB4IkUbCZFU/pTL6nViZJ?=
	=?Windows-1252?Q?rHYKujGoOPm6PGUFapTI5EXOKL1Q9Z4uhfZm+8LR6QsZbXegNBSzI96s?=
	=?Windows-1252?Q?+GK817ivV9SwGbBS/OztCopDUfIN1LUvxN0RlehvpKl+2b0QbXd5CVq0?=
	=?Windows-1252?Q?tAe/usbymrqqccvzNg3FCFzEBP6h3UHqFvuammAhc9rOZSL+HtC2aVSb?=
	=?Windows-1252?Q?5cl5I2jeCgMat6PQByOse0UYVSmsp2vsDZSfnmOjt7wkQKhSzRZcQhf0?=
	=?Windows-1252?Q?XTGIgZTa7w66fMxmP+HolgIj2EKYGctPq4uazJ6HeGegkEfpo2N9ZnIy?=
	=?Windows-1252?Q?g5nLyjfbEdZe35frxeTf+Oo8lU+OvMkspQqiFiGyYvZtnwEoXzJlsd+9?=
	=?Windows-1252?Q?J+74Mh6B6vyQ4QRcOjsqOZH5txuADBi3n8/u9NMlaV9YxFGA8RqlaHxS?=
	=?Windows-1252?Q?4/fVOpE4iWnvBgMjJt2ZdGBWJmjOJZwuwa7jJUFre5zYVb94paLUedMD?=
	=?Windows-1252?Q?OOGB1xw2WndOUFU0++FhI1RkFm4zXWCEkNc4pmpGWzK1T21B5+9TeZX5?=
	=?Windows-1252?Q?joLIc9107g7oZzT2PUEhDudbUwm5D1vidHRGt7ji5yeOGwlPuN71b9l5?=
	=?Windows-1252?Q?/F0rIkNgdQT8DSoU+1Dqq+bLdp3czlmN6ktP3oJWEHO2J5vRBvYKHAzH?=
	=?Windows-1252?Q?nFCo?=
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39410400002)(39450400003)(39400400002)(39830400002)(377454003)(24454002)(229853002)(65956001)(66066001)(6246003)(6666003)(8676002)(31696002)(53936002)(47776003)(65806001)(3846002)(189998001)(64126003)(6116002)(2906002)(36756003)(2950100002)(4326008)(77096006)(90366009)(50466002)(81166006)(6306002)(6486002)(110136004)(86362001)(4001350100001)(33646002)(31686004)(7736002)(76176999)(54356999)(50986999)(230700001)(478600001)(83506001)(38730400002)(23746002)(65826007)(5660300001)(305945005)(966005)(53546010)(42186005)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2940; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2940;
	23:bou1vGhRKRtC1sEZamd15A+BGfXR7WjZU6H?=
	=?Windows-1252?Q?Vje3GF8j8rUclZILN/Q78IAoS33IAR7ebcXYZhHvHSMZGtG9Woh73V7T?=
	=?Windows-1252?Q?sHpqNWIHu89PsLTBcYcSkdPpOWL6x/MQNiZX1h1ohfgO1nb3lqRkAFwk?=
	=?Windows-1252?Q?QZbkN7alfv8Jjuo6tK+hI4v5/29XhoKaYmSKOhNo/6S7AF6VXy/3p9Yl?=
	=?Windows-1252?Q?x1TU7gm06/0Oj3ndTd/Evh/YFeCmZo0jNPI6JZhfCeKXDBrb27xD1ZIn?=
	=?Windows-1252?Q?sg5xhWnWHYPDKLYP57UYV0ko0P8jlXgPfnDUI1rsoVY4+S+2/miReOuO?=
	=?Windows-1252?Q?OkTp4VBPkH9CkbnIgW/cKBr0ZV2J3p1c1vSEqBLkOpyfKr4YfHRxfVrc?=
	=?Windows-1252?Q?MHlHAr+zz/pwclTVj/k7O3qgTjBBuWwFx7tyvWhhZi0t4A5AbM9Uv+IZ?=
	=?Windows-1252?Q?lvQWdewar/bF7NouvnBEvkqB4YD4kA4TWUpDeq+BfXKqPHee3A2hUE2r?=
	=?Windows-1252?Q?DuQqLi5/xCfccojXnZoc4opRIqpoCXtRHJ82aflLzm86sdgLLVKlPjz/?=
	=?Windows-1252?Q?Zg/azg1XJF7lGN1N6rT3LsTSRpWwWOwqWb/ivCjj7uYfUQwYrtKWkFjH?=
	=?Windows-1252?Q?QYgCKQ0miKGRx4nJ12vZ7Jcr5bEQ96RyUBCVNu48eQMitpr76Gd6AwW4?=
	=?Windows-1252?Q?QuG2HStlfV8Pw/dIpyLKBudt3HbVJslHJ1XhCNzz0Kx9715rfxmGaE5Q?=
	=?Windows-1252?Q?6cBo7COIG79ZJor1Dx4Nhjj25zIkufXEvC1Au3MffB/HEA+BS1wW2TiO?=
	=?Windows-1252?Q?tZ4Ms1ODKCuK7MOA4ueJMV9Dw7dPlCumSGk9nFzriSvRGbx/GIVxJGYA?=
	=?Windows-1252?Q?SGn2Smn1qn1dGK1rzsRyYM18GhicUC4zTYzNnaSHtQMq7N+11RH6iLvf?=
	=?Windows-1252?Q?phtlEsIAfvJ9j8SRMOo1TlUF3/rQvZ6vMuXicU0q1E1c4cFS3kL4JTRr?=
	=?Windows-1252?Q?c+K3rOQFi2rZgEC+Wetaoa7pYXsKH9nPW8HN2lIpNuCz4h4U+XeKgSRV?=
	=?Windows-1252?Q?ECjShZjljiyhF2gmBWig6k5w6y1ue00gz/c02sAzxpIie7hGYjf9Ti7H?=
	=?Windows-1252?Q?cvM+cMHsBKrvceDZ06ZkDgvlmgNyxNS4z7fLlyHCvgx8OFLUMglLygjP?=
	=?Windows-1252?Q?C1q5FNSpgVv1Sr/BLN5YSU+w3VWRswBprGQLjheZWk3YOzYIUwJvj2dU?=
	=?Windows-1252?Q?ONwweteMQKa4i2d9mwZLttPFJRGP7EdZYRqcvME7XcAnzrBv+5Cr6EgX?=
	=?Windows-1252?Q?S6Jxkey9MZytkapvu7ICFoKYQXp50YTZzYa5sZYZmlC3jFhENPEEvX6v?=
	=?Windows-1252?Q?x/6eA+l76fAWi7lz6VexvpY8LsYXQhQ47moWVpSMwG7djzNMkmdhxARg?=
	=?Windows-1252?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2940;
	6:leg3R9rI83cdjVbW5KyEANqa4Gvhty3hcNVR?=
	=?Windows-1252?Q?654kAlsyr2gKzdZ/JCwHHoLF7FvWokWY8W6dxNcRjs2Y34iq7qEGT6mz?=
	=?Windows-1252?Q?Ul2abqYtZUvMKyjx8xG0cVm5iA/C1b5d5vcJiIHjR9MD5lyt1upRcjUv?=
	=?Windows-1252?Q?Erpwcpb0yMW3KhEMYxxt8Nt/hl/5kWONri7mH9UUqPPUhi8Bd/EKssip?=
	=?Windows-1252?Q?/lsm75qHdQ3Rs5lab2snA4kDo7YgjDU4y02+X3vwbU22bcoD4wlz8tTe?=
	=?Windows-1252?Q?BNztd2gSJ9bs5YVfm1GjTwOYWheAWVnvjD3CVFzqlsxUFUUSuqdH77zq?=
	=?Windows-1252?Q?wZpKhSuwU7W+iZy8M5xSTvWrr/idMmntm6HsetvM2iLfaNYKjWhpxh4L?=
	=?Windows-1252?Q?sz/5LZH2TcgtSui/RiTDZ6hR8RwMHJkdPOktiaoYhybKT3oc6TQXYTL2?=
	=?Windows-1252?Q?jMPnhljs9AU1L1dKK683EYdP2zn0Kkr5+pclQ3Q5IlK8aI2NwqJEM/Rj?=
	=?Windows-1252?Q?6U9Ek6STjaZco9V5UqztIoWdHE32btwCVrbrLZ5Lu2tY2A2UyvIqYB4W?=
	=?Windows-1252?Q?m29uY8T/AHINy8yg5yteBWgNdUdhMo5jNhAxUbCDVvEvEIcv3yA3Y9gP?=
	=?Windows-1252?Q?r1mE2v9wEApmSZ+/elucjCQ/WG/GZad/T8V3vvlyZgR+nDhkUqFe7uDV?=
	=?Windows-1252?Q?knEidQ/lxA+BSYEiNjO7Fyc0czl+o5HMfedk0yWiGPG8czLl4eLsboTe?=
	=?Windows-1252?Q?s76Sm1nOJI5LoNCl45txTw7R3XzLPUnhksyKDShDBGWAH3iKrJ5EEnpD?=
	=?Windows-1252?Q?WRC94cg8aKn5E5fyzXB7f4T7f3p00fDYqPxgwyhzs/BoBUM+6psGau0D?=
	=?Windows-1252?Q?fzu0FhVVdKT9yEStt5fypsjbHqR1CY3wsJf9vWjsZCZwUgRb4pzLj7HF?=
	=?Windows-1252?Q?S2enRoxvfJGX184NyjTUSFu++mXOI7YZmzqasvrrt5GCK7WbPArp6La0?=
	=?Windows-1252?Q?I3+ChjIrDzFoXIjUqLUCaQNzQFfWlIteUzFeQPZIcQNJ8UEVCo9x1cCK?=
	=?Windows-1252?Q?qwYKtIlfs+5x/Ug=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	5:s09ZbHWYidJw2V3syjKp53g9CA3xj0+pkrRMTu+XvyL1WAQDYs+km9BWRM9xXoe3WwQ2tmIec2Ka2VeeGfg5hoJNow/PAP0SKplp0pKJ8SPSr5wYSBBCiu4G79qoOF8twaUz+3NjB4I+p0fJj1/URxC7Bfzu9yq7Wr0h9U1u5+Th2IWf77vpCQKyeSX5J9bzs+HnW0CjZs17kAIqdx66FG36ztY/zvtFCQ01lqpqH4nJE6KEytoowyDOCvAzXvBWjvk33wiWBpo2w7B76jCx+NnT7NxLnNXXmQ4E/1B4QTDSo5iOpi2eC2pr6xXvjg/QRF6QHTOJp/OGIf+pC3uudQnraDuudTlgq7vp8ZQfiyvKo1pdk/KA//N9TaYg4uflPOtVxOxstZ/q3D06iqgV25DSPN/zHPgA1x4x21UIah40CIwiuK6WuNMrV8vDOwXNCYvrKqzkj2Jbapn6cNrXbFtD8BsTcAv6/TG/FqB2V1sLCNTu+KBZtLLDXUxdj05K;
	24:56mrBilpAYB9GFXgLN/aay+Cn42qOHLRiDAajW2Pbf3fZPgeNlv1p7L9lkKSeR658QzQhzc0xsIHD4fkznzXLMPvsnNMQsAOjbeuvHEdE0o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	7:VQD2h+jjcl+hRTbjisauWfq6Ll5pEX9opjR+r3P59YWfspUenAJGcZxLHdr9gtSkYUrDYMCEgA5bqdlZbIqPCbP4AcG8X8TqB3jGLOoBDXNx0OaWdTFLWa8aLvG7v3drMsbTbMbVlBGRO/gi9+aRl+EMjZ1hRZb6/LP28rRyck2FT2N756PqB5ZLhQoYxPixxJV+GOUydMQpg9dnHWPtQo6z57cjUAvNCyaMBcH2cnHlwcwi9HOcSUN9/d4aPbNYS1GRU7uryYhCbiHswlXJIeJVjkqo9M5e2r7ZXhuwxqy8WU0gkRygHmvl6TjCzeK3Ne5LIL7mpjOzluIfoaYRxivL+gsIcq5wIPE01tNhQRoAGGT/8FhsvhgNoUtLMys/XLOFun1SFumbogAseclcQbDP34PFUP6o52lSEptZ5XVv+cPKBUR2bwcKRm7krX8N5DnmU1TovOCm4HpHMM20EdJRQRj+0gjY4ZHNxQXzOvZR2jzfRkn39xefBekVBGP+ZVlHTSUVdJg1KlvTMpgPjzOZV1XzAmWSzCEso5A9MsigYdc8rCMXu7JzaOPUU0uVGJGI4+F7yhAzLCpSiX980gH8rXbIErMmzorPlTMYJd7XI9FFqvLj1KKGf+Yauf7dQ7p4c0hcYzmJBDTEQKl7JK4HueAG/P6BFGB/mEUVYKJK9H65K+hL6CODOkWNzSJPXUq9ph8C9VLUSKbz/YYK1WCq1FskAW3D4E78ZX0D00tvnVBCEG+iF4yAHgBRf5jcNR4UDnbf2fdX+T/aW2RueFqntgXy7Inz+iLpoF5grDE=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2017 18:06:34.7300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2940
Subject: Re: [morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Wed, 28 Jun 2017 18:06:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/26/2017 12:03 AM, Mirza Krak wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Fixes
> | /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 against undefined symbol `OPENSSL_ia32cap_P' can not be used when making a shared object; recompile with -fPIC
> | /usr/bin/ld: final link failed: Bad value
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
> Signed-off-by: Mirza Krak <mirza.krak@endian.se>
> ---
>
> I hit the same compiler error as in above commit message when running on morty branch.
>
> I simply cherry-picked that fix in to morty branch. I looked in the git log of oe-core and it seems to me that it shall be ok to do that?
>
> This is a re-send since I messed up Subject the first time around [1]
>

I want to put in my $0.02 that I have hit the same issue and would also 
like the fix to be cherry-picked into morty. I tested and agree that it 
seems to work with no issue.

> [1]. http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136489.html
>
>  meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
> index 9a7cdedd05..b6fb126349 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
> @@ -5,6 +5,7 @@ require openssl.inc
>  DEPENDS += "cryptodev-linux"
>
>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> +CFLAG_append_class-native = " -fPIC"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>
> --
> 2.13.0
>

