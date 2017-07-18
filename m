Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0041.outbound.protection.outlook.com
	[104.47.37.41])
	by mail.openembedded.org (Postfix) with ESMTP id 94AF077FC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ox7/U9QWW6Co/8j9x/eRiSwb8Z7QooId7dB13RpOQMk=;
	b=q/o9NMTKcmxFtIpbHNsh/nAghNhi/GLMvisYpZ093/M3drIQdDseCIWhc/J3tOI3/ljJAMTA9HnIlTC0nLNSPtUk8uMd5KIGQrWa/j6whDvd/M5QwZcu7lsvKRSqa1+iC9KBt53XZdhunzMBDfxqy0Zq4+3p6YO3BGnnngpTNPo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Tue, 18 Jul 2017 18:47:34 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 11:46:54 -0700
Message-Id: <20170718184654.3911-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR2201CA0042.namprd22.prod.outlook.com (10.174.180.159)
	To BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d63615f-b3cc-466b-8d28-08d4ce0d743a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR0101MB2930; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	3:JmithS2e6wxwn8SMty5IwRVuYXF8iIO93Rnj/Jh+Y8MflrFqDstzVLuzrObYYxDtshsVSdQY0xauS8TO1kvVjKU3Sa2pxRGfiKpPlS8r5pX58phOrEz1ZQfgXQpXZJ5KNAXrcjWjmD53AFkJO/pLnuJnVIgfRccUJir7uqLQTabRAW253U77fTKSzxr1XTeoCGGIZI5bCKylvurq6gWENOaofp8wU7TEauDBhagE4zweVcVGmRlaWefnJcu9XkMOPiwUaQWQHt6h5qmuiyOrvCoi9n2bnmnY6L41be9OCeXoJDLAhrMej4q8hYFWbwD+U82HE4WOTknINECsnz+FV79T7FCv5m9hiLbYQ37d+Zepgwj5BNt/iE/6KVHo2oznpMpdla2GuAgYKDaumT/vlTzrR5U06kMR6ab6kUQPBrXmAzWs0XTxy1X6t/HLcszDm65ZFRM9XHDKEgfqvwkBOc91VRdgB8bogPtaEf+Er0kmMoZ+WX5sXCjkXA2ZZE1TatrMOfTWv+OTafKNaIJmSdjOZ+kMaTb078R3T08OZSLT3A16nxYDZGZr8uwFZAU5dBGxsF4WLRWkfqs49wwMvjoX7z9AqblZy/HCM/+XBu0713zImh9E3dFdWcMRpNhUlBBywGwZ+ppzrFvXhjQv7FoTBtzUg+Vh8AkiXdF4RuSV2f7BL/C49+i5haTODCP0zS/JEV0D/HieffSOkV/RCHe9XeofDMvLIxYoLHMOyEA=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2930:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	25:hmUgSo8dFIf+qdty5Tuza3kcHjMZOqrVapD2soUryWGMdl1tD8bm+7jLrN965DgHQy/zFNE0NqsyOHf0jMawZ4tXfdfH41QYOhtPib/O1R2rAKbOddx28Fn0i8fejknM8/4vgcuu0kIYn1M3UmskHKzy0UxAz3loXy25ZxriX9O7TSYdN19rQu1FOsbm61FmERsfs+22n772/Oqoprj0AnMR4y7whkoxESJkpbKbv+ELs+kOPdqaqYqiKnXPgmVfiG4g1vYBdIsRoHyCapqMYl1l0tmMvGY3iTkgxyhkcILjJoqoWDsmxJGwBVTL/pbrK1eJgYtW/NzlFk6JVHT2qYMg6dIPHfShkvqIJkDg7yoOAGYy+Kt5yK84t9iiIVG3JfGQGPu0E0K79ZY1OfXPussxARo041UwPXDNfzIJNAqz02slO5lEwnHHTlrQLPWcrG0Y1fcNLQp7m8iUgBILtaUNz1klRKr2ox2zjNB4/sgGgjtISJ4VaM7wXfzcgsVHx5nenTLStcQ4FrjR0uplgU8fs4xa4reKZOUN1xpvZKE5IEtuPfglEhG5TRFSylMe+JHaUlpYKaX0SLB79oFt04GmueGiEBIFHM9wzCn6/NSrg4FR/wBgkuWkyIoDkWI1mjfGiW7ooAE4uUfzVMtm0/hfv+y915AkTC203NnyjcnzjEqYd4NC57lB0LqOkaAC+LIKp66vgU+6ynaaMNHoGbEDIFpwTqBWpbg06IUCtRSgzpEx755OhVNIzcVJle1KUPXjBco9ztymDspEIOQTXp8qaXCk6AN5gmRUBbv5FvSIaSj0EbFRuNe0vNffEeIzF86QLqKRytA8zGLdm7hpOceIbFItrrPczU+VeCDnh+4E+7fcL0/soz9ysvfVoaKXmwxogepiZBVTWK412Ziapi/mEkk42/6RmskyFOCmSOI=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	31:WQqZPNmp3WZODKZDaTR/5o47rC0JKbrdX6M7XO3XpnKQr+Jq6zc6rQNWQF+ql2bqFC8eKbxHeKO9Zj/YghM+rl6T23EYI9w+2WGFE9bKDj2acyCKy5AzC1rkapZZy628F0Bjl/9E0Ty/GnIxl/gF0FjtyXWtfZjVs8BSefxJ721+COBBEmx0HFptwEizSImZBWI/gs9+du9g89PpwIDc3+2uAW6c5pcwTxg0DfaTgLorqKDHcluVqU5lEi6HxKM5YxgXtWKN9eKr28R8liaI5VeSUjzhEa3bnSONEvn3tLfae20+b2ku/J4C+Y/pRNiw23NHq6tlVICJqXdoCwxv17muElcsCi1kSEVMlsOFBkhvi9V4Qp1nNrUx4qgJYPbi9p+2pxstmUtQfh5vd7mCckMGbVe9WNEo0VXK+oTvqTo8ouG6WY2BWcXjWPsE0flhsug/Ux92K4qaJ4XSLjkgXgYJZVGckwKAkByhPumBarE+yAvYR4SJvxRb62NUG6P2rKhZN+yMDS56XoVpN1zfVzKyNpBaBy9Eb6PAZbMaC3fdy6FR/bZGKRFcWN/uVdS/re6L+PIiqz7ssN7koh1LBI9UnUyj3IzFaww63nGNGlXwodrDv7YTy6fDmP46bxo+GYbh+gEgREO8K8usv3Pt1eWEXqqvGR7UdU6i5yzUXls=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	20:675OJvbiXZIZjFeE+8aM/x1J0GBW/VV4mVMwJL/iVEzbUHV1E95y4SzgEGPKS443pMFBedRpETt4fpddqvmNOgkIY9YtzLGkK2eW2YlLJZKIfWhaU/mZ43qs8IWual82esDNw6HLB+78SvCDcuDjCvRSWXpcfVJuZ3E+XGOLKPF+ZDCwi5kzr84yTw4sQTAaXq9+P9RnhIPGmpmvImzaFFeklS4e4d7hhp0myDHvvqP0zSlpXMuvrefgvvGgRVSeFZ0nzZHKIM0sVSKBZ4iIByykod8oLjDfrOV9ZrS+YUEhvuClg1OHimorpc0BGlulkKJLXr2W2Aik7wooP98sXKqLoHRPKz27xj6NPTtG0J2P5LhLxkkKdzCL312GxPXOS6oztuAhMY4lENHo0DboQceXde7ijsSoYxyQ31VBUic=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(148574349560750);
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2930F9D52AE65E48BEB53760ABA10@BN6PR0101MB2930.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(2017060910075)(5005006)(10201501046)(100000703101)(100105400095)(3002001)(93006095)(93001095)(6041248)(20161123555025)(20161123560025)(20161123558100)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2930; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2930; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2930;
	4:bEpgao3FKkx8ou7IE768PcVJNY2suP8JG/FuB+WT?=
	=?us-ascii?Q?LgAz6Jl+7GlcenShedN7ZOlOS8FMThqp4wLuNcROc7FKI4VJx3/h5Kw9EkOZ?=
	=?us-ascii?Q?5BCuIWLK5BShVPh6KfNd1R8E/8k90zU4L+yVNUS2fIEsvH4efk54bEmDUPF2?=
	=?us-ascii?Q?xIScq6V58GmY4D7ooTTTzytCtsl07tZ2gBexW6GFFD7ixjZE8e/V9NZJrjCT?=
	=?us-ascii?Q?ym9/rJUBbn8dflYX7MuhzdagENoSOkRVnxNXOJY3YDWo6MGVf1LnEQHCHFVK?=
	=?us-ascii?Q?t7Pzkhzvr4Xo3Qjz2DoalHd2vR9WGubT7QPcCmQrCgA8Xd0/MPtuD4YKRyaK?=
	=?us-ascii?Q?cxVDRzMS7WKU2hHTPsaA2oTKYxaPCw3IFGIl9Xsm5EwG5cyv5mFV8xnAufmh?=
	=?us-ascii?Q?VY2/EMjRUre1sj6RunG0gCd+ClFViYUuZlkJczDsjY7qCUg6HlIK+IVUf4aq?=
	=?us-ascii?Q?epHHl2IVNLZQL3ustqLTD1DY+6h3WEL8UZaz5XPMo0FJyHniHZTzvhplnX/+?=
	=?us-ascii?Q?ErdUV1p5Cltu/44bMY+oX+6IxJlt/c7rkIDFIVLFNwFFCnAN60f+VgXWkJbO?=
	=?us-ascii?Q?vujxX68/+qmtat0Ze973vxw33dpjkbY2AJ5ItgZYtDeSFfNK8pLErbyjzZ9n?=
	=?us-ascii?Q?YTq+Y4cMCWkSslyFrAkBicdc/GxIl1KuRWDb+PnwhLXta8M/G70hXPPY49Hq?=
	=?us-ascii?Q?gup44WHR2oY9eUp/mRxiHyBT4XClrjXqLpZMy+OPHuqxumw/4hhSuIIvjQoF?=
	=?us-ascii?Q?gvwTkR2uLfYwC9htMGeztp6xjVbNB+2DeSu+OHU0MP+FB+jIF3IlKV3nwjsd?=
	=?us-ascii?Q?CScvdq8scjXW9yDQ7Ll98vFFt4QRjoQINdOKweFJAFOZwtbmfEUPMMD9l7ix?=
	=?us-ascii?Q?sOwWDOf7fPFjR6oQfFGwcDdQw//K6JDdAoN86EHR2YfA9BiZxWiUNUfIgMXt?=
	=?us-ascii?Q?cInjMho5GknrQbTwxeAH2+zfxmDS6fmGaJU/bPr0Tgz+JpaVs0RhFFYdl3vJ?=
	=?us-ascii?Q?s6COTwYv4IOi6wDZmxfyP98lrAy3H2pVFMF/24r762qD/OaKQeZ4DpBLwBbT?=
	=?us-ascii?Q?mLEECKjZufhED37+2YIbLYC1OAwfqxDdudlKN8ad7/IAqJ/zcIsKwdE15rEP?=
	=?us-ascii?Q?jPbCqA9niYSFK+YG1FXsdJ14wqPnkBz4KKfBFOzEHMlhfHeaboy7BO5G0pCh?=
	=?us-ascii?Q?+RI/obssCAuQgWzOuTbGdTcuw/6xDcYDwe9Ko4dQ+LXdw7l04DvSuPLMBZo+?=
	=?us-ascii?Q?mCDTFQHhVlmYvU5Tt3A=3D?=
