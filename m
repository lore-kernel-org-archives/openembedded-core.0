Return-Path: <mkelly@xevo.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0071.outbound.protection.outlook.com [104.47.36.71])
	by mail.openembedded.org (Postfix) with ESMTP id EB1ED700F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 00:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YUEJo3OxlEN5PZ7JR0yt0Wc21HI2e9irkbwFuUzr/Zg=;
	b=bXn5sSXNO8bvY6q+qQmq15s+exWKsocbraLjibEewBY+4Rp8dviqdeodOd+Z5JWJZuK56alqBNQh1OmcIQQBtV9HD93OmWQRo+WiVlTKTJUviyVbaQoxHVTFXaKbRlQzsMe8p+H0eBC/MuFQPr3unJaGs8AfjmnM1b1TV0G3qzg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Tue, 18 Jul 2017 00:22:37 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 17:21:29 -0700
Message-Id: <20170718002129.8704-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR12CA0018.namprd12.prod.outlook.com (10.172.32.156) To
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68966839-c369-42f0-1322-08d4cd73182b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:ZHy9ds9CTvDdkee+JhrY7o3TUlRxcd0kUlDQEXxcMvnv4nM3N/p6w/qhVznV5PkVLj+qmT324AznRs2Ztxb9Agmjm9UTL+fYmcax3pgvsMbxO2Nx8K85+jeGuSlG3S8moOfV5CdJHYhxJX00IAyC7zcj6j5esnJDnPmHS29BKiiE1J1ZNosF7C1BYMOou1kwEIE7u8xsRKWC1PunqWlRgmU2xrYtC2KIaqXRgi9FIxCZLWebtvdIvCFyCO3nuCaazvqPXJLAtaHcF0lpQSr6CKEXXvd2IT+uhYueo7x5kfam+1cElPESB5Px/9Q5CByKDsYFDlvGIFKxal6EW8dmOkYp/uUFi4PQZlXzwitX+5171zLlWJhnyie84dqM8KXig4GAxm0RPYIl7qUWCuvsHMPkKf87+Zij+7tCieB7xxp+UoZyQkcVEh8Yt+qlQzTxYfiRWDGfMEsHEIpcqminGjIhnd0D7zlRMU9icyp9Jq4UWE9vJqTAQ+l1U44cAofSKllcCFjVAXsAXvXi3EZKqkvdrr9UxRl06fCGXQr1ropZ+A9lh8608s7aDUzOyJmow2LrYmlP4ZZDQtpcp7F17+Ly1h4el1kyV4Ak6+mpS8sA7q+lwlVDQSOPMtZJG6jmGVYfHr9Di/D7Aw0Vya0B8TMggPkEKC5xclyqKQGm7weKdeG6xQELY5Y+dUli5GnobtKPyS1OdTfQygkAuLRvKP4LfWIZfdL8PVVtRXXMr4Q=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	25:gYjDgiMDSsS+1Ttro8F6gQS+n7GPnyNbENHv3IOtDnJWmC8Pv6lamPCfb2xMS/kxIkaF0TYmAG23I4cSIRrYQab8r8NadziOxCX3G/hpD+ItshMGCqxbMfg0NA1Kk7p3M1Uh2dstMMDrWP4zv4OWROX+GS8q57iah256qfYNML4VJ+SryYRJWTg5GUEE7j1KeYfILEW/fmOtznrJKOILaj7TVG7SAWSrhMkQrxLzCn/ieYW+DwC3DJEVqZYECcPI+9VJZX8RYfHwCEm3MUm/hGJLME1DrjNjEkc7MtlPqpXEXT6JlNWakPiAbW1IIdCVMYdt1HfAVf+GV8mClDoQ6EKrb4zgcOHqn8p6/QhvKLctdtKDclfjai/2jkzIg9nP/fKWOjNDVQ09dUuPgHFeIWxQGD/zoowECMLsm19UUvRdnMrhdpPCJgvXcGcLt5FysAj3CMfjbYh3CW1zurp+bU15pH4C9Q3PJ9DJnrlWnHEcmHgfMB6UfbJojhccHwr+0sYven/mct56D0MJ8mtdVg0NrnTRMVGM6UlqDOvySBxNa6iTcbY/nXSft0i3EnKQVNa9XKSNQpCB6s9KFQAFp8JJKq6eXI7u6xdZ3nZD2pLpvemUe14JMDuEMiogBC3AiCtodwaS8wGXpsVHCfz7QmY+F23C0xB2diUwvrGrqc3opBujq2hDv67W3pGa/VPXR1dzpq3QwVnXFAUCNjDZVOmbSl69Gy52pDoU/ck5WQYvfNmi3W/VJCfobXNTT/hv1wEbbzdMQj+qJ1dHNAtQVKZ+lH99lL2celxlmoktUjlLQy64V/Cz8wFTlAsoyjcT8NMmhMZ0UYcffYVdaEt0RxHsRqvdlpwxNSsvJvX2XrgxfzVaX1RWsvSCVRgnG5TrhJcM9PyvwTIvJNtDtn04ifvV8cf1PqAJ2E67sRbjryA=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	31:dicixZMNl3ylpBTVWU7OkqEJQfNuphlFeLvxC+aZaIRqXGhbkFXzfhg+zsjdmSvTAunsWeU9+pUXAF87uhYCSreJ0HznhyLB5JsHboLD0/DnZF93CwGF6CUVfjzFLbIfNaMUmwQ2OaPsqrHD4HHH+5rOu9ywnkM7QxIp5FAdJVo0v10Xq7ZI9M86Z3sjLvQqXDUFMb+oGMfAJ08uQcKFGA14EFStIO1QFts+QLJsPhJgefFJ5ln3gA5ccW5Bpw+8J/8lC3sf72QaSkDn8wTeBHDB21XM/lEHS6lSQxjAPCPMz7hwkpOAsyErwggDgKv1dicLtseh6fKXypIRl156WUh3aZNwCn9qDNEP/NQNY8DuXI4hrlNCM9aQscsYczAdLIhGI0IMtYUy0dEdFevsLJxIuYM/krvOxAIRU0mGz4lwLzLNLz6XUtHD7rqYTQaevdo8wR8gJTPCB6e6g8Np5UKCaGIMnki8wer5jmU6GBeuB5jlFPVMsLGgJufI825LGW1VYxVJK7JLvysbTwA6Lx4JrLxGv2QYjNrWtN/k4JV5ln64PiW68qRhy1CrGxUg7Is/eMVempI7qQPpLF7ofH8lmLQmtJ4DBoVXAz/FN+ynOJlWJhYXhTzoCoYZ5UfclriWMgdHDdKEETaHsXD/UzPWZniI0mFuQr4DVypn3OvPRerCA3HG5OP+1IfG64BFzQqlxaNQJG7kuJFdP4xAdQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:5H8e5GbnSXSeZxwDpuFO8re5NCwG4yXt/3vpboFN72aqNupKQUgp4gcth/UcQhDw0YuaPoEMGaIItXL/DNkhiP/eULcf5VJkblNF+xXJeVJXXhzW210/jW6StFay8TT7Y2/U0ops239cx/rMiIj1AdX+dR0Rs8qCnwqOqQcWwuRMaPq/oxYC9sX5XSMkdQU7bRm/ZJcXmzUO8b9WYoMLiIh4kncAuHBABFDfjmMIeFF74v/1gidEZAaoywka+vNYkEX8+BkXnHi6M9Ig+U7OImFskghQFYdzDZ9lffEVVZNBGJ9uBv9APkWsRLuAChKYc83t+D0SQXPCDhb6mpKsFbzFRw69Xm59EL56GAkFhb+0x9+QLdJDK7ijygDcVHK0XXY2DWzY7HKn5j4JLJHjexYbTofFrXG/WTd+lHTaZyI=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(148574349560750);
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293343F4200B9322441ECB60ABA10@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(2017060910075)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6041248)(201703131423075)(201703061421075)(20161123558100)(20161123555025)(20161123562025)(20161123560025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2933;
	4:frmEHAqhZg/+/pqZj/hq43WPA9L8Bp0XIdhtuDRL?=
	=?us-ascii?Q?UHiAqPy/EojNB0GeB3c7lmlzlzdBfBZLWLUcBUwrQ0JpXB5x73H7fmdTnp9U?=
	=?us-ascii?Q?LAaatzB416jFg5MWH0Nob5ddVVt/olPlQ+BIPLHY+rhJCQFXMzCrGhtKNvue?=
	=?us-ascii?Q?3XwEq/CURncaA7m55toyfvCFN43rg9PI/84Y3ZcKaovcCi12AaxpDPUPa21C?=
	=?us-ascii?Q?/5qRjeHg7JmwKrdcQDSK8n2gJDlxWHWCH0vILNBVPZij7YrW7Rie2RFyQkbT?=
	=?us-ascii?Q?iYs26sPiA7shuf0ZF710W8tLzNR17gEz/sLMTxUI7VCTB65NkMzZEz3Smw1Y?=
	=?us-ascii?Q?psIfUvXeH/yKVoAhDJEXXp042yZ7Gu9wfoKz1Tom1mw+54qHHf/mCzEvzaao?=
	=?us-ascii?Q?0vdzPObyFsf3s9F7/BP5bMzfTTBfKTPWZ2nMiUayUtfbXjk8WbpxRX+2rEag?=
	=?us-ascii?Q?Zu1JBmHNU0DPpD6w66Qm/d6/sF8QGFC4vf9UUwJhrJEbPLF43IIvCsSbgbJS?=
	=?us-ascii?Q?K3zutbNvIdtgKG8+y/i5i178nvvgDShFMh8KiDaLI08htilQiqyVX3Gk374S?=
	=?us-ascii?Q?0CSkhymJHknc6eqvBkY9ZFXsnOYdMcUjgGBGHPFRSMWCso2KdYUp2gCyeFO0?=
	=?us-ascii?Q?Ni01gzBMHYdv/xC1Nz4Cl+yIv2qjxNIavzF1s37j6OHbtq/T0l0I1yEbVuLG?=
	=?us-ascii?Q?A2GUuHig8d9XnZHlVofUVDCX1Jtu3FOacR4KcmbiqzrwPlULyN8n04MzXZYo?=
	=?us-ascii?Q?sCsyWYJ+KnJ0Y531f7PHxxSrbDo57Wxcuv7erpRP98Rn55ExCyys5FHH02me?=
	=?us-ascii?Q?vGRXaGJgf5bVL8b1T5bIzXUfHoyBqau9xNC+RfCMyo+pX2Rutzb4io1PKX2b?=
	=?us-ascii?Q?coEkol6aOmlRs7zZ4MVjHb4hGC1Mw5P0uruTxEUGl0ZQ1CJTCNFwPWqmQUvr?=
	=?us-ascii?Q?YOlW2XrxRirt1jIRHDQ+ELORfLnyATGeGAYM27CMLWmwib54jz5+wwWLB0se?=
	=?us-ascii?Q?m6FVDn9gIbPpZPx4elGSn6aGqtGDXpVup01IMhQEFbXgn/4dlVYTkf/wHlrc?=
	=?us-ascii?Q?SxY9EKcNBelFyh6m/a41XbOw8HzneEoYqWyjq1xLdWVTwtXpTtT3VTnNjzle?=
	=?us-ascii?Q?Cuw25cEzuibuYArUCgW+4CPyIaAwfSUC9gH6HOH3tnJh3tFTWVQtUA=3D=3D?=
X-Forefront-PRVS: 037291602B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(7370300001)(4630300001)(6009001)(39400400002)(39450400003)(36756003)(38730400002)(110136004)(107886003)(189998001)(6306002)(2351001)(5660300001)(966005)(53936002)(508600001)(7350300001)(305945005)(5003940100001)(7736002)(50986999)(6666003)(6916009)(53416004)(42186005)(25786009)(6512007)(2906002)(54906002)(2361001)(1076002)(81166006)(66066001)(33646002)(47776003)(6486002)(4326008)(86362001)(575784001)(50466002)(3846002)(48376002)(6506006)(6116002)(50226002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2933;
	23:rky4RCgIoZdFRQMif7s23M1y/82maIgA2Wm5XeJ?=
	=?us-ascii?Q?NAejv72eh/VRQnCKqqcrUz4nrBXbHezHEnC+BarruOTbOAGshZI8FEKZlAK2?=
	=?us-ascii?Q?DytgiRPnfDCEXlnnK4D0mXHeYQQU89AUO5sNVf9XKR+Q16oUxFUGLekgnXId?=
	=?us-ascii?Q?7euTT+ti7IryB3My5RUedoWTEfuNmEpHeHt9joCZ+4DCT46dKLJXjlzwat/S?=
	=?us-ascii?Q?mgE0+S5ZldOyHRGFVhdAH9R4xiwxlwkXhaQjEzbfVSPDpU5wSBL8R/1MN7kT?=
	=?us-ascii?Q?b1v71EGgUNCLePSdE58dVctSBjZJbTxtjasdqP3xFuKR43Z/vaw8Ksapcffr?=
	=?us-ascii?Q?kw87Y6a8nrxyb/uqFcDiVD7VFyH6kKJpseZA1xGdoMM0C2V93n2bEZAjDfrR?=
	=?us-ascii?Q?6BXS9ZowXmhn/f8yP/bT+fULqbsgJ29Hp2UIcF7b7I30GY3sFPW82ZgDukFK?=
	=?us-ascii?Q?VxRWQXzOk1mHt2QceNHlj6zeYpZO40nY+MMJf3TlHXrKZODxZNzo2ZmO4gdS?=
	=?us-ascii?Q?MpVJG9sO7/QyQVW0ZDcxN1hq0kHGG/IVj6TSumqnnL1kdjQeT90ed9GWdxoq?=
	=?us-ascii?Q?xC1ROGdlkLmEsBKxEUWRURUTCxbo2xMUsTCQeIPJPbIknDavWXMtdeEOzH8/?=
	=?us-ascii?Q?Ij4G6B9jc6QoW7/0VFndXUEG1O55UCLd5E5/uUK+t9vRbN5bLw1Has8DeBVg?=
	=?us-ascii?Q?b8CmdRarFYMa22s/hxFXoa02+dd0eJVkIphyPMnrqJhEV60l5U8COG0SFwyE?=
	=?us-ascii?Q?01lvjfnqRak+XZ1IT6+UKyaiCZFlRnDK2PNmu7iu3T2opUPhKkgMxAObTBHc?=
	=?us-ascii?Q?hB9lp8nd3MxGQPT4q2Qj05nmU8VKArSg+FXd3DBDwFw/FPAIEoOdoF8KF/iF?=
	=?us-ascii?Q?Tv/BYP9BSC6ZFfH5bLIqkjjzPGWgmMXdPEVLpShVAatXoongS4lF8kKRLpdU?=
	=?us-ascii?Q?700XTLkoA/ewF0Pcxq3tLa/siUA2xAlEf590ngmKdjbL2Bo2CJKao4WptxCH?=
	=?us-ascii?Q?GoZmUZI50PxYVzeW2amfYwQ3erJk7qFfZCKggUdexR5vbfKU8fwiV0UtrUlX?=
	=?us-ascii?Q?kKYOywcZXc5XnYvo1LZf1YTV6ci8U4G6dlThybG36nKIQj8aJCrQHTtFlbpY?=
	=?us-ascii?Q?JFCTKKXPVcLy3Nzlkr3fRKBxRfm+1MV+U?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2933;
	6:8WHuH/1CplOtLn7+K3SGUudVJvVT+RWi77hmj6Et?=
	=?us-ascii?Q?T4wHS73bE2zr+X/q5Fdls20OsppFnHPyZr32tZd1S6feElC+D4sPSYvdV65q?=
	=?us-ascii?Q?QoRtcPifrXyZPW1Ysmb9guKgt2OFkZ/gU6djnnRrG8j2F0S1NmwPMoooEYAh?=
	=?us-ascii?Q?F+MZNyoauZ3zLotg0S7x2J1vtU8xXylFrCcjTC9itpdBvcfRHPC5+Q1pieqp?=
	=?us-ascii?Q?CfhfA3iKGGWs8yOBDPTTJgBMthr+YOQXQ1tiC3oYlaI889TfKNaQya7sW61Y?=
	=?us-ascii?Q?FV9TiulKcUm9DSg8JMRPvpn/NcWsVYphHwrbsXoDd11FTG9FXMlQDoAvW85m?=
	=?us-ascii?Q?FJZRVt9K6CB6pC8RN0fV2Zm7pAwHtDYloZzEQ7MBFaGv5dokAPLPPPKBYgKt?=
	=?us-ascii?Q?uC1By3iq0Op0HpmgLSa/Fyg5HJ1Kh/RQvJ4/vLI4sRH2amAKUyfMZCBGpEht?=
	=?us-ascii?Q?mQl/uxkMSlxWJ0UG825SMftFFsaT+emGSM1Nea1BSo4TGPaSPjkl6+pU7fb0?=
	=?us-ascii?Q?x15jqKRvz+fBYMFgYEMEMuR/z7989KJbygGCrvMgr6wUdR2v0msslqCjdFRS?=
	=?us-ascii?Q?kpCt4hgr8xhJrm6hOlWJMkfiIXIbMMoljIiCI4iuW54v8/mAETcT9Fb1H7H5?=
	=?us-ascii?Q?RcFXVGMXfEVzDgpwbmfHzDD4jRKo+9/D3e2dEXMcmv8q67r7xly7quca9cgV?=
	=?us-ascii?Q?sf/4Tjln+Ok+/JywQZLHXOt35kd+YHesENOVlVORLQ039sOtwmiufxb9MBVQ?=
	=?us-ascii?Q?0gk9PeVzG1IUqvg0QCQ6JXixm6HR2X+KnYTsxTmxtRXJr6oWOYm/h+WzpNui?=
	=?us-ascii?Q?oW+9u/4/qTtMcmr2hYw2upghnYI3gxu3QVILUxigx7XPTyw4VT234o3ZhwvL?=
	=?us-ascii?Q?KsKdhyjN0dJJttdZ7QwvPxfXMZSHe3tEfqyJNK7bzHMuIbfGMDc2mQmydF1E?=
	=?us-ascii?Q?nyjd4fsvlyzWDDSTM9L7a2garQ9YN8sOB+qVnrytbrsCdv7Ava+kXPs/z1z5?=
	=?us-ascii?Q?fE4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	5:JGWozLmB3ukQzU6wLQDJN+1vNlppEINEie8ei17s2wfrbU+4PKnN+MublmkcFguAieuGFGfHC9cQr4IF8Sl0ppKc9T0uDTJXDL4onLlAzYyRENoAuxoP3KdCn1NWhHRDGEgFoVzOaOyNxtRbvEraWC2HZeNv+Ox/qzZ6eUYQyJ/By5pVQEiT+EseOi2uyuohB7fl/VOmOAIcD4cWkt2A6C5Av/Uz0GAzDTGRrwzXy53YaZsCkSg+muukKEPaDZ9eczjvTALFZncCSvmI53OLATT4DXENACsthWhfeyrJx2BAeU4fuuAX6YI34DUi4kZ6yZtYSmmJKBtTEOS+gTojVWaoAzB6OjpmaEFQ3dS5OLd5sfvi/s4Q4hl1JE+TG3EUyOPdChlDIVvRMgqP+NLrNL9PlLXalZy/a26KGAq4j0KLZayzKE9UONNw1iRDwsmWeXtRjVtSgxaN5eQEcd6//lU6cXK6ZLP6nXERrhg+vTmzqLkPOWcmFDU2yvnWhRhb;
	24:Vc1KJN+1QB87eAljEGdzso6vnPfZCA1ElkklTAOAWne0LD3PxJH9/BV/wJG1RwWGymoAipEqXfHETKhiR+ajD2IbhFmYSNDguhcK3ucZ6JU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	7:vMFQX8+FrXt08ipk/pHmWGnCEPzpJ9D+B0MAJehQMkwXqsooMdk1Ghmi8kb7cKNlV/DvCyRYX5DNmNwJFCDS531EcI9D4V3cqObH8/mlV/xZ9p4crFkui5KPb1XOlsM3ZY+LJHf3eBtd1b+vbBf/A0BI0F3j8XsbCS7ScC+hYeK+KsYrfg/E0leRPD2pqsJ0HVRXnTKTCAf3nJuVUSxnMGggPwN8gjqcuYRHDBneJS9pXE15QZs9VzeWJQKNSdfkDDWPphkrtUx0h7MltBvxNEFYHh+yfkO9NYf9gB7ru8GkEW4nuj/hZh5PwhitpLQPPcjyHnICVtqkiCxLqh64gRNvmIgY4uUsy6uJdfQpzfHhVgFSF6AgOMYgWsD0Im4C1b/tcIBstguaasXHzZqtkwHgyUZej7G8Oo0EziHRGZt03bfOI0dV3ZGjdi4gksuCrqwmmMc1lWLIrw6er+mWIv8CJCH8sGsrZ1w8ySDQCAHL/vGOgpvhOjaWz8APbXoTwYz1ko0J9RzMXruYSXI+Puk2mYkN1zi7RNmWCLgyiSsgtb4g3xqCaCKs4F8f5sXZrevvhDusC7UkAWqpr+Q/DYn62poH+P7dpzob+54PjaXsfKd97DRhjr1Xi2FStEsKOA8q//4CoAfYdjMGWVtjPT56Pi+nbW4qzhC9TRzEJqq1n8XGsY3MCpH76EsW7fxOBKhhFoNIIg4DK24GW6P6wamw5H3I/RRg53OfWNwWdqmdUpTUNn+3clXqXzMeJ9w2dNxfFvKe8lOefICWPCrpR0+JMWEwj09gAnMPxTA4LIM=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2017 00:22:37.3099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Subject: [PATCH] gstreamer1.0-python: add new recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 00:22:38 -0000
Content-Type: text/plain

Previously, we had a gst-python recipe, but it supported only GStreamer
0.1. After GStreamer switched the Python bindings to use GObject
introspection, we were no longer able to build the bindings, and they
were dropped in this patch:

https://patchwork.openembedded.org/patch/93793/

However, at this point, we have a gobject-introspection class, so we can
use the bindings again, this time with GStreamer 1.0.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../gstreamer/gstreamer1.0-python.inc              | 35 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-python_1.10.4.bb        |  7 +++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
new file mode 100644
index 0000000000..3299b89daa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
@@ -0,0 +1,35 @@
+SUMMARY = "Python bindings for GStreamer 1.0"
+HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
+SECTION = "multimedia"
+LICENSE = "LGPLv2"
+
+DEPENDS = "gstreamer1.0 python3-pygobject"
+RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
+
+PNREAL = "gst-python"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+
+S = "${WORKDIR}/${PNREAL}-${PV}"
+
+inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
+
+do_install_append() {
+    # gstpythonplugin hardcodes the location of the libpython from the build
+    # workspace and then fails at runtime. We can override it using
+    # --with-libpython-dir=${libdir}, but it still fails because it looks for a
+    # symlinked library ending in .so instead of the actually library with
+    # LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use the path
+    # we want, it will break again if the library version ever changes. We need
+    # to think about the best way of handling this and possibly consult
+    # upstream.
+    #
+    # Note that this particular find line is taken from the Debian packaging for
+    # gst-python1.0.
+    find "${D}" \
+        -name '*.pyc' -o \
+        -name '*.pyo' -o \
+        -name '*.la' -o \
+        -name 'libgstpythonplugin*' \
+        -delete
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
new file mode 100644
index 0000000000..1365f7c6dd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
@@ -0,0 +1,7 @@
+require gstreamer1.0-python.inc
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI[md5sum] = "adcdb74f713e28d0b22a0a1e4f831573"
+SRC_URI[sha256sum] = "59508174b8bc86c05290aa9a7c5d480ac556a6f36306ddbc1d0eacf4f7868212"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
-- 
2.11.0


