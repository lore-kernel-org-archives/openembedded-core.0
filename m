Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1794827832949193272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=X/jRtUdR;
 spf=pass (domain: est.tech, ip: 52.101.83.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXfvlFErQMKIrhad3b7Zjoeaz+wKtOnEKkT0SVVBxE8FGDATKUE1w7GzEtydWaFaKzKhNo6Ut2dnj3Grc5FU4+yVgy7WjuCcpgSv/kU5zbR6U53c2BmX4wqwQTzMvzB+2d7x9+C5Rdk/93J91/WW+VSS5pGGni3EJ6auCvQQQhSDvPUsxUDsJiu6sj2nlRK7oBjPg7nZd8cMuqt4Hlxfb5LOfKI+IlzYX2x5jxUXESriQqdvlnhdVIruDYQAvjboP8/6Rnv5rg0s6JYjO+hX8hE0cWcSh05v4xAU0gG7AaABQy+RECPneU8x+bNCNsQJ+KhOnl2IYhMMslyP619WxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slqTz41CutXaWsgfG0d8Zlru1hZog3VuiJdOZjYOigo=;
 b=bs9tYW/xdQJiQK/2oGf3tUIwpP2G5gT/BlDsKKJuTvCPSh7i5kkKHvmF1Conc9d5ttoOMQMunF8UANR90eJQII6QNbLmcIOQ+ruh8MAw62OsxhsoUF1nUUtT+rkKjZedWXnReDjuOef+vZbr4Z4pG65o0y+p8KchZQ/ARMUoHD7QtRLT7ljss4U3LW1/N8DdzQ2CvYgsS8Qicxw2dR3EPRBN8jfzni5t3ZJQlfb6kKmlRn3NpYOKmwn9Uzu3F2z8vpH+IjsiljAnkDB43cE7TgnU7MnwYh8YPBmGI4Z4Z3hAHirpDVcoqNOZamw6cjcwD0yyfp28VjcEJLgviyunzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slqTz41CutXaWsgfG0d8Zlru1hZog3VuiJdOZjYOigo=;
 b=X/jRtUdRxpdoRV9yPQrHy2bLWOLxiwvAW7zQyjur/g3nKs2McPK26g/LQSKTdyqgRtM7Qqah51TUpT+SKeq5VI14IBoaRGwG1EBwPYSbd34doSIVtY/X3TZzVijqcuM3RkPOYQPsQzociN6wOWGNUOX1vkX+qvIHSPROCUi5b01DnaHHxHTOPNnvx5LqHfF+4uBEyk5Jk6hleSOcC7nP94FSfOWZrAMj8ieqLu+qECle9AOr5J9tnjPP691d2g7XB5u16qy0Aw1wj+azRD5xttl+/D1KogxX8yxNHR6/QIoFUQceUgJ55ezH7YnL6q9ZoWDTnY2d9EDPSaNWnX7Vrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAVP189MB2617.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:17:19 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:17 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] dbus: upgrade 1.16.2 -> 1.16.4
