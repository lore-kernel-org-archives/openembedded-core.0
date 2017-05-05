Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5F74777D85
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:37:53 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3Ahn265RCHdZ9FwoXwg5HAUyQJP3N1i/DPJgcQr6Af?=
	=?us-ascii?q?oPdwSPT/p8bcNUDSrc9gkEXOFd2CrakV1ayI7+u6CCQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5YL5+NhS7oAreusUIhYZpN7o8xAbOrnZUYe?=
	=?us-ascii?q?pd2HlmJUiUnxby58ew+IBs/iFNsP8/9MBOTLv3cb0gQbNXEDopPWY15Nb2tRbY?=
	=?us-ascii?q?VguA+mEcUmQNnRVWBQXO8Qz3UY3wsiv+sep9xTWaMMjrRr06RTiu86FmQwLuhS?=
	=?us-ascii?q?waNTA27XvXh9RwgqxFvRyhuxJxzY3VYI6JO/RxcbjQfc8DRWdbQspdSzBNDp66?=
	=?us-ascii?q?YoASD+QBJ+FYr4zlqlYJqxu+BAqsBOT1xj9NnHD2wKs60+M6HAHYxgMgHskOv2?=
	=?us-ascii?q?7QrNrvLqsdTee1zKzRwDjFcvhY2i/95ZDVfh0jv/2AR6x8fMXLxUUyDQ/IjVSd?=
	=?us-ascii?q?pZT4Mz6XyOgBqXaX4uV6We+uhGMrsRx9riasy8s0hInGmIEYxkzB+Ch8wIs4Ic?=
	=?us-ascii?q?C3RFN+bNK5CpRdtSSXOJVrTc4gTWFlvTg2xaAbtZO5eiUB1Y4pyATFa/OddoiF?=
	=?us-ascii?q?+hfjVOGMLjhmnH9lY7e/hwqq8Uin1+38StG40FZUoSpBldnBrnID2RPV5MSeRf?=
	=?us-ascii?q?Vy/1ms1zSW2wzP5OxIO1w7la3BK5452LIwiIAcsUXYHiDsnEX5lrWaeVkj+uit?=
	=?us-ascii?q?8+jnY7PmqYGAN4Jslw3zMLoiltahDek3KAQCQnKX9Oe92bH7+E32WrRKjvk4kq?=
	=?us-ascii?q?nDt5DaINwWpqi4Aw9W1YYv8RO/AC270NQemnkKN0xFdwiGj4jyIV7OJOr3Ae2j?=
	=?us-ascii?q?jFSrlTdn3+rGMaH5ApXRMnjDl6/sfbFl60FCzgo809Vf6IlKBb4cPf38RFL+uM?=
	=?us-ascii?q?XEAR8+KQy73f3qCNF81oMFRWKPGbWVMKTKsVCW4OIgPeyMa5QLtzngNvcq+ePh?=
	=?us-ascii?q?gWU+mV8Hcqn6lacQPSS/BvlgLkCTbHbgj9tEGmAQsyI6Tff2kxuFSTNVanO4Uq?=
	=?us-ascii?q?4w6z19D5ipW9TtXIeo1eiH3SS8WJhfe2ZBIk6FEGzhc4zCUPAJPnHBavR9myAJ?=
	=?us-ascii?q?AODyA7Qq0guj4Vf3?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GAAQBFVQxZ/1YBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhR+NeadHgg+GJIUHGAEBAQEBAQEBAQEBAoEQgjMgg0ISAYEAJwQ?=
	=?us-ascii?q?OvXWKZQEBAQEGAQEBASSIPYhKhRkFkFyNE5MZgWoBj3uUNx+BQ2+HTYhegQ0BA?=
	=?us-ascii?q?QE?=
X-IPAS-Result: =?us-ascii?q?A2GAAQBFVQxZ/1YBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhR+?=
	=?us-ascii?q?NeadHgg+GJIUHGAEBAQEBAQEBAQEBAoEQgjMgg0ISAYEAJwQOvXWKZQEBAQEGA?=
	=?us-ascii?q?QEBASSIPYhKhRkFkFyNE5MZgWoBj3uUNx+BQ2+HTYhegQ0BAQE?=
X-IronPort-AV: E=Sophos;i="5.38,292,1491253200"; d="scan'208";a="40630366"
Received: from hel-exch-03.corp.vaisala.com ([172.24.1.86])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	05 May 2017 13:37:53 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-03.corp.vaisala.com (172.24.1.86) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Fri, 5 May 2017 13:37:53 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Fri, 5 May 2017 13:37:53 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3 0/2] licenses.conf: less environment-specific variables
Thread-Index: AQHSxYumWKo/uE4EpE6rnHY8bS5Qgg==
Date: Fri, 5 May 2017 10:37:52 +0000
Message-ID: <1493980660-9291-1-git-send-email-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Cc: niko.mauno@vaisala.com
Subject: [PATCH v3 0/2] licenses.conf: less environment-specific variables
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
X-List-Received-Date: Fri, 05 May 2017 10:37:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Change certain SPDX variables to be less environment specific by default.

Niko Mauno (2):
  licenses.conf: stop relying on specific user's home directory
  licenses.conf: Allow overriding environment specific SPDX variables

 meta/conf/licenses.conf | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

--=20
2.1.4

