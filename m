Return-Path: <Thomas.Thorne@net2edge.com>
X-Greylist: delayed 42011 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Jun 2017 07:30:28 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0106.outbound.protection.outlook.com [104.47.2.106])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCA360068
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=transitionnetworks.onmicrosoft.com; s=selector1-net2edge-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rj3YTQZSgmlYhUyyzXJyg1LW7czXoeBUtsp8Cuvwiqo=;
	b=QwewF/cADAN5xy8cLIssfM95pEWzSDp2huLcTV5GCBcK0dsE2h9xQ/VtUiwf1CT8fZdMIheSxe5SIRhVNTPDdEJfwMgYIWPr1VT2wZSQVqRze+rkEYHfMLwMrGNTGCQJ/kiDHUlfn5pYcyo/MfPRsyL9sJ26XAyraRL/99HU9Qc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=Net2Edge.com;
Received: from [172.16.20.67] (81.128.174.58) by
	VI1PR0701MB1885.eurprd07.prod.outlook.com (2603:10a6:800:39::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.6;
	Fri, 30 Jun 2017 07:30:27 +0000
Reply-To: Thomas.Thorne@Net2Edge.com
To: openembedded-core@lists.openembedded.org
From: "Thomas A. F. Thorne MEng AUS MIET" <Thomas.Thorne@Net2Edge.com>
Organization: Net2Edge Limited
Message-ID: <017fe027-8557-dada-f6f6-e112faee58d4@Net2Edge.com>
Date: Fri, 30 Jun 2017 08:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
X-Originating-IP: [81.128.174.58]
X-ClientProxiedBy: AM4PR0202CA0024.eurprd02.prod.outlook.com
	(2603:10a6:200:89::34) To VI1PR0701MB1885.eurprd07.prod.outlook.com
	(2603:10a6:800:39::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6840fd10-e541-4397-096a-08d4bf89e15e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:VI1PR0701MB1885; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB1885;
	3:fLQmfoVTUOnEeWuEhp1HNmPvls3h34PQGedDPwxLHZc8Dao3QB8eddmLbL27fBTScrOFuCrg2IZoIjnP1soqWPdKwo54xX4fFmxoK9vnX0RWgSueQ6rq5gsI5HZAFu6vHvCsAOC0gOpBBIcugfWu4RK1fmLhEgMqYz9mFQteR1wzpksUbgwXNy8nesNFwHaqAsfQEU9MxPbFZfVLzDdmS0fLwV+Nyg/dTY/FQfXq6YhjLydeQWQFu7v0MFYBuoCCJFRx3z2dMlQl+QYAVDeVPds8WClDn6CHfqc1j2wByAgKy45CRYqTkeRF0gHLOCIX/rltkWhgXsmt/tWA9hdQ/46dHd3uXbq/3e2WQeQ45WOxH3pxnohmR+GYhc/iqAsflhetQu+HwqSq9+ShIe9erBGexrz379xnLBwjnZiQOAbkKH0sBD3X7amLFqnzRA1kL901HnpKDJRTlARl918mj/9wNG4QKegikZ1C287J183UHtc1imZs6RpqfKyD7wuRj4tdPQStOSnsxfbYlaW2PAUc8E/8MVKnjP8IwO9xQMbe54z8vvG9yM+PLkLMzqu6tHo+LFg+ddY5PCFPnREm5i/9wXPnR3+RQxrB9ybG4VXUk2RFfncTVx87SKHugUdDfQ6oD7pj8VssplD7YwM1fFsJAlqr0cITy7swrIoEZ1s8oJO0L54p6vTH81UjPIpWg8T8aP2/1B8+ZaEqUD48Ow==
X-MS-TrafficTypeDiagnostic: VI1PR0701MB1885:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB1885;
	25:QZZqBuUGK1exGc5ONVTDcZ7TmTO89o39vRfZzl4yi0IzpmkJet63kaA25XbBwLv7IfBnDcf/8FTkpofFK1pLmoqh0xeg8BUyMpGQ7+o0eRx61oQyT79HnOLgucIumcCiUKSO0dtMZwMKBrbIpGYb5rlFaX3yroJkW+OnvOPKEggK2peZ5UFV9OUr34W1jfaHffEI7NRda81firQph+R2wvwF3xnV2cO3ZeD8aSrPnxOiZDp7EySSYI70Upive7Q4TcSh8PHAV140X9CeEFh7P57bpFl0A9c/YbL6kADQc2ADOxaD4PWSeNgfQ8/JSPa4qiZQYuRRIVnSQtSsTixBCMW0uOElTwl6O/iNsSeDnOxbdOQ4kdSXA7VXWC1uVi6nilmESeWnb1Fll0XUGeKUiDNwNEbvx1o2zYZ3DFPylDZiGqp4wiDc61xW7fO1zJArPTcFm0sM5WTT0FY4Mh8aXEJldFsGOQ9ZQ3LC388wUeqyb1nzTVk95bcWXvgAPmsnhjWbGalcsuYVrI6FEtEY4+A19oo+nlDjZ15Q0csvfLtq87h1rl+6G6x18pVZ4Ny2d4hrYZAyCF0ztMkWJ+kIeIgJ1oan7Lop0azUwE2gqKV9QbLeJqCO64QzkuOgnSqS809ZKQKyZy1x/923ke+taN2F0YuN+Day6+YbRF2JliMa7otif7ba3cof9ohfqTaqiWtOKHvVQ/94+XwDKy4KipOZYn7Rfsd7Ldk4wqjhjQN4jKkN0CMA+RkGggPVOdKe44QBhdR5RBzyK4bhqCZihJx/Pn3omTegdocO677tpUwYQZlffiOl+lwi3htVCVjMQ7kDWuC5ygtL/B+AWjSZ9nlehz/KfkBbw5ud1GW8q6wJD2ajOy+NGLxda5VnUMVK6OB4NjsBs5kkyRdmqzpS0nulGqHgAHL0RNsfo5AyipI=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB1885;
	31:RLX6TkkWIlWGP4XM/LH1f4Csjf6qTYjr7MTjNA6PfetaQcoi4GZAJNk5xXgAkj78RzyCNGjgy4IueWUIYw0v0GdDWvc9Vo4wA4rquD48vvTHF2t6amG6S6rJmhTqwCaYdhQ/RBo1+BkL6u3Np64Ax9gpqv37165EPWLXDQ0h4I6LWL1wLYnOa3jb1QKWPvG25QspIPN5zBVu9Il/oKX4NAQ0q0h5vI5W1SGJJtSMbiZmXbLOV9u8iIQBUYmWHv9cIc4BjXDQ++yG2I3ZUOsqAX25I8+xw66j1ssJg77D6EzRrq7dpCmwRv+7kbMlSWrtG0biE8TB9ovvSOjEaMr9nkg2WH39LYG/b2hE97vY2nX2ePsh2pdjx7W1sH24BipCMrpKRac5tW2zgJOYtaIM5/z2I+XSWaNQep8QJQUnaS0GHY43BMDBsLASmL2SKO9n9v/gmTohzYkrXNRjFFzrAzgjyBstdLIUV7rHbkA39vA31L0aHYlu+Vjo3bqLnVavTq3oYwHdK9JH3i/Q4Q1bUTfJSJXgE6A0fxgDYYK9Jt9oacYoSfmWfz3oxt17k7L8t42o/0uNNCo7sJjlxVyY4xBMnTPt/zLU73AjZVhPNjyakRw23gfoZi0vs9CTdUhAfqvqdC8Q9JnWKPbawYPq2Wy5ySN/rZH2LKAUCdGAvkSw+LltYovzdufPXJzF39Au;
	20:3/BufzQs/3Lx21xMuUgsjg3WnVzVGg611vZl0gKg2W/+j4q2AkXcwIvdKLlbppjDaSZ8IqXh+sIolMRtHVvHOXMSU0RBAiZE9wFoHdaKS5JtX822qt5PFNsxoXrTbq5qMrc6ljLIcN1KYkth3zD2O3XftvjTcIf+uazoTBE6rIw=
X-Microsoft-Antispam-PRVS: <VI1PR0701MB18855E6D2AEA9A9AD545FD65D3D30@VI1PR0701MB1885.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(236129657087228)(264703809997249)(148574349560750)(247924648384137);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(2016111802025)(20161123555025)(20161123558100)(20161123562025)(20161123560025)(6043046)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR0701MB1885; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR0701MB1885; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0701MB1885;
	4:7cbXNA0vtnHg3WcTQfRHP47OWqL9KpdEICNQKyvz?=
	=?us-ascii?Q?jfi7s/w2gx4eIewbv5ez+kBg1RaYamRE4UdAPLg0JlglR+SlRcsUqxbQFtF4?=
	=?us-ascii?Q?FBt/79tNkQ8m/Ilp9iD9wkbDcp6dc8gaz8yroLSezsSK00YXQuH/uAnCDT/5?=
	=?us-ascii?Q?qwAZyXNQCnogwxrMbcH+1A8wionwHsMjUUKxJHL6Ch72hghPUaBUVux/e/pd?=
	=?us-ascii?Q?5RwMUsaHyLOKmOWu0QEZdLN6wt9lfFYGLWY39Bo6ho0gzRNAUo1uU6tKPQuQ?=
	=?us-ascii?Q?SRcMPd9JWx0sBnAT3AYtauSP1xj21+EDao0Bmd+fMNAZUcEoPTwF4VJVclv4?=
	=?us-ascii?Q?CLGhWbkLC0CRA49+S851NRjJOiHHVnbutFSzVZjlIS9gGZSUgJaPySA6FkAE?=
	=?us-ascii?Q?k4FCZPunTOaWK8ELg/znoJspcZsijoKW2+dOK3W3H5LZyVLrSGxTiTyvjTTV?=
	=?us-ascii?Q?72Rax9jsZTByBouRFr71FfStDnYKVILetPkTn1oWc8FMekmsc4hIYHMHVV8J?=
	=?us-ascii?Q?NqOpvxc+wEvx9KupeCmOPvGc7MhRgX86IWLq3bnXKUQG0tcmeU3oCBJ3AxPj?=
	=?us-ascii?Q?+9zE2fzXlLIDydtnkg7urAcHGnFpb1bRhJ5mNwrgzYbMad4GPnuf84NDxAl/?=
	=?us-ascii?Q?o7r20h2dobibXjVzy1LbWio12Z61biHamAUNjLxmp+hOJXKXm/HZC20da964?=
	=?us-ascii?Q?eIGOyc49qHAL7/u5xYTvL+wtt2G/tmliawogCB0AucCkx1M9nxn7Qy4cmx4I?=
	=?us-ascii?Q?Dxsq+AKZ6meeHD7BOqEkOXETmTrkq31q4RujGIPKd19hsUZGCfsTltTvWBgd?=
	=?us-ascii?Q?jCNOphRh6NMWANKXs/PH/J9Va288Hbljg1Byvw1MExVlORK/Op98G+s1LSBw?=
	=?us-ascii?Q?X7vI8+JiVoqSWeJtVhnm8i2yZc2z70C+hw8SsdPKsQxgIfpFHQGavXmHcq/o?=
	=?us-ascii?Q?5MBAhG0l8+KNCN6IETRvuRaturv+GxJDAmzfcwaAeHTKfseDkRVzEursnZNg?=
	=?us-ascii?Q?OqzaxqsQoIqWWvge4xyO/e3/P/OJPBt6LE8I07QDXkCucRo4o7eEXV6236BI?=
	=?us-ascii?Q?2wLTVy4uddxPK2ODu5okTmL3BnwJgJdvQK2GvtFSFUPtAX4uwOlMIkWMnRnh?=
	=?us-ascii?Q?Ix0f+s7qZjM7DxfHUZD6psU3ubRer8PGyG32JpBsQFl5aQ/o0/mvfd71h2iv?=
	=?us-ascii?Q?kOjnTQguW3lgECSx6BnLMTevqC0T2hzWWNtn2byffCMUopiqVJA0vbD3DVl5?=
	=?us-ascii?Q?bsNj+PnSVE6N3GxqfVMQz5/0YNUXIdo5B8EVNRMhNmgo/g+cWnUmQ+EUTFVP?=
	=?us-ascii?Q?78YT8Een9AQA4woWMJIup8dvWgUpw1GGdo/4de/nKgxsrRoyoaSs46DbRff7?=
	=?us-ascii?Q?4MFrgU1i/5bZS9nSg435xaTx0ZA=3D?=
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(39830400002)(39450400003)(39400400002)(39410400002)(189998001)(6666003)(6116002)(83506001)(84326002)(36756003)(568964002)(31686004)(54356999)(2906002)(33646002)(86362001)(305945005)(3846002)(3450700001)(42186005)(65826007)(5660300001)(43066003)(50986999)(31696002)(65806001)(2351001)(72206003)(25786009)(6486002)(77096006)(8676002)(478600001)(66066001)(6916009)(21480400002)(110136004)(38730400002)(7736002)(81166006)(53936002)(65956001)(2361001)(5890100001)(4001350100001)(24704002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB1885; H:[172.16.20.67];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0701MB1885;
	23:ZE9SuYuCem4zJvs7uM3iL3G1ILyf6pGOZe+Y21h?=
	=?us-ascii?Q?DeROtf55ZaDozpY6sG03qBHNRcy2LH26Idj3hW1VvW3I19enVFqDIK8VummS?=
	=?us-ascii?Q?qxTs051/Uu/roQgY83Yf9SGz+RHKddjVwq6XYQt3PTEEDx8i7fVDSEgqig3h?=
	=?us-ascii?Q?aStp6vLcaYvCx8PrTOFqu02jJwpmqv0wvHpV+o+do/NJ/4o7LPl4b/UJQQUy?=
	=?us-ascii?Q?rMzKrtNJOjHS6RunGAb1FbJtKxx3bJTNk9jskIo9XbOZu+idX7xRV0Y5EmVL?=
	=?us-ascii?Q?/+Z4+jllCP9rtMFKQCPG8hXnxFY132H3mGcgaQTF2bWgSTgeg269Smsa9adz?=
	=?us-ascii?Q?ggFrFu3wACIHcX46Z202WTfDe5D+Urb8Kpk7EErpvVP2Y7GpY5AkRNqdiT66?=
	=?us-ascii?Q?O1EaBJdsSSZuzCBErE33VIHZoIeIHuf9ATGalvZOfy8i/1GhATMsaEi/C8BV?=
	=?us-ascii?Q?ZyZeNhhLFx+P/8CA+I2wQMlj1RzaGCcscoDe3GHFEuZTW6aeG5BBvUNNOKKK?=
	=?us-ascii?Q?GuUJ9Wy4cTXYb6lEahdQ4+ViPnrmPT1JeTPHNymR5lEFh7sa/tzj155PYHyG?=
	=?us-ascii?Q?V43WyTAkK/cOE9Bo2jAecXrPEgS6kPG+gy/RPD83HRK9uUaWEAMJtkZ/bdty?=
	=?us-ascii?Q?zBMayAxXN5fyVBr9y+7IxHfl9kBC5qsJeWuFnhzzOH4bv+X+Qf+IHrjDhtxA?=
	=?us-ascii?Q?PKqHlT7WLzhrJ0FZ346c1Cj4Ch2N23fM+Z4gYzdbM6j42/x6h5UswsmK4KhC?=
	=?us-ascii?Q?ZxeIPtLA5BYdk9PZz8UowMTYtWPvSn+phXvScLy2v7WP4OEhKEPqJZZoB4sY?=
	=?us-ascii?Q?mSqffGxQk1XuMBM9Ob+xc5aqY7rZMt9VsatmmrEJYjzrvUOhC0n4ykzc+cxn?=
	=?us-ascii?Q?KcD0SJ4NHukzTdOBLYqweIu9kkABvsBp7aQmApEkH9QN6we1r9nsf9mMcqxK?=
	=?us-ascii?Q?HNUrFfIIg1Z9IvCIOvRw/x5JE21S5Gq2T9b79gu+oj8R7l+6Q91Tmz0t3gMx?=
	=?us-ascii?Q?46VkcfDEF8LsNuftQR5nti7evM048w3He8oBCGSc/ID11JSsQk4qkcyo2sRp?=
	=?us-ascii?Q?kCmsEcitCIHeG7bIo4rL1T4Eexoqn+NqyuvtjArjL8LVek7WEhe41IuIJWEW?=
	=?us-ascii?Q?iHxzbgdJQtaQMX8N45n8+00/mFSwfcvp0xSMB6Cg7CGaXQX5oxisuGnH5z/F?=
	=?us-ascii?Q?UCEASQiqeArVodXCbOoJ9INcgMQGRHx5HRrOe3X1E3rfsPiVuh1hWKzjuKw?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0701MB1885;
	6:KjcBcgmXE/5tXF6uinVrQKMLwp4mOJgg7MxKGvSv?=
	=?us-ascii?Q?pX6zE6kIhEhiMgu0J4LI/P52aAnZccETM9cLJBujJ8spkphgJXARMAEUzjtR?=
	=?us-ascii?Q?QCGIaNiw45UQ80hmJ8/nAWDMgor4L9AmlyoF9Vdp82Zo72KmJX9zx7T/tR9d?=
	=?us-ascii?Q?9xWtCUk1bZ8ZWgi187KpSR1Lu6d1LK3DtcWVhC/jYBacJV6hqsXngy4K7ATD?=
	=?us-ascii?Q?bFMjEjpFYqKD4o0cdfAkuS57OKZuaRxo8OgGPrsOiXW/s1wataA3wd8igSRy?=
	=?us-ascii?Q?XDt+ozxQwmZd+qiuZ/EPy5oe/yjP87hfKHPHGE4G/iSo7jzd/q0ddcrflCq8?=
	=?us-ascii?Q?wguDjhj04s7smizk2udjru7tcOtLzc4mbELV/ENqjByPkt2/C9C7LwPCSljc?=
	=?us-ascii?Q?Giur7x88pIHcnn8eiQ+T8w7jUCcOQxVZ6TQNcqE8fY4pNH9xFCwDEpPqMtos?=
	=?us-ascii?Q?d2T/YgaiHLVDhjm/D5a7jQ/+B02kK3SI8HIdCEvMvT6I3TXHAGMo4/nQCWm4?=
	=?us-ascii?Q?KkPJDhj7YyQlvAOLFtmBW3tnm/1LsG5MZSn5URELsA68Yqkk28FyeYG2wZtY?=
	=?us-ascii?Q?6dzdXtoR63ns+tWNhCuHDK4yrPxThmjbF98Psl1ylo/pf5ase9gEU+MciWPP?=
	=?us-ascii?Q?jXTsOAD0MgQXR9sQpAnLsd13RsM5c03v+CsHnss516nLfo89ijMZesrfldI7?=
	=?us-ascii?Q?eG9Mrb0zBkKgbNoy7kelhsziOca7fT3H3hj64s+FWyKVnUB1KPURRys55MFs?=
	=?us-ascii?Q?zBpa+gS0SjArcG6D9dWNXtY/hgC4OiIyoXcV89JJ5Q8YsMRPEfSdenXT9UDQ?=
	=?us-ascii?Q?m+tmrcz911Zyk3sblhUvstDpsDbS/QT+483pMkhyuPfWE6D52MsLZsze0GcW?=
	=?us-ascii?Q?8kkZCuq3DEioEnj103TJNWCk8KvbBz4LyrmJx/WKqF7CS2Jd0e0JgOmAmrhv?=
	=?us-ascii?Q?kpRuDlELwQnnefv1ohOECd3m2nZ8cLMFxXDyNtc8cnDGYftwJ7+fwokXuDYB?=
	=?us-ascii?Q?CbE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB1885;
	5:IB1MmzjU/g5fRP1L3NxtOkIMgMD3pBJ/V0oiWwW+nywXIzZn/BtaunAwEhEV9XVGkOe6qcNxCtcU6MTE52O97EDGxwu0T1R5pQgL3XCSnKHevY+eu1tdAht1IlTJTTQhG+jlb1BeV+KgakuCV03z+LNx7tT9dVipXduvfzGPXtmKsN3+EnuyGWbJV8a8F9M2ZfY0MkqkJL4fVuaeSZtRPXsjDMnb1Dhb+f1Jq5QfCL4JO3gwt+Lbw5UDYF6gR7nbXwy2obGiWqhfpciqXN2unFvZWhaVnwzFgGN2pzJtNK4VGtzAvGHFrNywNAhMvF9SjIZV0X2eYYFCVzagY6NHc3A/KIW/KSMM/0lZDxlVJpswHDG3yOYwrT38FaAUUwh121YSJH6c8ckXfhFtxLFlZnQydIbQ+gy65MwbdtVfiv4yRW1s2SLd7GoWhmRGthbkGu2SNsynlxylIJvpYR+VkUlzmbRrYBFzYAhActxWZ45IhxeN4XHRbwF1gM0q4X0/;
	24:CxOlJWg2TQrzyzZOtZNmlXSkKpRX0wcLNeSps4YGOyTwxcunxZIU33jWpXg5QchQ+B7B4yQeUKmwiHH+WsNjf7xixUCOsZJFbF2KEtyGXyo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0701MB1885;
	7:5ZuYXJixFGiprkd4sgZao76lv0nX7u9dr1wA5kKccjcO7VEkV4zXPc/HOK/phf+O0KlBzQDhinf9Je51xZA4pPS7dLrYu7WYrT75TTtlhmGbrLFxJCzTSQbqKl0jStlYlsRNgTrmMzfwzoT7+rCosGujUqCxlyJG0NvwC04qmDWkZPTz21ZdJ6EzgWkdKLrOeHKxc2gIm64cQkxdQ6wgY7sNB4rAfk9rZmxJANC05A46IFSpa05dZIP1x1PO5CsPU9llVKEskjuec8k6RnMWqLbuUA4UN8diRnxtQO2oDOrrcRfp9BOGJGy3domhcebd1VFu5qO+axoheiGELyxmgB+P7bUy4pbh2vuWS84pkZAMsjNooXDMETs+XEgbkuc1zeEKaSeEg09Rc6YgByVnPiLcBUOoXgkk4s4Dn8CrPsUAYZ0zRaQfT7K7BqXVhKjxNEwVDm58lmn4eimRfJ7XiX+CrDjsucxsUyQ0+ZYQ+VyiB2VjNdrB8+DMeZ3OsXg3gKH8ZCFV53QvgnHdkC3IO4uLJ0rFFDiCsIhMEhnbbDCawCMOdBFXPmF/eQEDhSd3bS89YdEKpt3dHKBHfTtzj+GarsIg+EJU3Tw/w/sxIdY8V576sYNFwE0OuzEFnSd6E4zDxIZb4LQ2a/yUllLkEwAO5oAR3Aj0W8HLYOwpjFc9GILr8VaFpC8rqOzLWGiBtpcgLZxrAoKJmhXUoNxPIfmm4/4U3cDdiWe9+5QDqXtTMiFbLdHHJ1bfYzJx4fqeU9Lt96wBJEqAmmvKi18/glAWCRz0TKfay3O5mx8Bqmo=
X-OriginatorOrg: net2edge.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2017 07:30:27.7362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB1885
Subject: New Recipe for ser2net with IPv6 Support (v3.0 & v3.1)
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
X-List-Received-Date: Fri, 30 Jun 2017 07:30:29 -0000
X-Groupsio-MsgNum: 99517
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="IAOkpuQiauqesr6ndol9TDOSIdhwKAoWc"

--IAOkpuQiauqesr6ndol9TDOSIdhwKAoWc
Content-Type: multipart/mixed; boundary="hiNxb2lSceqC1HaSktKtrpvs3ODHusuVI";
 protected-headers="v1"
From: "Thomas A. F. Thorne MEng AUS MIET" <Thomas.Thorne@Net2Edge.com>
Reply-To: Thomas.Thorne@Net2Edge.com
To: openembedded-core@lists.openembedded.org
Message-ID: <017fe027-8557-dada-f6f6-e112faee58d4@Net2Edge.com>
Subject: New Recipe for ser2net with IPv6 Support (v3.0 & v3.1)

--hiNxb2lSceqC1HaSktKtrpvs3ODHusuVI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

Good afternoon,

Would submitting a patch to this list that adds a recipe for ser2net
v3.0 and ser2net v3.1 be the right thing to do to get it one day
included in the layer?  Would the new versions beneficial to the wider
community?=20

I am working on an application that will use the ser2net application to
access some serial ports over IPv6.  The current version of ser2net
included with the meta-openembedded/meta-oe layer is 2.9.1 which does
not include IPv6 support.  I believe that v3.0 onwards may include IPv6
support and I am testing that out now.=20

I am creating recipes for ser2net_3.0.bb and ser2net_3.1.bb as part of
my testing.  I would be happy to submit the files as patches.  I am
currently working on krogoth but could submit the patch against another
version if preferred.=20

I have CCed the meta-oe maintainers (on my first message attempt but not =
my second)=20
as that the is the layer that holds the ser2net recipe at present.  I hop=
e that was not a mistake, please
for give the extra email if it was.=20

Regards,

--=20
Thomas Thorne  Software Engineer  Net2Edge Limited



--hiNxb2lSceqC1HaSktKtrpvs3ODHusuVI--

--IAOkpuQiauqesr6ndol9TDOSIdhwKAoWc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZVf4MAAoJEPXLKKkUazGA3eoH/0deXi6ur0H6esH+IqvGhjj8
2FNL5IoJQyG9BpnpbTLvMtYtvX/qXyIFYdU8CwJoJcy/hC31y9muyJjbn7/EYIKH
CH9PsuxUGyicMNt22a4cGp2+i6aWvom9dnZ09dDSUrr0MDuHlxTMlpXJBwIzQYN4
F+uXlxlUvZCRn48Zis3S7x/l4ufTyT+sSl6t0g0GFRcX7+SxFrHIQ4P9z9XphLjG
huBC898TEYC+HCzoOpJ4gd8shMgaVPzqHJ57dQ6fHlGgtZP3rm9wCTWaU0WwVLlg
ty15rAP3JF4XkvTozFa0s67IdBYGjOCbeUog6PX6Pr9/sTmoz8S3igL/S9jkU0Q=
=Ja5P
-----END PGP SIGNATURE-----

--IAOkpuQiauqesr6ndol9TDOSIdhwKAoWc--
