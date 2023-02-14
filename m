Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67827C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:22:35 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.11543.1676391744774812475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wGJDQGtO;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id t24so1157115eji.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iLKk2ay7ACyo9Ewb+YXG/G4XnqIGX11nRn/lt0WEZWA=;
        b=wGJDQGtOdwNkfOUhkQJ5Xbmjk3mvL/cYlE8Rlmt/joGML6WqLhPQLOicSHravqvNOL
         5pFchA23mjWHMj+f/IMqCUh7U3kb6VkkQ60qY9xTH/cHOLHPVxFc7RYee3EpPMrOFUso
         seq5GV4rpOfQQfzfYN3bufYV9qwhzCWG+SoHvzt8TJMgul2FI5bYhsstSyatI3uZfgsB
         viF4qDYjs1RWMHm5iUgRObJ72df2LAsrW6pv9PiF8s9hhZKMDVvz6nhEnXjhCyi7vv4J
         +odXSo/5YoOEPlpZThOLsMmd045EGJBvIydSo014c1mx/PEUH7F3LfVSioOmm5reODYi
         wVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLKk2ay7ACyo9Ewb+YXG/G4XnqIGX11nRn/lt0WEZWA=;
        b=XlpFSU1fpnCDXdeB/5OmjsB1D62xLFqk74mSXMIBXSNnpTu8BAR6hOgDBaaBwE3i+Z
         hz9pGfjKln0bD+8j0ydgIqWWE6z7isX1rCCaPyqruTIn2bz0E7pJ+rnUa1uAnTO0Jyg1
         9zOkYJKpImeZzeUdmnY4xq6kLsRlDTDdLbNPLOnn5+nVDCyFwBYur7NlF3JyrZgpJ9SD
         tDPbIfRepbqcNur946F2JAwRUNtdGRAiaLgrZ9TFc0rm6qx6M881Wqh1BtbDyod8IPAq
         1w81Lm/2cvxDcfSajVOdRgP0q0MD9M2teQo1/5zUknrd+P2TlqJexKHSR7qcUc9eiqxL
         grsw==
X-Gm-Message-State: AO0yUKWDcWS98Hd0JAILrt9cRVlzu5dksx7t0W9DhNQVpfogjzm2k1c/
	SuKO3QNCta6VcbFEi28KROuETLMgzTWFozesC7BGsxf2+W4+Za84
X-Google-Smtp-Source: AK7set+OPNyseupv1btj7QqhP1F2l5Kn39ww2J8GxjeX4RjqKEhJGj8wb8rb8LCxu/W3jpfiF35LqwNPognu+lWQ41I=
X-Received: by 2002:a17:906:7811:b0:8ae:96f5:fbb0 with SMTP id
 u17-20020a170906781100b008ae96f5fbb0mr1697986ejm.7.1676391742229; Tue, 14 Feb
 2023 08:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20230213055043.15294-1-kai.kang@windriver.com>
In-Reply-To: <20230213055043.15294-1-kai.kang@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Feb 2023 06:22:11 -1000
Message-ID: <CAOSpxdY3vz2p083y=5gUzFcYSS6DpafGN=qNtS_9sP+Nip90pw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 0/1] Update webkitgtk to 2.38.4 for CVEs
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177154

Stable branch policy doesn't allow this type of version upgrade.  I
can only take upgrades that are strict bug/security fix only releases.

Exceptions to the policy would require TSC approval.

Best regards,

Steve

