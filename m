Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9810.1794405655482331045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CnhxE0hi;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJ4hxhHTDnxnG7nITtkiShxrvOaPi+pBG3wQhvkf3kDKLyGS4GXwhPD4ikx11cbSfwZSoI2aYoffzKl8QU5i/VvkmUVZjWzEj1uXhYXowCLDxu8G1Uh83QRqo33YSgY/eLdBInx8jhrI65P2c0z0/8REns3HnBuqVoS7QsiEzoyIMB+1Xj1qC8QZghKRsgx03ydQyRqDGEH05ucZ86KtSS/rsmQyjgJvHWRtgVc4LVwjeXYnbp0asyMwKIlxSM7G+hf2j6PxIl7stC8al9H3zLsjk6608qrhbw8JMrUUgtFu4Gu+Qw6XryzPh/4aVltKlvc0XUnpJOcxRuQQjRi3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96nKCltoA6AOCib3lHMol1Nch6VpwdKqann9SEiGgBQ=;
 b=a7YGMvgoLiwtYmZU9TRjwGj4Xqy+adWDzDDaAfOjun+yYN2x0GDvEbnZlO4ogZq7EqKOuhqSfG6DJRm7jTG3soXecjbukIycrOCqjyrWca6cJsINTvUY5CSXkYQEcTFOEF1vDc5p6g0yZlRZDPgeKu5a2pjhdPt80dxErtB6C/k+kh0tckiIlMo4TjIeBP5hYJZ/3+SbKUwJjkkpxrWCewaMakQeXbpvtYuIzTH3Oujy+touTsZ/c4dGdBUfN1gDpNvfA7r8Xuwhw9IxjJlUyilPkaQxkEMZDVWQrheP3n3xUT4vYb30rEduBE146ycD2arOy7SsrIvjnKTpUmIb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96nKCltoA6AOCib3lHMol1Nch6VpwdKqann9SEiGgBQ=;
 b=CnhxE0hiG9XPXM9DYQSrBF/U+u9JDhLrvwX/sTC/CD/54YqjCTEyrx7PNQtwOSmo/0jc1oMBPMEDvo+2kE5AVSCMKj1tER24w799Nc/qDQRZuawk2gJZDCEm2l1kDU3EjJ0TjkmQefOBVKDIwkNE40mtyqAopuVTcR8XGs1a6wmCRBAAZdeMmBx/4micaPLXdjAQevbSY3kLcuE73FqVm81y+genz0+69f1yjtXTFEMczE3uOO5V1OyQm8otn+0Kj8Ts6SQ1w1jmDxFdmiEv0zevYWMbnWUz8A1f/QcWZKY+zz72UF4KIH11RRbfr/RWym4jHRBwu0lrZUDjLyQUkA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU0P189MB1891.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:34b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 14:00:49 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:00:48 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dev-manual/packages.rst: document gpg-agent configuration for parallel signing
