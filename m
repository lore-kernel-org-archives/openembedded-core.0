Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0088.outbound.protection.outlook.com [104.47.32.88])
	by mail.openembedded.org (Postfix) with ESMTP id BC50277D0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dc9NRgP1Q7xlk6bzKsyJ8FmjSqwyrnGI/WDch50G0Mc=;
	b=nUqZQOUPMcfMUk+o+ActFmlAxI7YpiMh6KYXjtD9DhnNZBVSwqL+pea6JWuTTMtL6hWanWdaq6ImWJTndidXHl9fa+Jk6KtMqBOIMdkrFdDd4AxUj+m/ZEWlYFNyTFIsivUzxIdz34kFIOv2EXBfOjmmT8AhkHBJFCFFrbQ6XTc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Mon, 10 Jul 2017 22:18:51 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 15:18:33 -0700
Message-Id: <20170710221833.11413-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN6PR20CA0007.namprd20.prod.outlook.com (10.173.158.145) To
	CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adbaccdf-948a-470c-1f5f-08d4c7e1a54c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	3:3j7KZ4ekJLzus1hZfsakeEDK4/oY9rnX5xtx34117/hSY+SINe8n2xf+bzehj9yMQMXeI0G+HYs5tXM/Rt5sIvauhtCu1lLwQeTkA9+qGCxmJ5k34tF50vgx6HqenciRRTNv3Rb05tlZRNN7i7l33Eaw9wCakv8EwNglB8somSuhJ/3wADfkS/GJ0iERLvcOuec/GvMHHdqKhZPcODYTnJLyC7iJdhBzNjEwIKzgQmr9Su7SskiZwxUX4XqOH6qrl95IDRuqxLS5zSThAzLs+SlS/cfLgvw/ydlevWAbsknvTpoULhehjj0iZ3PmvuawxwEHjBpo785zODdaOPIBonbsZMfU3Y2RmIT11BW33SkEc+b7gpwpof5qYdRmPqu6IZopbJngJvIBecwABlZ71etSxgVJaje4eJhJNODoGhJhu+Gr8P53IDR/y8B0cVjqPQ2vp4SfFBvaiJTdStoa79/+S1o82/NiKSqMxwMHBTNFS6Cua4NzfmtIzHKj+loKSosamkIabJkOVJQOkeXSxgofsGnEKc/lv2w0pRSO+nlx681TIW7mIh0exANnpukWjeBqpPz69Lxn/KX5tFrHVaH6EhiDgLqUL9ixqdBCPMt9gGcaddVhMubv1t/HqXWvuVFazRpBnSlB+tNuoeYAOtGV60lyn7h3cFsa2dK+9pcN1jUgNwz2fFtCGm5ZBNLrY/bEMehbe65pEVg/rLDzN+h1JaHZffAaz7ZGbOEeQJQ=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2934:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	25:df8x1+iO/5+g5cMiKsnmu2rnkxxxkqGl0/fGSBaoTUjGWFalCbkdMU++11/c+9NlH99RwuXUYaNIqv57gcBx/hy9TQupnixu74x0pCzVjsUuKO/FnlsBGCOyv5jN7tQ3SlJEq53pJ3McGTxz2vILKRrEuLdqFTVG+yeIr+iw2uERpNwPfksziqzJwJJY7IFCwe18l2bMvi+SvoMA/5wQjbnbZap8qa2WdpqLBjcGaWnPvYHXC70oQRuf6lgZFHBDsDIYdUTeKp96/o/411zMPppqDt2kcy4rO50ZxQY4M93EKhyp5Oyc4Or2CwgsWEsuIW3LZ3aahmHkVkZgXtv9Zpy8nx3yNS3sqTc4EzeiNtzxqffSs0UqufYfrHIBuvZLnlYwhNsacVXaHBljEN5V/0lkzyguMqqBnS5pN+kuf+W2MVzrWY3DvQp6Xln5jWuQKfYpfg9LOuFzVEgV9BYmJmqKPyrjnKMIMdn0Dptygh7JoqnyuAVjEFcfaTt0A5YcmkEFL+O8luV2XVyGZ76jFBa37y+9TQ6FsPWFbyB6+799rlIkycun38jTnld4RMVdZFMU/x3Tyo9KkCfZHYiTx0ytO/L7O+vhxoRKBpms/EfI3qdSHbhx4oB7CgkkvjhUhDRVXnM8LNaec9dCuiDGeVQwYPLLeJd+KlA3Erjj0E/U0PI3JJeOI/yeLBCcnpvb/SvVdbYtWHzB1yboB7zLJ7oQ6R9SOXuIIczw4P7uP3olESGYPVjNNsbHX2AEKwfiJDlIrDoiGPuCBzXXdTWgLSOLCF44l7Cl3J2N9uFI/OickKupQ9Z7pMVe2fqzATVjRCzbrb9U8Dz1NZBGuGTXCeKeGoeo0b9ByvKSPByH8n6mawihBA5wrqop229JTWNbWly1QjLBptS1NFvuT3QrLD1oquT6oIVGcOHuuuN4ldo=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	31:euFrN1UBGIwAbTPcRB2EwAV/WS4MTepSVKCQelIwapfeHfcZlsohSgNqjA5iyLLFU0N9GWN6x7Pi1hvGMxn9KFgbwbRqu8W0JcGVxq+/xOzZAcuIxYmGmfdSWZRKqKoA6qy7WVOE8o8nuq4mCmJoyf21uaWKI5AxWafmNYqyNlZJphqSPZGmWzMnvBROFmKAFnLuS/yjVuOPW2ZOXr/eTvNfRyo3qURA9YIhZOBbKDwdK/yl1tYy6cookO9zn02QTrdMo9XLo7DHXa0AKe1+YoWJ84KSw3Nom3VdIurCbwZLBSvYgWm1ug+1DnorPJ1810OoSQnxIbTuT+S5Q+zsj2tZRbs7fpxavagoTRZcSh1lFFLQFZ7MPY/qWX9tcUCP1JQZkcH2c9Izqvb98iIxeBMuCH5EzwRieGhpXnnngEXeE9QmCATlCQP6IHM5aD4mW5a3YcZ8TNQm2WPjliyDgCi2zmP92v+pM6Smo41DdLV6Xg4J4R32Mv8gEMjZYSi3yOEqRDWfSVuEe6ZfC1ZD6fCBtgRhS3s3sn7C27c5JHeGQGCo50JYWcKrYFMZVRxDxQuFIXVarMuakNyZOHreeOmLKnrOCJHAJgDSzS9xWoa5agG47wb31bFUwJQKIph1FYnMLGLlS+EnA/o8J4gdpJwx9BvzUHfz1PPPlBqpuj8=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	20:Nin725vG27jZdnESaJgzyLnr6PuZyn+Jcl3SJss00n5COz5+Ql/X8Bw74eAiLgaQI+R4qhDWBXKc+O9pOpO1XJLt2JFVDsDAWqoDpYebhv3p1kXOI2y29glvwGhUH+Hih2d0Ul1YzvHtuUKfpAj/pVrHrETR/gVwhitZLfZJLPC8Ndwbw/5AOmP5rNVnMpqfKuiQUz5FvgSBMrqpuMn6Yyfsd1q9xTEQNT+zprOPzNJLYFstQYgqjpQiUH2LLaEGXmC/Rt5Kavu6whnSP4JzrC3XIGlq3oWUVA68ru5+4TKu2Cp4JcMSTh/fuR7IL2xPh6REpJj6SwfwwdxIRzDBhQkA5y5EP5T4DsnKo6YbkNj6n8h7Qcur8ljqm5+1nz2pYA0TfDOdzHCzCTcmpEdbzS/Akw0w9cTIIWhhlWvlnTU=
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29344ED5D8D5D08625F55F0BABA90@CY4PR0101MB2934.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(2017060910075)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123560025)(20161123558100)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2934; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2934;
	4:n3nsVclFZMvd/zKE3Hbyr/MJT0SYIdTXchNn6Gv0?=
	=?us-ascii?Q?QeQ01faqTaedVkK/K9NvVioHN5onszA8COo7EQ3G1tsA8zvXgTIbkez3YFE2?=
	=?us-ascii?Q?XM7wiLT42zTWlofLIv7d5ix78x8luZ2rP5XsIb6oSoXxQpWwHHwvAvk6UMYo?=
	=?us-ascii?Q?Nc4gONWMwbfNUDiBLUEyUzsuxOEAoaBiXwnKUIx2Fh/7716CE/miCJJUv5Ra?=
	=?us-ascii?Q?Gr0rGEChG0N5ndMQwZB81C3n/8RsgMwGpayfNq2TH6g0S/2ahspduBNKDb90?=
	=?us-ascii?Q?F2d8CpT7IDkHUDvj19JUTpdpLYGGJQd0UvO4P4ScFM0W8LurEFC7tIdWQ2AI?=
	=?us-ascii?Q?hUi6zK0NElhTGX6Y35njv7v/wSHdbl3VqdksqWlNFajgKEJS2jfXS6kYLfDB?=
	=?us-ascii?Q?wADO8beoGc6tRx2z/kDSUQQX5yTMlBEd0bQYWoG2brIjLsR0CivSv6IBRDtt?=
	=?us-ascii?Q?QU38RNk6MI6PdgT6khRbmVWlzj8m/LBz8dWFqcxaTFbAiQymFSGJOFHwRflq?=
	=?us-ascii?Q?hZtzmjZGNwYAxarIwj+n1l0YTtNsiZQbKHfxlVEp9OmGApThce0gsf0uyAOk?=
	=?us-ascii?Q?Qqp0OJmcGW2VVIqdj7Deuoba0kzi2DMGT6h1NSo6Ocv2kfnSYUjMBMNB/COp?=
	=?us-ascii?Q?WSM3PIh+N3yQ/868O1+A3j2YfjQhB1GmojZKhaz9NxVnB8UcJBBSBxWGJOQG?=
	=?us-ascii?Q?6LRnf1ZqziMtpqpHyWRJss83Myjl2P6+mRnSkqWTlEmBGg0RTVK5FJmI/G9N?=
	=?us-ascii?Q?ikJq1igfjgAwnQMocuMXH9aYurxapkaWmkRvJtvViu6IC5Yz6V5d/w2p5nTm?=
	=?us-ascii?Q?2oW520DfG0Jp9O+0aPLt/h/LSbSm7WMUYwOavyuuPnkZpST4wrSH/oyapekl?=
	=?us-ascii?Q?duGoEutcNlFm98UySa/H4ikZ3bnFILZ3IsE/E+vap7MOHA6R9a/lkFusZBwO?=
	=?us-ascii?Q?8+/1YxYGWigfOnRfeE1Wf15K3/OTGTwaci/RAEpTaOxQVFSIeczkxzfncB4h?=
	=?us-ascii?Q?9PlWkSFtS+GzGKwf4N6zPpvars474ax/DW2SButdhK1TXbcpj5fCa1m0f5LI?=
	=?us-ascii?Q?BdwAkF+RBNk7ygSB5DIHsXwlYeg17/FbLFgD2QdPsFzIUZ7A+bUM7T8HyV5j?=
	=?us-ascii?Q?U0FcE32Q7SkB79pOcWgxxPjxpoGYyiGaxqV57RP1ibP9AlgxnQGQHZpgbQqW?=
	=?us-ascii?Q?c39adaHkx4ZxDrU8a+/7fw/Ei1Mfk2eFFhe2?=
