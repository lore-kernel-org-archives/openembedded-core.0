Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0087.outbound.protection.outlook.com [104.47.34.87])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF10793B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 19:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1x4qm4bZnIE6WmnSvDcC5GI/HDuNpZujovVWC+gSr0Y=;
	b=buo5EfL5i8bk6kvU/7GU3PNMunOymcHD3MCx5YJlq1EgSlsAQgMnAA49TFIzQ9LUj/TpxE93pf+1hjQyxN/EkYBP8IXo04lB9nCND3s+EN+hxufFnlHHy1KKshjsiy4ykTXlXPIRCkPwFjV9M9NPYAqLIqVgZXut8p4ANLGKdn8=
Received: from SN4PR0201CA0067.namprd02.prod.outlook.com
	(2603:10b6:803:20::29) by BL0PR02MB4754.namprd02.prod.outlook.com
	(2603:10b6:208:5d::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1185.25;
	Thu, 4 Oct 2018 19:54:28 +0000
Received: from CY1NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by SN4PR0201CA0067.outlook.office365.com
	(2603:10b6:803:20::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1207.21 via
	Frontend Transport; Thu, 4 Oct 2018 19:54:27 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT026.mail.protection.outlook.com (10.152.75.157) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1207.19
	via Frontend Transport; Thu, 4 Oct 2018 19:54:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53399
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g89hb-0004FJ-0f; Thu, 04 Oct 2018 12:54:27 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g89hV-0005Nx-TU; Thu, 04 Oct 2018 12:54:21 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w94JsLdL023482; Thu, 4 Oct 2018 12:54:21 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g89hV-0005Nu-3m; Thu, 04 Oct 2018 12:54:21 -0700
To: Anuj Mittal <anuj.mittal@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181004050917.16006-1-anuj.mittal@intel.com>
	<20181004050917.16006-2-anuj.mittal@intel.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <ce9fd909-e46b-202c-cde8-5628ca87df9f@xilinx.com>
Date: Thu, 4 Oct 2018 12:54:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20181004050917.16006-2-anuj.mittal@intel.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(438002)(3190300001)(189003)(199004)(426003)(31686004)(63266004)(336012)(110136005)(446003)(65806001)(6306002)(65956001)(2616005)(64126003)(2486003)(478600001)(230700001)(356003)(11346002)(9786002)(486006)(23676004)(47776003)(476003)(67846002)(126002)(186003)(2906002)(76176011)(305945005)(36756003)(8936002)(5660300001)(14444005)(229853002)(26005)(50466002)(6246003)(106466001)(8676002)(31696002)(77096007)(106002)(316002)(58126008)(575784001)(81166006)(81156014)(53546011)(65826007)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4754; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT026;
	1:p1gtmwhktaXYTvN3/Cbv05SSvcx0/jV9su1IbEnFaWKr63n6VNIqo4vyBzVbkgfKBmcerY9uKYyVgCeWmsAznL8eqfkj4vgh2r4wYEf7jlm9F7MnkmKXp4zfM3BgPloJ
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eade404e-476b-4714-40e7-08d62a333132
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4754; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	3:y9/thn5nfw9BzfyXiuXTbDFmu8V403HAejLTAlsD9h/qSVrmNC4eQS2qjKzi5ealvWAn18hnMnl6D7w02WwgeS0BW0CmlmeOGFnpNQTH76hG16gwKzKtX3DCii9LGRgP0D4ChfKNyTgnf6bbuBcRX4ETB7stUOsyaDwGdBKiyemfVkV9dsgfXOuSFviiYNy5N7XKNCdesmmyVske9ZUhWmcN/zHIq+fZG1cj7EEo2Nl2T3LJL/thyTYo53lInO/OCfj48Dq0ywvh5PzPg8R8Oa3YIc1h98TMjKwQh/fLL2tunWOBfZgLRVE56rRYJ+O5KhNYFx/rFQXJ27n/1ODc7IukdSFloCu2nD7S7qYzHSU=;
	25:PVg/vkQuMB69/Ut7pcgnzf/SR280ThmC1UGRYmbsV67FWDhFFb18jslOB/DPaLwsNZNF+c6FmUgSLb1WvpN32YcKklvp3johwnHfNPaJ3xHRoknjsnClqh63YHpGHoegNib6rtADFXWF0vzpVPP9Vvdwra2Fzghsi0wsKAxoMBZqa2fV9MmZglU/x+0biUkBGSmChzbh+t262SjIS/cdhd33GlRxJjPaQCZZOR1m5Q+9vtTGj5s2LGbjW3MHXFI6+Q/z8k5cAepzjjk33gzNlHQ/+C+3FfUqZfKFcV5+o6gYDNw89hP6Ml1wp+ELIkLMMJlcr4Zu51PyqGlFGAtgpA==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4754:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	31:bV3f2fgGS+7hXZKRW+SZobR6snAh4ChVAlmhYs9XUo0I8IPqPyh0qarYWi597NN42qFP6yWf60pTPVHTsdVfdHOn9K2BJPyAGNjrR01McDmRmKOyWQL1fbmdHWaiZvByjv7U9VVPQ6xXfXobTiUT15eGdtaAhC82gUDnMdjKCY189gkUpHOjsC8XyaZQ4TVYrf/7uWA97sw9rP8fJwQ5946Kqn0mjdquNMv5tUWMIyQ=;
	20:fIgUYGRimlLyP3SHRbZxlfBpdXiVoNibyqc/Af5iOmMeKSSdSleUneUcWPaOi4t1VB3XOldDpwMojtRK0tycNxb4DMRkJE4e6gvBTNmLxsT+UUkJAQTGike5rQiJqeX4GlLhRqF/fxye7jXsp7T+40bVPX4PSWkWbc4SiKBHFfccTPrKjAqwxxnCakW54Az1stvZJFXqFpI7ZHm9qj41epVzCmxKAGFFkjxlzxmZ2ckFl8JFfgVrrTLx8546c6+BFnT+dsgnXPS8ZFLsxvzPf/T6VK/E7SaAVRbTzUhUsHZwcBDxuz4ybSdEMGlAk2rpCqVAiT16wZatJ84X2lpSZf2RYAUoflrSEAuMkEaYR+wTw6TRn2NbsbH0mykW39lYHpaqBlhVJKuYamPyYw1z/A8a93ZL6LpWCw3FGsyrVrYWfBe4VMVNnuQYTIWUP5tYXmP6quPmxLKpM/VzoPG2ANH5go/BknsWJ6u+hdEq9ZKiFeM8z6NbWi1Hlo/IxBt4
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB4754EBFD202D371A2E29F448ACEA0@BL0PR02MB4754.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3002001)(3231355)(944501410)(4982022)(52105095)(6055026)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051);
	SRVR:BL0PR02MB4754; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4754; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	4:HS3stCJrqQaRHmcaKJwdfLNpRxEoTuc91RYQt2bE0iZKAHS/+F9EntxmxW+SSXXY9rEKS8fdJw6rF81hWzd8xEe4/iqXpEeGESGtDlhh5BJE2x9/cNyXuHheCLqR5tWyG4q5A9nlY792FrcfNaB1KA3pKQMjuktOoNZVzlS6fl3z5U/0YNr8HAV6mfWY+VyocIarQ5EUDl76srpcZIKpkaQ3R82SKqJt/nVyvSbHgTPo9IFzhe/ek5XMLAobI7Y2M3siVvSdJMc/fnXZco5e5iFxcP36d7rCIU31PBWvD/ki0+zCPUS/khqF9V2QKbBG
