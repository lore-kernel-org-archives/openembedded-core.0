Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0068.outbound.protection.outlook.com
	[104.47.37.68])
	by mail.openembedded.org (Postfix) with ESMTP id 69C9971AF2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 01:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4NcFBPJHsTn9rSwHtH5CLBqvIjaIabnCoZV2vPJESno=;
	b=E2LLhZG/DfKOkFyPWG9sFsPAY7jgNC1nzGIoEZg6lYsfto4OP8TMlmqFDz/UwbYTujIH4H0+vvB0JYxoRRozkKc/LnyF1YA2Hjf0Wkwt5xnYrAtWGfSOmvErwFg+RlCoT9FrYKMBq+Pm8ni7QR52TFTXTUMB3rcslU2j1lGdjog=
Received: from BY2PR02CA0089.namprd02.prod.outlook.com (10.242.32.47) by
	BN6PR02MB2772.namprd02.prod.outlook.com (10.175.96.7) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.761.9; Sat, 17 Dec 2016 01:47:12 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BY2PR02CA0089.outlook.office365.com
	(2a01:111:e400:2c2a::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.734.8 via
	Frontend Transport; Sat, 17 Dec 2016 01:47:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.771.7
	via Frontend Transport; Sat, 17 Dec 2016 01:47:10 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1275; Count:13
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47835
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cI45d-0002bh-St; Fri, 16 Dec 2016 17:47:09 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cI45d-0004XM-Ob; Fri, 16 Dec 2016 17:47:09 -0800
Received: from [172.19.74.183] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cI45V-0004Ux-LF; Fri, 16 Dec 2016 17:47:01 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2016 17:43:31 -0800
Message-ID: <1481939011-3685-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22764.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 13
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(7916002)(39840400002)(39850400002)(39860400002)(39410400002)(39450400003)(2980300002)(438002)(199003)(377424004)(189002)(54534003)(305945005)(50226002)(50986999)(50466002)(189998001)(47776003)(2906002)(33646002)(106466001)(36386004)(81156014)(63266004)(2351001)(110136003)(81166006)(48376002)(4326007)(8936002)(36756003)(6916009)(626004)(77096006)(356003)(38730400001)(6666003)(92566002)(9786002)(5660300001)(5003940100001)(8676002)(107986001)(5001870100001)(19627235001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2772; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT028;
	1:o8aDbgjNWUUrvmG7rKoG4QMYbM7IgUdC5imLJmoxuaAscYQQLJaYwpK3fPxil2ldUW5Y7OWzRrEd3k0W+HTHoPwJGXclF+YzCTikazJnajxw2MMoPwdYLF/uJwocaQXDBWTnwMCMWXn77TNzgrDDHVxtpbdNWa1CYUks5SsSCkXv9Fq1vfcD31GIMeQTICm2LFBeaJiZpIBbpIQwk+dJkHK3FtNqBLoTL7NcB46/0KITSsY3IWZ/NQd76nTg0qoW54OhskpUZ98Xwi+BjbiUFjfq2Z+6bKOkheMP89NfwCnzuEWRNJiXU0RNr0ecBVPdZMyehodmr/HEFtJw1l3OIhd1pfMKirBfvJouF/IjmOCO0CV/Q1n1tJ90wJt0WLYkVjrsWAqWAkCwBLik/Un2EvnYmdK/XPfvK/fNrXMVTxcTaMRBrhFaXw4quX2dAcK1Ux2kn65wBzVbnQmFQF8Xy+rm0mKezvffmlwfEPciCTwehcpt/K8pAELWaN4GINojMTMO5Wy/wyPcEzWchs4KBQ/UI9G4NmUB9jpdI8GBq21KPTFOcTMNwqfc7V28OTJRaeofGZqWvK3v8UHEQaSvQA==
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2d7687c0-b853-48e7-0e6c-08d4261e9e12
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BN6PR02MB2772; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2772;
	3:Ju1Fx4kvuqgkLVvk5I4I4TnFmfYqExVJkQaPdTKjHRhRpANTHGOwNDSjMNdIhxUUjU/PjABhsY0k9djlZXCwg0OFFyhorDGS3xssl3RJ/aAddLP3q5CZ+wMvjU+ws6iHV1DdTcqBExuryW1d0MI+ltqrDnQVa38XuZG7WLa3nkSRo2s4VCIZFiMhCACfh1o9s8AqrjzPZwAuadlZDuxY2t8SUK7pRwBwWuJ7ncB9UacBuSje8uKfxIbNaPogkRX60U6nQJFr0UD1zpoFhYmX8VuA+HIIP546KRAICPP36DFWbVJniSmTw3m1pcv2YJLYYZdjhBPr6Nq4/G1Y5mQSA9sfF3KyO+SFdDdAHFmPzf1gAPsf5SlBUPD/hxN6/DNxUw45pYB2QnuE03YlORhnyw==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2772;
	25:EOviK+AvMyG31nXrLENWxgO6Jl6UwMCF/MwjX0m+VHciSk9jmqxzkUr2Ovbn88Z5IGEL8fK7QFybt6l1JIuUaMcEF7a2sAjD+1+0ECACK9PXhOx3bUUutZHVN2A8aPyGQZPLc+NxuqsuZfUrH5WDrIVBfkKRdQ0oMlkxaIsjLrtL6Fd0ueBXWdolqMVQ7ANITy2Y+X2WKvCk5PRwFDX+6KKP0MESstbhlBU/um3a7iLWtMYTeTcbPleLa5rJ5YabIAeoCMtFK1rTpl/2UlYvo30x8c+6wJeAU1sKytOsJqWCdMNAwIKJpyPrbcFQq6FKLqz04xTyxDKJ9g8JdFiBQSzdG+2HAeOU58SXvZkMqr5MahUOpU6Q2b39GWUFbDhbfaTzASChQKDC6P6mjv5tfeKLYjdYvyejNF+psIzf2HjgKP3uKYwz5mDtATB8mjEb3mdMPghzGAdx0ykvy3fwCHOLn/wQAHcS5RSvvbhlqDTf1sT/PcE1lZix87ggTuipXr7HNZtbkgL7D9/w7GGQzH774PaGUv7gMTM5o1z/49S5NusGenN6CEIRt6VS5IRJr0KRNTpdowjeLBj/qCzUxZyzRGShK8Rf6UVpLB4YmEUNp/4dHUlw/gidFcHClleuu6AeUbGZP+YbjAuDAgXXXfF8w5FplDgKvT759Ur2Nmn4Sy+tKgnBG0O0D+D1c2UHKOJ7h0qjo8sDn1Oevb9LPddEwy8+pgBQU8VoVxJoJ1fmOIK2G/J6PQHP2FBxYOnVmy4FwGOg3kqRSW72TGvaRE9SOlMvoqTKnNrYvvzFWRjOnJz4XFDV88KN54Vz9RaDRr7ISCnaknDUQrr8jqdisl1mU6bNcaDL7dFb7cIXJyKRuDIWFB6t/3fyeobOrVppcSYYiEnOP/CODbGLLX+vKeWSYJ42ItdaUiw1/ZycBzo=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2772;
	31:QR3GEDGMUPW9wd+xHg4+m2AS48rgAFZ+hdvuSPwLsgbM8jP58+X0XGf4ywSo655YitqJeCba9/7lvxS41bJvgbs3kaw9manfnrislM26uxCQrPGgCgJECe3HL+OR0ouY/Blg5Imc85HzOBeFxboTazutYUoU02610yVRtfuQ6oisGOZcaxY0zrkDeYB/axgV/+79i35f63bbjoLKw8Anmq7kQzONR+rxtS8sqgYDY2ZpdEvYPywOlKdlsSz32V/KzKPmBXinsl2fnWsOGkBIFQ==;
	20:Uu3zJvfyRU9ESWZEDA6iHZf4rJ3gdJhJK9tIkDGvmU0FBs8gOvPrAS9C0x3AnRxU9PkfG8hOKZ3iXXDmEIE6j31mXxV5bkgnF4Om2iz4L22jeKlJN5BYSbhs73QU5GKQhDgfFLIxtO4T1yPa1MOuPV1n0joE832I5ALLNnkJdHDw1/DGx7p6lOxBH7AX1ZLAdNlw7gj4WP2EoQymt5eLpxHAkyJn2c4e4W4wKXWOQMYZVicA//TF/uGvrSiut9GAnJeXDSgZVREGMEX28kYlEQ7sz9kMFVUolLn3k7Ya/0hvEIZnEhGcKSyPHUdzHEX6mCGKLTdl4wLJ3eg9Simxv73Qkwwmud65veytQJ5fhkYBYXd05Ltq0ouwWksbzF3kM9cJdL4Z0VhP8D0+mD5/gw3Y0vTZ8k5RiZ6XNlUPP3PBfihQpSuh0Gua5o3dO42gMTzLfKu17KH965mVb1atakkeY6zKkxiFbpGkNY7ohB+0KtVOh/EfnQ7jM8dM3h9X
X-Microsoft-Antispam-PRVS: <BN6PR02MB2772EC668ED5DACCAFBE198CB99F0@BN6PR02MB2772.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13015025)(13017025)(13024025)(13018025)(5005006)(13023025)(8121501046)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148);
	SRVR:BN6PR02MB2772; BCL:0; PCL:0; RULEID:; SRVR:BN6PR02MB2772; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2772;
	4:M12TOuXpisNGQt+TLpilALQQ5SnGc7WvMylBo+3oYLHmxrp+DnPR7iNlKuPn75MSLAF4UJKMy1uLO6W9oIa47WXoq8XNnwWt+1Q4YAV7OMpbx/vUYv/dThFXl/xb5eYRXmQIuOsYLydogMMUvcwE69LFQOYpeMnpiUYMLjAvNLoSI8NQdeVFvGe2DPGvTxecut5u1OHqsLzxlub3dLCooHR69JDiNlvWhE525UmhNmxg/VII1ywI9ciiUyzSzhIaVCENmd8ddKYM6/vEI0wgiEe4m1nOgbuUauC6D6ZIgli9Fbnx3opUwnvA+RYPPye8zhcltH/CAbMppHa6JYSJZqryQ0eudhJjgsubjxlZkStovuZceTbXIHUFY4V2G+5gnnKjagZ/6/NmTBYoqbme2bdJm8HG8gumtJPXu7mY9ZQCXA5ZTqMnsYmefcf8wMaZgLs8AWXxpcuck33nIqY5ykGuV0dkjvowk2+WxgZM//CIOEq/nMsT9LcOPQgtx15r5ImjG/DoHx4SbgMinRwYprlwN0GeSk1bCPf2kmb3w3WNjbwJQqQrxQvcozFY6tnvPT1zt2xvJskB79PULCQlK4P0HnqLYisanm/ie30AZ+MH5IqdEckYPyaFN+fUYFrw2a0ohBUSbKMUqvnnUZybNRto6zmfxSsterlFAMbzd32+/GVcr/wioqL1bUkDg2JS1JXOBtDAvbQChzBKpZiyziuSJrtq5ZG3sRpOfDa9g8s=
