Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840F8CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 09:23:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149954.1781601790586209092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 02:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LDWkDAoC;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so29876625e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781601789; x=1782206589; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqNHdwqACc5kUr91Qs2Nv24HATI3HOjp7Z1ZJdSoqEk=;
        b=LDWkDAoC7slgvzD823KUL9ghUw4V5ar49bTsAQla2aYxlkhwWjeJe9fuh7lE7R1PeA
         36B5CHOySYgMT6M/lmZiDKEUjJUchihfvLuhX/rLCwFXKd/qoTQ4UPMlLPBfaYIpoMoX
         HUnHI1KWWEL4QkUVZclgF46GilsV+iBm7Uygg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601789; x=1782206589;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqNHdwqACc5kUr91Qs2Nv24HATI3HOjp7Z1ZJdSoqEk=;
        b=gnadBfbJMF7Pr8VkhW+cEuyRjRw58UsvSL02LB3m9f0+EYjeCqpqudjB+kM35sDkBF
         6eDVBT96IMTlUyC1lVGdZ6wz5L4uLK8fnTBcZtxLfE8LjYXPKxUf9E1RZg0lbxAK+eQp
         NBXO5UjAltUPpoagT+saPCeAaI4zQtLD3KxojWQVf1cDOQ8GW+Yg6xilT9bT8gNoR8hO
         4BUsQaDU93mVgTqbGgNrBwfyCc30rzWu5uM5mVsIEt1oTnmL+Tl6ajjuu6LqETEm9mXA
         d56wZgrJ1Ms4JmsUWyigqzrq3SWTwYiIh2buGID8Y5pUVpkowt190f+BkbgUBvxpE4NA
         ReGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DroxxpGJvDiijAcVrg4zuHZVAFC0dk2tYZh/gxXCQxgqjckLL1KjPNMXvatfuVMEOsNI0NUZGA4t8MuCww7cxjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVJrwClaJXa95v3PmXPfK90ds2DYkJ39OUFiznTwJtRmh1KzMz
	WEtPHiqxQYF1d/Aqy0QUta5Joxw3CB037OWqaV02Ei3otm7JS/9Ef5F7VzhoqG8yCr1hihHTUrp
	EXPi9
X-Gm-Gg: Acq92OG4n+GmEln2k10vF5HizCXSfbsQDb0b9C02llsS7PHP6Bcvi3zglo1uqnVlk7L
	FDoocSy6lflKFTfSPPsPknBNbtYSwxH8noMxkesfQPgEE+fFzLhwQrDoFNaSZFXXijGiOxuMMUa
	eOEe87oBktKrWglEXvUmXXso7VKtSC4dh5vxUS2ftT2KpA3+Uu0xfOdqr8qgpbkAD7fByYtmVdy
	kXwE9Y13um7SZGYD3KgVgAScX1DcxtPldz6Rh+KWwliLKdSCGnUqwG5acB8v+gjZcbrlw6vgxlr
	LTYW9tk53S3oyx+YLY7dlW8qCGkHoT3HNJ4lZS0Pm6F2SWEJfcI2fzvUhZ50+aO6ptDYXwxfTCm
	xspHbOv/bhiE7yv4LbX4SsuR1B0TrveMiLZWLYKu5SklsV97Sv7Vf19ZZanjRKg0Hs2lgJCmuPJ
	aAF3rlOV3woxK8rjqZ+RzGoNgmq+yhzzu0CEYYga35Nl//+ZmsGR/ww8H0i/ZmhDp8bHCtfT5nf
	8WiJmSMWUpwCWln
X-Received: by 2002:a05:600c:a06:b0:490:b645:3213 with SMTP id 5b1f17b1804b1-4922011dfb9mr200256045e9.19.1781601788546;
        Tue, 16 Jun 2026 02:23:08 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9563b8sm268025945e9.2.2026.06.16.02.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:23:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 11:23:07 +0200