Date: Wed, 11 Nov 2026 15:00:47 +0100
Message-ID: <20261111140047.70020-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0313.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::12) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU0P189MB1891:EE_
X-MS-Office365-Filtering-Correlation-Id: af39b7e8-3ecf-43df-5ce9-08df3ffc3088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261009223027099003|261102123227099003|261021121427099003|261028144727099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: geJboOaYw5NKgEcGtbl58Ylz5gqGaFUCnO7F6pDyuVgTB7WiSousf/7W2ESFPJJR2FrlVciCLAA7nvrzKMyZq1B4G4dWuNoCx0FfOUnJgokWhSln3pM5/2yTc9mm5jh6CD6CRisHPy9kR4T90DBGDIqY8JgGvkXLr80VmvStsuK0f+nlGq4ccRrk08hBO8xTPYipqbf4KoJfbMrw8973KYoA9Jw1NKPxLWt+s+IBB39RllatPH7aauk42xzLX6V2HmvRbtnrtq9+WLIEb+OfxvrGAw+rg3vliYTLF7G+4bKofa47q3a9BR/mGaiJBszEkPgBmrNON+X9t4WnrmIZwYokw3BilImcBH5aRx6gwf/6/WxHUVl53rJQlc8udqjbk+I8pE7NC/3DcEzjvjATY1ak6/GrrjjQAdF7vELnF6BR2iqXd4gRtthSPb528pgxno90mDijd/6shlECebqFG3oG1ED/oZcaX6m94SfGQJ2WODKmirdKR0nQTWVXcjsxzfSpIMEjlY6wipZmC+9Hk4iXzMPcsdssKvqKfUUjgeIYS+V9KMxnJqKyado6+KWFl2svaTi24vLHotVM0zNKXHDaD97bf0n9YWtT253ycuafZ3fGTh9Kp2F4xztRu6JGk2LaiefTxFK2z3rvR6QwYzYr7aZSQlLgbt5UZJs4Yz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261009223027099003)(261102123227099003)(261021121427099003)(261028144727099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zkxrv6jQI2zx8kGXWNxpR37HmlRv1QM6IrbcUiTUQ5KMxsKMENZXox13hAlH?=
 =?us-ascii?Q?GE0ZVKmwoDcM2GL1Pra9hjxzf+774eMV3tNaF2mYBNOB+iueW6HxZUZabfRV?=
 =?us-ascii?Q?k/zwTZevxZuNJQKIas/7KvGj/AbgvIwZ0/BAZHghLOViCYCqs2UhzzHodBNy?=
 =?us-ascii?Q?kFQQf1/cVDxEXOxko1d45z0yBhGAWskgX+aPqfx/lCBnm5tzRCyVbsvqi+Ew?=
 =?us-ascii?Q?YjgjTWbIergJzEGeTav5pZifJxxgsfAoQYz8FdPFI0MGAU9RAtBB+S6hH2F2?=
 =?us-ascii?Q?qToHUNOK0OpVferPIDjiUBf11f7C3urgMxpCo87Or3iVA9wmJHCDuDTeqTXT?=
 =?us-ascii?Q?Y/EgLeT8Xo3rwKfH1V+Q8Wp4lwRhC8N+ieCmXS+5vYETcdO5qtWLd/9MLUxm?=
 =?us-ascii?Q?43cSRU0y+W/WNZZSDQUKdgAKhxnRAhzxOuTPuI3WWB0yWSANQTZmDc0JGa0d?=
 =?us-ascii?Q?F/9JLllpPtofC0q59zZgPvVsPfsFabgxo9Q+JUWzk3dv5P77NeOyG1d0d+US?=
 =?us-ascii?Q?ER91IfU96ZAXywH4A9zTNruqSpXa3eyKBcth2hp5guudIZuIH9GtNs9nWNoP?=
 =?us-ascii?Q?aU028i2IuTKlg1/2GAXXf6iVy7znKYuzU6RP84f7qlkwcPZ8VTMdjGGCdiQV?=
 =?us-ascii?Q?OhAaP1GoO/f2RPD0PmfzjuEspRxFve6UGMQUB4ATDKbTJ9GR3mhufc2fIjdD?=
 =?us-ascii?Q?zjXF0E1bVugqmJIyY6Qs4t64YveXPs7lOxQIPte9+pSti9MrGpkYSYatr7yr?=
 =?us-ascii?Q?foVJIEwbvGzpH/Y85V3EP8FbcQ032YAOpvRw6a3DVLsso7cx0bc9+xBgNS/j?=
 =?us-ascii?Q?nNpAwrAE8kQr9QpfOMUa1dozwemGnZO4p7WrTiFshLEkK9+f1b9EScv4gsEU?=
 =?us-ascii?Q?XsD4Uab8ZppI4LVFdJ3x330YtVHs2lBTYu/N+gFnB0/ebeSjnPkUB/BOlCnb?=
 =?us-ascii?Q?GJyF3RVBqWXNPUMe8UcqocfHCvm+ETi/acPVDZKPUUjmACOoxHrmezw0AQ5m?=
 =?us-ascii?Q?aFvH0gUvuUmTMgEWvAFeH3tux8JLVfp/r4nVJjsu3ida+W1liKpmbG3aFeSr?=
 =?us-ascii?Q?TOGarmdFeSyPDZPo9LzzTZIBpLtw1IUPeFLy8C3ccpEIUyOk7oY1ePXwV2x1?=
 =?us-ascii?Q?JXmmUtMVwbEvx72rOtYxWxekXwe6NjtPfd2jaMqgrISBUKtohaGR2cElYxJt?=
 =?us-ascii?Q?yOvC2Tfuv4O0Fz8fe35WSeUnbFQbsuqTgkbOiI8+rsvRXzh3J/GHAquFuU1Q?=
 =?us-ascii?Q?2PPd9vT1LWO1YAJUCDkCT3ormUZvajJWq4tnDscdd/pHW3KP1H1lgCL7Pbcz?=
 =?us-ascii?Q?oZ+MCSMNeAS8VYbj5x7SRKrn8jKoi13YPNnNoBCh1TyejzufXMDaG99LtBUN?=
 =?us-ascii?Q?abQR8Z45iQjDyvaOVRHA1ctHsGOTzg157hRV36enzzMQS1yqNSPW7+jZWIJ1?=
 =?us-ascii?Q?jNJEeO2vd93JVKAMgl854PTK5z1A8HtQElWijYO2fi0F9IyUZXFRP0bcp3jB?=
 =?us-ascii?Q?frNxNB9ZLyVt/7s0xLLtIrG2LHA1wsGfWHCpURdPENhMlcrDgoCSbR00u+PZ?=
 =?us-ascii?Q?LNY1OUBorLndzvf+1JRc1kqvfFFpVjHGmdzCZRrdUbDFtS20Vir2qzjguJJD?=
 =?us-ascii?Q?h0plzi7xtn0XweM88VsiVXQAuzIC1X4U0+RSvzmFMEL5J9WXopDfbPLuqadk?=
 =?us-ascii?Q?NCB7jIXJEcDKEmC9zwueLgxS4ZsFRWztB9xDyx1us7N0TjCcdKfuJ463E/VM?=
 =?us-ascii?Q?+bkBZFtMTW0dNsC7D1z5BL2btu3BGwU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: af39b7e8-3ecf-43df-5ce9-08df3ffc3088
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:00:48.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPihlDACLUavLTfdMQxxVVHxncw3TB7rjtsEfjtQNb4U9ukfGBRQPnH5m32TTtme4UspRBa61Ni1oNqSGVSB6PB1B8B7W0Frd3XMW1VCyYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250026
Content-Type: text/plain; charset="utf-8"

OE-Core no longer passes auto-expand-secmem through --agent-program.
Document how to enable it in gpg-agent.conf and restart the agent to
avoid secure-memory exhaustion during parallel signing.

[YOCTO #16480]

AI-Generated: Uses Kiro (claude-opus-5.5)
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 documentation/dev-manual/packages.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manu=
al/packages.rst
index 380d806be..f05ade8b4 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -905,6 +905,26 @@ related to signed package feeds are available:
    "ASC", which is the default and specifies ascii armored, and "BIN",
    which specifies binary.
=20
+Configuring the GnuPG Agent
+---------------------------
+
+Parallel signing can exhaust ``gpg-agent``'s secure memory, causing
+"Cannot allocate memory" errors. Add the following to ``gpg-agent.conf``
+in the GnuPG home directory used for signing (``GPG_PATH`` if set, or
+GnuPG's default home directory, normally ``~/.gnupg``)::
+
+   auto-expand-secmem
+
+The OpenEmbedded build system does not set this option. Stop any running
+agent for that directory so the next signing operation starts it with
+the new configuration:
+
+.. code-block:: console
+
+   $ gpgconf --homedir /path/to/gpg/home --kill gpg-agent
+
+Omit ``--homedir /path/to/gpg/home`` to use GnuPG's default home directory=
.
+
 Testing Packages With ptest
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
