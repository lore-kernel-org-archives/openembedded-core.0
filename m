Return-Path: <sorenb@xilinx.com>
X-Greylist: delayed 895 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Jun 2017 03:11:23 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0041.outbound.protection.outlook.com [104.47.32.41])
	by mail.openembedded.org (Postfix) with ESMTP id 330E078229
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 03:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z+0Xa+2ZO/rX4gwhAoOR3tVCqGsFtiZX0SPByJfOWvM=;
	b=lWW+yABnwgNNcwmomHM5061asiPnttYsMGXO80BTUZNooYHdhWZ94sRsrqPTtUMWwUGFCrhPIcui7NAR5krRI5437bF13+hu0vk4YcvcasC7Wj9Ols1cAf5kEfm5I8s7URus+tP/3dMaLG5L+j7WUrVcHO1ZlMy9M0B3MdTYy9w=
Received: from DM5PR02CA0051.namprd02.prod.outlook.com (10.168.192.13) by
	BY2PR02MB348.namprd02.prod.outlook.com (10.141.140.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 30 Jun 2017 02:56:29 +0000
Received: from CY1NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by DM5PR02CA0051.outlook.office365.com
	(2603:10b6:3:39::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1220.11 via
	Frontend Transport; Fri, 30 Jun 2017 02:56:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT046.mail.protection.outlook.com (10.152.74.232) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1199.9
	via Frontend Transport; Fri, 30 Jun 2017 02:56:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dQm6d-0005ZE-BZ
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Jun 2017 19:56:27 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dQm6d-0003OU-8e
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Jun 2017 19:56:27 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v5U2uKfv024699; Thu, 29 Jun 2017 19:56:21 -0700
Received: from [172.19.2.241] (helo=xsjveena50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dQm6W-0003Ns-RN; Thu, 29 Jun 2017 19:56:20 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jun 2017 19:58:19 -0700
Message-ID: <1498791499-10658-2-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498791499-10658-1-git-send-email-soren.brinkmann@xilinx.com>
References: <1498791499-10658-1-git-send-email-soren.brinkmann@xilinx.com>
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23164.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(199003)(189002)(5820100001)(77096006)(9786002)(189998001)(575784001)(76176999)(50986999)(4326008)(47776003)(36756003)(23676002)(305945005)(50466002)(2351001)(106466001)(2950100002)(6916009)(33646002)(63266004)(2420400007)(10710500007)(2870700001)(8676002)(81156014)(50226002)(15650500001)(8936002)(5660300001)(110136004)(107886003)(53376002)(6306002)(36386004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB348; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT046;
	1:YtjF0DydxT3ljg7x9wq09VyDwF9y2lrXj9zm8m5hzGarlX7Hyd7XEXP/r/TP+zsvJ/U5WnuIhefu9QiQE9P+MiKqtR6CsOEpvzG+fwJ9Tk28mcTBgb+uGuUbVf9AxrYwGEtafgysofQmbMXeYByQVDiTHsMuKdLU/0vhbBNTSXxqoJV+RFLDtah6+iltHMA+BVAl3YWHd3ObaTxgTyC6lF9uqjeJOW5KGa6FH1+4TJ1K/p5x4um4BMEY4kJZLdLVCljDZ81ERxfCTw1Go8ykVPQPWmVCt042wCIttCSzb8lPZdB1SYSG1POF+Kfdjwy69Heh12U6uPG4cNW17QHQY3axR6qbXnyOT8YXFuFuTWC2YQmIDL72BjfleeqVSJW9NHEb9cS6yBT/5uWUseG9N4L++wUglUF3cdnbGksZLC9NA++Dm6RQW6U433mdtWnTq4xdk2pMfBbFMXzcj6rbV9yNr0jyMhwh4Mp9NqKlEbfqkdD32RJ6SK7SRtAyWKMFQxmpdmCnbB3F35fQzuqyoBv2ZlDrdw1ja8x7r64A0NdzmJhn/rf/aQpwY4UnZbE9OQZa1r1oD2Xy998fDIhzltAUGHAIBr5Y0mUz0E2ysvMUgTpvuADwD6SQ0QYQ8K8rQd0OoJK1ACRpJHU/CtRuNDigq8YTYAi0hx1vIAGgzj5bybQWcdUAeYVxtu2vjNL8WZ0krWlCfkEzXM0JrjeZ1OWsIUaTGz1Psp0P03ZID54Ykvx/SmobvdpcTokM8Q4kxPwNrFbPtolIw6QBasM6/pJwVzWlgnx99oKFZNV5EHeLFPZTjFw7ag85gyQTeOchOZqX0n5EKcrDeZVg7Mjc4NrHICJJ4AAgZOSyiCWmrENz33rw7Q6UnuR7hWm4y/je
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48bb40c1-89d3-4a58-963b-08d4bf639ad7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR02MB348; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyTUIzNDg7MzpjWE1Wd0ZpTmc5bmtuQUZHaHgyM05zWUNHVkFQ?=
	=?utf-8?B?YlJyVXEzR21MWHVtbGZHQWZQUlZDbTdtRjhVUlVzczdxSFFrWDJ1d2QrZ1Zh?=
	=?utf-8?B?OTdjYTFjVGFrZ0ZKTS9rS1NnNDNXdElIclltSkZZd1M3Y08zNXVjeng1U0Fa?=
	=?utf-8?B?UnNoMGxzVkxoQUNKNTJsQldYd1ZDaTd4TEd6VWdiY2hkYzZYck0yb0gwWk1x?=
	=?utf-8?B?TURrL0VpTzBzajAvS1ZZakJkUzBRZ3cvSzJlT3ZSand4dHhkdEg5VktVZ003?=
	=?utf-8?B?RWVrYVR6MG1jdGxQWHFKTlF4Z1FrL0xFUUc5K0prUGFvNXNvVWFwby9udytL?=
	=?utf-8?B?dzRoQ2tHbWs1N0k0dkVjcjl5MmI3NVpqd0tFdWlidG8rbWgvNzI2L0orM0FS?=
	=?utf-8?B?SGp1RUw3Rm9VZ2N2NW5waW1aRm1vNjU4Y20xdHptZ2ZCeDB0MzgxNy9wSDdS?=
	=?utf-8?B?c0pxcmxuWll1SldUTVVIb2Z3N1JSUnZvbElWRjBkODkrSkZBaDhSSFo3b3Iz?=
	=?utf-8?B?L3VEdDIyaEhpRVJncEZGNXpLcVlJRVlSbUsyOVVWaHV1emorSVNaREpLWUxZ?=
	=?utf-8?B?UVJzZENtMnc2T3M4Q3VoY3RMWDFWZ1NzUXVqcHdtWmozM1NnbWVXVUViYkhT?=
	=?utf-8?B?RTJGazNsVUhXY0R2aS9TaWRNdzRwRXd4NmpBM1U5MDJ4cGRUdjhLRTlDN1py?=
	=?utf-8?B?Y3I5RUhWMENqM1BjM1pMMEg1cmlsZStpcFQ0U0dUR2FjSVVOVXJSWG02cytH?=
	=?utf-8?B?Snhxd21QTWhhUE1jSGg1TnUyNUJCUm90QVNoWklSYXA0Y3h3ZHdHYWg0L1Zr?=
	=?utf-8?B?cGN5ZjI5aGVPSk5uR3M4blVJb2srMm8vNlJRTlg3bkJSSzg2YmVCZ3ZxbkpH?=
	=?utf-8?B?UnpjR1A1Yk54K0lya0R5T080aGtpSXdNV0NFV2trY05NYzRzNGRiMVBNdmwz?=
	=?utf-8?B?N2hNTlRaQmNWQ2hDMTZBWEZ1Q0doZ2FXUndEV0daZzliTG9qUkFHaksyWm9F?=
	=?utf-8?B?bHRUOS9Lc2xHc0NRZXZYMURSWFJnckJtOUk2QnZjRDFuT3A0UHUxYUc4cFd4?=
	=?utf-8?B?VjdwbEpPOE5kN2NWck00clV5Y292R0dVcDJSL1dDTGVHYTZaUzJIeGJkbFgy?=
	=?utf-8?B?UWlSeG5CenVFbkpBbVFCbWZZSkx4ZmFWMXBINDg2RjE2WEU5MnZDa3VyNFJt?=
	=?utf-8?B?WW51WXVhR3pEdEVPY1EwdFIydVFEWGlqMzBCYlRIZ3UrWG8rbEErRFNQOTE4?=
	=?utf-8?B?RjVXWVlNakx5ZzNFZDBWYmhtTUdZUHRrRnNCeU0rQ2FYcWwwZnFocmdyUEN1?=
	=?utf-8?B?TDd0R3VzUUVBPT0=?=
X-MS-TrafficTypeDiagnostic: BY2PR02MB348:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB348;
	25:IZ2Zr2uvpKVlcxyPqmn6t4VToFkStKhlbFp0WtWqZK1usUrJ4PGxo7JzWX9Olq5MAN4T2MMAmbIgCeF3P7ga/mO9Lj7CpUNhJfV1CCPWOwSvreTKBJA/nu6WYlTbz0OChudliA66cghn5E64wdCeplKSQts1m1qR9QdTXbI4HixOqhpkkPLaSYZ6nrWemHS9GfBhJdsi7q5JjruHiwZDNcJkokYwl++5wRYvL6U+T0bfiPTNrYSe5RODd4b4n9LKTn+Ef6RyoB1XseXmpELyjYNg04F/wwVR0aWVnDFeSijAIXz2iR2yIuhjdGXDCcHS9AuJ6X9aD2ntqWQlgyCi6xpclb6I7CfkpAhMN+uOdLREKKB6jyFmuKECQQKO5/vm8Pk325xKFFxfg7yTEEWpthIsWkIETYfIdt0D8FNIXk8BBcdf8IE6U1KgsaKqnVGGqOI1la06+zKr6ubA2DORPlkzp6yXNEI950if1/0ne1DJExMjl2Kee45YwV6ARGQJUK+YC2B6u/n686H/5rGKq1INyebvRJapHy2z2UljqIHRVruZihGWdu/JJnWMDJWMh+8TZXb248YucyAm05gtisJtTo+N8pKmtTu5bqTJiIm2WU0sdT6UEvhnl2OQfHAHW2TShXzwB30B+PIibosKZRqrRItH8WhWvEij4OhG630LNMj3zwZDsDt4pf6Kxdxm1WZEHiUDdQKC8YXIC4hJ/vn5fSThIuDg/BzJ6T/CInFd+ga5NHzKcWQ97tfXP7gOLEEGBA99PFjBaqJjevRzOUdwNdhm4VBenwwLZsTfJKz285z48DtGECzTG0Z+eP2HzZAx0HPKU33LLBqBYN8sqiSuWD+QHeQct4UdJXAet0ubnXXuzFn7/GZue+rLZLw5A4iLi1Vv5jNSJ4qDspca+nHq2KOH4kgApxc6ugktDB4=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB348;
	31:iFJTjHBJNSwTSxrRLGU7IqLYRhXyP1drsvLqkGYeBhVTNS6AdREC3OUxzgk654ZGuCBO34tq8X4hOHytNjJlPxCu8+DoJpKdsC84n0iDgIOp0NyJGseADlxXsZ5cqXlvFtg/AFMsKea+qxgnqhfKAQARRZHqnTS/cPBK3qtp48P+u2bC295ztp53QsOTagQ3pHlfnNHLB2hngDO/D73SxySWa8GKUGg47xj9nbq8+1u3D+7pVYx7XPwpBRoucM0MsnO8JQ2Aa/5ecZECdFCeTMoLv08ndtJtqe+n2tyX792M+NU1BUN9pncqq2Qq4kz5tXxoeZfwMlKeCbq0Pfh8f6e27MPLtQ0cqxS2AKXXwA9LVV8iuQ4Fcw/MnEkZF3oBBbBGFl6WnvxIIwbDw73BMf2Szt1AfjywcTK/A0w/bkXwF6N7VbsfiUbyxlpvVKY02mRbTRRXjiaUXHd5nrPu1k6YY/nuANZ94ZdAjJxHjazAOoKbc3I9a28Yan7G2Cnb0MKADlcnpNenbWrk1jApnhcTvN4lQ2jAXZRFJIHDNRGTY7RbOMQzAsWygrAcgwYBH1v1NGx/vPYhu+6Ty+ktzNVas+tCb9dM1qGZO24eXFIRhdhfoCBJ5eaNohcRg5I/6bWH2RpBbi6So2p/A4IsGKTTChekQo0VwFlEmtM1uSG2KlzoABJznOsgQkyWMPEkks3/EwAet92RF+OOIiTnDw==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB348;
	20:R5qzi2UMp4eoHidw1arvW/1ZlHXYV2Savi2T912gtAbR8444zKKnKAo7jPI8yC78XtYmDoZD78t/T05vyF82SJYTVAr1O2TXl0WcaWHmCqGted3iCmPMe9MIuGn5l/MiqNmkTssrRKMo2efDm9wk2MK4J7/JYPuWgfTHkqG5NiaNShfm1xeXI8s8MjeChHgniy1yHYufg3F6vwSxmXfrETTxqaltfee9fMlDv6mHjRzh6IVOFjskTlUyNauKaM/FypwvckShxSEumxxOMJq3aPLtQxUI8G2kste65LxelnTiPKlRnX45uhtxqdB9EN5esvrJR4KFf+i+nJfD54YmeUYvyDBa175rLPXxAnW9+rP2Q3Vu/50tJwwq+FVwTlkTmim6CNQXD6TsaZOxEfG4H/imiWk6g4YiQZI+2NJ07V0Y6WlSoZa/5Sllor/ujx0Y+RPeNU/KYxYvGe+9M/okXf4gOOImNmMLZRBs/+O/L1pu69a/+mO1Ljemk/sdUXGI
X-Forefront-PRVS: 0354B4BED2
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyTUIzNDg7MjM6M1VTdWtEYzdaV3ltR0N4VTlBa0RyR0JURm9U?=
	=?utf-8?B?RC9FeHlEQWI1VDg4RWJyVU15L3doOElEd3BXamNMNy9PZ3NwNnE3UWNNZnYy?=
	=?utf-8?B?bUY1VXdoaDF0L2JKMFcvbW1semdQSlQrNjF3U1lnM0xBVnJSdkdaQVZ4VTdG?=
	=?utf-8?B?RXFaZ0xubFlFNTUzYXF6RnI3YUxsaVZ6L1Y4UXRJNVczSVdWQU9LMXgySFRG?=
	=?utf-8?B?Q1lyRjExckdGMVdSYVBZeTVhZWYrcWZmcURHZjZCRzl4R2pKeFI0aVdaOG05?=
	=?utf-8?B?WUl4WXZSNVllS2psZEl2aldGb0JadklFT2cvYUNJdlk2Vm1XNG5iWjJSY214?=
	=?utf-8?B?NHJRcndHa1k2YkFRWm5qSnZvamVpNzZFKzcwR0YxR0VXU1M5VURaV2R2WHkz?=
	=?utf-8?B?elVGRnNHSC85cnJMWElQOWZ4OXVSSVM4V21pMTBpRUVNQnd6OTJsOVMwU1Zm?=
	=?utf-8?B?MDJmQlVIaTRVVzIwNVh3TkdzS0ZlSS93MHRlSStKY2s0M2xtV0lpbVdxaFhV?=
	=?utf-8?B?MUdPNEVpMUNSZlc5YkQveUkrRFJ6THB3QkpWSnhZb00zam5iMTdGU09KVzZ3?=
	=?utf-8?B?Y00vRVczWUlaVkNsN3VhQkluTE1WQ0JIWWY3SG40UkJ5WmFNelBvYzFKSFpS?=
	=?utf-8?B?TndZY1pIQlJuTEJ0RXg3MHgyUWwzMExPeWd6bUl6T0hUMlYwSnFKaCtWbHFh?=
	=?utf-8?B?VGtFNTdJb0R5Y0IvTFZGSnRWM0YxbWdQL0k3MDNNMUtEWTdGWTZUd085T2tN?=
	=?utf-8?B?MUd4d2Jaek9TMlNlbnRQQWRCMWQ2ckV0aTRMaVBZSC9YTWZCQytyUFUybWhD?=
	=?utf-8?B?MlpBY3gxZlZtb3VBcThxUG1UdjJjM0RaT3FjR0tGeXZEV0tPZUVVMld6dVV0?=
	=?utf-8?B?a3V6T0RrdW9XaWZBcUdBbG1kRmdRS3BFVXNOb0tnVmE5RlJ2MXZ0NTVaQ3dK?=
	=?utf-8?B?cThHMVRiSVlQTFU2N2JFdkp6Ky9SM2NuV3hucGlxeHdId0Q1aUVYWjQ2UC9h?=
	=?utf-8?B?cndBMllWWmtGQ1JVUnBSLzZDSjUzZDA5ME9udU9qQ1N3ekdCTVNkbUJCS0pZ?=
	=?utf-8?B?U0E3eTd5YVkzK3ZRQ1JBb3RrcSs5cG92RnJDSWlpL0RORCtvRVBIdmY4Wmxa?=
	=?utf-8?B?SUw3bXh2bUVpNFJVZlRMS3JqVzZ2Mzl3QXlzMDVuNDBobjdGdHRBZStiMGM3?=
	=?utf-8?B?NjdlaS9Ed2UwWllpT3Jkek5jME1WY2hYL0tENzFTbldBbDJrWHpiTmQ1V2tW?=
	=?utf-8?B?Ym1MTTFWNkhXK0lBTEJJWVZldjRMTndjemM0TEFidE5uY3Q4TGIyRTN3d0M2?=
	=?utf-8?B?ZS9DaEFrQ2lTZz09?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyTUIzNDg7Njp1K0d2R1JGZ3FEVkFwUlN1YzZEU2hUb3BnTm9s?=
	=?utf-8?B?YnBDK1NPVDEwZUw3RllUeW5RRHloQ1p1V3l4Ny9QU3V0MkxpcmhmQ1plV3dz?=
	=?utf-8?B?d1puaEN2SzR3NmVZSWt3VDkvNTdhendQQVZwa0lmT0lveFBRdWE1OVZqOGhq?=
	=?utf-8?B?YXRoWTNhM2d1OWZKRTlDaHVXNjJJYzV1N1FSb0paQkYxTkJ6SElKRWpQQmwr?=
	=?utf-8?B?dkFoM1hBZDhHdFYzSnpmbDRQendScjJBaDhBK0ZTdUpBa2JvN0Y4WVUyUEhs?=
	=?utf-8?B?aU5ueFdaU2h0dEJrV29KeDBVTFZBbmFTeWp3aEptL0NROEF2b0ZaaTVhT04x?=
	=?utf-8?B?ZGJHQVArZm1xRjBXUXVFdVo1Unc3QVk0YUEreTZnTzJYSmkzT3A2UjduUDRx?=
	=?utf-8?B?aGxpcUxNN3c0aW9kMHFMT1J5TE9HVzhTTDhURnAwWTVyYkpWalo0UmcrK1JM?=
	=?utf-8?B?dnA2bWRwdTNCbjNUSUJlc1RxUU9kUXJWMUovRmZZeWs5ckVlK0dNUE4wdXF3?=
	=?utf-8?B?dXdmS1lMdkdFa0hEckt6MFE5UEJ2azl5czBYMnRmY0E5b0UyVWZoaWtnYUk1?=
	=?utf-8?B?R0dEWmVqMHdIUldsalJPSTY1SGVPRnd6Q0djN29paWtTVXIwazhFZTRIQzR6?=
	=?utf-8?B?cGN5WnF3SkRORDE2YjNVZUNNb0hRVzFvNUViYzJoRVpjQk9pNVRPOGVFWXBk?=
	=?utf-8?B?U3pzb09pV0dpWmNxcTBIOW1VMzA1QTdvc2VpelhwaGl3Z0FFcUYrODQxekZx?=
	=?utf-8?B?bW80TXJxL2NubFlwSm56YU1vbDczQm1KQ001amJZb2NPUFYvcU5jdWl5VENi?=
	=?utf-8?B?UnBYSFdoQzkrc3hid3lMcUNuQUlpNGgvL2duMjdVS1pQU2MzWEV5Y1AwRmV2?=
	=?utf-8?B?YysxbXBhK1FmY0loNmcrOGhvRlptQjdMblFYeHhZUFFVdDJtV2pVSjFvb1Fk?=
	=?utf-8?B?aDFPdzV1engxUHZ3NXhMbWM3RGJIcm90RXkvcHhUb0xBVE1oNDlockhML296?=
	=?utf-8?B?TndyWHB1MXZhTXJBQml1U3gzQTFoM3JuTG03RHAvK0pGTUlwckl4UUFRdDc2?=
	=?utf-8?B?NWxCKzNQWlcxWUpEcVBaYm9rbTFxYkEyRXE5aU5GS1F1RHZ2djUwUG5VZlVa?=
	=?utf-8?B?NHljRGRNOGxRbHoxd1U1dTkvRUNHZUZVMWxNdjdwUjZoT3ZFMHJSK2hxd29r?=
	=?utf-8?B?d2RldXh4YmoyN0JqWWtjVHUySDNmdE1STDdkQXdWMWsvM2ZTQ3VxTk1vSUVk?=
	=?utf-8?B?a29jUWlyYmw1bis5Si9LRmhpN1pHWmJvWmlGdFkzL2swWTladHN0UlM5UlAz?=
	=?utf-8?B?NUFzeVljZ3RsaENVTEEyL1lIay9XM3lJSnhkM3pRVFU4Q3h3S2JxRU1sUjRP?=
	=?utf-8?Q?3Wk/vL?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB348;
	24:y99yY6c/AU9a8/yEFHUg8YkUM9/YJOmoMRXX5XlGGIjBkfvQ2Q0SfW2yK4ecZFYln+stBl9kGpHckyWKxk/Bxrv1ZYtvVnwlOQ23TNSox94=;
	7:3Mbbqh78eB+m2kqqhBfzMjbEYE3LskEPlb7tklLOjkDyGsPfU/AUGpyWpZK0KSjoKM3t1LfUERINYiVuRvoP37JCJdAwIfa7JuTnzkrLkhRDMKxp2iKugLgW1018DumQWND2dBv2CceJHwCHpStMDTgywca7S4XwEdcCgvJ5X7rK+l4sMgCRsCEdL2N9yrQyEuSjKzQ0BCBUBdGzJSgvG8HJhjB7ak7LkOs7Q9tnQm8bE/FOyZG8U832+PDR/SDSlTuqMLCYDEFEEdNKWSdqIy+YNAGkOqDf7+5xbxEm72MoQO6DNlYplW9nPmZGtgADOfg5eEgpS65ToGKqFIeudDUg6h90K3UgbSpGyQvZg07PCRX1OAx3YJxIPKEIBKXnJA2iYw9WdzhagWzHkv5kUUZBwJJAU1es16CIU4RKDwrhsqS2ezC0ijtW7CuRaj4Mr0bsKMbDkgEx/9uq2Dv70Czv4djsxl40eDbGSrl9ZcNhWVhT46dxcZTOvpj5mAlrwlgqGaEvjHMK1tBySbvJX0FqgfjpVxo0yLdi70vYRhrXfpAY99ql0TIGjoivKmzvKPIwUZ4NLutRb1Orm40f36xREf5bZTTbGJ0CCII2HXQgYq7KFymp9l6JQZ8X5lfhUdPoBugmaoX+l2BhsXykJMIrWltdp6jHvImX1A8RG1mazGUv+UNCv/VKmvRc8eP+nYd4zErucm0InxZvbzQ49N27d8qC/U9//gMxLOksvndfr5lnQ+1xE9s3HGj6pACzuyTf2O1R4vJfBvi91EwH5y9eXd9kimsmY8SeW0Ots90=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2017 02:56:28.4069 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB348
Subject: [PATCH 2/2] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Fri, 30 Jun 2017 03:11:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
One of the non-upstream patches seems to be obsolete and another one I updated.
All others still cleanly apply. I successfully tested 3.13.0 with glibc on
aarch64.

	Sören

 .../valgrind/0001-fix-build-for-musl-targets.patch | 69 ----------------------
 .../valgrind/0004-Fix-out-of-tree-builds.patch     | 37 +++++++-----
 .../{valgrind_3.12.0.bb => valgrind_3.13.0.bb}     | 13 ++--
 3 files changed, 27 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.12.0.bb => valgrind_3.13.0.bb} (92%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch b/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
deleted file mode 100644
index dc6feff7ffa0..000000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 1b1a024efd18d44294e184e792c1e039cab02bfe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Feb 2016 09:14:12 +0000
-Subject: [PATCH] fix build for musl targets
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac             | 2 --
- coregrind/vg_preloaded.c | 2 +-
- include/pub_tool_redir.h | 7 +++++--
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9366dc7..679f514 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1066,8 +1066,6 @@ case "${GLIBC_VERSION}" in
- 	;;
-      2.0|2.1|*)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
--	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
- 	;;
- esac
- 
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 2ea7a7a..e49c832 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -56,7 +56,7 @@
- void VG_NOTIFY_ON_LOAD(freeres)( void );
- void VG_NOTIFY_ON_LOAD(freeres)( void )
- {
--#  if !defined(__UCLIBC__) \
-+#  if !defined(__UCLIBC__) && defined(__GLIBC__) \
-       && !defined(VGPV_arm_linux_android) \
-       && !defined(VGPV_x86_linux_android) \
-       && !defined(VGPV_mips32_linux_android) \
-diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
-index bac00d7..fbb2ef2 100644
---- a/include/pub_tool_redir.h
-+++ b/include/pub_tool_redir.h
-@@ -242,8 +242,7 @@
- /* --- Soname of the standard C library. --- */
- 
- #if defined(VGO_linux) || defined(VGO_solaris)
--#  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
--
-+#  define  VG_Z_LIBC_SONAME  libcZdZa                // libc.*
- #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
- #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
- 
-@@ -274,7 +273,11 @@
- /* --- Soname of the pthreads library. --- */
- 
- #if defined(VGO_linux)
-+# if defined(__GLIBC__) || defined(__UCLIBC__)
- #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
-+# else
-+#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
-+#endif
- #elif defined(VGO_darwin)
- #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
- #elif defined(VGO_solaris)
--- 
-2.7.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
index ed313d644441..8885dd1542f4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -1,7 +1,7 @@
-From 38ae233b6893a4eec7f9ed6d8ad02392bca8eaed Mon Sep 17 00:00:00 2001
+From 739421e253e6eba3eb6438651822f80fa9c0502a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 15 Dec 2015 15:31:50 +0200
-Subject: [PATCH 1/2] Fix out of tree builds.
+Subject: [PATCH] Fix out of tree builds.
 
 The paths to these files need to be fully specified in
 the out of tree build case. glibc-2.X.supp is a generated file so the full path
@@ -11,23 +11,22 @@ RP 2013/03/23
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
- configure.ac | 64 ++++++++++++++++++++++++++++++------------------------------
- 1 file changed, 32 insertions(+), 32 deletions(-)
+ configure.ac | 68 ++++++++++++++++++++++++++++++------------------------------
+ 1 file changed, 34 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8ab7f9b..9366dc7 100644
+index 3874296fde0b..7a5ba2c8557e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -377,44 +377,44 @@ case "${host_os}" in
+@@ -373,50 +373,50 @@ case "${host_os}" in
  	     9.*)
  		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin9.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin9-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
++ 		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
++ 		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     10.*)
  		  AC_MSG_RESULT([Darwin 10.x (${kernel}) / Mac OS X 10.6 Snow Leopard])
@@ -77,9 +76,17 @@ index 8ab7f9b..9366dc7 100644
 +		  DEFAULT_SUPP="$srcdir/darwin15.supp ${DEFAULT_SUPP}"
 +		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
+ 	     16.*)
+ 		  AC_MSG_RESULT([Darwin 16.x (${kernel}) / macOS 10.12 Sierra])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_12, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin16.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin16.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
               *) 
  		  AC_MSG_RESULT([unsupported (${kernel})])
