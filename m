Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4565.1793245663769556026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=v5FL9R/U;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.7, mailfrom: suresh.ha@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abvfTVY8hi6w77tDVB5II8nPn0BO1A2ZFth5R+2+6sv9Pajd1KG21Ybdrp9PrHG9qOFFP52VLk7C/iQjNHGL309HgihGFleafy8dAmYBYgRVSNmzFOj+i80kVGy0QSv3dM3HPA1471vaQ7zUXJwbr5KrDyob3IHpS8jQxIoSLmIvzA/dUyb8+uwBMje7zaqpZykTQU0apWnE2AM3wDhAmKo3J3GcJGfq5q8wHQmQ81w2xd3yScJIt2F7XxfllMfFE4y23Hfy7FkeKUj3tdWDvYFq4/QGqQzjIj6Mh1FKXZOR6a02Afn7AQ/A9XjOQxe83csWcpvL6dwcWdgKeg8gQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hceddi8+UeJIFdxG5YUpijfPgCIuE9t0xjKS1r9sAj4=;
 b=qEBk7iofzoUFOe2jVQQMyhA9Hcm3sv35zqEa9HH14y7g1HPdtDRPkauv2Y6klD7O9guan+e+Ln5X3+xLrasa5xOtkbLMucHO1VY09BB5xnuEQ+KQUGiwEdwswkwo1tfyLm24yfnMWZfeIzWvTmSU0G11AtAUCj5hOW9OXXPV6NBqwCRsSJj5wal588UHfCgcjGd5P4BrDqbVf8a94d8qZPXdwEstiUPMoXuabxnP6g6A/O7RHi51Pl57WIDzpsXFBE3uAJ5/n+a2NuDbohyWPpeO1ZhnZmN+IuSWS+5dzW/Z0TFyUcgyTTBEX1hBqylZwOKMpUXDm2FKXWfgHYcfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hceddi8+UeJIFdxG5YUpijfPgCIuE9t0xjKS1r9sAj4=;
 b=v5FL9R/Uz3P6N8IzLesp37yPBKBJreXQSYRRhMIKt6waCDSkIrDnc8jw0YVuXvSIaLpe607IWx/vSs0JLELN45wIdG4LIjjRwpDyWC2HoVnzuzGXQns774vBiAMjkJz0AbEql7B3PMUZvIuU9Fyy0ZB8jmeFb9Es8vrlPRu5EguhR9JTzrNjSTFWf44TLjoi0dn3BHk1FnUsKtaABwCkgEfGRuSXHJsCV347NyPkcGN0nRyK0q2avra5E628tRVt8jPU06yBm532EVyyfjR7MEshZzQEnz7SHXgu8S6un6Qtj0UyscLMy00hQa8k74uK09Zyd2KM5DD4IZxL9LzhoQ==
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15e::13)
 by MAUP287MB6100.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:226::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 03:47:36 +0000
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc]) by MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 03:47:36 +0000
From: Suresh H A <Suresh.HA@bmwtechworks.in>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for
 access_fd() first
Thread-Topic: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for
 access_fd() first
