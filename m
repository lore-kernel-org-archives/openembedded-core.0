Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id EEACE6E672
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 12:15:32 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H/AQCKvopah9Wax9VbHAEBAQQBAQoBA?=
	=?us-ascii?q?YJ8UGlhBAsoCo52jESDZJgAA1wKI4hLFAECAQEBAQEBAgECEAEBAQgNCQgoJAu?=
	=?us-ascii?q?COCIRcwUBAQEBAQEBAQEjAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEDAg0nfQEBOBEBgQAnBA0IAQGKBgMWAwyeWQKLEAEBgxSDCwEBBYF?=
	=?us-ascii?q?vgjQYgSeCPQMFhQuGEAyOGKQ6CYgkjl6BDwEYhiqLfY4GiWwCAgICCQIRAQEHg?=
	=?us-ascii?q?Tw2gXQzGiODEhKBfgE0H4ISeI0fAYEYAQEB?=
X-IPAS-Result: =?us-ascii?q?A2H/AQCKvopah9Wax9VbHAEBAQQBAQoBAYJ8UGlhBAsoCo5?=
	=?us-ascii?q?2jESDZJgAA1wKI4hLFAECAQEBAQEBAgECEAEBAQgNCQgoJAuCOCIRcwUBAQEBA?=
	=?us-ascii?q?QEBAQEjAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEDAg0?=
	=?us-ascii?q?nfQEBOBEBgQAnBA0IAQGKBgMWAwyeWQKLEAEBgxSDCwEBBYFvgjQYgSeCPQMFh?=
	=?us-ascii?q?QuGEAyOGKQ6CYgkjl6BDwEYhiqLfY4GiWwCAgICCQIRAQEHgTw2gXQzGiODEhK?=
	=?us-ascii?q?BfgE0H4ISeI0fAYEYAQEB?=
X-IronPort-AV: E=Sophos;i="5.46,534,1511820000"; d="scan'208";a="85507099"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9x/JOX3XS415wy9dU6fWjs46flCwHpADGoo2ic8sKhI=;
	b=cync6DOIy3+ECN1xyl1ZBJx8Z7GjsNvJ7/7BhdVmdzyI5jnPq98sraTVgZ4jPam03AXUON4B2GfahP7M1lMppnDM93yye4JExbw3sYV3ZTX2z4posAho2Rt0dK1H4fCVu9FQRgfN99flPHjVM1dJkqzx5HlH0iOYE8p4bnAJJ6M=
From: Mauno Niko <niko.mauno@vaisala.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Missing git tags for latest Morty release?
Thread-Index: AQHTqXtVt6EQ1tl+4EOvfe2+RDksVg==
Date: Mon, 19 Feb 2018 12:15:30 +0000
Message-ID: <ddc7757a-ea92-9841-a521-47d9b68b2de6@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0601MB2372;
	6:jmPhvMvrBx6WK+Zn3Ek/DNa8hzNbR89dxyqfwer9uDF4m/fFEqLCKtFn0V3JFl+MWdzxRiJVrNWFYQxtAsNh0LFRjcOJ8P2Por3pWEGruRrK1lIdlZwZ9usoavndrvPEKyHNnxjN0JyT6pmWfz5Uhuc2CjAyQbPPR5amdXOt9Mt7C3o9sjZYfXnBvxHAdU+IMQvpaIAA1maTgIhXA/E3NiFICV2JRowgvd4rhfktcCt4st6oQGzhxss6TP0uyeiNkdP46AOK5gb3OJiMw+dG5vsCaKnvePV1xed/w5jmpQp+nLrfuNSavb/gQ9yw0SS9lDP6fYb2LaKKHDOgTUM/RbmnEGNYjTQQ95xNefz85OhWTtu59p3V5MDgXAOAg56Y;
	5:p1JLyiBs28BhOcsNnQsgt+F2w9pir3FaoV59NRiu5sj4Xs9RUPTKCoHg/LGnQIynjEyPbTyGAKvg9yn/LaxNh81w9n+r6VFMJ9FD6KUVaONTCGFSmu7VdRqI3pL8PHD/4LjmqqiQi5MlSCgNli2CF0PhGF2SOiLw6YqaddDd6x4=;
	24:3WVKrWwKbk1zmNr4ZvDTldT45KRY426oiAzCh9is+NrDgvagSFc1aotKCE2g0JXyD66RWS2gM9iJ7+v0ZvgqSUcbl0C2JSotFmsvCnFYV/M=;
	7:w/5zEwOoiv8+M1oAjPNLxrAJ7ym75YCmSthuiWjy6QXnaHI+cGOLal3rOHq+dqNjXgZXXMhnpo8+41UryrugaTzr1jc/T7j3BVoL2aCImqQz4DNeWt/1VKfAbEF/QgT9Mx7xGP2L1fgFNpt6MtVDUQ7Dl2xtcXsKs3kI/lpjQuVWlIrAiNxAf7up2chWW4KkHYKugoFfqUSrl7NN3KBsHmTJA0KXCXjyYTpLpm0uU/wIZ4QGbNcpcOYESDXwcgRv
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: c966b536-c583-4062-e08d-08d577927811
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:AM5PR0601MB2372; 
x-ms-traffictypediagnostic: AM5PR0601MB2372:
x-microsoft-antispam-prvs: <AM5PR0601MB23720E2FD2C290D6454899BD81C80@AM5PR0601MB2372.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231101)(944501161)(10201501046)(3002001)(93006095)(93001095)(6041288)(20161123562045)(20161123560045)(20161123564045)(2016111802025)(20161123558120)(6072148)(6043046)(201708071742011);
	SRVR:AM5PR0601MB2372; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2372; 
x-forefront-prvs: 0588B2BD96
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(39380400002)(376002)(346002)(366004)(199004)(189003)(8936002)(83506002)(25786009)(64126003)(2906002)(81166006)(3280700002)(1857600001)(81156014)(478600001)(31696002)(5660300001)(2351001)(14454004)(68736007)(6116002)(2501003)(106356001)(305945005)(66066001)(6512007)(31686004)(65956001)(6916009)(86362001)(3660700001)(65806001)(36756003)(6506007)(186003)(7736002)(97736004)(99286004)(53936002)(558084003)(3846002)(26005)(6486002)(316002)(8676002)(2900100001)(6306002)(65826007)(105586002)(102836004)(5250100002)(6436002)(58126008)(5640700003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2372;
	H:AM5PR0601MB2531.eurprd06.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-microsoft-antispam-message-info: 9JBl2ZLyES8AADmRIL/RjU5/D/u7tRC05lu/kjDCYvwAjabnoI2LFTotdDI0+9M8T1ecpM9ial0mwdCyEQSOBr0oyHV6el4rKQ/N3LjKbCc6hc0Q2itvXaKFbbEljVLq2TRAUhJScsasIwlGI3By8u9UGWJiSLE3kQcYowlGS/M=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c966b536-c583-4062-e08d-08d577927811
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2018 12:15:30.4911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2372
Subject: Missing git tags for latest Morty release?
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
X-List-Received-Date: Mon, 19 Feb 2018 12:15:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <024E13E576C1C146B957037EC9DDCD2E@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Even <https://wiki.yoctoproject.org/wiki/Releases> states "Current Version"=
 is "2.2.3" for Codename Morty, associated "yocto-2.2.3", "morty-16.0.3" ta=
gs do not seem to exist, could someone please create those?=

