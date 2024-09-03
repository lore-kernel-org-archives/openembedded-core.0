Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126C9CD3439
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18360.1725352402317415239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P7Vbquqa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352403; x=1756888403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jQCCE9517iF0anvWFvJ9ODMgZ+MfUV7kgIbMCja60EI=;
  b=P7VbquqawJTG5pkZovoFXDtKtmfPxd48fUPbR53g9qUDCk0bqKIiho8Z
   aITXKrWv5CO9AkM7kG+Dw7XlpMZRrvHTz2P+FCQq3nAlssTAxP6GWgh53
   mI9J+NVvLzh8H2zCTq88CwnSgmSmIaFLlQAPIsgOHewWAXM4B8mo/CVOL
   lqEyYOqLUJRnZvtF3w11pnAnyb+T/bACSzwvKM4u3FC/jizvByfkGdg5/
   SpT5uRXNx/r4yrFwgN4hsdFh977D+lw8K/L9UkT1vyX12Za8J9Q7frD9Y
   zgzbJ4/0/fDoR4xNdH9ut0FKQ56M33O89MQHDOZjQ4VW9wcEZsddOi+zT
   Q==;
X-CSE-ConnectionGUID: g3rSvVgkS32rXI//wt/VZA==
X-CSE-MsgGUID: jm47BAxxSiaafbZa6gTVgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172503075"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172503075"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AAEDD9223
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4952ABF3D5
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C77C820076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A7BF1A000C;
	Tue,  3 Sep 2024 16:33:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/22] python3-maturin: upgrade 1.7.0 -> 1.7.1
Date: Tue,  3 Sep 2024 16:32:53 +0800
Message-Id: <1725352379-20334-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--4.267900-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yUIIxwDaU5mrlKvhkP88iXR4YeSlHZYFotGl
	DYMH8cZuNlKrnI9GBJ9WZgWUbHKAlNz4cH5hW96YOWUWxTQJdI8xXH/dlhvLv8ay5jJvrxqMLVY
	Y83vl20hl+KZhG9Ijo6TNRLrbhUf/ZJ1hIL54yNiqFx2c/3V5cf/Ukuwze0bGlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDTCj6xe3SueziNxSV//57l8nA40J9kLE2tY/h
	gbdWWH6U8fyWPx9FHJQlSJ+ulgblnK+lhBQEvictKR5FXfbysxKuILn2p0SMhJsfwlIUVdBurrp
	3QW/h5QpR9OHH3uHw4XkloZ6eO7v6WZ8G/zxUhOeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKpv
	EGAbTDrMQYnquh+fSm/9ByXEhUl/UujMPGR34U6iL7s4uMyGwdyGDm3nfL/JtBsxalwOFrsaiNz
	XiLLBnR0Tio7q42iFLQi3Buf1ssoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204144

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
=========
- Update clap_complete_command to v0.6.1
- Fix platform tags when cross-compiling universal2
- Fix Typo in Migration Guide
- Fix rust 1.80 clippy errors
- Don't check .gitignore files in parent directories
- Replace --skip-auditwheel with --auditwheel option
- Remove install_requires and setup_requires from setup.py
- Use modern stripping option
- Move project metadata from setup.py to pyproject.toml
- Update manylinux/musllinux policies to the latest main
- use just licenses as the license directory in a wheel
- Forward cargo package --list warnings
- Add current package context to source dist error
- Place source dist readmes next to Cargo.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-maturin-crates.inc         | 36 +++++++++----------
 ...urin_1.7.0.bb => python3-maturin_1.7.1.bb} |  2 +-
 2 files changed, 19 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.7.0.bb => python3-maturin_1.7.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index d69e60303d..1e1b573b91 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -36,7 +36,7 @@ SRC_URI += " \
     crate://crates.io/cargo-zigbuild/0.18.4 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cbindgen/0.26.0 \
-    crate://crates.io/cc/1.0.104 \
+    crate://crates.io/cc/1.1.6 \
     crate://crates.io/cfb/0.9.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/charset/0.1.3 \
@@ -44,8 +44,8 @@ SRC_URI += " \
     crate://crates.io/clap/4.5.7 \
     crate://crates.io/clap_builder/4.5.7 \
     crate://crates.io/clap_complete/4.5.5 \
