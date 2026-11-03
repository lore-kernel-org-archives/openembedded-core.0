Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7216.1793698094554339183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ngxOVW55;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPe8LtQOZz1vrT3McAQ0PV31g8T45vWoUDX1v5yI8vsigvia1FKhF4RyEE22FoO0XJSFXmcBsP7TiyePANbk4RW6NKHX2ijLHPrIrgClGSo1RvtpLAJ08ZozK+BSv9XSbkmZn4c7WEAckIQofL9FmGHEyCdrUkwX37/WYmELcC2jbVWb7e+c4EISHMmaFpyUFN0X4ZBPcAb+0ZBPqh6D9JID5KJc4HwPvhwr61uJXC3YwL4pv2dOw/xSaL+Slz9DAErZ99x1gaYkcqBClU8ARAHU2+BK2PwLmS3IqFYbZPaREr5aG9hE9UwNhBFrNGOWJdSJ486r5klQuDQjS0wFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/NBHyqKrpNN9iFt5ykpv9TZSVlKn7ndePD96WfT2Lw=;
 b=jhYNrc612qJCpsH2mHs5sWutkUk1TPgQ5nuClrvN7ZsOS0CHUNHvzxWF7q/wDCqO9zEcoLeWFW4pOvHA/VJvkKdaBVYtxBW0dBAWZ3Py+S9sp918M/1CGu68l59ILXGDc9qomyfu0ShJj4uQRkbPPiU3rAlyVWpCgjD4vkvJ6mkfOmH4jfXZUDTNW6WlbdkNQ91zK177hVmLRPBrioWOimWRCAZ0IkcAhmAVK2GvEMmv1BpIVFy6++YCKGxQjV0GY9S+nTCN0ZrhJh2/G0Ju+hs3e/YcOp0LzVdP4mWXWCyPWJ1IacoB+f/DFLGl+O0UG9faZaTuZ5HYi3uENj1ciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/NBHyqKrpNN9iFt5ykpv9TZSVlKn7ndePD96WfT2Lw=;
 b=ngxOVW55dMq4N6nZm6albbZih1X5j7qbyY9rBthYOQA5LI2TX7+EBPt++GSP/L0dfBn30umWhZf4YvPWgx3Yjlrrap7b69GL+01TQoMHq3UEAhiJkJJqhdI40/p0IootThQxucl3KCInsYRa+zToEbVkX+nZFpZz2FqEqhHJacsIiI4F0RHEZchja3scYdpryVposRXgk6yW6kMpKVe9+gaPF6J0nRA0ETq8cdr8kVQzrT9YrVZc3sY77tkEX9qf6Ynh9BL0bBGyyxpHnbEMofrIQVyddKApz6i5GPw6DPeE2Oa9d3jTNfepbHBEJLFXLpRrdzs/fizU63Lwd4I8BA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:15 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] python3-pip: upgrade 26.2.2 -> 26.3