Thread-Index: AQHdOsUyFrzDeZ+QH0iHlz8zIYY50LbanC0AgARejbGANT/FFw==
Date: Thu, 29 Oct 2026 03:47:36 +0000
Message-ID: <MAXP287MB42400FAAE639EB1BB682B5C0EE6E2@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
References: <20260902102403.4010166-1-UpStream_IP-SH@bmwtechworks.in>
 <DLLTOCN1XYN3.12L0QQ45RSBW8@smile.fr>
 <MAXP287MB42404C1A7233A3D773FFA7DFEE802@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MAXP287MB42404C1A7233A3D773FFA7DFEE802@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-Mentions: yoann.congal@smile.fr
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXP287MB4240:EE_|MAUP287MB6100:EE_
x-ms-office365-filtering-correlation-id: c4559225-391d-4cce-29f2-08df356f5f0a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|39142699007|1800799024|366016|31052699007|261009223027099003|261028144727099003|38070700021|261022115727099003|261026121527099003|261026135527099003|261021123027099003|261026140227099003|261026130827099003|261022113327099003|261021121427099003|13003099007|261021133027099003|261022105027099003|261021130227099003|261022075727099003|261021135927099003|8096899003|3023799007|4133799003|5023799004|260925022911599003|260925021311599003|260925021911599003|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|55112099003;
x-microsoft-antispam-message-info: db3d2REcZEANJUPlUERgZOOiltKtk3kLXDNyBh9ngHjrcdhvhVkcbBpjUSZybQo62TPjb4jSO3yay5f/t+vnikQwV5WyIUWbaUQKtLf8M7nC0/mXerBVJejGJc51Gz1Wys8oHjx5E2hoocgeDSINBGcg/ECCWlGpKlFV0z6hLT0oqyPzRqiExmj6eriY/rXNq3hLQLsXmxO6wxB9Y3Qlz50Wi6TWPGF8mr5dQucJg4Y1vz0RKKM/ZMXFFwmVEIYv1aL70xzPqvwWYu3AGOi+TTy3IKDtrM+F1s7EhAF1FcFqh/mHM0MIq+OIKooFMuX3tYOXUoosRj/V6LOvCiU9xjXbAQ334hbJWPXNhN5wU+k9mTblWhDjYKXCXRlBvdOV9mJUjtwjAjid4dStaMtWzXshDN1wf3bQG7yUYB9d+V7kB/ZQV6XQaLoMMds0zSf7Kx+bb4OYpem3A2nm9RLGWqmrqEde7lc3zUL3piLrI5N4f+fhM/GUtVZXNoEe7On7QKSc7SxPVCg8QtlmV+f0E/0Kcdah5HZHhXvcMwwzvdFghhIYopb34hLMUVhGv55I88HueHjJraTymekYIfKjuZOc8kuEyUyjoPOYolDUv3PvpluU2nw2Vrz/JSlV5jp31KUpEjLRvCt1t0zZNY9TSy/3OSaLJSFU/Xoncvoet64=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4240.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(39142699007)(1800799024)(366016)(31052699007)(261009223027099003)(261028144727099003)(38070700021)(261022115727099003)(261026121527099003)(261026135527099003)(261021123027099003)(261026140227099003)(261026130827099003)(261022113327099003)(261021121427099003)(13003099007)(261021133027099003)(261022105027099003)(261021130227099003)(261022075727099003)(261021135927099003)(8096899003)(3023799007)(4133799003)(5023799004)(260925022911599003)(260925021311599003)(260925021911599003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rbbE8PB7+6Cjm20O9ZVCiYKPOZ3tCMP6Xu8HhGdJNbg2Dh+VDoFLHdQMDb?=
 =?iso-8859-1?Q?aZMlQZbJovbI53Dqvddi0UD9YQH9ZC2b9DeYaD1PBrtZhU5qfurn0TZXhg?=
 =?iso-8859-1?Q?BATNkwcvlffEbxvUHHaSM+r0Fw6sF5iTLsTzaJk76wTU8imKsQuPZoQJwq?=
 =?iso-8859-1?Q?JckTETPD9efcx38OA54zcTOYMwuiOmqxq6X9/YkKDx/sDn6RqYbKzaX+9n?=
 =?iso-8859-1?Q?b4lh5MKwWL2ZLFciWuJV8r6zehM5Bb8mucHIzlj/VCxlNQfyZfumDkUVrq?=
 =?iso-8859-1?Q?VGjbuxogF8xQ3VMLSrCmyjaQqPc0zC0V6Mdebhtye5AAHHwBDnwKkhtuAo?=
 =?iso-8859-1?Q?/322ta0nAxZG4jO01pAFx7V7MXtjuL7WjPPTLPcN47Bmcep1qJ4qjtJ0Z/?=
 =?iso-8859-1?Q?9sOow4sKWYpWxqK3SxMwMjXN+56Q7LsLFfm09r+6IIBhnaRaz78foCy7+r?=
 =?iso-8859-1?Q?BTNumTaP85R1O2VVYslheEnDoBk6QdLhBuHhxH30MRyQ9UIrL0mWO+koWy?=
 =?iso-8859-1?Q?8PP/civ8B2/3l7WYXsVSr0zsFKQZdAqL4SUILIVLku3RVYak5VSNiym0my?=
 =?iso-8859-1?Q?qg/IRSgHPWALkAu11s+0RhsGh5Tlmih4BIpDJk6d65xiwPT18DHmuD36mI?=
 =?iso-8859-1?Q?OSC8BS6XEGjNFfOQjFzk7bTE/7OmcD3L2oSsC8092IQ4WfO4a7iSf3/8Tl?=
 =?iso-8859-1?Q?Uw1w9B647s9/tj90Y2ilvgATc6Z4+cEXm0EOfBTDZph6lVPrYTCxPfYwoA?=
 =?iso-8859-1?Q?TuMGcShBNYetbBUl0hWC97ldOR926Xxwr2WekMrDeYlj5iYiTJ+FY/qhmt?=
 =?iso-8859-1?Q?kM74Q4GGiWk2QnX/dlgXEKNbA/WP1eUrBxDyplng9PgD/IYfyFC2KM8K1N?=
 =?iso-8859-1?Q?MkfO/ioFSyEtg4Q1EgGziDLAqZ0eFD/DKIaEmHV8yARj2PSNZKzNHlQwaO?=
 =?iso-8859-1?Q?oaJDFGSTzCWHzitHesWXLExaRmr2PvFnn2VBWPoqQ3g2RRUfFDDpsoSGRB?=
 =?iso-8859-1?Q?yXaI9YeaKKMxu/RpKgiofEPan3czveio2sbL5TLqylGEhZzy62/QOxK6tk?=
 =?iso-8859-1?Q?2CswG9Q7F6tMbaR1yD46AHSwBKEpxngoVy0ar+WWdFxg7eAW+tvZvExwql?=
 =?iso-8859-1?Q?RC9rjtipvXe/QsfHYuOJFqEOysirR+B/BfDZuPT/67ooTPSTdd27t1qTFO?=
 =?iso-8859-1?Q?pD+ekmDYA8sgZZBRYyIlRCFDE78pRasFsPXs7nkToA1w9EATHYM29jLSpI?=
 =?iso-8859-1?Q?MyZNPgmfV4O8jVNtzGiQJ0kQwBgsyz9zqm766qGldksvNCPkpy4khbjc81?=
 =?iso-8859-1?Q?MPpygQiLB17OhheOe1IIT/SwyDy0VMpKOJcXR5kue09bRGzGfd2bVNV3fw?=
 =?iso-8859-1?Q?L1myNDrCmkRq3qgmTwnBtauOkJ5/WX9jJ/fOa4KlSYdCdx3iJpF5Thy60J?=
 =?iso-8859-1?Q?ikhlIhzhA7V9RelgvOBm3NYvq4BYQb+rOswBt9vkN5nZOIYyWNAfh1vS9B?=
 =?iso-8859-1?Q?HfczFccH1Za4zGT9sFktFv+qGCjn1v89MMhPYjclo2AV/crvFLiGShPA7X?=
 =?iso-8859-1?Q?jU89f5DhqUuVwvr+bI/G/guYNwP/rWsat/DIzvO6Kt6tYoWa+JmQoop6yz?=
 =?iso-8859-1?Q?zZjzzc3tF20+UjegFW72yUTOk0OjVr1vK2Gg4TSG8ywV+2YeCqULqUZZqf?=
 =?iso-8859-1?Q?azX+MihrocK01s7OpAV8ESFZOtIHXDEwp5mljsxWJAm10zKw4BLOCgssLa?=
 =?iso-8859-1?Q?eRbNfZT65EQQdeS8GdIp3heZXCm1UthfZZWfTJKElGUGGGKCtHxhXqsAtT?=
 =?iso-8859-1?Q?rb+e7pUoZw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAXP287MB42400FAAE639EB1BB682B5C0EE6E2MAXP287MB4240INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4559225-391d-4cce-29f2-08df356f5f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 03:47:36.1509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuCv57csVXq1VcomO0vsLc3qdI6jFRFJ4whNTBUpk1fBcbE3WT5mcmeV+17VIMjuGzib3ZRldReDsILYtLsJCZagQ5WkvQcL5tdbSOR1IoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248884

--_000_MAXP287MB42400FAAE639EB1BB682B5C0EE6E2MAXP287MB4240INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello @Yoann Congal<mailto:yoann.congal@smile.fr>,

Sent an updated v2 patch that includes the suggested changes.
[poky][scarthgap][PATCH v2] systemd: try AT_EMPTY_PATH for access_fd() firs=
t<https://lists.openembedded.org/g/openembedded-core/message/248827?p=3D%2C=
%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2CAT_EMPTY_PATH%2C20%2=
C2%2C0%2C121983899>


Thanks,
Suresh H A
________________________________
From: Suresh H A <Suresh.HA@bmwtechworks.in>
Sent: 25 September 2026 12:13
To: Yoann Congal <yoann.congal@smile.fr>; Suresh H A - UpStream <UpStream_I=
P-SH@bmwtechworks.in>; openembedded-core@lists.openembedded.org <openembedd=
ed-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for ac=
cess_fd() first

Hello @Yoann Congal<mailto:yoann.congal@smile.fr>,

Thanks for the review. Addressing your comments:


  *
v2 will use the system: prefix in the patch title.
  *
The Upstream-Status URL will be kept on a single line.
  *
I'll drop the "refreshed as per codebase of v255" comment, since there is n=
o functional delta worth calling out.

On the justification,

This isn't a pure cleanup - it fixes a boot-time race that we can reproduce=
 deterministically and also have observed on our platform running Linux ker=
nel 6.6 with systemd 255 (Yocto Scarthgap).

Deterministic reproduction, independent of exec timing:

Terminal A: while true; do mount -o remount /proc; done
Terminal B: start/restart a service whose access_fd() check races against t=
he ongoing procfs remount

This reliably reproduces -ESRCH from access_fd(). We also see the same fail=
ure mode at real boot, correlated with systemd-remount-fs.service running i=
n parallel with, or immediately before, another service's exec. We instrume=
nted access_fd()/check_x_access() to pin down the exact failure point, and =
captured this alongside systemd's own (unmodified) log output:

systemd[1]: sd: u=3Dsys-kernel-tracing.mount, active_enter=3D3275058
systemd[1]: sd: u=3Dmodprobe@configfs.service, inactive_enter=3D3276766

[instrumentation added around access_fd()/check_x_access() for this investi=
gation]
check_x_access: returned ESRCH - proc task lookup failed; PID namespace mis=
match or TGID thread owner exited: No such process

[systemd output, immediately following]
DEBUG: Failed to locate executable: /usr/lib/systemd/systemd-modules-load

The first instrumented message identifies the root cause of the failure: pi=
d_task() returns NULL during resolution of /proc/self/fd/<fd>. The second m=
essage is unmodified systemd output showing the resulting effect, namely th=
at the executable lookup fails. Tracing the execution path (exec_invoke() -=
> check_x_access() -> access_fd() -> proc_fd_permission() -> pid_task()) sh=
ows that the unpatched access_fd() validates access by resolving a /proc pa=
th rather than operating directly on the file descriptor, leaving it vulner=
able to races caused by concurrent procfs remounts or PID table changes.

The upstream AT_EMPTY_PATH implementation avoids this dependency by perform=
ing the access check directly on the file descriptor via faccessat(), falli=
ng back to the legacy mechanism only on kernels that do not support AT_EMPT=
Y_PATH.

For that reason, we are requesting this backport as a fix for a reproducibl=
e race affecting service startup reliability, rather than as a cleanup-only=
 change.

I'll send v2 shortly with the requested updates.

Thanks,
Suresh H A
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 22 September 2026 17:22
To: Suresh H A - UpStream <UpStream_IP-SH@bmwtechworks.in>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>; Sures=
h H A <Suresh.HA@bmwtechworks.in>
Cc: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for ac=
cess_fd() first

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

Hello,

This is a patch for systemd, so the title should start with "systemd:".

On Wed Sep 2, 2026 at 12:24 PM CEST, Suresh H A via lists.openembedded.org =
wrote:
> From: Suresh H A <Suresh.HA@bmwtechworks.in>
>
> Backport a fix to try AT_EMPTY_PATH for access_fd() first

What issue does this patch fix?

> Fix is already available since systemd v257-rc1.
>
> Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> ---
>  ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 37 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-fs-util-try-AT=
_EMPTY_PATH-for-access_fd-first.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_=
PATH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0023-fs-=
util-try-AT_EMPTY_PATH-for-access_fd-first.patch
> new file mode 100644
> index 0000000000..29dd86c850
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_PATH-fo=
r-access_fd-first.patch
> @@ -0,0 +1,37 @@
> +From 55453c9671934fc7ee369788eb0a1a9c8c850e8f Mon Sep 17 00:00:00 2001
> +From: Mike Yuan <me@yhndnzj.com>
> +Date: Mon, 20 May 2024 19:33:26 +0800
> +Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first
> +
> +Upstream-Status: Backport
> +[https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fsystemd%2Fsystemd%2Fpull%2F32933%2Fcommits%2Fc675851d5fd503c1ae5d=
244f041d43ae9e3ab79b&data=3D05%7C02%7CSuresh.HA%40bmwtechworks.in%7C216323c=
a653b48458b8808df18a0018d%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C6392=
56747628732198%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAu=
MDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=
=3D7D7T33ZCYO013f%2Ft3%2FJyP7ATqYsT1o%2BtivCg8QVjdFw%3D&reserved=3D0<https:=
//github.com/systemd/systemd/pull/32933/commits/c675851d5fd503c1ae5d244f041=
d43ae9e3ab79b>]
Please don't split the line here.

This patch comes from a PR titled "fs-util: several cleanups": Cleanups
are not usually acceptable on stables. You will need to argue why we
need to merge this patch.

> +Comment: Patch is refreshed as per codebase of v255

I don't see any change with upstream. No need to add a comment like this
if there is no meaningful change.

> +Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> +---
> + src/basic/fs-util.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
> +index ee38e0266a..0f65af1a07 100644
> +--- a/src/basic/fs-util.c
> ++++ b/src/basic/fs-util.c
> +@@ -664,6 +664,14 @@ int unlink_or_warn(const char *filename) {
> + int access_fd(int fd, int mode) {
> +         /* Like access() but operates on an already open fd */
> +
> ++        if (faccessat(fd, "", mode, AT_EMPTY_PATH) >=3D 0)
> ++                return 0;
> ++        if (errno !=3D EINVAL)
> ++                return -errno;
> ++
> ++        /* Support for AT_EMPTY_PATH is added rather late (kernel 5.8),=
 so fall back to going through /proc/
> ++         * if unavailable. */
> ++
> +         if (access(FORMAT_PROC_FD_PATH(fd), mode) < 0) {
> +                 if (errno !=3D ENOENT)
> +                         return -errno;

You can either:
- send a v2 with the missing justification for merging the patch
- discuss it here first.

Thanks,
--
Yoann Congal
Smile ECS


--_000_MAXP287MB42400FAAE639EB1BB682B5C0EE6E2MAXP287MB4240INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Hello <a href=3D"mailto:yoann.congal@smile.fr" id=3D"OWAAM121708" class=3D"=
tWKOu mention ms-bgc-nlr ms-fcl-b">
@Yoann Congal</a>,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: &quo=
t;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Sent an updated v2 patch that includes the suggested changes.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/24882=
7?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2CAT_EMPTY_PA=
TH%2C20%2C2%2C0%2C121983899" id=3D"OWA705b2176-85fc-a568-2f1d-05fdace07b9f"=
 class=3D"OWAAutoLink">[poky][scarthgap][PATCH
 v2] systemd: try AT_EMPTY_PATH for access_fd() first</a></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Suresh H A</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Sent:</b> 25 September 2026 12:13<br>
<b>To:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;; Suresh H A - UpStrea=
m &lt;UpStream_IP-SH@bmwtechworks.in&gt;; openembedded-core@lists.openembed=
ded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH=
 for access_fd() first</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
Hello <a href=3D"mailto:yoann.congal@smile.fr" id=3D"OWAAM882150" class=3D"=
x_tWKOu x_mention x_ms-bgc-nlr x_ms-fcl-b">
@Yoann Congal</a>,</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
Thanks for the review. Addressing your comments:</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" style=
=3D"direction: ltr; margin-top: 0px; margin-bottom: 0px; list-style-type: d=
isc;">
<li style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eu=
ropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; col=
or: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation" style=3D"direction: ltr;">v2 will use the system=
: prefix in the patch title.</div>
</li><li style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (We=
st European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation" style=3D"direction: ltr;">The Upstream-Status UR=
L will be kept on a single line.</div>
</li><li style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (We=
st European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation" style=3D"direction: ltr;">I'll drop the &quot;re=
freshed as per codebase of v255&quot; comment, since there is no functional=
 delta worth calling out.</div>
</li></ul>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
On the justification,</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
This isn't a pure cleanup - it fixes a boot-time race that we can reproduce=
 deterministically and also have observed on our platform running Linux ker=
nel 6.6 with systemd 255 (Yocto Scarthgap).</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
Deterministic reproduction, independent of exec timing:</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
Terminal A: while true; do mount -o remount /proc; done</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
Terminal B: start/restart a service whose access_fd() check races against t=
he ongoing procfs remount</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
This reliably reproduces -ESRCH from access_fd(). We also see the same fail=
ure mode at real boot, correlated with systemd-remount-fs.service running i=
n parallel with, or immediately before, another service's exec. We instrume=
nted access_fd()/check_x_access()
 to pin down the exact failure point, and captured this alongside systemd's=
 own (unmodified) log output:</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
systemd[1]: sd: u=3Dsys-kernel-tracing.mount, active_enter=3D3275058</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
systemd[1]: sd: u=3Dmodprobe@configfs.service, inactive_enter=3D3276766</di=
v>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
[instrumentation added around access_fd()/check_x_access() for this investi=
gation]</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
check_x_access: returned ESRCH - proc task lookup failed; PID namespace mis=
match or TGID thread owner exited: No such process</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
[systemd output, immediately following]</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
DEBUG: Failed to locate executable: /usr/lib/systemd/systemd-modules-load</=
div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
The first instrumented message identifies the root cause of the failure: pi=
d_task() returns NULL during resolution of /proc/self/fd/&lt;fd&gt;. The se=
cond message is unmodified systemd output showing the resulting effect, nam=
ely that the executable lookup fails.
 Tracing the execution path (exec_invoke() -&gt; check_x_access() -&gt; acc=
ess_fd() -&gt; proc_fd_permission() -&gt; pid_task()) shows that the unpatc=
hed access_fd() validates access by resolving a /proc path rather than oper=
ating directly on the file descriptor, leaving
 it vulnerable to races caused by concurrent procfs remounts or PID table c=
hanges.</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
The upstream AT_EMPTY_PATH implementation avoids this dependency by perform=
ing the access check directly on the file descriptor via faccessat(), falli=
ng back to the legacy mechanism only on kernels that do not support AT_EMPT=
Y_PATH.</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
For that reason, we are requesting this backport as a fix for a reproducibl=
e race affecting service startup reliability, rather than as a cleanup-only=
 change.</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
I'll send v2 shortly with the requested updates.</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"direction: ltr; font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
Suresh H A</div>
<div id=3D"x_appendonsend"></div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> 22 September 2026 17:22<br>
<b>To:</b> Suresh H A - UpStream &lt;UpStream_IP-SH@bmwtechworks.in&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;; Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Cc:</b> Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH=
 for access_fd() first</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">Caution: &quot;External ema=
il, be cautious especially with link(s), attachment(s) or QR code(s)&quot;.=
<br>
<br>
Hello,<br>
<br>
This is a patch for systemd, so the title should start with &quot;systemd:&=
quot;.<br>
<br>
On Wed Sep 2, 2026 at 12:24 PM CEST, Suresh H A via lists.openembedded.org =
wrote:<br>
&gt; From: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt;<br>
&gt; Backport a fix to try AT_EMPTY_PATH for access_fd() first<br>
<br>
What issue does this patch fix?<br>
<br>
&gt; Fix is already available since systemd v257-rc1.<br>
&gt;<br>
&gt; Signed-off-by: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 37 +++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-core/systemd/systemd_255.21.bb&nbsp;&nbsp; |&nbsp; =
1 +<br>
&gt;&nbsp; 2 files changed, 38 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/systemd/systemd/0023-fs-uti=
l-try-AT_EMPTY_PATH-for-access_fd-first.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMP=
TY_PATH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0023-=
fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..29dd86c850<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_PATH=
-for-access_fd-first.patch<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +From 55453c9671934fc7ee369788eb0a1a9c8c850e8f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Mike Yuan &lt;me@yhndnzj.com&gt;<br>
&gt; +Date: Mon, 20 May 2024 19:33:26 +0800<br>
&gt; +Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[<a href=3D"https://github.com/systemd/systemd/pull/32933/commits/c67=
5851d5fd503c1ae5d244f041d43ae9e3ab79b" id=3D"OWA73eb2d47-db8d-ba0f-8efa-bba=
6215fa017" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://ind01.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fsystemd%=
2Fsystemd%2Fpull%2F32933%2Fcommits%2Fc675851d5fd503c1ae5d244f041d43ae9e3ab7=
9b&amp;data=3D05%7C02%7CSuresh.HA%40bmwtechworks.in%7C216323ca653b48458b880=
8df18a0018d%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639256747628732198=
%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi=
JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D7D7T33Z=
CYO013f%2Ft3%2FJyP7ATqYsT1o%2BtivCg8QVjdFw%3D&amp;reserved=3D0</a>]<br>
Please don't split the line here.<br>
<br>
This patch comes from a PR titled &quot;fs-util: several cleanups&quot;: Cl=
eanups<br>
are not usually acceptable on stables. You will need to argue why we<br>
need to merge this patch.<br>
<br>
&gt; +Comment: Patch is refreshed as per codebase of v255<br>
<br>
I don't see any change with upstream. No need to add a comment like this<br=
>
if there is no meaningful change.<br>
<br>
&gt; +Signed-off-by: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt; +---<br>
&gt; + src/basic/fs-util.c | 8 ++++++++<br>
&gt; + 1 file changed, 8 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c<br>
&gt; +index ee38e0266a..0f65af1a07 100644<br>
&gt; +--- a/src/basic/fs-util.c<br>
&gt; ++++ b/src/basic/fs-util.c<br>
&gt; +@@ -664,6 +664,14 @@ int unlink_or_warn(const char *filename) {<br>
&gt; + int access_fd(int fd, int mode) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Like access() but=
 operates on an already open fd */<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (faccessat(fd, &quot;&=
quot;, mode, AT_EMPTY_PATH) &gt;=3D 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (errno !=3D EINVAL)<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return -errno;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Support for AT_EMPTY_P=
ATH is added rather late (kernel 5.8), so fall back to going through /proc/=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * if unavailable. *=
/<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (access(FORMAT_PR=
OC_FD_PATH(fd), mode) &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; if (errno !=3D ENOENT)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 return -errno;<br>
<br>
You can either:<br>
- send a v2 with the missing justification for merging the patch<br>
- discuss it here first.<br>
<br>
Thanks,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_MAXP287MB42400FAAE639EB1BB682B5C0EE6E2MAXP287MB4240INDP_--
