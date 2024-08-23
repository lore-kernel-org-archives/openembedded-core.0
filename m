Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B042C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 08:41:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.11822.1724402459149990477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 01:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hN+fOet+;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f3f0bdbcd9so17903671fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724402457; x=1725007257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ORmP7qvZDVWzudk/y3r90EAi1KUyhyxMnX5QDiV5jw=;
        b=hN+fOet+ybZh246dY3Cckxw0bD6A7utwPkRJuhkjNdiZ9JPe2v9ugHr9A8MQKxBWXD
         zmFQGkMCDyb7oJ/2JyIyjPW2oMWkvtrhqq7CX1lRiuhgQ954yg4Tm9KJ/uiH56EN38Gd
         Ek+Ljfx2uRD9K5+LJquPEZcBMmx63n/mXNK/ttN0ghKSlG8Wl1KhhXgOAoJOThORv5XD
         dbRqU4MZ2OB32nYOrhk6OLfJtzg/iwca7P2Vd/Zb0nmJtnI7ZkkQMbCmYsWPOHtruseI
         UBCx0E1UD+X2XnPGIzg6gfc7FCbK5pT32FaFLlqChh11QabJeWZ/yyLfiy5mYlit1Tnn
         HV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724402457; x=1725007257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ORmP7qvZDVWzudk/y3r90EAi1KUyhyxMnX5QDiV5jw=;
        b=efAZzcBLXNio7K38Al8XfgCHvZ2MuIuprkkQznDCF3WkngBXgui49Y9cRgMYR78d5e
         DzpketZPf7nPfCbnslNEeMto3OWQRamWlx9AjOynsA03bji6wxB8LupeGBlT86pVaKQp
         +VmoukzFqEWD+hlEwy4lzaIw2mNZB9axpIXkz6YdGO5xCE2Y3BA5DSKnNw6P8bUUh5Ov
         y8wZjRuEaikrCakYMYrBwOldAMVtGOJaJsmleqm4Atd0SHjWpowuNTiB2K0ocfDMc1Mv
         aaW1ZB8LZzJ/U3jFKeaV0hBFa51UIj8VdETc5zNC1HlD2/mByNEZ2e0cJLmZ9WLA2aCc
         VOfw==
X-Gm-Message-State: AOJu0Yxu52fWOVYQfLaiS40CfkJ11445CbXcYKivsKO9ShfjBz4rK4iQ
	jjFyqAXknu/NyVpcdavDxpfwjCBuFBO0/UN2FYwcPkC+3ZVUCBPuEs9QusiVkxuNnKzteAZj7VR
	O8MMumQgmCHEtD8BiVxlbBDaCQUA=
X-Google-Smtp-Source: AGHT+IH9VaGKwI3CWBkeRfUPnHO1xj2WmeXM26gT72haDlkN913JzDmsBj7mYd2a3/Irwp1z+sXjgQwNqCEKL/xkYGo=
X-Received: by 2002:a05:6512:31c4:b0:533:32b4:ca6f with SMTP id
 2adb3069b0e04-53438785cabmr1034679e87.34.1724402456138; Fri, 23 Aug 2024
 01:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240823073825.135461-1-sdoshi@mvista.com>
In-Reply-To: <20240823073825.135461-1-sdoshi@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Aug 2024 10:40:44 +0200
Message-ID: <CANNYZj-aeO+aR7qtrZ-J8E31pOfKt6zD4hxkUXiTLyHbXz+d7g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] wpa-supplicant: Upgrade 2.10 -> 2.11
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 08:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203682

Updates like this are not eligible for stable branches. Please pay
attention to what Randy said.

Alex


