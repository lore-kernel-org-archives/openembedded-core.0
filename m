Return-Path: <Aditya.Tayade@kpit.com>
X-Greylist: delayed 154908 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Mar 2019 06:53:09 UTC
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390043.outbound.protection.outlook.com [40.107.139.43])
	by mail.openembedded.org (Postfix) with ESMTP id 395747BD8C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 06:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=M9fP9DiVw+ZbKEAWiT9JMMix1C/By+/CAdcGR8R6lQ0=;
	b=O0OESbi2maa4fOqzIdEROuSQYnyxwjzPwkh9KOATxJ3sXSsO74W/u0fup0HApM12aDnwstfZs3BMfnXvEr1ddXozr6hm4qlrW8ztCl/MMvW3wwF5Zcbb0udl4KI0VHqirHprN+FLdIpfx4O0g0H08EyDYyFexZrG/XZQz5EIUtk=
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM (10.174.216.146) by
	BMXPR01MB3832.INDPRD01.PROD.OUTLOOK.COM (20.179.242.202) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.19; Tue, 5 Mar 2019 04:21:13 +0000
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6]) by BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6%6]) with mapi id 15.20.1665.019;
	Tue, 5 Mar 2019 04:21:13 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [poky][meta][sumo][PATCH] run-ptest: fix testcase test-names
	failure
