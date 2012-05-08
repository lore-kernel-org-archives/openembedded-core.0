Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRf9y-0002T4-5O
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 09:48:38 +0200
Received: by wibhj13 with SMTP id hj13so299108wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qaBrqR3e2WK9oj55+dCjwl1ebeDVkmEapqeQHlIhD1U=;
	b=WDv+3Hpe8L3v53bdu2Fk/3h/5kvwOJfIK++xQFlLErERAnLtsZu8Br7CdB9w+u3F2k
	L3mRDm/JCJttxES0/wYeFKMOdRqxqPVr16obdgUEGVbXgy2EyGTO8rlpRY6OrxW/NiSD
	gbU3cm7vlkGSuU+PG6+6B608Z5E7F0bRy1BsGnsvQw8kEW74E61a6derkIvQeJokYfBD
	JL7ODVhvuO8yU0nQjP7BpvA4lanWzbOeQzSwhJdSfl8m6RDB0ikshwcROU/hXmqy8dMg
	au44f+rhjDcDriH16eEzMwP6JMYg9LFJTJJS3Mmej1KqD0eFil/tAKkdiC9mFO1sfUBb
	5TQw==
Received: by 10.216.133.139 with SMTP id q11mr11407114wei.44.1336462726660;
	Tue, 08 May 2012 00:38:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm27483127wiy.7.2012.05.08.00.38.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 00:38:45 -0700 (PDT)
Date: Tue, 8 May 2012 09:38:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120508073843.GA3149@jama.jama.net>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
	<70b609a67b0bb9f8b52768e692f8f9a84fd464c8.1336417061.git.Martin.Jansa@gmail.com>
	<4FA89DC2.5030307@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FA89DC2.5030307@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libsoup: delete from oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2012 07:48:38 -0000
X-Groupsio-MsgNum: 21815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 07, 2012 at 09:14:58PM -0700, Saul Wold wrote:
> On 05/07/2012 01:06 PM, Martin Jansa wrote:
> > * as suggested here:
> >    http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/0220=
60.html
> >
> Not so sure about this, there is still at least 1 recipe in meta-oe that=
=20
> uses libsoup, gpe-scap.

And patch which ports it to libsoup-2.4 :)

http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-May/039421.html

BTW: Sorry that I've proposed to remove libsoup/libgdbus just after you
fixed them for new glib... but if "bitbake world" is only user of them
then it can save some work in the long run..

Cheers,

