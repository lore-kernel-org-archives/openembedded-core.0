Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 14517 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Mar 2017 16:13:46 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0058.outbound.protection.outlook.com [104.47.41.58])
	by mail.openembedded.org (Postfix) with ESMTP id E8B0C73071
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/F1aoq3nrepCatNLY1VXwieAcIdQ2dik5B3fIDwfg9A=;
	b=XJgly7gb0wIN2r8r3VlKX0uYrdfseoAPk+5ltij6O2m6orB3EMQxTd4WgsKq/+DA3DfqZfToHH7Pr0DogHtINg5SFFcJCQ90iwTsfSJaq5B9ph0/H60y5mm9WWyxSEgIYzP5peUu6yJ8bKV/TFSpwJBba19HuMifsVy56J2l8I8=
Received: from MWHPR02CA0051.namprd02.prod.outlook.com (10.164.133.40) by
	DM2PR0201MB0717.namprd02.prod.outlook.com (10.160.94.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.977.11; Mon, 20 Mar 2017 11:39:17 +0000
Received: from SN1NAM02FT055.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by MWHPR02CA0051.outlook.office365.com
	(2603:10b6:301:60::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.977.11 via
	Frontend Transport; Mon, 20 Mar 2017 11:39:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT055.mail.protection.outlook.com (10.152.72.174) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Mon, 20 Mar 2017 11:39:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:58995
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cpvee-0006u1-1b; Mon, 20 Mar 2017 04:39:16 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cpved-0000y7-Ul; Mon, 20 Mar 2017 04:39:15 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v2KBdFri024813; Mon, 20 Mar 2017 04:39:15 -0700
Received: from [172.19.131.26] (helo=XSJ-PVEXCAS02.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <MANJUKUM@xilinx.com>)
	id 1cpved-0000y4-Bf; Mon, 20 Mar 2017 04:39:15 -0700
Received: from XSJ-PSEXMBX01.xlnx.xilinx.com ([fe80::c4cc:6661:8e92:58bf]) by
	XSJ-PVEXCAS02.xlnx.xilinx.com ([::1]) with mapi id 14.03.0319.002;
	Mon, 20 Mar 2017 04:39:15 -0700
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
To: Stefano Babic <sbabic@denx.de>, Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/5] file: 5.29 -> 5.30
Thread-Index: AQHSjK1sofxLXsrBbE+5auXQQ2F0I6GeELIAgAAIOID//6d18IAAd9cA//+K5pA=
Date: Mon, 20 Mar 2017 11:39:14 +0000
Message-ID: <14EB1FFCA0C8D24A8B04EDEC1EA78C2458A13147@XSJ-PSEXMBX01.xlnx.xilinx.com>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
	<2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
	<ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
	<490a19b0-0d48-c090-685f-1edf1e017c4b@windriver.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2458A130E3@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<fbe16392-dd05-24c3-0016-52c7b07be73a@denx.de>
In-Reply-To: <fbe16392-dd05-24c3-0016-52c7b07be73a@denx.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.92.111]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22952.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39860400002)(39840400002)(2980300002)(438002)(189002)(13464003)(252514010)(377454003)(199003)(24454002)(9170700003)(189998001)(81166006)(8936002)(8746002)(8676002)(2906002)(33656002)(7696004)(53546008)(5890100001)(2501003)(966004)(97756001)(229853002)(93886004)(47776003)(38730400002)(46406003)(5660300001)(305945005)(2950100002)(7736002)(54356999)(50986999)(63266004)(55846006)(76176999)(106466001)(3846002)(6116002)(55016002)(102836003)(6306002)(2900100001)(2920100001)(1720100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB0717;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:sfv; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT055;
	1:lCtGPEwMA0X4vAoI/Sdd8yYnbIXvYfW9bzUHEsH8ejBPJTKT0o57zijZUh6SjI3HHqI8t35cpyzXmNBjV/pCrDFTwP/xnEOZ+E6c7+kxY8sLbyWNBTLGsDqLTl+I5YOJkQTTJdcAB5GIZCh7r2VR1uCCb6jcRndf142QIhFT9OtI3DWNMwvHBna4yQ04iE+R/vJXf75/QCSiBURYtzC7A/TAaYSqF1X//ykwMtUzD9MD0sZPjECxP0zwL05yXPNuNez3Z1aTGE2R5BMczdPgt6EF+ojd32hpR5c7TjnzlOly8EMgpDhNZhDMqWIpZkPrBM2rEZj81tZYm5WyUAD7D5iTd795+uyy1nCVf6frt+DZ/xx/IuzKzbZ+HxtECxcedGINizfPjWRTWNSsVOgRJEyTCICp3Z3BLuuZeQprIySKd8IlRcEhsUsrY/kvwuAtTTZhggRmuMjqIcYWs6ZwkP3xxEuB2vGKJWPjOVT2LkyoSyJ8ZEtKiBbUaHMS7MvC2X1ePGVo14APM5bcjW42pqNXxbmDev5MEDw0ScYirtJQyz8f/Lhxn2ZqwGMsu1aox12DMMkEWFW0O7OvRgaQQA==
X-MS-Office365-Filtering-Correlation-Id: d0eb1dd4-d577-4111-0bbf-08d46f85bd7a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(2017030254075); SRVR:DM2PR0201MB0717;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0717;
	3:GcK1Ec1qKuab6vmFUN+pfQf8OuDG4BYgxiMEMUKEBr3b0OymO7iggJhNBvJFH1uoneTRHeelS6FNGOIXVN6lp3n9zRvNre2/A3a27CbiNVL31RA7te1i7FX63c8gRXCEXPlf+HPg8U9MTodp5WJoa86oiWIu7RF6CVn8iDdXcYV3K/9PINlrGCj81DLE0oC4Vo2aCcsy14s3yKChPIcsfl9EvEygwlnl2SHNeDmZdRoUYl4oyOYO8+Bcm+aCtrCwx5P46foTz/yALAJy2K87i+gRxGnFxw1EpHFsCA3fkRZZRuukI3okq4Nn5IghNg4/RadIUtmOZz/7ZrQjf7nG4eO5i+eb6GTvcfSTL4q9+FveXZyI2vv4ChYPR+o4xgn23kF/sR3jn13bYqVxJrK1j8Vdc5elntVtI1KQ6H0UTPU7bAgPimKN2UTEqukJVoda;
	25:vPUwMdRONZd6Gn4CTBh9rsdBjd7E4LVRsxp0qew85NJ9/+M2RDBmrc2cGKEu/BG4ZXjXUzq+mMTXK2vfwCa7bAmnOD1+KPi8YY93BqwcQ+SPI6hGV76NtKPNzEhxrXuR05hrOQ7y0icymqn54iWKQuqQ/uGlYdOUVeU1yoQQV+/lUzmbUeT3hzD+ZISybjBMJ37K4EQebT46ZXqWQLVkW8YNVkRmvHt9/Plz5N6zqpwNVakSinzisZzhWPxAjV2qrDU2TFacEgKTPM5OtjnNt1clWuAuIt9Go9LzaxjkwOfJHBBr8BevLkc7+ti0d1g6lFLpnYdwT94mbKVoQvqsqWpcmHvjeTUMta38UIcuxzywoTqjAsl4nYH0AkHiqBKakLUnTVIrwNylL7xebto8gfVbCOpK21cHJ5hbcs+JDkCe3HTgecxbujUYERp29MpSgtykbnsrhuAvBQwT257f9g==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0717;
	31:ZTcry2GeWVRL0HjWbfmq8EoCezWBvd8QzbcyBaxjGgu0fCDIp5aIQ3sEy71+udM9QaOxw5hz7OrhZlXJuw0sLwCXnZosyRhh77V6nomh6YgY0VAqUKIGOiEwj+IUXuXqUPFpI3t8qyzGnzVudFBTD851UdAtwPGNkDbk1S512xnxtrEHgPkKfgNjmHLPR+u9F4BNtNb1OJE2QSIAU8PHn6LRTfO8ZSqDdWGzjbolepywVuzM6enNpziYSMNrjvlEP6HaCHif1Bt1pBah/9ei7H/Wa0LqTHzA3aEFnuFqkKE=;
	20:dKXeUIQ+OsfwIn7/byvmahAVC8GYgAHcy/YZ83J1pviEMdXNkx8l9RJBkHHqyBnoS7jiJ8b7j7AiqeqM/4hpCkqo+l+L5L0nOEIRhn0RI9p5USZMvkYgwOC97sMHon1n6+imbA2mMFCwd9ImQ3RQ2gMGxJAFkGi6wn8sTmfbKF/DkZvCvEB4vzux+lGDREe3gZFg1GByydl1VtwxwoitLAktdwSQNwCXmXvvc4jh0YkUH9Kj7n+zFvYiRY7W0P/g5yQixeu3IwEHwoCyO0tf5J87tA5OhADhLUBZCbQBdzROobwt1zis9N4tKaHYensJ+uUiUGUDsvLe1QE3zls7QJlcxhJS30ALM2z67zTRuP5R2TKw6Tl31VE1ZSPnEgLCKlaAT1esqIB4esPe7YzsDkCEaoyXlXl68Pss4F0hE45IGHMOvSYKFKAfnZYFexiduf8TMa8v6ubBgJ2oTEAdfo5QBXAdNTzn2als3mEyVJIaNxt6XziSem5RnV+Prbnh
X-Microsoft-Antispam-PRVS: <DM2PR0201MB07177350332F0B0C58C7EB59B93A0@DM2PR0201MB0717.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(13024025)(13015025)(13017025)(5005006)(13023025)(13018025)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123555025)(20161123560025)(20161123558025)(20161123564025)(6072148);
	SRVR:DM2PR0201MB0717; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0201MB0717; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0717;
	4:d+pl1/whx+xOg0uS35OJjdtQAJ2dU2UbN9ZPr7RGsa4yYRRIIFi+XKQjPgTGxjqKdIO65Q1pYE+nOWByWQFJZOdExpUEBW6ijxOwZOyPLP3D2vdo8fFC/8t2lgJQ0NIZ2U34OKFRTpJ+cI517h1BPRD7lrUSTWHxPAqNuPr3wPTyoRP48uC82orG5Zl5KGES1dGsLZaWepOx3eaD7n9INcQYppzSuw28TpDX2mx5+F4K80ieQ+uEeZnCkZ+qqI4EyVYPTG3KCi70ckRzyz//xz+QO3bUXI3MkoehENKUzTN+RLZqsUYHOnpp1S3KCGXzh7p2L6oTAxH91HuOHduLGsfvci8CoTTLHIP/xeITEPtYTfGFI0a3wphHYAHSSr0QHbzI60yODaZSvWBYCbtHAmuPp3LNosYuWLgwRk8zDEk9jr1+OfjvlXbrlOfvfXNqiEfNn1cPZ9Ek8yyGSpyVXmUud9Eb85MUtswu3wq8eoxS2E2TdSDsjSBUhk1JDTfEDR9KcEqZQtU5rEyUvXDFKOgbBF9IOEpgtiueZa2M6vniQ2lHtsVIoYMYlN2ab2Lei9ypFwCUgf6x6Z6kJRUAy6uNXT0XTn1YhootZzgsxhGFkI3L6fT79nxfl4XmA3VtbBeVel/r5vB5Q+vFJgjXZSTPijTI3EvDKsIMrwYApEuHuOgEj0oXPILklZry9vFC3EYFi6+c3gZtbt5guK4KK/IWkScH+af9pXovdgPjd00Yg+hEU0EFflT8rlPV5gyRuIq8O1MxuCeX86aaWergzA==