On Fri, 23 Aug 2024 at 09:38, Siddharth Doshi via
lists.openembedded.org <sdoshi=mvista.com@lists.openembedded.org>
wrote:
>
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> License-Update:
> ===============
> - README: Change in copyright years as per https://w1.fi/cgit/hostap/commit/README?id=d945ddd368085f255e68328f2d3b020ceea359af
> - wpa_supplicant/wpa_supplicant.c: Change in copyright years as per https://w1.fi/cgit/hostap/commit/wpa_supplicant/wpa_supplicant.c?id=d945ddd368085f255e68328f2d3b020ceea359af
>
> CVE's Fixed:
> ===========
> - CVE-2024-5290 wpa_supplicant: wpa_supplicant loading arbitrary shared objects allowing privilege escalation
> - CVE-2023-52160 wpa_supplicant: potential authorization bypass
>
> Changes between 2.10 -> 2.11:
> ============================
> https://w1.fi/cgit/hostap/commit/wpa_supplicant/ChangeLog?id=d945ddd368085f255e68328f2d3b020ceea359af
>
> Note:
> =====
> Patche 0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch (CVE-2023-52160) is already fixed and hence removing it.
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  ...te-Phase-2-authentication-requiremen.patch | 213 ------------------
>  ...plicant_2.10.bb => wpa-supplicant_2.11.bb} |   7 +-
>  2 files changed, 3 insertions(+), 217 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
>  rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.10.bb => wpa-supplicant_2.11.bb} (92%)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
> deleted file mode 100644
> index bc2db972c3..0000000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
> +++ /dev/null
> @@ -1,213 +0,0 @@
> -From f6f7cead3661ceeef54b21f7e799c0afc98537ec Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <j@w1.fi>
> -Date: Sat, 8 Jul 2023 19:55:32 +0300
> -Subject: [PATCH] PEAP client: Update Phase 2 authentication requirements
> -
> -The previous PEAP client behavior allowed the server to skip Phase 2
> -authentication with the expectation that the server was authenticated
> -during Phase 1 through TLS server certificate validation. Various PEAP
> -specifications are not exactly clear on what the behavior on this front
> -is supposed to be and as such, this ended up being more flexible than
> -the TTLS/FAST/TEAP cases. However, this is not really ideal when
> -unfortunately common misconfiguration of PEAP is used in deployed
> -devices where the server trust root (ca_cert) is not configured or the
> -user has an easy option for allowing this validation step to be skipped.
> -
> -Change the default PEAP client behavior to be to require Phase 2
> -authentication to be successfully completed for cases where TLS session
> -resumption is not used and the client certificate has not been
> -configured. Those two exceptions are the main cases where a deployed
> -authentication server might skip Phase 2 and as such, where a more
> -strict default behavior could result in undesired interoperability
> -issues. Requiring Phase 2 authentication will end up disabling TLS
> -session resumption automatically to avoid interoperability issues.
> -
> -Allow Phase 2 authentication behavior to be configured with a new phase1
> -configuration parameter option:
> -'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
> -tunnel) behavior for PEAP:
> - * 0 = do not require Phase 2 authentication
> - * 1 = require Phase 2 authentication when client certificate
> -   (private_key/client_cert) is no used and TLS session resumption was
> -   not used (default)
> - * 2 = require Phase 2 authentication in all cases
> -
> -Signed-off-by: Jouni Malinen <j@w1.fi>
> -
> -CVE: CVE-2023-52160
> -Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=8e6485a1bcb0baffdea9e55255a81270b768439c]
> -
> -Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - src/eap_peer/eap_config.h          |  8 ++++++
> - src/eap_peer/eap_peap.c            | 40 +++++++++++++++++++++++++++---
> - src/eap_peer/eap_tls_common.c      |  6 +++++
> - src/eap_peer/eap_tls_common.h      |  5 ++++
> - wpa_supplicant/wpa_supplicant.conf |  7 ++++++
> - 5 files changed, 63 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/eap_peer/eap_config.h b/src/eap_peer/eap_config.h
> -index 3238f74..047eec2 100644
> ---- a/src/eap_peer/eap_config.h
> -+++ b/src/eap_peer/eap_config.h
> -@@ -469,6 +469,14 @@ struct eap_peer_config {
> -        * 1 = use cryptobinding if server supports it
> -        * 2 = require cryptobinding
> -        *
> -+       * phase2_auth option can be used to control Phase 2 (i.e., within TLS
> -+       * tunnel) behavior for PEAP:
> -+       * 0 = do not require Phase 2 authentication
> -+       * 1 = require Phase 2 authentication when client certificate
> -+       *  (private_key/client_cert) is no used and TLS session resumption was
> -+       *  not used (default)
> -+       * 2 = require Phase 2 authentication in all cases
> -+       *
> -        * EAP-WSC (WPS) uses following options: pin=Device_Password and
> -        * uuid=Device_UUID
> -        *
> -diff --git a/src/eap_peer/eap_peap.c b/src/eap_peer/eap_peap.c
> -index 12e30df..6080697 100644
> ---- a/src/eap_peer/eap_peap.c
> -+++ b/src/eap_peer/eap_peap.c
> -@@ -67,6 +67,7 @@ struct eap_peap_data {
> -       u8 cmk[20];
> -       int soh; /* Whether IF-TNCCS-SOH (Statement of Health; Microsoft NAP)
> -                 * is enabled. */
> -+      enum { NO_AUTH, FOR_INITIAL, ALWAYS } phase2_auth;
> - };
> -
> -
> -@@ -114,6 +115,19 @@ static void eap_peap_parse_phase1(struct eap_peap_data *data,
> -               wpa_printf(MSG_DEBUG, "EAP-PEAP: Require cryptobinding");
> -       }
> -
> -+      if (os_strstr(phase1, "phase2_auth=0")) {
> -+              data->phase2_auth = NO_AUTH;
> -+              wpa_printf(MSG_DEBUG,
> -+                         "EAP-PEAP: Do not require Phase 2 authentication");
> -+      } else if (os_strstr(phase1, "phase2_auth=1")) {
> -+              data->phase2_auth = FOR_INITIAL;
> -+              wpa_printf(MSG_DEBUG,
> -+                         "EAP-PEAP: Require Phase 2 authentication for initial connection");
> -+      } else if (os_strstr(phase1, "phase2_auth=2")) {
> -+              data->phase2_auth = ALWAYS;
> -+              wpa_printf(MSG_DEBUG,
> -+                         "EAP-PEAP: Require Phase 2 authentication for all cases");
> -+      }
> - #ifdef EAP_TNC
> -       if (os_strstr(phase1, "tnc=soh2")) {
> -               data->soh = 2;
> -@@ -142,6 +156,7 @@ static void * eap_peap_init(struct eap_sm *sm)
> -       data->force_peap_version = -1;
> -       data->peap_outer_success = 2;
> -       data->crypto_binding = OPTIONAL_BINDING;
> -+      data->phase2_auth = FOR_INITIAL;
> -
> -       if (config && config->phase1)
> -               eap_peap_parse_phase1(data, config->phase1);
> -@@ -454,6 +469,20 @@ static int eap_tlv_validate_cryptobinding(struct eap_sm *sm,
> - }
> -
> -
> -+static bool peap_phase2_sufficient(struct eap_sm *sm,
> -+                                 struct eap_peap_data *data)
> -+{
> -+      if ((data->phase2_auth == ALWAYS ||
> -+           (data->phase2_auth == FOR_INITIAL &&
> -+            !tls_connection_resumed(sm->ssl_ctx, data->ssl.conn) &&
> -+            !data->ssl.client_cert_conf) ||
> -+           data->phase2_eap_started) &&
> -+          !data->phase2_eap_success)
> -+              return false;
> -+      return true;
> -+}
> -+
> -+
> - /**
> -  * eap_tlv_process - Process a received EAP-TLV message and generate a response
> -  * @sm: Pointer to EAP state machine allocated with eap_peer_sm_init()
> -@@ -568,6 +597,11 @@ static int eap_tlv_process(struct eap_sm *sm, struct eap_peap_data *data,
> -                                          " - force failed Phase 2");
> -                               resp_status = EAP_TLV_RESULT_FAILURE;
> -                               ret->decision = DECISION_FAIL;
> -+                      } else if (!peap_phase2_sufficient(sm, data)) {
> -+                              wpa_printf(MSG_INFO,
> -+                                         "EAP-PEAP: Server indicated Phase 2 success, but sufficient Phase 2 authentication has not been completed");
> -+                              resp_status = EAP_TLV_RESULT_FAILURE;
> -+                              ret->decision = DECISION_FAIL;
> -                       } else {
> -                               resp_status = EAP_TLV_RESULT_SUCCESS;
> -                               ret->decision = DECISION_UNCOND_SUCC;
> -@@ -887,8 +921,7 @@ continue_req:
> -                       /* EAP-Success within TLS tunnel is used to indicate
> -                        * shutdown of the TLS channel. The authentication has
> -                        * been completed. */
> --                      if (data->phase2_eap_started &&
> --                          !data->phase2_eap_success) {
> -+                      if (!peap_phase2_sufficient(sm, data)) {
> -                               wpa_printf(MSG_DEBUG, "EAP-PEAP: Phase 2 "
> -                                          "Success used to indicate success, "
> -                                          "but Phase 2 EAP was not yet "
> -@@ -1199,8 +1232,9 @@ static struct wpabuf * eap_peap_process(struct eap_sm *sm, void *priv,
> - static bool eap_peap_has_reauth_data(struct eap_sm *sm, void *priv)
> - {
> -       struct eap_peap_data *data = priv;
> -+
> -       return tls_connection_established(sm->ssl_ctx, data->ssl.conn) &&
> --              data->phase2_success;
> -+              data->phase2_success && data->phase2_auth != ALWAYS;
> - }
> -
> -
> -diff --git a/src/eap_peer/eap_tls_common.c b/src/eap_peer/eap_tls_common.c
> -index c1837db..a53eeb1 100644
> ---- a/src/eap_peer/eap_tls_common.c
> -+++ b/src/eap_peer/eap_tls_common.c
> -@@ -239,6 +239,12 @@ static int eap_tls_params_from_conf(struct eap_sm *sm,
> -
> -       sm->ext_cert_check = !!(params->flags & TLS_CONN_EXT_CERT_CHECK);
> -
> -+      if (!phase2)
> -+              data->client_cert_conf = params->client_cert ||
> -+                      params->client_cert_blob ||
> -+                      params->private_key ||
> -+                      params->private_key_blob;
> -+
> -       return 0;
> - }
> -
> -diff --git a/src/eap_peer/eap_tls_common.h b/src/eap_peer/eap_tls_common.h
> -index 9ac0012..3348634 100644
> ---- a/src/eap_peer/eap_tls_common.h
> -+++ b/src/eap_peer/eap_tls_common.h
> -@@ -79,6 +79,11 @@ struct eap_ssl_data {
> -        * tls_v13 - Whether TLS v1.3 or newer is used
> -        */
> -       int tls_v13;
> -+
> -+      /**
> -+       * client_cert_conf: Whether client certificate has been configured
> -+       */
> -+      bool client_cert_conf;
> - };
> -
> -
> -diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_supplicant.conf
> -index 6619d6b..d63f73c 100644
> ---- a/wpa_supplicant/wpa_supplicant.conf
> -+++ b/wpa_supplicant/wpa_supplicant.conf
> -@@ -1321,6 +1321,13 @@ fast_reauth=1
> - #      * 0 = do not use cryptobinding (default)
> - #      * 1 = use cryptobinding if server supports it
> - #      * 2 = require cryptobinding
> -+#     'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
> -+#     tunnel) behavior for PEAP:
> -+#      * 0 = do not require Phase 2 authentication
> -+#      * 1 = require Phase 2 authentication when client certificate
> -+#        (private_key/client_cert) is no used and TLS session resumption was
> -+#        not used (default)
> -+#      * 2 = require Phase 2 authentication in all cases
> - #     EAP-WSC (WPS) uses following options: pin=<Device Password> or
> - #     pbc=1.
> - #
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> similarity index 92%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> index 70f1fd6fc9..8b6bbf50eb 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> @@ -5,8 +5,8 @@ BUGTRACKER = "http://w1.fi/security/"
>  SECTION = "network"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
> -                    file://README;beginline=1;endline=56;md5=e3d2f6c2948991e37c1ca4960de84747 \
> -                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=76306a95306fee9a976b0ac1be70f705"
> +                    file://README;beginline=1;endline=56;md5=6e4b25e7d74bfc44a32ba37bdf5210a6 \
> +                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=f5ccd57ea91e04800edb88267bf8eae4"
>  DEPENDS = "dbus libnl"
>  RRECOMMENDS:${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
>
> @@ -25,9 +25,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
>             file://wpa_supplicant.conf \
>             file://wpa_supplicant.conf-sane \
>             file://99_wpa_supplicant \
> -           file://0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch \
>             "
> -SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
> +SRC_URI[sha256sum] = "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a"
>
>  CVE_PRODUCT = "wpa_supplicant"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203680): https://lists.openembedded.org/g/openembedded-core/message/203680
> Mute This Topic: https://lists.openembedded.org/mt/108052523/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

