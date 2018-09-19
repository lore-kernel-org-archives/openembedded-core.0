Return-Path: <alejandr@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0087.outbound.protection.outlook.com [104.47.32.87])
	by mail.openembedded.org (Postfix) with ESMTP id B320B78DFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 06:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=E0BTODkV+bDnyBTHaVXb+Fit0V+hjgozPulQvWJgpow=;
	b=0NnsfyNZ7wKoDnHZo68TeQzSGsPDmzvXh1psioeKPT0Hl998lVGTn0A6x0b8yomsECEZlhshzQK/WSli5kFuRaiJfntA6hTRVIOUD7J0H34Y15NxLecAcVgrScWbsrOadb9RH4SEEVrO+TzC2fOmHAigbAxIP3uA7f7BTH5IHiY=
Received: from SN4PR0201CA0043.namprd02.prod.outlook.com
	(2603:10b6:803:2e::29) by SN6PR02MB4765.namprd02.prod.outlook.com
	(2603:10b6:805:90::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1143.15;
	Wed, 19 Sep 2018 06:12:07 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by SN4PR0201CA0043.outlook.office365.com
	(2603:10b6:803:2e::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1143.17 via
	Frontend Transport; Wed, 19 Sep 2018 06:12:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; netbsd.org; dkim=none (message not signed)
	header.d=none;netbsd.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1164.13
	via Frontend Transport; Wed, 19 Sep 2018 06:12:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51864
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g2ViY-00087o-IP; Tue, 18 Sep 2018 23:12:06 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g2ViT-0000Vq-BB; Tue, 18 Sep 2018 23:12:01 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8J6Bxl9021422; Tue, 18 Sep 2018 23:11:59 -0700
Received: from [10.23.118.169] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g2ViR-0000VI-5G; Tue, 18 Sep 2018 23:11:59 -0700
To: Jens Rehsack <sno@netbsd.org>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
	<CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
	<27c3c64d-574e-e4b8-f1db-343e4a660724@xilinx.com>
	<F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org>
	<badf35f0-449f-d632-c016-509dfb3f0f01@xilinx.com>
	<0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org>
	<17b3364c-32a6-91db-6583-6eb7e0131394@xilinx.com>
	<8ABCF3BE-EFE8-4FE6-9886-65F6AE4E4EDC@netbsd.org>
	<b74ecac2-3eb1-62e9-6162-449d678e03c9@xilinx.com>
	<CAANR1XEDXbrnn=yGRC_XKOdjqtbWqucJdukodZJWC8SV7BPVKQ@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <efb9f8a7-5bb9-77e3-8be2-0e470295958d@xilinx.com>
Date: Tue, 18 Sep 2018 23:11:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAANR1XEDXbrnn=yGRC_XKOdjqtbWqucJdukodZJWC8SV7BPVKQ@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(438002)(54534003)(189003)(199004)(3260700006)(67846002)(186003)(110136005)(1720100001)(93886005)(336012)(426003)(2486003)(9786002)(305945005)(106002)(76176011)(356003)(53546011)(6306002)(77096007)(446003)(65826007)(5660300001)(23676004)(26005)(36386004)(6246003)(14444005)(10710500007)(2420400007)(966005)(8936002)(81166006)(36756003)(65806001)(50466002)(4326008)(65956001)(486006)(47776003)(58126008)(230700001)(8676002)(63266004)(2616005)(64126003)(81156014)(15650500001)(106466001)(478600001)(316002)(229853002)(11346002)(476003)(31686004)(126002)(31696002)(2906002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4765; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT054;
	1:ZYFgZ9x92xK65w5CCo8D7OrMIvK89v5xcGyMhKxzqYE38LVW/bwkgL0Iz5OKyLAa/hziklqc/FJjb9E/HEvq6nSo1iylzXvhdkgGDgquUntOrWF/VF6Ct7pxbeNkTa9X
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09ff0ae-33c4-409a-009d-08d61df6d3f7
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4765; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4765;
	3:BTw5agPXk3aOowyE4aCmJUvWpBlKykfJAdw0fysCg0Uo7XqoUrvIwiiJTLUinG+KT5UGutsnKOQIAzd4OFPx4vxIGUxqqUjxO+yGXuDnDP1fPHs8jAxsqLNOxV+4R1aUKWYQQn0oiJKIq36Ekg3jVdS6AqV+x8hn15v0Ma45l6GB9QqD5zQMSkDM+nDplgf+Wgq+N8EkOJCjrWMiR+YyNjYuAXaXyF2B95UE2hh7jwTF6wsa2OPHI/2cqM9MdTQSHcrNfs3T6c28fwxz29Tht+guxuiQGQZlyBNmODbsPKZuiH7V0EXXx1DHzjd9Lwy6OYCF/QgpxyZtN9QFzkFXYk4QSvRD0/EORF3DORtm+Dw=;
	25:vWB66W50SM/cEu1tF+3CvnsIzVjtzEBLFfrPGJRpZ6joEkwZR4E7xTPXEvw7QOWEo450OGjwMTSZmJNfgZO3XrZCJxbouz/XBSLQV4k30qqNBIxlW0FgAzLeWTzEthNpEGgy9ZnWE/rlysdwgHZpzslkqCGd6uJkGnB5plfJUCSRQauB1zj9mYsX9tQgnv1DKnbEw9Ekd7aQy0dERQH/3VYJk2Yqx2OxkFMAhSQTpshv2fztEdP/UHUJtN6RHwwPFKZiBr4Holy3/r1bjHJZytVPISVw+2buUGJFNDGSmRwdS8MFK7IzBDfEK+SnvvAqFgYuOljF6BAKa/WXDIyhzg==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4765:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4765;
	31:uUPgde21M0WE/f3T7nL+tlZjrPvRcltKqRqjp7DANJ7LYtNhmXpZChC5HSoKARQ10q9aTJGo5DPLvsaeTFUDnsojDyA1iC0P39jdjH+FcD3F52AfV5ORHA4XcycbV60H5RwxI3cZFqkdxwhXn8YyiTnuqfSqtMnhEGSbQxGudaRYuszvpd7v7K88uMcaze3TonTFhker8gOxB97gj2ZNpQ0uGRFetzPCb4JBr4ATUQE=;
	20:iDtqBWtKep1VuKV4OOlC3veMhIK6A/y4gnaYd95qYFde9VWUDyLkDjcZ3EpBtXFiPQm+8W54sDiNqtni4NKQi+cGdEmNOVWJKn+Dta81J96yX8uSW+xA0TYQjEOFzaGcHC8Z3cBG3qIYGbEQ0kDu6OPiiZXqc9+dqA9QENKqM198zkQyTjMIPOHVt3hOc9yCTGmkhQPQLvfMTnVsH+NaMnJahNAfIMbNmGp1rlQZlIcywYszWP8lb/eSlw5xWvHJWviAKn0yzpQUlrBc6HZBEbhoXFCvDigchJWnmVZpVPH2kiMp5YJ9K8TIIXvKODJJ9Dq6ciH9XqP12oUM4G+AFQlzo/v+IvobZy54U6K1FNUIx1Bo2wpSIT97SM0wy8M2MWXIeAUMTO9Sga4DiBpsjWuEIthjGdU5H7ebTvbGVrtOBC/XSLt98Sko0IvrzuLxWnXhyDj0IRRfqoC1ETDMXQpy/om6yxUntlnH9K30yFaOjmUt0K8rtFSim0vaygY2
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB476543009E7BC6C6BA6071A9AC1C0@SN6PR02MB4765.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(264703809997249)(192813158149592)(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699050);
	SRVR:SN6PR02MB4765; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4765; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4765;
	4:mW9eyD+4LTQgXvrena5PcEO4h2RgFRxF53MNAzlLqQnt53LM009S3owabUkX5UPV5rpS2Ms7kkeaO7kE7MhcRBimY9UK6FKfZxUcQ9QytOV8LvDi2T2SNrBPEfPRex/uDZ+iMfRK2spOMpo9UpDmEbDseVoca/kP2QbPgynPtVUS3WYqRCq3RB4/fJpIlZaznskoz8fxdTAo4Sc3TBnRIZhHk86wOVQGs27DeBmNL0JMCfy4y9xznWV7d1Bz33PNvHKEAv12/dzoZb/Rzh3ntvPAE0tM91jSkVrOTzVPxjvmYGJIjnZioaIQ7CAou6YCGzM/M/1Hbl8MCv6y2y72tHkirwM1cQBbsEgP/CUPWnqPv+Uy91F1jf2CONAhPsZpw6ZEhzv11UJTW6xXlvpV6VwbxWscK8JCVeo9JvSx1Jc=
X-Forefront-PRVS: 0800C0C167
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjZQUjAyTUI0NzY1OzIzOkhkTjVhZ3I1RndZb0tWYWtiUlh3dUt4Q21Q?=
	=?utf-8?B?UVlnOENFdHRzTy9xOFhIRmhkRWswc1VieWRPK0toS1BMbyt0TGZDWThDajl1?=
	=?utf-8?B?aE80M0prUG5LVDlwSGQ4M1dYNytNcnd3WXRNMXlhcmVvaWQ3T2ZQdFdoTXdq?=
	=?utf-8?B?eHVvWmhrZW1RN2wrODdhblVPM0hWNzZFa3FKWVdtVStpZEdQV2Q2Mmc1TExR?=
	=?utf-8?B?TnRIa1hBYTU2UCtjcitwWG1ibDRUUkp0Mm5SR01IbmY3VEZrU0ZuZCtLNjdB?=
	=?utf-8?B?d3hkQ1dNczhFdjhncjZEUUljMnRyb051ZTI0U1NBbm9mUkhvYWsxdXZqeFl6?=
	=?utf-8?B?RzFDUFZKNTZjblI1VHJRcTh2SWw2dmdxNmZRejdmWWlWY1RNU0xlSVB2NzVJ?=
	=?utf-8?B?TkpPbjdpZ0R2WUQ2enZ3TjdLYjQySXp1N1RSd3dDdkpFWGlPQ3NOQTNFMnFK?=
	=?utf-8?B?djFId3gvcXVZOTIxbUtTQmI5dHdxT1JoNWI3dHY2bmcvQWVla0d1SUFSd01S?=
	=?utf-8?B?Lyt5amZhc04zVWRudE5RdUZyYnRUM25BTEtQWGpHSGROMDlQM09kbm5FMk9Y?=
	=?utf-8?B?UWxuSjVubW1uajA2eDM0MHBvU25UVlBxcmN5TXlTWVdRek43QnBNcVV4QUR1?=
	=?utf-8?B?SVdsTk13bEtJZTFMZVEvYXluUmMwRjZlcWF3ckIrQzQzSG53V0FRenBlaHJD?=
	=?utf-8?B?NTFJZ0FGazAwakFnK1htY0g3MHNMTnQrN3pzNzRpZUh2RHpkSDFpWk0xNlhU?=
	=?utf-8?B?d3FiMHNEbUoySXdMNE9hMkczZjFaYlFTeGE5UmN1OFdRUFhEOGdpNVNtUi94?=
	=?utf-8?B?QWNkN2dzY29CQ2JDUERiYkpsVUdDbjB6T1ZCdDFOcFhSMkdBYlpnWEgwemVu?=
	=?utf-8?B?QXpEeWhsOWNsKzhiNG5CYmUvZmpJQmNzYkNBVFNRbWRTUTgwb3NFdm44K2d2?=
	=?utf-8?B?Y2ppUHdHdkVYSFIzUjhybjJUTWJ3RXk3SkMySC9QMDFuU042YjJCOFZPcCtO?=
	=?utf-8?B?dHI5TWFPZjFRT1NGOVdnSGdPR2srb3hGY1RQL0lGL0dNUGExVGFWakRoamt5?=
	=?utf-8?B?WUlHbFdZUXk0bDVZKzMrRjVacW91eEJEZGU0R3N1WnFHZDV2VkpiWDZZc2RJ?=
	=?utf-8?B?QkxwdVNQclhpVlVTOWpKVnYyK1FKcHJCeW5tNnRTOWQzY08vWmgzRDNTckdo?=
	=?utf-8?B?WkZ4ekJQNHVxZHNPdXhJOWxoMGgyYm1oYWNEdGZpZjRUSnRJTjFqbEZBWkdS?=
	=?utf-8?B?RFdUZTlnbDVPSkhnNDUrNFhMVVNlZzlwT0xUVzVKNVU0M1dTT1NDQUkxNVBz?=
	=?utf-8?B?ci9ISmR5dTdDU0pwKzdmRVVrUFFaeUczY05uODFlSFJMdmFhVmhYT0t3WEE1?=
	=?utf-8?B?cEVQY2U1V3k1YWp6c0czNUcrMGg4eHgzMEU4N3VYdWlzdVNiOWlaV3UxMUxP?=
	=?utf-8?B?MVhLQTZ2NHFGRnBlRDhUMWIxMElBK0xiK1VoK0xNbmZVNUVVZHhYeGwyVGF3?=
	=?utf-8?B?a3A4ZjgvK05TMTdRUXZlTThnWnFxUHBCT0lYcFJ2MUFYL3piRVBoV3BOTkxs?=
	=?utf-8?B?ZjdjVkI4YmZlMTdiZDVXTGxaank5WUZ2eXdRQzM5aDhMQWt4NkllbkVNVmZo?=
	=?utf-8?B?TE5hYXpWK2hldzd1dGZYajBSeXkyQmR5VWJmMGQ3eklJTm8wMXBMaUxCZDVu?=
	=?utf-8?B?R3FQS200Q1hEVzdoNmRVek9zUUJwcFBMR29JblZ0RVM4Vm5pR3Jwb1JZYjR5?=
	=?utf-8?B?aFdML3phMDUwdHJRUEl6TVFLUjN3anUxMHRnU3RZZVc2RTE3K1BFTFR4WW02?=
	=?utf-8?B?UDRIbWFLRDZLSWppOU0zSWZNQWVuaEVMQ2ZzNkFoT1Nna3Rza2FWZ1A4UjQ5?=
	=?utf-8?B?YjR5eTIvUUxpL1ZpWG91NFdHS3NteUpGc2UwdUNGSmkvOSsvYS9BbHZqaTQ0?=
	=?utf-8?B?ZUJ3SUsvTDdIV2dRbnBTbWlzcUs1OGROT2k3b0g2ZEFSNVo2b3pxWWpRSmtS?=
	=?utf-8?B?QXJaekpid0ZUamFkSURSQk1tdkw2L29WbG5HUT09?=
X-Microsoft-Antispam-Message-Info: M8HZ2jmE+lsXcgaknqC0xbuAfTHbJ1mmPlM0CGstq4aWLtUqcX7C/dN5QK39SV3XGT866mY5oEwRtCze2Ne8X3CLMs+m23WVsQXe4SFAonBHmZgduQhmGJSrTi5f/pXcVkaqImMIYxHwblFePH3ZXyxSsH5WUOgnKmueS6A7QXSxv9usw3igCY1+E81sQysbvYtuWGAWiXY3uBdAGwiWAc8R0AGA6f3cJdqn94CcpuLDrK4rxfCyek3F6YqEl+xSn75OaV9xV93u8iNyRv+bJeFTb/w+8mZI5wZkVg65nptql7yQaOtZ56q+UaykDaTUYDcoe7VfCfyolluLtf9KTZcbVQlZJ1KzSMkpca528Fw=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4765;
	6:S22iAOKaFuzsZDldbVf/dMEYk1bAeuipg6spmuXQ195L2kcxbFVJldu0c859tHbOVJHNsv0pzPUty9ypVGebUox8CxzxWNr+WYtTmvC31Ld1ktj0wr4vyE3mgAroajGiwhjdR+KqQR2cnlBbasnvG3tIikel8RbViLknvpD8ES796zfBVybsDHFkjp3I/X87+ZN7+0QuX7FzEfApjOwCflsCnzuQBas1wKUPAvoP27ybkxRXmRzrKHivHvc8WhEK2TP2k8/8CHjlk34+P5rrhxel+byBuZuG+hXplLIaIVgdmeHkh7q+IbTQ2DqxPITGKpFe2vZcAq7blCkj1eheb5GGiPsfq9cQD3H8szWafIsNibhUXcexpmuE8II4+RlhezfWvlBGy0jdk/3FftaBJULmdPhJPq62QSTG4HXjIyFu8LM7wT6tK0sD5Ym5d0Q4m32juz8eGPkZhiUUdoDCAg==;
	5:la6qBjN1KIHskrHcdFiKjt3jUD1N5E1qgpiQxeKGReXZHVOJPMVb/iguES+llxWtZLaFt2mpK0OfgXJUL5YUYWY/K5ZWjp/6K1MJQGkZt7dzLl3EiyKr/7Q4GEqFupJXTWxgSyklrPGqwCAE8NbylUxBlvMaYsZdcE5MkrFeUjg=;
	7:JscHnZ+2x4jbsS5Yv4+NBUHMiUtD9sFb+Z63sq//JB2gFNER86k+ILxIP9gyCvemF3TrDLtEg/062cGRZnuVJaaTdJ5uq3+m2HS8HM1Lcjb6ebSyYS9G6o4u8SnPnz8VLkIAANoNdhUYE5uqnqyfb3y1AAt8Zm+Q/TGeIA+XXFqxQGCzB3L22AZc/rDROkV47E7PKoPEggXoppl+XkW48XFL3g3JgypKfeDMlui/N0OKp2jkMd9WH6yc1vG2QKnN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2018 06:12:07.1562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e09ff0ae-33c4-409a-009d-08d61df6d3f7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4765
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Wed, 19 Sep 2018 06:12:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/17/2018 12:00 PM, Jens Rehsack wrote:
> Hi Alejandro,
>
> Am Mi., 12. Sep. 2018 um 23:03 Uhr schrieb Alejandro Hernandez
> <alejandro.enedino.hernandez-samaniego@xilinx.com>:
>> Hello Jens,
>>
>>
>> On 9/12/2018 4:53 AM, Jens Rehsack wrote:
>>
>>
>>
>> Am 11.09.2018 um 20:56 schrieb Alejandro Enedino Hernandez Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>:
>>
>> Hey Jens,
>>
>> Hey Alejandro,
>>
>> On 09/10/2018 11:58 PM, Jens Rehsack wrote:
>>
>>
>>
>> Am 10.09.2018 um 23:33 schrieb Alejandro Enedino Hernandez Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>:
>>
>> Hey Jens,
>>
>>
>> As I explained before, when you create a manifest for python (target), it uses the native build as base (it literally runs the native python that was just built), it is assumed its the same version as target and contains all the modules provided by upstream, otherwise the missing modules cannot be checked for dependencies, and the manifest becomes incoherent, so its not an option to have an incomplete python native build.
>>
>> In that case, uuid for target never gets deployed, but it is. And I didn't see any packaging issues for `python3` nor for `nativesdk-python3`
>>
>>
>>
>> I don't see what that has to do with anything, fixing the native build should not affect what gets deployed on target, thats exactly why we have a manifest, so they user can decide what to install and what not to install.
>>
>>
>> The manifest isn't used for python3-native.
>> You try to argue whether there is an error to be fixed - and I don't agree.
>> Each fix requires effort - and that's why some errors will never become fixed. When the impact is reasonable or high enough, fixes are more likely.
>>
>> So: before you try to force me into "that's all ugly und must be seriously beautified just because ..." I will not do anything.
>> When you give me a sane reason, I try to understand and make a decision.
>>
>>
>>
>> Ok first of all, I am not forcing you to do anything, and I've never said its all ugly, so please don't reply aggressively since I am just trying to help you get your patch merged, and it needs to work correctly for that to happen, this is a community and if you don't want to do something just don't do it, we're all trying to make this work in the best possible way, whether we get paid for it or do it for fun.
> Sounded a bit different, thanks for clarification.
>
>> Second of all, I know the manifest is not used for python3-native, I never said python3-native used the manifest, but I am trying to explain to you why the fix is necessary, and I am even telling you what the fix is, so you don't have to waste your time and effort on that, here it goes once again:
>>
>>
>> There are python3-native and python3 packages.
>>
>> The python3 package uses a manifest file, to go through the installed files by the whole python installation from upstream, and separates it in several packages, providing more granularity and giving users the possibility of installing a trimmed version of python, only with what they require on their image.
>>
>> I think we're good until here.
>>
>> The problem here comes because we don't control upstream python and it changes with every release, so new files show up, for example what I mentioned before sha3.*.so.
>>
>> Since that file is not on the manifest, during packaging, it will end up on python3-misc, which contains basically everything that doesn't belong anywhere else, although clearly this file in specific should belong in python3-crypt.
>>
>> What this means for the user, is that he/she will install python3-crypt and expect it to work at runtime, but this wont happen, and when sha3 gets imported (or something that depends on it to run), it will fail,  this will cause a bug on our system, which we would need to fix (yes, fixing bugs takes effort and time).
>>
>> At this point an usual fix would be to just install python3-misc as well, because it contains the required library, but python3-misc also contains other unnecessary stuff that the user doesn't need, but anyways an RDEPENDS to python3-misc would somewhat solve it. The correct fix however, is to add the sha3.*.so file to the manifest, on the python3-crypt package, that way, it will get installed and the user would be able to use it correctly. This would solve one problem, but its still not enough, because, I can see (from the log), that there are some dependencies from other packages to sha3, which means that yes, it will work correctly if we decide to install python3-crypt, but if we just install one of the other packages that need it, it won't,  again, it will fail to import it and its the same story, its introducing a bug into the system.
> Everything clear until here.
>
>> OK, up to this point I've explained how this will cause bugs in our system, now, what does this fix that I mentioned has to do with everything?.
>>
>> There is a special task for the python3 package (not native), that creates a manifest for us, this task tries to import every module from the manifest and get its dependencies, for example, if the python3-numbers package needed the sha3 library (this is just an example I really don't know if numbers needs this), this will be picked up, and the python3-numbers package will RDEPEND on python3-crypt, hence solving both the bugs I mentioned before, even before they exist.
> I get lost at this point and probably getting that resolved - which
> task is it, how is the python3-manifest.json involved or better: how
> can this become automatically updated?
>
>> Now why is a fix to python3-native important for python3 target?
>>
>> Because of the way the previously mentioned script works, it calls python3-native (it has to, because it can't use python from host for example, because its not guaranteed its the same version of python3 target, and we need it to contain exactly the same files) to import all modules in an automated manner and get their dependencies, that's how we know if there are new files and/or rdependencies between python3 packages.
>>
>> So what will happen if the python3-native build isn't complete?, whatever file its missing, we wont be able to catch dependencies to it, causing them to end up in python3-misc, causing the issue #1, and also, in any case, there wont be an RDEPENDS created to python3-misc (which would solve issue #1), sometimes files do belong in python3-misc, but we need to know that so we can add an RDEPENDS to it, but again if we just add an RDEPENDS to python3-misc we'll be causing issue/bug #2, which we won't catch, until someone actually tries to run something on a running image and gets an import failure on their application.
>>
>>
>> I'm not even asking you to fix the manifest, I am simply asking you to provide a functional native package (in this case, functional means with all modules built), so it doesn't break the current functionality that helps us catch these bugs. I hope its clear now that I am not asking you to just change something because I want "beautiful" code everywhere and I never was, I am asking you to do it because your patch will introduce bugs into the system, and I am trying to help you fix them.
> That's all an implication of one big unknown - that
> python3-manifest.json has to be upgraded by invoking a special task.
> Once I understand what's to be done, I'll add an appropriate note for
> future updaters.

I mentioned this task even on the first reply to the patch v1, it is on 
the recipe itself, its called do_create_manifest and IIRC it does indeed 
have a note that says that it needs to be called with every new release 
of Python and that it should be called only with a fully working 
python3-native build.


Alejandro


>
>> Alejandro
>>
>>
>>
>> I know you didn't see any packaging issues, but that doesn't mean they don't exist, just from the log I showed you, I can tell you that the python3-crypt package is not created correctly, for example, if you do:
>>
>> IMAGE_INSTALL_append = " python3-crypt"
>>
>> Boot the image, run python3 and you try to import sha3, it will fail, because the sha3*.so library won't be on the filesystem.
>>
>>
>> And thats because the sha3.*.so library was just introduced in this upgrade, and our manifest isn't aware it exists, hence it'll end up on python3-misc and you have just created an unnecessary dependency from python3-crypt to python3-misc (and worse, a dependency which were not even aware of, until we test it manually), which beats the whole purpose of the manifest.
>>
>> The do_package function is not gonna fail just because, so you won't see errors, but the files will be packaged incorrectly, causing runtime errors as a consequence, the create_manifest task tries to solve these runtime issues before they happen.
>>
>>
>> That's something completely different. I'm not a python guy and I don't get from the ChangeLog what I have to change in the manifest.
>> I can and will do such stuff when doing the perl update. For python, I ask for review because of things I don't know.
>>
>> You can give me a reasonable list of such changes and I update the manifest accordingly when I rebase the patch after Ross PGO patches are committed.
>>
>> Cheers,
>>
>> Alejandro
>>
>>
>> Yes you probably need a patch to look at the correct directories for the h files, as well as a dependency to make the h files available on recipe-sysroot-native.
>>
>> Please check the submission.
>>
>>
>> I did, its not checking inside recipe-sysroot-native.
>>
>>
>> I know. You could check the submission anyway and find the right patch and then argue differently.
>>
>> Cheers
>> --
>> Jens Rehsack - rehsack@gmail.com
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