-@@ -426,13 +426,13 @@ case "${host_os}" in
+@@ -428,13 +428,13 @@ case "${host_os}" in
       solaris2.11*)
          AC_MSG_RESULT([ok (${host_os})])
          VGCONF_OS="solaris"
@@ -95,7 +102,7 @@ index 8ab7f9b..9366dc7 100644
          ;;
  
       *) 
-@@ -1015,29 +1015,29 @@ AC_MSG_CHECKING([the glibc version])
+@@ -982,29 +982,29 @@ AC_MSG_CHECKING([the glibc version])
  case "${GLIBC_VERSION}" in
       2.2)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
@@ -135,7 +142,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       2.*)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
-@@ -1046,8 +1046,8 @@ case "${GLIBC_VERSION}" in
+@@ -1013,8 +1013,8 @@ case "${GLIBC_VERSION}" in
  	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
  		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
@@ -146,7 +153,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       darwin)
  	AC_MSG_RESULT(Darwin)
-@@ -1057,7 +1057,7 @@ case "${GLIBC_VERSION}" in
+@@ -1024,7 +1024,7 @@ case "${GLIBC_VERSION}" in
       bionic)
  	AC_MSG_RESULT(Bionic)
  	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
@@ -155,7 +162,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       solaris)
  	AC_MSG_RESULT(Solaris)
