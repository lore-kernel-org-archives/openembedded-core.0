Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0062.outbound.protection.outlook.com [104.47.34.62])
	by mail.openembedded.org (Postfix) with ESMTP id 4C53F71C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:09:50 +0000 (UTC)
Received: from BLUPR0301CA0026.namprd03.prod.outlook.com (10.162.113.164) by
	BLUPR03MB167.namprd03.prod.outlook.com (10.255.212.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 14:09:51 +0000
Received: from BN1BFFO11FD031.protection.gbl (2a01:111:f400:7c10::1:114) by
	BLUPR0301CA0026.outlook.office365.com (2a01:111:e400:5259::36) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Tue, 23 May 2017 14:09:51 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD031.mail.protection.outlook.com (10.58.144.94) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 14:09:50 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4NE9YgX029059; Tue, 23 May 2017 07:09:48 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 22:08:07 +0800
Message-ID: <1495548488-12280-6-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400221909049842;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39840400002)(39400400002)(39410400002)(39850400002)(39860400002)(39380400002)(39450400003)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(2906002)(53936002)(230783001)(2351001)(104016004)(85426001)(106466001)(498600001)(8656002)(33646002)(105606002)(305945005)(47776003)(50466002)(5003940100001)(50226002)(48376002)(86362001)(575784001)(8936002)(38730400002)(77096006)(81166006)(4326008)(189998001)(110136004)(5660300001)(356003)(50986999)(54906002)(76176999)(8676002)(6306002)(6916009)(2950100002)(6666003)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB167;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD031;
	1:ULQhC9f9G32UbvU7bsoixIuAFfjI2II7cRkAf9tNWVjbNyeDkxPW5YkgEgM0yBA+XJW71ndNtahzg9Bhqisw6uITCp5xfaWqNn3nSNwJ1bnvGL/Hz43fPRPWSUdw0/w3rbAkgb0R7+2gZmCtgonfRmrhQoGkz+OBoXB8UIOHFrtJO4LRXP8OiLZugUUVYDq/6tqqUu8c/YLYX1Y+7TiDWmo2C8ylesGVJA2rhw3RO1/Le6smL51nfP/jlZG3DJSs/igQ0Gu7vtuEtp+eUUoZlev21ywcRWiJEpSVMYoyXhnPD2lNc0NRKiOoc/FOmcGwjVypIRYRMqGOEHA11VhvRZlwrMt96D2eEwo8E3aVZpW9qamgIWzK5SRg0u3K4StB1/SJAelCoj+bAncXutIkude9ejnsmLXa91ddrhYugiPJwBswvQLcW8/x9279sbRkse45gH5uwPFv+hIv6pgCxRGUlnQL8y8/Ne410vgFfCIuYNNxOPdbcYHgQ8m97zEKwaEIdjNmQhuBhlSr51iXuPYuyIgr6nUePsSIEhqNSCcLdnDIO/IMD9pPH8XZAskdKwaiRdPnJryj6LuSn+0CCMHjHVCRs3DPifYn0XKVLik1A+ucbGCbkHzIdDhfUcN+csQT2m7aXnVCEC2eXVQge4OWFwTCTz9O4C7wcmCimk31UeOkIeOrcsEVghnmeOL8zlLTVvs+NQuzX+mfnHZJrU7c8E9qFtariuUJhkezU7KT68fbeJi97KKGQDY0EwO37FLplDqVC1ynVbTb+ill1A==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLUPR03MB167:
X-MS-Office365-Filtering-Correlation-Id: 57d1e164-844d-4c07-8092-08d4a1e560c0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BLUPR03MB167; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB167;
	3:Mdkq5jHLN8kAiT63fpOGO97bjA5TVW3YsaegTWMLtwrsJJ9mbzULHebvkbgkHg9Sk1EfJRJ1Uw//NkCzQCA3WbW1jofkx+nCAJxm0PxutbChjPLWQmTTc7FLUKC2j7z1aydCkoueoV4pvF5Hyi0ebbxVeCiApJbKeH+Xc+NejZWQRfjP4tOeh1+tdwiKXWjjm2ZhKkfwUowqkoRxn2DS8mG+xPWb7rxMWibzhpWASfStnjQ7vplhyxzXgHOXkplaZiXNIQSaMfyCdrVSSTzH7NQ4gYeeljDXZTvbVSQkbqdHJG/fHn3eWmyQG5B8J7dXFY4nXEjljEeCLz83EJopb2Eu8MMv+RZQdW2RIH1W+XiRrT2yQRylk4z+P1QzOROuiWS1Btks+yx387tMp0Z/Km8ypHok0cTCUew61vkCrzSGqbkUIn2EPuxqXKvJw/2t;
	25:TiheCU4RAlK12rCVpKXQo+nSDr4s0KtGR7qiqLY2tpgFETGhhFmr14kjNrkrU212nRvbgIey5/x9xTjw3uLI1fKeoDAdwAszDhWqNjfT9sj50v+JImpLPpsUD4kWx625DFJZi5S4uC8ymPsSNqX2SoCZQjPmjzPw9ENRYDUdRcLupnOlHgWBrDlpbkJKlVJChZQVbho6/0Ki+ETMkY2oVK9IweP4izeP1NjQruHPVBCxuAjmYjs9c4vZgaeXXjS0ErRTV/3q/qGFSUz5e7dov23PmC5pfhG3TROGnAJADeIgy4UpB78IrPMQYjxIN1DWzGw9Mn5PCjcnH/HPyJxBqpQak64CbrIYWvDN5VSvGY8Sa9PyITr0rTq2bpwXX5v1iJVj81WUnLTWo7VMIutQZObOT56hwmuYW17ScS2PIHWu9b04bTi5hKww4Dfs3pc1h9dLy+20oA/B+Zy+1JTHZgOyBj18ue+52jSBz9ziBaI=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB167;
	31:ZOnHAateTkgQ679EU+hO3Cuty31j5u5nGk1Kp9rgp8ijTmbwXCoKnbi9LpBZmUeFZzxo8whglC/3mzEF+b6/yu3HDqBTRiiwbcaCqTjj/uVA/BtwP8fSV0Z4fvcP1V2p0DhTbcT2RqC/mgqrZHpT+GZKO/nkzKpasBlmIwe4+4Bq1UF8qFaRcHRrgcmu6g3Fmz7LpnGdDTZ8C9yyTB+Dk05c39az7IrjdZ+uqvmMzTNdMCL8EOs/pVxsgmtFFav0