X-Forefront-PRVS: 0815F8251E
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjAyTUI0NzU0OzIzOnFvQjRoWWpQQ2RGVk41RnhjeXBWbTZsQXVM?=
	=?utf-8?B?TWZiT01mT3Jybk11S0U3SmZNNTFoTkNteG93cTV2MXVkWG1xUlQvWFFRc20z?=
	=?utf-8?B?aUhyUStwU3JYYTRmRUJ2TlVHMjdWSXdiR0xNMThLT1BPK3VraU9EVnpIZmVq?=
	=?utf-8?B?K2dnSFhXcjdRenR6cml5ck9wVlJJK29tVytpTWFpNHpyMFRuMHhlS1gvZkJh?=
	=?utf-8?B?eHFzeTZvaEV3b3I1NU9hdkN4eXZoNkZIcTlXakFxK3gyRDMydFQyVEgwU0da?=
	=?utf-8?B?bmQwd0xqaWIxZ0xKNjlwalRENGZMTjA4SW5JVmhHTEthakxyeW9EWE9JSmJV?=
	=?utf-8?B?QnZ5eTZWbmQ0OWFwc1FJZWlBYWUxV2FpQUl4MTU2L1FGMWcrTzJhSThWaUZ1?=
	=?utf-8?B?bmErRVhYY3dJV1lFRGxweGFqd0sreVM3bEZnUlpnYVRtTG5vdXpaOFQzVFYx?=
	=?utf-8?B?SHRwOVk3aU8vc2E1ejBuVzVQdmFpZUlycDFuZEs1OTQvTmNZMTRhczM0ZTFE?=
	=?utf-8?B?dk5iRlV2OEd1UjdCV05wZlVpOUs3eVQ3TlJmeWt3QVNXbit6NzNNS3ZZVk5B?=
	=?utf-8?B?d2JvRzh3Ym1kS2kzbWdGakpzR3BxaHpmZHh0WW1kUjA2UWd3MUVwaFNSOEVM?=
	=?utf-8?B?NDFiSGdaRzBqdHBWejcxOGczYjExVmkvRHlUQ3Fmbld0V0d2R2FNWW0wTHlF?=
	=?utf-8?B?dlBORVFhQkxlbU91R0xjTVZSSldXQ0dIT0VwS0R6NFZEM3RNaW44c3lPVmZY?=
	=?utf-8?B?cHhhZGxjc0ZTVFRwRFZGMExHNlMrNVpma09XaCtDaEpVUWdrMGlMQXNsV1dC?=
	=?utf-8?B?N3hMMmt3elVYUWUrR3ZUdnM3U2IyOTVFSW1FZTRPNjViZWh0R2ZOSFBKUmFY?=
	=?utf-8?B?V29vY0V2NmM5T2I2OGxjVjRJWEVvRVowTzl1TE1QQmlHTDQ5cUdRaTBOV1Fz?=
	=?utf-8?B?NFNJVCtlNmpJV0VzeWJhT3hUVUpmUnpYNml0NGZHelZmZ0hmSGY2QkRwbnNK?=
	=?utf-8?B?QXNadUgzUGhzcHJuWnVMbVZSRnNoTzBnWVUrY243cmJUQkpOVHlMcGlGdkVx?=
	=?utf-8?B?V29CRTA3V1h1RnNsTUg4RHdPbUFGdXFMdlg0T0hPbG4xRjdtQnpXcXFuVlBh?=
	=?utf-8?B?R3plUllDb2phNytGMnBJdHQvUUJIVFNaZ1ZhRWN4NHFjNWpFVndpdktzWEh3?=
	=?utf-8?B?dE9YSVVUOElUd0dSd2VNUEUyREdGWGpTbXNOTVhXRzhpbFJMQXlORWs3NWk4?=
	=?utf-8?B?eWNaanYxQjFaUjBja2FHMU5IQzNFUzRocElUMU1xTGYrZC9QanNDNm5qaUlS?=
	=?utf-8?B?WjVQZUJ5SzJJNWwyMTJhNlhQdXd3ZjBoMnoySGs4NnBmUzRGWDMzM0Jpem0r?=
	=?utf-8?B?aFBVS3haQjNrWWU0OEd1a2NrNlpiQkp0NkV6WENRS1NITFYyUUg1U0tveWFj?=
	=?utf-8?B?NCtCN2pqcEZBL3VQTHEyOUh2dmUrVlVEaS8xMWVPK0pQam9wSFoxaXZuYllY?=
	=?utf-8?B?OWFQVWEzK1A3QzVldVJ6MDR0bjZYYkVWTG9ZRlpUUjJ3ZGFHUHZxZGdKMjk3?=
	=?utf-8?B?YytNbW5lK3Y2ZE9WcWZnTW54cWtkdFBxSytoSUo2elFiU29NeFpVT0puWUM4?=
	=?utf-8?B?RmlBZlo1Lzl1WUVJYVdNV0lPZnRESzRMUXlPZ3lBQ2RlK056Ym1qRDFnQjlh?=
	=?utf-8?B?SWR3MlZOaEZDV2U1ZFJvWjRPVThOZzZaRkZUUG45Kzg2T2p2YlRDSVdoeXdw?=
	=?utf-8?Q?hd1yE68s1dvqPWq6hPo9Yd8Y7bZIEXWHUJSOU=3D?=
