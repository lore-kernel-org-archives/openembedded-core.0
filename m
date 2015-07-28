Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 473DE763C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:41:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S9ewjN000908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 02:40:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Tue, 28 Jul 2015 02:40:42 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 17:38:10 +0800
Message-ID: <d1e5c32a876637ba9e83a6bf38b895843286f1b8.1438076053.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438076053.git.kai.kang@windriver.com>
References: <cover.1438076053.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] lighttpd: 1.4.35 -> 1.4.36
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
X-List-Received-Date: Tue, 28 Jul 2015 09:41:06 -0000
Content-Type: text/plain

Upgrade lighttpd from 1.4.35 to 1.4.36.

* romove PR
* update contex of 0001-mod_cgi-buffers-data-without-bound.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-mod_cgi-buffers-data-without-bound.patch  | 55 +++++++++++-----------
 .../{lighttpd_1.4.35.bb => lighttpd_1.4.36.bb}     |  9 ++--
 2 files changed, 31 insertions(+), 33 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.35.bb => lighttpd_1.4.36.bb} (93%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
index b1678e6..a9df174 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
@@ -6,10 +6,14 @@ Subject: [PATCH] mod_cgi buffers data without bound so fix it
 Upstream-Status: Submitted [http://redmine.lighttpd.net/issues/1264]
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
+Update context for 1.4.36.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  doc/config/lighttpd.conf |   8 ++
  src/mod_cgi.c            | 188 ++++++++++++++++++++++++++++++++++++++++++++---
- 2 files changed, 186 insertions(+), 10 deletions(-)
+ 2 files changed, 187 insertions(+), 9 deletions(-)
 
 diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
 index 60b0ae1..9c101a7 100644
@@ -31,7 +35,7 @@ index 60b0ae1..9c101a7 100644
  #######################################################################
  ##
 diff --git a/src/mod_cgi.c b/src/mod_cgi.c
-index 734ecee..c51f43c 100644
+index 01b1877..7c67eb5 100644
 --- a/src/mod_cgi.c
 +++ b/src/mod_cgi.c
 @@ -38,6 +38,10 @@
@@ -124,7 +128,7 @@ index 734ecee..c51f43c 100644
  	free(hctx);
  }
  
-@@ -152,6 +186,8 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
+@@ -154,6 +188,8 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
  	config_values_t cv[] = {
  		{ "cgi.assign",                  NULL, T_CONFIG_ARRAY, T_CONFIG_SCOPE_CONNECTION },       /* 0 */
  		{ "cgi.execute-x-only",          NULL, T_CONFIG_BOOLEAN, T_CONFIG_SCOPE_CONNECTION },     /* 1 */
@@ -133,7 +137,7 @@ index 734ecee..c51f43c 100644
  		{ NULL,                          NULL, T_CONFIG_UNSET, T_CONFIG_SCOPE_UNSET}
  	};
  
-@@ -167,9 +203,13 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
+@@ -169,9 +205,13 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
  
  		s->cgi    = array_init();
  		s->execute_x_only = 0;
@@ -147,7 +151,7 @@ index 734ecee..c51f43c 100644
  
  		p->config_storage[i] = s;
  
-@@ -182,6 +222,51 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
+@@ -184,6 +224,51 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
  }
  
  
