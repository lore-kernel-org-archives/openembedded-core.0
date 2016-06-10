Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7026FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 09:02:14 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id e72so103032314oib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JXfJxjpEeORKivsnGV5sB/DZHsHQq+GKmHGujqkpPEM=;
	b=ei0fd+jn33NpId8VS+K5zhYPIB5AUBif0b6ZD0h0A4GTO49MOxk6GrSnEqisf/v2Y4
	4GP/Hakt26l85iEiBQJy1klH438mc3vK/SQen84H0VL0blVKep/mk59HymkhbEqNuRhC
	mA4WUmZb00k4RCVBERehRfEPAiam2Ov+B07wDPYPBAYAl7ptQuGbNkuZ/qp0l47h6Hv3
	eLJpeAYYf4z5BADuuUKLQOYAgFu+VNyJe26zPYLRgQcj9W5nseSPLFcDO2v6YxsSgMQC
	IXSyL/GzUmyoBMfFcEgH2hyJtBa5YIP5IGBWT/AV73X/mcUDBl3tb+CpN270dilDz1uj
	wPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JXfJxjpEeORKivsnGV5sB/DZHsHQq+GKmHGujqkpPEM=;
	b=li8FHAGlCSb5e64fVGhJO9VY4/6LytDSuuXTBTFn9FlHfgbxnnbrfoZ2JSsBdOGy12
	OuhNfHHYlCHDFZ1gB0dQxyXp644I81GGfUx/ftBJfyBYFLVygJIfuwVOXdcRzSUlJ0Qq
	kDU6m6zuQk2ACO1ZeQKR6/m161k4HZETimNrO3aph2IOSlvEXeq4aqQAbKY/ED5UNgmc
	szIYeVrehyRyOiWSUdd7VSX+D/UAuHvzV9G4txyyzQa6vt+EzGgnSUFN7r6/nHE8GJOv
	92zIoKSVs4FLc8vifu5KIJf/CRK5dctQcwRrxuC7Dw4vs0WL21ZzJS12Xbz9kcjyE2tu
	twgA==
X-Gm-Message-State: ALyK8tIPgsuLO7b7DK0tw5MGMpdUFafiY1EGZt3kHCjo3JBdzcPxTwD1V62xjpbxKBffNiIIyFQD5GJr4rpVDrQX
X-Received: by 10.202.198.13 with SMTP id w13mr416252oif.173.1465549334547;
	Fri, 10 Jun 2016 02:02:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 10 Jun 2016 02:01:45 -0700 (PDT)
In-Reply-To: <0eb4efa075b52bf2989e5808d33e9f06d83eadda.1465543963.git.jussi.kukkonen@intel.com>
References: <cover.1465543963.git.jussi.kukkonen@intel.com>
	<0eb4efa075b52bf2989e5808d33e9f06d83eadda.1465543963.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 10 Jun 2016 12:01:45 +0300
Message-ID: <CAHiDW_G6SDGKAEfCyoS4P2nyRO-52kxp0w=oinkiQFLsKX_5hw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 08/36] connman-gnome: Add patch to port to Gtk+3
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
X-List-Received-Date: Fri, 10 Jun 2016 09:02:14 -0000
Content-Type: multipart/alternative; boundary=001a11c17ab87ca6700534e8cbd5

--001a11c17ab87ca6700534e8cbd5
Content-Type: text/plain; charset=UTF-8

On 10 June 2016 at 11:04, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Upstream is not really active anymore: patch the Gtk+3 upgrade
> in for now (long term solution is to change to another UI).
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../connman/connman-gnome/0001-Port-to-Gtk3.patch  | 277
> +++++++++++++++++++++
>  .../connman/connman-gnome_0.7.bb                   |   5 +-
>  .../connman/connman/0001-Port-to-Gtk3.patch        | 277
> +++++++++++++++++++++
>  3 files changed, 557 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
>  create mode 100644
> meta/recipes-connectivity/connman/connman/0001-Port-to-Gtk3.patch
>

... that still wasn't right: I've removed the completely unnecessary
duplicate patch and force pushed the same jku/sato-gtk3-v2 branch.
Sorry about that and thanks to Alexander for keeping eyes open.

Jussi