-@@ -1079,11 +1079,11 @@ if test "$VGCONF_OS" != "solaris"; then
+@@ -1051,11 +1051,11 @@ if test "$VGCONF_OS" != "solaris"; then
      # attempt to detect whether such libraries are installed on the
      # build machine (or even if any X facilities are present); just
      # add the suppressions antidisirregardless.
@@ -171,5 +178,5 @@ index 8ab7f9b..9366dc7 100644
  
  
 -- 
-2.6.2
+2.13.2.3.g44cd85c14
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
similarity index 92%
rename from meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index a81adc31d67b..2f760d30359f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=ebb8e640ef633f940c425686c873f9fa \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=4b5e24908e53016ea561c45f4234a327 \
+                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=d4de0407239381463cf01dd276d7c22e \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
 X11DEPENDS = "virtual/libx11"
@@ -12,7 +12,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
         "
 
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
+SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
@@ -32,11 +32,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
            "
-SRC_URI_append_libc-musl = "\
-           file://0001-fix-build-for-musl-targets.patch \
-"
-SRC_URI[md5sum] = "6eb03c0c10ea917013a7622e483d61bb"
-SRC_URI[sha256sum] = "67ca4395b2527247780f36148b084f5743a68ab0c850cb43e4a5b4b012cf76a1"
+SRC_URI[md5sum] = "817dd08f1e8a66336b9ff206400a5369"
+SRC_URI[sha256sum] = "d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef2be74790190c3b"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
-- 
2.13.2.3.g44cd85c14