>=20
> Sau!
>=20
>=20
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   .../dprintf_conflict_with_eglibc.patch             | 1186 -----------=
---------
> >   .../libsoup/libsoup-2.2.105/fix-for-new-glib.patch |   85 --
> >   meta/recipes-support/libsoup/libsoup_2.2.105.bb    |   20 -
> >   3 files changed, 0 insertions(+), 1291 deletions(-)
> >   delete mode 100644 meta/recipes-support/libsoup/libsoup-2.2.105/dprin=
tf_conflict_with_eglibc.patch
> >   delete mode 100644 meta/recipes-support/libsoup/libsoup-2.2.105/fix-f=
or-new-glib.patch
> >   delete mode 100644 meta/recipes-support/libsoup/libsoup_2.2.105.bb
> >
> > diff --git a/meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_confl=
ict_with_eglibc.patch b/meta/recipes-support/libsoup/libsoup-2.2.105/dprint=
f_conflict_with_eglibc.patch
> > deleted file mode 100644
> > index 79e2ab8..0000000
> > --- a/meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_wit=
h_eglibc.patch
> > +++ /dev/null
> > @@ -1,1186 +0,0 @@
> > -Upstream-Status: Pending
> > -
> > -diff -rupN libsoup-2.2.105/tests/auth-test.c libsoup-2.2.105.new//test=
s/auth-test.c
> > ---- libsoup-2.2.105/tests/auth-test.c	2007-12-05 00:13:27.000000000 +0=
200
> > -+++ libsoup-2.2.105.new//tests/auth-test.c	2012-01-16 20:12:09.0000000=
00 +0200
> > -@@ -19,7 +19,7 @@ int errors =3D 0;
> > - gboolean debug =3D FALSE;
> > -
> > - static void
> > --dprintf (const char *format, ...)
> > -+dprintfsoup (const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -216,18 +216,18 @@ handler (SoupMessage *msg, gpointer data
> > -
> > - 	auth =3D identify_auth (msg);
> > -
> > --	dprintf ("  %d %s (using %s)\n", msg->status_code, msg->reason_phras=
e,
> > -+	dprintfsoup ("  %d %s (using %s)\n", msg->status_code, msg->reason_p=
hrase,
> > - 		 auths[auth]);
> > -
> > - 	if (*expected) {
> > - 		exp =3D *expected - '0';
> > - 		if (auth !=3D exp) {
> > --			dprintf ("    expected %s!\n", auths[exp]);
> > -+			dprintfsoup ("    expected %s!\n", auths[exp]);
> > - 			errors++;
> > - 		}
> > - 		memmove (expected, expected + 1, strlen (expected));
> > - 	} else {
> > --		dprintf ("    expected to be finished\n");
> > -+		dprintfsoup ("    expected to be finished\n");
> > - 		errors++;
> > - 	}
> > - }
> > -@@ -266,10 +266,10 @@ bug271540_sent (SoupMessage *msg, gpoint
> > - 	int auth =3D identify_auth (msg);
> > -
> > - 	if (!*authenticated&&  auth) {
> > --		dprintf ("    using auth on message %d before authenticating!!??\n"=
, n);
> > -+		dprintfsoup ("    using auth on message %d before authenticating!!?=
?\n", n);
> > - 		errors++;
> > - 	} else if (*authenticated&&  !auth) {
> > --		dprintf ("    sent unauthenticated message %d after authenticating!=
\n", n);
> > -+		dprintfsoup ("    sent unauthenticated message %d after authenticat=
ing!\n", n);
> > - 		errors++;
> > - 	}
> > - }
> > -@@ -287,12 +287,12 @@ bug271540_authenticate (SoupSession *ses
> > - 		return;
> > -
> > - 	if (!*authenticated) {
> > --		dprintf ("    authenticating message %d\n", n);
> > -+		dprintfsoup ("    authenticating message %d\n", n);
> > - 		*username =3D g_strdup ("user1");
> > - 		*password =3D g_strdup ("realm1");
> > - 		*authenticated =3D TRUE;
> > - 	} else {
> > --		dprintf ("    asked to authenticate message %d after authenticating=
!\n", n);
> > -+		dprintfsoup ("    asked to authenticate message %d after authentica=
ting!\n", n);
> > - 		errors++;
> > - 	}
> > - }
> > -@@ -304,7 +304,7 @@ bug271540_finished (SoupMessage *msg, gp
> > - 	int n =3D GPOINTER_TO_INT (g_object_get_data (G_OBJECT (msg), "#"));
> > -
> > - 	if (!SOUP_STATUS_IS_SUCCESSFUL (msg->status_code)) {
> > --		dprintf ("      got status '%d %s' on message %d!\n",
> > -+		dprintfsoup ("      got status '%d %s' on message %d!\n",
> > - 			msg->status_code, msg->reason_phrase, n);
> > - 		errors++;
> > - 	}
> > -@@ -350,10 +350,10 @@ main (int argc, char **argv)
> > - 			  G_CALLBACK (reauthenticate),&i);
> > -
> > - 	for (i =3D 0; i<  ntests; i++) {
> > --		dprintf ("Test %d: %s\n", i + 1, tests[i].explanation);
> > -+		dprintfsoup ("Test %d: %s\n", i + 1, tests[i].explanation);
> > -
> > - 		uri =3D g_strconcat (base_uri, tests[i].url, NULL);
> > --		dprintf ("  GET %s\n", uri);
> > -+		dprintfsoup ("  GET %s\n", uri);
> > -
> > - 		msg =3D soup_message_new (SOUP_METHOD_GET, uri);
> > - 		g_free (uri);
> > -@@ -372,21 +372,21 @@ main (int argc, char **argv)
> > - 		soup_session_send_message (session, msg);
> > - 		if (msg->status_code !=3D SOUP_STATUS_UNAUTHORIZED&&
> > - 		    msg->status_code !=3D SOUP_STATUS_OK) {
> > --			dprintf ("  %d %s !\n", msg->status_code,
> > -+			dprintfsoup ("  %d %s !\n", msg->status_code,
> > - 				msg->reason_phrase);
> > - 			errors++;
> > - 		}
> > - 		if (*expected) {
> > --			dprintf ("  expected %d more round(s)\n",
> > -+			dprintfsoup ("  expected %d more round(s)\n",
> > - 				(int)strlen (expected));
> > - 			errors++;
> > - 		}
> > - 		g_free (expected);
> > -
> > - 		if (msg->status_code !=3D tests[i].final_status)
> > --			dprintf ("  expected %d\n", tests[i].final_status);
> > -+			dprintfsoup ("  expected %d\n", tests[i].final_status);
> > -
> > --		dprintf ("\n");
> > -+		dprintfsoup ("\n");
> > -
> > - 		g_object_unref (msg);
> > - 	}
> > -@@ -395,7 +395,7 @@ main (int argc, char **argv)
> > -
> > - 	/* And now for a regression test */
> > -
> > --	dprintf ("Regression test for bug 271540:\n");
> > -+	dprintfsoup ("Regression test for bug 271540:\n");
> > - 	session =3D soup_session_async_new ();
> > -
> > - 	authenticated =3D FALSE;
> > -@@ -424,7 +424,7 @@ main (int argc, char **argv)
> > -
> > - 	apache_cleanup ();
> > -
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > - 	if (errors) {
> > - 		printf ("auth-test: %d error(s). Run with '-d' for details\n",
> > - 			errors);
> > -diff -rupN libsoup-2.2.105/tests/context-test.c libsoup-2.2.105.new//t=
ests/context-test.c
> > ---- libsoup-2.2.105/tests/context-test.c	2007-12-05 00:13:27.000000000=
 +0200
> > -+++ libsoup-2.2.105.new//tests/context-test.c	2012-01-16 20:11:27.0000=
00000 +0200
> > -@@ -28,7 +28,7 @@ GThread *server_thread;
> > - char *base_uri;
> > -
> > - static void
> > --dprintf (const char *format, ...)
> > -+dprintfsoup (const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -168,7 +168,7 @@ do_test1 (void)
> > - {
> > - 	GMainLoop *loop;
> > -
> > --	dprintf ("Test 1: blocking the main thread does not block other thre=
ad\n");
> > -+	dprintfsoup ("Test 1: blocking the main thread does not block other =
thread\n");
> > -
> > - 	test1_cond =3D g_cond_new ();
> > - 	test1_mutex =3D g_mutex_new ();
> > -@@ -196,7 +196,7 @@ idle_start_test1_thread (gpointer loop)
> > - 	if (g_cond_timed_wait (test1_cond, test1_mutex,&time))
> > - 		g_thread_join (thread);
> > - 	else {
> > --		dprintf ("  timeout!\n");
> > -+		dprintfsoup ("  timeout!\n");
> > - 		errors++;
> > - 	}
> > -
> > -@@ -232,17 +232,17 @@ test1_thread (gpointer user_data)
> > -
> > - 	uri =3D g_build_filename (base_uri, "slow", NULL);
> > -
> > --	dprintf ("  send_message\n");
> > -+	dprintfsoup ("  send_message\n");
> > - 	msg =3D soup_message_new ("GET", uri);
> > - 	soup_session_send_message (session, msg);
> > - 	if (msg->status_code !=3D SOUP_STATUS_OK) {
> > --		dprintf ("    unexpected status: %d %s\n",
> > -+		dprintfsoup ("    unexpected status: %d %s\n",
> > - 			 msg->status_code, msg->reason_phrase);
> > - 		errors++;
> > - 	}
> > - 	g_object_unref (msg);
> > -
> > --	dprintf ("  queue_message\n");
> > -+	dprintfsoup ("  queue_message\n");
> > - 	msg =3D soup_message_new ("GET", uri);
> > - 	loop =3D g_main_loop_new (async_context, FALSE);
> > - 	g_object_ref (msg);
> > -@@ -250,7 +250,7 @@ test1_thread (gpointer user_data)
> > - 	g_main_loop_run (loop);
> > - 	g_main_loop_unref (loop);
> > - 	if (msg->status_code !=3D SOUP_STATUS_OK) {
> > --		dprintf ("    unexpected status: %d %s\n",
> > -+		dprintfsoup ("    unexpected status: %d %s\n",
> > - 			 msg->status_code, msg->reason_phrase);
> > - 		errors++;
> > - 	}
> > -@@ -279,7 +279,7 @@ do_test2 (void)
> > - 	char *uri;
> > - 	SoupMessage *msg;
> > -
> > --	dprintf ("Test 2: a session with its own context is independent of t=
he main loop.\n");
> > -+	dprintfsoup ("Test 2: a session with its own context is independent =
of the main loop.\n");
> > -
> > - 	idle =3D g_idle_add_full (G_PRIORITY_HIGH, idle_test2_fail, NULL, NU=
LL);
> > -
> > -@@ -291,11 +291,11 @@ do_test2 (void)
> > -
> > - 	uri =3D g_build_filename (base_uri, "slow", NULL);
> > -
> > --	dprintf ("  send_message\n");
> > -+	dprintfsoup ("  send_message\n");
> > - 	msg =3D soup_message_new ("GET", uri);
> > - 	soup_session_send_message (session, msg);
> > - 	if (msg->status_code !=3D SOUP_STATUS_OK) {
> > --		dprintf ("    unexpected status: %d %s\n",
> > -+		dprintfsoup ("    unexpected status: %d %s\n",
> > - 			 msg->status_code, msg->reason_phrase);
> > - 		errors++;
> > - 	}
> > -@@ -311,7 +311,7 @@ do_test2 (void)
> > - static gboolean
> > - idle_test2_fail (gpointer user_data)
> > - {
> > --	dprintf ("  idle ran!\n");
> > -+	dprintfsoup ("  idle ran!\n");
> > - 	errors++;
> > - 	return FALSE;
> > - }
> > -@@ -356,7 +356,7 @@ main (int argc, char **argv)
> > - 	g_free (base_uri);
> > - 	g_main_context_unref (g_main_context_default ());
> > -
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > - 	if (errors) {
> > - 		printf ("context-test: %d error(s). Run with '-d' for details\n",
> > - 			errors);
> > -diff -rupN libsoup-2.2.105/tests/header-parsing.c libsoup-2.2.105.new/=
/tests/header-parsing.c
> > ---- libsoup-2.2.105/tests/header-parsing.c	2007-10-28 19:57:03.0000000=
00 +0200
> > -+++ libsoup-2.2.105.new//tests/header-parsing.c	2012-01-16 20:11:54.00=
0000000 +0200
> > -@@ -10,7 +10,7 @@
> > - gboolean debug =3D FALSE;
> > -
> > - static void
> > --dprintf (const char *format, ...)
> > -+dprintfsoup (const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -455,7 +455,7 @@ static void
> > - print_header (gpointer key, gpointer value, gpointer data)
> > - {
> > - 	GSList *values =3D value;
> > --	dprintf ("              '%s': '%s'\n",
> > -+	dprintfsoup ("              '%s': '%s'\n",
> > - 		 (char *)key, (char*)values->data);
> > - }
> > -
> > -@@ -480,11 +480,11 @@ do_request_tests (void)
> > - 	SoupHttpVersion version;
> > - 	GHashTable *headers;
> > -
> > --	dprintf ("Request tests\n");
> > -+	dprintfsoup ("Request tests\n");
> > - 	for (i =3D 0; i<  1; i++) {
> > - 		gboolean ok =3D TRUE;
> > -
> > --		dprintf ("%2d. %s (%s): ", i + 1, reqtests[i].description,
> > -+		dprintfsoup ("%2d. %s (%s): ", i + 1, reqtests[i].description,
> > - 			 reqtests[i].method ? "should parse" : "should NOT parse");
> > -
> > - 		headers =3D g_hash_table_new_full (g_str_hash, g_str_equal,
> > -@@ -519,34 +519,34 @@ do_request_tests (void)
> > - 		}
> > -
> > - 		if (ok)
> > --			dprintf ("OK!\n");
> > -+			dprintfsoup ("OK!\n");
> > - 		else {
> > --			dprintf ("BAD!\n");
> > -+			dprintfsoup ("BAD!\n");
> > - 			errors++;
> > - 			if (reqtests[i].method) {
> > --				dprintf ("    expected: '%s' '%s' 'HTTP/1.%d'\n",
> > -+				dprintfsoup ("    expected: '%s' '%s' 'HTTP/1.%d'\n",
> > - 					 reqtests[i].method, reqtests[i].path,
> > - 					 reqtests[i].version);
> > - 				for (h =3D 0; reqtests[i].headers[h].name; h++) {
> > --					dprintf ("              '%s': '%s'\n",
> > -+					dprintfsoup ("              '%s': '%s'\n",
> > - 						 reqtests[i].headers[h].name,
> > - 						 reqtests[i].headers[h].value);
> > - 				}
> > - 			} else
> > --				dprintf ("    expected: parse error\n");
> > -+				dprintfsoup ("    expected: parse error\n");
> > - 			if (method) {
> > --				dprintf ("         got: '%s' '%s' 'HTTP/1.%d'\n",
> > -+				dprintfsoup ("         got: '%s' '%s' 'HTTP/1.%d'\n",
> > - 					method, path, version);
> > - 				g_hash_table_foreach (headers, print_header, NULL);
> > - 			} else
> > --				dprintf ("         got: parse error\n");
> > -+				dprintfsoup ("         got: parse error\n");
> > - 		}
> > -
> > - 		g_free (method);
> > - 		g_free (path);
> > - 		g_hash_table_destroy (headers);
> > - 	}
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > -
> > - 	return errors;
> > - }
> > -@@ -561,11 +561,11 @@ do_response_tests (void)
> > - 	SoupHttpVersion version;
> > - 	GHashTable *headers;
> > -
> > --	dprintf ("Response tests\n");
> > -+	dprintfsoup ("Response tests\n");
> > - 	for (i =3D 0; i<  num_resptests; i++) {
> > - 		gboolean ok =3D TRUE;
> > -
> > --		dprintf ("%2d. %s (%s): ", i + 1, resptests[i].description,
> > -+		dprintfsoup ("%2d. %s (%s): ", i + 1, resptests[i].description,
> > - 			 resptests[i].reason_phrase ? "should parse" : "should NOT parse");
> > -
> > - 		headers =3D g_hash_table_new_full (g_str_hash, g_str_equal,
> > -@@ -600,34 +600,34 @@ do_response_tests (void)
> > - 		}
> > -
> > - 		if (ok)
> > --			dprintf ("OK!\n");
> > -+			dprintfsoup ("OK!\n");
> > - 		else {
> > --			dprintf ("BAD!\n");
> > -+			dprintfsoup ("BAD!\n");
> > - 			errors++;
> > - 			if (resptests[i].reason_phrase) {
> > --				dprintf ("    expected: 'HTTP/1.%d' '%03d' '%s'\n",
> > -+				dprintfsoup ("    expected: 'HTTP/1.%d' '%03d' '%s'\n",
> > - 					 resptests[i].version,
> > - 					 resptests[i].status_code,
> > - 					 resptests[i].reason_phrase);
> > - 				for (h =3D 0; resptests[i].headers[h].name; h++) {
> > --					dprintf ("              '%s': '%s'\n",
> > -+					dprintfsoup ("              '%s': '%s'\n",
> > - 						 resptests[i].headers[h].name,
> > - 						 resptests[i].headers[h].value);
> > - 				}
> > - 			} else
> > --				dprintf ("    expected: parse error\n");
> > -+				dprintfsoup ("    expected: parse error\n");
> > - 			if (reason_phrase) {
> > --				dprintf ("         got: 'HTTP/1.%d' '%03d' '%s'\n",
> > -+				dprintfsoup ("         got: 'HTTP/1.%d' '%03d' '%s'\n",
> > - 					 version, status_code, reason_phrase);
> > - 				g_hash_table_foreach (headers, print_header, NULL);
> > - 			} else
> > --				dprintf ("         got: parse error\n");
> > -+				dprintfsoup ("         got: parse error\n");
> > - 		}
> > -
> > - 		g_free (reason_phrase);
> > - 		g_hash_table_destroy (headers);
> > - 	}
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > -
> > - 	return errors;
> > - }
> > -@@ -651,7 +651,7 @@ main (int argc, char **argv)
> > - 	errors =3D do_request_tests ();
> > - 	errors +=3D do_response_tests ();
> > -
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > - 	if (errors) {
> > - 		printf ("header-parsing: %d error(s). Run with '-d' for details\n",
> > - 			errors);
> > -diff -rupN libsoup-2.2.105/tests/ntlm-test.c libsoup-2.2.105.new//test=
s/ntlm-test.c
> > ---- libsoup-2.2.105/tests/ntlm-test.c	2007-12-05 00:13:27.000000000 +0=
200
> > -+++ libsoup-2.2.105.new//tests/ntlm-test.c	2012-01-16 20:11:45.0000000=
00 +0200
> > -@@ -29,7 +29,7 @@
> > - gboolean debug =3D FALSE;
> > -
> > - static void
> > --dprintf (const char *format, ...)
> > -+dprintfsoup (const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -219,58 +219,58 @@ do_message (SoupSession *session, SoupUr
> > - 			  G_CALLBACK (ntlm_response_check),&state);
> > -
> > - 	soup_session_send_message (session, msg);
> > --	dprintf ("  %-10s ->  ", path);
> > -+	dprintfsoup ("  %-10s ->  ", path);
> > -
> > - 	if (state.got_prompt) {
> > --		dprintf (" PROMPT");
> > -+		dprintfsoup (" PROMPT");
> > - 		if (!get_prompt) {
> > --			dprintf ("???");
> > -+			dprintfsoup ("???");
> > - 			errors++;
> > - 		}
> > - 	} else if (get_prompt) {
> > --		dprintf (" no-prompt???");
> > -+		dprintfsoup (" no-prompt???");
> > - 		errors++;
> > - 	}
> > -
> > - 	if (state.sent_request) {
> > --		dprintf (" REQUEST");
> > -+		dprintfsoup (" REQUEST");
> > - 		if (!do_ntlm) {
> > --			dprintf ("???");
> > -+			dprintfsoup ("???");
> > - 			errors++;
> > - 		}
> > - 	} else if (do_ntlm) {
> > --		dprintf (" no-request???");
> > -+		dprintfsoup (" no-request???");
> > - 		errors++;
> > - 	}
> > -
> > - 	if (state.got_challenge) {
> > --		dprintf (" CHALLENGE");
> > -+		dprintfsoup (" CHALLENGE");
> > - 		if (!do_ntlm) {
> > --			dprintf ("???");
> > -+			dprintfsoup ("???");
> > - 			errors++;
> > - 		}
> > - 	} else if (do_ntlm) {
> > --		dprintf (" no-challenge???");
> > -+		dprintfsoup (" no-challenge???");
> > - 		errors++;
> > - 	}
> > -
> > - 	if (state.sent_response) {
> > --		dprintf (" RESPONSE");
> > -+		dprintfsoup (" RESPONSE");
> > - 		if (!do_ntlm) {
> > --			dprintf ("???");
> > -+			dprintfsoup ("???");
> > - 			errors++;
> > - 		}
> > - 	} else if (do_ntlm) {
> > --		dprintf (" no-response???");
> > -+		dprintfsoup (" no-response???");
> > - 		errors++;
> > - 	}
> > -
> > --	dprintf (" ->  %s", msg->reason_phrase);
> > -+	dprintfsoup (" ->  %s", msg->reason_phrase);
> > - 	if (msg->status_code !=3D status_code) {
> > --		dprintf ("???");
> > -+		dprintfsoup ("???");
> > - 		errors++;
> > - 	}
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > -
> > - 	g_object_unref (msg);
> > - 	return errors;
> > -@@ -327,11 +327,11 @@ do_ntlm_tests (SoupUri *base_uri)
> > - {
> > - 	int errors =3D 0;
> > -
> > --	dprintf ("Round 1: Non-NTLM Connection\n");
> > -+	dprintfsoup ("Round 1: Non-NTLM Connection\n");
> > - 	errors +=3D do_ntlm_round (base_uri, NULL);
> > --	dprintf ("Round 2: NTLM Connection, user=3Dalice\n");
> > -+	dprintfsoup ("Round 2: NTLM Connection, user=3Dalice\n");
> > - 	errors +=3D do_ntlm_round (base_uri, "alice");
> > --	dprintf ("Round 3: NTLM Connection, user=3Dbob\n");
> > -+	dprintfsoup ("Round 3: NTLM Connection, user=3Dbob\n");
> > - 	errors +=3D do_ntlm_round (base_uri, "bob");
> > -
> > - 	return errors;
> > -@@ -397,7 +397,7 @@ main (int argc, char **argv)
> > - 	g_hash_table_destroy (connections);
> > - 	g_main_context_unref (g_main_context_default ());
> > -
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > - 	if (errors) {
> > - 		printf ("ntlm-test: %d error(s). Run with '-d' for details\n",
> > - 			errors);
> > -diff -rupN libsoup-2.2.105/tests/proxy-test.c libsoup-2.2.105.new//tes=
ts/proxy-test.c
> > ---- libsoup-2.2.105/tests/proxy-test.c	2007-12-05 00:13:27.000000000 +=
0200
> > -+++ libsoup-2.2.105.new//tests/proxy-test.c	2012-01-16 20:11:02.000000=
000 +0200
> > -@@ -14,7 +14,7 @@ int errors =3D 0;
> > - gboolean debug =3D FALSE;
> > -
> > - static void
> > --dprintf (const char *format, ...)
> > -+dprintfsoup (const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -76,7 +76,7 @@ test_url (const char *url, int proxy, gu
> > - 	SoupUri *proxy_uri;
> > - 	SoupMessage *msg;
> > -
> > --	dprintf ("  GET %s via %s\n", url, proxy_names[proxy]);
> > -+	dprintfsoup ("  GET %s via %s\n", url, proxy_names[proxy]);
> > - 	if (proxy =3D=3D UNAUTH_PROXY&&  expected !=3D SOUP_STATUS_FORBIDDEN)
> > - 		expected =3D SOUP_STATUS_PROXY_UNAUTHORIZED;
> > -
> > -@@ -99,9 +99,9 @@ test_url (const char *url, int proxy, gu
> > -
> > - 	soup_session_send_message (session, msg);
> > -
> > --	dprintf ("  %d %s\n", msg->status_code, msg->reason_phrase);
> > -+	dprintfsoup ("  %d %s\n", msg->status_code, msg->reason_phrase);
> > - 	if (msg->status_code !=3D expected) {
> > --		dprintf ("  EXPECTED %d!\n", expected);
> > -+		dprintfsoup ("  EXPECTED %d!\n", expected);
> > - 		errors++;
> > - 	}
> > -
> > -@@ -115,7 +115,7 @@ run_test (int i, gboolean sync)
> > - {
> > - 	char *http_url, *https_url;
> > -
> > --	dprintf ("Test %d: %s (%s)\n", i + 1, tests[i].explanation,
> > -+	dprintfsoup ("Test %d: %s (%s)\n", i + 1, tests[i].explanation,
> > - 		 sync ? "sync" : "async");
> > -
> > - 	if (!strncmp (tests[i].url, "http", 4)) {
> > -@@ -141,7 +141,7 @@ run_test (int i, gboolean sync)
> > - 	g_free (http_url);
> > - 	g_free (https_url);
> > -
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > - }
> > -
> > - int
> > -@@ -176,7 +176,7 @@ main (int argc, char **argv)
> > - 	apache_cleanup ();
> > - 	g_main_context_unref (g_main_context_default ());
> > -
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > - 	if (errors) {
> > - 		printf ("proxy-test: %d error(s). Run with '-d' for details\n",
> > - 			errors);
> > -diff -rupN libsoup-2.2.105/tests/pull-api.c libsoup-2.2.105.new//tests=
/pull-api.c
> > ---- libsoup-2.2.105/tests/pull-api.c	2007-12-05 00:13:27.000000000 +02=
00
> > -+++ libsoup-2.2.105.new//tests/pull-api.c	2012-01-16 20:11:14.00000000=
0 +0200
> > -@@ -19,7 +19,7 @@ char *correct_response;
> > - guint correct_response_len;
> > -
> > - static void
> > --dprintf (int level, const char *format, ...)
> > -+dprintfsoup (int level, const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -98,7 +98,7 @@ do_fully_async_test (SoupSession *sessio
> > - 	loop =3D g_main_loop_new (NULL, FALSE);
> > -
> > - 	uri =3D g_build_filename (base_uri, sub_uri, NULL);
> > --	dprintf (1, "GET %s\n", uri);
> > -+	dprintfsoup (1, "GET %s\n", uri);
> > -
> > - 	msg =3D soup_message_new (SOUP_METHOD_GET, uri);
> > - 	g_free (uri);
> > -@@ -152,10 +152,10 @@ fully_async_request_chunk (gpointer user
> > - 	FullyAsyncData *ad =3D user_data;
> > -
> > - 	if (!ad->did_first_timeout) {
> > --		dprintf (1, "  first timeout\n");
> > -+		dprintfsoup (1, "  first timeout\n");
> > - 		ad->did_first_timeout =3D TRUE;
> > - 	} else
> > --		dprintf (2, "  timeout\n");
> > -+		dprintfsoup (2, "  timeout\n");
> > - 	ad->timeout =3D 0;
> > -
> > - 	/* ad->chunks_ready and ad->chunk_wanted are used because
> > -@@ -180,14 +180,14 @@ fully_async_got_headers (SoupMessage *ms
> > - {
> > - 	FullyAsyncData *ad =3D user_data;
> > -
> > --	dprintf (1, "  %d %s\n", msg->status_code, msg->reason_phrase);
> > -+	dprintfsoup (1, "  %d %s\n", msg->status_code, msg->reason_phrase);
> > - 	if (msg->status_code =3D=3D SOUP_STATUS_UNAUTHORIZED) {
> > - 		/* Let soup handle this one; this got_headers handler
> > - 		 * will get called again next time around.
> > - 		 */
> > - 		return;
> > - 	} else if (msg->status_code !=3D SOUP_STATUS_OK) {
> > --		dprintf (1, "  unexpected status: %d %s\n",
> > -+		dprintfsoup (1, "  unexpected status: %d %s\n",
> > - 			 msg->status_code, msg->reason_phrase);
> > - 		errors++;
> > - 		return;
> > -@@ -210,7 +210,7 @@ fully_async_got_chunk (SoupMessage *msg,
> > - {
> > - 	FullyAsyncData *ad =3D user_data;
> > -
> > --	dprintf (2, "  got chunk from %lu - %lu\n",
> > -+	dprintfsoup (2, "  got chunk from %lu - %lu\n",
> > - 		 (unsigned long) ad->read_so_far,
> > - 		 (unsigned long) ad->read_so_far + msg->response.length);
> > -
> > -@@ -227,13 +227,13 @@ fully_async_got_chunk (SoupMessage *msg,
> > - 	 * somewhere.
> > - 	 */
> > - 	if (ad->read_so_far + msg->response.length>  correct_response_len) {
> > --		dprintf (1, "  read too far! (%lu>  %lu)\n",
> > -+		dprintfsoup (1, "  read too far! (%lu>  %lu)\n",
> > - 			 (unsigned long) (ad->read_so_far + msg->response.length),
> > - 			 (unsigned long) correct_response_len);
> > - 		errors++;
> > - 	} else if (memcmp (msg->response.body, correct_response + ad->read_s=
o_far,
> > - 			   msg->response.length) !=3D 0) {
> > --		dprintf (1, "  data mismatch in block starting at %lu\n",
> > -+		dprintfsoup (1, "  data mismatch in block starting at %lu\n",
> > - 			 (unsigned long) ad->read_so_far);
> > - 		errors++;
> > - 	}
> > -@@ -257,7 +257,7 @@ fully_async_finished (SoupMessage *msg,
> > - 	FullyAsyncData *ad =3D user_data;
> > -
> > - 	if (msg->status_code !=3D ad->expected_status) {
> > --		dprintf (1, "  unexpected final status: %d %s !\n",
> > -+		dprintfsoup (1, "  unexpected final status: %d %s !\n",
> > - 			 msg->status_code, msg->reason_phrase);
> > - 		errors++;
> > - 	}
> > -@@ -300,7 +300,7 @@ do_synchronously_async_test (SoupSession
> > - 	GByteArray *chunk;
> > -
> > - 	uri =3D g_build_filename (base_uri, sub_uri, NULL);
> > --	dprintf (1, "GET %s\n", uri);
> > -+	dprintfsoup (1, "GET %s\n", uri);
> > -
> > - 	msg =3D soup_message_new (SOUP_METHOD_GET, uri);
> > - 	g_free (uri);
> > -@@ -314,11 +314,11 @@ do_synchronously_async_test (SoupSession
> > - 	sync_async_send (session, msg);
> > - 	if (msg->status =3D=3D SOUP_MESSAGE_STATUS_FINISHED&&
> > - 	    expected_status =3D=3D SOUP_STATUS_OK) {
> > --		dprintf (1, "  finished without reading response!\n");
> > -+		dprintfsoup (1, "  finished without reading response!\n");
> > - 		errors++;
> > - 	} else if (msg->status !=3D SOUP_MESSAGE_STATUS_FINISHED&&
> > - 		   expected_status !=3D SOUP_STATUS_OK) {
> > --		dprintf (1, "  request failed to fail!\n");
> > -+		dprintfsoup (1, "  request failed to fail!\n");
> > - 		errors++;
> > - 	}
> > -
> > -@@ -327,19 +327,19 @@ do_synchronously_async_test (SoupSession
> > - 	 */
> > - 	read_so_far =3D 0;
> > - 	while ((chunk =3D sync_async_read_chunk (msg))) {
> > --		dprintf (2, "  read chunk from %lu - %lu\n",
> > -+		dprintfsoup (2, "  read chunk from %lu - %lu\n",
> > - 			 (unsigned long) read_so_far,
> > - 			 (unsigned long) read_so_far + chunk->len);
> > -
> > - 		if (read_so_far + chunk->len>  correct_response_len) {
> > --			dprintf (1, "  read too far! (%lu>  %lu)\n",
> > -+			dprintfsoup (1, "  read too far! (%lu>  %lu)\n",
> > - 				 (unsigned long) read_so_far + chunk->len,
> > - 				 (unsigned long) correct_response_len);
> > - 			errors++;
> > - 		} else if (memcmp (chunk->data,
> > - 				   correct_response + read_so_far,
> > - 				   chunk->len) !=3D 0) {
> > --			dprintf (1, "  data mismatch in block starting at %lu\n",
> > -+			dprintfsoup (1, "  data mismatch in block starting at %lu\n",
> > - 				 (unsigned long) read_so_far);
> > - 			errors++;
> > - 		}
> > -@@ -350,10 +350,10 @@ do_synchronously_async_test (SoupSession
> > - 	if (msg->status !=3D SOUP_MESSAGE_STATUS_FINISHED ||
> > - 	    (msg->status_code =3D=3D SOUP_STATUS_OK&&
> > - 	     read_so_far !=3D correct_response_len)) {
> > --		dprintf (1, "  loop ended before message was fully read!\n");
> > -+		dprintfsoup (1, "  loop ended before message was fully read!\n");
> > - 		errors++;
> > - 	} else if (msg->status_code !=3D expected_status) {
> > --		dprintf (1, "  unexpected final status: %d %s !\n",
> > -+		dprintfsoup (1, "  unexpected final status: %d %s !\n",
> > - 			 msg->status_code, msg->reason_phrase);
> > - 		errors++;
> > - 	}
> > -@@ -413,14 +413,14 @@ sync_async_got_headers (SoupMessage *msg
> > - {
> > - 	SyncAsyncData *ad =3D user_data;
> > -
> > --	dprintf (1, "  %d %s\n", msg->status_code, msg->reason_phrase);
> > -+	dprintfsoup (1, "  %d %s\n", msg->status_code, msg->reason_phrase);
> > - 	if (msg->status_code =3D=3D SOUP_STATUS_UNAUTHORIZED) {
> > - 		/* Let soup handle this one; this got_headers handler
> > - 		 * will get called again next time around.
> > - 		 */
> > - 		return;
> > - 	} else if (msg->status_code !=3D SOUP_STATUS_OK) {
> > --		dprintf (1, "  unexpected status: %d %s\n",
> > -+		dprintfsoup (1, "  unexpected status: %d %s\n",
> > - 			 msg->status_code, msg->reason_phrase);
> > - 		errors++;
> > - 		return;
> > -@@ -526,7 +526,7 @@ main (int argc, char **argv)
> > - 	base_uri =3D "http://localhost:47524/";
> > - 	get_correct_response (base_uri);
> > -
> > --	dprintf (1, "\nFully async, fast requests\n");
> > -+	dprintfsoup (1, "\nFully async, fast requests\n");
> > - 	session =3D soup_session_async_new ();
> > - 	g_signal_connect (session, "authenticate",
> > - 			  G_CALLBACK (authenticate), NULL);
> > -@@ -539,7 +539,7 @@ main (int argc, char **argv)
> > - 	soup_session_abort (session);
> > - 	g_object_unref (session);
> > -
> > --	dprintf (1, "\nFully async, slow requests\n");
> > -+	dprintfsoup (1, "\nFully async, slow requests\n");
> > - 	session =3D soup_session_async_new ();
> > - 	g_signal_connect (session, "authenticate",
> > - 			  G_CALLBACK (authenticate), NULL);
> > -@@ -552,7 +552,7 @@ main (int argc, char **argv)
> > - 	soup_session_abort (session);
> > - 	g_object_unref (session);
> > -
> > --	dprintf (1, "\nSynchronously async\n");
> > -+	dprintfsoup (1, "\nSynchronously async\n");
> > - 	session =3D soup_session_async_new ();
> > - 	g_signal_connect (session, "authenticate",
> > - 			  G_CALLBACK (authenticate), NULL);
> > -@@ -571,7 +571,7 @@ main (int argc, char **argv)
> > - 	apache_cleanup ();
> > - 	g_main_context_unref (g_main_context_default ());
> > -
> > --	dprintf (1, "\n");
> > -+	dprintfsoup (1, "\n");
> > - 	if (errors) {
> > - 		printf ("pull-api: %d error(s). Run with '-d' for details\n",
> > - 			errors);
> > -diff -rupN libsoup-2.2.105/tests/uri-parsing.c libsoup-2.2.105.new//te=
sts/uri-parsing.c
> > ---- libsoup-2.2.105/tests/uri-parsing.c	2007-10-28 19:57:03.000000000 =
+0200
> > -+++ libsoup-2.2.105.new//tests/uri-parsing.c	2012-01-16 20:10:35.00000=
0000 +0200
> > -@@ -10,7 +10,7 @@
> > - gboolean debug =3D FALSE;
> > -
> > - static void
> > --dprintf (const char *format, ...)
> > -+dprintfsoup (const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -113,21 +113,21 @@ do_uri (SoupUri *base_uri, const char *b
> > - 	char *uri_string;
> > -
> > - 	if (base_uri) {
> > --		dprintf ("<%s>  +<%s>  =3D<%s>? ", base_str, in_uri,
> > -+		dprintfsoup ("<%s>  +<%s>  =3D<%s>? ", base_str, in_uri,
> > - 			 out_uri ? out_uri : "ERR");
> > - 		uri =3D soup_uri_new_with_base (base_uri, in_uri);
> > - 	} else {
> > --		dprintf ("<%s>  =3D>  <%s>? ", in_uri,
> > -+		dprintfsoup ("<%s>  =3D>  <%s>? ", in_uri,
> > - 			 out_uri ? out_uri : "ERR");
> > - 		uri =3D soup_uri_new (in_uri);
> > - 	}
> > -
> > - 	if (!uri) {
> > - 		if (out_uri) {
> > --			dprintf ("ERR\n  Could not parse %s\n", in_uri);
> > -+			dprintfsoup ("ERR\n  Could not parse %s\n", in_uri);
> > - 			return FALSE;
> > - 		} else {
> > --			dprintf ("OK\n");
> > -+			dprintfsoup ("OK\n");
> > - 			return TRUE;
> > - 		}
> > - 	}
> > -@@ -136,18 +136,18 @@ do_uri (SoupUri *base_uri, const char *b
> > - 	soup_uri_free (uri);
> > -
> > - 	if (!out_uri) {
> > --		dprintf ("ERR\n  Got %s\n", uri_string);
> > -+		dprintfsoup ("ERR\n  Got %s\n", uri_string);
> > - 		return FALSE;
> > - 	}
> > -
> > - 	if (strcmp (uri_string, out_uri) !=3D 0) {
> > --		dprintf ("NO\n  Unparses to<%s>\n", uri_string);
> > -+		dprintfsoup ("NO\n  Unparses to<%s>\n", uri_string);
> > - 		g_free (uri_string);
> > - 		return FALSE;
> > - 	}
> > - 	g_free (uri_string);
> > -
> > --	dprintf ("OK\n");
> > -+	dprintfsoup ("OK\n");
> > - 	return TRUE;
> > - }
> > -
> > -@@ -169,14 +169,14 @@ main (int argc, char **argv)
> > - 		}
> > - 	}
> > -
> > --	dprintf ("Absolute URI parsing\n");
> > -+	dprintfsoup ("Absolute URI parsing\n");
> > - 	for (i =3D 0; i<  num_abs_tests; i++) {
> > - 		if (!do_uri (NULL, NULL, abs_tests[i].uri_string,
> > - 			     abs_tests[i].result))
> > - 			errs++;
> > - 	}
> > -
> > --	dprintf ("\nRelative URI parsing\n");
> > -+	dprintfsoup ("\nRelative URI parsing\n");
> > - 	base_uri =3D soup_uri_new (base);
> > - 	if (!base_uri) {
> > - 		fprintf (stderr, "Could not parse %s!\n", base);
> > -@@ -198,7 +198,7 @@ main (int argc, char **argv)
> > - 	}
> > - 	soup_uri_free (base_uri);
> > -
> > --	dprintf ("\n");
> > -+	dprintfsoup ("\n");
> > - 	if (errs) {
> > - 		printf ("uri-parsing: %d error(s). Run with '-d' for details\n",
> > - 			errs);
> > -diff -rupN libsoup-2.2.105/tests/xmlrpc-test.c libsoup-2.2.105.new//te=
sts/xmlrpc-test.c
> > ---- libsoup-2.2.105/tests/xmlrpc-test.c	2008-02-08 04:19:00.000000000 =
+0200
> > -+++ libsoup-2.2.105.new//tests/xmlrpc-test.c	2012-01-16 20:12:18.00000=
0000 +0200
> > -@@ -19,7 +19,7 @@ static const char *uri =3D "http://localho
> > - int debug;
> > -
> > - static void
> > --dprintf (int level, const char *format, ...)
> > -+dprintfsoup (int level, const char *format, ...)
> > - {
> > - 	va_list args;
> > -
> > -@@ -54,13 +54,13 @@ do_xmlrpc (SoupXmlrpcMessage *xmsg, Soup
> > - 	soup_xmlrpc_message_persist (xmsg);
> > - 	status =3D soup_session_send_message (session, msg);
> > -
> > --	dprintf (3, "\n%.*s\n%d %s\n%.*s\n",
> > -+	dprintfsoup (3, "\n%.*s\n%d %s\n%.*s\n",
> > - 		 msg->request.length, msg->request.body,
> > - 		 msg->status_code, msg->reason_phrase,
> > - 		 msg->response.length, msg->response.body);
> > -
> > - 	if (!SOUP_STATUS_IS_SUCCESSFUL (status)) {
> > --		dprintf (1, "ERROR: %d %s\n", status, msg->reason_phrase);
> > -+		dprintfsoup (1, "ERROR: %d %s\n", status, msg->reason_phrase);
> > - 		g_object_unref (msg);
> > - 		return FALSE;
> > - 	}
> > -@@ -69,9 +69,9 @@ do_xmlrpc (SoupXmlrpcMessage *xmsg, Soup
> > - 	g_object_unref (msg);
> > - 	if (!response || soup_xmlrpc_response_is_fault (response)) {
> > - 		if (!response)
> > --			dprintf (1, "ERROR: no response\n");
> > -+			dprintfsoup (1, "ERROR: no response\n");
> > - 		else {
> > --			dprintf (1, "ERROR: fault\n");
> > -+			dprintfsoup (1, "ERROR: fault\n");
> > - 			g_object_unref (response);
> > - 		}
> > - 		return FALSE;
> > -@@ -79,11 +79,11 @@ do_xmlrpc (SoupXmlrpcMessage *xmsg, Soup
> > -
> > - 	value =3D soup_xmlrpc_response_get_value (response);
> > - 	if (!value) {
> > --		dprintf (1, "ERROR: no value?\n");
> > -+		dprintfsoup (1, "ERROR: no value?\n");
> > - 		g_object_unref (response);
> > - 		return NULL;
> > - 	} else if (soup_xmlrpc_value_get_type (value) !=3D type) {
> > --		dprintf (1, "ERROR: wrong value type; expected %s, got %s\n",
> > -+		dprintfsoup (1, "ERROR: wrong value type; expected %s, got %s\n",
> > - 			 value_type[type], value_type[soup_xmlrpc_value_get_type (value)]);
> > - 		g_object_unref (response);
> > - 		return NULL;
> > -@@ -101,7 +101,7 @@ test_sum (void)
> > - 	int i, val, sum;
> > - 	long result;
> > -
> > --	dprintf (1, "sum (array of int ->  int): ");
> > -+	dprintfsoup (1, "sum (array of int ->  int): ");
> > -
> > - 	msg =3D soup_xmlrpc_message_new (uri);
> > - 	soup_xmlrpc_message_start_call (msg, "sum");
> > -@@ -109,11 +109,11 @@ test_sum (void)
> > - 	soup_xmlrpc_message_start_array (msg);
> > - 	for (i =3D sum =3D 0; i<  10; i++) {
> > - 		val =3D rand () % 100;
> > --		dprintf (2, "%s%d", i =3D=3D 0 ? "[" : ", ", val);
> > -+		dprintfsoup (2, "%s%d", i =3D=3D 0 ? "[" : ", ", val);
> > - 		soup_xmlrpc_message_write_int (msg, val);
> > - 		sum +=3D val;
> > - 	}
> > --	dprintf (2, "] ->  ");
> > -+	dprintfsoup (2, "] ->  ");
> > - 	soup_xmlrpc_message_end_array (msg);
> > - 	soup_xmlrpc_message_end_param (msg);
> > - 	soup_xmlrpc_message_end_call (msg);
> > -@@ -124,14 +124,14 @@ test_sum (void)
> > - 	value =3D soup_xmlrpc_response_get_value (response);
> > -
> > - 	if (!soup_xmlrpc_value_get_int (value,&result)) {
> > --		dprintf (1, "wrong type?\n");
> > -+		dprintfsoup (1, "wrong type?\n");
> > - 		g_object_unref (response);
> > - 		return FALSE;
> > - 	}
> > - 	g_object_unref (response);
> > -
> > --	dprintf (2, "%ld: ", result);
> > --	dprintf (1, "%s\n", result =3D=3D sum ? "OK!" : "WRONG!");
> > -+	dprintfsoup (2, "%ld: ", result);
> > -+	dprintfsoup (1, "%s\n", result =3D=3D sum ? "OK!" : "WRONG!");
> > - 	return result =3D=3D sum;
> > - }
> > -
> > -@@ -146,7 +146,7 @@ test_countBools (void)
> > - 	gboolean val, ok;
> > - 	GHashTable *result;
> > -
> > --	dprintf (1, "countBools (array of boolean ->  struct of ints): ");
> > -+	dprintfsoup (1, "countBools (array of boolean ->  struct of ints): "=
);
> > -
> > - 	msg =3D soup_xmlrpc_message_new (uri);
> > - 	soup_xmlrpc_message_start_call (msg, "countBools");
> > -@@ -154,14 +154,14 @@ test_countBools (void)
> > - 	soup_xmlrpc_message_start_array (msg);
> > - 	for (i =3D trues =3D falses =3D 0; i<  10; i++) {
> > - 		val =3D rand ()>  (RAND_MAX / 2);
> > --		dprintf (2, "%s%c", i =3D=3D 0 ? "[" : ", ", val ? 'T' : 'F');
> > -+		dprintfsoup (2, "%s%c", i =3D=3D 0 ? "[" : ", ", val ? 'T' : 'F');
> > - 		soup_xmlrpc_message_write_boolean (msg, val);
> > - 		if (val)
> > - 			trues++;
> > - 		else
> > - 			falses++;
> > - 	}
> > --	dprintf (2, "] ->  ");
> > -+	dprintfsoup (2, "] ->  ");
> > - 	soup_xmlrpc_message_end_array (msg);
> > - 	soup_xmlrpc_message_end_param (msg);
> > - 	soup_xmlrpc_message_end_call (msg);
> > -@@ -172,19 +172,19 @@ test_countBools (void)
> > - 	value =3D soup_xmlrpc_response_get_value (response);
> > -
> > - 	if (!soup_xmlrpc_value_get_struct (value,&result)) {
> > --		dprintf (1, "wrong type?\n");
> > -+		dprintfsoup (1, "wrong type?\n");
> > - 		g_object_unref (response);
> > - 		return FALSE;
> > - 	}
> > -
> > - 	if (!soup_xmlrpc_value_get_int (g_hash_table_lookup (result, "true")=
,&ret_trues)) {
> > --		dprintf (1, "NO 'true' value in response\n");
> > -+		dprintfsoup (1, "NO 'true' value in response\n");
> > - 		g_hash_table_destroy (result);
> > - 		g_object_unref (response);
> > - 		return FALSE;
> > - 	}
> > - 	if (!soup_xmlrpc_value_get_int (g_hash_table_lookup (result, "false"=
),&ret_falses)) {
> > --		dprintf (1, "NO 'false' value in response\n");
> > -+		dprintfsoup (1, "NO 'false' value in response\n");
> > - 		g_hash_table_destroy (result);
> > - 		g_object_unref (response);
> > - 		return FALSE;
> > -@@ -192,9 +192,9 @@ test_countBools (void)
> > - 	g_hash_table_destroy (result);
> > - 	g_object_unref (response);
> > -
> > --	dprintf (2, "{ true: %ld, false: %ld } ", ret_trues, ret_falses);
> > -+	dprintfsoup (2, "{ true: %ld, false: %ld } ", ret_trues, ret_falses);
> > - 	ok =3D (trues =3D=3D ret_trues)&&  (falses =3D=3D ret_falses);
> > --	dprintf (1, "%s\n", ok ? "OK!" : "WRONG!");
> > -+	dprintfsoup (1, "%s\n", ok ? "OK!" : "WRONG!");
> > - 	return ok;
> > - }
> > -
> > -@@ -211,7 +211,7 @@ test_md5sum (void)
> > - 	guchar digest[16];
> > - 	gboolean ok;
> > -
> > --	dprintf (1, "md5sum (base64 ->  base64): ");
> > -+	dprintfsoup (1, "md5sum (base64 ->  base64): ");
> > -
> > - 	msg =3D soup_xmlrpc_message_new (uri);
> > - 	soup_xmlrpc_message_start_call (msg, "md5sum");
> > -@@ -228,14 +228,14 @@ test_md5sum (void)
> > - 	value =3D soup_xmlrpc_response_get_value (response);
> > -
> > - 	if (!soup_xmlrpc_value_get_base64 (value,&result)) {
> > --		dprintf (1, "wrong type?\n");
> > -+		dprintfsoup (1, "wrong type?\n");
> > - 		g_object_unref (response);
> > - 		return FALSE;
> > - 	}
> > - 	g_object_unref (response);
> > -
> > - 	if (result->len !=3D 16) {
> > --		dprintf (1, "result has WRONG length (%d)\n", result->len);
> > -+		dprintfsoup (1, "result has WRONG length (%d)\n", result->len);
> > - 		g_byte_array_free (result, TRUE);
> > - 		return FALSE;
> > - 	}
> > -@@ -245,7 +245,7 @@ test_md5sum (void)
> > - 	soup_md5_final (&md5, digest);
> > -
> > - 	ok =3D (memcmp (digest, result->data, 16) =3D=3D 0);
> > --	dprintf (1, "%s\n", ok ? "OK!" : "WRONG!");
> > -+	dprintfsoup (1, "%s\n", ok ? "OK!" : "WRONG!");
> > - 	g_byte_array_free (result, TRUE);
> > - 	return ok;
> > - }
> > -@@ -260,7 +260,7 @@ test_dateChange (void)
> > - 	time_t when, result;
> > - 	char timestamp[128];
> > -
> > --	dprintf (1, "dateChange (struct of time and ints ->  time): ");
> > -+	dprintfsoup (1, "dateChange (struct of time and ints ->  time): ");
> > -
> > - 	msg =3D soup_xmlrpc_message_new (uri);
> > - 	soup_xmlrpc_message_start_call (msg, "dateChange");
> > -@@ -281,53 +281,53 @@ test_dateChange (void)
> > -
> > - 	strftime (timestamp, sizeof (timestamp),
> > - 		  "%Y-%m-%dT%H:%M:%S",&tm);
> > --	dprintf (2, "{ date: %s", timestamp);
> > -+	dprintfsoup (2, "{ date: %s", timestamp);
> > -
> > - 	if (rand () % 3) {
> > - 		tm.tm_year =3D 70 + (rand () % 50);
> > --		dprintf (2, ", tm_year: %d", tm.tm_year);
> > -+		dprintfsoup (2, ", tm_year: %d", tm.tm_year);
> > - 		soup_xmlrpc_message_start_member (msg, "tm_year");
> > - 		soup_xmlrpc_message_write_int (msg, tm.tm_year);
> > - 		soup_xmlrpc_message_end_member (msg);
> > - 	}
> > - 	if (rand () % 3) {
> > - 		tm.tm_mon =3D rand () % 12;
> > --		dprintf (2, ", tm_mon: %d", tm.tm_mon);
> > -+		dprintfsoup (2, ", tm_mon: %d", tm.tm_mon);
> > - 		soup_xmlrpc_message_start_member (msg, "tm_mon");
> > - 		soup_xmlrpc_message_write_int (msg, tm.tm_mon);
> > - 		soup_xmlrpc_message_end_member (msg);
> > - 	}
> > - 	if (rand () % 3) {
> > - 		tm.tm_mday =3D 1 + (rand () % 28);
> > --		dprintf (2, ", tm_mday: %d", tm.tm_mday);
> > -+		dprintfsoup (2, ", tm_mday: %d", tm.tm_mday);
> > - 		soup_xmlrpc_message_start_member (msg, "tm_mday");
> > - 		soup_xmlrpc_message_write_int (msg, tm.tm_mday);
> > - 		soup_xmlrpc_message_end_member (msg);
> > - 	}
> > - 	if (rand () % 3) {
> > - 		tm.tm_hour =3D rand () % 24;
> > --		dprintf (2, ", tm_hour: %d", tm.tm_hour);
> > -+		dprintfsoup (2, ", tm_hour: %d", tm.tm_hour);
> > - 		soup_xmlrpc_message_start_member (msg, "tm_hour");
> > - 		soup_xmlrpc_message_write_int (msg, tm.tm_hour);
> > - 		soup_xmlrpc_message_end_member (msg);
> > - 	}
> > - 	if (rand () % 3) {
> > - 		tm.tm_min =3D rand () % 60;
> > --		dprintf (2, ", tm_min: %d", tm.tm_min);
> > -+		dprintfsoup (2, ", tm_min: %d", tm.tm_min);
> > - 		soup_xmlrpc_message_start_member (msg, "tm_min");
> > - 		soup_xmlrpc_message_write_int (msg, tm.tm_min);
> > - 		soup_xmlrpc_message_end_member (msg);
> > - 	}
> > - 	if (rand () % 3) {
> > - 		tm.tm_sec =3D rand () % 60;
> > --		dprintf (2, ", tm_sec: %d", tm.tm_sec);
> > -+		dprintfsoup (2, ", tm_sec: %d", tm.tm_sec);
> > - 		soup_xmlrpc_message_start_member (msg, "tm_sec");
> > - 		soup_xmlrpc_message_write_int (msg, tm.tm_sec);
> > - 		soup_xmlrpc_message_end_member (msg);
> > - 	}
> > - 	when =3D soup_mktime_utc (&tm);
> > -
> > --	dprintf (2, " } ->  ");
> > -+	dprintfsoup (2, " } ->  ");
> > -
> > - 	soup_xmlrpc_message_end_struct (msg);
> > - 	soup_xmlrpc_message_end_param (msg);
> > -@@ -339,7 +339,7 @@ test_dateChange (void)
> > - 	value =3D soup_xmlrpc_response_get_value (response);
> > -
> > - 	if (!soup_xmlrpc_value_get_datetime (value,&result)) {
> > --		dprintf (1, "wrong type?\n");
> > -+		dprintfsoup (1, "wrong type?\n");
> > - 		g_object_unref (response);
> > - 		return FALSE;
> > - 	}
> > -@@ -348,9 +348,9 @@ test_dateChange (void)
> > - 	memset (&tm, 0, sizeof (tm));
> > - 	soup_gmtime (&result,&tm);
> > - 	strftime (timestamp, sizeof (timestamp), "%Y-%m-%dT%H:%M:%S",&tm);
> > --	dprintf (2, "%s: ", timestamp);
> > -+	dprintfsoup (2, "%s: ", timestamp);
> > -
> > --	dprintf (1, "%s\n", (when =3D=3D result) ? "OK!" : "WRONG!");
> > -+	dprintfsoup (1, "%s\n", (when =3D=3D result) ? "OK!" : "WRONG!");
> > - 	return (when =3D=3D result);
> > - }
> > -
> > -@@ -372,17 +372,17 @@ test_echo (void)
> > - 	char *echo;
> > - 	int i;
> > -
> > --	dprintf (1, "echo (array of string ->  array of string): ");
> > -+	dprintfsoup (1, "echo (array of string ->  array of string): ");
> > -
> > - 	msg =3D soup_xmlrpc_message_new (uri);
> > - 	soup_xmlrpc_message_start_call (msg, "echo");
> > - 	soup_xmlrpc_message_start_param (msg);
> > - 	soup_xmlrpc_message_start_array (msg);
> > - 	for (i =3D 0; i<  N_ECHO_STRINGS; i++) {
> > --		dprintf (2, "%s\"%s\"", i =3D=3D 0 ? "[" : ", ", echo_strings[i]);
> > -+		dprintfsoup (2, "%s\"%s\"", i =3D=3D 0 ? "[" : ", ", echo_strings[i=
]);
> > - 		soup_xmlrpc_message_write_string (msg, echo_strings[i]);
> > - 	}
> > --	dprintf (2, "] ->  ");
> > -+	dprintfsoup (2, "] ->  ");
> > - 	soup_xmlrpc_message_end_array (msg);
> > - 	soup_xmlrpc_message_end_param (msg);
> > - 	soup_xmlrpc_message_end_call (msg);
> > -@@ -393,25 +393,25 @@ test_echo (void)
> > - 	value =3D soup_xmlrpc_response_get_value (response);
> > -
> > - 	if (!soup_xmlrpc_value_array_get_iterator (value,&iter)) {
> > --		dprintf (1, "wrong type?\n");
> > -+		dprintfsoup (1, "wrong type?\n");
> > - 		g_object_unref (response);
> > - 		return FALSE;
> > - 	}
> > - 	i =3D 0;
> > - 	while (iter) {
> > - 		if (!soup_xmlrpc_value_array_iterator_get_value (iter,&elt)) {
> > --			dprintf (1, " WRONG! Can't get result element %d\n", i + 1);
> > -+			dprintfsoup (1, " WRONG! Can't get result element %d\n", i + 1);
> > - 			g_object_unref (response);
> > - 			return FALSE;
> > - 		}
> > - 		if (!soup_xmlrpc_value_get_string (elt,&echo)) {
> > --			dprintf (1, " WRONG! Result element %d is not a string", i + 1);
> > -+			dprintfsoup (1, " WRONG! Result element %d is not a string", i + 1=
);
> > - 			g_object_unref (response);
> > - 			return FALSE;
> > - 		}
> > --		dprintf (2, "%s\"%s\"", i =3D=3D 0 ? "[" : ", ", echo);
> > -+		dprintfsoup (2, "%s\"%s\"", i =3D=3D 0 ? "[" : ", ", echo);
> > - 		if (strcmp (echo_strings[i], echo) !=3D 0) {
> > --			dprintf (1, " WRONG! Mismatch at %d\n", i + 1);
> > -+			dprintfsoup (1, " WRONG! Mismatch at %d\n", i + 1);
> > - 			g_free (echo);
> > - 			g_object_unref (response);
> > - 			return FALSE;
> > -@@ -421,10 +421,10 @@ test_echo (void)
> > - 		iter =3D soup_xmlrpc_value_array_iterator_next (iter);
> > - 		i++;
> > - 	}
> > --	dprintf (2, "] ");
> > -+	dprintfsoup (2, "] ");
> > - 	g_object_unref (response);
> > -
> > --	dprintf (1, "%s\n", i =3D=3D N_ECHO_STRINGS ? "OK!" : "WRONG! Too fe=
w results");
> > -+	dprintfsoup (1, "%s\n", i =3D=3D N_ECHO_STRINGS ? "OK!" : "WRONG! To=
o few results");
> > - 	return i =3D=3D N_ECHO_STRINGS;
> > - }
> > -
> > -@@ -480,7 +480,7 @@ main (int argc, char **argv)
> > -
> > - 	apache_cleanup ();
> > -
> > --	dprintf (1, "\n");
> > -+	dprintfsoup (1, "\n");
> > - 	if (errors) {
> > - 		printf ("xmlrpc-test: %d error(s). Run with '-d' for details\n",
> > - 			errors);
> > diff --git a/meta/recipes-support/libsoup/libsoup-2.2.105/fix-for-new-g=
lib.patch b/meta/recipes-support/libsoup/libsoup-2.2.105/fix-for-new-glib.p=
atch
> > deleted file mode 100644
> > index c85ec14..0000000
> > --- a/meta/recipes-support/libsoup/libsoup-2.2.105/fix-for-new-glib.pat=
ch
> > +++ /dev/null
> > @@ -1,85 +0,0 @@
> > -Fix for glib-2.0 version 2.32.2
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Saul Wold<sgw@linux.intel.com>
> > -
> > -
> > -Index: libsoup-2.2.105/libsoup/soup-date.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- libsoup-2.2.105.orig/libsoup/soup-date.h
> > -+++ libsoup-2.2.105/libsoup/soup-date.h
> > -@@ -7,7 +7,7 @@
> > - #define SOUP_DATE_H 1
> > -
> > - #include<time.h>
> > --#include<glib/gmacros.h>
> > -+#include<glib.h>
> > -
> > - G_BEGIN_DECLS
> > -
> > -Index: libsoup-2.2.105/libsoup/soup-method.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- libsoup-2.2.105.orig/libsoup/soup-method.h
> > -+++ libsoup-2.2.105/libsoup/soup-method.h
> > -@@ -6,7 +6,7 @@
> > - #ifndef SOUP_METHOD_H
> > - #define SOUP_METHOD_H 1
> > -
> > --#include<glib/gmacros.h>
> > -+#include<glib.h>
> > -
> > - G_BEGIN_DECLS
> > -
> > -Index: libsoup-2.2.105/libsoup/soup-portability.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- libsoup-2.2.105.orig/libsoup/soup-portability.h
> > -+++ libsoup-2.2.105/libsoup/soup-portability.h
> > -@@ -6,7 +6,7 @@
> > - #ifndef SOUP_PORTABILITY_H
> > - #define SOUP_PORTABILITY_H
> > -
> > --#include<glibconfig.h>
> > -+#include<glib.h>
> > -
> > - #ifdef G_OS_WIN32
> > -
> > -Index: libsoup-2.2.105/libsoup/soup-status.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- libsoup-2.2.105.orig/libsoup/soup-status.h
> > -+++ libsoup-2.2.105/libsoup/soup-status.h
> > -@@ -8,7 +8,7 @@
> > - #ifndef SOUP_STATUS_H
> > - #define SOUP_STATUS_H 1
> > -
> > --#include<glib/gmacros.h>
> > -+#include<glib.h>
> > -
> > - G_BEGIN_DECLS
> > -
> > -Index: libsoup-2.2.105/libsoup/soup-types.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- libsoup-2.2.105.orig/libsoup/soup-types.h
> > -+++ libsoup-2.2.105/libsoup/soup-types.h
> > -@@ -6,7 +6,7 @@
> > - #ifndef SOUP_TYPES_H
> > - #define SOUP_TYPES_H 1
> > -
> > --#include<glib/gtypes.h>
> > -+#include<glib.h>
> > - #include<glib-object.h>
> > -
> > - #include<libsoup/soup-status.h>
> > -Index: libsoup-2.2.105/tests/revserver.c
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- libsoup-2.2.105.orig/tests/revserver.c
> > -+++ libsoup-2.2.105/tests/revserver.c
> > -@@ -11,7 +11,7 @@
> > - #include<libsoup/soup-address.h>
> > - #include<libsoup/soup-socket.h>
> > -
> > --#include<glib/gthread.h>
> > -+#include<glib.h>
> > -
> > - static void rev_read (SoupSocket *sock, GString *buf);
> > - static void rev_write (SoupSocket *sock, GString *buf);
> > diff --git a/meta/recipes-support/libsoup/libsoup_2.2.105.bb b/meta/rec=
ipes-support/libsoup/libsoup_2.2.105.bb
> > deleted file mode 100644
> > index 9b5d4f8..0000000
> > --- a/meta/recipes-support/libsoup/libsoup_2.2.105.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -DESCRIPTION =3D "An HTTP library implementation in C"
> > -SECTION =3D "x11/gnome/libs"
> > -LICENSE =3D "LGPLv2+"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9a=
bc605"
> > -PR =3D "r4"
> > -
> > -DEPENDS =3D "glib-2.0 gnutls libxml2"
> > -
> > -SRC_URI =3D "${GNOME_MIRROR}/${BPN}/2.2/${BPN}-${PV}.tar.bz2 \
> > -	    file://dprintf_conflict_with_eglibc.patch \
> > -            file://fix-for-new-glib.patch"
> > -
> > -SRC_URI[md5sum] =3D "7fa48b06a0e2b0ff3d2fa45cf331f169"
> > -SRC_URI[sha256sum] =3D "3760a127ee810cfd0fda257ff615d19a2dd8aeece199da=
d0d18690446df72e8f"
> > -
> > -inherit autotools pkgconfig
> > -
> > -#FILES_${PN} =3D "${libdir}/lib*.so.*"
> > -#FILES_${PN}-dev =3D "${includedir}/ ${libdir}/"
> > -#FILES_${PN}-doc =3D "${datadir}/"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+ozYMACgkQN1Ujt2V2gBxeEACgoLU0HcS1xm2sxi1K3nsHvq3G
XzwAn3hQ+aASeoUE6OXR1xiikKKRtpB3
=Y5Dc
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