Message-Id: <DJAD4I96LHH1.1SRNZZ3ZA097Y@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 4/4] libsoup-2.4: fix
 CVE-2025-32049
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260429061533.858115-1-changqing.li@windriver.com>
 <20260429061533.858115-4-changqing.li@windriver.com>
In-Reply-To: <20260429061533.858115-4-changqing.li@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238883

On Wed Apr 29, 2026 at 8:15 AM CEST, Changqing Li via lists.openembedded.or=
g wrote:
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/390
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ++++++++++++++++++
>  .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +
>  3 files changed, 362 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
49-1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
49-2.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.pa=
tch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
> new file mode 100644
> index 0000000000..64e87cb1ec
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
> @@ -0,0 +1,229 @@
> +From c574e659c41c18fad3973bbaa3b3ec75664b3137 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 5 Feb 2026 16:20:02 +0800
> +Subject: [PATCH 1/2] websocket: add a way to restrict the total message =
size
> +
> +Otherwise a client could send small packages smaller than
> +total-incoming-payload-size but still to break the server
> +with a big allocation
> +
> +Fixes: #390
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/db87805ab565d67533dfed2cb409dbfd63c7fdce]
> +CVE: CVE-2025-32049
> +
> +libsoup2 is not maintained, the patch is backported from libsoup3, and
> +change accordingly

Hello,

To accept this patch, I would need details on "change accordingly". Can
you list what changes were needed and why? Then, send a v2.

Thanks!

> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-websocket-connection.c | 104 ++++++++++++++++++++++++++--
> + libsoup/soup-websocket-connection.h |   7 ++
> + 2 files changed, 107 insertions(+), 4 deletions(-)
> +
> +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocke=
t-connection.c
> +index 9d5f4f8..3dad477 100644
> +--- a/libsoup/soup-websocket-connection.c
> ++++ b/libsoup/soup-websocket-connection.c
> +@@ -85,7 +85,8 @@ enum {
> + 	PROP_STATE,
> + 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
> + 	PROP_KEEPALIVE_INTERVAL,
> +-	PROP_EXTENSIONS
> ++	PROP_EXTENSIONS,
> ++	PROP_MAX_TOTAL_MESSAGE_SIZE,
> + };
> +=20
> + enum {
> +@@ -120,6 +121,7 @@ struct _SoupWebsocketConnectionPrivate {
> + 	char *origin;
> + 	char *protocol;
> + 	guint64 max_incoming_payload_size;
> ++	guint64 max_total_message_size;
> + 	guint keepalive_interval;
> +=20
> + 	gushort peer_close_code;
> +@@ -152,6 +154,7 @@ struct _SoupWebsocketConnectionPrivate {
> + };
> +=20
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +=20
> +@@ -664,7 +667,7 @@ bad_data_error_and_close (SoupWebsocketConnection *s=
elf)
> + }
> +=20
> + static void
> +-too_big_error_and_close (SoupWebsocketConnection *self,
> ++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self=
,
> +                          guint64 payload_len)
> + {
> + 	GError *error;
> +@@ -680,6 +683,23 @@ too_big_error_and_close (SoupWebsocketConnection *s=
elf,
> + 	emit_error_and_close (self, error, TRUE);
> + }
> +=20
> ++static void
> ++too_big_message_error_and_close (SoupWebsocketConnection *self,
> ++                                 guint64 len)
> ++{
> ++	GError *error;
> ++
> ++	error =3D g_error_new_literal (SOUP_WEBSOCKET_ERROR,
> ++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
> ++				     self->pv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SER=
VER ?
> ++				     "Received WebSocket payload from the client larger than config=
ured max-total-message-size" :
> ++				     "Received WebSocket payload from the server larger than config=
ured max-total-message-size");
> ++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater=
, but max supported size is %" G_GUINT64_FORMAT,
> ++	         self->pv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SE=
RVER ? "server" : "client",
> ++	         len, self->pv->max_total_message_size);
> ++	emit_error_and_close (self, error, TRUE);
> ++}
> ++
> + static void
> + close_connection (SoupWebsocketConnection *self,
> +                   gushort                  code,
> +@@ -913,6 +933,12 @@ process_contents (SoupWebsocketConnection *self,
> + 		switch (pv->message_opcode) {
> + 		case 0x01:
> + 		case 0x02:
> ++			/* Safety valve */
> ++			if (pv->max_total_message_size > 0 &&
> ++			    (pv->message_data->len + payload_len) > pv->max_total_message_si=
ze) {
> ++				too_big_message_error_and_close (self, (pv->message_data->len + pay=
load_len));
> ++				return;
> ++			}
> + 			g_byte_array_append (pv->message_data, payload, payload_len);
> + 			break;
> + 		default:
> +@@ -1050,7 +1076,7 @@ process_frame (SoupWebsocketConnection *self)
> + 	/* Safety valve */
> + 	if (self->pv->max_incoming_payload_size > 0 &&
> + 	    payload_len >=3D self->pv->max_incoming_payload_size) {
> +-		too_big_error_and_close (self, payload_len);
> ++		too_big_incoming_payload_error_and_close (self, payload_len);
> + 		return FALSE;
> + 	}
> +=20
> +@@ -1357,6 +1383,10 @@ soup_websocket_connection_get_property (GObject *=
object,
> + 		g_value_set_pointer (value, pv->extensions);
> + 		break;
> +=20
> ++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++		g_value_set_uint64 (value, pv->max_total_message_size);
> ++		break;
> ++
> + 	default:
> + 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> + 		break;
> +@@ -1410,6 +1440,10 @@ soup_websocket_connection_set_property (GObject *=
object,
> + 		pv->extensions =3D g_value_get_pointer (value);
> + 		break;
> +=20
> ++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++		pv->max_total_message_size =3D g_value_get_uint64 (value);
> ++		break;
> ++
> + 	default:
> + 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> + 		break;
> +@@ -1631,7 +1665,24 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> +                                                                G_PARAM_=
READWRITE |
> +                                                                G_PARAM_=
CONSTRUCT_ONLY |
> +                                                                G_PARAM_=
STATIC_STRINGS));
> +-
> ++	/**
> ++	 * SoupWebsocketConnection:max-total-message-size:
> ++	 *
> ++	 * The total message size for incoming packets.
> ++	 *
> ++	 * The protocol expects or 0 to not limit it.
> ++	 *
> ++	 */
> ++	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE=
_SIZE,
> ++					g_param_spec_uint64 ("max-total-message-size",
> ++					                     "Max total message size",
> ++					                     "Max total message size ",
> ++					                     0,
> ++					                     G_MAXUINT64,
> ++					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++					                     G_PARAM_READWRITE |
> ++					                     G_PARAM_CONSTRUCT |
> ++					                     G_PARAM_STATIC_STRINGS));
> + 	/**
> + 	 * SoupWebsocketConnection::message:
> + 	 * @self: the WebSocket
> +@@ -2145,6 +2196,51 @@ soup_websocket_connection_set_max_incoming_payloa=
d_size (SoupWebsocketConnection
> + 	}
> + }
> +=20
> ++/**
> ++ * soup_websocket_connection_get_max_total_message_size:
> ++ * @self: the WebSocket
> ++ *
> ++ * Gets the maximum total message size allowed for packets.
> ++ *
> ++ * Returns: the maximum total message size.
> ++ *
> ++ */
> ++guint64
> ++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConn=
ection *self)
> ++{
> ++   SoupWebsocketConnectionPrivate *pv;
> ++
> ++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL=
_MESSAGE_SIZE_DEFAULT);
> ++   pv =3D self->pv;
> ++
> ++   return pv->max_total_message_size;
> ++}
> ++
> ++/**
> ++ * soup_websocket_connection_set_max_total_message_size:
> ++ * @self: the WebSocket
> ++ * @max_total_message_size: the maximum total message size
> ++ *
> ++ * Sets the maximum total message size allowed for packets.
> ++ *
> ++ * It does not limit the outgoing packet size.
> ++ *
> ++ */
> ++void
> ++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConn=
ection *self,
> ++                                                      guint64          =
        max_total_message_size)
> ++{
> ++   SoupWebsocketConnectionPrivate *pv;
> ++
> ++   g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
> ++   pv =3D self->pv;
> ++
> ++   if (pv->max_total_message_size !=3D max_total_message_size) {
> ++       pv->max_total_message_size =3D max_total_message_size;
> ++       g_object_notify (G_OBJECT (self), "max-total-message-size");
> ++   }
> ++}
> ++
> + /**
> +  * soup_websocket_connection_get_keepalive_interval:
> +  * @self: the WebSocket
> +diff --git a/libsoup/soup-websocket-connection.h b/libsoup/soup-websocke=
t-connection.h
> +index f82d723..d2a60e9 100644
> +--- a/libsoup/soup-websocket-connection.h
> ++++ b/libsoup/soup-websocket-connection.h
> +@@ -136,6 +136,13 @@ SOUP_AVAILABLE_IN_2_58
> + void                soup_websocket_connection_set_keepalive_interval (S=
oupWebsocketConnection *self,
> +                                                                       g=
uint                    interval);
> +=20
> ++SOUP_AVAILABLE_IN_2_72
> ++guint64             soup_websocket_connection_get_max_total_message_siz=
e    (SoupWebsocketConnection *self);
> ++
> ++SOUP_AVAILABLE_IN_2_72
> ++void                soup_websocket_connection_set_max_total_message_siz=
e    (SoupWebsocketConnection *self,
> ++                                                                       =
      guint64                  max_total_message_size);
> ++
> + G_END_DECLS
> +=20
> + #endif /* __SOUP_WEBSOCKET_CONNECTION_H__ */
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.pa=
tch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
> new file mode 100644
> index 0000000000..f9c894aaec
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
> @@ -0,0 +1,131 @@
> +From 0bfc66f1082f5d47df99b6fc03f742ef7fa1051e Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 5 Feb 2026 17:19:51 +0800
> +Subject: [PATCH] Set message size limit in SoupServer rather than=20
> + SoupWebsocketConnection
> +
> +We're not sure about the compatibility implications of having a default
> +size limit for clients.
> +
> +Also not sure whether the server limit is actually set appropriately,
> +but there is probably very little server usage of
> +SoupWebsocketConnection in the wild, so it's not so likely to break
> +things.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-server.c               | 24 +++++++++++++++++++-----
> + libsoup/soup-websocket-connection.c | 23 ++++++++++++++++-------
> + 2 files changed, 35 insertions(+), 12 deletions(-)
> +
> +diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c
> +index 63875f3..a3f8597 100644
> +--- a/libsoup/soup-server.c
> ++++ b/libsoup/soup-server.c
> +@@ -216,6 +216,16 @@ enum {
> +=20
> + G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
> +=20
> ++/* SoupWebsocketConnection by default limits only maximum packet size. =
But a
> ++ * message may consist of multiple packets, so SoupServer additionally =
restricts
> ++ * total message size to mitigate denial of service attacks on the serv=
er.
> ++ * SoupWebsocketConnection does not do this by default because I don't =
know
> ++ * whether that would or would not cause compatibility problems for web=
sites.
> ++ *
> ++ * This size is in bytes and it is arbitrary.
> ++ */
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> ++
> + static SoupClientContext *soup_client_context_ref (SoupClientContext *c=
lient);
> + static void soup_client_context_unref (SoupClientContext *client);
> +=20
> +@@ -1445,11 +1455,15 @@ complete_websocket_upgrade (SoupMessage *msg, gp=
ointer user_data)
> +=20
> + 	soup_client_context_ref (client);
> + 	stream =3D soup_client_context_steal_connection (client);
> +-	conn =3D soup_websocket_connection_new_with_extensions (stream, uri,
> +-							      SOUP_WEBSOCKET_CONNECTION_SERVER,
> +-							      soup_message_headers_get_one (msg->request_headers, "Origi=
n"),
> +-							      soup_message_headers_get_one (msg->response_headers, "Sec-=
WebSocket-Protocol"),
> +-							      handler->websocket_extensions);
> ++	conn =3D SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_=
CONNECTION,
> ++						          "io-stream", stream,
> ++						          "uri", uri,
> ++						          "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
> ++						          "origin", soup_message_headers_get_one (msg->request_he=
aders, "Origin"),
> ++						          "protocol", soup_message_headers_get_one (msg->response=
_headers, "Sec-WebSocket-Protocol"),
> ++						          "extensions", handler->websocket_extensions,
> ++						          "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SI=
ZE_DEFAULT,
> ++                                 NULL));
> + 	handler->websocket_extensions =3D NULL;
> + 	g_object_unref (stream);
> + 	soup_client_context_unref (client);
> +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocke=
t-connection.c
> +index 3dad477..e7fa9b7 100644
> +--- a/libsoup/soup-websocket-connection.c
> ++++ b/libsoup/soup-websocket-connection.c
> +@@ -154,7 +154,6 @@ struct _SoupWebsocketConnectionPrivate {
> + };
> +=20
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> +-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +=20
> +@@ -1615,8 +1614,9 @@ soup_websocket_connection_class_init (SoupWebsocke=
tConnectionClass *klass)
> + 	/**
> + 	 * SoupWebsocketConnection:max-incoming-payload-size:
> + 	 *
> +-	 * The maximum payload size for incoming packets the protocol expects
> +-	 * or 0 to not limit it.
> ++	 * The maximum payload size for incoming packets, or 0 to not limit it=
.
> ++	 * Each message may consist of multiple packets, so also refer to
> ++	 * [property@WebSocketConnection:max-total-message-size].
> + 	 *
> + 	 * Since: 2.56
> + 	 */
> +@@ -1668,9 +1668,18 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> + 	/**
> + 	 * SoupWebsocketConnection:max-total-message-size:
> + 	 *
> +-	 * The total message size for incoming packets.
> ++	 * The maximum size for incoming messages.
> ++	 * Set to a value to limit the total message size, or 0 to not
> ++	 * limit it.
> + 	 *
> +-	 * The protocol expects or 0 to not limit it.
> ++	 * [method@Server.add_websocket_handler] will set this to a nonzero
> ++	 * default value to mitigate denial of service attacks. Clients must
> ++	 * choose their own default if they need to mitigate denial of service
> ++	 * attacks. You also need to set your own default if creating your own
> ++	 * server SoupWebsocketConnection without using SoupServer.
> ++	 *
> ++	 * Each message may consist of multiple packets, so also refer to
> ++	 *[property@WebSocketConnection:max-incoming-payload-size].
> + 	 *
> + 	 */
> + 	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE=
_SIZE,
> +@@ -1679,7 +1688,7 @@ soup_websocket_connection_class_init (SoupWebsocke=
tConnectionClass *klass)
> + 					                     "Max total message size ",
> + 					                     0,
> + 					                     G_MAXUINT64,
> +-					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++					                     0,
> + 					                     G_PARAM_READWRITE |
> + 					                     G_PARAM_CONSTRUCT |
> + 					                     G_PARAM_STATIC_STRINGS));
> +@@ -2210,7 +2219,7 @@ soup_websocket_connection_get_max_total_message_si=
ze (SoupWebsocketConnection *s
> + {
> +    SoupWebsocketConnectionPrivate *pv;
> +=20
> +-   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL=
_MESSAGE_SIZE_DEFAULT);
> ++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
> +    pv =3D self->pv;
> +=20
> +    return pv->max_total_message_size;
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 253a389e21..915d735da3 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -42,6 +42,8 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
>             file://CVE-2025-14523.patch \
> +           file://CVE-2025-32049-1.patch \
> +           file://CVE-2025-32049-2.patch \
>  "
>  SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03415=
3df1413fa1d92f13"
> =20


--=20
Yoann Congal
Smile ECS


