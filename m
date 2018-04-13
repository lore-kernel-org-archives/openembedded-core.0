Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA5A74787
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 20:44:19 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g203-v6so14304768lfg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=PHwdx5w5aDd50akyHhGeWv6U2p9uGQtJHVhEz1f5kaM=;
	b=mD1GUpGjt1cmHxE2MQ0Xb2qzVwAdGY+K32WzNqxWQxcBajTWAf4p18Samgu1VYJU2c
	SqRVkX69/8Gxa2idULtEHAVPS/MWza/ZEm9EPfLwg2RsyckYonTDSE6sYYQx61A5uwUo
	EhWx+/g8bFqZZtQLqsOgQO+mDgoZRYt5ZHZTW4+CZY3VL8zC6/d1WcwKHQxVz1I4V2uf
	h2z/SfIcy2f71gRRJQTrFtRSzgykK0PvUb1x4aj8+FgIt5FiX/2XdOeQyoW7fM2fQJsw
	yZiIK4n886i8XCJdF3qMb+IUX6vC5d47shsRpluUJwRKvqsbja7sXlOEZMB5hnBpMcb7
	qdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=PHwdx5w5aDd50akyHhGeWv6U2p9uGQtJHVhEz1f5kaM=;
	b=DSeBLX7sC2C1rENiGU+G7srN4t5/8aPLcIkgxy/ID89YY77aEzIlTdsaPMhR/aTSOo
	N5Rkk5dbUk0EvQIcsbT769DLSSyWDwQCDMxX4FgaWu9xYKaeYqXBXcLXv3VTKRhAwA4X
	8cpf5bmgFjrXU2vPI4eHzQbuuKnr9EQYJ7eFnMnBg/O7GHESO7HtfRMy6618Zf0jqGlo
	eHvCvkvN//cvY+O8v1/nXwX2WtfN60ThJYBlLLpYPhS0vk2Y4o3DZpByxN9ulGDvAzUj
	ijarFvR2FeP7NyXNVDLMIk1CdZLiuD7FCbU4sbvS862UW7q8p8nrpYxd21j+LQ9wPVty
	J3Qg==
X-Gm-Message-State: ALQs6tAg6ckytRAiOvFiZW7jfvQnf1SUBzwO8fRM/yFrkd5g2g4e1KFQ
	PUEb6Rnj0kwWkEG1dwY3erwKZ/bXM97te6oSYss=
X-Google-Smtp-Source: AIpwx4+Il3+SI6CqKzgg1yZLr+RIX/QrRnO3sAYjeuWB7vwJF6jSNjx3x2vb02t+gjht6DlOsYyra5DHcXUp6EqC/rc=
X-Received: by 10.46.154.9 with SMTP id o9mr4374889lji.98.1523652260381; Fri,
	13 Apr 2018 13:44:20 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.46.42.66 with HTTP; Fri, 13 Apr 2018 13:43:49 -0700 (PDT)
