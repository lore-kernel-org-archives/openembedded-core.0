Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id DA7F173710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:17:30 +0000 (UTC)
Received: by qgep37 with SMTP id p37so43592158qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wRpV2oyx034G5Y+C8sXdx5bHcszvwkeCTGBDxkTTBtY=;
	b=bol3C6vHtM7mvKeON2zl3/NpnEViFMvL9dT1ksvaaPOEXop10isCXlwl9dj1NolVMm
	To20VsyMA++b/lQsxJAURhIRYnaQl+6BSxD86tF1G3Jbyps7YKvewc8OqHrnLNW/HZOQ
	jeXRJPKOLKRkgo2OOHTwt02R1msHh6pFn93gaxAVZ/7LlslXYEYqSZ/aBjZRC4091hRT
	0kMXLRxtD2DbYkSfAgMBP3Mm6zlcn7OKThWDZf/EUgd4e/ddVtLFchbc2EU4LfFMLext
	tRpvXwYWVP4Z6LHsIv0jDRg5TT9C7Hle4e33yPqmWh8CTIlSA0OQi3311uxgacojKBoZ
	zVRg==
X-Gm-Message-State: ALoCoQk8ExHOFnuxU3eRfIYT1OxsLihdz32Rkcf2YGzzKDDlEyZwUGL0+93uykRW8lvnp9nUjO+X
X-Received: by 10.140.150.142 with SMTP id 136mr35563086qhw.17.1436566651000; 
	Fri, 10 Jul 2015 15:17:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:17:11 -0700 (PDT)
In-Reply-To: <1434504886-4212-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1434504886-4212-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:17:11 +0100
Message-ID: <CAJTo0LYZttp-EUKvzTr9eysyqVyo2X+aPd7bDya8D-q9Gqk57Q@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lighttpd: Bug fix
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
X-List-Received-Date: Fri, 10 Jul 2015 22:17:32 -0000
Content-Type: multipart/alternative; boundary=001a11357d4aede5e2051a8cbc0b

--001a11357d4aede5e2051a8cbc0b
Content-Type: text/plain; charset=UTF-8

The short log should be more expressive than "bug fix", and is Pending the
correct upstream status?

Ross