-    crate://crates.io/clap_complete_command/0.5.1 \
-    crate://crates.io/clap_complete_nushell/0.1.11 \
+    crate://crates.io/clap_complete_command/0.6.1 \
+    crate://crates.io/clap_complete_nushell/4.5.2 \
     crate://crates.io/clap_derive/4.5.5 \
     crate://crates.io/clap_lex/0.7.1 \
     crate://crates.io/cli-table/0.4.7 \
@@ -154,10 +154,10 @@ SRC_URI += " \
     crate://crates.io/num_enum_derive/0.7.2 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/openssl/0.10.64 \
+    crate://crates.io/openssl/0.10.66 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.1.5 \
-    crate://crates.io/openssl-sys/0.9.102 \
+    crate://crates.io/openssl-sys/0.9.103 \
     crate://crates.io/option-ext/0.2.0 \
     crate://crates.io/os_pipe/1.2.0 \
     crate://crates.io/overload/0.1.1 \
@@ -165,8 +165,8 @@ SRC_URI += " \
     crate://crates.io/parking_lot_core/0.9.10 \
     crate://crates.io/paste/1.0.15 \
     crate://crates.io/path-slash/0.2.1 \
-    crate://crates.io/pep440_rs/0.5.0 \
-    crate://crates.io/pep508_rs/0.4.2 \
+    crate://crates.io/pep440_rs/0.6.0 \
+    crate://crates.io/pep508_rs/0.6.0 \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/pin-project-lite/0.2.14 \
     crate://crates.io/pin-utils/0.1.0 \
@@ -180,7 +180,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro-crate/3.1.0 \
     crate://crates.io/proc-macro2/1.0.85 \
     crate://crates.io/psm/0.1.21 \
-    crate://crates.io/pyproject-toml/0.10.0 \
+    crate://crates.io/pyproject-toml/0.11.0 \
     crate://crates.io/python-pkginfo/0.6.2 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/quoted_printable/0.5.0 \
@@ -244,7 +244,7 @@ SRC_URI += " \
     crate://crates.io/syn/1.0.109 \
     crate://crates.io/syn/2.0.66 \
     crate://crates.io/tar/0.4.41 \
-    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/target-lexicon/0.12.15 \
     crate://crates.io/tempfile/3.10.1 \
     crate://crates.io/termcolor/1.4.1 \
     crate://crates.io/terminal_size/0.3.0 \
@@ -366,7 +366,7 @@ SRC_URI[cargo-xwin-0.16.5.sha256sum] = "471f6fff351fc5ab837ce7223637f7c20048e4a8
 SRC_URI[cargo-zigbuild-0.18.4.sha256sum] = "65004153e67ac23be88a8e244304a872d727b2aa08654dcabfbecd1fdea4a488"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cbindgen-0.26.0.sha256sum] = "da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49"
-SRC_URI[cc-1.0.104.sha256sum] = "74b6a57f98764a267ff415d50a25e6e166f3831a5071af4995296ea97d210490"
+SRC_URI[cc-1.1.6.sha256sum] = "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
 SRC_URI[cfb-0.9.0.sha256sum] = "b390793e912300f1aa713429f7fd0c391024e6c18b988962558bc4f96a349b1f"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[charset-0.1.3.sha256sum] = "18e9079d1a12a2cc2bffb5db039c43661836ead4082120d5844f02555aca2d46"
@@ -374,8 +374,8 @@ SRC_URI[chumsky-0.9.3.sha256sum] = "8eebd66744a15ded14960ab4ccdbfb51ad3b81f51f3f
 SRC_URI[clap-4.5.7.sha256sum] = "5db83dced34638ad474f39f250d7fea9598bdd239eaced1bdf45d597da0f433f"
 SRC_URI[clap_builder-4.5.7.sha256sum] = "f7e204572485eb3fbf28f871612191521df159bc3e15a9f5064c66dba3a8c05f"
 SRC_URI[clap_complete-4.5.5.sha256sum] = "d2020fa13af48afc65a9a87335bda648309ab3d154cd03c7ff95b378c7ed39c4"
-SRC_URI[clap_complete_command-0.5.1.sha256sum] = "183495371ea78d4c9ff638bfc6497d46fed2396e4f9c50aebc1278a4a9919a3d"
-SRC_URI[clap_complete_nushell-0.1.11.sha256sum] = "5d02bc8b1a18ee47c4d2eec3fb5ac034dc68ebea6125b1509e9ccdffcddce66e"
+SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
+SRC_URI[clap_complete_nushell-4.5.2.sha256sum] = "1accf1b463dee0d3ab2be72591dccdab8bef314958340447c882c4c72acfe2a3"
 SRC_URI[clap_derive-4.5.5.sha256sum] = "c780290ccf4fb26629baa7a1081e68ced113f1d3ec302fa5948f1c381ebf06c6"
 SRC_URI[clap_lex-0.7.1.sha256sum] = "4b82cf0babdbd58558212896d1a4272303a57bdb245c2bf1147185fb45640e70"
 SRC_URI[cli-table-0.4.7.sha256sum] = "adfbb116d9e2c4be7011360d0c0bee565712c11e969c9609b25b619366dc379d"
