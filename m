Return-Path: <chunrong.guo@nxp.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0090.outbound.protection.outlook.com [104.47.38.90])
	by mail.openembedded.org (Postfix) with ESMTP id 29A6171AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=v6WTJs1ZzuRfjCoLzcDQo8Ur/24Pb99Qwe7kfDWda7M=;
	b=DwFD1JKa7cazIc7F5HDRk961vLkzKtD8N8z7VSopm0CLJ/SYcPdIscRGYbF7OILxcunbr6TUuB7ENpLTWwL5U4SB37bU1rH9DILCmFcEOsUfg/9tf4GWlw5NCpam03sBxGXyHEi0rQ/a3LjRr1JliCi7tUbXQv2ZKfqZSgGwlcU=
Received: from BLUPR0301CA0006.namprd03.prod.outlook.com (10.162.113.144) by
	BLUPR03MB375.namprd03.prod.outlook.com (10.141.75.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11; Wed, 10 May 2017 08:47:23 +0000
Received: from BL2FFO11FD014.protection.gbl (2a01:111:f400:7c09::164) by
	BLUPR0301CA0006.outlook.office365.com (2a01:111:e400:5259::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16 via
	Frontend Transport; Wed, 10 May 2017 08:47:23 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD014.mail.protection.outlook.com (10.173.160.222) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1047.9 via Frontend Transport; Wed, 10 May 2017 08:47:23 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4A8lKCZ017702; Wed, 10 May 2017 01:47:21 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 May 2017 16:47:11 +0800
Message-ID: <1494406033-28833-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39850400002)(39860400002)(39400400002)(39840400002)(39450400003)(39410400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(5660300001)(105606002)(106466001)(2351001)(189998001)(8656002)(54906002)(6666003)(42882006)(6916009)(104016004)(77096006)(50986999)(38730400002)(107886003)(110136004)(53936002)(5003940100001)(356003)(47776003)(36756003)(8936002)(81166006)(50466002)(8676002)(48376002)(508600001)(50226002)(305945005)(4326008)(2906002)(85426001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB375;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD014;
	1:wl8rmTL9mTASQztE+Z/lm1jjkE1RGT1Mkv0ZKQsmMhOmwjemBO01q+jbGOhHFKkP4yhFgd9RhV7rvMvb1E+x+t8Dt+Van6yGN4NkMrbi84hMx3zhNuJUgHkI7u5/UqmNRyMYnFu4JJCQojaSFfPz00jfUkrDAjFZNrqxSXh+W07aS8sqJVb+D2+mu2YDSu1MjALqikEzXS1bptN3ThgeYkZUw/ZXUqETQMDMFGHncquuGBiVuMDzj+QiBTRU+L+WJpkMzFYV+hdXxNoqrpv9zZZDgaskDfvfAse5JsQzAqhgITQz3J3DiEkpu5AluDhJemrxlwJaDzbEVR/jBrez/htSHiW6sZxJlFoSQVNenBmdPdgNutOL0NBvwk0iFja3KGBkLuzwJQ2eXbEfSsrcmJFgHjIWEwfuBRU59//YrajaQbUgfdUBtZMrW+pLXTsskPeKAdi05GSF2PqyfT8x0C+WebOmuAvu1+QLL/Z+xaVZfRMNF1NvSVCXP/4/rPkuwJhen0bB1j0CK4d5EgQY4bLUhwOlTReCdpfVNC7+E0ZNAtEe473xXBcKng/i/Q4NWv+2HquVOG4rAX7xQcWoEQ==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec6ea974-b629-4ff0-7274-08d497812d69
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BLUPR03MB375; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	3:CGQeABC4AklxcnxDJ19peqlKZ6vegsSA3nCbq67G37hE7dVLfU7CSvKhdpMI3TDBj6RZ1g0QFPFsATpDWKH/QsWLM4/xzKe/am3jYfifRl3jyQ3f1eswY7VSYV069BR/cjqS9iJzYMsOgrkR9nkusOs34h3UTzyG7Cc3+maSoH956osR2nRtjDwSFD8uJEIK3ji4UmbyYARd43jk2dU72sUkkCshIOa+QLFf1Mz8WxMuzpiCJSe+u1SamaNffp03zgPsGIgeL4QguRoGQsOqNW5KJgTcNI9rBaZJ8WWvPIP0InBExrArBMFG0rzCU6gSo7mlfNWzrQ7yM3oxUjNUu9vyFnfjvz7N+2tATthTxlLJxVrTDrd+mBuO6L1SghRC36rxpBhbTd/C20+RszA4FN0ULeuJAg6+Pc3hSMti2VQwgVVyF8Y3t0pzcbEWkEubJf1wc2TL7wxftff7hnCzCCHx8v+FhhKFQKsMlEqd7Lf81IFu/mS//nMG8WW8TKFb
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	25:7KEdrDwKHpMe+xwtE5LX9E9NDd1iROoucRI8RGVkkqkcJVlgttZ7/RreEFlmyE1sYylArG2gtuwvRqcLSB5ijEtgqjCXCdNht+0K/Z+DTLrvDLJ4GwEsYHrF6O3ZefmBRGxGYL1IXfL2ReaAYgElXobU/kiZjFyZB7Zmj/YkjNVp+LvlYzrLEyEIkHW5H9LChy6Dgjat2rr/m9K7vg65Afnpbb9eHvwRFxJOs9qAePI+Gdquoj/+Z1X6mV4WncQi9Kp6gVmSXm1FyRctVeVBNDp14sdTxxfY/nh4wiLAY+SNRKQ14oOmRMejazYFvQYE/kwbFc24+pgqIgKiEDEvTQl3S00pp7aaz81QygfxBI15JTsdZikFUwH+FuoR8ourRObHJg77RZzAL3aNGe+ZUypWpKqsBC2GjcGC+dK63WFCp5I1wdA14S2AY8nFpRq+IhT3puxaC72QrXiWNkcb9w==;
	31:fyQJ8c4FP4xD17vREKGlgeibCf/amUxCcN9FJ+/aHRByJ8M8AKiQ1ptWREAnWZ5PFJbKyS5JsKgfruM54Ul52NSYicW3ko8xFKVXHBQB8EwtmL+5wSn6sm+WDTLnRbASoHkZfo7Os98+n9WNE/41SxDV/AF/sCxrR0HTSo5LHieWqk+f1D80MGNu73yDwjIIZoALIguGESLRqloispL6v/8i2iYseeLyWRrmq4W/KWqWqc93ItSYOXoiEmyKA5679iKBzE4pnKJv8sjjXvgf7w==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	20:VeqL+nU0r4CnEPmfIeSxR0WsoV/Uea1yUjZ938U4ICnfsDY7JHR2cEziqjbXq02lnhJVz0M2D4xVlQKxIaN/ZzEbudvY+JLBYcRMiDqbdNuEK2S3rqZOqV2szW3hQAgEREp8oTPrTs+6FwNgi+PdAmIjXsD5e7VfBm4CbjyYyEbrESiBVQtRYHKm469gSjjb/RKGrjRdkAjrt4k3uXwmU5r1DOBS8agNqfCHzjLDgKXCu8RlE17PACy5257Wwh0IlcD+Rgq4uBQkziT0uvIoOKAl1FEtnaIV2oDCbYAHxNcRhX2FI+OoyK4FQQlKNsqGA9/SRgtprRwA62bad/zmrHwRdKsxeNAJxxmJuhkcPcJfXef9W7ed3I/f5Ka4u9nbYFRBxZDiCt7qYDzxVl1IqYqCcbOnP5YwF8/HrZh+ekv3iGvUMymnNeViF0wxzGO8RpXZYsl/CLcutndG6TiLNFEpTMBG8Nt60wMe+70ZcsHklWkEUJf2tb4JWpNk1UYJjRpBclh4yCg19Swr0m1IbT2RkDvGZ9E/E2QKdSGSTUeOdDyGh/8ZfOX0Iu1KzgkX2UCK21Iykxev6S6fhTZUwuw65BtWwhRW2k8WZFahmIo=
X-Microsoft-Antispam-PRVS: <BLUPR03MB375683F298897627EA3E6B384EC0@BLUPR03MB375.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13023025)(13018025)(13024025)(8121501046)(5005006)(13017025)(13015025)(10201501046)(3002001)(93006095)(6055026)(6041248)(20161123558100)(20161123564025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123555025)(20161123562025)(20161123560025)(6072148);
	SRVR:BLUPR03MB375; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB375; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB375;
	4:7O8QdinJ2NaIrIMz+a3RdYlCFvEAX9MOSCfawG3dvDY?=
	=?us-ascii?Q?sz3ooRwEvbKw3s2TY1qpJNpbj942NgINZJ0CiZIUfNae3kavWYgsNtZtJmM0?=
	=?us-ascii?Q?tpzYSAwe+bC5C18P3dENUnfVOvTOH6Rqn4XvHAURFLDjh/o0QE9swRXKO5qO?=
	=?us-ascii?Q?G38wqJrHbOL8HRH0yymEBNvxRSkfd0PsLeQGzdcKNETwEWjw9bO1TYR3jrOW?=
	=?us-ascii?Q?gWY33AQ7zrWNYK+cPxq2UZGtOuawi4oMHtXvR8eA1Kfqcla+6Y3CuZgPGati?=
	=?us-ascii?Q?Vy0xRgYUUI+Ex1wxvpLwPPOU14kpt6I2vUx7chsRfW7EFyJlKNquXEdBCJlo?=
	=?us-ascii?Q?raVTR8a1DoSH5yZ47iQquUcRCfK0lbE+KkVhNohxiRxoDMtVa2oVF/YkwFb5?=
	=?us-ascii?Q?qZVmgF1bvtVy0VTYnmreAXE2cmmArixYGp5HEgMKexIupp0i0IrrClHAw7iV?=
	=?us-ascii?Q?plpYX6APQl6IBgcgWjXuWYKFl6JZBXmRAzULeEDQd8moyUKFD3adEMGWCPwE?=
	=?us-ascii?Q?Zqx68ldZvrwmjaA62oQneGLKqh1ri3oINGhZkzAndxUUHPo3UcQcRFqyrMay?=
	=?us-ascii?Q?ONhBsQ/NM7CPxF62MzRQp0dHZ9XsPg2m4fYxXj2BUwlKRTAqvW0WPjb4NcEV?=
	=?us-ascii?Q?76ohxKXlEgyt5gjOpCYPiYaRvvZP+EaRk5svzC4YxIFzkxyaf2K9gWV/3LJu?=
	=?us-ascii?Q?l/7ktCyBz2L2yzmPSFI+apQmknZ+OFjDM1Y3hwzAOwptnkLZuVHah1L7wwz7?=
	=?us-ascii?Q?HBRLAY2N4v/I0Z1I1D4vJQAYeFDmS0lLiSgpnwT+yD2x3DrYYMHn2F7BEFYc?=
	=?us-ascii?Q?oYsOJJyTEOrtbB0rYguLK/4+wT0ExnjK+aAiztXglbXJqFSGBmg9peiGLnjQ?=
	=?us-ascii?Q?OTBH1Da9FlMW8Fe6/nwvNZ33cbpEugdOBWSAkMtAdKNraRIRssbogBXHVJwN?=
	=?us-ascii?Q?U7A+Ebj0n6cwtcEgFmFUnyrV0sesEdS5NbdJyFQ=3D=3D?=
X-Forefront-PRVS: 03030B9493
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB375;
	23:qChQSzjo+EfjYOBlTtg+LigY0hghiR5OB43o9sLFSg?=
	=?us-ascii?Q?cM5qTL9YP/ooDzo/FKGQq6WQAIVJ//0mgW1JCXplss4eAzW1Sy3cfDcGDtrX?=
	=?us-ascii?Q?wDqzLwWWylBuM9BACNYMh0SC5Rna3cNgS9GtcLlUSxrRylIjZtorx7Hy0Xfl?=
	=?us-ascii?Q?Kd6utehQiz9iErgr2Z4r3RPeURdlH/LgrMQcL9sdL76GDTpJAasF6Z7ighyl?=
	=?us-ascii?Q?X2y0S1N/pMHbgn2GckJdLcTXohqlHIAArby+k/SvuHngUzvvpopfWMZbL/Ot?=
	=?us-ascii?Q?TYkkXNFjmrCPZQvwyvJKBIUMpkxTYT/69Nh3JAwTWTBxx/6J9GTgbepvjgai?=
	=?us-ascii?Q?GhUltPxeKmA5xG87Mem2kTXNIyjQEJaRMHabXhBY36rkTqAPDTwDQ8mGETS7?=
	=?us-ascii?Q?YDRW4dh8CYOCZ+k8gFAS45snl7A+PisNWQhrCmTOo4e4K4+YOkOMkt8e3L2O?=
	=?us-ascii?Q?6o98oYezE2meeAyxzH2RTSkwhMrhSnroIHM8eTbrh1bF+W0rp1fiKvpvi4eZ?=
	=?us-ascii?Q?H3GbqRnVhKw3MxpSNX95f61akonkF94U3RxyDNtGCB5iSrom85QyJNoXJoOV?=
	=?us-ascii?Q?Mxfl0fu+BvegauHgt2RzDJFiw9gx6hYItXrO4iL/eySEFe5iJfz3LElwLpGM?=
	=?us-ascii?Q?HYha1i/pYeuY0xeFMMoKzq4QEl8bM9Oi7r/uG4uybD0KNqZIJm1UlgZyue9w?=
	=?us-ascii?Q?N6ItJcO78xO6zmiaMjTdRRwhwWhZq+MFAFv/Z6plJtgSB5l2azE+DK3mOWju?=
	=?us-ascii?Q?YCcHulE6yzACa8JcfL5sNu+th8fojjUavRmJAJXLJU6EnhoP6on90XoBCR2b?=
	=?us-ascii?Q?0o2p8H40skREjYmyt+dxSN7LXKLPCE2lfu1PBa25adnU2kquvfWFmVsbtThu?=
	=?us-ascii?Q?JM/FY2DTcPeAkGVSQpxa2hfKObpNsA5K+t6zvjvYLU6AGDvMn28kDOhiygGZ?=
	=?us-ascii?Q?m0XpJHxVZLSDBJgiCGPSI4lRjeuVGqL43QSzXyH10SEobp+1GN5tAPKtJmnH?=
	=?us-ascii?Q?T7fdXEwhLSuqfgTqg8Qzfy6Zl2yXvgdpGA1UojnsH0Qrdgqjgw6nWXO4mEmW?=
	=?us-ascii?Q?eI09vwfG7eIJD78MLII5uHAsro5LGcfKorK5FjefSYIj68SI4JJyqLKD5snL?=
	=?us-ascii?Q?j0GsCR0Vy1ux2RKDdIBe5SNCDmEKmu?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	6:uGJOzNlu46O14TqfsZaosPKgxy90pvZijtqjwbIMfORuCd2q60UDYaEKrhOGaD8Mqx7c0s1U9HHzsgWDulNx+3k7p1LmcTgDSMvJjKmUZTj3NdJDj1IoQmLQztdcmDnxGRaNwTPgVXqtCqBiJLBTXv7sz7REzb1CTeaD21sVs0V0NqWcnYmKb0ODB0NTmTJe7f2HFSCdUWmNmtmWw3DOGZz6xPpn5G4ZBAZP+FtMn1lhhdV3891d4hspcgArLEC8wrMMR8Z1lgYsYcBo/gfxHl0MzunRLyr5Rh20WYyogrnb6rIHxi0qgBgczaUytFl72Quw8qktBSVZmNyYw3v5dfCOc7mTr9+VBpUzhdZsXTbthXS1nU4E3j/mdyEVFeOru48S2pgVw0ty50OG3QTdWBxKUkuEXrw7v8cI/BPRE4Pk6hitUciti8pN/7rDJoBc3dfYwvfnXQmKFc4H7oaTslqIaMQbqPIL6jGhLsma50DY5IJnNhQfTOCRCRAugKvRzmTq2OTHcAgxjZTYUUvbMtI0pUVV3837TKhBtl5CdnY=;
	5:jLDDaQ9YZ8ykjs8uTtoBf9mKRzcbVPuwUXbSPGcszo4YjxddLk6R6l6vuUxylOaL9H/DLqIVWoGZKPyLlfFIeTu9devvQYKz6hnjJ+lzWO79h7AmhQTBsZftlHVwb3To83TbGvkvpvef8fm2U6fzVg==;
	24:coplKHJSu8NJ7PMCGoboUc3sAnZRaLa6g7LigmuSfbkt6BXXnw4vWtt+zKpcjhjd9S8E/PSWTHu31a64CbC+P6bn2n9gmoaMdsmUomYNq8k=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	7:qT6gkYx53A2B34VBXHSeXCHyImw2LJL/EOkFy2a5V+auNuxRDWNgLXjWCwaAYONjttZqymcY7Fe/RfHxD6hocu4LDb5AzUb5QzfF6Wb+K2e9qSXLsBd4R5Up4tYdHnNm+98VLmwsmCCqRFATN7iCzLOXlKaUI7tjuTwo8sad6dlHROAiMMw+0oM+gqm/Gmnb5ec1u3JVj3nAs/0GA71ZkaBnFWvnE35CnDCWvJcy9Vs4TGKtnlTv6i/ywRoaNrsBg1bkOPbIjYS5HdzCkWT2DP3Jmwf0rZkSJP6xz7J3a+eMNG+w4JByk6v77Gg9F9u2YqtMA3io0vikb7cO6udR5w==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2017 08:47:23.2983 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB375
Cc: chunrong.guo@nxp.com
Subject: [PATCH 1/3] kernel-fitimage: Support ext2.gz filesystems
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
X-List-Received-Date: Wed, 10 May 2017 09:02:21 -0000
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
1.8.3.2


