Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEE877D88
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:42:46 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AOz9vsBK9ozx15FptINmcpTZWNBhigK39O0sv0rFi?=
	=?us-ascii?q?tYgeLvzxwZ3uMQTl6Ol3ixeRBMOAuqwC1bad6fGocFdDyK7JiGoFfp1IWk1Nou?=
	=?us-ascii?q?QttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBAj0OxZr?=
	=?us-ascii?q?KeTpAI7SiNm82/yv95HJbQhFgDuwbalzIRi5ogndqM0bipZ+J6gszRfEvmFGcP?=
	=?us-ascii?q?lMy2NyIlKTkRf85sOu85Nm7i9dpfEv+dNeXKvjZ6g3QqBWAzogM2Au+c3krgLD?=
	=?us-ascii?q?QheV5nsdSWoZjBxFCBXY4R7gX5fxtiz6tvdh2CSfIMb7Q6w4VSik4qx2ThLjlS?=
	=?us-ascii?q?UJOCMj8GzPisJ+kr9VoA6vqRJ8wo7bfI6bO/Vlc6PBZNMXX3ZNUtpNWyBcBI63?=
	=?us-ascii?q?cosBD/AGPeZdt4TwoF0OrRq9BQmrHu/vzyVHhmLw3a09yOkhDxvJ3A07H90UtH?=
	=?us-ascii?q?Tbts/5O7sVUeCw1aTFyyjIYfBO2Trl9YTFcA4treuSUb9/a8bd1FMjGgDEg1mI?=
	=?us-ascii?q?tIDoPS2Z2v4Tv2WU9eZtVO2ih3Q6pw1voTWj3skshZfKi44Jz13J8CV0zYIoKt?=
	=?us-ascii?q?GlTUN3fMSrHZlVui6EKoR7QM0iTmR2tCkn17ELu5i2dzUQxps93R7QcfmHfpCN?=
	=?us-ascii?q?4hLkSemePy91hGlgeLKjnxay9lWgyvHkWsm0zllKqi1Fn8HOuH4C0RLf88eJRf?=
	=?us-ascii?q?pj80mjwDqDyw7e5vtYLkAzj6rbM4QtwqAqmZoSqkTMBCv2l1/sgKCKcUUk//Ck?=
	=?us-ascii?q?6+XhYrr4up+RL5J4hwPgPqg0hMCyDv40PhUUU2WY+OmwzLjj8lf4QLVOgP02iK?=
	=?us-ascii?q?7ZsJXCKMQdp665AAhV3pwm6xmlEjem1tMYkGIZLF1feRKHlJLmO1XUL/ziEfi/?=
	=?us-ascii?q?hFGsnC9xx//aJr3hHonNLn/bnbfmZbZy9UhcxxQ2zd9E+Z1bF6wOL+zuVUPoqN?=
	=?us-ascii?q?PYCQU5PBKvzubjCdV9zZ8eWXmVDq+eKKPdr1mI6fwqI+aXeoAapSvyJOY46PL0?=
	=?us-ascii?q?in85g1AdLuGV2s5Db2i1GPljKUiVbXfgx9wGC2oiugslUPesj0WPVzNWbXu+U6?=
	=?us-ascii?q?8woDYhB9T1I53EQ9X5hr2C22G+F4BQYUhYA1GXGHPhMY6DXqFfO2qpPsZ9n2lc?=
	=?us-ascii?q?BvCaQIg72ET2uQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GAAQBxVgxZ/1YBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhR+NeadHgg+GJIUHGAEBAQEBAQEBAQEBAoEQgjMgg0ISAYEAJwQ?=
	=?us-ascii?q?OvW+KZQEBAQEGAQEBASSIPYhKhRkFkFyNE5MZgWoBj3uUNx+BQ2+HTYhegQ0BA?=
	=?us-ascii?q?QE?=
X-IPAS-Result: =?us-ascii?q?A2GAAQBxVgxZ/1YBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhR+?=
	=?us-ascii?q?NeadHgg+GJIUHGAEBAQEBAQEBAQEBAoEQgjMgg0ISAYEAJwQOvW+KZQEBAQEGA?=
	=?us-ascii?q?QEBASSIPYhKhRkFkFyNE5MZgWoBj3uUNx+BQ2+HTYhegQ0BAQE?=
X-IronPort-AV: E=Sophos;i="5.38,292,1491253200"; d="scan'208";a="40630656"
Received: from hel-exch-03.corp.vaisala.com ([172.24.1.86])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	05 May 2017 13:42:47 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-03.corp.vaisala.com (172.24.1.86) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Fri, 5 May 2017 13:42:46 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Fri, 5 May 2017 13:42:46 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v4 0/2] licenses.conf: less environment-specific variables
Thread-Index: AQHSxYxVrlnqu0R3JkqujZwKXDARLg==
Date: Fri, 5 May 2017 10:42:46 +0000
Message-ID: <1493980959-9571-1-git-send-email-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Cc: niko.mauno@vaisala.com
Subject: [PATCH v4 0/2] licenses.conf: less environment-specific variables
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
X-List-Received-Date: Fri, 05 May 2017 10:42:47 -0000
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

