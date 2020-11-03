Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.4228.1604411097976912745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=pB3bqEG/;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.165.212, mailfrom: nate.karstens@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A3Df74M026728
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Nov 2020 07:44:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pps1; bh=0RBD7nWMNF5qfSzYyqnQPugNQBnddcSLKzqfvri4Xk0=;
 b=pB3bqEG/kT8qarYLsSEjlvJgg7/wjlotZhwSIHt2J9Pjp1n9eX8y0q+mFRoP7TVDYl+h
 0SEDq0HyKQY65lqKWWwNOJhGFpgdCDm/qghrA3AP+vbDihdtyxKkd7YO2tv1tRJlBuN3
 oFLdddFJgyMYyVNsjzz9+yWjeeFVG0DW9tdiCgggQaMYTlEo0frrDthSk9aaxfJAP+mQ
 IaupvnXGucNfZws71qbNIRXP/OCf1g3qFdWQ0/q5F+6RJsJibiZi/Vl6Rh4PgndqnqPl
 e2KRr7gJvE7tafBvrc6FxguOI81hGE28Qi3DbU9GwqOM4hjhYL1kFsS+iUgH0ttkDjbU 5w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-000eb902.pphosted.com with ESMTP id 34h5a53v96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 07:44:57 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOWZXjJFC9mdfKQclmK15Im/ncrksE44RjklCgAAA9Wl8bm/T4b1wixA3v7b1CyEvZgjxisWGK1SiIvPPBgTwGa+zNfEG6pOB2OHn8NyMbugLz9XjEJ5U1H0gjeVALSR4OpxJgxCh5W7WwEz0fcQgFpVUUUiZBlLRYS67S+9jrEf4S5PuG7U0v2jqBKBbdSxkXNXeH9WNw0LR5mYG7A9x41M1rS9YtiKbykk1sAlF0D2XNnklnvIbw0Too+Vaiw0EhpiFKcT0XmT3yfORaClK8vUYvZkCcWod+6X/20MWDnqzGzfVprKLJFG87YB/nsSCVwvrD2LENvJXOcg4VOJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RBD7nWMNF5qfSzYyqnQPugNQBnddcSLKzqfvri4Xk0=;
 b=MEQ4fnO2mnKxBbNs1Jnn/OCDSm8aWu57BZd3WFjrnyg29pPhW5UdRFtMJlTLIJcF7+F3KQ+YOaF0nWWE4zSxFnROD1HXw2/8gAQaBEItlay/o+9QaXoZmDkUoqERWC3LmuzM81BF+nog0mdFqsHEaryz6Dd6DHgJhQQ8DmM08C/R8+bIKhxsGbjgjupDk1EhM7LfL1FgehjXgOncT/2m2h8O3MwGBUGHDtTB8mM1erePjeXEbzwnAHErSqAWkgJucv8zzI+CxV5/QLY/La0bF8G3frN2d9WqIC1OqdnBsLl6ZMg73D0koS8w5GCkCLIWxS3yzyxKKtW+FpHTPfYDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RBD7nWMNF5qfSzYyqnQPugNQBnddcSLKzqfvri4Xk0=;
 b=DNrinxW1SNf4PjCT7lky9QGl5Ebv+dGXJVSNI9W2r4lTBIPKBZaMahi6CyjjOOAIPp/XMtFAvf1KtBUGVDIUSd2pZ9k9zwoHIX7e/cw58QLGs4s5VyUni9a4/6N7KFre4uXTzpchjCIasGlF3ke4Yuh2hs73q4RWMjVJ1GwH/l75wBTNJ2xFOVtcaCUmzt7AFuFt9f1xGyhkmJTke9GV/iYEeBa9Tjuz9AOJbO5kC8OIUY+0QkX7hy/roiTSZ7MlnJoY3DfjhWAGmHmyOro1Djdy4eTZJ3RB0hvHp+bD0vVLGn10dN/t+2tQDdT/Y6XFsV/zXBgyI/EhcRaHwNqwKg==
Received: from DM6PR02CA0120.namprd02.prod.outlook.com (2603:10b6:5:1b4::22)
 by DM5PR04MB0621.namprd04.prod.outlook.com (2603:10b6:3:f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 13:44:55 +0000
Received: from DM6NAM10FT067.eop-nam10.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::4a) by DM6PR02CA0120.outlook.office365.com
 (2603:10b6:5:1b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 13:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 DM6NAM10FT067.mail.protection.outlook.com (10.13.152.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.17 via Frontend Transport; Tue, 3 Nov 2020 13:44:54 +0000
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 3 Nov 2020 07:44:49 -0600
Received: from ola-d01c000-vm.ad.garmin.com (10.5.84.15) by
 OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 3 Nov 2020 07:44:52 -0600
From: nate.karstens@garmin.com
To: <openembedded-core@lists.openembedded.org>
Subject: Re: openssl: Do not create /etc/ssl/certs
Date: Tue, 3 Nov 2020 07:44:10 -0600
Message-ID: <20201103134411.118217-1-nate.karstens@garmin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-ClientProxiedBy: OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) To
 OLAWPA-EXMB7.ad.garmin.com (10.5.144.21)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20831687-a88b-42bb-adbc-08d87ffea56b
X-MS-TrafficTypeDiagnostic: DM5PR04MB0621:
X-Microsoft-Antispam-PRVS: 
	<DM5PR04MB0621099AB2D8891DA6B9AA279C110@DM5PR04MB0621.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3FwlQXOtUNrqTFhcnctiLH3qWnt9IECNcmjPrf1Odb2WCjMmtArOhbUIXD7/jYyczM1lCzyBxN5V+1iKI/INrNiJteDlLi12BOUmzuVKy3ud6LdvyEYsMHh7ioGOGZiIxAWRjrDVD106LtKevLFxGaEpf2u6xGKhPu2on18kvv6+i9uVl+M6aPbPpC7/U9dgVdW1OG8KOEn3CKem7oKBLRd3kHj3KyE4JZdqzvqlq0MoHk2A3P2Dfdrm9brEGU9zd5EppuMb47Uol8vLIzQkjt8D51Vhl/Oq3y7z0N7kIcrQfCo1Sw9Wia5p4cjHtPDo4eZWOBpjZDcsFs2/QQ03VNB7Xmf+yjDI+fXxYiNkPqQ4aQpYSeIGbn4hS8g/G/NL3dalcyuqLPOWMz7wviF33VjX1q5B0evgpjqDnL6LmUlZCfwvmBfGJP0nxQNKVMtOQCijSOy/ndK2VCX0Jvad7sy9Ri3bdJNipE++e9ZOkqY=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(39860400002)(396003)(136003)(376002)(346002)(46966005)(70586007)(316002)(8676002)(1076003)(2906002)(558084003)(26005)(44832011)(6916009)(86362001)(7696005)(82740400003)(356005)(7636003)(70206006)(478600001)(47076004)(83730400003)(426003)(6666004)(336012)(8936002)(5660300002)(966005)(2616005)(82310400003)(36756003)(186003);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 13:44:54.4984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20831687-a88b-42bb-adbc-08d87ffea56b
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM10FT067.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0621
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_08:2020-11-03,2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=402 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

See https://lists.openembedded.org/g/openembedded-core/topic/77917492#144026

Tested with core-image-sato build using OpenSSL 1.1.1g.

