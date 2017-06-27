Return-Path: <junzhu@nxp.com>
X-Greylist: delayed 1086 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Jun 2017 04:21:49 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0040.outbound.protection.outlook.com
	[104.47.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 9F83D7772F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 04:21:49 +0000 (UTC)
Received: from MWHPR03CA0027.namprd03.prod.outlook.com (10.174.173.144) by
	MWHPR03MB2575.namprd03.prod.outlook.com (10.168.206.137) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Tue, 27 Jun 2017 03:48:34 +0000
Received: from BY2FFO11OLC015.protection.gbl (2a01:111:f400:7c0c::186) by
	MWHPR03CA0027.outlook.office365.com (2603:10b6:301:3b::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1199.15 via
	Frontend Transport; Tue, 27 Jun 2017 03:48:34 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC015.mail.protection.outlook.com (10.1.15.59) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1199.9
	via Frontend Transport; Tue, 27 Jun 2017 03:48:33 +0000
Received: from localhost.localdomain (shlinux21.ap.freescale.net
	[10.192.224.10])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v5R3mVGx008618; Mon, 26 Jun 2017 20:48:32 -0700
From: Jun Zhu <junzhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jun 2017 11:39:41 +0800
Message-ID: <1498534781-5318-1-git-send-email-junzhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131430089142736789;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39380400002)(39410400002)(39860400002)(39450400003)(39850400002)(39400400002)(39840400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(2906002)(36756003)(77096006)(498600001)(189998001)(104016004)(49486002)(53936002)(6666003)(5660300001)(356003)(85426001)(86362001)(50986999)(5003940100001)(2351001)(33646002)(50466002)(4326008)(8936002)(38730400002)(47776003)(6916009)(81166006)(48376002)(50226002)(305945005)(8676002)(106466001)(105606002)(110136004)(8656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR03MB2575;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2FFO11OLC015;
	1:/yQWLx9tDONv6rNQNHZ2iexpe6PX7IzqalFlv5nHm?=
	=?us-ascii?Q?PEjtI8UwBWuHDkde7aW+Xu8XxP/PULmZGu5SdWBqUUK2pPybzrPTkAtwUY3I?=
	=?us-ascii?Q?awq9gXd5WnXYpwX/3amTWpqc5uCiTfiVz5xda+/gBA4ufprSyuFuruhi90I2?=
	=?us-ascii?Q?njWB8Sx1XGHyP1s/L4QpTyq4/XHORQVV/WEYWPQ/Ittv4yUhe4zKb5ydt/nX?=
	=?us-ascii?Q?Th80nb3yAohsHkJUk6FreJkNtoNze3kecZFDT6rflIhnc6IzrRv8zVlvUUu4?=
	=?us-ascii?Q?xnWROktx60LSvL3ePRjAuRkuV5TuYV0G54LnKrPp7VjqBBfVU5FzsOmnRXsT?=
	=?us-ascii?Q?arOYA/FV7PLY78Z2WVWZ8LMnaejIQ/8j9GrbtQwgkcZ/0Tsa3IujtkowMc+u?=
	=?us-ascii?Q?vG0T4wzGV/nOyPlgTUgvBEFLBTmLmph6B8ICDECoB2TiUWSiKBYDL0nopONX?=
	=?us-ascii?Q?B8YC+nb3/NfW2uMeo3yrhk/wU4zShgQAQboO4yl8OhFNuasCnkjcM+2PuuJT?=
	=?us-ascii?Q?T5iZTEuYLLLKvyk5uQM/NNlEc6e6yHnKlYt/rjOgmdfBljrTfMIHo+JHuLeK?=
	=?us-ascii?Q?KrMP0xCcKdK7p/XlfvazRdTSNbMI0imbUI17tLfAD4FBtYnH9G7P3OC2IPed?=
	=?us-ascii?Q?SONpRZro37eOYBtqoRFyz91RRulMCRcCAIFkqpVr9VUu5/fnbJLxHrXpNpf3?=
	=?us-ascii?Q?zFYbL+RlUbNxZNQZakiCMwMZ11JmEiz0LpfOq/MWV+vcadh5oKFc2lAyNv/y?=
	=?us-ascii?Q?6n5sIwVlwgZhvsALpNRhg71AQxXUIVwVx2KlAm5vY0VDAU5AydT7PbKic6+E?=
	=?us-ascii?Q?ricoBr0RDRKzqA2PjFNhqzjMaQLptu1dd9CJuAVuGBsQhxwVxf1BhCH0IxPh?=
	=?us-ascii?Q?USac25mt+yKgQdNrH+INacho7F2MBf/u6kqjv8B7e9v1aU68Sizl427FB0v4?=
	=?us-ascii?Q?OKR+eCU66xf0nahVMEH+Wn5orJpiNRKp+B0HJSSHf6DB1FlgiCZUMxJqzo4c?=
	=?us-ascii?Q?guaqhrZdymrOcikPFtRNR5kjlRM74DHjof7hccVfzFGXr1vwFghEsGEX5XKM?=
	=?us-ascii?Q?FD6N2A=3D?=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17612015-2aa8-45ca-8cb5-08d4bd0f628a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095);
	SRVR:MWHPR03MB2575; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2575;
	3:1wpA6QyM+94vbq1i4ZGWADk36I5Bea0HWDiNS9+F9ME1KfiYNizp1oMdHJKq29XJ0k6UulW4rsn+XzPy95KLhkE/HUKVoqTEDqbudMKgMZcWuApBl9zQp/7msObkAihrkTvnk7m7R6cmTBzgXgRBy+afPUajlXx0LoO2OkTPGs5xf4nCGdAU9QHf+5JGcLNWHmIUrFUv/iea4eCdPHJfnM/xEUdQREMuO9CeL5v86qtk6KHf2jW97kr6UbowgjxlV3eUnm6QDiRA4r1rESMpFL6Nbwohgm07a8tZMhFdfETjeGbFsELFGPLHaKlTUO501oJccDO7d4smeSQVGMze2fhs3FVugSOYCLx6vhbPF+B2WKXWARkYbKAbTZh6Hri1EvxbcharAg+scaCbDIr9Z11eIDgY+qkctqb/KoigsH5CCnxxX7UlyRXpudwczgiHofmXz5MPuYVDXfJpgUPu2t9GZjGbbDgyS9Q4+XLbmzYNNtVbYgdHpVwvbsh4TDaKax+4TdOcEWZ+J2fBLJU7PIrP9QPMDi18sOZB95A8ZZ6VGs2ssFtTPwsdQVdPIECPNXsI/BOSPzuPSbIw2g6hrRo1D2DzHCUL4Du/IxHrdqosp7Vz1u+UL4K7Vmcabi0Yy4rUtc/IX4oJEi8iHzWJYJ/2E/9Y6btiKmj+ztNrVzcSbiHYzSEcFjzHzUZ97wUU9cdSRDVp6W8CR0mi1JtpaYRXlJ1qataXKL4GFarytWvrnkB2vmbgqIhK4YJ66ZRJ+7/Uaxxz+KXh1YwJr1OPmw==
X-MS-TrafficTypeDiagnostic: MWHPR03MB2575:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2575;
	25:T1bEVjqvN7tkwhuFW+33r4+2mYfGmU/FAnbmoTxMSsnGq0L5k7VbCo2aoL+xoK/uIX93f8keVcTJYbNQ9xtW8NjgOS+oWdxzZ61LLJ8DWScI9afEmqKolKoYfwk0A4R2o5d4N2pmkqzMC/ITbqMNIjWpP5arBufnCkgsY+G2D+PAdEaNM/6+YgJeeh6pVEb/TM5BdBNNL8k4Rw8fP/ZLnK/Z1SxM70ThScXklD1gO/behgWGW5thCEgUnUZoRM19kbxN/kO7xynMTirphMc/jcALRC4kIt92EcliWmAugigRK4Kk6xgmV9x1UdVn68U2KTSqSsQ/rh1xfSdGdMWTONWqRkObNtp6TPiCjhOyS3bBqic8ceDP+anSef6HzNfOyDSLolfwXFZ2Pb0R7QUp6yimroWVo2NE1Kfln/D+B3cRObondg9Q4EsmpZKApdpP3yQip6OdP/Q07tDniNa/8FlGOA4EfkO26Hiyk8PumC+L+7yhM82Dt/IQa+aWO/YduN/xeHMyAmONkGRvNk1fsb78qArgexKHMB/nkfdpJ4eHSdqCPyRFVX1kBHDDf8wQfiLZonBWOye7ZD+WVS5vBMEQkwhTqJHWhanloRAUlH2hZXXt4t+IN4c8EOUmmUWcxQJX4iBQdWY3pWCLkaMTZgzueCoXcrbaqGR5PNaVk/V7Qdxn2Q+QBtHhtMYgUNeJ/d+nSbjGBZCXmCSKIT1vIL+OnpLQcStYqeTrBatR/mCESmVXYKPft3slZJLBeRB4YscmXUv/HGKsUdFPMkcOEAvfiLkwyMapMSXhQUqmn3cShwvpfAnoPimoUdPpxMUOR/ysFkTncamw6JAWwIk6zR2s2ApQ8Jxi2LVurT1l67S0G3Bg5D9HggKIpTXtLCkswQc4N4PG9VeI25mBTg6heYBojT5kjuTWExf7XDbno2o=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2575;
	31:qH4ILX5wivINDy7KAplGyZV/BT6jOCCgPJ1kYf9n8dL6TzsvsoUl+J2Yfn9/JIsqkE/J6hsFHitPASQWTarWtNmzRDJCILH3SKE2h7Fs75u/19eNzqkEvxNyDGSHH7HjzTzhWze1KWODJOBipAgziWlxcJbfqjhFDzgH99zRuyWgq9pOn8WeYJldt953cn0VV0PaucIsWinjMGjA43YuLPRMhXQdIW5CyyGNWF4aN0dPb28m/YOaDQTEGJdFeI5Iv3GI0MQekN57+4/zmnQc2+3IRyV5PW+lLwCjhQL2MTbZ/dRu3v6V/pd+RQV5sK9FYVWqEuNAmU4TLHKr1U1/MyzEH7nFYC+UNDimDiB6Fab46YjUWscDQy1i0oXDhSGdtzul3cUjv8cfyJ7fLltxJQbJJzHO42h+65t+BC5Qx3hsbFl4fKYfD+i5EGABBQ58dWznP1quA+PrXuyG0nlmt4RDwfXbCrrpCWC/6g29Kfl2OAfZdCe4IGNXWNI/eQF4jYmUOIQbe9u5nNdRkyRnIjj0VPCtLSdDnxN1LtDPLMZ0eUcKN7r4DE2xfunbLw+v+Eh0/8QNvCGEOceOkBNgUN6A9dwY38089aezkWZDw61paUtL8ojCqFR+olKcNYhi+xYiypc882rG8ZbmTW75xv8Dxwv4d7ueeA15RoZx1hq6pGKlyAHCl6xT4ZJ4qT7febhIgSTl9xlhulOvtVPtbC94KNZwXo/XmOaZeY4P2cc=
X-Microsoft-Antispam-PRVS: <MWHPR03MB25754C7B64C4BB89469273DFC5DC0@MWHPR03MB2575.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(185117386973197)(148574349560750); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(5005006)(13016025)(8121501046)(13018025)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(6096035)(201703131430075)(201703131441075)(201703131448075)(201703131433075)(201703161259150)(20161123565025)(20161123561025)(20161123556025)(20161123563025)(20161123559100)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR03MB2575; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR03MB2575; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2575;
	4:D8LFuZ566BNCgpeF9AAm63cWCboAQ/WoH8N+VF7ANy?=
	=?us-ascii?Q?FsRThyfGPtKdN1Omkdik8JyuYSrpGyoHBv/PYTV0PFbG/csMsauz0BfprETa?=
	=?us-ascii?Q?J4qPc0KjcdIp2TyZD+iC2g5YKACBZa58IVrUxRjja0Dm32Hy+JzaxsW4EHGc?=
	=?us-ascii?Q?R3szuT10PlRYoNRbnAohlUlovWzft6el6qqPxtDSHz3eFlFNOHPzzI4221m6?=
	=?us-ascii?Q?IlFUF72gLiDaGwHM4zN/pu0f4m6vArhcq8iYwS+Fgl1FVyoss4RjwrIv8NaT?=
	=?us-ascii?Q?K9+goX5hanX/spMdLkoQvosLEcXi+gdu9t489GqMImaDsyKq0mf/ZL2P+xpr?=
	=?us-ascii?Q?EF8Ehrr59SMtPN1VufjmpZ9iMRvIn0f/7n56z78m+tN4UlnTNHyKX2f6q9LA?=
	=?us-ascii?Q?HEdt0yY462U0YWaMR5JQ7dbDK61afIDb4F7FbdipoJErnr+gHL/hrRfpVs4l?=
	=?us-ascii?Q?Ox3sIIfaicE1+QXWtxfykxHBQD1AQe/TRlKkqujVwcn1FLXcMAN6g97DA7le?=
	=?us-ascii?Q?YkVwWX8lW0y//OFyy2fFOjBrj9y90430JdhJwHJDYnhMf+NGGdCd9q3wLrgz?=
	=?us-ascii?Q?hXr6v8sWLW4ib9KRsI62xVnTLg9DynGw9R5quRguOWHA/QhVKo2Kor8HN+4l?=
	=?us-ascii?Q?Ap5ks1/0zUOheqh7E5QmniOTRCE+4WtH05pAG4HySSjETqvm9C/BdoKw5BA2?=
	=?us-ascii?Q?ZPk+cxux1PD8SiCX0VBQwN3SxI4H62OtfRlrZScDSC+a0dPYlIdGscjXiGkr?=
	=?us-ascii?Q?zZp4TyBvMKdlvpZvY9St8P3FAX/kowgqYZKM7FG+2rqlXnaHFUCXyIZzI23a?=
	=?us-ascii?Q?15eCvumO2mmZRvNPEDZIFlIfyhfOf+Z6l4wyWFASJwfB4J7E3Yd0bV6ZKxR1?=
	=?us-ascii?Q?rE6AmFLQLs8So7xfTdnV8tTj0mHP6ZqkwEgkhmpicEZkAIvuUnhJeB5feObJ?=
	=?us-ascii?Q?Vydii14g6OFO4rfoB8f+/ghWeLrs3fFrndBW4B1mqdaOHEMDpPd3SRypO8Ba?=
	=?us-ascii?Q?2FAGXJG+KZpTQM8iZIktDtRohgApJfLVP/I17FLuUcdKimx6KCnupe1mg9Mi?=
	=?us-ascii?Q?Qb0I3JSVDUAquxX08OZFjonlC+pxPsYgngK2DzJgcWS453vqR7WUl8eleh/E?=
	=?us-ascii?Q?yakc3BrX+LRIz/FhHQnvNt6D00ma9pv60mEzCCazgFEK3xIsjdF7AeuKkPVn?=
	=?us-ascii?Q?FZ/4DzW8Qo78LrxxosigxgqjyoiWN5r1GQdnNHJkDlRPRln95/Xiptwq3a0E?=
	=?us-ascii?Q?hfDuZ1zTVXmqvy2KQBWNQcSgErmzR2SyCR5vXvaBnlbvqQdQnUJ5ugCfZCEk?=
	=?us-ascii?Q?u7gyWiYwRKA0t+CDQgnjGaLUnUJTxMP9+fihni5Lbg?=
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2575;
	23:qdz3Hty2TGrhW8mKcFsFdrJIlZq8mYZTxMurG9BDI?=
	=?us-ascii?Q?+bu5Gn/Zy7vpdqNLQBomCo6U3k2gbSXcyLOtXoTeKOngD+xgX3wMeGfecbho?=
	=?us-ascii?Q?nRkB6q0WBkwNpgeeokdIgloWHPcgWTOYbqw5eRKhnRd4DuniSEFQ2C9AeHvB?=
	=?us-ascii?Q?EnHFsZWBC3u6hNRv+LvelPJJzlABtEPiSxxGxknCKR5DoJYNqTXRNgukVHLH?=
	=?us-ascii?Q?enrXOBXm0ru5fZ1sZMxGWjWTTETGsGkEPcYUfxDNqBTN8VuDeQFAax8LV9Iy?=
	=?us-ascii?Q?g+ACSbhmGgeDNZhI6MzanzQlc6N+vjcUFt94+vqOo8Y9gg3zHfwhKSNzycD8?=
	=?us-ascii?Q?+1BKHca3hB3D9KVNiZlrxIjtfPph6j5Et7dEWP/qIsg8rJnxKEEJgrTXRjrK?=
	=?us-ascii?Q?oMmO4HzGZV4ySfyx4u5xIvbEwUlQzc+Z9H3WMdk6rC2NX7UYFH/95IckvqTP?=
	=?us-ascii?Q?N7dgpqAsnLGCfCm5yaPi7H7jokujhdliBdakd+HxNZrE+KXsURPeDhIunkQs?=
	=?us-ascii?Q?rzehrtOvOv5tQ1U2rKdCbhqHcjHEGROo4UO+7U46r+cGpLob6mzgaW19shtN?=
	=?us-ascii?Q?RcyMV1QgjTUpPVnCnu0BccLdNFbtb4d5Hdi+Ku4EqwSG0BCvIGCpd+cFoNWZ?=
	=?us-ascii?Q?yIC6eZK9evZRuTA7gjcxjuC3i9VIWTKo95Tj18mSdo2T2c9fIkOkYazU78Dh?=
	=?us-ascii?Q?DSKa4/qEejIkK3XtJh7lHQb3ko1kxAnFdklirKUzw3ZOuz2NHqaGWcnZidfQ?=
	=?us-ascii?Q?QACnS/AGnZJ4j7Vc11bSPDBiACBIY+SD82xdIo0dBDh7+dJnbbUwWFLwcuaP?=
	=?us-ascii?Q?5kX5losDmlRhGtSZCCEi/tctGm52zb+7xKtI16nk6BQxcMtZQ3f38yXSGw5c?=
	=?us-ascii?Q?XGxE8Ard662qfViKx4lwDv/xEdBoRqaOROgu5YToGX6kgDrPvY7EEaj9t6HA?=
	=?us-ascii?Q?tdNzLV7gxdGRgbKXggmvmmpDWg13msGDxDZ4VP4hWkuh7cF7j0sFwY+GDgzK?=
	=?us-ascii?Q?nFA5swNGhK2S/zU6t8t91Iixl4vZfeQXCsuC+Xy0ekWCaKkDMk29zm+1O5dN?=
	=?us-ascii?Q?h2QnyKPwvXMI7MHADL1jd+NZ8EcpAF9N3ntVJYO9o+KOgGAU/rLlFKJsygCo?=
	=?us-ascii?Q?4LtzkKNx2hORUW6j6awkmKMzsvb3XhQcZIF71c9s24Gmby2w/jMr9OXNL4Ka?=
	=?us-ascii?Q?g2DVA6/FMxJLP4=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2575;
	6:bkZDtOY7w4o1w/5/ySHCulpe2aSSXr7ygjCLI+qpEf?=
	=?us-ascii?Q?peUz0lpHQSRW+lJ3q+ULBaCynUNPsH3hx+yi4TTHdO2fWjJP4RNMe0cDOeqe?=
	=?us-ascii?Q?NrQD1qXwM/dh70C5qbgoZ51LFKzfTWCgKyTD7jd06IJRg6u6hyQo1Jtd3K7s?=
	=?us-ascii?Q?P93EyQ/D1f75PO5heBIVjwRK8r9OBTuO4yCbCRgpzQ2n0bQ8NO50WPFI+wIq?=
	=?us-ascii?Q?elke+u3BDFeG4g1qS99Q0F2+wF8e88WUzSlaTnCvd6gaFws083axQZIOxlEo?=
	=?us-ascii?Q?+6cmjwRg71xFsCoChOctLdM5SXwYU6jZaaqxCNysVTskR+UttwavnBwtHRcy?=
	=?us-ascii?Q?ZMbjPYja5lDu/BepygZasOkPqqav2bS+oYXCRDgki48hnAqUU6eaiRvB0cKS?=
	=?us-ascii?Q?36kfr4yeKuB9h+9ag/wYi/Sdal0I90snxa/Nj8O03jWQdctmv/GP+Watbusi?=
	=?us-ascii?Q?bwuduOkMGi2AzIR2iAaqUPhANeV5/TpqF+PiUjPdJoAEShikEWL8Jxyn2J7W?=
	=?us-ascii?Q?5/Egcxp7vD4C9vIEJHuXuJk1XdhoPQOA0bQBNeadsLjtKTeHWyjSySHmZgs3?=
	=?us-ascii?Q?4Zl7t/1QVX1FytTmb61qh6ksksMaanNfLYKkSgtAL5hOgpconeaebUB0Vp2q?=
	=?us-ascii?Q?CNV1ul1ME5BZN+WyZJFu4kqjh6U1ZYGiR/dXNPuu5BmxrjMeemawanZwyEqZ?=
	=?us-ascii?Q?YKSsRUe5igLp2WCdTQKPCFxnHBjH5N+csADe46olmCRiXIg14AfPzV02zOCE?=
	=?us-ascii?Q?cYNP22XYLSn2BqIQjKz3Hdtdu++CzhDe7hKYpHVMopbn0Z4Vt8IUKF8d3o9K?=
	=?us-ascii?Q?J6clZHcd0Me6UGaTGxCrAuimFVrAZECW9CdbrkWTYVvUPUr1G8iAOFobsF1P?=
	=?us-ascii?Q?VeCi2K5Ijb/tT5fISKBuPFByj3ETweyXQmdavXA3ME/ZHe2dLvyJDe8j8qcF?=
	=?us-ascii?Q?G1JoA2kUTsXUYnA4Y6EDbEHDtwGZk+vrPZxRZ9vw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2575;
	5:mdkEJhjz16s2TvJy8S11hYQ31yTLLDYnJ1HleIJ9mek3TjPbKSWMykgpSvClhLE5Tbbh+I3ZEkdLJnQN/rN649hnWMuTtYcL1/UDFV5OwhbH+ZjDCBSWm74W50wH3iV6HnjxIlqkMqBNUsdCqWeEr24SMpBnHu9NwYeR/41Vzq71LuuTOvFfU8I3uMW0cBSXcx1Djhpk+xAoordPbKdhlKNQjPfK6VVyIpd0cr9Q1zb4r1jvP0AedPmIfSyB8Hl4EhOj5kzXegvWvHoaLZTQcrbrGkwryZtjiCzTqx8umUsSdLP8D9PiFh/n9U7nSRW2MH0C0KwOJumcLoiAE9+dxdl6G0g170VBFIVp5VTTqWdcgTqCwn1PbTkW8rJJTtXJboyHoNPStRtZUUsZGpudsse1LjQ9cNGMVVj3D0kWIZAkF3bH17Sok+fwP3kHy0sZrMwwiUv9/YXzx3UUhq08wy9R/DWjij+K//UuVytCQeYQNTP1ZXB6VDs/2KajdbhHZFyjIoxGXhn1rVdfQshijw==;
	24:ebvPmeO+T9tjbilpc6XVT9p6JOsSBDNXrhzi98qj0JWzGHSIl8L0Ldkj4XBzbXvuzuUm4VF15okwc+9MtI7uIngOLegz/r3cjc92rqmOuZo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2575;
	7:p3Iuhbx7woo8eCCedRRQrEVOzjsAJcuDznJnyuq986LJGHdevpa9B1f42+OstqUIMoEjZaD32e2oqfwtZdCuT5EB8H3CnFu8883xLDOMeE3jc9EL5rWNIryOtb2GVzqgUqGoF1aZNTta+okK7dAFY9YsBMvck96yXDeCB8LSCxCwRejG+Jfn1AOTc5DlPNUXOk6ZQhbGYqHDxu18tCOv3ACD7gCmv/uf0huyEaXWU426k/MrxV+m4JIShDyJhIHg/FmyhTQgCiluSqfuh6sKwMVMVLy+m8+b1cWxdGD+G0IxkVYJYFkM2izeksk8qmW8E/+HbOxGfFd3OAAtndMx4Dty/2IpARYf7ZJDmU1n1CZrnSWHlJWACHIZmgh8tPjy2QYxmRJ8h+aoUMQpGb3jiHnPydLWM4Td6XGHR7RKhR7Lvsi7shMtn3aAILG46PETK1oRIkeTEeq38++P/Eq2aeiGIBMGlLx9TZel/RMVOMSs1hBj3wsR+0+hDch53y9nLIevrsQFThSgAh72J/lflo+1xgmdoo20WbP9bQBh9i/WR/LRJDFMXMO89paFSrxIdm9GZHwiHz7r/7FqIba1UnJbahpgajjsc/SnhKPD0HR0qI9/lbrxnSW7dtMLKozYZzA64ZgyagFNKzNiJTX7CSogDcCAocVxnrOTBk0ult4GIaPpyj8u7INCwLEf8dNk9ghYML/P785wKL8yjE57OyXmrv+3DyYzzL9X/8AnUY4ElCz9F0y6bkE49XKlnmYqg6uh8BfMVYCNklvbWGUIJ8ScTxorhvXNmsMHW8vYRws=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2017 03:48:33.9616 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2575
Cc: Jun Zhu <junzhu@nxp.com>
Subject: [poky][Patch] bluez: Correct the timer count for bcm43xx firmware download
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
X-List-Received-Date: Tue, 27 Jun 2017 04:21:50 -0000
Content-Type: text/plain

bcm43xx failed as time out for firmware downloading.
The root cause is that it need wait 50ms to download firmware,
but the value of 50us is set to the timer.

Signed-off-by: Jun Zhu <junzhu@nxp.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 ...cm43xx-fix-the-delay-timer-for-firmware-d.patch | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 01ade7d..2c10479 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -27,6 +27,7 @@ SRC_URI = "\
     file://run-ptest \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+    file://0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
new file mode 100644
index 0000000..bd55477
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
@@ -0,0 +1,34 @@
+From 3b341fb421ef61db7782bf1314ec693828467de9 Mon Sep 17 00:00:00 2001
+From: Andy Duan <fugang.duan@nxp.com>
+Date: Wed, 23 Nov 2016 17:12:12 +0800
+Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware download
+
+From the log in .bcm43xx_load_firmware():
+        /* Wait 50ms to let the firmware placed in download mode */
+        nanosleep(&tm_mode, NULL);
+
+But timespec tm_mode is real is 50us. Correct the delayed timer count.
+
+Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
+---
+ tools/hciattach_bcm43xx.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/hciattach_bcm43xx.c b/tools/hciattach_bcm43xx.c
+index 81f38cb..ac1b3c1 100644
+--- a/tools/hciattach_bcm43xx.c
++++ b/tools/hciattach_bcm43xx.c
+@@ -228,8 +228,8 @@ static int bcm43xx_set_speed(int fd, struct termios *ti, uint32_t speed)
+ static int bcm43xx_load_firmware(int fd, const char *fw)
+ {
+ 	unsigned char cmd[] = { HCI_COMMAND_PKT, 0x2e, 0xfc, 0x00 };
+-	struct timespec tm_mode = { 0, 50000 };
+-	struct timespec tm_ready = { 0, 2000000 };
++	struct timespec tm_mode = { 0, 50000000 };
++	struct timespec tm_ready = { 0, 200000000 };
+ 	unsigned char resp[CC_MIN_SIZE];
+ 	unsigned char tx_buf[1024];
+ 	int len, fd_fw, n;
+-- 
+1.9.1
+
-- 
2.7.4