X-Microsoft-Antispam-PRVS: <BLUPR03MB1679CBDC4778589035873CCE9F90@BLUPR03MB167.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13024025)(13023025)(13018025)(8121501046)(5005006)(13017025)(13015025)(10201501046)(3002001)(93006095)(93001095)(6055026)(6096035)(20161123559100)(20161123556025)(20161123565025)(20161123563025)(20161123561025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153);
	SRVR:BLUPR03MB167; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB167; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB167;
	4:4CDtrXA/ySru4pQ5sFixprsl94kC6fYNKLcEdksWtWz?=
	=?us-ascii?Q?6Jz1AVAb2WLLs+Zq+HuiBxlb2ZfqxuUtcxHs5E/7RWOFM6YiNIXcXDsyv0CM?=
	=?us-ascii?Q?z2+8iHR6i5BAZzo8jQ0iAP6zyWu+jtHBGC+ysq13iohL29OKBEaAdubDZfIU?=
	=?us-ascii?Q?Kyo06WJ4iLcKTIEJu1vlzedgCIT2vGV6E8mJK8vVOSYncEiffgiQ3wYJhwS9?=
	=?us-ascii?Q?pJgdtHfspbXIEhTN6gkvhui9sC8teriu7jZcWpJBpyFRPTGdA3MQ2cyOImMT?=
	=?us-ascii?Q?+7reH8hd7UC5OvYpm94bF5GCjTVv08AX/ff91qRkqXuKqCvmBuBq8kwu3mhl?=
	=?us-ascii?Q?ldyp7HBAOzxdPcy2Lo+nor+uVak3vRCeAaPqs6o7+kaNhtBZFx11cvLlLO0T?=
	=?us-ascii?Q?3s2tUMAReI2BhGxel5uZHz/jkzu+cqow/o2Kwih3afdSgBos5WEenX6h3sOH?=
	=?us-ascii?Q?9XNhNuAIRdk67RTE89nbUQiwQ/Abon4XOapHZJcduilPunL1CuQCcYVzQYiB?=
	=?us-ascii?Q?woJH3LBFHGrj78QNuAujQ4Eqc+Ucq6/WsJONTpPoGRjiAhOYDyj35Hsx+5zL?=
	=?us-ascii?Q?G2kw5wB2DS6R3UBRqzFLEchmG7FNvUs21z+vQd2EbfyzGZWz49IWLJOKhbxU?=
	=?us-ascii?Q?xcec2tQ2GK5cZ4lzHPPOe2T76xU9SiKnPL0JNSKzX8RAwBrtUvkSmOJ2Q0F0?=
	=?us-ascii?Q?rsSmpFJnNSDFpv0mG0NMG/KoJyP8yk5Xj8FJVOLyrqJfpwWRu7hJXFUz0EdX?=
	=?us-ascii?Q?0QVLkL+qw/VPNwfBMrCnlDA7/BTQuL2eIAWkJZN5pOsyt4+R5cNeOImyljm2?=
	=?us-ascii?Q?2FbEkZF5bw63ufGzxm/l46IZmCu+Yyv0Dtvpsw9LwdoAosv4EeEnOg93sO2N?=
	=?us-ascii?Q?AqFI1n3hRo5rZcj2cjat2QRkkfsHZY2VsUqFSBcm+5r3HdQJdbNticyjsMQI?=
	=?us-ascii?Q?QBx1U79qxA5wj/+hn+2sPhYOMfvswOhCfZYouTw=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB167;
	23:eyd5WBLXvbD2l/BRXtJfuF4PQoza7af7omF24H+IpQ?=
	=?us-ascii?Q?vm+ge3LC0J1Ehp4FxUS1H7hoF6CWlcxCAGpVeEgUQCyOTc9cSdTL3YHDg2zu?=
	=?us-ascii?Q?zGa94p+H90kawhbWdT67OXRFekSwrK5MTFOs0JIip8nHl+FvTyUoM4Jslizd?=
	=?us-ascii?Q?5oyC/pb28lZwATJ26HPcyIxpRbB1QuUPynudGxWiHpWrEcn6ufShKrSBNP7W?=
	=?us-ascii?Q?dB2uXHO1IS4NAPQZpYtu8rBih7Yn2YZF2lChANq0jBlCIOVOcI/Tx1nQGX42?=
	=?us-ascii?Q?LPycuY2gGva9q6zmJa0+g5sEhXAi+rbRuYl5TxBtpOO5Mlp5ZvYYYi3bf5SP?=
	=?us-ascii?Q?Hc0S9kv+PbZfYnYecOPLca1bdYISi/3awSTsCyX7+hRzOmtzEbLhSW2vTUqe?=
	=?us-ascii?Q?NdFb56tcdvd2swfqdaOdLAVCPAndDJDb1js7XD3TntMYY5G9TpPn/jLrv7L9?=
	=?us-ascii?Q?Gvo+i/P0J9kOyPKNhtvYPxtCaTUloBZgRxZrd6CsQkquRpyLj1xNUKEizNLM?=
	=?us-ascii?Q?z+Pqcphkc+YCZ5VMzW1H4zaSonCrBlzrPi3pHRPpOzX0hWy2E+jPj9fzaIap?=
	=?us-ascii?Q?7k/T89MaHPnM6+7abf4coOzcJbiPQur+eTHMEDsk4B+ttNVT3YmRAxY4ge2T?=
	=?us-ascii?Q?xpQc3hyd1odlNU98W4d0wfNXklouUklR04dZfuCJRmrviFBbP81dELREOsf0?=
	=?us-ascii?Q?ZQWiL2xiUjUFbBKmMCfFsh+bAr526aP36P50TElotvsG6ifqwxpkdaMA/DEh?=
	=?us-ascii?Q?LuIFlhjp0kzCdnu+n8d38dtOlciCwBLItACqFluyw1Vc+mA4gNqwxzoCM9eh?=
	=?us-ascii?Q?nOfNo4y1tGw5I2kkN0GFoF9di7wNnsQVl/YDpxjWDsmnPWnRDeqQVEdNeAMp?=
	=?us-ascii?Q?E+FdkSNbfqlb3UT7Xbn4+TrbJPTkUaf/mO6Xt08T1Tk1GJrSu/UnzJ+IqvjR?=
	=?us-ascii?Q?UOcpIPsWPCEDEX30hrlZR/qyZRLykrpsdL/kwj7bWsiP/Z8QSiFuSsNtB7B6?=
	=?us-ascii?Q?ABvT7IxIPI8xEJ8F9wpAENzuIoP1RNo0hTiQ0TzzI6KekEO9l5C/lRxEwQE3?=
	=?us-ascii?Q?C/nneCFmeRNy3K15uaEKVtMQbJhkzM/4fwpS7WgjoJv3pbe1geXxAPEYK4kd?=
	=?us-ascii?Q?L355xdb6+5wo1JSPea8l0ekgWdKJU/XcbhrGut1C3evds4UDQXJ/AVwWz2b7?=
	=?us-ascii?Q?LDwdAT6mUSOduwfWkC1r9yajTAYQqeIcOIZ1UaNWuQZ6pvlk78t36RXDtLPz?=
	=?us-ascii?Q?V4/Yttb6Koxxj3Z46Uthq4i89LuFV1L3u3UBAZWIgVOPvjL6ktM2W17tAjSN?=
	=?us-ascii?Q?hHsjw3svVr1l6QCqLXDmk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB167;
	6:IilYFJvpfRRwKBCoQSHTrvbheZZFmLwzLazgSQRt35GMWcBmifH3yCnKRNfF/tc2Pdrxb74nm2GL53vW4ShMIaAn3BwnlPDDzX5gRr4LxAbq/drbgyCMTBPxXROeyM0ogqfYtvME/yEzFBj3Qlv/E0UxYL61TPMk4GHaACaoTTr3buqLYOH0OeQdawo3hr0NTusrwJ19YCzzwuChwRj36L1v8okJOfdbQTSuDxNkaJmK6mRiI55sY4Nky9j+yHinE+8qIPkciUxsq4Yl6MXoWVKPV2MOc0hX0jRESJ1XsFVpeQ25SoziRhbgkegbrWxG+Qfr8sWhvmsQQnbhAAhqC0eyL5HY2XWhZBVC4MK8qG/bciX4lrSWVU6s3xRfIwwXRHdxeYiNgSTvNwmj5//Qyvz7hjOdK3p5/XznZmvgnozjuYIvzhhkdLI+snBr8DKtLaPYCvXIQBfMZ0KIXczLtRv9cFSCzKxCXYoKyu1QCSjo1WFAVl8/1OTF0CXLoKzlrTZ9mFdRItoRiRmt8/zPzg==;
	5:tP7NcPS2DuOqvKsP8/oXai2g78t8WcwhKi/y4MyJ5b28u8dbYz8wttIvmNduw7OLoiAlYlbBjV8OlY0tf2WPrqsNbGtBYpva8Qi3WNTs2GXYGtS1ddOhdAw8tc+FyEjf8nnUGyHegjiZl/kooqnHGCWnImGovX0XCo27RG356K3xlrGuU26BWxzZE76Wokg0;
	24:Ia49npaWd5WheVwx+DzDXPMlC6HVaBKTUbzRKRFMxjp0k5gyvimYGcY0z0HOAME0hFl2lWaCXdrybtmWnwPopGGMMWXxQKTsmzhTUdb6oYo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB167;
	7:8e7HFrCjNK/S/8qyeXHE0Q8svo577uPRrzkD0LezvqyH9KkkqPXnpSdK7sbiF8jEwPdHFEmxDoSvTopbQvJLQgmEJ/W61cu1SBGcpXsjGrP1GQC8/Sdma6hvfaIGFxbij9mCrQgV0c5rdG1XPxuqiTYmasB9ghWz38zYo3Po1gOsAEdIsS8C+32zILvkzYZKYMXg9QeDWLAecv0tKYuA6feOz1ztKjlq3eYTfUy3j031+3m/MNVWPopIML4+j7qQWq3km4WKk0bHbd+mJGjBbiBYk/MUxXaekkZrPYFSD//wWzdp5axkERytVgTL2X1rwa7+ZBaHq7eNgDFBZNsN8w==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 14:09:50.7177 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB167
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [pyro][PATCH 5/6] gstreamer1.0-plugins-bad: Fix gst-player failed to load external subtitle uri
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
X-List-Received-Date: Tue, 23 May 2017 14:09:51 -0000
Content-Type: text/plain

