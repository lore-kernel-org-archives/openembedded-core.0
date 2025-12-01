Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4AAD116F5
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 14:51:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23442.1764600694210018467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 06:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=SkGUaUM5;
 spf=pass (domain: axis.com, ip: 40.107.162.59, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIqhn+mrID24CdnCmzGfYGc1ux9vdD32951uQDDLfHuX6Z+75/a6vTGZw55g8SObAIp8lkjBwxb6lPHK3P7mjUKx/HfKnbADVaQQbec8we4uSVZ9Lg+ZCj4juAf+Dmu2Y0S/XZ7IqUZv2VseX42hGL4brUmzal+qagT6ZMBK7YQNoP1wyaI9JB7aZfqJtVTPRbalBUWfspFDpVRTDdzWA1RwK5/T2BPQIPO5Tko4SHqu9/Dnxluk69LEDJ7EXB1Tm1MFuUglohQMRlI6CeVPOYOKx4Nxf2RnYvfYeu+24KJwdxHbkfj19Mul4IK/iD2SgIBZin08V1ESvCeW5tYhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tryvp4tRau0MXlzLGyTYoDe12nuCZ5QLLsD+VoGTZu0=;
 b=QPz6cM1RVaj4fnQadtLZ9ViTNj5uZHxdfWed0Sd1rcOGUlPK6BuOz6+3NYn00i1C4XPylk3DzsL5opLHp2lwUPJ3LR0K3s5L0Pw3qZg+oP1sYBHh0E1r+6wwoF2T/6ZWdmdhXa46Q34aTfqDPlCDiS81KDNIreRY6DZpiS/DLX5pjrZg4+lwe/flPsa1oSeuSbdcJWDuIlggCwrQnqb9TrN+Z7T/F6kUIVVz2Tf4Ue8Sen3UBUiZYo49Qraduut3QcsMyK+xwx4H9qcQFR5Hs6KX7H4cTF845H4t3HyvRt0k+0r6Kw/Hws16d6UM9EaS9szOCqJv0ypC75te2ZSuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tryvp4tRau0MXlzLGyTYoDe12nuCZ5QLLsD+VoGTZu0=;
 b=SkGUaUM5Cw6cLbqeZxYx2DUKs7xxSEuSlocgQbMmgolNCn+X1r5v7hk3nmnZLvUZTrVjKMX5Dfi2M7Au7qp0RmDh/1fW1+sn5Zo/iXVy/a+080XHa+Brye49cI9m76/3rTCTd4kArkJi4/4IJhYjSWWyswd6/QM88lKxwbaprO0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GVXPR02MB11013.eurprd02.prod.outlook.com (2603:10a6:150:21c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:51:30 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:51:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "leon.anavi@konsulko.com" <leon.anavi@konsulko.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] glib-2.0: Upgrade 2.86.1 -> 2.87.0
Thread-Topic: [OE-core] [PATCH 1/2] glib-2.0: Upgrade 2.86.1 -> 2.87.0
Thread-Index: AQHcYGwnI6ZdclQeU0OtcYT9eh11IrUMp8XQ
Date: Mon, 1 Dec 2025 14:51:29 +0000
Message-ID: 
 <DB5PR02MB102136142784A45F0893A0B65EFDBA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251128133716.3635989-1-leon.anavi@konsulko.com>
In-Reply-To: <20251128133716.3635989-1-leon.anavi@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GVXPR02MB11013:EE_
x-ms-office365-filtering-correlation-id: 2881c69d-fb29-4960-3e86-08de30e91c9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?QCkDxVLwZOLNm3A89KrGDE4O+0XU0n16nizEEfgastV/wN7XkeQUOefzgjif?=
 =?us-ascii?Q?NL41qtnOrSiEvm/659DP00bq6QcAUu1wMlO18cejuoqV2qsM2IRGlVtACxid?=
 =?us-ascii?Q?zuq5j/trkzgafBfzttOSIiY6gwuXCoB1QSZ8CAmJiOqhcP/RojODXyJs0ieg?=
 =?us-ascii?Q?TFizi/j6++inUMP9lFPxEGsARyKtX1YBlNM9qcTKi5xKdP04tuDjJ+Q4p8ju?=
 =?us-ascii?Q?5dzzPShxQk4jfM31LDN8eEtZDBD+vXc82Z+XZNx7Zl+HYD4f/e22XrkQw3Cb?=
 =?us-ascii?Q?HHGiAlPt5PVvtU9IX32yf491J5GVQrT9DOleqymy2hMhTvo0pgsFHHpcBdS1?=
 =?us-ascii?Q?M63Nm2Oz8k0oNPFSz8Y2UzqjWK9cwDMpfISvp6co/kdmXWFTIvQuPwtetBeQ?=
 =?us-ascii?Q?BhspurIY4uy8eu3Xft2FvzVxZbHQnLiSUGSGx8l4jt51tNBwtspeVhYNp6RX?=
 =?us-ascii?Q?zlwCDiaxljUBwuuZza+ntOE2pCzbuy02dsmVjhMqMIniqXija9aesUrpnFKu?=
 =?us-ascii?Q?B6aAu9Rke2gZU6KkhzCv2vG/Q5eeELJOXD2/ac9Q21KS1X4imwqDi3ghLTWn?=
 =?us-ascii?Q?p9ucCI8HskQcea/haeHTOtg/CgnTmZhNFazvf7y+tnOYvRgSsg6W1StOB8HG?=
 =?us-ascii?Q?pWRtCKPzjLTu/rGu8uDhcIzAyzPBJ00rzOyhxkDrhCjA1QZLjqz8BthdHdKy?=
 =?us-ascii?Q?pczQKHhArwqlQFvK9DjYsI93TmnFL1a+Y0bAfzItda1pn/RO8JcxXl4cGcwP?=
 =?us-ascii?Q?Z9kb6o/bDy6cvHGPo6PPfrscWuWTb1azxUglIqlVYqg0rDJvKza7jhUYK0D5?=
 =?us-ascii?Q?tOgLQUGraitwlVzuvIw8Sn+yc3haWJKLLNWqRqwu/XTBUvDLMZj8BOq5x7Xx?=
 =?us-ascii?Q?hHbXk7Kb37oTAkb3kSw7faKO+PuVXsVNNwow1AtMlLW5fzC9Wr2N9soM9Xmh?=
 =?us-ascii?Q?nLQmJ4QBzA8ZtVWrOP0vNRSOag1frspRUIwy0wx4nvXoajN8LIdoXSmorr0N?=
 =?us-ascii?Q?MGHuk8ME0PwmdwPxQ2e2ir8c11L3GPDdquKnEVC7aGPSA57v1598P9H2obiC?=
 =?us-ascii?Q?YAAQI/oyjf9e4Nff7VX+sGXOmTuFSJmW51VdtH37/PoFV74ZH4lEj5MabTTl?=
 =?us-ascii?Q?i+6Drf9cE1/v6gMG7V1QKZ31Mpy0xw7plaDiXwbJS/6KnLsm1zVloTCZIcaB?=
 =?us-ascii?Q?WAf/fb6GQALTz7OwCdwiQn/LcQZ5AMarn4dVDmMtQH+MX/VCxDuzgNwn3tc7?=
 =?us-ascii?Q?l5KbUp1TQUnt5hvIQnp11IqniiOcw7cS8kwhy/d1rjdyY2S5k+FtrTbThnHm?=
 =?us-ascii?Q?pMoC3FqIjGipU2qLdU2VP9Zwn2hseZYRMwJ+BO0OWoxRpkai7jA8C9IPEn8M?=
 =?us-ascii?Q?a9PW3kNUg32IVzYjpHYtbPE79NszTonMj8yxHLKYmi7R8WU8A1LRnrvd8aJM?=
 =?us-ascii?Q?kwTjCEJoulmAk3qSkWJ+g4Abj5YnfpqmWTwtttqMrkXHSpp665XCnuT+9lMr?=
 =?us-ascii?Q?yj+LxYo1HIiA8w2QEXdjRrlXvbTpiFeyQdFU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YsfXj3yFBFheBIOiZ8cVrsHlGKcgwcLeDIrBKd1Z9+KFzhwBPmAqJNSKmOGK?=
 =?us-ascii?Q?xfH2ovBZS8EYDsxiLjFcauJOj5ZdntfaeT7gVUcBd3BxRIgRQC4NBvfATQHI?=
 =?us-ascii?Q?mp6GyQG9kr7mKdoJcr4VRAADOhQ9yfcFjmUJMZjxIgb9WfACPKN9I4FSG77/?=
 =?us-ascii?Q?/jVRwc1r7bghEy3DabGzLTw1qi8yKdT4I41kyuLAplx8W/LIIY6/cReq91iy?=
 =?us-ascii?Q?Ur6jOrDOT+D+X5GUVgylYOYMWSzUgSom6M1oCiOXEYEw3xPgFv1kp+H0GAxC?=
 =?us-ascii?Q?zvrzpcrcOz8rYE2PY3VVF5VMT2oytptUa/PgVUtaACMwoJ4d5cL+c89JSjbR?=
 =?us-ascii?Q?p4cdt9Ih/oPDMB6y4FFqMDv/k9ogIePu8J3pHGmE9eNDRDfWnbR9ouG5EGf+?=
 =?us-ascii?Q?js/sbnR4hWzcvtLQGjVukTcsaP704l2sCHWFr3BoPvEf0woiixvJjdoxAfAE?=
 =?us-ascii?Q?Wsf4RSqcpyv7YtccCIEMtLAFkusY0VXI6StoJqSnvW26m0sYEuWm5SgBU4Rq?=
 =?us-ascii?Q?/UphZ/JxbD44/xhmXFBTnCcLLSBSjAZiDhbpkAomvn6H+zI+B7rp9dXbG2k5?=
 =?us-ascii?Q?I9ebi6jQFanpfwLxjrc/5C806XyK3/uqYnwyR8OWuatmT4AhyWqRP8cfnvhj?=
 =?us-ascii?Q?jjpi1leVmZuqcJ5bavvgtnO72pk9werwhwUPzRmLcG1cijEGWdyNOufHjEan?=
 =?us-ascii?Q?DFrLfKD11DrymfL+STJgv6n6ir113wKjBK/Ms9RX+pYeq4q0gI5iyjLjPBja?=
 =?us-ascii?Q?ND0BCR8TdZ0J2hzo7L8aikcCl/5+k4s+/JqyEcB2pm4Uwf0o2YxbTEGl2Ubs?=
 =?us-ascii?Q?Qe03PJVUpLaQzxgl3d3XJY6o7LPH0oB83AYZJUtGqmTbYZZu7xGY48HNxkMk?=
 =?us-ascii?Q?soAYSUuLJR6gD4oY4T6E5WTx+droIbLxamIWC5qS8Om3kCCQob3JquWRKvgD?=
 =?us-ascii?Q?Sct2SxwtLME/t+Qs3w6/NX1GcBfDqv5QOYOYyaUEQACWmUgo75YnmPER4PhC?=
 =?us-ascii?Q?hLOebXvBlUImFtgvp0xHypfP5fOw3BVXwEL8o9yoBirbl0Hy4BxfCAbw77JP?=
 =?us-ascii?Q?zig//h1y93PatLksBnkgHyj37CUY+IB6sfAgizQyjus0gh0vGdwsepca1cHo?=
 =?us-ascii?Q?1PzH1GBbNYagRe9X2ns2/cwhjosb5AfmmNytRZOYiypAx36/f20hNurJkLJI?=
 =?us-ascii?Q?YmYxfamUkmSt8i4oXIFFfxzj/I4pWUx1k0E7aeIHr7YX/AgSHzJYGkFSunGz?=
 =?us-ascii?Q?wDc5wr2+Czsq3eHffkTtKs4P/xo0FRPVJ3h1nsb4LK0L89jnz/Mf8dU/2Bsr?=
 =?us-ascii?Q?pa8K8LTjaJliyclPVGqBv2R/GxsaA1bFtw/+gUooc0KdTlogpHuliGVfzaT9?=
 =?us-ascii?Q?qhan4AhQTaw1lw7e+7lLxlXCxnZKTl76cB7NOW16F79Ol773beuS06uX2xJK?=
 =?us-ascii?Q?ttpZGUBkSSiOkJIWJaiccRll6XAdUAi1//AoF0KyVNVH4LwvDUGl03kn43DZ?=
 =?us-ascii?Q?xnCjrgb5F4KW6dH6ldVFE93bgAbfQAzG7scCmrgBJuvDQoPQ7hSb3cDhXw?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2881c69d-fb29-4960-3e86-08de30e91c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 14:51:29.8522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oeKOPo8DJeL79P/W8uVk/C4caLU1aPVzrhkehdTCwEHh8cndmiV/OjgPgbrqTLTU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB11013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 14:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227127

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Leon Anavi via
> lists.openembedded.org
> Sent: den 28 november 2025 14:37
> To: openembedded-core@lists.openembedded.org
> Cc: Leon Anavi <leon.anavi@konsulko.com>
> Subject: [OE-core] [PATCH 1/2] glib-2.0: Upgrade 2.86.1 -> 2.87.0
>=20
> Overview of changes in GLib 2.87.0, 2025-11-03
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Update to Unicode 17.0.0 (!4793, work by Peng Wu)
>=20
> * Support runtime extensions to `gdbus-codegen` tool to allow modifying i=
ts
>   output in project-specific ways (!4812, work by Sebastian Wick)
>=20
> * Use document portal to open all the URIs for snaps (!4822, work by
>   Marco Trevisan)
>=20
> * Add g_markup_parse_context_get_offset() API for getting error locations=
 in XML
>   files (!4879, work by Matthias Clasen)
>=20
> * Bugs fixed:
>   - GNOME/ptyxis#490 new tab does not open in current directory when host=
name
>     contains a period (Christian Hergert)
>   - #672 hash resize broken for large sizes (Tobias Stoeckmann)
>   - #2608 Support nanosecond time resolution with stat() on macOS (Andre =
Barnaba
>     Silva)
>   - #2949 gdbus-server-auth test intermittently fails on macOS
>   - #3070 gio/g-file-info test fails on macOS (Andre Barnaa Silva)
>   - #3523 g_filename_from_uri rejects valid host names according to RFC 1=
123
>     (Christian Hergert)
>   - #3745 GIRepository: union fields offsets for compiled typelibs all ha=
ve
>     offset 0xffff (unknown) (Philip Chimento)
>   - #3771 Should opening a .desktop file fail if Exec key contains invali=
d
>     escapes? (Philip Withnall)
>   - #3780 `gio/tests/socket-listener` requires dlsym
>   - #3781 GLib.OptionContext's get_help() includes width of invisible opt=
ions
>     (FeRD (Frank Dana))
>   - #3783 [CI] Pipeline on 'main' failed for commit c31c4a52 (Tobias Stoe=
ckmann)
>   - #3784 Memory leak related to g_get_home_dir (Tobias Stoeckmann)
>   - #3785 "gio trash --empty" returns 0 even when it fails to remove file=
s
>   - #3790 _g_log_abort() should check TracerPid from /proc before raising
>     SIGTRAP
>   - #3798 Gio.AppInfo.launch_default_for_uri_async crashes with non-exist=
ent
>     paths (Philip Withnall)
>   - #3803 GNetworkMonitor's netlink backend doesn't notify connectivity c=
hange
>     (Philip Withnall)
>   - #3805 [CI] Pipeline on 'main' failed for commit e6c52881
>   - #3806 fake-document-portal needs to use _g_fd_query_path() rather tha=
n
>     accessing /proc/self/fd directly (Marco Trevisan (Trevino))
>   - #3808 Uyghur language translation updated.
>   - #3809 GRegex tests fail with pcre2 10.47: different error for ^(a)\g{=
3
>     (Marco Trevisan (Trevino))
>   - #3811 g_get_user_special_dir doesn't strip trailing slash from $HOME/
>     (Tobias Stoeckmann)
>   - https://gitlab.gnome.org/Infrastructure/Infrastructure/-/issues/
>   - !4753 GIO/Win32: Remove custom definitions of system interfaces
>   - !4755 ghash: Fix entry_is_big for CHERI architecture
>   - !4756 ghash: Handle all table sizes in iterator
>   - !4759 GWin32AppInfo: Allow focus-stealing when requested via
>     GAppLaunchContext
>   - !4760 gbookmarkfile: Escape icon href and mime-type
>   - !4764 subprojects: Update libffi, pcre2, proxy-libintl
>   - !4773 docs: Add Luca Bacci as a co-maintainer of the Windows code
>   - !4775 Update Ukrainian translation
>   - !4776 Update Catalan translation
>   - !4777 Update Lithuanian translation
>   - !4778 tests: Fix clang compilation warnings
>   - !4779 gmem: Replace SIZE_OVERFLOWS with g_size_checked_mul
>   - !4780 Update Brazilian Portuguese translation
>   - !4781 Update eu translation
>   - !4782 Update Korean translation
>   - !4785 Update Japanese translation
>   - !4786 Update Galician translations
>   - !4787 Update Hungarian translation
>   - !4789 gio: add some nullable / zero-terminated annotations
>   - !4790 gstring: Support large strings in g_string_replace
>   - !4791 gstrfuncs: Check string length in g_strescape
>   - !4792 gtype: Define copy and free functions for GTypeClass and
>     GTypeInterface
>   - !4793 gunicode: Update the code for Unicode 17.0.0
>   - !4794 CI/MSYS2: Use builtin b_coverage option
>   - !4795 Meson: Add arguments and defines to all C-like languages
>   - !4798 GDBus: Add `(out)` annotation to quark in
>     g_dbus_error_register_error_domain()
>   - !4800 gutils: Improve load_user_special_dirs' user-dirs.dirs parser
>   - !4802 Update Turkish translation
>   - !4803 Add missing `(array length=3Dn_values)` annotation to `GEnumCla=
ss` /
>     `GFlagsClass`
>   - !4806 build: Post-release version bump
>   - !4807 Add missing "nullable" to parameter docs of GList/GSList
>   - !4810 gutils: Mark load_user_special_dirs unlocked
>   - !4811 Update Esperanto translation
>   - !4812 gdbus-codegen: Support extensions and changing the
>     GDBusInterfaceSkeleton type to inherit from
>   - !4813 Update Serbian translation
>   - !4815 gfile: Expand documentation around file equality
>   - !4816 strfuncs: Check for overflows when joining strings
>   - !4817 Mark a couple of functions as constructors and not methods
>   - !4819 utils: Fix a leak when user-dirs.dirs declares a variable twice
>   - !4820 gio/tests: Fix a race condition in /gdbus/connection/flush
>   - !4822 GDesktopAppInfo: Use document portal to open all the URIs for s=
naps
>   - !4823 gio/gdocumentportal: Use the target name when opening a symlink
>   - !4825 gdbus-codegen: Supress coverity warning in skeleton finalizatio=
n
>   - !4827 ghostutils: Treat 0x80 (and above) as non-ASCII
>   - !4829 docs: Fix typos in win32-build.md
>   - !4830 giowin32: Fix uninitialised variable error on msys2-clang64
>   - !4831 macros: Add C23/C++23 standards
>   - !4832 gtypes: Support more overflow check implementations
>   - !4835 Update Portuguese translation
>   - !4837 tests: Fix another clang compiler warning
>   - !4838 GLocalFile: keep suffix name when trashing
>   - !4840 gpattern: Support patterns/strings longer than G_MAXUINT
>   - !4843 tests: Use integer widths rather than maximum values for strfun=
cs
>     check
>   - !4844 Forward-port !4839 "Update Romanian translation" to main
>   - !4847 GFile entity tags: Update HTTP reference link to point to RFC91=
10
>     ETags description
>   - !4849 Update British English translation (main)
>   - !4851 Docs: New file-name-encodings image: light/dark, color
>   - !4855 glib-compile-resources: print error message when the temp file =
cannot
>     be created
>   - !4856 Mark return value of g_dbus_interface_get_info() as `nullable`
>   - !4857 Docs: Migrate gvariant-*.svg licenses to comments
>   - !4858 gsocketcontrolmessage: Fix a minor typo in a doc comment
>   - !4860 Fix `g_memory_monitor_base_query_mem_ratio` on Solaris
>   - !4861 gio/tests/gapplication: Check the values received on action act=
ivation
>   - !4862 ci: Temporarily disable macos-arm64 CI as it has issues creatin=
g temp
>     files
>   - !4863 ci: Temporarily disable msys2-mingw32 CI
>   - !4864 ci: Update Fedora CI image to Fedora 41
>   - !4866 Fix various scan-build errors
>   - !4870 Reenable MSYS2 CI
>   - !4874 ci: use APFS for macOS TMPDIR
>   - !4877 gresolver: Fix loopback detection of IPv6 addresses
>   - !4879 Add g_markup_parse_context_get_offset
>   - !4887 glib-unix: Add Solaris implementation of g_unix_fd_query_path
>   - !4893 ci: Use CI/CD file variable tokens for secrets
>   - !4894 gthread-win32: Ignore error when setting thread priority
>   - !4895 gunixmounts: fix out of bounds write in AIX mount table parser
>   - !4896 ci: Actually use token file for the issue bot
>   - !4897 Re-enable PCRE2 tests for 32-bit Visual Studio builds
>=20
> * Translation updates:
>   - Basque (Asier Saratsua Garmendia)
>   - Catalan (Jordi Mas)
>   - English (United Kingdom) (Bruce Cowan)
>   - Esperanto (Kristjan ESPERANTO)
>   - Galician (Fran Dieguez)
>   - Hungarian (BalazsUr)
>   - Japanese (Makoto Sakaguchi)
>   - Korean (Changwoo Ryu)
>   - Lithuanian (Aurimas Cernius)
>   - Portuguese (Hugo Carvalho)
>   - Portuguese (Brazil) (Rafael Fontenelle)
>   - Romanian (Antonio Marin)
>   - Serbian (Milos Popovic)
>   - Turkish (Sabri Unal)
>   - Uighur (Abduqadir Abliz)
>   - Ukrainian (Yuri Chornoivan)
>=20
> This work was sponsored by GOVCERT.LU.
>=20
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{glib-2.0-initial_2.86.1.bb =3D> glib-2.0-initial_2.87.0.bb}  | 0
>  .../glib-2.0/{glib-2.0_2.86.1.bb =3D> glib-2.0_2.87.0.bb}         | 0
>  meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.1.bb =3D> glib-=
2.0-initial_2.87.0.bb} (100%)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.1.bb =3D> glib-2.0_2.87=
.0.bb} (100%)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.87.0.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.87.0.bb
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.87.0.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.87.0.bb
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index 5909851896..2ba8ad7492 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -236,7 +236,7 @@ SRC_URI:append:class-native =3D " file://relocate-
> modules.patch \
>                                  file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
>                                "
>=20
> -SRC_URI[archive.sha256sum] =3D "119d1708ca022556d6d2989ee90ad1b82bd9c0d1=
667e066944a6d0020e2d5e57"
> +SRC_URI[archive.sha256sum] =3D "926cf73d8eb90ea341cc2d6fc7b258901e1a086a=
3808b166b4476d69a98b2401"
>=20
>  # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.47.3

Glib uses the odd-even release scheme so 2.87.x are development releases.

//Peter