On Sun, Feb 12, 2023 at 7:50 PM Kai Kang <kai.kang@eng.windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update webkitgtk 2.36.8 to latest version 2.38.4 which solves a lot of CVEs.
>
> The diff output of header files is attached at the end of this file.
>
> Kai Kang (1):
>   webkitgtk: 2.36.8 -> 2.38.4
>
>  ...spection.cmake-prefix-variables-obta.patch |  39 +--
>  .../0001-Fix-build-without-opengl-or-es.patch | 133 --------
>  ...tings-so-that-gtkdoc-generation-work.patch |  47 ---
>  ...trospection-files-do-not-quote-CFLAG.patch |  78 -----
>  ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ++++++++++++++++++
>  ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 ++
>  ...ebkitgtk_2.36.8.bb => webkitgtk_2.38.4.bb} |  15 +-
>  7 files changed, 348 insertions(+), 290 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.36.8.bb => webkitgtk_2.38.4.bb} (92%)
>
> --
> 2.17.1
>
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h  2022-06-30 17:49:25.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h  2022-09-20 16:13:44.000000000 +0800
> @@ -23,7 +23,7 @@
>   * THE POSSIBILITY OF SUCH DAMAGE.
>   */
>
> -#if !defined(__JSC_H_INSIDE__) && !defined(JSC_COMPILATION)
> +#if !defined(__JSC_H_INSIDE__) && !defined(JSC_COMPILATION) && !defined(WEBKIT2_COMPILATION)
>  #error "Only <jsc/jsc.h> can be included directly."
>  #endif
>
> @@ -42,7 +42,9 @@
>  #    define JSC_API __attribute__((visibility("default")))
>  #endif
>
> +#ifndef __GI_SCANNER__
>  #define JSC_DEPRECATED JSC_API G_DEPRECATED
>  #define JSC_DEPRECATED_FOR(f) JSC_API G_DEPRECATED_FOR(f)
> +#endif /* !__GI_SCANNER__ */
>
>  #endif /* JSCDefines_h */
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h    2022-06-30 17:49:25.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h    2022-09-20 16:13:44.000000000 +0800
> @@ -49,6 +49,21 @@
>      JSC_VALUE_PROPERTY_WRITABLE     = 1 << 2
>  } JSCValuePropertyFlags;
>
> +typedef enum {
> +    JSC_TYPED_ARRAY_NONE = 0,
> +    JSC_TYPED_ARRAY_INT8,
> +    JSC_TYPED_ARRAY_INT16,
> +    JSC_TYPED_ARRAY_INT32,
> +    JSC_TYPED_ARRAY_INT64,
> +    JSC_TYPED_ARRAY_UINT8,
> +    JSC_TYPED_ARRAY_UINT8_CLAMPED,
> +    JSC_TYPED_ARRAY_UINT16,
> +    JSC_TYPED_ARRAY_UINT32,
> +    JSC_TYPED_ARRAY_UINT64,
> +    JSC_TYPED_ARRAY_FLOAT32,
> +    JSC_TYPED_ARRAY_FLOAT64,
> +} JSCTypedArrayType;
> +
>  struct _JSCValue {
>      GObject parent;
>
> @@ -246,6 +261,55 @@
>  jsc_value_function_callv                  (JSCValue             *value,
>                                             guint                 n_parameters,
>                                             JSCValue            **parameters) G_GNUC_WARN_UNUSED_RESULT;
> +JSC_API JSCValue *
> +jsc_value_new_array_buffer                (JSCContext           *context,
> +                                           gpointer              data,
> +                                           gsize                 size,
> +                                           GDestroyNotify        destroy_notify,
> +                                           gpointer              user_data);
> +
> +JSC_API gboolean
> +jsc_value_is_array_buffer                 (JSCValue             *value);
> +
> +JSC_API gpointer
> +jsc_value_array_buffer_get_data           (JSCValue             *value,
> +                                           gsize                *size);
> +
> +JSC_API gsize
> +jsc_value_array_buffer_get_size           (JSCValue             *value);
> +
> +JSC_API JSCValue *
> +jsc_value_new_typed_array                 (JSCContext           *context,
> +                                           JSCTypedArrayType     type,
> +                                           gsize                 length);
> +
> +JSC_API JSCValue *
> +jsc_value_new_typed_array_with_buffer     (JSCValue             *array_buffer,
> +                                           JSCTypedArrayType     type,
> +                                           gsize                 offset,
> +                                           gssize                length);
> +
> +JSC_API gboolean
> +jsc_value_is_typed_array                  (JSCValue             *value);
> +
> +JSC_API JSCTypedArrayType
> +jsc_value_typed_array_get_type            (JSCValue             *value);
> +
> +JSC_API gpointer
> +jsc_value_typed_array_get_data            (JSCValue             *value,
> +                                           gsize                *length);
> +
> +JSC_API gsize
> +jsc_value_typed_array_get_length          (JSCValue             *value);
> +
> +JSC_API gsize
> +jsc_value_typed_array_get_size            (JSCValue             *value);
> +
> +JSC_API gsize
> +jsc_value_typed_array_get_offset          (JSCValue             *value);
> +
> +JSC_API JSCValue *
> +jsc_value_typed_array_get_buffer          (JSCValue             *value);
>
>  JSC_API gboolean
>  jsc_value_is_constructor                  (JSCValue             *value);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h  2023-02-12 23:02:14.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h  2023-02-13 11:34:32.000000000 +0800
> @@ -44,7 +44,7 @@
>   * application compile time, rather than from the library linked
>   * against at application run time.
>   */
> -#define JSC_MINOR_VERSION (36)
> +#define JSC_MINOR_VERSION (38)
>
>  /**
>   * JSC_MICRO_VERSION:
> @@ -53,7 +53,7 @@
>   * application compile time, rather than from the library linked
>   * against at application run time.
>   */
> -#define JSC_MICRO_VERSION (8)
> +#define JSC_MICRO_VERSION (4)
>
>  /**
>   * JSC_CHECK_VERSION:
> @@ -61,6 +61,8 @@
>   * @minor: minor version (e.g. 2 for version 1.2.5)
>   * @micro: micro version (e.g. 5 for version 1.2.5)
>   *
> + * Check the version of JSC header files at compile time.
> + *
>   * Returns: %TRUE if the version of the JavaScriptCore header files
>   * is the same as or newer than the passed-in version.
>   */
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h     2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h     2022-09-20 16:13:49.000000000 +0800
> @@ -52,6 +52,7 @@
>  struct _WebKitAuthenticationRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h 2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h 2022-09-20 16:13:49.000000000 +0800
> @@ -58,12 +58,14 @@
>  struct _WebKitAutomationSession {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitAutomationSessionPrivate *priv;
>  };
>
>  struct _WebKitAutomationSessionClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h   2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h   2022-09-20 16:13:49.000000000 +0800
> @@ -44,12 +44,14 @@
>  struct _WebKitBackForwardList {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitBackForwardListPrivate *priv;
>  };
>
>  struct _WebKitBackForwardListClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h       2022-09-20 16:13:49.000000000 +0800
> @@ -43,12 +43,14 @@
>  struct _WebKitBackForwardListItem {
>      GInitiallyUnowned parent;
>
> +    /*< private >*/
>      WebKitBackForwardListItemPrivate *priv;
>  };
>
>  struct _WebKitBackForwardListItemClass {
>      GInitiallyUnownedClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h       2022-09-20 16:13:49.000000000 +0800
> @@ -44,12 +44,14 @@
>  struct _WebKitContextMenu {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitContextMenuPrivate *priv;
>  };
>
>  struct _WebKitContextMenuClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h     2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h     2022-09-20 16:13:49.000000000 +0800
> @@ -74,12 +74,14 @@
>  struct _WebKitCookieManager {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitCookieManagerPrivate *priv;
>  };
>
>  struct _WebKitCookieManagerClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h   2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h   2022-09-20 16:13:49.000000000 +0800
> @@ -45,4 +45,11 @@
>  #define WEBKIT_DEPRECATED WEBKIT_API G_DEPRECATED
>  #define WEBKIT_DEPRECATED_FOR(f) WEBKIT_API G_DEPRECATED_FOR(f)
>
> +/**
> + * WEBKIT_DEPRECATED_FOR: (skip)
> + * @f: replacement symbol name
> + *
> + * Marks a symbol as deprecated, indicating a replacement.
> + */
> +
>  #endif /* WebKitDefines_h */
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h       2022-09-20 16:13:49.000000000 +0800
> @@ -49,6 +49,7 @@
>  struct _WebKitDeviceInfoPermissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h  2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h  2022-09-20 16:13:49.000000000 +0800
> @@ -46,15 +46,18 @@
>  struct _WebKitDownload {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitDownloadPrivate *priv;
>  };
>
>  struct _WebKitDownloadClass {
>      GObjectClass parent_class;
>
> +    /*< public >*/
>      gboolean (* decide_destination)  (WebKitDownload *download,
>                                        const gchar    *suggested_filename);
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h       2022-09-20 16:13:49.000000000 +0800
> @@ -64,12 +64,14 @@
>  struct _WebKitEditorState {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitEditorStatePrivate *priv;
>  };
>
>  struct _WebKitEditorStateClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h 2023-02-12 23:58:45.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h 2023-02-13 12:30:22.000000000 +0800
> @@ -198,6 +198,10 @@
>
>  WEBKIT_API GType
>  webkit_media_capture_state_get_type (void);
> +#define WEBKIT_TYPE_WEB_EXTENSION_MODE webkit_web_extension_mode_get_type ()
> +
> +WEBKIT_API GType
> +webkit_web_extension_mode_get_type (void);
>  /* Enumerations from WebKitWebsiteData.h. */
>  #define WEBKIT_TYPE_WEBSITE_DATA_TYPES webkit_website_data_types_get_type ()
>
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h     2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h     2023-01-27 21:16:47.000000000 +0800
> @@ -147,6 +147,8 @@
>   * @WEBKIT_USER_CONTENT_FILTER_ERROR_INVALID_SOURCE: The JSON source for a content filter is invalid.
>   * @WEBKIT_USER_CONTENT_FILTER_ERROR_NOT_FOUND: The requested content filter could not be found.
>   *
> + * Errors that can occur while compiling content filters.
> + *
>   * Since: 2.24
>   */
>  typedef enum {
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h   2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h   2022-09-20 16:13:49.000000000 +0800
> @@ -46,12 +46,14 @@
>  struct _WebKitFaviconDatabase {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitFaviconDatabasePrivate *priv;
>  };
>
>  struct _WebKitFaviconDatabaseClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h        2022-09-20 16:13:49.000000000 +0800
> @@ -50,6 +50,7 @@
>  struct _WebKitFileChooserRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h    2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h    2022-09-20 16:13:49.000000000 +0800
> @@ -75,6 +75,7 @@
>  struct _WebKitFindControllerClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h     2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h     2022-09-20 16:13:49.000000000 +0800
> @@ -50,6 +50,7 @@
>  struct _WebKitFormSubmissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h     2022-06-30 17:49:38.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h     2022-09-20 16:13:49.000000000 +0800
> @@ -47,6 +47,7 @@
>  struct _WebKitFrame {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitFramePrivate *priv;
>  };
>
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h        2022-09-20 16:13:49.000000000 +0800
> @@ -53,6 +53,7 @@
>  struct _WebKitGeolocationManagerClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h      2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h      2022-09-20 16:13:49.000000000 +0800
> @@ -50,6 +50,7 @@
>  struct _WebKitGeolocationPermissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h     2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h     2022-09-20 16:13:49.000000000 +0800
> @@ -66,12 +66,14 @@
>  struct _WebKitHitTestResult {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitHitTestResultPrivate *priv;
>  };
>
>  struct _WebKitHitTestResultClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h       2022-09-20 16:13:49.000000000 +0800
> @@ -43,12 +43,14 @@
>  struct _WebKitInstallMissingMediaPluginsPermissionRequest {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitInstallMissingMediaPluginsPermissionRequestPrivate *priv;
>  };
>
>  struct _WebKitInstallMissingMediaPluginsPermissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h   2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h   2022-09-20 16:13:49.000000000 +0800
> @@ -50,6 +50,7 @@
>  struct _WebKitMediaKeySystemPermissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h  2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h  2022-09-20 16:13:49.000000000 +0800
> @@ -53,6 +53,7 @@
>  struct _WebKitNavigationPolicyDecisionClass {
>      WebKitPolicyDecisionClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h      2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h      2022-09-20 16:13:49.000000000 +0800
> @@ -44,12 +44,14 @@
>  struct _WebKitNotification {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitNotificationPrivate *priv;
>  };
>
>  struct _WebKitNotificationClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h        2022-09-20 16:13:49.000000000 +0800
> @@ -44,12 +44,14 @@
>  struct _WebKitOptionMenu {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitOptionMenuPrivate *priv;
>  };
>
>  struct _WebKitOptionMenuClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h    2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h    2022-09-20 16:13:49.000000000 +0800
> @@ -43,12 +43,14 @@
>  struct _WebKitPlugin {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitPluginPrivate *priv;
>  };
>
>  struct _WebKitPluginClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h      2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h      2022-09-20 16:13:49.000000000 +0800
> @@ -50,6 +50,7 @@
>  struct _WebKitPointerLockPermissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h    2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h    2022-09-20 16:13:49.000000000 +0800
> @@ -51,6 +51,7 @@
>  struct _WebKitPolicyDecisionClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h 2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h 2022-09-20 16:13:49.000000000 +0800
> @@ -44,12 +44,14 @@
>  struct _WebKitPrintCustomWidget {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitPrintCustomWidgetPrivate *priv;
>  };
>
>  struct _WebKitPrintCustomWidgetClass {
>      GObjectClass parent_class;
>
> +    /*< public >*/
>      void    (* apply)               (WebKitPrintCustomWidget *print_custom_widget,
>                                       GtkWidget               *widget);
>      void    (* update)              (WebKitPrintCustomWidget *print_custom_widget,
> @@ -57,6 +59,7 @@
>                                       GtkPageSetup            *page_setup,
>                                       GtkPrintSettings        *print_settings);
>
> +    /*< private >*/
>      void    (*_webkit_reserved0) (void);
>      void    (*_webkit_reserved1) (void);
>      void    (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h    2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h    2022-09-20 16:13:49.000000000 +0800
> @@ -57,12 +57,14 @@
>  struct _WebKitPrintOperation {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitPrintOperationPrivate *priv;
>  };
>
>  struct _WebKitPrintOperationClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h    2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h    2022-09-20 16:13:49.000000000 +0800
> @@ -53,6 +53,7 @@
>  struct _WebKitResponsePolicyDecisionClass {
>      WebKitPolicyDecisionClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h   2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h   2022-09-20 16:13:49.000000000 +0800
> @@ -43,12 +43,14 @@
>  struct _WebKitSecurityManager {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitSecurityManagerPrivate *priv;
>  };
>
>  struct _WebKitSecurityManagerClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h  2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h  2023-01-26 20:05:13.000000000 +0800
> @@ -70,12 +70,14 @@
>  struct _WebKitSettings {
>      GObject parent_instance;
>
> +    /*< private >*/
>      WebKitSettingsPrivate *priv;
>  };
>
>  struct _WebKitSettingsClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> @@ -133,17 +135,17 @@
>  WEBKIT_API void
>  webkit_settings_set_enable_html5_database                      (WebKitSettings *settings,
>                                                                  gboolean        enabled);
> -WEBKIT_API gboolean
> +WEBKIT_DEPRECATED gboolean
>  webkit_settings_get_enable_xss_auditor                         (WebKitSettings *settings);
>
> -WEBKIT_API void
> +WEBKIT_DEPRECATED void
>  webkit_settings_set_enable_xss_auditor                         (WebKitSettings *settings,
>                                                                  gboolean        enabled);
>
> -WEBKIT_API gboolean
> +WEBKIT_DEPRECATED gboolean
>  webkit_settings_get_enable_frame_flattening                    (WebKitSettings *settings);
>
> -WEBKIT_API void
> +WEBKIT_DEPRECATED void
>  webkit_settings_set_enable_frame_flattening                    (WebKitSettings *settings,
>                                                                  gboolean        enabled);
>
> @@ -154,10 +156,10 @@
>  webkit_settings_set_enable_plugins                             (WebKitSettings *settings,
>                                                                  gboolean        enabled);
>
> -WEBKIT_API gboolean
> +WEBKIT_DEPRECATED gboolean
>  webkit_settings_get_enable_java                                (WebKitSettings *settings);
>
> -WEBKIT_API void
> +WEBKIT_DEPRECATED void
>  webkit_settings_set_enable_java                                (WebKitSettings *settings,
>                                                                  gboolean        enabled);
>
> @@ -513,6 +515,13 @@
>  webkit_settings_set_media_content_types_requiring_hardware_support (WebKitSettings *settings,
>                                                                      const gchar *content_types);
>
> +WEBKIT_API gboolean
> +webkit_settings_get_enable_webrtc                              (WebKitSettings *settings);
> +
> +WEBKIT_API void
> +webkit_settings_set_enable_webrtc                              (WebKitSettings *settings,
> +                                                                gboolean enabled);
> +
>  G_END_DECLS
>
>  #endif /* WebKitSettings_h */
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h        2022-09-20 16:13:49.000000000 +0800
> @@ -51,6 +51,7 @@
>  struct _WebKitURIRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h       2022-09-20 16:13:49.000000000 +0800
> @@ -51,6 +51,7 @@
>  struct _WebKitURIResponseClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h  2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h  2022-09-20 16:13:49.000000000 +0800
> @@ -46,12 +46,14 @@
>  struct _WebKitURISchemeRequest {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitURISchemeRequestPrivate *priv;
>  };
>
>  struct _WebKitURISchemeRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h 2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h 2022-09-20 16:13:49.000000000 +0800
> @@ -45,12 +45,14 @@
>  struct _WebKitURISchemeResponse {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitURISchemeResponsePrivate *priv;
>  };
>
>  struct _WebKitURISchemeResponseClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h    2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h    2022-09-20 16:13:49.000000000 +0800
> @@ -58,6 +58,7 @@
>  struct _WebKitUserContentFilterStoreClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h        2022-09-20 16:13:49.000000000 +0800
> @@ -52,6 +52,7 @@
>  struct _WebKitUserContentManagerClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h        2022-09-20 16:13:49.000000000 +0800
> @@ -49,6 +49,7 @@
>  struct _WebKitUserMediaPermissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h       2022-09-20 16:13:49.000000000 +0800
> @@ -57,12 +57,14 @@
>  struct _WebKitUserMessage {
>      GInitiallyUnowned parent;
>
> +    /*< private >*/
>      WebKitUserMessagePrivate *priv;
>  };
>
>  struct _WebKitUserMessageClass {
>      GInitiallyUnownedClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h   2023-02-12 23:02:17.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h   2023-02-13 11:34:35.000000000 +0800
> @@ -28,42 +28,10 @@
>
>  G_BEGIN_DECLS
>
> -/**
> - * WEBKIT_MAJOR_VERSION:
> - *
> - * Like webkit_get_major_version(), but from the headers used at
> - * application compile time, rather than from the library linked
> - * against at application run time.
> - */
>  #define WEBKIT_MAJOR_VERSION (2)
> +#define WEBKIT_MINOR_VERSION (38)
> +#define WEBKIT_MICRO_VERSION (4)
>
> -/**
> - * WEBKIT_MINOR_VERSION:
> - *
> - * Like webkit_get_minor_version(), but from the headers used at
> - * application compile time, rather than from the library linked
> - * against at application run time.
> - */
> -#define WEBKIT_MINOR_VERSION (36)
> -
> -/**
> - * WEBKIT_MICRO_VERSION:
> - *
> - * Like webkit_get_micro_version(), but from the headers used at
> - * application compile time, rather than from the library linked
> - * against at application run time.
> - */
> -#define WEBKIT_MICRO_VERSION (8)
> -
> -/**
> - * WEBKIT_CHECK_VERSION:
> - * @major: major version (e.g. 1 for version 1.2.5)
> - * @minor: minor version (e.g. 2 for version 1.2.5)
> - * @micro: micro version (e.g. 5 for version 1.2.5)
> - *
> - * Returns: %TRUE if the version of the WebKit header files
> - * is the same as or newer than the passed-in version.
> - */
>  #define WEBKIT_CHECK_VERSION(major, minor, micro) \
>      (WEBKIT_MAJOR_VERSION > (major) || \
>      (WEBKIT_MAJOR_VERSION == (major) && WEBKIT_MINOR_VERSION > (minor)) || \
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h        2022-09-20 16:13:49.000000000 +0800
> @@ -113,6 +113,7 @@
>  struct _WebKitWebContextClass {
>      GObjectClass parent;
>
> +    /*< public >*/
>      void     (* download_started)                    (WebKitWebContext        *context,
>                                                        WebKitDownload          *download);
>      void     (* initialize_web_extensions)           (WebKitWebContext        *context);
> @@ -122,6 +123,7 @@
>      gboolean (* user_message_received)               (WebKitWebContext        *context,
>                                                        WebKitUserMessage       *message);
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> @@ -300,6 +302,9 @@
>  WEBKIT_API gboolean
>  webkit_web_context_get_use_system_appearance_for_scrollbars (WebKitWebContext      *context);
>
> +WEBKIT_API const gchar*
> +webkit_web_context_get_time_zone_override           (WebKitWebContext              *context);
> +
>  G_END_DECLS
>
>  #endif
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h      2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h      2022-09-20 16:13:49.000000000 +0800
> @@ -44,12 +44,14 @@
>  struct _WebKitWebInspector {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitWebInspectorPrivate *priv;
>  };
>
>  struct _WebKitWebInspectorClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h   2022-06-30 17:49:38.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h   2022-09-20 16:13:49.000000000 +0800
> @@ -67,6 +67,7 @@
>  struct _WebKitWebPage {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitWebPagePrivate *priv;
>  };
>
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h       2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h       2022-09-20 16:13:49.000000000 +0800
> @@ -45,12 +45,14 @@
>  struct _WebKitWebResource {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitWebResourcePrivate *priv;
>  };
>
>  struct _WebKitWebResourceClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h   2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h   2022-09-20 16:13:49.000000000 +0800
> @@ -85,7 +85,7 @@
>   *   a #WebKitNavigationPolicyDecision. These decisions are useful for implementing
>   *   special actions for new windows, such as forcing the new window to open
>   *   in a tab when a keyboard modifier is active or handling a special
> - *   target attribute on &lt;a&gt; elements.
> + *   target attribute on <a> elements.
>   * @WEBKIT_POLICY_DECISION_TYPE_RESPONSE: This type of decision is used when WebKit has
>   *   received a response for a network resource and is about to start the load.
>   *   Note that these resources include all subresources of a page such as images
> @@ -221,6 +221,23 @@
>      WEBKIT_MEDIA_CAPTURE_STATE_MUTED,
>  } WebKitMediaCaptureState;
>
> +/**
> + * WebKitWebExtensionMode:
> + * @WEBKIT_WEB_EXTENSION_MODE_NONE: Not for an extension.
> + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2: For a ManifestV2 extension.
> + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3: For a ManifestV3 extension.
> + *
> + * Enum values used for setting if a #WebKitWebView is intended for
> + * WebExtensions.
> + *
> + * Since: 2.38
> + */
> +typedef enum {
> +    WEBKIT_WEB_EXTENSION_MODE_NONE,
> +    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2,
> +    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3,
> +} WebKitWebExtensionMode;
> +
>  struct _WebKitWebView {
>      WebKitWebViewBase parent;
>
> @@ -231,6 +248,7 @@
>  struct _WebKitWebViewClass {
>      WebKitWebViewBaseClass parent;
>
> +    /*< public >*/
>      void       (* load_changed)                (WebKitWebView               *web_view,
>                                                  WebKitLoadEvent              load_event);
>      gboolean   (* load_failed)                 (WebKitWebView               *web_view,
> @@ -293,6 +311,7 @@
>      gboolean   (* user_message_received)       (WebKitWebView               *web_view,
>                                                  WebKitUserMessage           *message);
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>  };
>
> @@ -489,6 +508,15 @@
>                                                        GError                   **error);
>
>  WEBKIT_API void
> +webkit_web_view_run_async_javascript_function_in_world (WebKitWebView           *web_view,
> +                                                        const gchar             *body,
> +                                                        GVariant                *arguments,
> +                                                        const char              *world_name,
> +                                                        GCancellable            *cancellable,
> +                                                        GAsyncReadyCallback      callback,
> +                                                        gpointer                 user_data);
> +
> +WEBKIT_API void
>  webkit_web_view_run_javascript_from_gresource        (WebKitWebView             *web_view,
>                                                        const gchar               *resource,
>                                                        GCancellable              *cancellable,
> @@ -637,6 +665,12 @@
>  webkit_web_view_set_display_capture_state            (WebKitWebView             *web_view,
>                                                        WebKitMediaCaptureState    state);
>
> +WEBKIT_API WebKitWebExtensionMode
> +webkit_web_view_get_web_extension_mode               (WebKitWebView             *web_view);
> +
> +WEBKIT_API const gchar*
> +webkit_web_view_get_default_content_security_policy  (WebKitWebView             *web_view);
> +
>  G_END_DECLS
>
>  #endif
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h        2022-09-20 16:13:49.000000000 +0800
> @@ -49,6 +49,7 @@
>  struct _WebKitWebsiteDataAccessPermissionRequestClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h        2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h        2022-09-20 16:13:49.000000000 +0800
> @@ -62,12 +62,14 @@
>  struct _WebKitWebsiteDataManager {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitWebsiteDataManagerPrivate *priv;
>  };
>
>  struct _WebKitWebsiteDataManagerClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h   2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h   2022-09-20 16:13:49.000000000 +0800
> @@ -42,12 +42,14 @@
>  struct _WebKitWebsitePolicies {
>      GObject parent;
>
> +    /*< private >*/
>      WebKitWebsitePoliciesPrivate *priv;
>  };
>
>  struct _WebKitWebsitePoliciesClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h
> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h  2022-06-30 17:49:37.000000000 +0800
> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h  2022-09-20 16:13:49.000000000 +0800
> @@ -51,6 +51,7 @@
>  struct _WebKitWindowPropertiesClass {
>      GObjectClass parent_class;
>
> +    /*< private >*/
>      void (*_webkit_reserved0) (void);
>      void (*_webkit_reserved1) (void);
>      void (*_webkit_reserved2) (void);
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177085): https://lists.openembedded.org/g/openembedded-core/message/177085
> Mute This Topic: https://lists.openembedded.org/mt/96930211/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