X-Forefront-PRVS: 037291602B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(6009001)(39410400002)(39830400002)(39400400002)(39450400003)(575784001)(2361001)(36756003)(1076002)(6506006)(6486002)(6666003)(3846002)(6116002)(33646002)(86362001)(189998001)(2906002)(53416004)(42186005)(47776003)(50986999)(2351001)(5660300001)(50466002)(478600001)(7736002)(50226002)(48376002)(53936002)(107886003)(66066001)(966005)(305945005)(110136004)(5003940100001)(25786009)(6512007)(38730400002)(6306002)(54906002)(4326008)(7350300001)(6916009)(8676002)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2930;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2930;
	23:TWAjfLAvnlWjBJuPN87oiHeMeLdsOEDy5qdVk0E?=
	=?us-ascii?Q?nbu5W7vxw49+lM7ME2bOkn4l8zRd3xUmmMjfA8vxzElFzdMVrUMQcl3qKSNg?=
	=?us-ascii?Q?M7BHcdc2qY54WjRyov5Vy7I875qr5oDlGZbe1aJXY7a2x+cL1nLdF0grx1wk?=
	=?us-ascii?Q?TzrZJ3JDr0p15j7lzC2i8xvgLNULHukWhZfzjifpmuKooV534S42hCx8MAXs?=
	=?us-ascii?Q?PmuTL560Al/hGNrMfu9f0CFpJO3UJE+I2PvjeLtkr8xy9HoG6kf/NvdoxQWN?=
	=?us-ascii?Q?TAkI/wMksmDQDivrFS1wpcAQU6abAmgaZwBV5KXDHXVp30/WP/AhwVdxREPf?=
	=?us-ascii?Q?xST+aH1LeHM5St5jm8TNCYRLI5rL7Dh9tfTFK0FiKaL68QDKL6weOxEulJDz?=
	=?us-ascii?Q?2ZXbDGBgQ6oJtWegj5xtZFASnPJp+VfakNB8n7vSm2tbVKdILluL3eZzzeqt?=
	=?us-ascii?Q?mSDwjYl500LlF4SGVcIfuHSCV6sVjF+1+rXw0KHiHuJIueav9R9uFwDq9ef7?=
	=?us-ascii?Q?BMtrveF9JpuQpX8wAFR2g0IKQ7CerfPVKzCzTu8pdmW+QIBvhu4btoMMkkRq?=
	=?us-ascii?Q?aAcelD8gqbslZWaKnyIrtrly1ZJuXYot1fG9z8wKYxhGWXDE6sNwLjl7Ev81?=
	=?us-ascii?Q?dzHKhCWoMpOKVUnvY8jNdyovynZ93m8d9/bWXkd3CJ0iFSPqCHY/tmKDdmio?=
	=?us-ascii?Q?bvxcA6SDSh5L+hrUe9yyUCFnn1ihS3QLrSIGNBj8hJ/OouXxWneFg9aBKBY4?=
	=?us-ascii?Q?CaxqIZBnzuUmC54/RnV0zW88vC9HwZfwi/7AecqnI4duS1I4hBISKxiUI6Ym?=
	=?us-ascii?Q?ljTeB831yW/kWZ8RdoDVcsnGoaFdT/OVUGxbfA5HW511ciWndAuoQYzPo3hT?=
	=?us-ascii?Q?oIgofFAosLrtbtX957SWBMLzn4vfgLWvQoRPnJ0LNTAXSN728DlL63lKlhbO?=
	=?us-ascii?Q?XpR9pKLsJA3T+NQ+5g3ryVlaEvPRiEgSDYeHc806Vyi2mGK+nqz+4lnhdU6c?=
	=?us-ascii?Q?tQW1PhQ+ZpfKCrs5eY3M1B5mTbGDecIsVxjQKd+49hnFDt3R0xyoRkqhIQtW?=
	=?us-ascii?Q?+kBG+lYPzvlbfr/L9Oo+ifg9Z+MkhcRVPcGHu9cHwCymiloCHJI90xo2mjb3?=
	=?us-ascii?Q?Rft99swyyeTY6uD71qYukcxvcMmqF5F0LLXLytMfyIzvtNOQ6aCVNTTEYSe0?=
	=?us-ascii?Q?b8Z9m+OlX0gIMtdU=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2930;
	6:1bbF/Xj2tPWbEAo+ScnaFOA0MhwzKFodbVsodvb+?=
	=?us-ascii?Q?EAOLQ8oBIfU6dt4DwOaYPH+rqHs9sNJCHDsFbvKpdiMpZM/GPATUANGIvhB9?=
	=?us-ascii?Q?dWyPO3fbmiHZ2v4pEJycN1FAp+pw2dbG4TglCnggt8A015uFdqrqYYepQHtC?=
	=?us-ascii?Q?ykKt4Rzk22/ICIBUD6SF91XbYSTR94mtkcFxqCedMblIpv7IFiRoG17lJceZ?=
	=?us-ascii?Q?+xJ/y+miSr/QEFNWJWXN3CwbVd0ItTBJp5eWxLkv1ShuoiX8eIP69yidwdBD?=
	=?us-ascii?Q?JU4wd+sa346Z89vt/ZoK32m2kDaM4M/BTAiGXIENI9h7nDKXqZWcK1mVdQh5?=
	=?us-ascii?Q?uFHxdbQiT7H+m1qVdPHjMOt3JG2O5GflTpPfVjWUyEbkXRe37oaaYxk7JQi8?=
	=?us-ascii?Q?FpMdcHIy8pDQLkR85SXBIec3klKBGtcfeMvcUU5jqxY7g29MJ7LS49enbice?=
	=?us-ascii?Q?lNzu72HZ0Wi/H5ONkAiE4ilxMFFa0VNAvR/8YUx5nAAxpCyKsbLKEXUHwkoA?=
	=?us-ascii?Q?JdXNwE25pf+EG5wbJfE4FpFNYJcwlb0dmiXWk73PPrHMSM1TAqmebHSaxm6v?=
	=?us-ascii?Q?rr/Ygvo37C6hJ6buXPN3+w36mQFn9RkVYhpQsAMn9U0V/bgDGvGWVXnOsja6?=
	=?us-ascii?Q?v/m1FU1rLCzpZnp5MU6sGMDKQG2HQ+EvhMmyu2Dvl8ysYDb3+VyEXeuvSdZz?=
	=?us-ascii?Q?XX1/STcKZ3dTwJAMCcSJ1yc68pLgvGm6BCCHlv3eJiBaZF6Whom816Ug230z?=
	=?us-ascii?Q?qjNwIJUDna7dpvdHP9WpVkIlMqUt8//boU1pfaz0K27em/byQJLGEAWw+sp2?=
	=?us-ascii?Q?Om2KMX01czHbjZSIItqBJbDMqD36vfSTeVeG9zzVsua21ghozNhAgZHq+PYO?=
	=?us-ascii?Q?Pg/g0iXY2syTe6cR39ecnwyHmT3+mlLhnWC7ewrs8vqGyyB94JBf4gU+mp8h?=
	=?us-ascii?Q?P3dly7SXu70si9SiVijgMWq3LSzb+Br4FCr5GvDiQbweUCnjfrCFUuETNdTS?=
	=?us-ascii?Q?UKQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	5:t0X7VxxXvwLVM+PSK69odtgc/ADItbvnJ6clrdP7SDCuPb7SSml8Y7g5c/ubSswoU+fPjPLzXVzx1OBnhxiY1oZWcs2vDwgWbBvrr6F3gBi5UBBWhThDGqaKp+biEJrN4CtUKPTuFb7w/3fm5mYbU9Yp30+TXXA161B/V+5RZe5yBj156jPg/nnvVue8mzf+eWJx8zDcS1EbnLDtmpHjtY+3J2AgXpSm+WWqME+izwPUsnmkLxBjOF7+/cmVVvutQJWHWWHrO3SYMMw9NuiXt7OvTUXqn/xymjs226xaEw4DIkcQg/k24HXVZqqxF2jnEk6yf7kmX9Wwf51/QJ7TqBXILvNKi5q8l8NyV9lWM1yEEjka43xa7Ad6DSW/E+RronhrEKw2ARJiFdD7n1T8hxeUVyVp/gprmUx5VSlxjfBfHKfGtZqsH2+mypMKwusgPHQBvQOoZ0pPDfKt+L20J/ZnxQKsKWBFQaG8aqsA+0XnC7+SRED6ohqLbmfLUjs0;
	24:rhxjlFV0XCnN3qAexE6ZoBZVbLld5vRih556NZEFwObYeU9byNdjSeAHvZPvDdWa216IEpe2iK3OMR/WJPhVG8pzDhNol4VL+Dr2wZ/tc6A=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	7:ZOLRAouc6VtLNRknLd9YrmGD6cNh7Th9W9F4OryEjRiIFXf+M6tvykKD164lW21D3WA64flxd0IQ6wrTRjkT3VFU8n6B1kCzCrB3HmvsYkRjtGwB0zaT50xoQFlnyutS0K8nLVwjBCZ699KFvZgO3JPp1qrS3KfQy1iN+5tM8SXed/Iw3ebSRhl5vXvYNWaXRUtoD7fgyEMkrqmH60ErvSj4VxDkNU1bN9LtPYSWwOC9LwHgCGZzWBd7X3HWAlNssPjd1DbbotgzsoAWzu1VvYSLj8KyS5zBlJN3WHPj9fbZ9YBDbnSOwEK5wfkjhw/oLo04cIqAWARWvVksAPTI8778wLjTxm9pnBVG55F5zM0Ic7zmWhgiTaT8leyE//4AFrJuBJYgNNc8Yvmh0uwozAiAVAnbL2J+ifViip7kzlNwq+Rxwk35cvGbz0Y64Lvdn6oDzzilkVGNAQ2ZXCLFwV2PEMCwj0XsHaMiu73KxjZ0yVpuCfAQ9xIF9ULVvwvUSgSwg7B3JxGsTy79kHsoHTQzHe0a8cKpXeLRkMVhpxi/Id4XFsmVzofEhJQ5DVL84dC2TbvM3D8UPRqCxiyRK8NVZmHSSkuBCSOXaIWBRx0jgBgCT+cooaVBgBgXCDBNWbaUYukMRTB8lAHD0S0DmyvYST2dS3X9vcgmoi9AnF76yz4Nyu9G8ETfTGbl9iN+xNBNh54374/bVHYHPSbpVm2Cgyg+4NSr93JytQT7IUv4safkTKJPcMet+yj7uPYeGexoSq8oDsfYj4mEY9j5hQ8n4L8p6pTDnaPPkcx9FC4=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2017 18:47:34.0661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2930
