Return-Path: <chunrong.guo@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0139.outbound.protection.outlook.com [104.47.32.139])
	by mail.openembedded.org (Postfix) with ESMTP id C68C978279
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fjajL9nucAjwnWRSmqhso/y5+6m4G2VExCWvkHLOrJU=;
	b=OHfd+A5nT+tMH1eYzZ33ET7eWS6L1D1+O+/WMSm4IWCUsGVzscBh4isRH0ys8sCSYZM7rVqPnjHWveU2a1YJ2ArRhu9q0f/o5zO85kiE9iX1BXde1/zvjDiaVCqcS+SGfxBFxDa5JMvc0ZOu0KAw954tCjMHUdVQMtO6y3h6nCw=
Received: from BN6PR03CA0090.namprd03.prod.outlook.com (10.164.122.156) by
	DM5PR03MB3178.namprd03.prod.outlook.com (10.174.240.31) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 08:32:31 +0000
Received: from BL2FFO11FD015.protection.gbl (2a01:111:f400:7c09::143) by
	BN6PR03CA0090.outlook.office365.com (2603:10b6:405:6f::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1178.14 via
	Frontend Transport; Mon, 19 Jun 2017 08:32:31 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD015.mail.protection.outlook.com (10.173.160.223) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1157.12 via Frontend Transport; Mon, 19 Jun 2017 08:32:31 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v5J8WOHQ028076; Mon, 19 Jun 2017 01:32:29 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2017 16:32:15 +0800
Message-ID: <1497861136-27345-2-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1497861136-27345-1-git-send-email-B40290@freescale.com>
References: <1497861136-27345-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(39840400002)(39410400002)(39450400003)(39400400002)(39850400002)(2980300002)(189002)(199003)(9170700003)(36756003)(50226002)(2351001)(54906002)(105586002)(189998001)(106466001)(47776003)(81166006)(4326008)(305945005)(5003940100001)(356003)(8676002)(5660300001)(8936002)(6666003)(77096006)(107886003)(110136004)(38730400002)(104016004)(76176999)(50986999)(6916009)(498600001)(2950100002)(8656002)(42882006)(48376002)(53936002)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR03MB3178;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; MX:1;
	A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD015;
	1:127yXYpuU5JmTnCZ1m38HcVJDn/4SqllJnXCC5Yk1UrhhLzeUJzI00IIOOlwrGStLhiecPbFhYZCStU6git/2gZ5PedPkDOWvEQdRcvvKhW3UbM832ggKIxCZs/OWVRH2rsuLCXy9Bf15FEspPFC1bliePG26sSOB26fA4jt9w010s7CeWOdX8xJu3r+oHW7s9xTyfm8+8TDPSwusgM4zMAoVeDtQkE9vIb5UNlAKYOUCRSbm5m90vb+ykPCrnWROj8h90i+q3sXOXMv4P8P9Fi37u201hndhTEtsCw9CYA9t5ynBdXvra/b8leTuOs09LaY/SpL2x5sMS8aaShROK3d542piwtj4ynIeW6zdxgjn90l7XQvKtT/JqHX/1I+gUatt50WkDQC00txRAWEJ62qjEBi+n8qxQ77FuiQMJMMkztUeU2x3zCDbPpDLnE5nW434H+Fkz6+PJzZsFzxnted/8xypD4eCDq/+smg0+VoQ7KM4bCWDiW8sP6YW5D3GJVnBzLTt3J2qlpjSy2Zb5joGzYNXrAebyEfX7OhmAI=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d8e9180-6756-4e30-524f-08d4b6edba38
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:DM5PR03MB3178; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	3:O7YgUTmAdDWR8EC48l35gEelH/QIdc/c0Y2t9kFKox+iGaSGlnGt3xh4jeJMnw7BMAi6SSBkB1n96rd4/qwG98ul7fzOz6tILxvj3LNSWJFk/HPcWTNEhudKWAtIrC36IeEyj0uLfcxWZ+BPvSnnvlVpPdaMKi4Ga3kd2APQkViASzIShUTsAh2anWRDRg76c+IAGM778o1ILHtnJeBXyABNmg1mj9U13uEmcfYVMZh4fkfygxjBEhPt81yZCdH+52zkNBuma2atHvYl7zHiWpj4zNZ7AH6UZmxJgI4bJJcV7KdD/DMEt8oSXXZNFs4+Tnn6d4ymXU1RCUh0VXVBJVv9pLOUBtuiGlJKfZkNmZVaCGV90y0QnaPuYpDQiFxfc0scSnEuLBsj2wjo1w7uf0XAfCTJ2kqQM1LyqC5seCf9+9cYRNIoCaqBdNW0/5lH6xNNfAQMUJxTdcpsmQsWfw==
X-MS-TrafficTypeDiagnostic: DM5PR03MB3178:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	25:pa6o0wXcEvQoId7yymp0yEFUW3yg4iZltyexKQm+Hy7P26Lk5WB+5aJGMEXHCtoiX8mYrjwUqWAfeK178g2ka/l4MUK/xfI7bSfI1Q8+1DbNR3sba60u66/qoruQxETzGfn172czTiN+5p2JcaAcf/3IFLCz/0R1TK3yDwMVul8LkMzsKQcauw/xYg5f+h4lzGFCPBpXOvShY4TCdt4Y4RJebKrQ98hXEdYKzoq/JBvEeT9EjAUdGj8fMqDh3jrIrJ2c9T9VtUL5ZPVWxndq8t+WQMd6dpupp9VhzNNZagzXr2WJRFFplbfng+Mfb9Bm83gC/UALQUIFeHf0d8Pdz1lOsQBF+9NYr9IpQBvqYhbG++85rcizuMv9/Qr8Z9yjX+3oyFCt0fpYd8xuKzGNMSrA6/JzhmF263XgtUMpPvqpdabzMRrwcMWLo1k9QrNO8+nEYR1kT+VMoO3JhV+ymHGmjk/0Aebts1sI5HoGlqE=;
	31:D+wB7eiUqAQcGG7JznQrkfZMIzLyRHONMfWy9Uh9v8IqQc2xiSU33Zxn1RRRXgckPn7qsG8hgXMAddgvEJWgeU4l38CF0FsnPpRyxt9ZUWPnIXJ46bxVFSi0MQob+KsHXf2QjsP2gdtVAiVDi+GJbj97bj+Vo2Y4AE7Z2D43kVaVw9bw0adJNfLDgQP79Wll2MewuLizv9Q+xma8K0BHyuC9QM4LBX+gcicoqR0Cc82MCRHuwmsss2ZuPnCyTn02OvGcDZY5stHET8pFBDTv6w==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	20:z9JTdxb2i4pLPhEIGrv0EbNVjTqvItgauxGY8eyLKWnNw1bkpgvAfG6umQWSbjNyzE6/OfacbPlt9AJ74NV4NU5mvbfZ9rBfp0s8rHwDIS4AMh0AVOpXtkMOSdSflAp/Zfls3J8S9u7LNglkXPVDe9voT6BTdl5AUxq1KF/Lp1T4bf+Z+WHXAJTwipIfrHcRTjChlyDCyyuNLUylrMH+HwoHHcOrpczkOeZb75SgFTxGmu6l+/FS3BT+fUVeBuAOY5AC2hzcS5dYKQfFm7pT7yXGPWICFew0la8v7XtihnmSCDG+CNLyZVgpT8iZbYjekTnDpsW2aoLIuzqKK8gSdqXmNM0ZGibWtm5dOFpTh2yazfbyjUUeOe4K/nlxlGjfO5ozgRtVQoSvduImkSS6Rc0Jl9OiyBZRpEuHYTEYjI8VtASgwyolQOqgC38dW7JcoXckFAdcsdCREQnYv25b9cUd4WoIBqjwJFcPL5hbOgIyIl6Sk2LeEWvJ3RfdNzD7rBOsWdGq+2f0lf8jDFapm4oXQ88Wd3xXX4EYH97SK7NoDZEmuWxmmdrQDj1R+i0aaIDcpfO17JvCKidsbzy4FuLaSL/3FFSsueHDJCmUOxI=
X-Microsoft-Antispam-PRVS: <DM5PR03MB317856365A5BF149F41057DB84C40@DM5PR03MB3178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13016025)(5005006)(8121501046)(13018025)(3002001)(93006095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123555025)(20161123562025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR03MB3178; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR03MB3178; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR03MB3178;
	4:UOJq2EuAWywMEOp+LGH1nY71rvJOUNWQIh8SPuUZJP?=
	=?us-ascii?Q?OnIT1pzxR8xHeohAxLciyhBQZNFLpfbuYiLoxjkrIyoDtuTK+X/tePd0ptBh?=
	=?us-ascii?Q?QqyySSle3YE+wHFRRZoux3TeASQb9W9jbeRvvIpM3SxQDrzV4qJJj2nzVIeK?=
	=?us-ascii?Q?Yc5l8PW9nJ1r6ivIerFCiHDJaLQ6bH9fz81H7SSsqAIgthZtAot+ScEXGWRl?=
	=?us-ascii?Q?0qzlNceDJOI0TkUxiO6U9vQzrj94aDs1jWmskPNyKoboAlTstyrcTWefHEWM?=
	=?us-ascii?Q?wAB5sblVnvi+8hngxUwuD/wsNo1gQ+AqiqNB3W2Rg2uiz4Aa2vHP7Qm4zACf?=
	=?us-ascii?Q?T4gAZGkaAJWQsO5rvCP+3bynnz8sH/km3zoPN4N2GbgV+QuHlyCm3Ei83PmU?=
	=?us-ascii?Q?O9NiLfojbIgRv/uTzus7Z6u64t3cdVMG1LXnV3I+KwVeBjBZxUvMYwjppAfh?=
	=?us-ascii?Q?7zh9uccc+nBbzvcVeKwWBGOz1WZCXtFBxc5vOInQJBblcOC5nMaO4cdKblSt?=
	=?us-ascii?Q?cgEsW5ZwUd3BDLsW3IuNSDhWuHsZ1kDGjt+G5EKp+vOwL97CaKqCrv3HBIVW?=
	=?us-ascii?Q?uQIQwVKmIxrscnuNhTaTa+q2pYZAlY9/CIjjj1w9FI6P9nfj6up87N1kwLPI?=
	=?us-ascii?Q?LvqazOP+DvWZeZhU8n2N6OUnvtVCNDfm5oTB04LfiiNcmovm9Y4c5vuyM2jS?=
	=?us-ascii?Q?0LuNRp0ISYkjlFU0AyZ10HRuFGccr5Ebq/V9OMHzdmyoimreFC8ts1v9c3wc?=
	=?us-ascii?Q?LjDTTzJiUreWjL0UHyBWvsAM3vfMDBCPyDSoJABTkmdbPKau7l6DSAxAYkwO?=
	=?us-ascii?Q?kKJnK4szXiAqpKbkxOX9DgUzoyBzzfkGk7YkLu/PUO8zaYt1mClyRKbwuBnw?=
	=?us-ascii?Q?7MvgKy7uwczHaBeMyQOfSNuEXo5IQSArhcskNN+kQTb/HDbBBt80VeEshAlV?=
	=?us-ascii?Q?V/gTfloyUf01QqgwpBAR6TQYfQDDi0EUlapnl/jhCe+HclJNaSjNh3b7jS5d?=
	=?us-ascii?Q?GUUKbbeBG1uC8T/3OPLaF9OKod6qHs5nxUmHETs/dZCi/dJ9sJHiOfXMlyBo?=
	=?us-ascii?Q?1NJbO/XRQDQ2mHMXB7simMZWQgECcKWVUwYNPYaH7ff7/cOoT7kCOsru4gNB?=
	=?us-ascii?Q?DA2Xp1BQWw60DWyFiB4HWY4PByrWCtu8r6nL4Q1nPTcEphmAWWVEtg3gw8wF?=
	=?us-ascii?Q?vFDHJ8kLl5U8pLDIHzCfXvuyKuA2KSsIItBPT5YP3Wu4P3rH3w6JfWuA=3D?=
	=?us-ascii?Q?=3D?=
X-Forefront-PRVS: 0343AC1D30
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR03MB3178;
	23:ak2nuk41U3bDB6sVagJ0bgHCht4NzrmTpKwNb2brS?=
	=?us-ascii?Q?eedchuvA1eiK3eaWNMvwEiO1l/IhD7gj64d42q8BftBWiyjdfoyaTg+9K7rx?=
	=?us-ascii?Q?WiwknmvJI+hmR7ECCQhL7TYu6lDzICHMQq1sJlS3AiqmU8v9WQR/J9bjm+2W?=
	=?us-ascii?Q?UT2WtWx88ocr/CPF2TtKud8Yc4oShZpkUmy7Qf5Q/+6k/RZRmbYS4DiutLit?=
	=?us-ascii?Q?OfG1vqKHXklO9XBCutWIvIeZj4F8sFGyW0nuGkYGvD/D9JVqKyEJsfixlu35?=
	=?us-ascii?Q?gV8HNZ1ECYybZYE+b8QoJNoHqgjUPDNMW4fOxwQZbuuINtT+6l3PsKUYAd4j?=
	=?us-ascii?Q?qoZWvH4TDGGvkSJ1l1d0x7FL/JimdDx/r+FW5R8hMVNdHGU5foh1fR3MmpxL?=
	=?us-ascii?Q?wcKi66zBuxXjW+7Iu0GQntuiy5NpVwpDcNPzmNkb11f1qe/tIgC7uqaBOLhE?=
	=?us-ascii?Q?goHhR8fRrdb99kjvzGHemj3XLlAN6bZP38s2d4zDqGacagrM2Wu8n3Mn9y5F?=
	=?us-ascii?Q?Lrun91r/NCsspnN+DEEEzb5RLZ2rlzs2erx/RtmKVCpves+a4o2WqRlt3Abe?=
	=?us-ascii?Q?5UqRXwyEHQWQHNHFEXBItxaXF+J8WHKrtljRMu/lZqxDnRoi8nqp+57awVID?=
	=?us-ascii?Q?T/zcJyfmokxKACU2qshbx+/DrBsDijenwdEu8WfxvW7Vkwiyz+qYGZo4bd4i?=
	=?us-ascii?Q?D1ul29ZSgCGd1Ci23C/kq99vAddQ+2XBtPvbI/AgOSNQtuheILA+6cXIJJNN?=
	=?us-ascii?Q?70hJZj44o2V+0u7Qi+pZ4t/ZnD/a6Al/P2MZX6XJnkjsAxLEyziC+IXV8Got?=
	=?us-ascii?Q?55bTUoZBRDyfFhrp5uCUSjmuyHhh+QcqnRCHMgtpA2TYLZPsAZVSv0DR2wvv?=
	=?us-ascii?Q?iaVST03WgR5rEFyE3swCz+QjGEOSgDN8id6e3WQNEnxrA8l7kirCPFVueahg?=
	=?us-ascii?Q?vTGGDmb1YyCgOzMe9951UCsd7M9AmA1mvu6OY8Rw6S875nInSeb+l/WFGZZF?=
	=?us-ascii?Q?qh+Ou2ciG5xlXtCaZ1zBiW1mQEN467jGR2uFZC/1B2rehpQg67TsAjtigUcc?=
	=?us-ascii?Q?CYRzXpbZAiUnVlospvbzjj34cSuo3mqm9evonIoop2e4QnUiw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR03MB3178;
	6:dhbr/yHeC2XK+SfSqNIt6+pwelf4Uu1VHnaa0jXu/V?=
	=?us-ascii?Q?EDLVZYXv8WB1JN7kEaKaphOy/uRgFRiIsSpknM7LqMDG1xYmzL5dgbFBSkNX?=
	=?us-ascii?Q?h4k78i2pCHty4yNTXXCHBlBXKrwhCJCzddPgdzWpRblmDjUvFXIl2pFrpG+p?=
	=?us-ascii?Q?WN+D6bmrIjRr5r/EhkpFicvqEQz6V+yPsaRqT8ZfUbjgDQcqVOuLdJHGByAT?=
	=?us-ascii?Q?V/LlltYuj7NsUlpS0hMHtfCG22e9RrBEP1WolOObvkunhgDOz/H8fJN57Rw1?=
	=?us-ascii?Q?8NyHHRqwxidv+p9z79q/F02cO0sFHl0XC9qvXT+5oYfqjrbSuUYDgvBm1EK0?=
	=?us-ascii?Q?8ttl7S0jwt+QeOyGgRLqC8mKsUFwzd3OxO8Tri0kxP/xpvfZiGi/Xi6NtyKt?=
	=?us-ascii?Q?5Xa91oJShnKHaYTDv6B8z/1i5tXLshqgIsmHNOR7+sI/ZWFp9WhRL3KWAxju?=
	=?us-ascii?Q?hep5suiIMhcgejZWkfIglE1vTlDx16iVh8Rp7j2SYc2F3ZDApb1zBiXx/T+V?=
	=?us-ascii?Q?WJIk+hOdgll40EpCxZ5qx21AEdAhGLQG/hF2VMx0UT0vBZfj3g0rGf36VBLE?=
	=?us-ascii?Q?ppwvqxLgz/k83tue5GZBeLYyznfzyIV7rc7fkWvMFcaGM+dn9P8yvVEwoeKP?=
	=?us-ascii?Q?6rqzBg0CB9V4dRjoY+tK3Y2PrSrU+pHPpIA4Khd/iHua77nMKG91Os2JVubj?=
	=?us-ascii?Q?9TycMA9w130/CpR20yGNrL9WEve/cQzMFvijfhHMtJuLN635WtBBp2FJpoSD?=
	=?us-ascii?Q?GWV5MME1ik9gt40GWRD4+YaS9HPjzrGa3DtVEytcvakr1MAFI+4RE3MPJHNY?=
	=?us-ascii?Q?CdU9juX9oorBzRxVDYovWHyWkRJWeBrC+5ijS3jqVEwSIc4O341BIW1uxPvi?=
	=?us-ascii?Q?1aiyfwLe/prZWQ2HUD9ba4J5a0Xccz8XXTMdOCwK8Pv2yZQOK4f75LUMMGYZ?=
	=?us-ascii?Q?/1YBV07Siw6v2tptI5otTuFsQ3/6JKeIdQ3uuoS7cdgW8sRPcl/fN9Nnfddv?=
	=?us-ascii?Q?9e/7Ix8HDXX6XuKHHSzjih4gRziVfk0G0gpP9B0bug0BKa+ql/r3yIZyblB+?=
	=?us-ascii?Q?UrbTE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	5:S6OMfm2LaYHewSzoLneKZm2O/Icz0AyNFQKAh4kZtRAOc9akHO5ORuZ9IDtdWWR7RGTuSv8iHkjgW0Ink30ooOrzEJhvXETIn+XsZA7bD951M0sMqzi/SRpxzK1uZQHd4bYmJwzFeLO9gxg7DU/r9cEZLqbA1v2n2GddFcuwq4+pkgbviOjseIQkHG5sd0AsEJQylbWvpySnXNjAT0oo3c9sHW904VVqmsO0WeBfk97mae7LLHfQMVleCb5Xro4qeZgCSMzXgX33hjO0Kh1c+E7cMe4ePpKIcd9ECOVfwlpHsWQADOa31OUC8eMf9dNCr+YFfpLPFby/+DAwjawAZbkFVnw46yaAVKi9iSMItl6yamqqeCeQGADTvygHWlFev3yW+jeEzh46TC/aGqYJkVDAzbSl3kJsPGzhL84Xl+ZQpqX1Cpa856jLqRsfMhRg7bIADKE18nKBtq/3Vr1+EC8EwH0vim1d5cNpggWZjAe224J9yrf3am8oJLGsS9vn;
	24:pIlXyX3Kag/wyAJrQeUxIjTvF26/uUxv80HsFTMQeGYzATWFcBDeoKXXjg4qaPVbhPOPPriho0ydomdcdR9r2pa1MXGWV7gyU8tBIMiiB0s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	7:ZZ1fHLpNuTEvdxjn/P3C8ifM7tsCvDLuAibZDe8dF06TY+yBibEdNfowjkitcC2XG77vYYIHa9UrcpjHEMGH7yG7LSoyw+98/+DtLXJO42aQlB4D9ChIF1SAM6ekQv7gkUa9pspctB3ibAtSmxPk3x+rgl9pGR1mKPE/TNVy2dHzbI1cPUNVz2FUIbfsslfD5GDvfMj/HeUFRBZqBj1EeVJpFoWyIbnxbO9dQuOQRzjGkJFw6bMSGKr2RfmwwXv8zDcAu7sa8ul9iYQF1RMKYCaj5otUlaPBqZXtCrlRxnBaxfyc9Rzp6pyp7e0AgiRVoSMjtdJHU1OZVQlohodl0Pag8whzFDyJHqeGtH1nXiVTmnTbX9+NBK0fKP0vKEoEZYLpjS0hnjTK6thQQ0+NCO53Me2IR4S0g/HP81k8gqMgcPrhGAv/ZMqYoKM7IL50RoKAGYUySP4wpCNXXBaGME8CJOzFFPsyZ9GzIa+YM3LxF4nzxFILUSkxhWU0Z0orMmuOnADnEqu9SK/oRNghExF5/DVx9CNrUDchCfajClabUvoUAp9JbcVZQQkq75CxB2inEdu7Nnpr2tmDuDTejMp7no7MmgNJYMUuauHoIFUhU9KCjPaWF5/fZN2HMAyjop2EPgUEEJO5e4zfolYf8q55OEdORU28h6eBhEIGCBHzgo5W3HBoVAsiPcZzuoBY8DPqJMy+wG6BRBHzHfZUlesN3vQacA8Z2fTvOwwghJJttPkOu9MLgqAOLgPgcthJXXZ1+Q4kOymNKqKNZm5E/fio40Asby1ngUSoGfee8QA=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2017 08:32:31.2280 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3178
Cc: chunrong.guo@nxp.com
Subject: [PATCH v3 2/3] kernel-fitimage: set replacementtype to vmlinux
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
X-List-Received-Date: Mon, 19 Jun 2017 08:47:55 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f40fbf3..9fa836f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -10,7 +10,7 @@ python __anonymous () {
         if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
-            replacementtype = "zImage"
+            replacementtype = "vmlinux"
 
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
-- 
1.9.0