> diff --git
> a/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
> b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
> new file mode 100644
> index 0000000..c93e9b4
> --- /dev/null
> +++
> b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
> @@ -0,0 +1,277 @@
> +From a59b0fac02e74a971ac3f08bf28c17ce361a9526 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 2 Mar 2016 15:47:49 +0200
> +Subject: [PATCH] Port to Gtk3
> +
> +Some unused (or not useful) code was removed, functionality should stay
> +the same.
> +
> +Code still contains quite a few uses of deprecated API.
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + applet/agent.c        |  3 +--
> + applet/main.c         | 43 -------------------------------------------
> + applet/status.c       |  8 --------
> + configure.ac          |  3 +--
> + properties/ethernet.c | 14 +++++++-------
> + properties/main.c     |  2 +-
> + properties/wifi.c     | 12 ++++++------
> + 7 files changed, 16 insertions(+), 69 deletions(-)
> +
> +diff --git a/applet/agent.c b/applet/agent.c
> +index 65bed08..04fe86a 100644
> +--- a/applet/agent.c
> ++++ b/applet/agent.c
> +@@ -126,7 +126,6 @@ static void request_input_dialog(GHashTable *request,
> +       gtk_window_set_position(GTK_WINDOW(dialog), GTK_WIN_POS_CENTER);
> +       gtk_window_set_keep_above(GTK_WINDOW(dialog), TRUE);
> +       gtk_window_set_urgency_hint(GTK_WINDOW(dialog), TRUE);
> +-      gtk_dialog_set_has_separator(GTK_DIALOG(dialog), FALSE);
> +       input->dialog = dialog;
> +
> +       gtk_dialog_add_button(GTK_DIALOG(dialog),
> +@@ -139,7 +138,7 @@ static void request_input_dialog(GHashTable *request,
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 4);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 20);
> +       gtk_container_set_border_width(GTK_CONTAINER(table), 12);
> +-      gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), table);
> ++      gtk_container_add(GTK_CONTAINER(gtk_dialog_get_content_area
> (GTK_DIALOG(dialog))), table);
> +
> +       label = gtk_label_new(_("Please provide some network
> information:"));
> +       gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.0);
> +diff --git a/applet/main.c b/applet/main.c
> +index f12d371..cd16285 100644
> +--- a/applet/main.c
> ++++ b/applet/main.c
> +@@ -157,46 +157,6 @@ static void name_owner_changed(DBusGProxy *proxy,
> const char *name,
> +       }
> + }
> +
> +-static void open_uri(GtkWindow *parent, const char *uri)
> +-{
> +-      GtkWidget *dialog;
> +-      GdkScreen *screen;
> +-      GError *error = NULL;
> +-      gchar *cmdline;
> +-
> +-      screen = gtk_window_get_screen(parent);
> +-
> +-      cmdline = g_strconcat("xdg-open ", uri, NULL);
> +-
> +-      if (gdk_spawn_command_line_on_screen(screen,
> +-                              cmdline, &error) == FALSE) {
> +-              dialog = gtk_message_dialog_new(parent,
> +-                              GTK_DIALOG_DESTROY_WITH_PARENT,
> GTK_MESSAGE_ERROR,
> +-                              GTK_BUTTONS_CLOSE, "%s", error->message);
> +-              gtk_dialog_run(GTK_DIALOG(dialog));
> +-              gtk_widget_destroy(dialog);
> +-              g_error_free(error);
> +-      }
> +-
> +-      g_free(cmdline);
> +-}
> +-
> +-static void about_url_hook(GtkAboutDialog *dialog,
> +-                              const gchar *url, gpointer data)
> +-{
> +-      open_uri(GTK_WINDOW(dialog), url);
> +-}
> +-
> +-static void about_email_hook(GtkAboutDialog *dialog,
> +-                              const gchar *email, gpointer data)
> +-{
> +-      gchar *uri;
> +-
> +-      uri = g_strconcat("mailto:", email, NULL);
> +-      open_uri(GTK_WINDOW(dialog), uri);
> +-      g_free(uri);
> +-}
> +-
> + static void about_callback(GtkWidget *item, gpointer user_data)
> + {
> +       const gchar *authors[] = {
> +@@ -204,9 +164,6 @@ static void about_callback(GtkWidget *item, gpointer
> user_data)
> +               NULL
> +       };
> +
> +-      gtk_about_dialog_set_url_hook(about_url_hook, NULL, NULL);
> +-      gtk_about_dialog_set_email_hook(about_email_hook, NULL, NULL);
> +-
> +       gtk_show_about_dialog(NULL, "version", VERSION,
> +                       "copyright", "Copyright \xc2\xa9 2008 Intel
> Corporation",
> +                       "comments", _("A connection manager for the GNOME
> desktop"),
> +diff --git a/applet/status.c b/applet/status.c
> +index aed6f1e..015ff29 100644
> +--- a/applet/status.c
> ++++ b/applet/status.c
> +@@ -102,8 +102,6 @@ static void icon_animation_start(IconAnimation
> *animation,
> + {
> +       available = TRUE;
> +
> +-      gtk_status_icon_set_tooltip(statusicon, NULL);
> +-
> +       animation->start = start;
> +       animation->end = (end == 0) ? animation->count - 1 : end;
> +
> +@@ -120,8 +118,6 @@ static void icon_animation_stop(IconAnimation
> *animation)
> + {
> +       available = TRUE;
> +
> +-      gtk_status_icon_set_tooltip(statusicon, NULL);
> +-
> +       if (animation->id > 0)
> +               g_source_remove(animation->id);
> +
> +@@ -251,8 +247,6 @@ void status_unavailable(void)
> +       available = FALSE;
> +
> +       gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_notifier);
> +-      gtk_status_icon_set_tooltip(statusicon,
> +-                              "Connection Manager daemon is not
> running");
> +
> +       gtk_status_icon_set_visible(statusicon, TRUE);
> + }
> +@@ -299,7 +293,6 @@ static void set_ready(gint signal)
> +
> +       if (signal < 0) {
> +               gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_wired);
> +-              gtk_status_icon_set_tooltip(statusicon, NULL);
> +               return;
> +       }
> +
> +@@ -311,7 +304,6 @@ static void set_ready(gint signal)
> +               index = 4;
> +
> +       gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_signal[index]);
> +-      gtk_status_icon_set_tooltip(statusicon, NULL);
> + }
> +
> + struct timeout_data {
> +diff --git a/configure.ac b/configure.ac
> +index b972e07..a4dad5d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -55,8 +55,7 @@ AC_SUBST(DBUS_LIBS)
> + DBUS_BINDING_TOOL="dbus-binding-tool"
> + AC_SUBST(DBUS_BINDING_TOOL)
> +
> +-PKG_CHECK_MODULES(GTK, gtk+-2.0 >= 2.8, dummy=yes,
> +-                              AC_MSG_ERROR(gtk+ >= 2.8 is required))
> ++PKG_CHECK_MODULES(GTK, gtk+-3.0)
> + AC_SUBST(GTK_CFLAGS)
> + AC_SUBST(GTK_LIBS)
> +
> +diff --git a/properties/ethernet.c b/properties/ethernet.c
> +index 31db7a0..0b6b423 100644
> +--- a/properties/ethernet.c
> ++++ b/properties/ethernet.c
> +@@ -82,7 +82,7 @@ void add_ethernet_switch_button(GtkWidget *mainbox,
> GtkTreeIter *iter,
> +       gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
> +       gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
> +
> +-      table = gtk_table_new(1, 1, TRUE);
> ++      table = gtk_table_new(1, 1, FALSE);
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 10);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 10);
> +       gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
> +@@ -136,7 +136,7 @@ void add_ethernet_service(GtkWidget *mainbox,
> GtkTreeIter *iter, struct config_d
> +       gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
> +       gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
> +
> +-      table = gtk_table_new(5, 5, TRUE);
> ++      table = gtk_table_new(5, 5, FALSE);
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 10);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 10);
> +       gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
> +@@ -144,9 +144,9 @@ void add_ethernet_service(GtkWidget *mainbox,
> GtkTreeIter *iter, struct config_d
> +       label = gtk_label_new(_("Configuration:"));
> +       gtk_table_attach_defaults(GTK_TABLE(table), label, 1, 2, 0, 1);
> +
> +-      combo = gtk_combo_box_new_text();
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "DHCP");
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "MANUAL");
> ++      combo = gtk_combo_box_text_new();
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "DHCP");
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo),
> "MANUAL");
> +       gtk_combo_box_set_row_separator_func(GTK_COMBO_BOX(combo),
> +                                       separator_function, NULL, NULL);
> +       gtk_table_attach_defaults(GTK_TABLE(table), combo, 2, 4, 0, 1);
> +@@ -219,7 +219,7 @@ void update_ethernet_ipv4(struct config_data *data,
> guint policy)
> +       case CONNMAN_POLICY_DHCP:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 0);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 0);
> +                       gtk_widget_set_sensitive(entry[i], 0);
> +                       gtk_entry_set_text(GTK_ENTRY(entry[i]), _(""));
> +               }
> +@@ -227,7 +227,7 @@ void update_ethernet_ipv4(struct config_data *data,
> guint policy)
> +       case CONNMAN_POLICY_MANUAL:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 1);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 1);
> +                       gtk_widget_set_sensitive(entry[i], 1);
> +               }
> +               break;
> +diff --git a/properties/main.c b/properties/main.c
> +index c05f443..6f76361 100644
> +--- a/properties/main.c
> ++++ b/properties/main.c
> +@@ -429,7 +429,7 @@ static GtkWidget *create_interfaces(GtkWidget *window)
> +
> +       scrolled = gtk_scrolled_window_new(NULL, NULL);
> +       gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scrolled),
> +-                              GTK_POLICY_AUTOMATIC,
> GTK_POLICY_AUTOMATIC);
> ++                              GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
> +       gtk_scrolled_window_set_shadow_type(GTK_SCROLLED_WINDOW(scrolled),
> +                                                       GTK_SHADOW_OUT);
> +       gtk_box_pack_start(GTK_BOX(hbox), scrolled, FALSE, TRUE, 0);
> +diff --git a/properties/wifi.c b/properties/wifi.c
> +index bd325ef..a5827e0 100644
> +--- a/properties/wifi.c
> ++++ b/properties/wifi.c
> +@@ -125,7 +125,7 @@ void add_wifi_switch_button(GtkWidget *mainbox,
> GtkTreeIter *iter,
> +       gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
> +       gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
> +
> +-      table = gtk_table_new(1, 1, TRUE);
> ++      table = gtk_table_new(1, 1, FALSE);
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 10);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 10);
> +       gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
> +@@ -185,9 +185,9 @@ static void wifi_ipconfig(GtkWidget *table, struct
> config_data *data, GtkTreeIte
> +       gtk_table_attach_defaults(GTK_TABLE(table), label, 1, 2, 3, 4);
> +       data->ipv4.label[0] = label;
> +
> +-      combo = gtk_combo_box_new_text();
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "DHCP");
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "Manual");
> ++      combo = gtk_combo_box_text_new();
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "DHCP");
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo),
> "Manual");
> +
> +       gtk_combo_box_set_row_separator_func(GTK_COMBO_BOX(combo),
> +                       separator_function, NULL, NULL);
> +@@ -335,14 +335,14 @@ void update_wifi_ipv4(struct config_data *data,
> guint policy)
> +       case CONNMAN_POLICY_DHCP:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 0);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 0);
> +                       gtk_widget_set_sensitive(entry[i], 0);
> +               }
> +               break;
> +       case CONNMAN_POLICY_MANUAL:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 1);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 1);
> +                       gtk_widget_set_sensitive(entry[i], 1);
> +               }
> +               break;
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> index 3521c7f..a56bd37 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>
>  file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb
> \
>
>  file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
>
> -DEPENDS = "gtk+ dbus-glib dbus-glib-native intltool-native gettext-native"
> +DEPENDS = "gtk+3 dbus-glib dbus-glib-native intltool-native
> gettext-native"
>
>  # 0.7 tag
>  SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
> @@ -15,12 +15,13 @@ SRC_URI = "git://
> github.com/connectivity/connman-gnome.git \
>             file://null_check_for_ipv4_config.patch \
>             file://images/* \
>             file://connman-gnome-fix-dbus-interface-name.patch \
> +           file://0001-Port-to-Gtk3.patch \
>            "
>
>  S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
> -ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  RDEPENDS_${PN} = "connman"
>
> diff --git
> a/meta/recipes-connectivity/connman/connman/0001-Port-to-Gtk3.patch
> b/meta/recipes-connectivity/connman/connman/0001-Port-to-Gtk3.patch
> new file mode 100644
> index 0000000..c93e9b4
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-Port-to-Gtk3.patch
> @@ -0,0 +1,277 @@
> +From a59b0fac02e74a971ac3f08bf28c17ce361a9526 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 2 Mar 2016 15:47:49 +0200
> +Subject: [PATCH] Port to Gtk3
> +
> +Some unused (or not useful) code was removed, functionality should stay
> +the same.
> +
> +Code still contains quite a few uses of deprecated API.
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + applet/agent.c        |  3 +--
> + applet/main.c         | 43 -------------------------------------------
> + applet/status.c       |  8 --------
> + configure.ac          |  3 +--
> + properties/ethernet.c | 14 +++++++-------
> + properties/main.c     |  2 +-
> + properties/wifi.c     | 12 ++++++------
> + 7 files changed, 16 insertions(+), 69 deletions(-)
> +
> +diff --git a/applet/agent.c b/applet/agent.c
> +index 65bed08..04fe86a 100644
> +--- a/applet/agent.c
> ++++ b/applet/agent.c
> +@@ -126,7 +126,6 @@ static void request_input_dialog(GHashTable *request,
> +       gtk_window_set_position(GTK_WINDOW(dialog), GTK_WIN_POS_CENTER);
> +       gtk_window_set_keep_above(GTK_WINDOW(dialog), TRUE);
> +       gtk_window_set_urgency_hint(GTK_WINDOW(dialog), TRUE);
> +-      gtk_dialog_set_has_separator(GTK_DIALOG(dialog), FALSE);
> +       input->dialog = dialog;
> +
> +       gtk_dialog_add_button(GTK_DIALOG(dialog),
> +@@ -139,7 +138,7 @@ static void request_input_dialog(GHashTable *request,
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 4);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 20);
> +       gtk_container_set_border_width(GTK_CONTAINER(table), 12);
> +-      gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), table);
> ++      gtk_container_add(GTK_CONTAINER(gtk_dialog_get_content_area
> (GTK_DIALOG(dialog))), table);
> +
> +       label = gtk_label_new(_("Please provide some network
> information:"));
> +       gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.0);
> +diff --git a/applet/main.c b/applet/main.c
> +index f12d371..cd16285 100644
> +--- a/applet/main.c
> ++++ b/applet/main.c
> +@@ -157,46 +157,6 @@ static void name_owner_changed(DBusGProxy *proxy,
> const char *name,
> +       }
> + }
> +
> +-static void open_uri(GtkWindow *parent, const char *uri)
> +-{
> +-      GtkWidget *dialog;
> +-      GdkScreen *screen;
> +-      GError *error = NULL;
> +-      gchar *cmdline;
> +-
> +-      screen = gtk_window_get_screen(parent);
> +-
> +-      cmdline = g_strconcat("xdg-open ", uri, NULL);
> +-
> +-      if (gdk_spawn_command_line_on_screen(screen,
> +-                              cmdline, &error) == FALSE) {
> +-              dialog = gtk_message_dialog_new(parent,
> +-                              GTK_DIALOG_DESTROY_WITH_PARENT,
> GTK_MESSAGE_ERROR,
> +-                              GTK_BUTTONS_CLOSE, "%s", error->message);
> +-              gtk_dialog_run(GTK_DIALOG(dialog));
> +-              gtk_widget_destroy(dialog);
> +-              g_error_free(error);
> +-      }
> +-
> +-      g_free(cmdline);
> +-}
> +-
> +-static void about_url_hook(GtkAboutDialog *dialog,
> +-                              const gchar *url, gpointer data)
> +-{
> +-      open_uri(GTK_WINDOW(dialog), url);
> +-}
> +-
> +-static void about_email_hook(GtkAboutDialog *dialog,
> +-                              const gchar *email, gpointer data)
> +-{
> +-      gchar *uri;
> +-
> +-      uri = g_strconcat("mailto:", email, NULL);
> +-      open_uri(GTK_WINDOW(dialog), uri);
> +-      g_free(uri);
> +-}
> +-
> + static void about_callback(GtkWidget *item, gpointer user_data)
> + {
> +       const gchar *authors[] = {
> +@@ -204,9 +164,6 @@ static void about_callback(GtkWidget *item, gpointer
> user_data)
> +               NULL
> +       };
> +
> +-      gtk_about_dialog_set_url_hook(about_url_hook, NULL, NULL);
> +-      gtk_about_dialog_set_email_hook(about_email_hook, NULL, NULL);
> +-
> +       gtk_show_about_dialog(NULL, "version", VERSION,
> +                       "copyright", "Copyright \xc2\xa9 2008 Intel
> Corporation",
> +                       "comments", _("A connection manager for the GNOME
> desktop"),
> +diff --git a/applet/status.c b/applet/status.c
> +index aed6f1e..015ff29 100644
> +--- a/applet/status.c
> ++++ b/applet/status.c
> +@@ -102,8 +102,6 @@ static void icon_animation_start(IconAnimation
> *animation,
> + {
> +       available = TRUE;
> +
> +-      gtk_status_icon_set_tooltip(statusicon, NULL);
> +-
> +       animation->start = start;
> +       animation->end = (end == 0) ? animation->count - 1 : end;
> +
> +@@ -120,8 +118,6 @@ static void icon_animation_stop(IconAnimation
> *animation)
> + {
> +       available = TRUE;
> +
> +-      gtk_status_icon_set_tooltip(statusicon, NULL);
> +-
> +       if (animation->id > 0)
> +               g_source_remove(animation->id);
> +
> +@@ -251,8 +247,6 @@ void status_unavailable(void)
> +       available = FALSE;
> +
> +       gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_notifier);
> +-      gtk_status_icon_set_tooltip(statusicon,
> +-                              "Connection Manager daemon is not
> running");
> +
> +       gtk_status_icon_set_visible(statusicon, TRUE);
> + }
> +@@ -299,7 +293,6 @@ static void set_ready(gint signal)
> +
> +       if (signal < 0) {
> +               gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_wired);
> +-              gtk_status_icon_set_tooltip(statusicon, NULL);
> +               return;
> +       }
> +
> +@@ -311,7 +304,6 @@ static void set_ready(gint signal)
> +               index = 4;
> +
> +       gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_signal[index]);
> +-      gtk_status_icon_set_tooltip(statusicon, NULL);
> + }
> +
> + struct timeout_data {
> +diff --git a/configure.ac b/configure.ac
> +index b972e07..a4dad5d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -55,8 +55,7 @@ AC_SUBST(DBUS_LIBS)
> + DBUS_BINDING_TOOL="dbus-binding-tool"
> + AC_SUBST(DBUS_BINDING_TOOL)
> +
> +-PKG_CHECK_MODULES(GTK, gtk+-2.0 >= 2.8, dummy=yes,
> +-                              AC_MSG_ERROR(gtk+ >= 2.8 is required))
> ++PKG_CHECK_MODULES(GTK, gtk+-3.0)
> + AC_SUBST(GTK_CFLAGS)
> + AC_SUBST(GTK_LIBS)
> +
> +diff --git a/properties/ethernet.c b/properties/ethernet.c
> +index 31db7a0..0b6b423 100644
> +--- a/properties/ethernet.c
> ++++ b/properties/ethernet.c
> +@@ -82,7 +82,7 @@ void add_ethernet_switch_button(GtkWidget *mainbox,
> GtkTreeIter *iter,
> +       gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
> +       gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
> +
> +-      table = gtk_table_new(1, 1, TRUE);
> ++      table = gtk_table_new(1, 1, FALSE);
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 10);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 10);
> +       gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
> +@@ -136,7 +136,7 @@ void add_ethernet_service(GtkWidget *mainbox,
> GtkTreeIter *iter, struct config_d
> +       gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
> +       gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
> +
> +-      table = gtk_table_new(5, 5, TRUE);
> ++      table = gtk_table_new(5, 5, FALSE);
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 10);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 10);
> +       gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
> +@@ -144,9 +144,9 @@ void add_ethernet_service(GtkWidget *mainbox,
> GtkTreeIter *iter, struct config_d
> +       label = gtk_label_new(_("Configuration:"));
> +       gtk_table_attach_defaults(GTK_TABLE(table), label, 1, 2, 0, 1);
> +
> +-      combo = gtk_combo_box_new_text();
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "DHCP");
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "MANUAL");
> ++      combo = gtk_combo_box_text_new();
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "DHCP");
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo),
> "MANUAL");
> +       gtk_combo_box_set_row_separator_func(GTK_COMBO_BOX(combo),
> +                                       separator_function, NULL, NULL);
> +       gtk_table_attach_defaults(GTK_TABLE(table), combo, 2, 4, 0, 1);
> +@@ -219,7 +219,7 @@ void update_ethernet_ipv4(struct config_data *data,
> guint policy)
> +       case CONNMAN_POLICY_DHCP:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 0);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 0);
> +                       gtk_widget_set_sensitive(entry[i], 0);
> +                       gtk_entry_set_text(GTK_ENTRY(entry[i]), _(""));
> +               }
> +@@ -227,7 +227,7 @@ void update_ethernet_ipv4(struct config_data *data,
> guint policy)
> +       case CONNMAN_POLICY_MANUAL:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 1);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 1);
> +                       gtk_widget_set_sensitive(entry[i], 1);
> +               }
> +               break;
> +diff --git a/properties/main.c b/properties/main.c
> +index c05f443..6f76361 100644
> +--- a/properties/main.c
> ++++ b/properties/main.c
> +@@ -429,7 +429,7 @@ static GtkWidget *create_interfaces(GtkWidget *window)
> +
> +       scrolled = gtk_scrolled_window_new(NULL, NULL);
> +       gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scrolled),
> +-                              GTK_POLICY_AUTOMATIC,
> GTK_POLICY_AUTOMATIC);
> ++                              GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
> +       gtk_scrolled_window_set_shadow_type(GTK_SCROLLED_WINDOW(scrolled),
> +                                                       GTK_SHADOW_OUT);
> +       gtk_box_pack_start(GTK_BOX(hbox), scrolled, FALSE, TRUE, 0);
> +diff --git a/properties/wifi.c b/properties/wifi.c
> +index bd325ef..a5827e0 100644
> +--- a/properties/wifi.c
> ++++ b/properties/wifi.c
> +@@ -125,7 +125,7 @@ void add_wifi_switch_button(GtkWidget *mainbox,
> GtkTreeIter *iter,
> +       gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
> +       gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
> +
> +-      table = gtk_table_new(1, 1, TRUE);
> ++      table = gtk_table_new(1, 1, FALSE);
> +       gtk_table_set_row_spacings(GTK_TABLE(table), 10);
> +       gtk_table_set_col_spacings(GTK_TABLE(table), 10);
> +       gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
> +@@ -185,9 +185,9 @@ static void wifi_ipconfig(GtkWidget *table, struct
> config_data *data, GtkTreeIte
> +       gtk_table_attach_defaults(GTK_TABLE(table), label, 1, 2, 3, 4);
> +       data->ipv4.label[0] = label;
> +
> +-      combo = gtk_combo_box_new_text();
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "DHCP");
> +-      gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "Manual");
> ++      combo = gtk_combo_box_text_new();
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "DHCP");
> ++      gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo),
> "Manual");
> +
> +       gtk_combo_box_set_row_separator_func(GTK_COMBO_BOX(combo),
> +                       separator_function, NULL, NULL);
> +@@ -335,14 +335,14 @@ void update_wifi_ipv4(struct config_data *data,
> guint policy)
> +       case CONNMAN_POLICY_DHCP:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 0);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 0);
> +                       gtk_widget_set_sensitive(entry[i], 0);
> +               }
> +               break;
> +       case CONNMAN_POLICY_MANUAL:
> +               gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 1);
> +               for (i = 0; i < 3; i++) {
> +-                      gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);
> ++                      gtk_editable_set_editable(GTK_EDITABLE(entry[i]),
> 1);
> +                       gtk_widget_set_sensitive(entry[i], 1);
> +               }
> +               break;
> +--
> +2.8.1
> +
> --
> 2.1.4
>
>