Subject: [PATCH v2] gstreamer1.0-python: add new recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 18:47:35 -0000
Content-Type: text/plain

Previously, we had a gst-python recipe, but it supported only GStreamer
0.1. After GStreamer switched the Python bindings to use GObject
introspection, we were no longer able to build the bindings, and they
were dropped in this patch:

https://patchwork.openembedded.org/patch/93793/

However, at this point, we have a gobject-introspection class, so we can
use the bindings again, this time with GStreamer 1.0.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../gstreamer/gstreamer1.0-python.inc              | 35 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-python_1.10.4.bb        |  7 +++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
new file mode 100644
index 0000000000..961b93017e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
@@ -0,0 +1,35 @@
+SUMMARY = "Python bindings for GStreamer 1.0"
+HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
+SECTION = "multimedia"
+LICENSE = "LGPLv2.1"
+
+DEPENDS = "gstreamer1.0 python3-pygobject"
+RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
+
+PNREAL = "gst-python"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+
+S = "${WORKDIR}/${PNREAL}-${PV}"
+
+inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
+
+do_install_append() {
+    # gstpythonplugin hardcodes the location of the libpython from the build
+    # workspace and then fails at runtime. We can override it using
+    # --with-libpython-dir=${libdir}, but it still fails because it looks for a
+    # symlinked library ending in .so instead of the actually library with
+    # LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use the path
+    # we want, it will break again if the library version ever changes. We need
+    # to think about the best way of handling this and possibly consult
+    # upstream.
+    #
+    # Note that this particular find line is taken from the Debian packaging for
+    # gst-python1.0.
+    find "${D}" \
+        -name '*.pyc' -o \
+        -name '*.pyo' -o \
+        -name '*.la' -o \
+        -name 'libgstpythonplugin*' \
+        -delete
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
new file mode 100644
index 0000000000..1365f7c6dd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
@@ -0,0 +1,7 @@
+require gstreamer1.0-python.inc
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI[md5sum] = "adcdb74f713e28d0b22a0a1e4f831573"
+SRC_URI[sha256sum] = "59508174b8bc86c05290aa9a7c5d480ac556a6f36306ddbc1d0eacf4f7868212"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
-- 
2.11.0