In-Reply-To: <1523643063-39747-1-git-send-email-juro.bystricky@intel.com>
References: <1523643063-39747-1-git-send-email-juro.bystricky@intel.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 13 Apr 2018 13:43:49 -0700
X-Google-Sender-Auth: gm7Ngax4WYZsvpMng0NJk77gPLc
Message-ID: <CAKmqyKM3Fv5fiyfbO5vpqiDDdO=VNnpCbt9bvv7bn1M+XQdtig@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu_2.11.1.bb: support mingw build
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
X-List-Received-Date: Fri, 13 Apr 2018 20:44:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 13, 2018 at 11:11 AM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> The patch chardev-connect-socket-to-a-spawned-command.patch calls
> "socketpair". This function is missing in mingw, so the patch
> needs to be modified accordingly (by conditional compilation using
> _WIN32 macro where appropriate), otherwise we end up with a broken
> mingw build.
>
> While it is possible to simply remove the whole patch for mingw build
> (via a .bbappend file in meta-mingw), it makes more sense to modify
> the patch itself.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  ...ardev-connect-socket-to-a-spawned-command.patch | 46 +++++++++++++++-------
>  1 file changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
> index 32809d3..6e6bf95 100644
> --- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
> +++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
> @@ -54,10 +54,11 @@ diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>  index 53eda8ef00..f566107c35 100644
>  --- a/chardev/char-socket.c
>  +++ b/chardev/char-socket.c
> -@@ -852,6 +852,66 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
> +@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
>       return false;
>   }
>
> ++#ifndef _WIN32
>  +static void chardev_open_socket_cmd(Chardev *chr,
>  +                                    const char *cmd,
>  +                                    Error **errp)
> @@ -117,42 +118,49 @@ index 53eda8ef00..f566107c35 100644
>  +        object_unref(OBJECT(sioc));
>  +    }
>  +}
> ++#endif
>  +
>   static void qmp_chardev_open_socket(Chardev *chr,
>                                       ChardevBackend *backend,
>                                       bool *be_opened,
> -@@ -859,6 +919,7 @@ static void qmp_chardev_open_socket(Chardev *chr,
> +@@ -859,6 +921,9 @@
>   {
>       SocketChardev *s = SOCKET_CHARDEV(chr);
>       ChardevSocket *sock = backend->u.socket.data;
> ++#ifndef _WIN32
>  +    const char *cmd     = sock->cmd;
> ++#endif
>       bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
>       bool is_listen      = sock->has_server  ? sock->server  : true;
>       bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
> -@@ -926,7 +987,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
> +@@ -925,7 +990,14 @@
> +     } else if (reconnect > 0) {
>           s->reconnect_time = reconnect;
>       }
> -
> --    if (s->reconnect_time) {
> +-
> ++#ifndef _WIN32
>  +    if (cmd) {
>  +        chardev_open_socket_cmd(chr, cmd, errp);
>  +
>  +        /* everything ready (or failed permanently) before we return */
>  +        *be_opened = true;
> -+    } else if (s->reconnect_time) {
> ++    } else
> ++#endif
> +     if (s->reconnect_time) {
>           sioc = qio_channel_socket_new();
>           tcp_chr_set_client_ioc_name(chr, sioc);
> -         qio_channel_socket_connect_async(sioc, s->addr,
> -@@ -985,11 +1051,22 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
> +@@ -985,10 +1057,26 @@
>       const char *host = qemu_opt_get(opts, "host");
>       const char *port = qemu_opt_get(opts, "port");
>       const char *tls_creds = qemu_opt_get(opts, "tls-creds");
> ++#ifndef _WIN32
>  +    const char *cmd = qemu_opt_get(opts, "cmd");
> ++#endif
>       SocketAddressLegacy *addr;
>       ChardevSocket *sock;
>
>       backend->type = CHARDEV_BACKEND_KIND_SOCKET;
> --    if (!path) {
> ++#ifndef _WIN32
>  +    if (cmd) {
>  +        /*
>  +         * Here we have to ensure that no options are set which are incompatible with
> @@ -163,24 +171,33 @@ index 53eda8ef00..f566107c35 100644
>  +            error_setg(errp, "chardev: socket: cmd does not support any additional options");
>  +            return;
>  +        }
> -+    } else if (!path) {
> ++    } else
> ++#endif
> +     if (!path) {
>           if (!host) {
>               error_setg(errp, "chardev: socket: no host given");
> -             return;
> -@@ -1021,13 +1098,14 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
> +@@ -1021,13 +1109,24 @@
>       sock->has_reconnect = true;
>       sock->reconnect = reconnect;
>       sock->tls_creds = g_strdup(tls_creds);
> ++#ifndef _WIN32
>  +    sock->cmd = g_strdup(cmd);
> ++#endif
>
>       addr = g_new0(SocketAddressLegacy, 1);
> --    if (path) {
> ++#ifndef _WIN32
>  +    if (path || cmd) {
> ++#else
> +     if (path) {
> ++#endif
>           UnixSocketAddress *q_unix;
>           addr->type = SOCKET_ADDRESS_LEGACY_KIND_UNIX;
>           q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
> --        q_unix->path = g_strdup(path);
> ++#ifndef _WIN32
>  +        q_unix->path = cmd ? g_strdup_printf("cmd:%s", cmd) : g_strdup(path);
> ++#else
> +         q_unix->path = g_strdup(path);
> ++#endif
>       } else {
>           addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
>           addr->u.inet.data = g_new(InetSocketAddress, 1);
> @@ -223,4 +240,3 @@ index ae19dcd1ed..6de0f29bcd 100644
>                                        '*wait'      : 'bool',
>  --
>  2.14.1
> -
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