Date: Tue,  3 Nov 2026 10:27:56 +0100
Message-ID: <20261103092800.39286-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: bff7453e-4f89-4ffc-77eb-08df398cc95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|261022075727099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022113327099003|261022115727099003|261022105027099003|261021133027099003|261021130227099003|261021135927099003|261009223027099003|261026121527099003|261026135527099003|261026130827099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: AL8+QdlFFl10KbyHkBhEQMBgzBehQTxJCmtLZcD1cBhWmRYnyFIJDyMgwYmf1hVXtg4XvsoCargBE3T6lOFN+fIgWkh7VV/zyhgoXwK8+H0qHmJGGla+7BzUzU78rF727VFI02/6k6QDbq10U+Psl3UdHQB4ccG+drL33XE2vHKG0OFSQdXeHljrvQ2EYwV+dQIcuRnN52N7rF7mKUPxE1q62EfdRaEIN6zGoq11Dsux3zaw9tmJYeOw1Nti0SzM7ZQfvI0hriSe/JAFkFk0rqjxfjBKO6WnSOJD/PrlyGLa9N9KRYnXD9cR7XpeNVtjxC8NAI4bqdmfVw5Rhs8G3UONxEPAvvzCU/8X2R6K35LD4fAw08eduW2f5h38tivQIjsfBXP+T3LkVzP1YPo642mwhqGPlyP8hLc+JSkNaC4x6BH1ZOltWHXx81x+k8+7GL7DOjlMh5FdjNFOar3Fvk0wgoGWtht3Okcx6uATnkIluDRduaeHeW9v/innHXCIZda6dnSQ8Gu7ERJoExpjchI09j3nxtc16RXhcsW10e8C5sn3KrUsceLjGClCpDSz/RieRYNHG75qOGsLUnHz4eIR9OB9gvoGQA8tWzlGaZlpoFY5QiL97t88PlpfiRcleJHyMwK5AP6n/oJoO64W0pQ5uL3J6LtXHw3jrUsCuhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(261022075727099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022115727099003)(261022105027099003)(261021133027099003)(261021130227099003)(261021135927099003)(261009223027099003)(261026121527099003)(261026135527099003)(261026130827099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u5SGV7phQGlwwfJuBdpPEDuKmJhQNyTM9uyxSi9YCw+eZmEXndhBreczjZya?=
 =?us-ascii?Q?kcm+c59VLrA+vFUHHSs3Buvlwu3LYJfkKIZEMlBSQJlQXHgbOYlchy/8ZFkd?=
 =?us-ascii?Q?4sKxc+PtbaOyeooA+HTpZwHYo6eAYCtcu2999bGXh1+oqGUzA1kzIqABvCU7?=
 =?us-ascii?Q?i0u5KPja6Cgt76Ol/5YHcGJ6YYsqLfGRsREppZdBEmzxcN5VUfQHey1YY7QL?=
 =?us-ascii?Q?gXzHma0j0kyYZQnQzs42YnOfzpzmfD0c99ajRMBGG8zyWMH9a3uaetDwhofA?=
 =?us-ascii?Q?Jw7gUHGGdn/619ga8fW+7FEcdE7Yqatp7d7YzKdQXQs78dWrGQln/5ElZNc7?=
 =?us-ascii?Q?JayGAan1fFzQm1yDlQfkIry08YvIvr0TPg0iWGIoHDGJ/ZFT7OM5a0MlcUN+?=
 =?us-ascii?Q?q7vcfMGKi5MA5G4/kXTP3AQ7C9jcnXEGJY/m/TNXogxcvxD7ZJSfSfFG+kbQ?=
 =?us-ascii?Q?Ifg7NbTa9T5/ss6+oZgur2Rs12nfh8h2fRYv27G3/l0ksYR9x1NPGWjoQ5+1?=
 =?us-ascii?Q?hUOWxPhxZjo0wx84BXhrhu26w6fwxl4TP/tSl4IeZXzDCmttqDGx3+VD7InD?=
 =?us-ascii?Q?BE9D+xMkGMlBNMZCClzYswpHnJjN3BobOPI15oqvQ9uKoxWZMjODH6zvpGS9?=
 =?us-ascii?Q?lHkGcD4FKl7dHbVegixNMmGGb+9C8kHvXTKiBxUI8XChJWNJUlcd2+Xa9pw/?=
 =?us-ascii?Q?D1bkdufDLRvgRMjPBdf2VjUbBUmRt40286LOJTme5bdnMawezZ6xewLue8QX?=
 =?us-ascii?Q?+FCm+pxi4wNAaGB5NY8dXhuhMhKEHlCu+m1mp5ODGwugxUlWjzDq9PCaiWTM?=
 =?us-ascii?Q?9g0oLC86V0d36HcQl8FCoNDgL8qy9xAhMVEHpwQRWt2BBsm1bvUyz5z+wDdO?=
 =?us-ascii?Q?pr9QEmSMba40T7ygfgfhDtJnJGbH8L7O4bypD4u2JkGQlT0KM05QCWcJ/UOM?=
 =?us-ascii?Q?JYW085dm2VqeVf2kG6/kIfFWdHiaqVIIg8ZLfI0t8QIul3VEcXmLuWyFjWK/?=
 =?us-ascii?Q?qx/6fOd9S31feSw0giZbzfxuVACztTV2rXTTZcq+JW2JP5a2wTsRq7iFh0Mj?=
 =?us-ascii?Q?6bn4MT/zSizrs9E5Zq62nm9gHG9SfNzAFqN6uhqgEsuMqKLjvqaOJMxp2EmX?=
 =?us-ascii?Q?AahfZDupC000YJLNktUoleWu6PkCMQdiEHRiIZIRkLDGFlqLqE2QRSRlibeC?=
 =?us-ascii?Q?HPGTRjSSO4TyRB+Y4Ibekinej5sMcxqICYOPjosF/xzXckMHH4ISMXSpAngF?=
 =?us-ascii?Q?a+cDg+XvX0CZoXfaUDpYKI7GHOgKLpEG526tbH04RIAVV2NqlpLkZ9RaU4D/?=
 =?us-ascii?Q?Ap51kmmrohy1Ur6IiexQHbmZdFPEqvAuQ6hfxfBQnPUAX1kNBC5gWtpKrSVb?=
 =?us-ascii?Q?zpmBd8omJA2DC2meZGjT8POVyvuC3VpSlcmQRyFKRdLpFfeyV99VR6hyhnr6?=
 =?us-ascii?Q?x/gPql0mCROwKPYZk91zqx/dmUw+Z07quWe9hGvZLyPqu0BUBfDNOaDc3pjD?=
 =?us-ascii?Q?+/QlWqjQAB+YkDoskhMdqxdt4xQErwEoNOd7k6FcN1EjD8y5QOjKz+9EIS5m?=
 =?us-ascii?Q?B3bgKMCkeo4Ne4FzB9pUZj9OXAnCnNw16hI6PlvowT/vzYDEuJXAXbdY8lGm?=
 =?us-ascii?Q?iMeGFkI4yej9UXeHhIEzbwrYYT6bqvjGqapqXQpib8ncdbMaNqChp8i4YNfZ?=
 =?us-ascii?Q?eckvrtkDftctacaqFGdGr/If9ryV7zUR0fs0jJGXq/HDpds29bvsFDPxu7Pg?=
 =?us-ascii?Q?UWM2+Elt6Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bff7453e-4f89-4ffc-77eb-08df398cc95f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:14.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ci1E8//VKwjikxyCwiNEtBwH1x/SoK7pVhELNRQnsRkJFTsHzg7R7bzVno0DURAz0Z/6HhRLRI7nXGQ4uER8AwvoV+vIXsZU3groNAJmgEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249261
Content-Type: text/plain; charset="utf-8"

26.3 (2026-11-02)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Improved Documentation
----------------------

- Clarify in the security policy that pip has never considered installing
  untrusted wheels safe. This is because Python's import system is dynamic,=
 so
  pip cannot guarantee that installing a wheel will not execute third-party
  code. (`#14412 < >`_)

Deprecations and Removals
-------------------------

- Block unexpected imports during installation, warn about unsafe imports
  afterward, and improve recovery from interrupted installations. (`#13842 =
<
  >`_)

Features
--------

- Show build backend warnings for local source directories and log them at =
debug
  level for other sources. (`#14372 < >`_)
- Add support for selecting extras in pylock.toml files with ``-r
  pylock.toml[extra1,extra2]``. (`#14205 < >`_)
- Allow ``--group`` to select non-default groups from local pylock files,
  e.g. ``--group pylock.toml:docs``. (`#14390 < >`_)
- Support ``--no-binary`` with ``-r pylock.toml``. Before, pip would get th=
e
  sdist from the index instead of the locked URL, or fail if no wheel were
  available in the lock file. (`#14187 < >`_)
- Speed up installing a wheel with console scripts by not resolving every
  ``PATH`` entry. (`#14235 < >`_)
- Clarify the warning for ``~``-prefixed leftover distribution directories.
  (`#11849 < >`_)

Bug Fixes
---------

- Report build-backend import failures as pip errors instead of displaying =
an
  uncaught traceback. (`#12248 < >`_)
- No longer log the "pip is looking at multiple versions of a package" mess=
age
  until pip has looked at at least two versions of that package. (`#12928 <=
 >`_)
- Fix ``pip``'s self version check reporting an outdated version from the
  environment instead of the running pip when run as a zipapp. (`#13084 < >=
`_)
- Fix a fatal error when using the ``PIP_CONFIG_FILE`` environment variable=
 with
  ``pip config set``. (`#13279 < >`_)
- Avoid misleading error messages that include extra markers such as
  ``; extra =3D=3D "..."`` when installing packages. (`#13618 < >`_)
- When installing to a custom ``--prefix``, use the ``posix_prefix`` scheme
  when running from a Debian patched Python distribution to avoid a superfl=
uous
  ``/local/`` subdirectory. (`#13634 < >`_)
- Refuse to follow an HTTP redirect to a ``file:`` URL. (`#14171 < >`_)
- Prevent wheel cache origin mismatch warnings from exposing URL credential=
s.
  (`#14232 < >`_)
- Report the incomplete-download error on Windows, not a ``PermissionError`=
`.
  (`#14237 < >`_)
- Fix the global configuration location on macOS in virtual environments cr=
eated
  from Homebrew Python. (`#14303 < >`_)
- Reject extra arguments to ``pip config edit`` instead of silently ignorin=
g
  them. (`#14347 < >`_)
- Honor supplied hashes when using ``--no-require-hashes``. (`#14355 < >`_)
- Fix wheel installation with data files when the installation prefix is a
  filesystem root. (`#14358 < >`_)
- Restore support for UTF-8 configuration files when Python's UTF-8 mode is
  enabled. (`#14367 < >`_)
- Restore vendored Requests' PyOpenSSL fallback on non-Windows systems with=
out
  importing PyOpenSSL on Windows. (`#14402 < >`_)
- Respect configured network settings while checking build constraint files=
.
  (`#14403 < >`_)
- Apply PyPI's direct URL dependency restriction to extras and cached wheel=
s.
  (`#14341 < >`_)
- Fix a crash when installing or uninstalling a distribution with an invali=
d
  entry point. (`#8573 < >`_)
- Fail with a clearer error message on invalid configuration values. (`#867=
1 <
  >`_)
- Keep ``--version`` available only for pip and prevent its use in subcomma=
nds.
  (`#9456 < >`_)

Vendored Libraries
------------------

- Upgrade certifi to 2026.10.23
- Upgrade distlib to 0.4.4
- Upgrade idna to 3.20
- Upgrade msgpack to 1.2.4
- Upgrade packaging to 26.3
- Upgrade platformdirs to 4.12.4
- Upgrade pygments to 2.21.0
- Upgrade pyproject-hooks to 1.3.3
- Upgrade rich to 15.0.0
- Downgrade tomli to 2.3.2 to retain TOML 1.0 parsing on Python 3.10.
- Upgrade truststore to 0.10.5
- Upgrade urllib3 to 2.8.0

Process
-------

- Allow pip itself to be built with flit-core 4.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-pip/no_shebang_mangling.patch            | 6 +++---
 .../python/{python3-pip_26.2.2.bb =3D> python3-pip_26.3.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.2.2.bb =3D> python3-pi=
p_26.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.p=
atch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index f388928230..998d8a73cf 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From ea75b7fc017f7a1a3a47e9e2bef21209f0f36a04 Mon Sep 17 00:00:00 2001
+From 717c440db8787fda9fb2abf207fe894e291ce0f0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/=
scripts.py
-index ac9e909..1faa5b6 100644
+index 0338012..64b00a2 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
 @@ -157,6 +157,8 @@ class ScriptMaker(object):
@@ -25,7 +25,7 @@ index ac9e909..1faa5b6 100644
          if os.name !=3D 'posix':
              simple_shebang =3D True
          elif getattr(sys, "cross_compiling", False):
-@@ -367,7 +369,7 @@ class ScriptMaker(object):
+@@ -373,7 +375,7 @@ class ScriptMaker(object):
                  return
 =20
              match =3D FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\=
n'))
diff --git a/meta/recipes-devtools/python/python3-pip_26.2.2.bb b/meta/reci=
pes-devtools/python/python3-pip_26.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.2.2.bb
rename to meta/recipes-devtools/python/python3-pip_26.3.bb
index c83c9e4468..a6ce6a1fbc 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.3.bb
@@ -26,7 +26,7 @@ inherit pypi python_flit_core
=20
 SRC_URI +=3D "file://no_shebang_mangling.patch"
=20
-SRC_URI[sha256sum] =3D "3a8e5c800492787f33a4114ef54444546c340df428974ebba1=
7e0fd47e11af2f"
+SRC_URI[sha256sum] =3D "6c36ae7da8695be67e3cd9f7d87919667ced53f57ce2ede75d=
89b5912ed2bc4c"
=20
 CVE_PRODUCT =3D "pypa:pip"
=20
