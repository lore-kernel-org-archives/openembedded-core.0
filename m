Return-Path: <riku.voipio@linaro.org>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 799036C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 06:59:26 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id c9so234102qcz.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 23:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=O507Kt5g2zzBm/8HO0aZdeB49bQKEfB/yleh+iN3QLY=;
	b=jPzeCdiu9x/N8QIctxLpk6qXOvGvLby0aMhui1qlkf7sjxMQpgGGZq1jTdJm1Tqp+1
	EO05WQOIqOSktzMOk2kEtaXOfFTqMTDviv4cWH9koUVyzhDqmdyRZfuvmJHjOCIUDqA/
	dZqWf2SP4tvj+kq8Jt9pFKMpxc8UleXXTEpIFY6E7bcWYLfZU8Pl0j8viPD58vm/FF35
	NFee46CR+MICiX/77Y2hQKN96Y9/ptdDCwRFOb4adOY6HCgsDh/hNuG3P+JWPo/+B6Tn
	1ReGUGVkmNOZjLW5DexGcyZtkwX7Rj+nZwSCnb9UpUGUNf04hZp6IshL4XjRZ8uQAi2f
	4Lnw==
X-Gm-Message-State: ALoCoQnuXnLQENAHMRKK5ym5jlscoSTimE5Na7un63gte6chDi0AYZP2+DDxgJgdIlQ0EdYt1G7K
MIME-Version: 1.0
X-Received: by 10.224.36.201 with SMTP id u9mr2495983qad.76.1381906767835;
	Tue, 15 Oct 2013 23:59:27 -0700 (PDT)
Received: by 10.49.12.146 with HTTP; Tue, 15 Oct 2013 23:59:27 -0700 (PDT)
In-Reply-To: <1381837865-24381-1-git-send-email-riku.voipio@linaro.org>
References: <1381837865-24381-1-git-send-email-riku.voipio@linaro.org>
Date: Wed, 16 Oct 2013 09:59:27 +0300
Message-ID: <CAAqcGHkXW_Bt=VmT6L9KNqCgz7nX75mSf3cU7SChKuz_4sL29g@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: fix build on Aarch64
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
X-List-Received-Date: Wed, 16 Oct 2013 06:59:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On 15 October 2013 14:51, Riku Voipio <riku.voipio@linaro.org> wrote:
> Backported patch from upstream

Can someone look into this soon?

Riku

> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  ...ror-format-string-errors-from-mismatched-.patch | 56 ++++++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb      |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
> new file mode 100644
> index 0000000..9b87d9d
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
> @@ -0,0 +1,56 @@
> +From 0167c3340d8201dca8e9031b61703bbc5ed6ce33 Mon Sep 17 00:00:00 2001
> +From: Jan Schmidt <thaytan@noraisin.net>
> +Date: Wed, 25 Sep 2013 19:22:26 +1000
> +Subject: [PATCH] gio: Fix -Werror format string errors from mismatched ints.
> +
> +Upstream-Status: Backport
> +
> +---
> + gio/gdbusmessage.c | 8 ++++----
> + gio/gdbusprivate.c | 4 ++--
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
> +index ac233a3..ad77aa6 100644
> +--- a/gio/gdbusmessage.c
> ++++ b/gio/gdbusmessage.c
> +@@ -3468,10 +3468,10 @@ g_dbus_message_print (GDBusMessage *message,
> +                                           statbuf.st_mode);
> +                   g_string_append_printf (fs, "%s" "ino=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
> +                                           (guint64) statbuf.st_ino);
> +-                  g_string_append_printf (fs, "%s" "uid=%d", fs->len > 0 ? "," : "",
> +-                                          statbuf.st_uid);
> +-                  g_string_append_printf (fs, "%s" "gid=%d", fs->len > 0 ? "," : "",
> +-                                          statbuf.st_gid);
> ++                  g_string_append_printf (fs, "%s" "uid=%u", fs->len > 0 ? "," : "",
> ++                                          (guint) statbuf.st_uid);
> ++                  g_string_append_printf (fs, "%s" "gid=%u", fs->len > 0 ? "," : "",
> ++                                          (guint) statbuf.st_gid);
> +                   g_string_append_printf (fs, "%s" "rdev=%d:%d", fs->len > 0 ? "," : "",
> +                                           major (statbuf.st_rdev), minor (statbuf.st_rdev));
> +                   g_string_append_printf (fs, "%s" "size=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
> +diff --git a/gio/gdbusprivate.c b/gio/gdbusprivate.c
> +index 0e5bef2..785a0c0 100644
> +--- a/gio/gdbusprivate.c
> ++++ b/gio/gdbusprivate.c
> +@@ -2155,7 +2155,7 @@ write_message_print_transport_debug (gssize bytes_written,
> +   _g_dbus_debug_print_lock ();
> +   g_print ("========================================================================\n"
> +            "GDBus-debug:Transport:\n"
> +-           "  >>>> WROTE %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
> ++           "  >>>> WROTE %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
> +            "       size %" G_GSIZE_FORMAT " from offset %" G_GSIZE_FORMAT " on a %s\n",
> +            bytes_written,
> +            g_dbus_message_get_serial (data->message),
> +@@ -2206,7 +2206,7 @@ read_message_print_transport_debug (gssize bytes_read,
> +     _g_dbus_debug_print_lock ();
> +   g_print ("========================================================================\n"
> +            "GDBus-debug:Transport:\n"
> +-           "  <<<< READ %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
> ++           "  <<<< READ %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
> +            "       size %d to offset %" G_GSIZE_FORMAT " from a %s\n",
> +            bytes_read,
> +            serial,
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
> index 4b9b112..5717bd2 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
> @@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://add-march-i486-into-CFLAGS-automatically.patch \
>             file://glib-2.0-configure-readlink.patch \
>             file://run-ptest \
> +           file://0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch \
>            "
>
>  SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
> --
> 1.8.3.1
>