X-Forefront-PRVS: 02524402D6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0201MB0717;
	23:k+YBpPlsJ7a8CCCydNzm8KAg4biJaLK5B5XOqOk?=
	=?us-ascii?Q?wPpCPvaOSAICRzgk8Q44EjyvYsB1axhhrj+sph9XwzvhdW3tTCxnOmiC6XS4?=
	=?us-ascii?Q?PwoNUPZXp4sxRfEf5ncruuFgnePX6NE04pNbK+EY/0Lfn9ZRXMlt0ABtPNfC?=
	=?us-ascii?Q?EZFQ+e++VOOCpF3MaBWPdq5i9EGaOU6NvubJJOCIe7kU43jgYCBpt9j/2F8c?=
	=?us-ascii?Q?ZGmImREETZeSQNiQCT6wpu1XoDernni7PtiyB9iyrlf0vi4JGUNc/GQgkQ4g?=
	=?us-ascii?Q?opNYNYwXxddFLrH5Ob0FUHyEH5dlJGmuYLhVVqPM1cV/iMU/T94x8tx3hbJe?=
	=?us-ascii?Q?dUohc9KEIO/OoeJTFv9XJHLadI/F5kHvSp7E+pygpMJ4W2gcO4jpFs+vlVbK?=
	=?us-ascii?Q?Ujm0qRn+AILIH9rdPKS1t7j8GEdn5oJZzG2skLl6i+bC8kvF4kv/mKmoDJ0g?=
	=?us-ascii?Q?hS+bNCwCBMPLVZZ/PcrkeFTbIbHl2C6A6nWVzkr0f9RynbNwzSSQw4v9un0K?=
	=?us-ascii?Q?sWYVZfhb3MuZKmyPZlPFIMCF/MYIZ3M1mv17JRL9V4l5AjVoXZOaNmk5nopU?=
	=?us-ascii?Q?xkacE4jbfT+Mchz45WZxIViBVZrCTgJRyNu6TrzvDlwpL8908ULzuKHhDxhj?=
	=?us-ascii?Q?UBDySpvwr/RhzD9D0oXjTQdHwGqAXppjPDp8bYUkHstDRrmGY2/CsprELtwL?=
	=?us-ascii?Q?TgjhcpioR2ch82HH0wRCQW9H9dDic3iOpO+9PddGBvXmhFjTPpwk0TEj3NY3?=
	=?us-ascii?Q?5wiuWVsHGbpa6vifMo3gOY38oyJa8yfdINQQKpEX+xzonA/JsKWI1KsgB8Qt?=
	=?us-ascii?Q?6XBPetkFQiXhzbARpXG7R7W6DSoJQWFMcUN4a6AzxZVAD0oYcN4vt5LckeSg?=
	=?us-ascii?Q?orvI/ZeIzfFVdwVBJihuwIiQRlJHeu+bMK9KHCMBKITkl1UrLho7Ygt+4q4S?=
	=?us-ascii?Q?uckB1WFevNLN87okaHMmuTINYuJ8bw/FDGnox4it1il+6O6x0/4W0MFcE7P6?=
	=?us-ascii?Q?HcrkePkyduw12NaCnX2/NIoZL2xH8/vunFIxHU6rRNsewvrYaQM8LM9xVYZk?=
	=?us-ascii?Q?uO+8aylsa947Ije9lXLMWPu3P35xZ2i6+JtE0UaTrXGfg2Pzs7vvsNyREk0A?=
	=?us-ascii?Q?sNeaK2IRaVyJxfurf3OOP/PpRDO/VwV87Ufff+sYZBzGFFc0RFu+H6+3xoGh?=
	=?us-ascii?Q?k78r4f1otHiUejc+27MeI+T1ZcCMjO0y8nxke?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0717;
	6:LJCnY0Mv4hr1qewrqLBo2APCtCcjrOO+EDxbLOlFESrjy44yHkWDbad1hydzor8yL1Fu/GClOrNnfo2FfNTtqJ8D2nmF2Imt9P4PzCzBYG2ioV1YB+B32udN9R+lxb0qOkkU2A3tc0TXp9nyXZa12H1cecfaa3ydFg9b44IGGMnV+zMDCKVqkCS2Up/BdpF4jbzkpq6M35tIO6h3OEoNJlZiOFnROuNp/2UcZcwXE857EwKWe/2RCe3JoRI5mOPqvLWLQKmQhutVdi/ffMo83F5wRyq4Hog+NB8BOVpJQ/qPCu8KZ7RaMVA7PbrRqgudSeJbMMvuoWui21IFdeE2JNkv0k4b5/tEycWsRUjP3XioilJJ7Pkk0M0i3xc4gXI/QjJpgtLF+ySj/7jSh63xx2KAMGxcikMyWKrR0Kjyp+E=;
	5:wURNo1N3Mw1Jfoqitu6+kSmIV4QO/dPVCYqrhn6Q3C+QRzWwArRbxAMxrs/BbxF6pK8i/jZYzFHFeD5xuppXZ7uKKkKy44MWTA0BZRQGtjNGEZR9kCHTb1x/HqHCiHBnjE0dCRsL02rHVfvH/Bu+Z72BhL5JmFIg5X7yhFO/xBg=;
	24:MDWkcjeUme0cwm37/olAiwZPgBjsjXcELClYqA7X0p+SMQdtZav6hCmecjCUc+ZnT/fVB3gNnHi4eHKeeXcYM78lJIL3CfaMAOkhnj2S/KM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0717;
	7:jshc+3w8k3IkCM1eCzIKDgP9H8UrpB93zvk9t1daGfKRPjPYnJzMAQMHgBZQ2BaFvvQ5QX4wolmVAXdfaCx/MS5WbfIlEgq6m8L324G6j9jt2xT4joB71PCeO/ZvUQKxC5WenOUzB7wAcM3Qk266uF5Jmd47VY+26ofeP2UXzJ4jbOPPaGGZUPfXiWA4URtRkOXs0FjX+m3ZATRKu9+rNp82Ik/2qIvl2jQSLsP1xrhPUjGVykzcMi6R9DbpFT6H25gIm67AcStt87Ju8qaS3tJg/szVENu2VpJ0PYzsH5Ug2P9si9EFDSvcTQnmmGJyKZm+EMWuGZev7bIlTi+TiQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2017 11:39:16.4120 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB0717