X-Forefront-PRVS: 03648EFF89
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(6009001)(39400400002)(39410400002)(39450400003)(39830400002)(6116002)(53936002)(1076002)(478600001)(38730400002)(107886003)(7350300001)(110136004)(3846002)(189998001)(47776003)(66066001)(5660300001)(6916009)(6666003)(6506006)(86362001)(5003940100001)(42186005)(50466002)(2361001)(6486002)(33646002)(305945005)(575784001)(2351001)(50226002)(2906002)(8676002)(4326008)(6512007)(81166006)(54906002)(7736002)(53416004)(50986999)(48376002)(25786009)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2934;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2934;
	23:tHGI2bWAXaCYj2ccLfRjXEiyuc8M5p4i+JUt+tK?=
	=?us-ascii?Q?xL6VXihUAT5q5yBvvpowcizukiHQS5Jeuq9a49tgLqmlfNq9gWg7cvA4ibmj?=
	=?us-ascii?Q?YFqGk0c0mQcv7E2w1R1/a40Zv0i86W865CvbNi9M2CtxRy46Kk4DceISfIJ0?=
	=?us-ascii?Q?W+dIm2GKyXcvLhleNuazurLZGPMoFcSsoaIYIghrC1N05O7kRx6Z+cLAv45x?=
	=?us-ascii?Q?/Z8M9/ox33YnN8mDBmhsFxaOlGmj5eaPSGiaEP0zeBVW553Fa8JC3FNoalxJ?=
	=?us-ascii?Q?h0+LTYkUtu9841UK6ND8qLxH1RPdQzmi1txUxw3Eip53pd2ZAW2MEeBtKATr?=
	=?us-ascii?Q?Vq2OM7HAVmGxrBFZGWhdAglA4ytkoNIBnbuFlYktH5vOUiwmD/CGRR8NVCCC?=
	=?us-ascii?Q?FO3wVI5XHTgZNSFE5/8jT/YvQsjF+K4QXjqkN8VigNE71I+ybSX1KEkBhb15?=
	=?us-ascii?Q?xLbmZkQTLtLBTgLpXBZKlnAt7SgX9hIHaqliaywQtVb96BckQQgfQtgXe+5q?=
	=?us-ascii?Q?1zHHquTgRpf7DliQ0y7WrG+dn77oY0Q3ArYWV2iDmjVy/1KuyncLFJaxiVYB?=
	=?us-ascii?Q?aDMjryghohliOtNhTojgEQdEeQg8UvHe7azOxzCYYMJDAihEFk8B0MCCsbCF?=
	=?us-ascii?Q?ch2WOGf1rl5vkCYZFw2mrxZ9t3GCxTNFSmKwz+qv3gEPdYQRH3jJhMct0du0?=
	=?us-ascii?Q?6XEG9X1Re6hAqyDAmFQzGZF86iEG5ZHsJuDwiLzElUh4Q7px4I4Op442xMVF?=
	=?us-ascii?Q?3vIEdbbS9BDTsIU/6YOwFlbJuxs0DEO23EVhQCD47qAkm24Biv/tRmfJc1Gb?=
	=?us-ascii?Q?NJi+o+RlCVdKA4p4IyjAevFMiSbXG8Fv4mvYHrNdyJQZ08xMzSAKVqy/+nC+?=
	=?us-ascii?Q?BxpS4JZ1WX7vbsd0mSSnLhNotHvLzlVWIEZM1O8XZP2EHh+zsrLJBYczWzsO?=
	=?us-ascii?Q?VsHEemVC1l6/ghf6qkhSKp1KuYjF/e0wAJrD/9fIteSYvzRpxRiNQG/TetTH?=
	=?us-ascii?Q?1nnu9Kn6ixDP07ESi+mT8dWd2Gla2H1FqBwuIyu1rAYXf9es/CzGrLH4jVSU?=
	=?us-ascii?Q?0/oMCFK6902FGynmzY4ZfhQCK8slOQAoRCYYV8KQyezLHSh13XnQ+setjXfL?=
	=?us-ascii?Q?7fMObUJsV7hA1PEZOTc2PF0If2HGxJb+6cxknbChbNqUncEMVyS0OPQ=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2934;
	6:ad8lW3deNdPQ69Re45Cxdc5eA3mEq52reWX58PLY?=
	=?us-ascii?Q?a0+WEWSthmPa2BpkGcTnSj5FTzju43UMz7KZt6bu3R/QfC/mW+vKA3+k2of0?=
	=?us-ascii?Q?rIERIUJYdeTU9wz8Z3TSkKM42ZuKLkoIILErguKtdClaXeUHTg2bwgMOcbWY?=
	=?us-ascii?Q?MkaLAbaGmvzSOADGxLpM2kiuq6rNTbh87fM1Ev5TW2BH6qhcc3LOylyga6MJ?=
	=?us-ascii?Q?UQ5xJMO3pegTngKLm9nPyJ19UCvcUr2GzZLrdgQQ4IoXNu+yadoHq+5dDUWn?=
	=?us-ascii?Q?sDKI5jJcr51bGu/X7TTEPBFcUuZCul5pRrYh0DF9JtWdpnulaTstI0pB+mxy?=
	=?us-ascii?Q?F88OVnvekwxm4r5CNsUh+6AxZJX90ZiQBbJWUuafjMa0ytQGenZNn1pc7ev7?=
	=?us-ascii?Q?hu3ebD+3k+wOr1tKAhJx68c+ynga8itVNZZ8B5k2rGR10V6WvA3RaEfz94gu?=
	=?us-ascii?Q?sU65BaHMvE0Io8nstpV+InNyMZSQ3wX0AMkfr1pMEG1RtwBrd1VfLNH/ED36?=
	=?us-ascii?Q?/H36nXbHL0GJ9NQc8DXFaD966QB90Gp54wRhDHmhu22rPmBjyEbNiQQnNgB5?=
	=?us-ascii?Q?EIIOtiFsgQ0TUSc4d7t6PF7NGrRQm3dMPXRuFBlYLw3b5QtkOulnXrRfIiFj?=
	=?us-ascii?Q?Ak5JYxCmEdOVyPfrsLbppHML6m1qgiRU6Rt8sU7URA51PJgE4D+uhMRiWlnO?=
	=?us-ascii?Q?UlLesdr5gyy6FrUHt9zOC07BvR8u/IxVXU7dWpLU/CZy7zNokYWNTkd8Ibck?=
	=?us-ascii?Q?ijohB+As5DiE4vvFeY6mz9MIGnECILWsPnQzS1kPV4kmgHMNCkM+XM+ABzMk?=
	=?us-ascii?Q?DsHnoeiUnYk7RCFL4TSqbP5cBhKKo1lhxwgNNpVJZlCtrLtmueS8d2y/WGHh?=
	=?us-ascii?Q?py7OjdRQNePAvighixzNxIJ1qk2KPwt8JKPLiH3NdYPKKjtdfYuHffHbkpRs?=
	=?us-ascii?Q?wTPsToXRP0cFdQb8xclfryF7VXlelOzfyuJECnErPA58TboM1HGs1ASTPkHK?=
	=?us-ascii?Q?t30=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	5:iRyHUaYNhrGSAKIptZZJKQlu48zpiC8dLazHjLjTFuVM8eFxa0fCx+4Y932m7EK/HfmQirAxYxCRKZ4oDyEQH+xMtbvkbh2MWGKKCIqnb26PpnJVyRbvvHG1rrdYs342UvafvtJ/RY/9BwdAOsZ+MIEeTQS3g2d8ZzCLjwstMqdkssSM8ze315MDZJkilq2NkdmcFi2pi5KVnmyKisNarpkXdv7XlNsKnuYfV03rVt0RHZzc+BTtKWKlD4AbZofNXjWXli9+YSOP8bKilrvuIY9AEsPprDxrzBgrUevyZ9uWeuKofQK6Dr4WnAB18SoRfyyVAiL3ssA3Ssn7YrbMJLImogbJwP+KrWsHeza7WiZQNRuzpHYMC6uK0UkafJgEaPLe3YIpHuUlvGNanJT0nRk+NeGUR7KRlx+CYCsCb6p5G9r+8U4muz937LvDx0PirrqEz524DTpNbo09Y6NOWCUdhXzgOc3z4o+mB5q8vxouTLb0YyXXd6P/nTFSjvnX;
	24:0//LyDc2Ke4RpL+D0cpXi+i00FXr9O6tmqDOu/jRD9M8c+6O0gSelaN7f4Ita6lzKSfy3x4gVKzUrUJ4fkNBG1IisLHcGwjwNoYLe7QBLxU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	7:sLL8rSMLKZjoHP0r6JrU0lqZTwfa76f51o0FsFbXomxNubnveb/1jpX7cqzB10P6Kb4OkbGxaSFRnJYvdWCvP8G0jf0EqnkJKHVYeLGBeLPpCD3JfRpERLlkYxbIpWYcjRk4MEbaanXrIWQidA5X1lqb9WvmMzeGEv/RfA7eXG2yzX9EyBaZye6KvcTN/YLox+XihY8ivbT3iveVG6d4RwxmESvklrrDTClKveagbLGfE9AFjyWfnsVhiVeYoS9V0V2DimnuzBQfn/aZrlUPwwMboXpC3bNdQ1KinvmScOcVCqi7GnJz35jyB/c3w2+Dk4gcSZZHgQRbnf9DXH7FUFC/1zDgiYqPYmdVSuqPr/4E1GX53z30Vfqrc83cPKA1dPXxjUlcwTSCEExC2Dur3OkzaSOAWfhhWFiWAjF2EySp5H/a8W6xPWpjJcanKJ0pavKvDzOsgbE2xxbpohJWRWAhTjoINnsYzig3we0FUjDSeSjEoqGxAuUGzRUb/1rLGZLYDzLaAKclTLWi8pk4/RBVPrW1gIX0t9i4R/fZS/U/WnQvo5I6pyz0v5okxwgvUX2UGcj9+t1FIz2aEEKki4kvNt2Fd77gHxQTwdG7w3fhaEFcMSddAyv7EbkjWpUktHdhO9YHXJ7g+pWCdPHaQKOIj9TNuNxuTUsPplNXhwcNTkh1+wlg9zpTbnWq2IXUu9YnjWJQ89e1PqIP2BdgkxBBhKsNf5cioDTlhhimPqwKVKG76Wx/hpPWd3k6HOe5SdIxdkwk3+AGGIv1u7jmEzDLsOTDRAhvqxE/nNYkLc8=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2017 22:18:51.4474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2934
Subject: [PATCH] licenses.conf: enable CDDLv1 license
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
X-List-Received-Date: Mon, 10 Jul 2017 22:18:53 -0000
Content-Type: text/plain

The CDDL license is now used by open-vm-tools in meta-openembedded, so
we need to add it in order to prevent warnings.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/conf/licenses.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index d210a0e940..3e2d2589ab 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -105,6 +105,10 @@ SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
 SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
 SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
 
+#CDDL variations
+SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
+SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
+
 #Other variations
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
 
-- 
2.11.0