X-Forefront-PRVS: 0159AC2B97
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2772;
	23:+u8zSP/Sb6dZJHIDQdnO5YlcqmV4GsRGnbeMMVrU9?=
	=?us-ascii?Q?zmPbazGBywz7hX7eGlv6lYa40Ks7gBr9FEMvM2Ffb67YZqxoRjunIlkrNYae?=
	=?us-ascii?Q?OyxlFGMhibgLANNj8smj9nE6kq3fN7D4ZZwMvEa11cMF/buL9x2IojqCkyeA?=
	=?us-ascii?Q?jyyz8+LvuwYhFXrCrJC05dPgd/T07uXbzYV9fYshWqwjNfMZVsL/sdj6paKz?=
	=?us-ascii?Q?jw1iUrOOvmHz20jhPxmQt+1wajOa8hshJ6+98MHl9P4W7q9JqbmAGDinvRbL?=
	=?us-ascii?Q?yHfYyAjrB2Yh0qc8Cpum9To/Tf1eJvRR+yNqBG/kCFWBhjzn6wVoLSwxj0TB?=
	=?us-ascii?Q?Gx/ufNdO9kFezNb+eAMWyFhVhfoFtLuSt/ZdRGuWk4ArsCI2RhtfJibtZLCQ?=
	=?us-ascii?Q?6VeM2Aj/ElvkI0CWk2Q6u91fRkByjm1JDI/RFWtoipPpCHNE6eLqDcukEDy9?=
	=?us-ascii?Q?oWqXVwe1BlMga1BLWQpkigHStmFBcj+EBkhnJwSecD//h3pyaTJtAb8xZluP?=
	=?us-ascii?Q?WXamahtpv6BJ4dglmssS9SCSaZXoU3Hatx0a/5+1XvKbP8f90QCwHJGcpvhC?=
	=?us-ascii?Q?uQ9Y6o4WZNtwiTJQa25FtgrQVYnpRRpRuGFQu3kuB25VmmoxLEXtI+oEYq+7?=
	=?us-ascii?Q?gEH8R8Mix+7AL/a7Es96/J78eBQV5WbzWV306lX8+bsx789REc2vLX1BB6Xp?=
	=?us-ascii?Q?A2NDVQrKqgDjFUfTnrV/Z2d9ZgyAAcreCYGdPepUSCw66nUtq0mFMT2pGkYs?=
	=?us-ascii?Q?fY7ybTtoF64kHhdJWiRlrN1tjIdQgn5lEEEQAYEDHQf9zjrjvZ168I8lTjby?=
	=?us-ascii?Q?ZrHxkC5f2WFEFWzmbS4LY501mXh3KY0hbb684HWrM65nt6ap4AgOv5txSPZN?=
	=?us-ascii?Q?27Ome2MKpMwbRR6pzcujht6yZGufxANRQAG33VTcUbRi0S9n0EbwSayThf1U?=
	=?us-ascii?Q?IiVk50NnCvBl3ZLFK6bOktvkyQtvzsLuRqgH9xH3Fud0KpfIZZK2c4E5ZcLQ?=
	=?us-ascii?Q?McCLBDRf89OG/vVKvswvSvrLQcjVY53mSJ0rGZDRVjb8iIjQq5UE3Rg/qMJK?=
	=?us-ascii?Q?WcnZzvMnMpT8pOJpfIRCY8vWh2ImQ7Jjrz/mS18x1T90Oj7DYGN6VhKknm+V?=
	=?us-ascii?Q?LPXQsr8hNmkbB1hmJZq9vtgsCDW4Q1eMy8amioakijPwXXDtXmKEqy5TvLtu?=
	=?us-ascii?Q?6U1sSLlTr5mhnhUkAYfP+W+IIfxzJlQUqlXnYMPBTlotDHzYCt4YMxDgfBse?=
	=?us-ascii?Q?k5vzlAeE2KtUKVifXM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2772;
	6:uAqHUMeOCAGNkD3dNfs9ApQnZTpKvjbFjkHjT/E/lVrxRIs35qqq5wQejjRBnsL75kNlbJcEgzqWqphRKcXYg6MOW5tyWYhXJvYz4LudWKlrreEZ1t6zbX5yZ3Rt0YmEzSip5Ds+/+S6uwDnaM0Y7BjIKUAiGCx0ZxwG6Gfs9Ylfq3jeOmKfK/w7cC3eIL8c4hwB+5+BC/kEkjUswbPw5VP4tUfUWs6wxhIT7DoYx8T3w/JMCOoPePquY51k0Joxo9tnEkw3gX9392wKTH+x2CnUMZMbD/pWbg44MefveLXHWIMvLR+H+bs2Kyxhf7LVWGU2DjvkmMAf0L+JL+9t4Q3DzZgF/aQX9gG1pragMjbLJ4fkxTTwB/b08HGZRV+igUt3bGTdVrxWTkYP/hCkgThNIG9NafW7RJUvwldxCJxFxo23avsuKT50ozgV71/mXTOFtX7ghWS2jRO9adiMQg==;
	5:QCBv7pm2B+VR7mk7/hGXs07oobLRHRm9BAehOf6vdVbwyadGf5vmvYFf9g5ZxP/+B+olMUHcDmi/NbDoZWvZbYC17KtIJhGC5EbhU+8j/XjqAfex9tEmj/vT9B+tIred3UGh+P3cBt79kCF/xiPlOtBLZR8XjbGjFwT6STbjcFo=;
	24:7bElZBessq+f4BIJoyQ+NUvOt5D9XmQ/uTwpYXmS8TeQDlbizEivKB+dzi5n+R+7wnpXUGcSPtSJzd004jl7mnUokQJhwE3qAc7+RzRV5NI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2772;
	7:weF6o1wYW4RVqKj3D3EmiB9ttOLpPrSTox/tCfqhVaNCxzrvrbYnjKnvdZbr38nXAhRMarwA3N/yVIWU6d9NPGmAYbCvHuLi4eFuOvzTlBTJkVTo27gD9VSlnAMXkr2ZmgfLV0K4buMs9vhWungV/hwHxEAJmpsoqiVrqloGZS9/dgzTCggJBVtIUAUuALINHnwZAujg4ERmunZAx6pkybGdIHXl3uC6JWETbRnAlTZWYJkmwA5etl8+IFvk+/Muakw7hLzxWvN8ov7R474CqsPNGkfIk4fVf8epnBMgdoosICDvg1u8E8O/Si2R5z1r/BJurpalxUlFchz7zcDSDJj0LolEy4iD3U11GxAaywfWYot3H6tZS/vHeEJ2/x3EMB8dJIa9u4p0LiKWo0lxQzMshgIdjnrbzFEUpcw/+csi/zvwCr+7Nr5CZ9e3CqwariiLF8/oIH5pfj0y6PtnTA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2016 01:47:10.6284 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2772
