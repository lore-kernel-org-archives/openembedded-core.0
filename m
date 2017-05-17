Return-Path: <chunrong.guo@nxp.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0097.outbound.protection.outlook.com
	[104.47.37.97])
	by mail.openembedded.org (Postfix) with ESMTP id D207777DCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 04:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tQQB+1AS65A47doSPAKJa59lf4bOG3GNAs69ELCNuK8=;
	b=aLi7dXWC30/lsdz87dyQbMArj/GK3MhI0PCu5ZtQbZR3eOz9+d9oibe32ronQhVoNtztuavX2acMzHFcPf9CAOb5neMi1njNFA1AQmLOibHubiRJ0LKVU8KTfRqdnTFSMpae76UDMtQwrWHV4CPQHveXL8fWlFdAgtLI/Aq9nAs=
Received: from BN3PR03CA0106.namprd03.prod.outlook.com (10.174.66.24) by
	SN1PR0301MB2045.namprd03.prod.outlook.com (10.163.226.154) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16;
	Wed, 17 May 2017 04:10:56 +0000
Received: from BN1AFFO11OLC001.protection.gbl (2a01:111:f400:7c10::154) by
	BN3PR03CA0106.outlook.office365.com (2603:10b6:400:4::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14 via Frontend Transport; Wed, 17 May 2017 04:10:56 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11OLC001.mail.protection.outlook.com (10.58.53.72) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Wed, 17 May 2017 04:10:56 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4H4ArFn012079; Tue, 16 May 2017 21:10:54 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 May 2017 12:10:42 +0800
Message-ID: <1494994244-10488-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39400400002)(39410400002)(39850400002)(39840400002)(39860400002)(39450400003)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(9170700003)(2906002)(106466001)(47776003)(2351001)(105606002)(110136004)(356003)(38730400002)(107886003)(50986999)(508600001)(36756003)(4326008)(5003940100001)(6916009)(81166006)(8676002)(42882006)(104016004)(6666003)(5660300001)(305945005)(8936002)(48376002)(50466002)(8656002)(50226002)(54906002)(53936002)(77096006)(85426001)(189998001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2045;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11OLC001;
	1:nck5ksEKEUNdBETAYVD0JjKf4zwcL0EJZs871UCc4vl5rZ5Zjfg3B37JA/XfrJeODdVJQIAk1Jt0RaUzBKsV0wCl/v32VjjShI9lfUKQ4FAalw674eMXgGIj6wQOsW+ktMCkUzGqJm/1BD5HYtZUk42ait67F37FSy1MhMZNXovlSrn/PvmOXjZnG8M5qbZtO9dw2Ep7I4QR162s/9U76h944c+NYLdfGqgKIY5I3p2HJsdsJpqunQ9G5ttWUwhMGxASGPlCW1bns1OJhqTKoxLpgniy0yYCqWZ5w2xxGcq0Cm9Xe9mGux+pZwJFrl31FHQXpKUaJpGseSMEtoisrgftDNlDaKM1LRHMp+Ee1jvG0kSn4S87ijSVEsYwlStPpNHoIOPUlVSHNFG7btDsJb5hAHFVyqso8AycUUak9Ci1Slwxurt3X3Pcqh/LMGLnO8rERsEdSJYuA9ExF5GuSCTEWEyovKfLMSuIuctdzd0gfoK+3duR2i0BSB+vlfQOLFHjwidtdc7wRgGmtcdv3HP06/B4mdxR4Viol/0I7v183utem89j/tgQdivswxzP0NVVQnuq7q5tt14hZq9yfA==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c0ed42-1d34-482b-f52c-08d49cdab7d5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:SN1PR0301MB2045; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2045;
	3:oXBKcBGKABnrqcQ1fsLz5PrpjA+YaEVoPFGCsY0oN2ije+yHF9YT24IbZicT2uemNasI/dHHaHaWvDDIMkXo6Uf6Ndztb81DqRLNetR0//gU7fLZ5Z/+1coS2vEH+qH85G3Pb0Yj4to+JWD6s4JO/ctKEJcH07kkYPrsdm+DCHS0JpJXwF4pk+2bNqCMc/m65/NhNbqKoG3jMjf85QVdvvxvIO/rX1RRdU1tIOFQik0X4RWv7HSusUXL7Bws9GZR2N0OO4ZjBug1Pc60tWCB89ttZdTh53QMuVW5nkdgpQXbppIXGTJKFNrHo1C15v2S8oBaoBFlvTyCXveuYLJq32+iCJMELeNF3pgB1n5CbHcthzfMdHw/mPYKcUdkQNp1LE60vGkPN7CNN7dVxvQavVFNxKKrxVH881QVNtVrvTShowkFJ073d/lAtb0+A0PzIr4i7pVHZBVKc8+hNl3nEkb78E8bCu7va5K23L2jqGmzt1Kf25iNlCcKfhdDbbwu
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2045;
	25:ZQULcwWPy9AjbjvBRnlUQkW5ocdGAO8ncluWudAbZZFw5q6f/inW3o0j0OEtpq+iVgSIVfN2wYw3F9AwlyZo4uFx3xj1in3wFRB1S9kYM5VsIHw1wmm9M1MCm2eyLTsGKhBUHmI6re+ZD+evT/wcWset3UR+9H3VuyCMWKn/b0A+RVNN5d1mbLqdTjO/AtsksZ+zbRq5TKHm9SFSYTaaEiO8l4+IUi/T2kTodu8qJSTF0Ryiq3yhdezq6jEKJchcNCtVRJUEtlkHwVKrXN9amu9oMlEIeyuS53Qav1jokmD2DC1KJCkND1eTUXlSCM369mI0TMInQhM+AT61eDD7apbWR3QX7s7NPTL2cxOmNzHhS8ZHGHmDLdGsZ2sVI/x0hEFkMilPRSVjJcwkIt1BjGZo857KOOq/ffv/iUNCpVr8+uKU/3YlUkwbKn24TWRloknQ3lp8PV5vbLr5YRCPtA==;
	31:DL/+KJ/jsDU1XvzyJ8bRX+O+aeYwpUYqU99ZeWOINO5gMcvkl505Y/ZNr9EuE4cTi6u7wlQjzEH8OzE/Qd96nlnVlVLnoUC29OtfZb7TyBW+Kayyx7nGDaeVoxZUKTBb9jt1mvABa27tzbUebjIyPceKTaI4eOSUtC4wqISzc2n3oB6dFENBJbXXTx6SPbb77yBN4cDUqUaGSVNyZ7MNVJxAe+vSEq0kMWI7DG2Rm9DjzA9JXKp9TD/7HdODBjkdilxdDEvAWmms+6ghbXQ5rg==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2045;
	20:OpWs9x8ITAe2o+iF6d9W5xTVwrhAYorcTAb73GSFkFp2amLaBNQDGk7GZThzClrI4uRcEXAUcbpccpWLiZI8pPZXhKQYHWgQ5Wnv6Hh6qNz0meJ6ITmbp9DtP7v4Wwsn26MgIAjq4y+rSqpMyv9R0bFnAYEDXOxkbAp/DkaOpdaxeztACXh3Nr1TQq9PwLeH1dDlvNJmSq53tJirk3CA5BMcK71Polh4diRaDoCifiIWaLbZgzcKuhJuHcJaihg6BMAnl99T1OooUpJQ7bcdeYp0024s/kbwstA1fR5GNtZmB+5t62gtXNYfTiOzzjVGCaB64KyEHL/OTVALXm/GetLvAxYAkFU7TF1t9ggk7YmBxk9PVwk0rLTiJUdAnPVvUMy9cWQhWHrFB5R6ZJ4wb1Cr6WbiqC4uvoOgIHQbMtgasxZqIivDKTXU+/50OhDh5MgTa3NzHs6f5kNGeJM3ojsWwfXGBX1LsSfkCIi6mEsK38vHyPaUTFfcMCsjsWocXeq4FJ1bKBEZX32MoaTNIealz23tflGxuAXdfFeD0V9N+W9ec/WtuTVNteA3Jy/6FiqywiISu0Di/Qm5TcrWgi0snFI4iKyUiXI2BpqefDs=
X-Microsoft-Antispam-PRVS: <SN1PR0301MB2045744C8506EC5381588D1784E70@SN1PR0301MB2045.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(13017025)(13015025)(13024025)(13023025)(8121501046)(13018025)(93006095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(20161123564025)(20161123562025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123560025)(20161123555025)(6072148);
	SRVR:SN1PR0301MB2045; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2045; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2045;
	4:VYCgq7LYQdKF6x0dvu3BP/Y3J8QQNnWaL2PKvtfT?=
	=?us-ascii?Q?XT8qhV3hMTD8j+yUjJQJtLIzGeFI5OpmMCGF+8JuNG9Ujn9cVVQe44pli9yb?=
	=?us-ascii?Q?NfTNDUY5tQIL5trea3XAVnbaHKClG/KJFKh74GEBfELlRG9jeIVKPaagUVXc?=
	=?us-ascii?Q?uHtad2EbqqI/TOhWp2GeWcoBK/19mUA0x9B/w1u92RKK6UOI9dyJvUsevNpD?=
	=?us-ascii?Q?fkn1zSTrO5zQbuNtyMmCxIe4TTBL9gmy4Sy/wrQM5oAfx3d/vNbMGOfj2gyn?=
	=?us-ascii?Q?sDcRpMl4sdK7P3FTD71ZPnwYjd9MKAPL1OoDFk287kkkzRHwKqBOUXSmtMbG?=
	=?us-ascii?Q?/bExHnEQKaae+EW7BYulbkJGsU/kvxC5Kmmfk5Jde5EFLgE4mBi5ehu+Y4I1?=
	=?us-ascii?Q?rUXEnqSGZDK+6na0MDVsYMChciylSX7xkJV1FqaEZfi11nIYGmyGYrXCUpij?=
	=?us-ascii?Q?IgW9RcA9GbY38AATD5w5T4QYlVXUxnuwoYY6HAiSjACjkRAETueiIfNwi21L?=
	=?us-ascii?Q?mL9oDyUnJrVdz4aJOyjBNYV6VAyELK7RBAYgtV58ItlQXsOHi2dFUozkVLoi?=
	=?us-ascii?Q?nir9FNTqUe4187cSwyYM314OVen0bG3Ll7lNwMYVxcl/1EtoTrnvxHYGztuz?=
	=?us-ascii?Q?9eR1MNPYnqTnZzzTCCk6z/penw5esTLsABPg+MuK+LmZUm1kCpD4PEgNLCma?=
	=?us-ascii?Q?+u0aRmrkIDiUj/aWQqUn930AWROIBeLF8Q3xPndZaF22Xri+mpRCMX22CRhW?=
	=?us-ascii?Q?SzYl1oPunD82yTUiMntbysEpnN86skg/6DKF08SxgukiA2oxUT3nFfn4eWgV?=
	=?us-ascii?Q?QAIq06okYCc+hFdTjhZQ3n4Mf2qr4nTd2/ewYY/hiBB94UloKqWlAzBkVZvr?=
	=?us-ascii?Q?RbaJEoTUhgJseqU1KQyVBIUNW6+dLMnnBt4z4UWDiye1T6STtrT42OwKuF4l?=
	=?us-ascii?Q?8LZwIrg1GhOZKQROVHgNVJIqwfxjLSlVVUqWaCNzYw=3D=3D?=
X-Forefront-PRVS: 0310C78181
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2045;
	23:uqnys2bik7sUiSa3HMGyH3LaU7r3fQWfdsO3J4m?=
	=?us-ascii?Q?gIaXHa5tgOf/+IqbnkoFCgTbv1bAt9ws3qc5+naQZQGcOTNy8ulosoF43gFE?=
	=?us-ascii?Q?uXsmiUT4YdR/W838FH0D9DLMCEAu/j4Ksvq+PukGy+xeFi946qmoYrPol1eB?=
	=?us-ascii?Q?h+cCG/LtEDoYeuGZ0F4WZaFwE+aOhtuJBc4AQQucvgHaLg+IZV3z2Y/yA+QF?=
	=?us-ascii?Q?CLIQ9+JjrtJvwXyoIOZAj8QL6b46pHGUNtT/IgfQkB1Ra0x5fdUfjRkGGwCj?=
	=?us-ascii?Q?v2pLeY+sXqY3LxfUAzqjpAnBq4gc6Zq1XNMtofoCbo6cYANOWbZS9YBH6IET?=
	=?us-ascii?Q?FOe+17mm97XK1EhPd4XBo/aNLUWsa6lFK03WjNkoq7lkO6+FuFQTjcV5dsz4?=
	=?us-ascii?Q?W2gTn6rU8h4kkz3BhLRT17fsx+koYwxxFW+E+CnQ2bnGUvVsn0bYZNu9H3uT?=
	=?us-ascii?Q?qEYfd91RjpBVV8IHUs6I+a24BSndPEgmOulwc5YBtYoKHb6G33IgjyywIZCg?=
	=?us-ascii?Q?cIOPF7xUVZTWhx5sNxToGJ5GM+gper9ZwkxKEE7I2r2JS3WThKHm9t1JmUe2?=
	=?us-ascii?Q?2gbnHGS+w7EOJuzQuZ4pqa1Lh+g6HZmN7yELTxOwvvxIvlrgvJRztXPccLph?=
	=?us-ascii?Q?kL+avau+qNHRwugEQC91nQxJAiDiWbRp+gncFizSMfHPIlvOhHuF3TVBNWQf?=
	=?us-ascii?Q?GOnSbxuZDCt/V7/4hInWfRDFukfr9SsFBH1t2Hvc2YH5EppK9BJ1XEAnhxWf?=
	=?us-ascii?Q?nEHyO3C4GWr5Ylc0w4zBwJJhAn7g74jtU9dVEZlpwqQhMoaBFAVywsW4McQO?=
	=?us-ascii?Q?snw/J6CPzDOZOXeLQ8QHpgQEDSgCET3gxhn6NrAMEJwCu8Eog7Ac9wQwzPE4?=
	=?us-ascii?Q?+vC/cMTfoWUHcsKLOs1BWeR+n7GjqdUkn2j+3Fb+4zCvpBB0r2R34IFtAnA5?=
	=?us-ascii?Q?7Y3Nu/MU286hXvW8ykjwXY47Z9kN5wDUJRs96YnZLHjnRUE89uQJzX85sop5?=
	=?us-ascii?Q?VQlHokYbsTGlz+IIYi0rqobCZXDRbnF6is0aXiAsLxrz1UUasueCVX+lTovN?=
	=?us-ascii?Q?iqwbavUJkvtnFwBPlN2kRN2v/r5XBbIXbm1D/9rau6lV9+oNZ5oPbDI0WSbf?=
	=?us-ascii?Q?uZ1EShGt3ksalDp9eQFroQo7zsr5NtB1p?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2045;
	6:phTcvQ9FXY1fOIE+8hh//8J+W1SkfGGhqPmiEaDY/9J6b9ooABqlptXfMlc85tZ1mE4s0NVmpVqR2bQZSCgJFYgFt0I1huemUn5WdqKX7p5yLV8gav/9vxlEv2XEgOdnakph/BYpZTbrXRKMbxZ0OJ/D83lsOtySRgzVIHtAHaqF4OoT42J7+KlHtG6jXCotv7zUE597e4Ge9WqsXBXC0h2Tei+m6mecdWgUuvMeagjhV21KGLXeC9rkNK8Ha+NDMr9g0LPlVP/qI82qoczhE1D+nb8JwN+DsSyNlDx2q5UrsjpVrKiZJbLf9ba/R6nhjEp8ndIUtiQ+R3uaCN1qxF417YaTByOm890nLyHqary/sJSk6qJ2uFWhdhf8lj7HTfawd/xiS6APKKe5xZG/1lY1ODM5FnQhv4wbB5OTWhCg8FLR9frHuepJUsxEthkizpvETwJmd1PE7+J/CYvZAeRnkcsMXUTFib8fbuP9TlBH5+P25wJjkijRQ25uE9vb+lFLf6CRsxRyvff+hoVgKgwFSQ4AMubRGpJx95y65Tw=;
	5:79r3vH69qyJfXpwcKkVkCsnE6WUlkdBiFBpbMDtT4QgtHPR2YD5S1NmcVYUC7bKOQuxrS0sKf/TVpqWI+c38pr68HczCNNF2uND/TLuQS6jGU0LBDNLSzJ2lbWMoa8/ZxXD6SeGlNX2nXX3UhQaJvQ==;
	24:rWbQOEK/j1q2Xi2hPgtZicKaOB+OLpvcBBQSrMSH/EJdWOgg74i5pfamY2kNPafokWmmac9e3JJZ2SJnSR+KPZs9tC/iYuthIM0QHn0aJFI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2045;
	7:YXqd4mEgq85AwkaPAV1sw3lOzFqQjBMgXH4yAZUJkZIfYlBBsxlZUmB4bYeTCh3hDWLGAWs0SKmzwEBsCcsvQEkBY+2o1ZwbRdAZ3/cUzbXAdlZDazoz2CHhJU4mF9Ma0YjioD/VctKIXYPer5mnunccgMNsUAubuHe10dPx+VXG7oXxmZcMbxnCJ+v9J0c14rtwqL96JRF+qig1yIoWg2CGHQM5JFKZVWko+HPxRboDXPWj6ZBoFG/NLgOqgdRNbbJHPtoxMDzJ92eKfdI4T6EV5v13k04s8hjq9kCdWk2jApZuhqZb2fUB1rlx0rxhkRpAAiNZakfutfz0tI8new==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2017 04:10:56.5422 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2045
Cc: chunrong.guo@nxp.com
Subject: [[PATCH v2 1/3] kernel-fitimage: Support ext2.gz filesystems
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
X-List-Received-Date: Wed, 17 May 2017 04:26:44 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47..f40fbf3 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -369,7 +369,7 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
-- 
1.9.0