On 17 June 2015 at 02:34, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> mod_cgi buffers data without bound,so fix it.
>
> Reference: http://redmine.lighttpd.net/issues/1264
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../0001-mod_cgi-buffers-data-without-bound.patch  | 386
> +++++++++++++++++++++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb  |   1 +
>  2 files changed, 387 insertions(+)
>  create mode 100644
> meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
>
> diff --git
> a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
> b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
> new file mode 100644
> index 0000000..e456182
> --- /dev/null
> +++
> b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
> @@ -0,0 +1,386 @@
> +From e6ccbab5d42b110ac4f6ce1f72cb1e9ccbe4400a Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 16 Jun 2015 19:02:38 +0900
> +Subject: [PATCH] mod_cgi buffers data without bound so fix it
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + doc/config/lighttpd.conf |   8 ++
> + src/mod_cgi.c            | 188
> ++++++++++++++++++++++++++++++++++++++++++++---
> + 2 files changed, 186 insertions(+), 10 deletions(-)
> +
> +diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
> +index 60b0ae1..9c101a7 100644
> +--- a/doc/config/lighttpd.conf
> ++++ b/doc/config/lighttpd.conf
> +@@ -375,6 +375,14 @@ server.upload-dirs = ( "/var/tmp" )
> + ##
> + #######################################################################
> +
> ++#######################################################################
> ++##
> ++##
> ++## maximum bytes in send_raw before backing off [KByte]
> ++##  cgi.high-waterlevel        = 10240
> ++## minimum bytes in send_raw to disable backoff [KByte]
> ++##  cgi.low-waterlevel         = 5120
> ++#######################################################################
> +
> + #######################################################################
> + ##
> +diff --git a/src/mod_cgi.c b/src/mod_cgi.c
> +index 734ecee..c51f43c 100644
> +--- a/src/mod_cgi.c
> ++++ b/src/mod_cgi.c
> +@@ -38,6 +38,10 @@
> +
> + #include "version.h"
> +
> ++/* for output logs */
> ++char msgbuf[2048];
> ++
> ++
> + enum {EOL_UNSET, EOL_N, EOL_RN};
> +
> + typedef struct {
> +@@ -53,9 +57,19 @@ typedef struct {
> +       size_t size;
> + } buffer_pid_t;
> +
> ++struct handler_ctx;
> ++
> ++typedef struct {
> ++      struct handler_ctx **hctx;
> ++      size_t used;
> ++      size_t size;
> ++} buffer_ctx_t;
> ++
> + typedef struct {
> +       array *cgi;
> +       unsigned short execute_x_only;
> ++      unsigned int high_waterlevel; /* maximum bytes in send_raw before
> backing off */
> ++      unsigned int low_waterlevel;  /* minimum bytes in send_raw to
> disable backoff */
> + } plugin_config;
> +
> + typedef struct {
> +@@ -68,9 +82,11 @@ typedef struct {
> +       plugin_config **config_storage;
> +
> +       plugin_config conf;
> ++
> ++      buffer_ctx_t cgi_ctx;
> + } plugin_data;
> +
> +-typedef struct {
> ++typedef struct handler_ctx {
> +       pid_t pid;
> +       int fd;
> +       int fde_ndx; /* index into the fd-event buffer */
> +@@ -78,11 +94,16 @@ typedef struct {
> +       connection *remote_conn;  /* dumb pointer */
> +       plugin_data *plugin_data; /* dumb pointer */
> +
> ++      int throttling;        /* 1=waiting for send_raw buffer to drain */
> ++      off_t high_waterlevel; /* maximum bytes in send_raw before backing
> off */
> ++      off_t low_waterlevel;  /* minimum bytes in send_raw to disable
> backoff */
> ++      off_t bytes_in_buffer;
> ++
> +       buffer *response;
> +       buffer *response_header;
> + } handler_ctx;
> +
> +-static handler_ctx * cgi_handler_ctx_init(void) {
> ++static handler_ctx * cgi_handler_ctx_init(plugin_data *p) {
> +       handler_ctx *hctx = calloc(1, sizeof(*hctx));
> +
> +       force_assert(hctx);
> +@@ -90,13 +111,26 @@ static handler_ctx * cgi_handler_ctx_init(void) {
> +       hctx->response = buffer_init();
> +       hctx->response_header = buffer_init();
> +
> ++      hctx->throttling = 0;
> ++      hctx->high_waterlevel = (off_t)p->conf.high_waterlevel * 1024;
> ++      hctx->low_waterlevel  = (off_t)p->conf.low_waterlevel  * 1024;
> ++      if (hctx->low_waterlevel >= hctx->high_waterlevel) {
> ++          hctx->low_waterlevel = hctx->high_waterlevel * 3 / 4; /* 75% */
> ++      }
> ++      hctx->bytes_in_buffer = 0;
> ++
> +       return hctx;
> + }
> +
> +-static void cgi_handler_ctx_free(handler_ctx *hctx) {
> ++static void cgi_handler_ctx_free(server *srv, handler_ctx *hctx) {
> +       buffer_free(hctx->response);
> +       buffer_free(hctx->response_header);
> +
> ++      /* to avoid confusion */
> ++      if (hctx->throttling) {
> ++          log_error_write(srv, __FILE__, __LINE__, "s", "unthrottled");
> ++      }
> ++
> +       free(hctx);
> + }
> +
> +@@ -152,6 +186,8 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> +       config_values_t cv[] = {
> +               { "cgi.assign",                  NULL, T_CONFIG_ARRAY,
> T_CONFIG_SCOPE_CONNECTION },       /* 0 */
> +               { "cgi.execute-x-only",          NULL, T_CONFIG_BOOLEAN,
> T_CONFIG_SCOPE_CONNECTION },     /* 1 */
> ++              { "cgi.high-waterlevel",         NULL, T_CONFIG_INT,
>  T_CONFIG_SCOPE_CONNECTION },       /* 2 */
> ++              { "cgi.low-waterlevel",          NULL, T_CONFIG_INT,
>  T_CONFIG_SCOPE_CONNECTION },       /* 3 */
> +               { NULL,                          NULL, T_CONFIG_UNSET,
> T_CONFIG_SCOPE_UNSET}
> +       };
> +
> +@@ -167,9 +203,13 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> +
> +               s->cgi    = array_init();
> +               s->execute_x_only = 0;
> ++              s->high_waterlevel = 0; /* 0 == disabled */
> ++              s->low_waterlevel  = 0;
> +
> +               cv[0].destination = s->cgi;
> +               cv[1].destination = &(s->execute_x_only);
> ++              cv[2].destination = &(s->high_waterlevel);
> ++              cv[3].destination = &(s->low_waterlevel);
> +
> +               p->config_storage[i] = s;
> +
> +@@ -182,6 +222,51 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> + }
> +
> +
> ++static void cgi_recount_bytes_in_buffer(handler_ctx *hctx)
> ++{
> ++      chunkqueue *cq = hctx->remote_conn->write_queue;
> ++      hctx->bytes_in_buffer = chunkqueue_length(cq) -
> chunkqueue_written(cq);
> ++}
> ++
> ++
> ++static void cgi_throttling_control(server *srv, handler_ctx *hctx)
> ++{
> ++      cgi_recount_bytes_in_buffer(hctx);
> ++
> ++#ifdef DEBUG
> ++      sprintf(msgbuf, "throttling=%d, chars=%llu, high=%llu, low=%llu",
> ++              hctx->throttling, hctx->bytes_in_buffer,
> ++              hctx->high_waterlevel, hctx->low_waterlevel);
> ++      log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                      "(debug) throttling control,", msgbuf);
> ++#endif
> ++
> ++      if (hctx->throttling) {
> ++              sprintf(msgbuf, "throttling; chars in queue=%llu,"
> ++                      " low-waterlevel=%llu, high-waterlevel=%llu",
> ++                      hctx->bytes_in_buffer,
> ++                      hctx->low_waterlevel, hctx->high_waterlevel);
> ++              log_error_write(srv, __FILE__, __LINE__, "s", msgbuf);
> ++              if (hctx->bytes_in_buffer <= hctx->low_waterlevel) {
> ++                      fdevent_event_set(srv->ev, &(hctx->fde_ndx),
> hctx->fd, FDEVENT_IN);
> ++                      hctx->throttling = 0;
> ++                      log_error_write(srv, __FILE__, __LINE__, "s",
> "unthrottled");
> ++              }
> ++      } else {
> ++              if (hctx->high_waterlevel != 0 &&
> ++                      hctx->high_waterlevel <= hctx->bytes_in_buffer) {
> ++                      fdevent_event_del(srv->ev, &(hctx->fde_ndx),
> hctx->fd);
> ++                      hctx->throttling = 1;
> ++                      sprintf(msgbuf, "throttled; chars in queue=%llu,"
> ++                              " low-waterlevel=%llu,
> high-waterlevel=%llu",
> ++                              hctx->bytes_in_buffer,
> ++                              hctx->low_waterlevel,
> hctx->high_waterlevel);
> ++                      log_error_write(srv, __FILE__, __LINE__, "s",
> msgbuf);
> ++              }
> ++      }
> ++}
> ++
> ++
> + static int cgi_pid_add(server *srv, plugin_data *p, pid_t pid) {
> +       int m = -1;
> +       size_t i;
> +@@ -228,6 +313,39 @@ static int cgi_pid_del(server *srv, plugin_data *p,
> pid_t pid) {
> +       return 0;
> + }
> +
> ++
> ++static void cgi_ctx_add(plugin_data *p, handler_ctx *hctx) {
> ++      buffer_ctx_t *r = &(p->cgi_ctx);
> ++
> ++      if (r->size == 0) {
> ++              r->size = 16;
> ++              r->hctx = malloc(sizeof(*r->hctx) * r->size);
> ++      } else if (r->used == r->size) {
> ++              r->size += 16;
> ++              r->hctx = realloc(r->hctx, sizeof(*r->hctx) * r->size);
> ++      }
> ++
> ++      r->hctx[r->used++] = hctx;
> ++}
> ++
> ++static void cgi_ctx_del(plugin_data *p, handler_ctx *hctx) {
> ++      size_t i;
> ++      buffer_ctx_t *r = &(p->cgi_ctx);
> ++
> ++      for (i = 0; i < r->used; i++) {
> ++              if (r->hctx[i] == hctx) break;
> ++      }
> ++
> ++      if (i != r->used) {
> ++              /* found */
> ++
> ++              if (i != r->used - 1) {
> ++                      r->hctx[i] = r->hctx[r->used - 1];
> ++              }
> ++              r->used--;
> ++      }
> ++}
> ++
> + static int cgi_response_parse(server *srv, connection *con, plugin_data
> *p, buffer *in) {
> +       char *ns;
> +       const char *s;
> +@@ -378,6 +496,13 @@ static int cgi_demux_response(server *srv,
> handler_ctx *hctx) {
> +
> +               hctx->response->ptr[n] = '\0';
> +               hctx->response->used = n+1;
> ++#ifdef DEBUG
> ++              sprintf(msgbuf, "n=%d, bytes_out=%llu, bytes_in=%llu", n,
> ++                      (unsigned long long)con->write_queue->bytes_out,
> ++                      (unsigned long long)con->write_queue->bytes_in);
> ++              log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                              "(debug) read,", msgbuf);
> ++#endif
> +
> +               /* split header from body */
> +
> +@@ -502,8 +627,20 @@ static int cgi_demux_response(server *srv,
> handler_ctx *hctx) {
> +                       }
> +               } else {
> +                       http_chunk_append_mem(srv, con,
> hctx->response->ptr, hctx->response->used);
> ++#ifdef DEBUG
> ++                      sprintf(msgbuf, "n=%d, bytes_out=%llu,
> bytes_in=%llu, limit=%llu", n,
> ++                              (unsigned long
> long)con->write_queue->bytes_out,
> ++                              (unsigned long
> long)con->write_queue->bytes_in,
> ++                              (unsigned long long)hctx->high_waterlevel);
> ++                      log_error_write(srv, __FILE__, __LINE__,
> ++                                      "ss", "(debug) append,", msgbuf);
> ++#endif
> +                       joblist_append(srv, con);
> +-              }
> ++                      cgi_throttling_control(srv, hctx);
> ++                      if (hctx->throttling) {
> ++                              return FDEVENT_HANDLED_NOT_FINISHED;
> ++                      }
> ++              }
> +
> + #if 0
> +               log_error_write(srv, __FILE__, __LINE__, "ddss", con->fd,
> hctx->fd, connection_get_state(con->state), b->ptr);
> +@@ -552,8 +689,9 @@ static handler_t cgi_connection_close(server *srv,
> handler_ctx *hctx) {
> +       con->plugin_ctx[p->id] = NULL;
> +
> +       /* is this a good idea ? */
> +-      cgi_handler_ctx_free(hctx);
> +-
> ++      cgi_ctx_del(p, hctx);
> ++      cgi_handler_ctx_free(srv, hctx);
> ++
> +       /* if waitpid hasn't been called by response.c yet, do it here */
> +       if (pid) {
> +               /* check if the CGI-script is already gone */
> +@@ -1156,7 +1294,8 @@ static int cgi_create_env(server *srv, connection
> *con, plugin_data *p, buffer *
> +               con->mode = p->id;
> +               buffer_reset(con->physical.path);
> +
> +-              hctx = cgi_handler_ctx_init();
> ++              hctx = cgi_handler_ctx_init(p);
> ++              cgi_ctx_add(p, hctx);
> +
> +               hctx->remote_conn = con;
> +               hctx->plugin_data = p;
> +@@ -1165,6 +1304,11 @@ static int cgi_create_env(server *srv, connection
> *con, plugin_data *p, buffer *
> +               hctx->fde_ndx = -1;
> +
> +               con->plugin_ctx[p->id] = hctx;
> ++#ifdef DEBUG
> ++              sprintf(msgbuf, "hctx=%p, con=%p", (void*)hctx,
> (void*)con);
> ++              log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                              "(debug) hctx generated, ", msgbuf);
> ++#endif
> +
> +               fdevent_register(srv->ev, hctx->fd, cgi_handle_fdevent,
> hctx);
> +               fdevent_event_set(srv->ev, &(hctx->fde_ndx), hctx->fd,
> FDEVENT_IN);
> +@@ -1179,7 +1323,8 @@ static int cgi_create_env(server *srv, connection
> *con, plugin_data *p, buffer *
> +
> +                       close(hctx->fd);
> +
> +-                      cgi_handler_ctx_free(hctx);
> ++                      cgi_ctx_del(p, hctx);
> ++                      cgi_handler_ctx_free(srv, hctx);
> +
> +                       con->plugin_ctx[p->id] = NULL;
> +
> +@@ -1204,6 +1349,8 @@ static int mod_cgi_patch_connection(server *srv,
> connection *con, plugin_data *p
> +
> +       PATCH(cgi);
> +       PATCH(execute_x_only);
> ++      PATCH(high_waterlevel);
> ++      PATCH(low_waterlevel);
> +
> +       /* skip the first, the global context */
> +       for (i = 1; i < srv->config_context->used; i++) {
> +@@ -1221,6 +1368,10 @@ static int mod_cgi_patch_connection(server *srv,
> connection *con, plugin_data *p
> +                               PATCH(cgi);
> +                       } else if (buffer_is_equal_string(du->key,
> CONST_STR_LEN("cgi.execute-x-only"))) {
> +                               PATCH(execute_x_only);
> ++                      } else if (buffer_is_equal_string(du->key,
> CONST_STR_LEN("cgi.high-waterlevel"))) {
> ++                              PATCH(high_waterlevel);
> ++                      } else if (buffer_is_equal_string(du->key,
> CONST_STR_LEN("cgi.low-waterlevel"))) {
> ++                              PATCH(low_waterlevel);
> +                       }
> +               }
> +       }
> +@@ -1273,6 +1424,21 @@ URIHANDLER_FUNC(cgi_is_handled) {
> + TRIGGER_FUNC(cgi_trigger) {
> +       plugin_data *p = p_d;
> +       size_t ndx;
> ++
> ++      for (ndx = 0; ndx < p->cgi_ctx.used; ndx++) {
> ++              handler_ctx *hctx = p->cgi_ctx.hctx[ndx];
> ++#ifdef DEBUG
> ++              connection *con = hctx->remote_conn;
> ++
> ++              sprintf(msgbuf, "hctx=%p, con=%p, bytes_in_buffer=%llu",
> ++                      (void*)hctx, (void*)con,
> ++                      (unsigned long long)hctx->bytes_in_buffer);
> ++              log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                              "(debug) found using ctx,", msgbuf);
> ++#endif
> ++              cgi_throttling_control(srv, hctx);
> ++      }
> ++
> +       /* the trigger handle only cares about lonely PID which we have to
> wait for */
> + #ifndef __WIN32
> +
> +@@ -1381,7 +1547,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
> +                       log_error_write(srv, __FILE__, __LINE__, "sds",
> "cgi close failed ", hctx->fd, strerror(errno));
> +               }
> +
> +-              cgi_handler_ctx_free(hctx);
> ++              cgi_ctx_del(p, hctx);
> ++              cgi_handler_ctx_free(srv, hctx);
> +
> +               con->plugin_ctx[p->id] = NULL;
> +
> +@@ -1413,7 +1580,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
> +                       log_error_write(srv, __FILE__, __LINE__, "sds",
> "cgi close failed ", hctx->fd, strerror(errno));
> +               }
> +
> +-              cgi_handler_ctx_free(hctx);
> ++              cgi_ctx_del(p, hctx);
> ++              cgi_handler_ctx_free(srv, hctx);
> +
> +               con->plugin_ctx[p->id] = NULL;
> +               return HANDLER_FINISHED;
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> index 0cf5aa2..d3888e6 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> @@ -24,6 +24,7 @@ SRC_URI = "
> http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
>          file://lighttpd \
>          file://lighttpd.service \
>          file://pkgconfig.patch \
> +        file://0001-mod_cgi-buffers-data-without-bound.patch \
>          "
>
>  SRC_URI[md5sum] = "f7a88130ee9984b421ad8aa80629750a"
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11357d4aede5e2051a8cbc0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The short log should be more expressive than &quot;bug fix=
&quot;, and is Pending the correct upstream status?<div><br></div><div>Ross=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17=
 June 2015 at 02:34, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto:lixin.f=
nst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">mod_cgi buffers data without b=
ound,so fix it.<br>
<br>
Reference: <a href=3D"http://redmine.lighttpd.net/issues/1264" rel=3D"noref=
errer" target=3D"_blank">http://redmine.lighttpd.net/issues/1264</a><br>
<br>
Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixi=
n.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0001-mod_cgi-buffers-data-without-bound.patch=C2=A0 | 386 +++++++=
++++++++++++++<br>
=C2=A0meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.35.bb" =
rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.35.bb</a>=C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 387 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_c=
gi-buffers-data-without-bound.patch<br>
<br>
diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-d=
ata-without-bound.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_=
cgi-buffers-data-without-bound.patch<br>
new file mode 100644<br>
index 0000000..e456182<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-wit=
hout-bound.patch<br>
@@ -0,0 +1,386 @@<br>
+From e6ccbab5d42b110ac4f6ce1f72cb1e9ccbe4400a Mon Sep 17 00:00:00 2001<br>
+From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixin.fnst@c=
n.fujitsu.com</a>&gt;<br>
+Date: Tue, 16 Jun 2015 19:02:38 +0900<br>
+Subject: [PATCH] mod_cgi buffers data without bound so fix it<br>
+<br>
+Upstream-Status: pending<br>
+<br>
+Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lix=
in.fnst@cn.fujitsu.com</a>&gt;<br>
+---<br>
+ doc/config/lighttpd.conf |=C2=A0 =C2=A08 ++<br>
+ src/mod_cgi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 188 ++++++++++++=
++++++++++++++++++++++++++++++++---<br>
+ 2 files changed, 186 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf<br>
+index 60b0ae1..9c101a7 100644<br>
+--- a/doc/config/lighttpd.conf<br>
++++ b/doc/config/lighttpd.conf<br>
+@@ -375,6 +375,14 @@ server.upload-dirs =3D ( &quot;/var/tmp&quot; )<br>
+ ##<br>
+ #######################################################################<b=
r>
+<br>
++#######################################################################<b=
r>
++##<br>
++##<br>
++## maximum bytes in send_raw before backing off [KByte]<br>
++##=C2=A0 cgi.high-waterlevel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 10240<br>
++## minimum bytes in send_raw to disable backoff [KByte]<br>
++##=C2=A0 cgi.low-waterlevel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 5120<br>
++#######################################################################<b=
r>
+<br>
+ #######################################################################<b=
r>
+ ##<br>
+diff --git a/src/mod_cgi.c b/src/mod_cgi.c<br>
+index 734ecee..c51f43c 100644<br>
+--- a/src/mod_cgi.c<br>
++++ b/src/mod_cgi.c<br>
+@@ -38,6 +38,10 @@<br>
+<br>
+ #include &quot;version.h&quot;<br>
+<br>
++/* for output logs */<br>
++char msgbuf[2048];<br>
++<br>
++<br>
+ enum {EOL_UNSET, EOL_N, EOL_RN};<br>
+<br>
+ typedef struct {<br>
+@@ -53,9 +57,19 @@ typedef struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size;<br>
+ } buffer_pid_t;<br>
+<br>
++struct handler_ctx;<br>
++<br>
++typedef struct {<br>
++=C2=A0 =C2=A0 =C2=A0 struct handler_ctx **hctx;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t used;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t size;<br>
++} buffer_ctx_t;<br>
++<br>
+ typedef struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0array *cgi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned short execute_x_only;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int high_waterlevel; /* maximum bytes in se=
nd_raw before backing off */<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int low_waterlevel;=C2=A0 /* minimum bytes =
in send_raw to disable backoff */<br>
+ } plugin_config;<br>
+<br>
+ typedef struct {<br>
+@@ -68,9 +82,11 @@ typedef struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0plugin_config **config_storage;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0plugin_config conf;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 buffer_ctx_t cgi_ctx;<br>
+ } plugin_data;<br>
+<br>
+-typedef struct {<br>
++typedef struct handler_ctx {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fde_ndx; /* index into the fd-event buffer =
*/<br>
+@@ -78,11 +94,16 @@ typedef struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0connection *remote_conn;=C2=A0 /* dumb pointer =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0plugin_data *plugin_data; /* dumb pointer */<br=
>
+<br>
++=C2=A0 =C2=A0 =C2=A0 int throttling;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 1=3Dwa=
iting for send_raw buffer to drain */<br>
++=C2=A0 =C2=A0 =C2=A0 off_t high_waterlevel; /* maximum bytes in send_raw =
before backing off */<br>
++=C2=A0 =C2=A0 =C2=A0 off_t low_waterlevel;=C2=A0 /* minimum bytes in send=
_raw to disable backoff */<br>
++=C2=A0 =C2=A0 =C2=A0 off_t bytes_in_buffer;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer *response;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer *response_header;<br>
+ } handler_ctx;<br>
+<br>
+-static handler_ctx * cgi_handler_ctx_init(void) {<br>
++static handler_ctx * cgi_handler_ctx_init(plugin_data *p) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0handler_ctx *hctx =3D calloc(1, sizeof(*hctx));=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0force_assert(hctx);<br>
+@@ -90,13 +111,26 @@ static handler_ctx * cgi_handler_ctx_init(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hctx-&gt;response =3D buffer_init();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hctx-&gt;response_header =3D buffer_init();<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 hctx-&gt;throttling =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 hctx-&gt;high_waterlevel =3D (off_t)p-&gt;conf.high_=
waterlevel * 1024;<br>
++=C2=A0 =C2=A0 =C2=A0 hctx-&gt;low_waterlevel=C2=A0 =3D (off_t)p-&gt;conf.=
low_waterlevel=C2=A0 * 1024;<br>
++=C2=A0 =C2=A0 =C2=A0 if (hctx-&gt;low_waterlevel &gt;=3D hctx-&gt;high_wa=
terlevel) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hctx-&gt;low_waterlevel =3D hctx-&gt;h=
igh_waterlevel * 3 / 4; /* 75% */<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 hctx-&gt;bytes_in_buffer =3D 0;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return hctx;<br>
+ }<br>
+<br>
+-static void cgi_handler_ctx_free(handler_ctx *hctx) {<br>
++static void cgi_handler_ctx_free(server *srv, handler_ctx *hctx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer_free(hctx-&gt;response);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer_free(hctx-&gt;response_header);<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 /* to avoid confusion */<br>
++=C2=A0 =C2=A0 =C2=A0 if (hctx-&gt;throttling) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error_write(srv, __FILE__, __LINE_=
_, &quot;s&quot;, &quot;unthrottled&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(hctx);<br>
+ }<br>
+<br>
+@@ -152,6 +186,8 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0config_values_t cv[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;cgi.assign&=
quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, =
T_CONFIG_ARRAY, T_CONFIG_SCOPE_CONNECTION },=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;cgi.execute=
-x-only&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, T_CONFIG_BOOLEAN, T_=
CONFIG_SCOPE_CONNECTION },=C2=A0 =C2=A0 =C2=A0/* 1 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;cgi.high-waterle=
vel&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, T_CONFIG_INT,=C2=A0 =C2=
=A0T_CONFIG_SCOPE_CONNECTION },=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;cgi.low-waterlev=
el&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, T_CONFIG_INT,=C2=A0 =C2=
=A0T_CONFIG_SCOPE_CONNECTION },=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 3 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ NULL,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NULL, T_CONFIG_UNSET, T_CONFIG_SCOPE_UNSET}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+@@ -167,9 +203,13 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;cgi=C2=A0 =C2=
=A0 =3D array_init();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;execute_x_onl=
y =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;high_waterlevel =
=3D 0; /* 0 =3D=3D disabled */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;low_waterlevel=C2=
=A0 =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cv[0].destination =
=3D s-&gt;cgi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cv[1].destination =
=3D &amp;(s-&gt;execute_x_only);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cv[2].destination =3D &a=
mp;(s-&gt;high_waterlevel);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cv[3].destination =3D &a=
mp;(s-&gt;low_waterlevel);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;config_storag=
e[i] =3D s;<br>
+<br>
+@@ -182,6 +222,51 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {<br>
+ }<br>
+<br>
+<br>
++static void cgi_recount_bytes_in_buffer(handler_ctx *hctx)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 chunkqueue *cq =3D hctx-&gt;remote_conn-&gt;write_qu=
eue;<br>
++=C2=A0 =C2=A0 =C2=A0 hctx-&gt;bytes_in_buffer =3D chunkqueue_length(cq) -=
 chunkqueue_written(cq);<br>
++}<br>
++<br>
++<br>
++static void cgi_throttling_control(server *srv, handler_ctx *hctx)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 cgi_recount_bytes_in_buffer(hctx);<br>
++<br>
++#ifdef DEBUG<br>
++=C2=A0 =C2=A0 =C2=A0 sprintf(msgbuf, &quot;throttling=3D%d, chars=3D%llu,=
 high=3D%llu, low=3D%llu&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hctx-&gt;throttling, hct=
x-&gt;bytes_in_buffer,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hctx-&gt;high_waterlevel=
, hctx-&gt;low_waterlevel);<br>
++=C2=A0 =C2=A0 =C2=A0 log_error_write(srv, __FILE__, __LINE__, &quot;ss&qu=
ot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;(debug) throttling control,&quot;, msgbuf);<br>
++#endif<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (hctx-&gt;throttling) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(msgbuf, &quot;th=
rottling; chars in queue=3D%llu,&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot; low-waterlevel=3D%llu, high-waterlevel=3D%llu&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hctx-&gt;bytes_in_buffer,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hctx-&gt;low_waterlevel, hctx-&gt;high_waterlevel);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error_write(srv, __F=
ILE__, __LINE__, &quot;s&quot;, msgbuf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hctx-&gt;bytes_in_bu=
ffer &lt;=3D hctx-&gt;low_waterlevel) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fdevent_event_set(srv-&gt;ev, &amp;(hctx-&gt;fde_ndx), hctx-&gt;fd, FDE=
VENT_IN);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hctx-&gt;throttling =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 log_error_write(srv, __FILE__, __LINE__, &quot;s&quot;, &quot;unthrottl=
ed&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hctx-&gt;high_waterl=
evel !=3D 0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hctx-&gt;high_waterlevel &lt;=3D hctx-&gt;bytes_in_buffer) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fdevent_event_del(srv-&gt;ev, &amp;(hctx-&gt;fde_ndx), hctx-&gt;fd);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hctx-&gt;throttling =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sprintf(msgbuf, &quot;throttled; chars in queue=3D%llu,&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; low-waterlevel=3D%llu, high-waterlev=
el=3D%llu&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hctx-&gt;bytes_in_buffer,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hctx-&gt;low_waterlevel, hctx-&gt;high_wate=
rlevel);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 log_error_write(srv, __FILE__, __LINE__, &quot;s&quot;, msgbuf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++<br>
+ static int cgi_pid_add(server *srv, plugin_data *p, pid_t pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int m =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t i;<br>
+@@ -228,6 +313,39 @@ static int cgi_pid_del(server *srv, plugin_data *p, p=
id_t pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
++<br>
++static void cgi_ctx_add(plugin_data *p, handler_ctx *hctx) {<br>
++=C2=A0 =C2=A0 =C2=A0 buffer_ctx_t *r =3D &amp;(p-&gt;cgi_ctx);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (r-&gt;size =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;size =3D 16;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;hctx =3D malloc(si=
zeof(*r-&gt;hctx) * r-&gt;size);<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (r-&gt;used =3D=3D r-&gt;size) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;size +=3D 16;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;hctx =3D realloc(r=
-&gt;hctx, sizeof(*r-&gt;hctx) * r-&gt;size);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 r-&gt;hctx[r-&gt;used++] =3D hctx;<br>
++}<br>
++<br>
++static void cgi_ctx_del(plugin_data *p, handler_ctx *hctx) {<br>
++=C2=A0 =C2=A0 =C2=A0 size_t i;<br>
++=C2=A0 =C2=A0 =C2=A0 buffer_ctx_t *r =3D &amp;(p-&gt;cgi_ctx);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; r-&gt;used; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r-&gt;hctx[i] =3D=3D=
 hctx) break;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (i !=3D r-&gt;used) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* found */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i !=3D r-&gt;used - =
1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 r-&gt;hctx[i] =3D r-&gt;hctx[r-&gt;used - 1];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;used--;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
+ static int cgi_response_parse(server *srv, connection *con, plugin_data *=
p, buffer *in) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *ns;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *s;<br>
+@@ -378,6 +496,13 @@ static int cgi_demux_response(server *srv, handler_ct=
x *hctx) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hctx-&gt;response-&=
gt;ptr[n] =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hctx-&gt;response-&=
gt;used =3D n+1;<br>
++#ifdef DEBUG<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(msgbuf, &quot;n=
=3D%d, bytes_out=3D%llu, bytes_in=3D%llu&quot;, n,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long long)con-&gt;write_queue-&gt;bytes_out,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long long)con-&gt;write_queue-&gt;bytes_in);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error_write(srv, __F=
ILE__, __LINE__, &quot;ss&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(debug) read,&quot;, msgbuf);<br>
++#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* split header fro=
m body */<br>
+<br>
+@@ -502,8 +627,20 @@ static int cgi_demux_response(server *srv, handler_ct=
x *hctx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0http_chunk_append_mem(srv, con, hctx-&gt;response-&gt;ptr, hctx-&=
gt;response-&gt;used);<br>
++#ifdef DEBUG<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sprintf(msgbuf, &quot;n=3D%d, bytes_out=3D%llu, bytes_in=3D%llu, limit=
=3D%llu&quot;, n,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long long)con-&gt;write_queue-&gt=
;bytes_out,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long long)con-&gt;write_queue-&gt=
;bytes_in,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long long)hctx-&gt;high_waterleve=
l);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 log_error_write(srv, __FILE__, __LINE__,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ss&quot;,=
 &quot;(debug) append,&quot;, msgbuf);<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0joblist_append(srv, con);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cgi_throttling_control(srv, hctx);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (hctx-&gt;throttling) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FDEVENT_HANDLED_NOT_FINISHED;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+ #if 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_error_write(srv=
, __FILE__, __LINE__, &quot;ddss&quot;, con-&gt;fd, hctx-&gt;fd, connection=
_get_state(con-&gt;state), b-&gt;ptr);<br>
+@@ -552,8 +689,9 @@ static handler_t cgi_connection_close(server *srv, han=
dler_ctx *hctx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt;plugin_ctx[p-&gt;id] =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* is this a good idea ? */<br>
+-=C2=A0 =C2=A0 =C2=A0 cgi_handler_ctx_free(hctx);<br>
+-<br>
++=C2=A0 =C2=A0 =C2=A0 cgi_ctx_del(p, hctx);<br>
++=C2=A0 =C2=A0 =C2=A0 cgi_handler_ctx_free(srv, hctx);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if waitpid hasn&#39;t been called by respons=
e.c yet, do it here */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check if the CGI=
-script is already gone */<br>
+@@ -1156,7 +1294,8 @@ static int cgi_create_env(server *srv, connection *c=
on, plugin_data *p, buffer *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt;mode =3D p-=
&gt;id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffer_reset(con-&g=
t;physical.path);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hctx =3D cgi_handler_ctx=
_init();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hctx =3D cgi_handler_ctx=
_init(p);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_ctx_add(p, hctx);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hctx-&gt;remote_con=
n =3D con;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hctx-&gt;plugin_dat=
a =3D p;<br>
+@@ -1165,6 +1304,11 @@ static int cgi_create_env(server *srv, connection *=
con, plugin_data *p, buffer *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hctx-&gt;fde_ndx =
=3D -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt;plugin_ctx[=
p-&gt;id] =3D hctx;<br>
++#ifdef DEBUG<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(msgbuf, &quot;hc=
tx=3D%p, con=3D%p&quot;, (void*)hctx, (void*)con);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error_write(srv, __F=
ILE__, __LINE__, &quot;ss&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(debug) hctx generated, &quot;, msgbu=
f);<br>
++#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdevent_register(sr=
v-&gt;ev, hctx-&gt;fd, cgi_handle_fdevent, hctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdevent_event_set(s=
rv-&gt;ev, &amp;(hctx-&gt;fde_ndx), hctx-&gt;fd, FDEVENT_IN);<br>
+@@ -1179,7 +1323,8 @@ static int cgi_create_env(server *srv, connection *c=
on, plugin_data *p, buffer *<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0close(hctx-&gt;fd);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cgi_handler_ctx_free(hctx);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cgi_ctx_del(p, hctx);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cgi_handler_ctx_free(srv, hctx);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0con-&gt;plugin_ctx[p-&gt;id] =3D NULL;<br>
+<br>
+@@ -1204,6 +1349,8 @@ static int mod_cgi_patch_connection(server *srv, con=
nection *con, plugin_data *p<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PATCH(cgi);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PATCH(execute_x_only);<br>
++=C2=A0 =C2=A0 =C2=A0 PATCH(high_waterlevel);<br>
++=C2=A0 =C2=A0 =C2=A0 PATCH(low_waterlevel);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* skip the first, the global context */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 1; i &lt; srv-&gt;config_context-&gt=
;used; i++) {<br>
+@@ -1221,6 +1368,10 @@ static int mod_cgi_patch_connection(server *srv, co=
nnection *con, plugin_data *p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PATCH(cgi);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else if (buffer_is_equal_string(du-&gt;key, CONST_STR_LEN(&quot=
;cgi.execute-x-only&quot;))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PATCH(execute_x_only);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if (buffer_is_equal_string(du-&gt;key, CONST_STR_LEN(&quot;cgi.h=
igh-waterlevel&quot;))) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PATCH(high_waterlevel);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if (buffer_is_equal_string(du-&gt;key, CONST_STR_LEN(&quot;cgi.l=
ow-waterlevel&quot;))) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PATCH(low_waterlevel);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1273,6 +1424,21 @@ URIHANDLER_FUNC(cgi_is_handled) {<br>
+ TRIGGER_FUNC(cgi_trigger) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0plugin_data *p =3D p_d;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t ndx;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (ndx =3D 0; ndx &lt; p-&gt;cgi_ctx.used; ndx++) =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handler_ctx *hctx =3D p-=
&gt;cgi_ctx.hctx[ndx];<br>
++#ifdef DEBUG<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection *con =3D hctx=
-&gt;remote_conn;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(msgbuf, &quot;hc=
tx=3D%p, con=3D%p, bytes_in_buffer=3D%llu&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (void*)hctx, (void*)con,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long long)hctx-&gt;bytes_in_buffer);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error_write(srv, __F=
ILE__, __LINE__, &quot;ss&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(debug) found using ctx,&quot;, msgbu=
f);<br>
++#endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_throttling_control(s=
rv, hctx);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* the trigger handle only cares about lonely P=
ID which we have to wait for */<br>
+ #ifndef __WIN32<br>
+<br>
+@@ -1381,7 +1547,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0log_error_write(srv, __FILE__, __LINE__, &quot;sds&quot;, &quot;c=
gi close failed &quot;, hctx-&gt;fd, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_handler_ctx_free(hct=
x);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_ctx_del(p, hctx);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_handler_ctx_free(srv=
, hctx);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt;plugin_ctx[=
p-&gt;id] =3D NULL;<br>
+<br>
+@@ -1413,7 +1580,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0log_error_write(srv, __FILE__, __LINE__, &quot;sds&quot;, &quot;c=
gi close failed &quot;, hctx-&gt;fd, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_handler_ctx_free(hct=
x);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_ctx_del(p, hctx);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cgi_handler_ctx_free(srv=
, hctx);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt;plugin_ctx[=
p-&gt;id] =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HANDLER_FINI=
SHED;<br>
+--<br>
+1.8.4.2<br>
+<br>
diff --git a/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.=
35.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.35.bb</a> b/meta/r=
ecipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.35.bb" rel=3D"noref=
errer" target=3D"_blank">lighttpd_1.4.35.bb</a><br>
index 0cf5aa2..d3888e6 100644<br>
--- a/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.35.bb" =
rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.35.bb</a><br>
+++ b/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.35.bb" =
rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.35.bb</a><br>
@@ -24,6 +24,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.lighttpd.net=
/lighttpd/releases-1.4.x/lighttpd-${PV}.t" rel=3D"noreferrer" target=3D"_bl=
ank">http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lighttpd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lighttpd.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pkgconfig.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mod_cgi-buffers-data-without-bound=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;f7a88130ee9984b421ad8aa80629750a&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.4.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11357d4aede5e2051a8cbc0b--