Date: Mon, 16 Nov 2026 12:16:58 +0100
Message-ID: <20261116111658.7745-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAVP189MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: 7995475b-4cb9-48c7-cab3-08df43d32c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022113327099003|261022075727099003|261026121527099003|261028144727099003|12006099003|20046099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nIY1JKvTqzBy2f1+ZvNVZMx2zUfNkrsTwl7+RZlavdeOdb+uR86Bj8uGe6vLgaLy0eJDI+ui6mOlo0YlYlQYa2F6S8wG/R140HIy8tvRcVXpRoNh+UBmDcAKhx1xV7OjXyMfjkIqGipvbI40eu2PW7wKCxUwIvjYpOwTzFA3BeBOuXtH6cccbMlxJIaJCRK6O6gep3QbKD16Lcxn1SG9dj6aszztT0ZE5v06pvfv6woCWQKCdcgNpBNznGRNpm3yhIdWg/CNmsvfFjfHgyEy0Rm/R90vxCBxR8Cyy4MSendso/G/TXJUJMVF6mgZ44VeUu3PhDnJU3qC92bc0/QzdOTF7Y1sg7JUXlTtpy/8hk+N26X+ZkLGiRbdMr9/Br0wCrEyl1UmKmBjxMj3Vju7sJ1sNpNRCWy/pDo/9NorXB5dzf5IK9YyOCh4lQv2fPUKQtCC42mA7RIW6P6yKaisrDs9lxDr6+HVo4aX0Z2ZinaTYTB7LrOcc+Gn4My1MDa5YjY3Ac49AhR1d7Bf4jDFaCzquaJKdr9VNgMxxthaW7erarTWSgJx8vzWrTyIY7KQvXCluhVtm6vtremJXq3wBIEYBD6DX+xsQtjr1qIMZc0M74EKRdtiLNKoEMQkRBpk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261026121527099003)(261028144727099003)(12006099003)(20046099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUmnAtORYGe4C2MsWooQ+KBL4b+MGfkTHTbiQabps93AayAFHR0SQtiWKXFs?=
 =?us-ascii?Q?6rB1RRIuaalkvPu5DMDDD9Ks30nzblOFfUWIM8rjcS+odZMeuA93QLIZe5Nr?=
 =?us-ascii?Q?EN4Rm3UnI3Gq2KpEnH+HEM6ToJKCZXHoo+GyGQqo/c/qDkUjzFh3JmOsSZr8?=
 =?us-ascii?Q?y5NHyDrRhftXZWFLIMwC8FeO3eqWGeCerfGQvouLGgx5mlDEsdWwxn0KAOVZ?=
 =?us-ascii?Q?hFd/LwDsr9ZBVHVEEaPHI2JyMCFuWHIi85rKTiRr6szfD0x6V9Ct/pV3P66m?=
 =?us-ascii?Q?7Snr/hhOCaZ6vOgkOW3iVefvIlF7mDqLfU9dqov/qECgIWG2NT84eKR48p32?=
 =?us-ascii?Q?iGLkcY/ybhZDDLWB58Au33m6Cv94uuOjzsjo+8oFllKSgqsiOBPBCDSBmc7W?=
 =?us-ascii?Q?pJKGYtn/vKTkSrPP1z3c24NNrwJQuOezaNk6MsS3GNhxnGhv8Nk//hEW66lA?=
 =?us-ascii?Q?GO4d/alcyQQV98N/WHEn5eASIvve/WQWMcLQ0dDGenjluQHaRMzryREiK/AA?=
 =?us-ascii?Q?oo69RJ605UzWkj87legz0hkUaHK+DD0S6btCyN9qzULXpmQvp1VnBApGqme8?=
 =?us-ascii?Q?mnB5g0SZGjDGl+g5VsCiyxsuS67yBWSJEx7IiW6xaF6yB7v9xW12UGI5MURh?=
 =?us-ascii?Q?Y3bcinwm0x20y6VsD6yUG65nMJ9cpxbHsqntUvrfGYB6wJh0SgqixW8cVi/I?=
 =?us-ascii?Q?JAiPnDJOBy/5B0TLcjBriwxY3e8j6r3nwB1M/EjVWuH2eUsAROonHyw7QCI7?=
 =?us-ascii?Q?FuBIEEPLj9UlUpt1zSzSVVtLjijSbv3aS/JYj0J87nbAkKDUcaccKALOtqCO?=
 =?us-ascii?Q?3euBH8Ne8OpIBGgkfgT5X/GtL9ME8MI9d6vZHkOMrr6kHhkQTomC7Q3XUiGw?=
 =?us-ascii?Q?hrn20YWaD1kk4wtdR7WZpFdSEdA09J0qy7kHYsMkP0oMnCr/D7nQgw94e5Ij?=
 =?us-ascii?Q?dahSk3qRCpaeYmBzvhxvqMvmb3l4TvcIIzX7Q/Zolda4j+Orvf9xmey19kr/?=
 =?us-ascii?Q?ElNLZJheWg8L3U6EEDXTaOfgOfxexuiZ/2wVoerwrhv2c356zSvu8WazfuWL?=
 =?us-ascii?Q?ok/JiYK0ZJEJWh3/FtjIOLFaAa9boRox1iYAXZd3/eCQ9xGGI/GvDvtBUSF4?=
 =?us-ascii?Q?qOWXKRgGXLtQFsrKDHWGrTzn1tBzb+THbSQv8/232i95pYTFEhHnlwcfwhVZ?=
 =?us-ascii?Q?rFlJVOxHRBXT0VwS9ydvsuJZmqTk3lLjwxkkvTdwWu8z9XcW1LQmin0OMyLj?=
 =?us-ascii?Q?+Y+A/QuBCo5OzCIggkVYmVVBbkyvzkTU3GLpb+zWaej+Gvc9DBNCiufmggBO?=
 =?us-ascii?Q?5b3o0d5nE5x0tGK/iE3mjgrLk9CoQmGz77oFMoFHXndsdkj+nA3sHWBkqxT1?=
 =?us-ascii?Q?sD6sDdWXr+mxHpF5DOgrnZKdsJJtju9zWc5tla8NVZG8ErwFpUfOSBfZOSpJ?=
 =?us-ascii?Q?QaKaIUSEOFHNhoTGPnEJCDTODRttAsKA/wn1tyXzELiHfOSv0G54YWvwJUCT?=
 =?us-ascii?Q?nza6rIMNp2slfAXqPd4FtAvaaxbTGbZtcQyq1PszJdgw/5crJ+8Yk5Md1xJW?=
 =?us-ascii?Q?mVTwhoRQaihs9zk1Ws2w3LvJ6a4R1rpcuSbXMUDEXr1SZgODxawYzYCWJTFs?=
 =?us-ascii?Q?t4PX5dcdb1J1vmOxjLifFmkNAomuG/qWX4lliY1nr3/h3XjFLU+fBRpLqv+I?=
 =?us-ascii?Q?bSbG+9Msuq7XfmNP4M/1b8cO6RNBStRBleCmQEP2QPRReTM68ukrg9VA0a1q?=
 =?us-ascii?Q?B90bqsE1Tw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7995475b-4cb9-48c7-cab3-08df43d32c3c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:17.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTLP10Ky0oMSjDZA60tkTm4zefVas9NGVne8/ZW8CrgOXb+ogJMOZFjcUhWHUoP3+2BsjeS1+1lmwEB9zhS19DN02xYN03o1gs5hNKM6hhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250338

dbus 1.16.4 (2026-11-12)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Security support scope:

=E2=80=A2 Add `SECURITY.md` documenting various security considerations
  (dbus!597, dbus!603, dbus!606; Simon McVittie, ooonea)

Denial-of-service fixes:

=E2=80=A2 Prevent a denial-of-service vulnerability on the system bus:
  if a privileged user was running a monitor such as `dbus-monitor --system=
`
  or `busctl monitor --system`, then an unprivileged user could cause the
  dbus-daemon to crash by arranging for delivery of a broadcast signal
  from the dbus-daemon to be prevented, for example by filling up the
  outgoing message queue towards a client that subscribed to it.
  This vulnerability could be seen as an incomplete fix for CVE-2023-34969.
  Thanks to Ma Penghui, KylinSoft Corporation.
  (dbus#576, CVE-2026-120749; Simon McVittie, David King)

=E2=80=A2 Prevent a denial-of-service vulnerability on the system bus in wh=
ich
  a client could cause a busy-loop by shutting down its socket while
  outgoing messages were pending.
  Thanks to AISLE in partnership with Red Hat.
  (dbus#587, RHEL-239613, CVE ID pending; David King, Simon McVittie)

=E2=80=A2 On platforms that implement `struct cmsgcred` (in practice this i=
s
  believed to mean FreeBSD and DragonFlyBSD), prevent a denial-of-service
  in which a local `AF_UNIX` client could send unexpected file descriptors
  to the system bus, which would have been ignored but not closed.
  Thanks to AISLE in partnership with Red Hat.
  (dbus#588, RHEL-239934, CVE ID pending; Simon McVittie, David King)

=E2=80=A2 On platforms where poll() is emulated using select() (in practice=
 this
  is believed to mean macOS and Interix), prevent a denial-of-service in
  which the system bus would crash if file descriptors above 1024 were
  polled, and harden it against busy-looping if an invalid file descriptor
  was polled.
  Thanks to AISLE in partnership with Red Hat.
  (dbus#584, RHEL-239610, CVE ID pending; Simon McVittie)

=E2=80=A2 In servers listening on the `nonce-tcp:` transport, do not allow =
a client
  to make the server block for more than 1 second.
  Use of this transport on multi-user systems is discouraged.
  Thanks to AISLE in partnership with Red Hat.
  (dbus#586, RHEL-239294, CVE ID pending; David King, Simon McVittie)

Bug fixes:

=E2=80=A2 Avoid a busy-loop on non-Linux operating systems that can report
  end-of-stream with POLLHUP but neither POLLIN nor POLLERR, such as
  FreeBSD and OpenBSD (dbus#553, Gleb Popov)

=E2=80=A2 Avoid a possible busy-loop when blocking on a DBusPendingCall wit=
h its
  timeout set to DBUS_TIMEOUT_INFINITE
  (dbus!524, dbus!525; Gleb Popov, Simon McVittie)

=E2=80=A2 Avoid a rare assertion failure when waiting on a condition variab=
le
  (dbus#556, Johan Bolmsj=C3=B6)

=E2=80=A2 Defend against fd watches potentially being removed by a watch ca=
llback
  (dbus#585, RHEL-239597; Simon McVittie, David King)

=E2=80=A2 Fix a memory leak during autolaunching if dbus-launch or launchct=
l fails
  (dbus!560, Oleg Tsvetkov)

=E2=80=A2 Correct commented-out default auth_timeout in system.conf
  (dbus!519, Simon McVittie)

=E2=80=A2 When built with Meson, fix CMake builds that discover libdbus via
  CMake rather than pkg-config metadata
  (dbus!542, Zephyr Lykos)

=E2=80=A2 When built with Meson and fallback subprojects are enabled,
  disable unnecessary features and try to link them statically
  (dbus!516, Simon McVittie)

=E2=80=A2 On non-Linux platforms, never try to compile with Linux epoll sup=
port,
  even if the OS has a compatibility interface for epoll
  (dbus#557; Alan Coopersmith, Jonathan Perkins)

=E2=80=A2 Fix compiler warnings in dbus-send(1)
  (dbus!558, dbus!559; Simon McVittie)

=E2=80=A2 Avoid deprecation warnings if compiled against Expat 2.9.0 or lat=
er
  (dbus!561, dbus!564; Oleg Tsvetkov, Simon McVittie)

=E2=80=A2 Update fallback subprojects for GLib and Expat
  (dbus!426, dbus!429, dbus!576; Simon McVittie)

Internal changes:

=E2=80=A2 Skip a known-failing test on all FreeBSD versions
  (dbus#308, Simon McVittie)

=E2=80=A2 Fix test failure if DBUS_TEST_DBUS_MONITOR is unset
  (dbus#424, Philip Withnall)

=E2=80=A2 CI fixes
  (dbus#546, dbus#547, dbus#548, dbus#558, dbus#572, dbus#578, dbus#580,
  dbus#582, dbus!528, dbus!531, dbus!556, dbus!557, dbus!569, dbus!577,
  dbus!580, dbus!589, dbus!599; Simon McVittie, Gleb Popov, Ralf Habacker)

ptest summary:
SUMMARY: total=3D60; passed=3D60; skipped=3D0; failed=3D0; user=3D5.0s; sys=
tem=3D6.5s; maxrss=3D16996

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/dbus/{dbus_1.16.2.bb =3D> dbus_1.16.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus_1.16.2.bb =3D> dbus_1.16.4.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.4.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.16.2.bb
rename to meta/recipes-core/dbus/dbus_1.16.4.bb
index 4fdff64a7d..153b38c811 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.4.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://dbus.freedesktop.org/releases/dbus/d=
bus-${PV}.tar.xz \
            file://dbus-1.init \
            "
=20
-SRC_URI[sha256sum] =3D "0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb6=
43384bd6beb7e2"
+SRC_URI[sha256sum] =3D "d08b05526c2cb7966a5fb79210d6112b1aca3d135f315c1b30=
2e14b4b0297dac"
=20
 EXTRA_OEMESON =3D "-Dxml_docs=3Ddisabled \
                  -Ddoxygen_docs=3Ddisabled \