@@ -484,10 +484,10 @@ SRC_URI[num_enum-0.7.2.sha256sum] = "02339744ee7253741199f897151b38e72257d13802d
 SRC_URI[num_enum_derive-0.7.2.sha256sum] = "681030a937600a36906c185595136d26abfebb4aa9c65701cefcaf8578bb982b"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[openssl-0.10.64.sha256sum] = "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
+SRC_URI[openssl-0.10.66.sha256sum] = "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.1.5.sha256sum] = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
-SRC_URI[openssl-sys-0.9.102.sha256sum] = "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
+SRC_URI[openssl-sys-0.9.103.sha256sum] = "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
 SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
 SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
@@ -495,8 +495,8 @@ SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf
 SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
 SRC_URI[paste-1.0.15.sha256sum] = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
 SRC_URI[path-slash-0.2.1.sha256sum] = "1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42"
-SRC_URI[pep440_rs-0.5.0.sha256sum] = "15efd4d885c29126cc93e12af3087896e2518bd5ca0fb328c19c4ef9cecfa8be"
-SRC_URI[pep508_rs-0.4.2.sha256sum] = "1455babf8edd3eedcdfcb39700e455a4bb189e71b4f1fa0eacc9b244cc5a55e6"
+SRC_URI[pep440_rs-0.6.0.sha256sum] = "ca0a570e7ec9171250cac57614e901f62408094b54b3798bb920d3cf0d4a0e09"
+SRC_URI[pep508_rs-0.6.0.sha256sum] = "581c27e97a3f38c5d691962af7da93c2672b5227d59cf165b87a9b1fd53dd724"
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[pin-project-lite-0.2.14.sha256sum] = "bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d1aaa6923f45801bdd02"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
@@ -510,7 +510,7 @@ SRC_URI[pretty_assertions-1.4.0.sha256sum] = "af7cee1a6c8a5b9208b3cb1061f10c0cb6
 SRC_URI[proc-macro-crate-3.1.0.sha256sum] = "6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284"
 SRC_URI[proc-macro2-1.0.85.sha256sum] = "22244ce15aa966053a896d1accb3a6e68469b97c7f33f284b99f0d576879fc23"
 SRC_URI[psm-0.1.21.sha256sum] = "5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874"
-SRC_URI[pyproject-toml-0.10.0.sha256sum] = "3b80f889b6d413c3f8963a2c7db03f95dd6e1d85e1074137cb2013ea2faa8898"
+SRC_URI[pyproject-toml-0.11.0.sha256sum] = "ef7061023bcb58a0fc4a4bbe9819c13b0dca7c2abc14da14f5ecc1532ab3a36a"
 SRC_URI[python-pkginfo-0.6.2.sha256sum] = "4320ca452fe003f8a07afb8e30c315bbd813ae8105f454ddefebf15a24021e1f"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[quoted_printable-0.5.0.sha256sum] = "79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0"
@@ -574,7 +574,7 @@ SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
 SRC_URI[syn-2.0.66.sha256sum] = "c42f3f41a2de00b01c0aaad383c5a45241efc8b2d1eda5661812fda5f3cdcff5"
 SRC_URI[tar-0.4.41.sha256sum] = "cb797dad5fb5b76fcf519e702f4a589483b5ef06567f160c392832c1f5e44909"
-SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[target-lexicon-0.12.15.sha256sum] = "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
 SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.7.0.bb b/meta/recipes-devtools/python/python3-maturin_1.7.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.7.0.bb
rename to meta/recipes-devtools/python/python3-maturin_1.7.1.bb
index 779a66840e..1a8581e594 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.7.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "1ba5277dd7832dc6181d69a005182b97b3520945825058484ffd9296f2efb59c"
+SRC_URI[sha256sum] = "147754cb3d81177ee12d9baf575d93549e76121dacd3544ad6a50ab718de2b9c"
 
 S = "${WORKDIR}/maturin-${PV}"
 
-- 
2.34.1


