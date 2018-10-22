Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0040.outbound.protection.outlook.com [104.47.33.40])
	by mail.openembedded.org (Postfix) with ESMTP id C684A79BC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 23:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/4Ye3RwwkuIgsJ1u1xKNKrV9iv+KysEcTd1m/dvD1nA=;
	b=BTFVwQjImArNeofbiL3McGSKRPFy039Fpiq0fy1gMiUwcvgm62YQIEJAqUEGw/jwI64Szb30wPdeUotcG9YZW8nOB/q44xso0stgMifQyre7oj4wyTkOg7k/hLAe9eavu0JcTTCBkBQRKFyKFzSyzUbzja/X6X62TVcztnFwX9s=
Received: from SN4PR0201CA0036.namprd02.prod.outlook.com
	(2603:10b6:803:2e::22) by SN6PR02MB4462.namprd02.prod.outlook.com
	(2603:10b6:805:a8::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1250.30;
	Mon, 22 Oct 2018 22:17:35 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by SN4PR0201CA0036.outlook.office365.com
	(2603:10b6:803:2e::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1250.29 via
	Frontend Transport; Mon, 22 Oct 2018 22:17:35 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1273.13
	via Frontend Transport; Mon, 22 Oct 2018 22:17:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33823
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gEiVy-0000iT-Dr; Mon, 22 Oct 2018 15:17:34 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gEiVt-0006FC-Ab; Mon, 22 Oct 2018 15:17:29 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w9MMHScW023561; Mon, 22 Oct 2018 15:17:28 -0700
Received: from [10.23.118.238] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gEiVs-0006EO-8a; Mon, 22 Oct 2018 15:17:28 -0700
To: Hugues Kamba <Hugues.Kamba@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <a8c53475-1c2d-f909-1e52-cf8d04f6d3e5@xilinx.com>
Date: Mon, 22 Oct 2018 23:17:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(438002)(3190300001)(40434004)(199004)(189003)(14444005)(6246003)(5024004)(106002)(31696002)(63266004)(356004)(31686004)(19627405001)(77096007)(36756003)(65826007)(186003)(106466001)(2501003)(5660300001)(54896002)(486006)(126002)(11346002)(476003)(64126003)(2616005)(81166006)(65806001)(446003)(336012)(65956001)(4326008)(39060400002)(426003)(8676002)(8936002)(316002)(110136005)(54906003)(229853002)(81156014)(16586007)(2906002)(478600001)(58126008)(84326002)(76176011)(9786002)(3260700006)(6346003)(26005)(71190400001)(53546011)(37036004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4462; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT039;
	1:J5drxUV3mVs2xoVh+sN5tSeSVaArXE0GI2vKve75qamfGEcxZifwyIKalfI5du6Y+vyojVAL3NbrjvVMelr7aGCYfqBltAHlBKF0CioQobyWOielGdrJv5FjiExCJvcS
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4c6ab1f-040e-4318-6415-08d6386c2b45
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:SN6PR02MB4462; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	3:IG8Dt3XUc0X/h31C0j5kGed2ydKD3CyePagsOkZhz7VMtcBXXTPprrM3zj7HEMDjvdKbtnhO0DjgfG4xdxZ/8XLNULLQ1IYcc0A2DQ3vKtfgsL6tQLFZdwogKv7Z9UJJ90caPB02DIcmBS25U+T6Lfmds/xLJtMIS8vU+KqrnonC3shbtqBiezUOvXCbduQroSuJ9gR0wvRAKYX65eN5amciaRul2iwZL+Nj8voFJedzkj+1KKmo+4Fhy77VFKFbPTF3M8mVhGHXL4HwHJYfBpzCgBA8RjispeAnaH09gk7VJ5PQFDfND2pfWqGQ0vwX+zDapGNKx38WM9A5hb+kLNAHbOgHbQObN6jM4+zeUFE=;
	25:Z1SL9YrBgkP7XCpPG9+l9sHRw2NZTy3LHKw9CH5WCU1uScO39ILkAPfFXyuPFV03MYkacEH1cthlGavV2eQLAomzc03cCFzCvh4utwe/5lsKFC+LdIVdRMhAhwQUSYLh5r1zp7ZHUy7eJd8/xI8ObtJxKK4+llsbY5hCW60s6beNFeXQIaGs99eQoOUoFUflfqRXqV2a/PTqzDsidxTqHP2iqizqpNr92TBXbu0RG47chChZcJUKFyi48pyx0MONiIA4l7aGbB1ah8fqjXAmsy9sweVsduOzOAu756ozFmPo7+9TLOZnOI2qD0uNMUoM0dIj2qU/oJmZddaapBc8KQ==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4462:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	31:0jQjh3KFcWWUwnL2iel04C2Up2BRU8qOW0XSHneFlm93apnYwH4rbDJDdfJNc2nnz2b6OcZvQGEZkBJwHqEAsbM3mDxw272eYDpKhJ0ucSUZVaHx1le4hUd+s8vCL+XRgM5Hi0DGa3oLgspkz4AbaA+jfzKOla3HjEYhaYQcQ6hUvnqy1uaOSGF6qylgF+eG0Dfv/j5jMmocbXBC7F5Vc37Af9IhK6GzQT1SxqZOFjI=;
	20:qZxeHdgnTmhFSoj0jYSqVfFo5LNDupkR2O8Nm/3TBeSWB0TXCe/EZt22WXWZsi85yAagmexXLpBnYKXRO/L1dLv5JD0D/oOvyZT2Z2SIpb+lLamuH1rPSP/O598zsbd9zDxqPrRKBudtm7qhRmZ7DV/qGxd2ZnlTbWEDcCGemJd/p/UJy1juLZ7OjMaPFZ74vYRbOrKln34VSqgePVyXyhMqiXLOIu04fF54ayduFopyRKnUkJnNSU3XXwvzYVbvM1a0V8pfpLQyeu6PaIccl1qDfJ8XZFVdzUPns1nRjNWXyhr2ghLHbUgU4o00SltfORvdzODZgD3ZHsnjeqezDz0L7yFG8kMCGD4VtAojYgjqzip6y4vRgq7II0bI2lyeLQyDJZiqv/YpFdKRX51hSKyOqvVmJCzfK8hewQS/M9yK+UYtIkX1G6i0WmA/dsC7Tpy2HexmgJaZyfcpgTDCL5nwRalO1iB0Dqvn6JTh13p3tmZf988H/+/dU+gRDdHW
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB44620817D078F88F1DD2C353ACF40@SN6PR02MB4462.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(163750095850)(238713787762100)(189930954265078); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231355)(944501410)(52105095)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4462; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4462; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	4:eGXJ8cK5ASBCVkCktG6zuRrtmTgKJ3zciXC0QycS6zHfM1HcVVPA4Qx4/YLcRJUn3TypMU2UHV3STsw1er6DYBwHfeVGV3xx2OUN8i99nyvdq3u0Q1dlDkAaGLs+qwMdnrD/f6Zvg0PRVD3IAtUO+4hEf18Ki0XZL2gsnJ/r/74OKfxhE/F+99PRFuyhq4eRpap/qTLNuQuyC4QcElxM787U42yt/+A5K9oHIFAkrCseb3YizXucS6efFTHBz6UfjcHGpMnBpRwKN77S8gvcEWHAPw3LT3NbI0Vr8fPAkNR02cdg09Ph17thD++jGo0dLJY9tO+Ytu3wI5uZtjIIrdVa64fIm+kph8IJfHe3F/4HkSqHhzhzhWDOikjt4o0C
X-Forefront-PRVS: 08331F819E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4462;
	23:XA8vUMHAsaTL5NksTakdZc0REqpSiG1fW/CBcgduh?=
	=?us-ascii?Q?IWHu0W3uaDPeUK2nUJokUGeTwPtOf2LLufmhMlyLtvgaioiDxorDJXxTeM3w?=
	=?us-ascii?Q?qA4s1UBGXMD2G19N4SV71iwrSMSJ3zbqEwRkZCPnSTvPgu/NjQoUOXRgni1Y?=
	=?us-ascii?Q?+HLFU+PBbXRzua4mlGJ4cl4N9UVD4tDXpyKN/SrhB9T/cYJkqwnt/Hnf9J2M?=
	=?us-ascii?Q?ZDF/v+gJ2ajHDnepSoOhCV7DOixw1dS0Rgh5fqmJJ6sV/5QQPrXwJ6Cq61Rg?=
	=?us-ascii?Q?f+1XPj9Z7ZR2a0CUxH4XgLP6YI3n0uGAN00kcKbiU3odbqvMHcWwuJIjUupb?=
	=?us-ascii?Q?DtjpfV0YSy+Z77X38vWR6jWMfxvHEcnVLF0+xdqtcLfDlRJL4xsgvPfOowzG?=
	=?us-ascii?Q?t9jsttUDQbMSkfbHFPKw6QJmOhQ2BIZDeH87bMfTQkRgPKIfzsAX65ciuutr?=
	=?us-ascii?Q?ioFt+9IZobBeBcfVf9HzfZPeyhFo2eLwEuTSsi6FxO9jvIG99w4Qu3x1Kc8U?=
	=?us-ascii?Q?mZ1yNnDMxzvDtGwjZdcTNdDAAUQB5DL25nkNGQqg5h0SyQOEFZuZvJ4YHUy0?=
	=?us-ascii?Q?ENe2CuAtmyM0XCEy9PicUkmREgiocmkmHXDoW4po1R/PnHAQMhxjKxI+x7kh?=
	=?us-ascii?Q?yR6D3rr6vX+yurizbaMDgHy6O4bk3VenOHyO9dVHjkGE9qoI8Tt7FewQteFO?=
	=?us-ascii?Q?yDtGsBMn6LSqojOsDiNcM51kKRsgxWA5qp0pSI16NMA7nKBQBO93/yE2fvHj?=
	=?us-ascii?Q?Ix46g/Z1Z9gHfIesRMmeUCEudei1KI0YWJYoOSAXinWtqCLL+HzVbyM4LmcG?=
	=?us-ascii?Q?fyGWSqJH/8qdepN13nsqwGeNl4948ugxU5NjzY5zyPL9iy9fuTgr/Z6H6fWT?=
	=?us-ascii?Q?Yo/rEnDJ3aQ5JbB0IMB18n2M5454BjUvzm8qp+oM5fitwTNcuueIsh/tISNI?=
	=?us-ascii?Q?CRCMOoDDAc0RMXTPa4sxwKAX8MyDr2F1NmveZN9BSf9+oIACgjd3apJdz1Yl?=
	=?us-ascii?Q?wAVOsRaIV0n8WgJWxIdaDqurnav19l3szDrtntwuOi+NIzSGHnDkGLAWnBfM?=
	=?us-ascii?Q?g/uIWswRQtJKIqh3lqJSo/HoX2u7hDtUdlgC3d5V1mpJTZUE1o+9i9oBych/?=
	=?us-ascii?Q?ta91FW/oqYLNep5QPgetaUGfmUq/sHl6eyQouqOZFZky6RUsc3FWLavss8hN?=
	=?us-ascii?Q?m3eNJt2BKgYiXNdOvnoYITm161CXEV1i558trudb1p6SQYp0eJve74elWmC4?=
	=?us-ascii?Q?aPxIN4/JloNOJirMfY60rAKQ+86Peie5Jz62HqmsJf72/8yYXPbVRRMhiCPA?=
	=?us-ascii?Q?vAlU6GIg2eo7faDoiz+H3lcbz3acqBaVH7/p2aMeRAaGxnDaCND7D94zbojE?=
	=?us-ascii?Q?OWHg9o0/CqlADRx+JBA/0H70H2t3nprdoTU/z5QU/skhjSAKOkCpjG3aDS1J?=
	=?us-ascii?Q?xeF5nIMCg=3D=3D?=
X-Microsoft-Antispam-Message-Info: sF3aaOysYGm6Qdq4dlx1ArQ5GND1qfFUYrcRRmS487hl3NEaJezuSYJIOSUGkG4oc8uwbcYEijUfmjMkEZe/aCnQk1wkRoSpDz3CvRgWQ0n4Ij+41oExLe4d+PIsUhmaf+iRlE2UbfEf9bjaDa8wE8Hl65z91FG5Y8ScPh0UOzAMnTQl1mQhpNBe6AxcYl5grm6ywWg5w++sK3m8FbulE3D3iPaiXgs5CObOFiWL9uF2OOAv5cwBlU56FTWRs2Pn6ecP/Xj10+9Jk8qWD89XLCMjpRRq8diJMKENSLdZfcrBlFdb7K8GmTpQELwGqYDffWwFZYhAq4fGyUL7PTBjO3JGGdxFgwXo1D4TcLTT/KM=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	6:+we2Zi3hKDbkXO9ZDrMKOyjgdB9zaxYLWVfHZAvBSxjK02dCSFsLc+v265oNTah/lWTe6fFOPIKma+IOfg0/T7l7aUzfMi3Zw5TNYtexzjCNW2nYSjYW4ojCtr+wqGIU4OntN2//zuY+DHlIs/NrYYq+R3RMiARN7amKg/Q7VCok6o0FqTpj338cznAlUA0vk1T284GsytiFwcJYdqYghyDfolRsLt9rLUZvJFvAdN21HHSjvYh+0IU99KLWxl8piQhHXz6i210UEGQCvokGseIywevKg+T+xyZXmzX9srBwgmyKKYU60HCinJMHSlRg1FXIlUio+ZVzZRfwXA3XH4ZHBG6kKTp2D9i2slGzaKldqH0PKQouyO/gNVSYK6Qb5KOVHjakNXkrpJHYtx/7nA1A7PwwVNaOfmPw3wwlMKOeWp5zSUw1xc2oq/6RBA+QUaqNZxWDXVmF+XYiwZoQug==;
	5:3hxPOUoo3aShs9gOSqzcPbsd9oYCcgkKaeaHRzH8D3RJz8DxlbRnYsFSpacCod6+fZJoh1d2/2lwEEmHr8w7tudvYU/HpTlhA9T63akQo8ybJmwSa9k9ykKRGECp3awSpjXULmlYeEHfcSzEAACHF7VJDOvKtFVXCcizr/ng0tI=;
	7:0GyjnAr48id8FtEao9sAoBZxgYCY3/zEqCLEwE2V79YSu1tdhbMhM533VmNxPBRrEZ6kzmGSdG2LGpDuqRNLRUfjJaZnATmvQo4jEiMbZW1oVMSxLnbXZ1lYZBc092l+P2XBTV1zpeDLJhteeMXpyJxShD87WD62b5vPt/eqyFKxaDwPSo3qooQjUMgEtsbH2qJWm2p8TCNHRlQj1PzjWNbPNL6PkgVm2KCHIOqLCQvrzuUE7z332fLO3Igomojg
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2018 22:17:35.0126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c6ab1f-040e-4318-6415-08d6386c2b45
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4462
Cc: Diego Russo <Diego.Russo@arm.com>, Jeremy Johnson <Jeremy.Johnson@arm.com>,
	"aehs29@gmail.com" <aehs29@gmail.com>
Subject: Re: PATCH: Fixing python3-pyvenv and adding python3-venv
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
X-List-Received-Date: Mon, 22 Oct 2018 23:50:40 -0000
Content-Type: multipart/alternative;
	boundary="------------292BC47FFCFDF538AC8B8A3F"
Content-Language: en-US

--------------292BC47FFCFDF538AC8B8A3F
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hello Huges,


I cannot reply inline because you sent the patch as an attachment, 
please send it using git send-email next time.


Also, something doesnt add up here:



+    "pyvenv": {
+        "summary": "Allow you to create virtual environments so we can isolate our project dependencies. Deprecated in Python 3.6",
+        "rdepends": [
+            "core",
+            "venv"


This doesnt make sense, since you are saying that the python3-pyvenv package depends on python3-venv?, shouldnt they be the same package?
  

+        ],
+        "files": [
+            "${bindir}/pyvenv*"



Again, this should probably on one single package.




  +        ],
+        "cached": []
+    },
      "resource": {
          "summary": "Python resource control interface",
          "rdepends": [
@@ -1107,6 +1118,21 @@
              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
          ]




This is wrong because, cached files shouldnt be on rdepends.



Everything from there to the bottom is probably ok.

  },
+    "venv": {
+        "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories",
+        "rdepends": [
+            "compression",
+            "core",
+            "logging",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/venv"
+        ],
+        "cached": []
+    },
      "xml": {
          "summary": "Python basic XML support",
          "rdepends": [




Also, this patch is missing the changes to the python3 recipe file where 
the python3-pyvenv package was being previously created, if were now 
doing it through the manifest, then we dont need it in the recipe.


Thanks!


Alejandro




On 10/22/2018 11:48 AM, Hugues Kamba wrote:
>
> Dear All,
>
>
> As it currently is, python3-pyvenv is broken because it is missing the 
> venv module run-time dependency.
>
>
> The patch I am submitting is to add the venv module dependency to 
> python3-pyvenv.
>
> The dependency has been added using the newly added venv package 
> (python3-venv).
>
> The python3-venv package has been added for future proofing since 
> pyvenv has been deprecated in Python 3.6 and creation of virtual 
> environment is done using the venv module directly (i.e python3 -m 
> venv my_venv).
>
>
> Regards,
>
>
> Hugues Kamba
>
> IMPORTANT NOTICE: The contents of this email and any attachments are 
> confidential and may also be privileged. If you are not the intended 
> recipient, please notify the sender immediately and do not disclose 
> the contents to any other person, use it for any purpose, or store or 
> copy the information in any medium. Thank you.
>

--------------292BC47FFCFDF538AC8B8A3F
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello Huges,</p>
    <p><br>
    </p>
    <p>I cannot reply inline because you sent the patch as an
      attachment, please send it using git send-email next time.</p>
    <p><br>
    </p>
    <p>Also, something doesnt add up here:</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <pre class="moz-quote-pre" wrap="">+    "pyvenv": {
+        "summary": "Allow you to create virtual environments so we can isolate our project dependencies. Deprecated in Python 3.6",
+        "rdepends": [
+            "core",
+            "venv"


This doesnt make sense, since you are saying that the python3-pyvenv package depends on python3-venv?, shouldnt they be the same package?
 

+        ],
+        "files": [
+            "${bindir}/pyvenv*"



Again, this should probably on one single package.




 +        ],
+        "cached": []
+    },
     "resource": {
         "summary": "Python resource control interface",
         "rdepends": [
@@ -1107,6 +1118,21 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ]




This is wrong because, cached files shouldnt be on rdepends.



Everything from there to the bottom is probably ok.

 },
+    "venv": {
+        "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories",
+        "rdepends": [
+            "compression",
+            "core",
+            "logging",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/venv"
+        ],
+        "cached": []
+    },
     "xml": {
         "summary": "Python basic XML support",
         "rdepends": [</pre>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Also, this patch is missing the changes to the python3 recipe
      file where the python3-pyvenv package was being previously
      created, if were now doing it through the manifest, then we dont
      need it in the recipe.</p>
    <p><br>
    </p>
    <p>Thanks!</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/22/2018 11:48 AM, Hugues Kamba
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>
      <div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt;
        color:rgb(0,0,0);
        font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
        Color Emoji&quot;,&quot;Segoe UI
        Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
        Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
        <p style="margin-top:0; margin-bottom:0">Dear All,</p>
        <p style="margin-top:0; margin-bottom:0"><br>
        </p>
        <p style="margin-top:0; margin-bottom:0">As it currently is,
          python3-pyvenv is broken because it is missing the venv module
          run-time dependency.</p>
        <p style="margin-top:0; margin-bottom:0"><br>
        </p>
        <p style="margin-top:0; margin-bottom:0">The patch I am
          submitting is to add the venv module dependency to
          python3-pyvenv. </p>
        <p style="margin-top:0; margin-bottom:0">The dependency has
          been <span style="font-size:12pt">added </span><span
            style="font-size:12pt">using the newly added venv package
            (python3-venv).</span></p>
        <p style="margin-top:0; margin-bottom:0"><span
            style="font-size:12pt">The python3-venv package has been
            added for future proofing since pyvenv has been deprecated
            in Python 3.6 and creation of virtual environment is done
            using the venv module directly (i.e python3 -m venv
            my_venv).</span></p>
        <p style="margin-top:0; margin-bottom:0"><span
            style="font-size:12pt"><br>
          </span></p>
        <p style="margin-top:0; margin-bottom:0"><span
            style="font-size:12pt">Regards,</span></p>
        <p style="margin-top:0; margin-bottom:0"><span
            style="font-size:12pt"><br>
          </span></p>
        <p style="margin-top:0; margin-bottom:0"><span
            style="font-size:12pt">Hugues Kamba</span></p>
        <div id="Signature">
          <div id="divtagdefaultwrapper" dir="ltr" style="">
            <p style="color:rgb(0,0,0);
              font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:12pt">
            </p>
          </div>
        </div>
      </div>
      IMPORTANT NOTICE: The contents of this email and any attachments
      are confidential and may also be privileged. If you are not the
      intended recipient, please notify the sender immediately and do
      not disclose the contents to any other person, use it for any
      purpose, or store or copy the information in any medium. Thank
      you.
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
  </body>
</html>

--------------292BC47FFCFDF538AC8B8A3F--