--001a11c17ab87ca6700534e8cbd5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 10 June 2016 at 11:04, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border=
-left-color:rgb(204,204,204);padding-left:1ex"><div class=3D""><div class=
=3D"h5">Upstream is not really active anymore: patch the Gtk+3 upgrade<br>
in for now (long term solution is to change to another UI).<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../connman/connman-gnome/0001-Port-to-Gtk3.patch=C2=A0 | 277 +++++++=
++++++++++++++<br>
=C2=A0.../connman/<a href=3D"http://connman-gnome_0.7.bb" rel=3D"noreferrer=
" target=3D"_blank">connman-gnome_0.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0.../connman/connman/0001-Port-to-Gtk3.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 277 +++++++++++++++++++++<br>
=C2=A03 files changed, 557 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/connman/connman-gnome/00=
01-Port-to-Gtk3.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/connman/connman/0001-Por=
t-to-Gtk3.patch<br></div></div></blockquote><div><br></div><div>... that st=
ill wasn&#39;t right: I&#39;ve removed the completely unnecessary duplicate=
 patch and force pushed the same jku/sato-gtk3-v2=C2=A0branch.=C2=A0</div><=
div>Sorry about that and thanks to Alexander for keeping eyes open.</div><d=
iv><br></div><div>Jussi<br></div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-lef=
t:1ex"><div class=3D""><div class=3D"h5">
diff --git a/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-G=
tk3.patch b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gt=
k3.patch<br>
new file mode 100644<br>
index 0000000..c93e9b4<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.pat=
ch<br>
@@ -0,0 +1,277 @@<br>
+From a59b0fac02e74a971ac3f08bf28c17ce361a9526 Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Wed, 2 Mar 2016 15:47:49 +0200<br>
+Subject: [PATCH] Port to Gtk3<br>
+<br>
+Some unused (or not useful) code was removed, functionality should stay<br=
>
+the same.<br>
+<br>
+Code still contains quite a few uses of deprecated API.<br>
+<br>
+Upstream-Status: Submitted<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ applet/agent.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br>
+ applet/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 ---------------------=
----------------------<br>
+ applet/status.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 --------<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br>
+ properties/ethernet.c | 14 +++++++-------<br>
+ properties/main.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ properties/wifi.c=C2=A0 =C2=A0 =C2=A0| 12 ++++++------<br>
+ 7 files changed, 16 insertions(+), 69 deletions(-)<br>
+<br>
+diff --git a/applet/agent.c b/applet/agent.c<br>
+index 65bed08..04fe86a 100644<br>
+--- a/applet/agent.c<br>
++++ b/applet/agent.c<br>
+@@ -126,7 +126,6 @@ static void request_input_dialog(GHashTable *request,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_window_set_position(GTK_WINDOW(dialog), GTK=
_WIN_POS_CENTER);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_window_set_keep_above(GTK_WINDOW(dialog), T=
RUE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_window_set_urgency_hint(GTK_WINDOW(dialog),=
 TRUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_dialog_set_has_separator(GTK_DIALOG(dialog), FAL=
SE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0input-&gt;dialog =3D dialog;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_dialog_add_button(GTK_DIALOG(dialog),<br>
+@@ -139,7 +138,7 @@ static void request_input_dialog(GHashTable *request,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 4)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 20=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(ta=
ble), 12);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)-&=
gt;vbox), table);<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_container_add(GTK_CONTAINER(gtk_dialog_get_conte=
nt_area (GTK_DIALOG(dialog))), table);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D gtk_label_new(_(&quot;Please provide =
some network information:&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.=
0);<br>
+diff --git a/applet/main.c b/applet/main.c<br>
+index f12d371..cd16285 100644<br>
+--- a/applet/main.c<br>
++++ b/applet/main.c<br>
+@@ -157,46 +157,6 @@ static void name_owner_changed(DBusGProxy *proxy, con=
st char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-static void open_uri(GtkWindow *parent, const char *uri)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 GtkWidget *dialog;<br>
+-=C2=A0 =C2=A0 =C2=A0 GdkScreen *screen;<br>
+-=C2=A0 =C2=A0 =C2=A0 GError *error =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 gchar *cmdline;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 screen =3D gtk_window_get_screen(parent);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 cmdline =3D g_strconcat(&quot;xdg-open &quot;, uri, =
NULL);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (gdk_spawn_command_line_on_screen(screen,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdline, &amp;error) =3D=3D FALSE) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dialog =3D gtk_message_d=
ialog_new(parent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE=
_ERROR,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_BUTTONS_CLOSE, &quot;%s&quot;, error-&g=
t;message);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_dialog_run(GTK_DIALO=
G(dialog));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_widget_destroy(dialo=
g);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_error_free(error);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 g_free(cmdline);<br>
+-}<br>
+-<br>
+-static void about_url_hook(GtkAboutDialog *dialog,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar *url, gpointer data)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 open_uri(GTK_WINDOW(dialog), url);<br>
+-}<br>
+-<br>
+-static void about_email_hook(GtkAboutDialog *dialog,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar *email, gpointer data)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 gchar *uri;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 uri =3D g_strconcat(&quot;mailto:&quot;, email, NULL=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 open_uri(GTK_WINDOW(dialog), uri);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_free(uri);<br>
+-}<br>
+-<br>
+ static void about_callback(GtkWidget *item, gpointer user_data)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const gchar *authors[] =3D {<br>
+@@ -204,9 +164,6 @@ static void about_callback(GtkWidget *item, gpointer u=
ser_data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_about_dialog_set_url_hook(about_url_hook, NULL, =
NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_about_dialog_set_email_hook(about_email_hook, NU=
LL, NULL);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_show_about_dialog(NULL, &quot;version&quot;=
, VERSION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;copyright&quot;, &quot;Copyright \xc2\xa9 2008 Intel Corpor=
ation&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;comments&quot;, _(&quot;A connection manager for the GNOME =
desktop&quot;),<br>
+diff --git a/applet/status.c b/applet/status.c<br>
+index aed6f1e..015ff29 100644<br>
+--- a/applet/status.c<br>
++++ b/applet/status.c<br>
+@@ -102,8 +102,6 @@ static void icon_animation_start(IconAnimation *animat=
ion,<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0available =3D TRUE;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon, NULL);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0animation-&gt;start =3D start;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0animation-&gt;end =3D (end =3D=3D 0) ? animatio=
n-&gt;count - 1 : end;<br>
+<br>
+@@ -120,8 +118,6 @@ static void icon_animation_stop(IconAnimation *animati=
on)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0available =3D TRUE;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon, NULL);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (animation-&gt;id &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_source_remove(ani=
mation-&gt;id);<br>
+<br>
+@@ -251,8 +247,6 @@ void status_unavailable(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0available =3D FALSE;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set_from_pixbuf(statusicon, pix=
buf_notifier);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Connection Manager daemon is not runn=
ing&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set_visible(statusicon, TRUE);<=
br>
+ }<br>
+@@ -299,7 +293,6 @@ static void set_ready(gint signal)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (signal &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set=
_from_pixbuf(statusicon, pixbuf_wired);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tool=
tip(statusicon, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -311,7 +304,6 @@ static void set_ready(gint signal)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index =3D 4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set_from_pixbuf(statusicon, pix=
buf_signal[index]);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon, NULL);<br>
+ }<br>
+<br>
+ struct timeout_data {<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index b972e07..a4dad5d 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -55,8 +55,7 @@ AC_SUBST(DBUS_LIBS)<br>
+ DBUS_BINDING_TOOL=3D&quot;dbus-binding-tool&quot;<br>
+ AC_SUBST(DBUS_BINDING_TOOL)<br>
+<br>
+-PKG_CHECK_MODULES(GTK, gtk+-2.0 &gt;=3D 2.8, dummy=3Dyes,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR(gtk+ &gt;=3D 2.8 is required))=
<br>
++PKG_CHECK_MODULES(GTK, gtk+-3.0)<br>
+ AC_SUBST(GTK_CFLAGS)<br>
+ AC_SUBST(GTK_LIBS)<br>
+<br>
+diff --git a/properties/ethernet.c b/properties/ethernet.c<br>
+index 31db7a0..0b6b423 100644<br>
+--- a/properties/ethernet.c<br>
++++ b/properties/ethernet.c<br>
+@@ -82,7 +82,7 @@ void add_ethernet_switch_button(GtkWidget *mainbox, GtkT=
reeIter *iter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(vb=
ox), 24);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALS=
E, FALSE, 0);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, FALSE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(vbox), table, FALSE,=
 FALSE, 0);<br>
+@@ -136,7 +136,7 @@ void add_ethernet_service(GtkWidget *mainbox, GtkTreeI=
ter *iter, struct config_d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(vb=
ox), 24);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALS=
E, FALSE, 0);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(5, 5, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(5, 5, FALSE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(vbox), table, FALSE,=
 FALSE, 0);<br>
+@@ -144,9 +144,9 @@ void add_ethernet_service(GtkWidget *mainbox, GtkTreeI=
ter *iter, struct config_d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D gtk_label_new(_(&quot;Configuration:&=
quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_attach_defaults(GTK_TABLE(table), lab=
el, 1, 2, 0, 1);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_new_text();<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;DHCP&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;MANUAL&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_text_new();<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;DHCP&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;MANUAL&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_row_separator_func(GTK_COMBO_=
BOX(combo),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0separator=
_function, NULL, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_attach_defaults(GTK_TABLE(table), com=
bo, 2, 4, 0, 1);<br>
+@@ -219,7 +219,7 @@ void update_ethernet_ipv4(struct config_data *data, gu=
int policy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_DHCP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_entry_set_text(GTK_ENTRY(entry[i]), _(&quot;&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -227,7 +227,7 @@ void update_ethernet_ipv4(struct config_data *data, gu=
int policy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_MANUAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+diff --git a/properties/main.c b/properties/main.c<br>
+index c05f443..6f76361 100644<br>
+--- a/properties/main.c<br>
++++ b/properties/main.c<br>
+@@ -429,7 +429,7 @@ static GtkWidget *create_interfaces(GtkWidget *window)=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0scrolled =3D gtk_scrolled_window_new(NULL, NULL=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_scrolled_window_set_policy(GTK_SCROLLED_WIN=
DOW(scrolled),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_scrolled_window_set_shadow_type(GTK_SCROLLE=
D_WINDOW(scrolled),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GTK_SHADOW_OUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(hbox), scrolled, FAL=
SE, TRUE, 0);<br>
+diff --git a/properties/wifi.c b/properties/wifi.c<br>
+index bd325ef..a5827e0 100644<br>
+--- a/properties/wifi.c<br>
++++ b/properties/wifi.c<br>
+@@ -125,7 +125,7 @@ void add_wifi_switch_button(GtkWidget *mainbox, GtkTre=
eIter *iter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(vb=
ox), 24);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALS=
E, FALSE, 0);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, FALSE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(vbox), table, FALSE,=
 FALSE, 0);<br>
+@@ -185,9 +185,9 @@ static void wifi_ipconfig(GtkWidget *table, struct con=
fig_data *data, GtkTreeIte<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_attach_defaults(GTK_TABLE(table), lab=
el, 1, 2, 3, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;ipv4.label[0] =3D label;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_new_text();<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;DHCP&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;Manual&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_text_new();<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;DHCP&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;Manual&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_row_separator_func(GTK_COMBO_=
BOX(combo),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0separator_function, NULL, NULL);<br>
+@@ -335,14 +335,14 @@ void update_wifi_ipv4(struct config_data *data, guin=
t policy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_DHCP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_MANUAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-connectivity/connman/<a href=3D"http://connman-gn=
ome_0.7.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a> b=
/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7.bb" =
rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
index 3521c7f..a56bd37 100644<br>
--- a/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
+++ b/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Deb723b61539=
feef013de476e68b5c50a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://properties/main.c;beginline=3D1;endline=3D20;md5=3D50c77c81871308=
b033ab7a1504626afb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://common/connman-dbus.c;beginline=3D1;endline=3D20;md5=3Dde6b485c0e=
717a0236402d220187717a&quot;<br>
<br>
-DEPENDS =3D &quot;gtk+ dbus-glib dbus-glib-native intltool-native gettext-=
native&quot;<br>
+DEPENDS =3D &quot;gtk+3 dbus-glib dbus-glib-native intltool-native gettext=
-native&quot;<br>
<br>
=C2=A0# 0.7 tag<br>
=C2=A0SRCREV =3D &quot;cf3c325b23dae843c5499a113591cfbc98acb143&quot;<br>
@@ -15,12 +15,13 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/co=
nnectivity/connman-gnome.git" rel=3D"noreferrer" target=3D"_blank">github.c=
om/connectivity/connman-gnome.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://null_check_for_ipv4_config=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://images/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://connman-gnome-fix-dbus-int=
erface-name.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Port-to-Gtk3.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_=
check<br>
-ANY_OF_DISTRO_FEATURES =3D &quot;${GTK2DISTROFEATURES}&quot;<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;connman&quot;<br>
<br>
diff --git a/meta/recipes-connectivity/connman/connman/0001-Port-to-Gtk3.pa=
tch b/meta/recipes-connectivity/connman/connman/0001-Port-to-Gtk3.patch<br>
new file mode 100644<br>
index 0000000..c93e9b4<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/connman/connman/0001-Port-to-Gtk3.patch<br>
@@ -0,0 +1,277 @@<br>
+From a59b0fac02e74a971ac3f08bf28c17ce361a9526 Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Wed, 2 Mar 2016 15:47:49 +0200<br>
+Subject: [PATCH] Port to Gtk3<br>
+<br>
+Some unused (or not useful) code was removed, functionality should stay<br=
>
+the same.<br>
+<br>
+Code still contains quite a few uses of deprecated API.<br>
+<br>
+Upstream-Status: Submitted<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ applet/agent.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br>
+ applet/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 ---------------------=
----------------------<br>
+ applet/status.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 --------<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br>
+ properties/ethernet.c | 14 +++++++-------<br>
+ properties/main.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ properties/wifi.c=C2=A0 =C2=A0 =C2=A0| 12 ++++++------<br>
+ 7 files changed, 16 insertions(+), 69 deletions(-)<br>
+<br>
+diff --git a/applet/agent.c b/applet/agent.c<br>
+index 65bed08..04fe86a 100644<br>
+--- a/applet/agent.c<br>
++++ b/applet/agent.c<br>
+@@ -126,7 +126,6 @@ static void request_input_dialog(GHashTable *request,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_window_set_position(GTK_WINDOW(dialog), GTK=
_WIN_POS_CENTER);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_window_set_keep_above(GTK_WINDOW(dialog), T=
RUE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_window_set_urgency_hint(GTK_WINDOW(dialog),=
 TRUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_dialog_set_has_separator(GTK_DIALOG(dialog), FAL=
SE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0input-&gt;dialog =3D dialog;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_dialog_add_button(GTK_DIALOG(dialog),<br>
+@@ -139,7 +138,7 @@ static void request_input_dialog(GHashTable *request,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 4)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 20=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(ta=
ble), 12);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)-&=
gt;vbox), table);<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_container_add(GTK_CONTAINER(gtk_dialog_get_conte=
nt_area (GTK_DIALOG(dialog))), table);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D gtk_label_new(_(&quot;Please provide =
some network information:&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.=
0);<br>
+diff --git a/applet/main.c b/applet/main.c<br>
+index f12d371..cd16285 100644<br>
+--- a/applet/main.c<br>
++++ b/applet/main.c<br>
+@@ -157,46 +157,6 @@ static void name_owner_changed(DBusGProxy *proxy, con=
st char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-static void open_uri(GtkWindow *parent, const char *uri)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 GtkWidget *dialog;<br>
+-=C2=A0 =C2=A0 =C2=A0 GdkScreen *screen;<br>
+-=C2=A0 =C2=A0 =C2=A0 GError *error =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 gchar *cmdline;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 screen =3D gtk_window_get_screen(parent);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 cmdline =3D g_strconcat(&quot;xdg-open &quot;, uri, =
NULL);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (gdk_spawn_command_line_on_screen(screen,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdline, &amp;error) =3D=3D FALSE) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dialog =3D gtk_message_d=
ialog_new(parent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE=
_ERROR,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_BUTTONS_CLOSE, &quot;%s&quot;, error-&g=
t;message);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_dialog_run(GTK_DIALO=
G(dialog));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_widget_destroy(dialo=
g);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_error_free(error);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 g_free(cmdline);<br>
+-}<br>
+-<br>
+-static void about_url_hook(GtkAboutDialog *dialog,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar *url, gpointer data)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 open_uri(GTK_WINDOW(dialog), url);<br>
+-}<br>
+-<br>
+-static void about_email_hook(GtkAboutDialog *dialog,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar *email, gpointer data)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 gchar *uri;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 uri =3D g_strconcat(&quot;mailto:&quot;, email, NULL=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 open_uri(GTK_WINDOW(dialog), uri);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_free(uri);<br>
+-}<br>
+-<br>
+ static void about_callback(GtkWidget *item, gpointer user_data)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const gchar *authors[] =3D {<br>
+@@ -204,9 +164,6 @@ static void about_callback(GtkWidget *item, gpointer u=
ser_data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_about_dialog_set_url_hook(about_url_hook, NULL, =
NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_about_dialog_set_email_hook(about_email_hook, NU=
LL, NULL);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_show_about_dialog(NULL, &quot;version&quot;=
, VERSION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;copyright&quot;, &quot;Copyright \xc2\xa9 2008 Intel Corpor=
ation&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;comments&quot;, _(&quot;A connection manager for the GNOME =
desktop&quot;),<br>
+diff --git a/applet/status.c b/applet/status.c<br>
+index aed6f1e..015ff29 100644<br>
+--- a/applet/status.c<br>
++++ b/applet/status.c<br>
+@@ -102,8 +102,6 @@ static void icon_animation_start(IconAnimation *animat=
ion,<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0available =3D TRUE;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon, NULL);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0animation-&gt;start =3D start;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0animation-&gt;end =3D (end =3D=3D 0) ? animatio=
n-&gt;count - 1 : end;<br>
+<br>
+@@ -120,8 +118,6 @@ static void icon_animation_stop(IconAnimation *animati=
on)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0available =3D TRUE;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon, NULL);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (animation-&gt;id &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_source_remove(ani=
mation-&gt;id);<br>
+<br>
+@@ -251,8 +247,6 @@ void status_unavailable(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0available =3D FALSE;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set_from_pixbuf(statusicon, pix=
buf_notifier);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Connection Manager daemon is not runn=
ing&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set_visible(statusicon, TRUE);<=
br>
+ }<br>
+@@ -299,7 +293,6 @@ static void set_ready(gint signal)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (signal &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set=
_from_pixbuf(statusicon, pixbuf_wired);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tool=
tip(statusicon, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -311,7 +304,6 @@ static void set_ready(gint signal)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index =3D 4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_status_icon_set_from_pixbuf(statusicon, pix=
buf_signal[index]);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_status_icon_set_tooltip(statusicon, NULL);<br>
+ }<br>
+<br>
+ struct timeout_data {<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index b972e07..a4dad5d 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -55,8 +55,7 @@ AC_SUBST(DBUS_LIBS)<br>
+ DBUS_BINDING_TOOL=3D&quot;dbus-binding-tool&quot;<br>
+ AC_SUBST(DBUS_BINDING_TOOL)<br>
+<br>
+-PKG_CHECK_MODULES(GTK, gtk+-2.0 &gt;=3D 2.8, dummy=3Dyes,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR(gtk+ &gt;=3D 2.8 is required))=
<br>
++PKG_CHECK_MODULES(GTK, gtk+-3.0)<br>
+ AC_SUBST(GTK_CFLAGS)<br>
+ AC_SUBST(GTK_LIBS)<br>
+<br>
+diff --git a/properties/ethernet.c b/properties/ethernet.c<br>
+index 31db7a0..0b6b423 100644<br>
+--- a/properties/ethernet.c<br>
++++ b/properties/ethernet.c<br>
+@@ -82,7 +82,7 @@ void add_ethernet_switch_button(GtkWidget *mainbox, GtkT=
reeIter *iter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(vb=
ox), 24);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALS=
E, FALSE, 0);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, FALSE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(vbox), table, FALSE,=
 FALSE, 0);<br>
+@@ -136,7 +136,7 @@ void add_ethernet_service(GtkWidget *mainbox, GtkTreeI=
ter *iter, struct config_d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(vb=
ox), 24);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALS=
E, FALSE, 0);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(5, 5, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(5, 5, FALSE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(vbox), table, FALSE,=
 FALSE, 0);<br>
+@@ -144,9 +144,9 @@ void add_ethernet_service(GtkWidget *mainbox, GtkTreeI=
ter *iter, struct config_d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D gtk_label_new(_(&quot;Configuration:&=
quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_attach_defaults(GTK_TABLE(table), lab=
el, 1, 2, 0, 1);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_new_text();<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;DHCP&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;MANUAL&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_text_new();<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;DHCP&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;MANUAL&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_row_separator_func(GTK_COMBO_=
BOX(combo),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0separator=
_function, NULL, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_attach_defaults(GTK_TABLE(table), com=
bo, 2, 4, 0, 1);<br>
+@@ -219,7 +219,7 @@ void update_ethernet_ipv4(struct config_data *data, gu=
int policy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_DHCP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_entry_set_text(GTK_ENTRY(entry[i]), _(&quot;&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -227,7 +227,7 @@ void update_ethernet_ipv4(struct config_data *data, gu=
int policy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_MANUAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+diff --git a/properties/main.c b/properties/main.c<br>
+index c05f443..6f76361 100644<br>
+--- a/properties/main.c<br>
++++ b/properties/main.c<br>
+@@ -429,7 +429,7 @@ static GtkWidget *create_interfaces(GtkWidget *window)=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0scrolled =3D gtk_scrolled_window_new(NULL, NULL=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_scrolled_window_set_policy(GTK_SCROLLED_WIN=
DOW(scrolled),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_scrolled_window_set_shadow_type(GTK_SCROLLE=
D_WINDOW(scrolled),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GTK_SHADOW_OUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(hbox), scrolled, FAL=
SE, TRUE, 0);<br>
+diff --git a/properties/wifi.c b/properties/wifi.c<br>
+index bd325ef..a5827e0 100644<br>
+--- a/properties/wifi.c<br>
++++ b/properties/wifi.c<br>
+@@ -125,7 +125,7 @@ void add_wifi_switch_button(GtkWidget *mainbox, GtkTre=
eIter *iter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_container_set_border_width(GTK_CONTAINER(vb=
ox), 24);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALS=
E, FALSE, 0);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D gtk_table_new(1, 1, FALSE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_row_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_set_col_spacings(GTK_TABLE(table), 10=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_box_pack_start(GTK_BOX(vbox), table, FALSE,=
 FALSE, 0);<br>
+@@ -185,9 +185,9 @@ static void wifi_ipconfig(GtkWidget *table, struct con=
fig_data *data, GtkTreeIte<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_table_attach_defaults(GTK_TABLE(table), lab=
el, 1, 2, 3, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;ipv4.label[0] =3D label;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_new_text();<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;DHCP&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_append_text(GTK_COMBO_BOX(combo), &quo=
t;Manual&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 combo =3D gtk_combo_box_text_new();<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;DHCP&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(co=
mbo), &quot;Manual&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_row_separator_func(GTK_COMBO_=
BOX(combo),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0separator_function, NULL, NULL);<br>
+@@ -335,14 +335,14 @@ void update_wifi_ipv4(struct config_data *data, guin=
t policy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_DHCP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case CONNMAN_POLICY_MANUAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_combo_box_set_a=
ctive(GTK_COMBO_BOX(combo), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 3; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gtk_widget_set_sensitive(entry[i], 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+--<br>
+2.8.1<br>
+<br>
--<br>
2.1.4<br>
<br>
</div></div></blockquote></div><br></div></div>

--001a11c17ab87ca6700534e8cbd5--