X-Microsoft-Antispam-Message-Info: 7eHpUaKYn23QITdSgUvFWMhbTZ8VKrCdlzncR/LU4ohTLmtZaIayVq20QvaOeQtP3EliJd27CTSsRAkFwPn0x7DXgb3kqbhtIV+O2dN/Jbiq2vwzVILRkOBnSkaxp7ZabyEcPjU5m1+yBEy21k+eljklqZ5p3pp+G+jVGUq0lzDuQeynI9/yVhF48h7uLzObSh2P9YnjplurBsoAN8TnmETXwifVnKNpF452Jai5fafmmKBTy1G+nME38fwODCLdkQOrzP8PXleffHpXE78hN3J/AGBFRp7mxj/W8O3sv/AhCCQcTwv38NSo1eTw466Hn0kwCrxJTxMlAgjVLu1jTfe10CTjR+Hr84kAKLia+Mw=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	6:+dQQBGr8g1wPpS57/mwcgl0KOr16oFrkDlPE6mgQ9wYQVG+sqrtQqNEr3Xpp8uiJQdt9E+ak6OC5B4Uu1V4n347ZnCYhog0X/xq3lUsRwsVp2EbysybbGcRgE2/HJt0/JCUl4bpZp976wmEgZPkKXH/lU5M7wHLIyYgTDESRtdmJLS/cNEb3RKioI+oyGq/I9KhtA1cdhUuGea0jLKLk7Xl0TZeR8LaVqc6EByCX1KCI2EqtMhzp7w9ewNGkwKzDHV1IRZ7LAXfXSuazOyoQoxpDGcAMaQag5t653WRQJfFPiC/3uq/bSVTcRYURuOAjX6ryXqivYSvGg3EbeKe7WcAFqxhavGDlHCLofreUz/9pcV/dcsubQH7ORAygKvN+WoiHKzm9YLCp0jZbEY6XEYRTdZFywDZUNs0MCC/oSCKThhDS7UyRjOA0jdBwmhiAiI7vXfeti4xZyQ77wyr78A==;
	5:xN4vW9QHQPNNfLZbqeubMf7l51pDOqhgjTkuZPiz4JShODDwvTEAtbyXhALM5CWBchiZ6ASQmGZEvptvOFK6SF4wFWrF//Ab7Vyt1Xs19AD1wCqBn3SrL5uaQq5Z5pSgE8pocgP7TztN9mbG6+AH/ZAcej8IaDy09liXGhTO004=;
	7:/fxxtzsSyxjsgveP6xLpmYaTMPHNHsGFQweH0BGjiRLTxrAjynMbjHIeN9b+4EdSF5mVLUrtq7KTcCZPBM3+fjIwpCelTHxIpOjjoJqtsFmJeuodl8FCMNxY+iGjqCf9QKm6/LwzzETXPhvwh/6cyBmI2Z7z8prJcASpx23GoNuGN+hgehLi9dOfkUaev+B1kaZ/myMETMnpCVQNOAa6xYEHiUWwfuh+upng8j38fkTyIPwKX7YFMYG5N4f80S6K
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2018 19:54:27.4548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eade404e-476b-4714-40e7-08d62a333132
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4754
Subject: Re: [PATCH 2/2] python: consolidate common patches
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
X-List-Received-Date: Thu, 04 Oct 2018 19:54:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Anuj,