@@ -199,7 +203,7 @@ index 734ecee..c51f43c 100644
  static int cgi_pid_add(server *srv, plugin_data *p, pid_t pid) {
  	int m = -1;
  	size_t i;
-@@ -228,6 +313,39 @@ static int cgi_pid_del(server *srv, plugin_data *p, pid_t pid) {
+@@ -230,6 +315,39 @@ static int cgi_pid_del(server *srv, plugin_data *p, pid_t pid) {
  	return 0;
  }
  
@@ -239,10 +243,10 @@ index 734ecee..c51f43c 100644
  static int cgi_response_parse(server *srv, connection *con, plugin_data *p, buffer *in) {
  	char *ns;
  	const char *s;
-@@ -378,6 +496,13 @@ static int cgi_demux_response(server *srv, handler_ctx *hctx) {
+@@ -380,6 +498,14 @@ static int cgi_demux_response(server *srv, handler_ctx *hctx) {
+ 
+ 		buffer_commit(hctx->response, n);
  
- 		hctx->response->ptr[n] = '\0';
- 		hctx->response->used = n+1;
 +#ifdef DEBUG
 +		sprintf(msgbuf, "n=%d, bytes_out=%llu, bytes_in=%llu", n,
 +			(unsigned long long)con->write_queue->bytes_out,
@@ -250,13 +254,14 @@ index 734ecee..c51f43c 100644
 +		log_error_write(srv, __FILE__, __LINE__, "ss",
 +				"(debug) read,", msgbuf);
 +#endif
- 
++
  		/* split header from body */
  
-@@ -502,8 +627,20 @@ static int cgi_demux_response(server *srv, handler_ctx *hctx) {
+ 		if (con->file_started == 0) {
+@@ -503,7 +629,20 @@ static int cgi_demux_response(server *srv, handler_ctx *hctx) {
  			}
  		} else {
- 			http_chunk_append_mem(srv, con, hctx->response->ptr, hctx->response->used);
+ 			http_chunk_append_buffer(srv, con, hctx->response);
 +#ifdef DEBUG
 +			sprintf(msgbuf, "n=%d, bytes_out=%llu, bytes_in=%llu, limit=%llu", n,
 +				(unsigned long long)con->write_queue->bytes_out,
@@ -266,16 +271,15 @@ index 734ecee..c51f43c 100644
 +					"ss", "(debug) append,", msgbuf);
 +#endif
  			joblist_append(srv, con);
--		}
++
 +			cgi_throttling_control(srv, hctx);
 +			if (hctx->throttling) {
 +				return FDEVENT_HANDLED_NOT_FINISHED;
 +			}
-+		}	
+ 		}
  
  #if 0
- 		log_error_write(srv, __FILE__, __LINE__, "ddss", con->fd, hctx->fd, connection_get_state(con->state), b->ptr);
-@@ -552,8 +689,9 @@ static handler_t cgi_connection_close(server *srv, handler_ctx *hctx) {
+@@ -553,8 +692,9 @@ static handler_t cgi_connection_close(server *srv, handler_ctx *hctx) {
  	con->plugin_ctx[p->id] = NULL;
  
  	/* is this a good idea ? */
@@ -287,7 +291,7 @@ index 734ecee..c51f43c 100644
  	/* if waitpid hasn't been called by response.c yet, do it here */
  	if (pid) {
  		/* check if the CGI-script is already gone */
-@@ -1156,7 +1294,8 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
+@@ -1105,7 +1245,8 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
  		con->mode = p->id;
  		buffer_reset(con->physical.path);
  
@@ -297,7 +301,7 @@ index 734ecee..c51f43c 100644
  
  		hctx->remote_conn = con;
  		hctx->plugin_data = p;
-@@ -1165,6 +1304,11 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
+@@ -1114,6 +1255,11 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
  		hctx->fde_ndx = -1;
  
  		con->plugin_ctx[p->id] = hctx;
@@ -309,7 +313,7 @@ index 734ecee..c51f43c 100644
  
  		fdevent_register(srv->ev, hctx->fd, cgi_handle_fdevent, hctx);
  		fdevent_event_set(srv->ev, &(hctx->fde_ndx), hctx->fd, FDEVENT_IN);
-@@ -1179,7 +1323,8 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
+@@ -1128,7 +1274,8 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
  
  			close(hctx->fd);
  
@@ -319,7 +323,7 @@ index 734ecee..c51f43c 100644
  
  			con->plugin_ctx[p->id] = NULL;
  
-@@ -1204,6 +1349,8 @@ static int mod_cgi_patch_connection(server *srv, connection *con, plugin_data *p
+@@ -1153,6 +1300,8 @@ static int mod_cgi_patch_connection(server *srv, connection *con, plugin_data *p
  
  	PATCH(cgi);
  	PATCH(execute_x_only);
@@ -328,7 +332,7 @@ index 734ecee..c51f43c 100644
  
  	/* skip the first, the global context */
  	for (i = 1; i < srv->config_context->used; i++) {
-@@ -1221,6 +1368,10 @@ static int mod_cgi_patch_connection(server *srv, connection *con, plugin_data *p
+@@ -1170,6 +1319,10 @@ static int mod_cgi_patch_connection(server *srv, connection *con, plugin_data *p
  				PATCH(cgi);
  			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("cgi.execute-x-only"))) {
  				PATCH(execute_x_only);
@@ -339,7 +343,7 @@ index 734ecee..c51f43c 100644
  			}
  		}
  	}
-@@ -1273,6 +1424,21 @@ URIHANDLER_FUNC(cgi_is_handled) {
+@@ -1222,6 +1375,21 @@ URIHANDLER_FUNC(cgi_is_handled) {
  TRIGGER_FUNC(cgi_trigger) {
  	plugin_data *p = p_d;
  	size_t ndx;
@@ -361,7 +365,7 @@ index 734ecee..c51f43c 100644
  	/* the trigger handle only cares about lonely PID which we have to wait for */
  #ifndef __WIN32
  
-@@ -1381,7 +1547,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
+@@ -1330,7 +1498,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
  			log_error_write(srv, __FILE__, __LINE__, "sds", "cgi close failed ", hctx->fd, strerror(errno));
  		}
  
@@ -371,7 +375,7 @@ index 734ecee..c51f43c 100644
  
  		con->plugin_ctx[p->id] = NULL;
  
-@@ -1413,7 +1580,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
+@@ -1362,7 +1531,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
  			log_error_write(srv, __FILE__, __LINE__, "sds", "cgi close failed ", hctx->fd, strerror(errno));
  		}
  
@@ -381,6 +385,3 @@ index 734ecee..c51f43c 100644
  
  		con->plugin_ctx[p->id] = NULL;
  		return HANDLER_FINISHED;
--- 
-1.8.4.2
-
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.36.bb
similarity index 93%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.36.bb
index d3888e6..67b6e37 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.36.bb
@@ -5,8 +5,6 @@ BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
-PR = "r1"
-
 SECTION = "net"
 DEPENDS = "zlib libpcre"
 RDEPENDS_${PN} += " \
@@ -17,8 +15,7 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-
-SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
+SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
@@ -27,8 +24,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-mod_cgi-buffers-data-without-bound.patch \
         "
 
-SRC_URI[md5sum] = "f7a88130ee9984b421ad8aa80629750a"
-SRC_URI[sha256sum] = "4a71c1f6d8af41ed894b507720c4c17184dc320590013881d5170ca7f15c5bf7"
+SRC_URI[md5sum] = "1843daffcb018aa528f6d15d43544654"
+SRC_URI[sha256sum] = "897ab6b1cc7bd51671f8af759e7846245fbbca0685c30017e93a5882a9ac1a53"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
-- 
1.9.1