Subject: [PATCH v2] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Sat, 17 Dec 2016 01:47:17 -0000
Content-Type: text/plain

There was bug with alignment frags for aarch64 in binutils. This is fixed in
master of binutils. This patch backports the fix to binutils 2.27 version.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
 ...eration-of-alignment-frags-in-code-sectio.patch | 139 +++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index df8864c..5a65d91 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -37,6 +37,7 @@ SRC_URI = "\
      file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
      file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
      file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
+     file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch \
      file://0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
new file mode 100644
index 0000000..f8b46be
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
@@ -0,0 +1,139 @@
+From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 18 Nov 2016 11:42:48 -0800
+Subject: [PATCH] Fix the generation of alignment frags in code sections for AArch64.
+
+PR gas/20364
+* config/tc-aarch64.c (s_ltorg): Change the mapping state after
+aligning the frag.
+(aarch64_init): Treat rs_align frags in code sections as
+containing code, not data.
+* testsuite/gas/aarch64/pr20364.s: New test.
+* testsuite/gas/aarch64/pr20364.d: New test driver.
+
+Backporting the patch from binutils mainline
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca
+
+Upstream-Status: Backport
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+ gas/ChangeLog                       | 10 ++++++++++
+ gas/config/tc-aarch64.c             | 10 +++++++---
+ gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
+ gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
+ 4 files changed, 58 insertions(+), 3 deletions(-)
+ create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
+ create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
+
+diff --git a/gas/ChangeLog b/gas/ChangeLog
+index a39895a..fad06dc 100644
+--- a/gas/ChangeLog
++++ b/gas/ChangeLog
+@@ -1,3 +1,13 @@
++2016-08-05  Nick Clifton  <nickc@redhat.com>
++
++	PR gas/20364
++	* config/tc-aarch64.c (s_ltorg): Change the mapping state after
++	aligning the frag.
++	(aarch64_init): Treat rs_align frags in code sections as
++	containing code, not data.
++	* testsuite/gas/aarch64/pr20364.s: New test.
++	* testsuite/gas/aarch64/pr20364.d: New test driver.
++
+ 2016-08-03  Tristan Gingold  <gingold@adacore.com>
+ 
+ 	* configure: Regenerate.
+diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
+index ddc40f2..74933cb 100644
+--- a/gas/config/tc-aarch64.c
++++ b/gas/config/tc-aarch64.c
+@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
+       if (pool == NULL || pool->symbol == NULL || pool->next_free_entry == 0)
+ 	continue;
+ 
+-      mapping_state (MAP_DATA);
+-
+       /* Align pool as you have word accesses.
+          Only make a frag if we have to.  */
+       if (!need_pass_2)
+ 	frag_align (align, 0, 0);
+ 
++      mapping_state (MAP_DATA);
++
+       record_alignment (now_seg, align);
+ 
+       sprintf (sym_name, "$$lit_\002%x", pool->id);
+@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int max_chars)
+ 
+   switch (fragP->fr_type)
+     {
+-    case rs_align:
+     case rs_align_test:
+     case rs_fill:
+       mapping_state_2 (MAP_DATA, max_chars);
+       break;
++    case rs_align:
++      /* PR 20364: We can get alignment frags in code sections,
++	 so do not just assume that we should use the MAP_DATA state.  */
++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN : MAP_DATA, max_chars);
++      break;
+     case rs_align_code:
+       mapping_state_2 (MAP_INSN, max_chars);
+       break;
+diff --git a/gas/testsuite/gas/aarch64/pr20364.d b/gas/testsuite/gas/aarch64/pr20364.d
+new file mode 100644
+index 0000000..babcff1
+--- /dev/null
++++ b/gas/testsuite/gas/aarch64/pr20364.d
+@@ -0,0 +1,13 @@
++# Check that ".align <size>, <fill>" does not set the mapping state to DATA, causing unnecessary frag generation.
++#name: PR20364 
++#objdump: -d
++
++.*:     file format .*
++
++Disassembly of section \.vectors:
++
++0+000 <.*>:
++   0:	d2800000 	mov	x0, #0x0                   	// #0
++   4:	94000000 	bl	0 <plat_report_exception>
++   8:	17fffffe 	b	0 <bl1_exceptions>
++
+diff --git a/gas/testsuite/gas/aarch64/pr20364.s b/gas/testsuite/gas/aarch64/pr20364.s
+new file mode 100644
+index 0000000..594ad7c
+--- /dev/null
++++ b/gas/testsuite/gas/aarch64/pr20364.s
+@@ -0,0 +1,28 @@
++ .macro vector_base label
++ .section .vectors, "ax"
++ .align 11, 0
++ \label:
++ .endm
++
++ .macro vector_entry label
++ .section .vectors, "ax"
++ .align 7, 0
++ \label:
++ .endm
++
++ .macro check_vector_size since
++   .if (. - \since) > (32 * 4)
++     .error "Vector exceeds 32 instructions"
++   .endif
++ .endm
++
++ .globl bl1_exceptions
++
++vector_base bl1_exceptions
++
++vector_entry SynchronousExceptionSP0
++ mov x0, #0x0
++ bl plat_report_exception
++ b SynchronousExceptionSP0
++ check_vector_size SynchronousExceptionSP0
++
+-- 
+2.7.4
+
-- 
2.7.4