Subject: Re: [PATCH 5/5] file: 5.29 -> 5.30
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
X-List-Received-Date: Mon, 20 Mar 2017 16:13:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Stefano Babic [mailto:sbabic@denx.de]
> Sent: Monday, March 20, 2017 5:06 PM
> To: Manjukumar Harthikote Matha; Robert Yang; Stefano Babic; openembedded=
-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 5/5] file: 5.29 -> 5.30
>
> On 20/03/2017 12:29, Manjukumar Harthikote Matha wrote:
> >
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >> Of Robert Yang
> >> Sent: Monday, March 20, 2017 3:14 PM
> >> To: Stefano Babic; openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] [PATCH 5/5] file: 5.29 -> 5.30
> >>
> >> Yes, file's upstream commit ID has changed, Paul has sent a patch for =
it:
> >>
> >> http://lists.openembedded.org/pipermail/openembedded-core/2017-
> >> March/134261.html
> >>
> >
> > Is it better to use nobranch=3D1 ?
>
> Is it ? I would prefer to not skip test, just fix the issues.
>
I kind of agree but if this becomes a practice then it will continue to bre=
ak released versions.

> > Changes in this file.git has broken Morty as well, we used nobranch=3D1=
 to resolve
> this issue.
>
> But which revision is taken in your build ? IMHO it is better to fix the =
revision as Paul
> does in his patch.
>
I agree to use Paul's patch, maybe we should also introduce nobranch=3D1 wa=
s my thinking.

Thanks
Manju

> > I haven't tested this for other released versions of Yocto.
>
> I tested -krogoth, -morty and -master, all of them are broken.
>
> Stefano
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


