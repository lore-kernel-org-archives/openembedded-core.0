Return-Path: <danc@opengear.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	by mail.openembedded.org (Postfix) with ESMTP id 096617FD89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=PfUaHx3efMkfDXWJIrkMAbKR2YF5AQuEKJmDqYK/T/FZ3FlqYfIIZo2IJ/QOg2r1hpsTU3hZeBTW92r8YPZoAaULh94FxOGoTwmV3y00Q8DUcAIZ/wc4b9lGh2MvpkVti9ZlcoSVqM3rpd8kuD+2H2xb0Zvt7QOuNWE518LeTFlMsqV951r3QQxXtLqUJ1np7oFv1Q6KsjOq/5U+xssZZZP8djscZ3u8Cp2naaJg+bMoLGqn4zFeCfDrcyTIFjm2RQ0ZvUg2UiLE9N6+KycvwkAIZZedfr+DWZSc0F9oA1cOJRfg6rIXBnGCHEIxbY1B3sifT4L8do85B7G08aQXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eGNTq9uRBkKvT2OLDQkd8GLb2bmZgtoJra6VolXg4wg=;
	b=nAClbnPii0pCnJ2cI0ymkGa+CUMGpZw2wN8/kJHuK5gXQrBWcgwVtyEtHdn+scS3pEC/PI899XV3D52mCNKl4VUSSllAAp13Wqe7G1/CkE0WWeNMRr8e2fPTXMcNyEbpE6ADw1lzmlsliM8mCg/0EfRsIw3VOsGxpF9ea1uoSfeyh2lCnQYGk+heuL8qvH2cEnBUjBGScpb4d3vui3XFD+yzPUweDmDgUmyABQl0l3jOivGa3ylrKUKQK7K2K4ZICf7D8PPMk8p30OXw0hiqfljgynLQzTkxmu16VmprP1QpNFx9/KGirYYZdQQT+CjHc+a186ZEMlop1Bln1AeniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=linuxfoundation.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eGNTq9uRBkKvT2OLDQkd8GLb2bmZgtoJra6VolXg4wg=;
	b=X8oooWNamd56OSz1Y9bXnj9ya3VMLLQOihPMllgNRMgDtFlj36CL3A0mNOX3NcBtPabF5Ewgp4R6csUgvI+gVW9Pg3iEp/yvg48RuwWuQhTeE+XnKT/4+49P2TtC7xVbj8u6X99oItlVucBlsUwYqiuUKPHYl44pd+QFw4yeUuU=
Received: from DM5PR15CA0030.namprd15.prod.outlook.com (2603:10b6:4:4b::16) by
	BYAPR15MB2822.namprd15.prod.outlook.com (2603:10b6:a03:15b::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18;
	Tue, 21 Jan 2020 00:19:42 +0000
Received: from SN1NAM04FT006.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::205) by DM5PR15CA0030.outlook.office365.com
	(2603:10b6:4:4b::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19 via
	Frontend Transport; Tue, 21 Jan 2020 00:19:41 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; linuxfoundation.org; dkim=none (message not
	signed) header.d=none;linuxfoundation.org; dmarc=pass action=none
	header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
	60.241.24.90 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT006.mail.protection.outlook.com (10.152.88.166) with
	Microsoft SMTP Server id 15.20.2644.19 via Frontend Transport;
	Tue, 21 Jan 2020 00:19:41 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 722B3DEBA6;
	Tue, 21 Jan 2020 10:19:39 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 531C842945E4; Tue, 21 Jan 2020 10:19:39 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-reply-to: <193655c483d8c4cab252878fe9c857bd8d609187.camel@linuxfoundation.org>
References: <20200120234818.13068-1-dan.callaghan@opengear.com>
	<193655c483d8c4cab252878fe9c857bd8d609187.camel@linuxfoundation.org>
Date: Tue, 21 Jan 2020 10:19:39 +1000
Message-Id: <1579565909-sup-7035@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:; CTRY:AU; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(396003)(39840400004)(346002)(136003)(189003)(199004)(70206006)(478600001)(356004)(70586007)(8676002)(6266002)(44832011)(5660300002)(7636002)(26005)(246002)(36906005)(426003)(8936002)(186003)(4326008)(4744005)(6916009)(316002)(2906002)(42186006)(336012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR15MB2822;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f10f70f-9cd1-4203-5357-08d79e079bf7
X-MS-TrafficTypeDiagnostic: BYAPR15MB2822:
X-Microsoft-Antispam-PRVS: <BYAPR15MB2822BA73DD3BC1A9D4384D31B80D0@BYAPR15MB2822.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0289B6431E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwKTXVbXymQqJe296k4d5ge/qaxb7IhfM5299+F8EhEdfvKJZR20qydNkLx4u4fy+U0G/Dr4lUCTDQ/7FkTpRJpyQC+Yy/Sm6OFKUG0tMT2DoFzXODDIuU1UoUT7zozWZ7EcXhq5HqxhEeg39aHOZ8cSC0kPfkTv/XX35AujQyZfSWynGjRxqk6Eix8TyCcZ1jxGVxwafKMQzi383F6GVEq2XDyE88QZQbohgw/ZFPVZHuibgyAjydK9aFV5NnqII0jdiqUWdNPhTqZ7VNFcGc/CRNNLpDFKyRq7JcxZgGhKvLO9d8RtsbkhdlVuG1innbXwphdq8sVOIdvCH5XcFl5MqoBAR171LA0NDrVdIo42kIJv17O9w81D/ZxTEjeNBCQDFWoCTyEE3vvwFptA9yxCnxXHsKh5xrj7ZWWDUsyP3AADhgQBGbZ59ijl8ltTAWejujY4LYT1P1zhb/xR7WHFuHtbSmt5ZU2bGF6blyF7cAUyYA/QvOPm6DgTnFQs3Y8vF30i5pxB8zm08GtxkA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2020 00:19:41.0838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f10f70f-9cd1-4203-5357-08d79e079bf7
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2822
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: add PACKAGECONFIG for xz (lzma) compression support
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
X-List-Received-Date: Tue, 21 Jan 2020 00:19:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Excerpts from Richard Purdie's message of 2020-01-21 00:04:53 +00:00:
> Is there an extra DEPENDS needed when enabling this?

Oops, yes it should really pull in xz. I missed this because xz is 
already a transitive dependency through something else. Will post a new 
patch.

-- 
Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

