Return-Path: <alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 83D3978528
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 18:43:21 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5GIeXoB014975; Fri, 16 Jun 2017 13:43:23 -0500
Received: from nam02-cy1-obe.outbound.protection.outlook.com
	(mail-cys01nam02lp0050.outbound.protection.outlook.com
	[207.46.163.50])
	by mx0a-00010702.pphosted.com with ESMTP id 2b4mqw80qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2017 13:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4+EQjZGQr+8SerRUeFXNZxV+FY8GjqwjhBz66BA9Fk0=;
	b=erR7sXR82zYc5O6TdeAoOymJqrjGbUIi3sMCm2ykjI92cK+S0rWRPqJT58FgfjMC7d9IlnufqeMaNudd9n6Dz6l5HRHhVfV24iORy8y1PN21UTGpf9cfh8XTBiIvOOVsiJi97nxedi9OAOv5UXYmodJT0KfsjHHTYz5ABelCw7I=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none; linuxfoundation.org;
	dmarc=none action=none header.from=ni.com; 
Received: from [10.0.62.53] (130.164.62.126) by
	CY1PR0401MB1324.namprd04.prod.outlook.com (10.161.213.16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Fri, 16 Jun 2017 18:43:20 +0000
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <3a189ae0-064c-299c-84ad-55f9c1ce1331@ni.com>
Date: Fri, 16 Jun 2017 13:43:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Originating-IP: [130.164.62.126]
X-ClientProxiedBy: BN6PR1701CA0017.namprd17.prod.outlook.com (10.172.26.155)
	To CY1PR0401MB1324.namprd04.prod.outlook.com (10.161.213.16)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR0401MB1324:
X-MS-Office365-Filtering-Correlation-Id: 84fbb2aa-eef6-4328-cc73-08d4b4e78fce
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY1PR0401MB1324; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	3:uFRN+FXxulvaFon5c2qNJkkzifjZ2mP+yYwkiL4Vrg79kZCCmSnK2oyA8pT2h9yGl+D+uGvDItvazGlaUTby6HExcWzhvYczcN1Pd1w6l4Hf17ucqdc3kXHNeaVZFIb0tNU0upsCnbh9V9Loo2jILz/xrBgH9oH25lQsTyw4xtRWF6b3LEmUGz7Bcl/7+aBzoWhIHiJ7pM+nGGLBchff/0cmyzewy06FfLQ+j7NnncWXGYqDRHLbbVmykcltEpxambHcIG7MNswOC+liWKBJ6NqvEEAruDTncWAWyGefIFdS3XUK60ge2nJk2Fnz1iNM8tLZlNf8Bxr09beWkgoIZg==;
	25:zcc1e7NhbUo8LKheorS7VWVEi5+amKJb/xmXbckkm6iU83ULM6q9DzRQM1Yctep9g23OY8fva4NZdXuMdqiUXNkmP8QMfgP2AEc3ecQeQsqJAd3ut1j30RnVj4+WL9MwX73nXpgyk+w1e9JmACsmAKqRN5UrBJfWJkX5Bqj69pfSaONduhyKhf9S4uJvRh9SLacajl8hsMSAbL4Ncf6XpB4WbOsM6Wn6iqYIvav/XnkU4w/84bOZCC5GkckevNKVD7D2fzF3e1DhgdEFuTaVPxc+yM4MpTkjBDNK2Zu5gpGvanbhDVadd/unGrtf6uV4CI1EEMxriuL4JjVnVdHj2NPLaBQb1hjtxfGUA0JOGdRpP73Np609aSTcxuAitwqlsdXoVuEqlPGprZi4NUVKAMTAZRnqRlAIxzeRY9KUrDixCl2HwtL38Mwlqj9rZBfejPdSbRlWQmhPrbwQMFXU8258hUFndhuntClSLHLI7Kk=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	31:hr3WbTV99Jpm71emO7a2TJbv4pBE7yx9khk5JfvrOK+3/dIy39rwNaN3zEI8DEsOm5SCINvgDc9mKVlfyVtipg3i+4QIaTxoMq3Ba9lGrp9ygBu5XKw7+1yPyhpYaqrK7IVBA7EZCUQLVnVnxnSSLg0CxMrRAyAkA/8KQ1tz1qj8KySmwYk+YW9t/BUI3z3a4eR2RF8XBumRCR+ZpYyIGXUOvJ1N3OQw8Q3y6TrrHyeDWJlKeK3NkXJe8Mi8qsMx4yxZmA/LhX6HTIdoTbbXgw==;
	20:l3X77N811SsTJFa9NyKywlxR4w8vwB4VERgeVLJsY+TZJ1aRqQEeYJnUVC7nyi8ToKTZD5mjq4pDRXkE6yRtNNKMT2ZDZhdAvrM12T/lYV5WGslZBjwAVLx4PNCHvrts2JqJksrFgGI31C5Q4jXDb32rEXjpfI0Nv5tmcANUXpZem+2CjFaU3a3rzn0gGt2dxybe7+HLnGKYyFwCiMtdPp7BBn6rhDpz6rWFv0Z/6ulogyOKk/RdDUTqfat5xvYemQy+JAfgDlkGWSa6y89uS/mBQNs3IHb1TDZL4wKUGPvlyQITwaqFvjzESxFeLGys2WTIJ0K7Yt8wX+OqJ1PwSbvlcciG9U3RGVdKcyQKM2KI4khVcfrHyVh/C5Ip+Lednuf3HHhQgQYJ7KgrrG9YWWxm8MftO39O7ctjZu3Oomx+gK5vVybIg0steQXkPFCrABS1PczMp6AHrPgCTZC6Sc457mO/gfhpkErcdjVE+JAUDpKrg3Qo0G1yer8dXc1TyQuRuuOAzzUor2ayr88R+9di1JJcQiSP2l+iRTanXjCWYP+vzDlSooykniH2aKesAgArmte+U++HjIou9EIE3XGB0nRy6zeCvEx1wWXpcNw=
X-Microsoft-Antispam-PRVS: <CY1PR0401MB132446429A953C09903AF7FA86C10@CY1PR0401MB1324.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(126837547833334);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123558100)(20161123555025)(20161123560025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0401MB1324; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0401MB1324; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY1PR0401MB1324;
	4:Q9GDXYhMybCvaHIV982uGyVVON/ni1Fgg6dN?=
	=?Windows-1252?Q?KIfnv8DTlYiYOQMdqFKsNgzWqC7Lb6htik/z8eJMScpOsLJfLy2uGjlP?=
	=?Windows-1252?Q?Wb5Lbk1ns709QGZ2hLYwrpGpBz2lJdLbSioCd/ZspVwfONkcISEdn4np?=
	=?Windows-1252?Q?6pCXrsCB3EkA0ao2JCo/A32GHJKclmL+mwo6fyNNTM9Ihn3NIWB9M69S?=
	=?Windows-1252?Q?9fN41hVfjLfqYqAxe3hUf7rFHkPnfTrvkb+xGaVsbGTLLXJ34BPHc4tc?=
	=?Windows-1252?Q?Y8HchUafnJDBUMXHRnv7vH34fpb5F98Sv0ZUZTRlzwSCvAFzsei+wGPq?=
	=?Windows-1252?Q?uy/0wK2kAfrVNArzjNSgXkAlvQsYs0v+rpbU7LAw7xw47d1aGRvOt/tl?=
	=?Windows-1252?Q?6n7THZkY3gF5G7W45Px/SIYEE9h7cLkN22WRl4yDcD7R8P2/EJqdBFqu?=
	=?Windows-1252?Q?KaMNvMPu8Ux5jK/v5qgh/0L/3hzc0fL6LkDoVNARfAOOKyCQmhgMEvPj?=
	=?Windows-1252?Q?qTekUi1laoh5OvOvaA13A5jRkDUDlHxkkSVyXjKu7hCV03/kwbq7u/td?=
	=?Windows-1252?Q?T9bxxclCWExcFTj/tC9k1+7/KGbOzJZuyCUSc7nIwgWXzWcp0ifv5N44?=
	=?Windows-1252?Q?bg8RyprmDnN4SqbbdD+WbpLAJEN16y2Kzwgqgc9pYETlTcJ5y9I7UO8K?=
	=?Windows-1252?Q?VprlIA3uN/miRlYt9FZR8kir1WU5tsXnMpeMx1FXSkED1TQI0mOYjCy5?=
	=?Windows-1252?Q?ROVdrMwhF+pfDaAyDd9hccUIhJFPrClfDCBjgw8NiG2NpL0vdrTCRWGD?=
	=?Windows-1252?Q?70s7fu4KvY5pJLpreGnXxekTyvcHyz9jZ9Sgx8xOoiy0V85lqhp3/lMN?=
	=?Windows-1252?Q?5HkP+YhAdgBkjMgo7t43bVp2Kn+RXo06rx5NcgQZf1s3F/wN8fxt5w+f?=
	=?Windows-1252?Q?xvvpMcFq3h70OYxdgq4fCst/sQuMDQR0OJBJeyiZFvlP+ffzM3t5esXV?=
	=?Windows-1252?Q?1ddP0o/KZUoGIqBCpc9o9OWhqQbEl4C7WFy7mAuF5Cx7DuUMwCiDLNvB?=
	=?Windows-1252?Q?MwCCUBi207iAOA1/pcT/1uy5rMN6CG3dSsBYID0hK+SWDDn3oIwNEnP/?=
	=?Windows-1252?Q?u0YQmSGxab9abVMszY3fiX5zjD8do6ImGLCpegdgtmj/H3iODNcTRN+N?=
	=?Windows-1252?Q?rcJ3Om/x+hg/v6U7zfuJmWhHpndrknd8SpyNxQhZ2JwxiFdEaYa+Y6Bi?=
	=?Windows-1252?Q?2zW0YRq6QFfIJpBntCKRdD2elc0geZhRf51kam0=3D?=
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(39450400003)(39840400002)(39410400002)(39850400002)(39400400002)(24454002)(288314003)(377454003)(2906002)(86362001)(305945005)(31696002)(7736002)(4001350100001)(81166006)(6486002)(66066001)(36756003)(6916009)(47776003)(230700001)(23746002)(76176999)(50466002)(3846002)(54356999)(77096006)(38730400002)(50986999)(2950100002)(6666003)(53936002)(110136004)(6246003)(6116002)(5660300001)(42186005)(33646002)(64126003)(31686004)(189998001)(25786009)(8676002)(53546009)(83506001)(65826007)(478600001)(229853002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0401MB1324; H:[10.0.62.53];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY1PR0401MB1324;
	23:B/yod9GLuU+SgR7Fg8f/+xTD6qiqesxycpM?=
	=?Windows-1252?Q?CSV1a5n3f1NT/JO12HPHhntcia2cBIhFnVyAsACPN/bP69tonM3nlO7a?=
	=?Windows-1252?Q?hFDFd98Orfkso2SOFNqdj1Kg/Bt/OUlO9OqVdB5Fr8tFYeNqFT4UAblR?=
	=?Windows-1252?Q?mBoJI7ds/zjp+LhqtPmAXDvAVtw9hbI33co7xVY2W3Nsy/mOUa3e71GZ?=
	=?Windows-1252?Q?M5cSs10ASRahUZmiWdMHep0fHcyMnX9knc9iCyKNBhcstVnJ4cMGIcjj?=
	=?Windows-1252?Q?Vr7VczBDZNxe0IRKcOqNCDNZnyEA7CTm0s5RF18aKO2Iyvn+6dh/vZdj?=
	=?Windows-1252?Q?dk0D7/pMYptDW6OiRApOEy67FIJtfeOLO9CZFAkdqWRjcvFz/lCZHd3d?=
	=?Windows-1252?Q?KIc2Gr6Nzw9lzDdN6B4j4lYxqF1IhQfjka80cNvqnrv8Qz27EQ7dMqlc?=
	=?Windows-1252?Q?/rlJkSvzTQ1r+o9I3iPn+sZ/lCH0klcpdYC6WKPVc2i0ls9Qc9ctRDiX?=
	=?Windows-1252?Q?I4jN4M+Rv+sv9IUBQPW3isFhHX9HY8CWl9V0t7H9qg4sa43/9uMd52BE?=
	=?Windows-1252?Q?JPGfZbUI52SQhv/VNwef64QGBObFwtJZ2uBzqEk04Y05lsE+mO6a7u8h?=
	=?Windows-1252?Q?ELx7oWIByF70uTqqzBUadF+4nGo4Fwwwe7/RkAOd0/LvC3s+8nxRml9n?=
	=?Windows-1252?Q?DgFMUEsM3+Yze+WL9Sr/CdoZosawNOHNxq3BnePUZLvUmMBnwTRm+at9?=
	=?Windows-1252?Q?SXueUMieoCi8MIASzr2smDnAXdVxkMHgyXTDbezexUQq4F/2Lvp3J+Ch?=
	=?Windows-1252?Q?+Gr6q5DdUQBZ0I3EpYeGDd8WTcbJ3OwatyhdO1a4+T2yQi5+N4I+oR5g?=
	=?Windows-1252?Q?uPfY3Ch9U9+WzGPTtoET28ygp8nvzp4UA2NQClTxfw7S5MhUb/+cj46L?=
	=?Windows-1252?Q?ygof0C3RAvxIyqsxi6XG1oaUVZOO3qPJCWFWfAxJIgXxjrA2aDPZtzb6?=
	=?Windows-1252?Q?qOboV6XqW24HdZ31ADmt1LAMJIhFG+2xtI4F87BSaP+KOgZBrq4y/Xxp?=
	=?Windows-1252?Q?mgHZEH5O2YxTry4crLfQ5YTy4qdN2XMv6Nnc2HygiuZXUF6Tz0A3geMi?=
	=?Windows-1252?Q?ux2g8KUD2/xFsNasCXkaBghQDxWkWkD8vJNsqFbtju8MQ1lVfg38KeCQ?=
	=?Windows-1252?Q?MpU71rj4VhejA7A0fOoAWxMACq+NivfCDvnXxX8cv5icacL13RojVkrR?=
	=?Windows-1252?Q?5zly9yeIccWG8pVe1MS8+dN8/aqfg3dIo4utQkpVDkoyWPdB2lhgSS47?=
	=?Windows-1252?Q?m+ZxNXkZ6n5F9XCYvirznW3/ajOrGpiAFaNP/xZF7bzdhd7597RfcaG6?=
	=?Windows-1252?Q?9pH1+q9ADtFc3?=
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY1PR0401MB1324;
	6:4nFTHWl85g5mtF1DY3XTHsVQiHxCaKvWZviw?=
	=?Windows-1252?Q?fLtDXH10P4sRet9Re7U/ikMMcEHmAkhk60dkmplXpdc5iSjhQUeNfCJ5?=
	=?Windows-1252?Q?scSmcojDCQfwz8e5NANw70dPeP7Vc8o3FTlWkgxY1euXxNWq7MvAR3Fu?=
	=?Windows-1252?Q?5eL6Oxg0hxeThaJBjf/tc1aPus1QesTcumAMJglAW4wzmUL5WjF0GwYg?=
	=?Windows-1252?Q?nX+AZbOvBT2snmCvTfBkf0R8mehaBSYUshahlcXQ/k5vhPySwO+4AuWS?=
	=?Windows-1252?Q?0D7IlnqQtmq3VwL0YVvuVL5fEt0zIVV+C9kKQGrEpuylyLHRtQrE+yIm?=
	=?Windows-1252?Q?SNGaF8ajioa/6OqfvlVvAQX5CBs4iaN4Y8/5bnDSUu0g4OnQejkrXj9X?=
	=?Windows-1252?Q?rxn2ffJhYlaaoj89+P4H/8jWnqyE1dgP+5D/bHdEyjgMaYFgQnfxepU2?=
	=?Windows-1252?Q?iUhR9bjalxiQySMEt7QVIV/gHJkhZF7mGaQCCLDHaoMmfd4K+WgJGrpS?=
	=?Windows-1252?Q?MfeLFngr6hI0dsnfCNcNdxa6YyXvf9GOI36V+Tr7X3xDG3M1M518MVZw?=
	=?Windows-1252?Q?9BFXf6vlwaMrJFpti0X2wMa209VuEPVRSCs+uHe7KZT6xweq+V7VjuQk?=
	=?Windows-1252?Q?bfXqP3y/c3K2xwhK0ERHwMqM40V0273UvyHp2Ew49U31QzRYUhFdQ9MM?=
	=?Windows-1252?Q?a+XpiBEb1niGi5EfHcfCw0CG+0Q2yvdssnXIDDdsTAc6cp3hGLAqR4sU?=
	=?Windows-1252?Q?ae6ue0MAiGXEdDseYjM+6kHbxb00+Y9sBE8wX6J9Bg1qAgmr4H6X4hkP?=
	=?Windows-1252?Q?ch+rD7aXzxxNNMuy7Ng2Uxdv7Jaq9173cTP2T5wouPdQ0Bz6jJXPVg1B?=
	=?Windows-1252?Q?Mnh5x03aDQcK5oNixWb7Sl94YxrXXwUvMpycJ7nrVuNiLyUy2qm+7EnG?=
	=?Windows-1252?Q?/A/y7/zJ2yLm6uRrFiC5yYIB/9UQnsAi6TuiqqqJz5gC9riDOatEmMrJ?=
	=?Windows-1252?Q?4Pd/fiMepW6Aa6pNObaQgvjUadn+vlz0gxf19VtXV+jYgF1thyh52TsJ?=
	=?Windows-1252?Q?twVMtfZCADvjB/k=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	5:YmS6JRMdlNPeMgzFaw2ILmFMTToxp1XCcl4fBIZnk41vMBQxIDSX4DbazuXvrrA2TaFXcpSYN03Q/nh/Zuh5dbvvcOf19UqmOo8NPAOFSUUWXyoazJTwa7CBzP7HUaodoFicRmawVhsjjK3+kWOYRqyFk6TDIeK/MEAJs1cANF5E6BaJZt6w+GUbiPtgoJ+EP40oqFZ+GJNs3PpDYaIrya135ojORp/6MheMHPHyJE6RG+tSlyiiSgx06Yx9iDWOGq5RpY8X0ORjALoKKd49ubY9HKLOG3UAtrolSHLGQKK7hc+tMeoEoE353cVGz761h7qrGCz1134eQxHNWDqhtPU9fHR/70NaTHL0OlPpwFtOlCHBOXBK+TOkg5ISxWSN+mo+OnHUHR969gjSFE9OeznAnTtNjCjhuWauH2Hk7sIyVmm/NOkSdCDbkPjWtVllLX4TgtW29fuQrE53oBt8jt7Hm2OkujXYV5q4dwSAriz1bFBSoM1QAW8X5I8WaFSD;
	24:9sqryWxsEt+tvVXW6i6HFQY+VJ42K846y7SH6bb2dWyt+5p2XPFaKi/Tef6FlLaZ7BgiYrFaXouxDdHCoAKY8ID0KQbIreqq7Q2ZGl8VpdE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	7:AXOc9QInIE+LTbpx0fxv9VZLHNi8CaA5x+Pa1od3Wa7z96bGCwTb3WMAb7lefLXJT78RcX3kG8YXSD26527rrUDdgTDOXw1lMt3lsuv+YwSoVhEWRJE+EojTeh6z/0p2ASWiHlbDhvCigLWBoA+G/JwHv/ftu7kl40syiy+xywGHLYszB8fqdXu3nYDJ4yYwYj+OIqZpSdxoZ/in7gupvyFvHffMSJ7Q94vKFQUOd5bf6iNKaqSXGZP2ugqc1tXDYCBepvWxAt+fA88NxlvZMXgRAKn8JmjyfUAtVmiaVJIQJJQ3fcrrMDOc3pRXLSXCyrb1viYOF5WQgL9vaXHUM5KRrM/NHWboIN55vwNw5Tz0ySTfcSc7Sz93vPt1z4aZQF/ICgzEmehGvKgVFSvg/eHNGvZDdWgXBpZ3sOnHTT5McIwm++g+LePlcd54jv6efuWjM9C7QsAUCkBQxRp1/NCVHHyYljfax4uJdrwfQK4TSn/t4aquab/PaDa08KLPv8EsaabfLUNYK+XtYe/LS4T8FvMkkI+P/pLFUm9EpvJXgWbaNIu92JQX90yXw+sUB7q/EL4sq0Y3psjHZ4jxcKawHCEuxWl+xaJnJSf2jzv8OwA/ETzyqAVWFaHBLoX83CtVjBDsnI8oRqUmaAzWhz3CC823qAA6ZaPAVrY2UadKPi2eHeCNM5d6SWxJ0yo+4NcydK09/4ut6GDAZMCdZzof/fl7gcGNsdF5cbQds1BoCKc9vMC2ft47K6DjrgxQwF+PfNcMYihRCWJb+uxaQK3u97XDuLmxcPNOceGDK4g=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2017 18:43:20.5003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0401MB1324
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-16_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706160311
Subject: Re: [PATCH] package_ipk: Clean up Source entry in ipk packages
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
X-List-Received-Date: Fri, 16 Jun 2017 18:43:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 06/16/2017 03:46 AM, Richard Purdie wrote:
> There is the potential for sensitive information to leak through the urls
> there and removing it brings this into the behavior of the other package
> backends since filtering it is likely error prone.
> 
> Since ipks don't appear to be generated at all if we don't set this, set
> the field to the recipe name used (basename only, no paths). This avoids
> information leaking. We may want to drop the field if opkg can allow that
> at a future point but the recipe name is a suitable identifier for now.

Looking at opkg-build, opkg requires:

	Package, Version, Architecture, Maintainer, Section, Priority, Source

while deb requires:

	Package, Version, Maintainer, Description

It does makes sense to require Architecture, but doesn't make sense to
me to make Section, Priority and Source mandatory. Opkg does process
packages that lack those fields.

This should be a trivial change to opkg-build, which I can submit into
opkg-utils. Including that patch in the opkg-utils recipe may simplify
things here.

> Reported-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package_ipk.bbclass | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index d2ce3b3..8e69b5d 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -57,6 +57,7 @@ def ipk_write_pkg(pkg, d):
>  
>      outdir = d.getVar('PKGWRITEDIRIPK')
>      pkgdest = d.getVar('PKGDEST')
> +    recipesource = os.path.basename(d.getVar('FILE'))
>  
>      localdata = bb.data.createCopy(d)
>      root = "%s/%s" % (pkgdest, pkg)
> @@ -205,10 +206,7 @@ def ipk_write_pkg(pkg, d):
>              ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
>          if rconflicts:
>              ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
> -        src_uri = localdata.getVar("SRC_URI").strip() or "None"
> -        if src_uri:
> -            src_uri = re.sub("\s+", " ", src_uri)
> -            ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
> +        ctrlfile.write("Source: %s\n" % recipesource)
>          ctrlfile.close()
>  
>          for script in ["preinst", "postinst", "prerm", "postrm"]:
> 

-- 
Cheers,

Alejandro