On 10/03/2018 10:09 PM, Anuj Mittal wrote:
> Move inclusion of common patches to .inc to simplify things a bit.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>   meta/recipes-devtools/python/python-native_2.7.15.bb | 3 ---
>   meta/recipes-devtools/python/python.inc              | 3 +++
>   meta/recipes-devtools/python/python_2.7.15.bb        | 3 ---
>   3 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
> index 7c491fa3e0..ee2ec1082a 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
> @@ -11,10 +11,7 @@ SRC_URI += "\
>               file://debug.patch \
>               file://unixccompiler.patch \
>               file://nohostlibs.patch \
> -            file://multilib.patch \
> -            file://add-md5module-support.patch \
>               file://builddir.patch \
> -            file://parallel-makeinst-create-bindir.patch \
>               file://revert_use_of_sysconfigdata.patch \
>              "
>   
> diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
> index 66923678b1..38cc79cb41 100644
> --- a/meta/recipes-devtools/python/python.inc
> +++ b/meta/recipes-devtools/python/python.inc
> @@ -13,6 +13,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>              file://0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch \
>              file://0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch \
>              file://0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch \

The multilib.patch is actually a different file for the native and 
target packages, I suggest we rename it and keep it on each recipe 
separately.

Cheers,

Alejandro

> +           file://multilib.patch \
> +           file://add-md5module-support.patch \
> +           file://parallel-makeinst-create-bindir.patch \
>              "
>   
>   SRC_URI[md5sum] = "a80ae3cc478460b922242f43a1b4094d"
> diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> index 472c1da4bf..8bc0f273ec 100644
> --- a/meta/recipes-devtools/python/python_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> @@ -12,10 +12,8 @@ SRC_URI += "\
>     file://03-fix-tkinter-detection.patch \
>     file://06-avoid_usr_lib_termcap_path_in_linking.patch \
>     ${DISTRO_SRC_URI} \
> -  file://multilib.patch \
>     file://cgi_py.patch \
>     file://setup_py_skip_cross_import_check.patch \
> -  file://add-md5module-support.patch \
>     file://host_include_contamination.patch \
>     file://fix_for_using_different_libdir.patch \
>     file://setuptweaks.patch \
> @@ -26,7 +24,6 @@ SRC_URI += "\
>     file://python-2.7.3-remove-bsdb-rpath.patch \
>     file://fix-makefile-for-ptest.patch \
>     file://run-ptest \
> -  file://parallel-makeinst-create-bindir.patch \
>     file://use_sysroot_ncurses_instead_of_host.patch \
>     file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
>     file://pass-missing-libraries-to-Extension-for-mul.patch \