gst_player_set_uri_internal shouldn't free suburi which maybe set
by user to load external subtitle before start play. It just need
reset playbin's subutri property to NULL no matter if there was a
previous one or not.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...fix-gst-player-failed-to-load-external-su.patch | 50 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
new file mode 100755
index 0000000..0d42243
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
@@ -0,0 +1,50 @@
+From a085090ec68efccd4d82c7cf4ea6f18fb475c4d8 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Thu, 2 Mar 2017 14:36:56 +0800
+Subject: [PATCH] gst-player: fix gst-player failed to load external subtitle
+ uri
+
+gst_player_set_uri_internal shouldn't free suburi which maybe set
+by user to load external subtitle before start play. It just need
+reset playbin's subutri property to NULL no matter if there was a
+previous one or not.
+
+Upstream-Status: Backport[1.11.3]
+https://bugzilla.gnome.org/show_bug.cgi?id=779453
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ gst-libs/gst/player/gstplayer.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/gst-libs/gst/player/gstplayer.c b/gst-libs/gst/player/gstplayer.c
+index fc5463a..3757a09 100644
+--- a/gst-libs/gst/player/gstplayer.c
++++ b/gst-libs/gst/player/gstplayer.c
+@@ -582,12 +582,7 @@ gst_player_set_uri_internal (gpointer user_data)
+         (GDestroyNotify) uri_loaded_signal_data_free);
+   }
+ 
+-  /* if have suburi from previous playback then free it */
+-  if (self->suburi) {
+-    g_free (self->suburi);
+-    self->suburi = NULL;
+-    g_object_set (self->playbin, "suburi", NULL, NULL);
+-  }
++  g_object_set (self->playbin, "suburi", NULL, NULL);
+ 
+   g_mutex_unlock (&self->lock);
+ 
+@@ -667,6 +662,9 @@ gst_player_set_property (GObject * object, guint prop_id,
+       g_free (self->redirect_uri);
+       self->redirect_uri = NULL;
+ 
++      g_free (self->suburi);
++      self->suburi = NULL;
++
+       self->uri = g_value_dup_string (value);
+       GST_DEBUG_OBJECT (self, "Set uri=%s", self->uri);
+       g_mutex_unlock (&self->lock);
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 82cd91c..91e1a51 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
     file://0004-player-Add-get-track-number-media-info-API.patch \
     file://0005-player-Add-overlayvideorenderer-video-sink.patch \
+    file://0006-gst-player-fix-gst-player-failed-to-load-external-su.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