Thread-Index: AQHU0wrebPL9jRRfj0eUx6Xb6Vytng==
Date: Tue, 5 Mar 2019 04:21:12 +0000
Message-ID: <1551759653-8772-1-git-send-email-Aditya.Tayade@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0001.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::11) To BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:11::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [43.241.126.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6352b509-864d-491c-e6ac-08d6a122003f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BMXPR01MB3832; 
x-ms-traffictypediagnostic: BMXPR01MB3832:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; BMXPR01MB3832;
	23:b9NHhkUhn6Lw2Ee0UtW5MS7hu9R/3zDoWFSUuWC?=
	=?iso-8859-1?Q?7/AZD9VgYKW3jDDMnz/8VavIgVs5u7Ay8la8KE/CiKVPHLfqIuzEeuhZqt?=
	=?iso-8859-1?Q?F9lw//InQz0vxbaq2TvFQbrYwVP6NrWFtwJdXCGPoGny5lhJgGX+X0tynh?=
	=?iso-8859-1?Q?Lj+z3s5f6V4KPTGmY2xUu0h78e3n61Xl6Hs6n/pb7k6UU1btBg0PgsTd0l?=
	=?iso-8859-1?Q?3p3cOUnH6VXG6AFOkr8YV4BU9fgZ4wnn5BwAhewzDmxB0T+kIiS062tHhw?=
	=?iso-8859-1?Q?3AFxWrWMjP5FZJP8VfYCXAsqUsMjOza4Yfih6fdKm96Kp97a+DIBLY95d3?=
	=?iso-8859-1?Q?1kKhGAziZrOjqM6gPwJtBehP3w24Yzm6PySsXpWgnBi+3YiD0BukWXZ9Fc?=
	=?iso-8859-1?Q?lZjflErXA73W5vWjpH4zb8bzKDAD25ENARhV1V3FOc4rrwx7qIFBFz6xV5?=
	=?iso-8859-1?Q?m5cTkOwRN3UyBizX32pOoN2A487hST+s6xSZuUR1vlYlBFiycxJP6pVFw4?=
	=?iso-8859-1?Q?P0BcIfzmEgH/FzcXHlq9XmcGXuHK1MJtdIGSMIOnYnQoYvxMGm0RbtpjlV?=
	=?iso-8859-1?Q?Q2Ak9VyK6aWHpMBKtm/MaBsmv2FUgp7GBSgp6/qBu1J/h+IG3lk/54L5UJ?=
	=?iso-8859-1?Q?HRkpMFtqOZxUmv/UsfZ520SVdi2Ly1uaWAAEPkrHew20Haaz5Glf77eLgi?=
	=?iso-8859-1?Q?wZemm4LTLKPzoE0qbNBPDR8ezIVqf1yCX1qazIr//gyp2VL9/Oa5LmmFbJ?=
	=?iso-8859-1?Q?gKrKhV3LqNcypbpgNs/0aEFmwVTLQLAoyAVmt9Ifb2lYPr2JfWdqN4pSN/?=
	=?iso-8859-1?Q?C1Yzj1rnp8OVTYFEjH7kzUyL6/k+Y55YA4Y1XbsrIk6Fd27iTBo0CbrYDY?=
	=?iso-8859-1?Q?Z9oVsMNvoBd8hIyMI40IbElEwA05f7nKRBEthT4GWeTq/FeyOX0lR1UOU3?=
	=?iso-8859-1?Q?DNgu70Vk4AYowmKc04TDE3vYu6M3sGM25y6g85bOTV2iMOu3p7f79M3hep?=
	=?iso-8859-1?Q?aeBaZGtLU9bnBWWia9XIvB6FKZ68DD+fVcs0HCk3otf5QN59/jvnLKxGW7?=
	=?iso-8859-1?Q?jjgbtS0KO4AwjAsgqIba+cvwzD5gJdmXaDUWFWcTlJYrYhIOVUWz5idUNu?=
	=?iso-8859-1?Q?mekLahHCtEPnwLw/v/jJvBwnCCTrFFSXGkef71OfKr5u8ClfGiwfstKS/a?=
	=?iso-8859-1?Q?4TdFt4wFTvfk5Fqf+MoJQG1jJHYuAGsEC+gGXELIfQ0ttBuQ3otegg5RdG?=
	=?iso-8859-1?Q?UgLtCUmxxHkjsSTTNnzWSIWkscUL8GpBrx+qf07qztJrPFlrx6ek5/7lPp?=
	=?iso-8859-1?Q?lI=3D?=
x-microsoft-antispam-prvs: <BMXPR01MB3832C66F7158415F8EEBB99191720@BMXPR01MB3832.INDPRD01.PROD.OUTLOOK.COM>
x-forefront-prvs: 0967749BC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(366004)(396003)(136003)(39860400002)(376002)(199004)(189003)(8676002)(305945005)(72206003)(6436002)(6486002)(478600001)(14454004)(7736002)(6116002)(3846002)(99286004)(52116002)(2616005)(386003)(6506007)(486006)(26005)(102836004)(186003)(6916009)(476003)(81166006)(81156014)(2351001)(8936002)(71190400001)(105586002)(66066001)(2906002)(71200400001)(86362001)(25786009)(4326008)(107886003)(2501003)(256004)(5640700003)(36756003)(53936002)(106356001)(68736007)(14444005)(50226002)(6512007)(97736004)(5660300002)(316002)(66574012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB3832;
	H:BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jy90Ve+6R848hAhFV+FYpHrcB6k2SqlvHzqk3a83VaiXk4YQI+SVIJeY0A3Iyct1iWKN0ikNZCW5WLKmWc3aMRHV6gsbmHT3+l0sO6XYyZ1/2Iq+WivMgAg6sKKWuVCPbnUGr810SBQBB95EVAnQzoeaE7ehPP1j89O2jUIvxy/HXc+k27hakUpc8rLswMPKvorGDmLR6+vlT6GpAPxqlaGit4FaalTzEjPGmFh2jBrVkavzRKiT2KBISZnQr/j3FWv5WQfVlYkfhgH8jVF8vWqDGtGDrrqD+Y/LKNF8pFiar8Bglv595XDwITHW4qQBKY1ztnQiNTs7fHdStiO/anBElaCvXczZaMFeatWBQlFtYaxOM+baMHCWbwVnfXDSEUhHq6L2DxVCW3vAHZ+gwpBqEFJFAmwMKqXLEY4JIYA=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6352b509-864d-491c-e6ac-08d6a122003f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2019 04:21:12.9716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3832
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [poky][meta][sumo][PATCH] run-ptest: fix testcase test-names failure
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
X-List-Received-Date: Tue, 05 Mar 2019 06:53:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Start the dbus daemon first before executing test-names
using dbus-launch, this will set DBUS_SESSION_BUS_ADDRESS.

ERROR:Failed to open connection to system bus: Using X11 for
dbus-daemon autolaunch was disabled at compile time,
set your DBUS_SESSION_BUS_ADDRESS instead

Upstream-Status: Pending

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
---
 meta/recipes-core/dbus/dbus/run-ptest | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus=
/dbus/run-ptest
index 8a8970e..444ef4a 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -13,6 +13,7 @@ output() {
 export DBUS_TEST_HOMEDIR=3D./test
 export XDG_RUNTIME_DIR=3D./test
 export LD_LIBRARY_PATH=3D/usr/lib/dbus-test/ptest/test/.libs
+export $(dbus-launch)

 files=3D`ls test/test-*`

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

