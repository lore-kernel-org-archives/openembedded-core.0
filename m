Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 655D377205
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 22:34:38 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id uo6so72020071pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 14:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=I6nh1Yxx9eR1Ngcq4fidyMKp+hdyM3kayh966kGFrsE=;
	b=HakuqVujTOVMvQPg6z2T+VEV5/h8U6zLZ4rDFJDWqkQFloeZ4fKxDk1CYQIcdTeURY
	P+DAeQY/HEBErBovidmBfEcQC78g6s3TWxQOG64DNvwcCfWmmvO8VxFGSPVNnNTj2tsK
	tYevWD0QfAnuugZiiHFy2jd7qxIXW1U6cdDWhSV/X88hjCNQM4vLUS0YoBBz8wQD5QSQ
	uev8et3K5hl0AyNLeCFFKsZYrpg4zQtEyS/01ENguwZYs368wpZjuBVJ9PODejehn5d1
	rohCRNqLcpyGcblGfRHqXBbpR9AYrIrvUJGtcyWIHaUIfwkab7BIVe2ygelVs4tk4/Tr
	LLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=I6nh1Yxx9eR1Ngcq4fidyMKp+hdyM3kayh966kGFrsE=;
	b=F1AwIEGHz7bTm5N/d/7ffHxrTsYbOIMMr9O/cMpvLQOUtOffv7qzKCdbmU3Wasxczq
	88KQy+2G7X8y7caZCnzm6ml84mZ6oAVUVme0c8We7Kz3aZepWuWxfz++ILr3Bh4pkQER
	WrYHCT1AxfbYlHkCgX9oKHAdY2IAFbz9If0wNU8zNgkRjjGDC0wpEUXsL/I8NgWI0MiP
	91xncwnmZgZFJEXPyqHYKv9ubf+zxs52KpNf6C2mEwez0CNmDBJGUcubrK7UHGdmAPs8
	PdsTmK9/O2W+HMeYwVF0EvO/V5CcQDM+79dMK9hFXldYB3EDWiH5I/Yd3MG8BQiG4aYd
	vgWg==
X-Gm-Message-State: AG10YOTCI23W7z8BgJjNaNQAzLiV5AYngEqmUFHKmvGNC1fkZA5179hHEQkmNfSIc8Zeqg==
X-Received: by 10.66.158.169 with SMTP id wv9mr33040461pab.138.1454279679838; 
	Sun, 31 Jan 2016 14:34:39 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	16sm38097871pfh.48.2016.01.31.14.34.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 14:34:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 14:34:29 -0800
Message-Id: <fbfe937ab7effcacd1dae558a667eaa0e0500637.1454279467.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454279467.git.akuster@mvista.com>
References: <cover.1454279467.git.akuster@mvista.com>
In-Reply-To: <cover.1454279467.git.akuster@mvista.com>
References: <cover.1454279467.git.akuster@mvista.com>
Subject: [jethro-next 1/1] git: Security fix CVE-2015-7545
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
X-List-Received-Date: Sun, 31 Jan 2016 22:34:40 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7545 git: arbitrary code execution via crafted URLs

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../git/git-2.5.0/0008-CVE-2015-7545-1.patch       | 446 +++++++++++++++++++++
 .../git/git-2.5.0/0009-CVE-2015-7545-2.patch       | 112 ++++++
 .../git/git-2.5.0/0010-CVE-2015-7545-3.patch       | 112 ++++++
 .../git/git-2.5.0/0011-CVE-2015-7545-4.patch       | 150 +++++++
 .../git/git-2.5.0/0012-CVE-2015-7545-5.patch       |  69 ++++
 meta/recipes-devtools/git/git_2.5.0.bb             |   8 +
 6 files changed, 897 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015-7545-1.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015-7545-2.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015-7545-3.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015-7545-4.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015-7545-5.patch

diff --git a/meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015-7545-1.patch b/meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015-7545-1.patch
new file mode 100644
index 0000000..b552c09
--- /dev/null
+++ b/meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015-7545-1.patch
@@ -0,0 +1,446 @@
+From a5adaced2e13c135d5d9cc65be9eb95aa3bacedf Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Wed, 16 Sep 2015 13:12:52 -0400
+Subject: [PATCH] transport: add a protocol-whitelist environment variable
+
+If we are cloning an untrusted remote repository into a
+sandbox, we may also want to fetch remote submodules in
+order to get the complete view as intended by the other
+side. However, that opens us up to attacks where a malicious
+user gets us to clone something they would not otherwise
+have access to (this is not necessarily a problem by itself,
+but we may then act on the cloned contents in a way that
+exposes them to the attacker).
+
+Ideally such a setup would sandbox git entirely away from
+high-value items, but this is not always practical or easy
+to set up (e.g., OS network controls may block multiple
+protocols, and we would want to enable some but not others).
+
+We can help this case by providing a way to restrict
+particular protocols. We use a whitelist in the environment.
+This is more annoying to set up than a blacklist, but
+defaults to safety if the set of protocols git supports
+grows). If no whitelist is specified, we continue to default
+to allowing all protocols (this is an "unsafe" default, but
+since the minority of users will want this sandboxing
+effect, it is the only sensible one).
+
+A note on the tests: ideally these would all be in a single
+test file, but the git-daemon and httpd test infrastructure
+is an all-or-nothing proposition rather than a test-by-test
+prerequisite. By putting them all together, we would be
+unable to test the file-local code on machines without
+apache.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport
+
+http://archive.ubuntu.com/ubuntu/pool/main/g/git/git_2.5.0-1ubuntu0.1.debian.tar.xz
+
+CVE: CVE-2015-7545 #1
+Singed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ Documentation/git.txt          | 32 ++++++++++++++
+ connect.c                      |  5 +++
+ t/lib-proto-disable.sh         | 96 ++++++++++++++++++++++++++++++++++++++++++
+ t/t5810-proto-disable-local.sh | 14 ++++++
+ t/t5811-proto-disable-git.sh   | 20 +++++++++
+ t/t5812-proto-disable-http.sh  | 20 +++++++++
+ t/t5813-proto-disable-ssh.sh   | 20 +++++++++
+ t/t5814-proto-disable-ext.sh   | 18 ++++++++
+ transport-helper.c             |  2 +
+ transport.c                    | 21 ++++++++-
+ transport.h                    |  7 +++
+ 11 files changed, 254 insertions(+), 1 deletion(-)
+ create mode 100644 t/lib-proto-disable.sh
+ create mode 100755 t/t5810-proto-disable-local.sh
+ create mode 100755 t/t5811-proto-disable-git.sh
+ create mode 100755 t/t5812-proto-disable-http.sh
+ create mode 100755 t/t5813-proto-disable-ssh.sh
+ create mode 100755 t/t5814-proto-disable-ext.sh
+
+Index: git-2.5.0/Documentation/git.txt
+===================================================================
+--- git-2.5.0.orig/Documentation/git.txt	2015-12-11 12:46:48.975637719 -0500
++++ git-2.5.0/Documentation/git.txt	2015-12-11 12:46:48.967637661 -0500
+@@ -1069,6 +1069,38 @@
+ 	an operation has touched every ref (e.g., because you are
+ 	cloning a repository to make a backup).
+ 
++`GIT_ALLOW_PROTOCOL`::
++	If set, provide a colon-separated list of protocols which are
++	allowed to be used with fetch/push/clone. This is useful to
++	restrict recursive submodule initialization from an untrusted
++	repository. Any protocol not mentioned will be disallowed (i.e.,
++	this is a whitelist, not a blacklist). If the variable is not
++	set at all, all protocols are enabled.  The protocol names
++	currently used by git are:
++
++	  - `file`: any local file-based path (including `file://` URLs,
++	    or local paths)
++
++	  - `git`: the anonymous git protocol over a direct TCP
++	    connection (or proxy, if configured)
++
++	  - `ssh`: git over ssh (including `host:path` syntax,
++	    `git+ssh://`, etc).
++
++	  - `rsync`: git over rsync
++
++	  - `http`: git over http, both "smart http" and "dumb http".
++	    Note that this does _not_ include `https`; if you want both,
++	    you should specify both as `http:https`.
++
++	  - any external helpers are named by their protocol (e.g., use
++	    `hg` to allow the `git-remote-hg` helper)
+++
++Note that this controls only git's internal protocol selection.
++If libcurl is used (e.g., by the `http` transport), it may
++redirect to other protocols. There is not currently any way to
++restrict this.
++
+ 
+ Discussion[[Discussion]]
+ ------------------------
+Index: git-2.5.0/connect.c
+===================================================================
+--- git-2.5.0.orig/connect.c	2015-12-11 12:46:48.975637719 -0500
++++ git-2.5.0/connect.c	2015-12-11 12:46:48.967637661 -0500
+@@ -9,6 +9,7 @@
+ #include "url.h"
+ #include "string-list.h"
+ #include "sha1-array.h"
++#include "transport.h"
+ 
+ static char *server_capabilities;
+ static const char *parse_feature_value(const char *, const char *, int *);
+@@ -694,6 +695,8 @@
+ 		else
+ 			target_host = xstrdup(hostandport);
+ 
++		transport_check_allowed("git");
++
+ 		/* These underlying connection commands die() if they
+ 		 * cannot connect.
+ 		 */
+@@ -727,6 +730,7 @@
+ 			int putty, tortoiseplink = 0;
+ 			char *ssh_host = hostandport;
+ 			const char *port = NULL;
++			transport_check_allowed("ssh");
+ 			get_host_and_port(&ssh_host, &port);
+ 
+ 			if (!port)
+@@ -781,6 +785,7 @@
+ 			/* remove repo-local variables from the environment */
+ 			conn->env = local_repo_env;
+ 			conn->use_shell = 1;
++			transport_check_allowed("file");
+ 		}
+ 		argv_array_push(&conn->args, cmd.buf);
+ 
+Index: git-2.5.0/t/lib-proto-disable.sh
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git-2.5.0/t/lib-proto-disable.sh	2015-12-11 12:46:48.967637661 -0500
+@@ -0,0 +1,96 @@
++# Test routines for checking protocol disabling.
++
++# test cloning a particular protocol
++#   $1 - description of the protocol
++#   $2 - machine-readable name of the protocol
++#   $3 - the URL to try cloning
++test_proto () {
++	desc=$1
++	proto=$2
++	url=$3
++
++	test_expect_success "clone $1 (enabled)" '
++		rm -rf tmp.git &&
++		(
++			GIT_ALLOW_PROTOCOL=$proto &&
++			export GIT_ALLOW_PROTOCOL &&
++			git clone --bare "$url" tmp.git
++		)
++	'
++
++	test_expect_success "fetch $1 (enabled)" '
++		(
++			cd tmp.git &&
++			GIT_ALLOW_PROTOCOL=$proto &&
++			export GIT_ALLOW_PROTOCOL &&
++			git fetch
++		)
++	'
++
++	test_expect_success "push $1 (enabled)" '
++		(
++			cd tmp.git &&
++			GIT_ALLOW_PROTOCOL=$proto &&
++			export GIT_ALLOW_PROTOCOL &&
++			git push origin HEAD:pushed
++		)
++	'
++
++	test_expect_success "push $1 (disabled)" '
++		(
++			cd tmp.git &&
++			GIT_ALLOW_PROTOCOL=none &&
++			export GIT_ALLOW_PROTOCOL &&
++			test_must_fail git push origin HEAD:pushed
++		)
++	'
++
++	test_expect_success "fetch $1 (disabled)" '
++		(
++			cd tmp.git &&
++			GIT_ALLOW_PROTOCOL=none &&
++			export GIT_ALLOW_PROTOCOL &&
++			test_must_fail git fetch
++		)
++	'
++
++	test_expect_success "clone $1 (disabled)" '
++		rm -rf tmp.git &&
++		(
++			GIT_ALLOW_PROTOCOL=none &&
++			export GIT_ALLOW_PROTOCOL &&
++			test_must_fail git clone --bare "$url" tmp.git
++		)
++	'
++}
++
++# set up an ssh wrapper that will access $host/$repo in the
++# trash directory, and enable it for subsequent tests.
++setup_ssh_wrapper () {
++	test_expect_success 'setup ssh wrapper' '
++		write_script ssh-wrapper <<-\EOF &&
++		echo >&2 "ssh: $*"
++		host=$1; shift
++		cd "$TRASH_DIRECTORY/$host" &&
++		eval "$*"
++		EOF
++		GIT_SSH="$PWD/ssh-wrapper" &&
++		export GIT_SSH &&
++		export TRASH_DIRECTORY
++	'
++}
++
++# set up a wrapper that can be used with remote-ext to
++# access repositories in the "remote" directory of trash-dir,
++# like "ext::fake-remote %S repo.git"
++setup_ext_wrapper () {
++	test_expect_success 'setup ext wrapper' '
++		write_script fake-remote <<-\EOF &&
++		echo >&2 "fake-remote: $*"
++		cd "$TRASH_DIRECTORY/remote" &&
++		eval "$*"
++		EOF
++		PATH=$TRASH_DIRECTORY:$PATH &&
++		export TRASH_DIRECTORY
++	'
++}
+Index: git-2.5.0/t/t5810-proto-disable-local.sh
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git-2.5.0/t/t5810-proto-disable-local.sh	2015-12-11 12:46:48.967637661 -0500
+@@ -0,0 +1,14 @@
++#!/bin/sh
++
++test_description='test disabling of local paths in clone/fetch'
++. ./test-lib.sh
++. "$TEST_DIRECTORY/lib-proto-disable.sh"
++
++test_expect_success 'setup repository to clone' '
++	test_commit one
++'
++
++test_proto "file://" file "file://$PWD"
++test_proto "path" file .
++
++test_done
+Index: git-2.5.0/t/t5811-proto-disable-git.sh
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git-2.5.0/t/t5811-proto-disable-git.sh	2015-12-11 12:46:48.967637661 -0500
+@@ -0,0 +1,20 @@
++#!/bin/sh
++
++test_description='test disabling of git-over-tcp in clone/fetch'
++. ./test-lib.sh
++. "$TEST_DIRECTORY/lib-proto-disable.sh"
++. "$TEST_DIRECTORY/lib-git-daemon.sh"
++start_git_daemon
++
++test_expect_success 'create git-accessible repo' '
++	bare="$GIT_DAEMON_DOCUMENT_ROOT_PATH/repo.git" &&
++	test_commit one &&
++	git --bare init "$bare" &&
++	git push "$bare" HEAD &&
++	>"$bare/git-daemon-export-ok" &&
++	git -C "$bare" config daemon.receivepack true
++'
++
++test_proto "git://" git "$GIT_DAEMON_URL/repo.git"
++
++test_done
+Index: git-2.5.0/t/t5812-proto-disable-http.sh
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git-2.5.0/t/t5812-proto-disable-http.sh	2015-12-11 12:46:48.967637661 -0500
+@@ -0,0 +1,20 @@
++#!/bin/sh
++
++test_description='test disabling of git-over-http in clone/fetch'
++. ./test-lib.sh
++. "$TEST_DIRECTORY/lib-proto-disable.sh"
++. "$TEST_DIRECTORY/lib-httpd.sh"
++start_httpd
++
++test_expect_success 'create git-accessible repo' '
++	bare="$HTTPD_DOCUMENT_ROOT_PATH/repo.git" &&
++	test_commit one &&
++	git --bare init "$bare" &&
++	git push "$bare" HEAD &&
++	git -C "$bare" config http.receivepack true
++'
++
++test_proto "smart http" http "$HTTPD_URL/smart/repo.git"
++
++stop_httpd
++test_done
+Index: git-2.5.0/t/t5813-proto-disable-ssh.sh
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git-2.5.0/t/t5813-proto-disable-ssh.sh	2015-12-11 12:46:48.967637661 -0500
+@@ -0,0 +1,20 @@
++#!/bin/sh
++
++test_description='test disabling of git-over-ssh in clone/fetch'
++. ./test-lib.sh
++. "$TEST_DIRECTORY/lib-proto-disable.sh"
++
++setup_ssh_wrapper
++
++test_expect_success 'setup repository to clone' '
++	test_commit one &&
++	mkdir remote &&
++	git init --bare remote/repo.git &&
++	git push remote/repo.git HEAD
++'
++
++test_proto "host:path" ssh "remote:repo.git"
++test_proto "ssh://" ssh "ssh://remote/$PWD/remote/repo.git"
++test_proto "git+ssh://" ssh "git+ssh://remote/$PWD/remote/repo.git"
++
++test_done
+Index: git-2.5.0/t/t5814-proto-disable-ext.sh
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git-2.5.0/t/t5814-proto-disable-ext.sh	2015-12-11 12:46:48.967637661 -0500
+@@ -0,0 +1,18 @@
++#!/bin/sh
++
++test_description='test disabling of remote-helper paths in clone/fetch'
++. ./test-lib.sh
++. "$TEST_DIRECTORY/lib-proto-disable.sh"
++
++setup_ext_wrapper
++
++test_expect_success 'setup repository to clone' '
++	test_commit one &&
++	mkdir remote &&
++	git init --bare remote/repo.git &&
++	git push remote/repo.git HEAD
++'
++
++test_proto "remote-helper" ext "ext::fake-remote %S repo.git"
++
++test_done
+Index: git-2.5.0/transport-helper.c
+===================================================================
+--- git-2.5.0.orig/transport-helper.c	2015-12-11 12:46:48.975637719 -0500
++++ git-2.5.0/transport-helper.c	2015-12-11 12:46:48.967637661 -0500
+@@ -1039,6 +1039,8 @@
+ 	struct helper_data *data = xcalloc(1, sizeof(*data));
+ 	data->name = name;
+ 
++	transport_check_allowed(name);
++
+ 	if (getenv("GIT_TRANSPORT_HELPER_DEBUG"))
+ 		debug = 1;
+ 
+Index: git-2.5.0/transport.c
+===================================================================
+--- git-2.5.0.orig/transport.c	2015-12-11 12:46:48.975637719 -0500
++++ git-2.5.0/transport.c	2015-12-11 12:46:48.967637661 -0500
+@@ -912,6 +912,20 @@
+ 	return strchr(url, ':') - url;
+ }
+ 
++void transport_check_allowed(const char *type)
++{
++	struct string_list allowed = STRING_LIST_INIT_DUP;
++	const char *v = getenv("GIT_ALLOW_PROTOCOL");
++
++	if (!v)
++		return;
++
++	string_list_split(&allowed, v, ':', -1);
++	if (!unsorted_string_list_has_string(&allowed, type))
++		die("transport '%s' not allowed", type);
++	string_list_clear(&allowed, 0);
++}
++
+ struct transport *transport_get(struct remote *remote, const char *url)
+ {
+ 	const char *helper;
+@@ -943,12 +957,14 @@
+ 	if (helper) {
+ 		transport_helper_init(ret, helper);
+ 	} else if (starts_with(url, "rsync:")) {
++		transport_check_allowed("rsync");
+ 		ret->get_refs_list = get_refs_via_rsync;
+ 		ret->fetch = fetch_objs_via_rsync;
+ 		ret->push = rsync_transport_push;
+ 		ret->smart_options = NULL;
+ 	} else if (url_is_local_not_ssh(url) && is_file(url) && is_bundle(url, 1)) {
+ 		struct bundle_transport_data *data = xcalloc(1, sizeof(*data));
++		transport_check_allowed("file");
+ 		ret->data = data;
+ 		ret->get_refs_list = get_refs_from_bundle;
+ 		ret->fetch = fetch_refs_from_bundle;
+@@ -960,7 +976,10 @@
+ 		|| starts_with(url, "ssh://")
+ 		|| starts_with(url, "git+ssh://")
+ 		|| starts_with(url, "ssh+git://")) {
+-		/* These are builtin smart transports. */
++		/*
++		 * These are builtin smart transports; "allowed" transports
++		 * will be checked individually in git_connect.
++		 */
+ 		struct git_transport_data *data = xcalloc(1, sizeof(*data));
+ 		ret->data = data;
+ 		ret->set_option = NULL;
+Index: git-2.5.0/transport.h
+===================================================================
+--- git-2.5.0.orig/transport.h	2015-12-11 12:46:48.975637719 -0500
++++ git-2.5.0/transport.h	2015-12-11 12:46:48.971637690 -0500
+@@ -133,6 +133,13 @@
+ /* Returns a transport suitable for the url */
+ struct transport *transport_get(struct remote *, const char *);
+ 
++/*
++ * Check whether a transport is allowed by the environment,
++ * and die otherwise. type should generally be the URL scheme,
++ * as described in Documentation/git.txt
++ */
++void transport_check_allowed(const char *type);
++
+ /* Transport options which apply to git:// and scp-style URLs */
+ 
+ /* The program to use on the remote side to send a pack */
diff --git a/meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015-7545-2.patch b/meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015-7545-2.patch
new file mode 100644
index 0000000..8000e26
--- /dev/null
+++ b/meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015-7545-2.patch
@@ -0,0 +1,112 @@
+From 33cfccbbf35a56e190b79bdec5c85457c952a021 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Wed, 16 Sep 2015 13:13:12 -0400
+Subject: [PATCH] submodule: allow only certain protocols for submodule fetches
+
+Some protocols (like git-remote-ext) can execute arbitrary
+code found in the URL. The URLs that submodules use may come
+from arbitrary sources (e.g., .gitmodules files in a remote
+repository). Let's restrict submodules to fetching from a
+known-good subset of protocols.
+
+Note that we apply this restriction to all submodule
+commands, whether the URL comes from .gitmodules or not.
+This is more restrictive than we need to be; for example, in
+the tests we run:
+
+  git submodule add ext::...
+
+which should be trusted, as the URL comes directly from the
+command line provided by the user. But doing it this way is
+simpler, and makes it much less likely that we would miss a
+case. And since such protocols should be an exception
+(especially because nobody who clones from them will be able
+to update the submodules!), it's not likely to inconvenience
+anyone in practice.
+
+Reported-by: Blake Burkhart <bburky@bburky.com>
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport
+
+http://archive.ubuntu.com/ubuntu/pool/main/g/git/git_2.5.0-1ubuntu0.1.debian.tar.xz
+
+CVE: CVE-2015-7545 #2
+Singed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ git-submodule.sh            |  9 +++++++++
+ t/t5815-submodule-protos.sh | 43 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 52 insertions(+)
+ create mode 100755 t/t5815-submodule-protos.sh
+
+diff --git a/git-submodule.sh b/git-submodule.sh
+index 36797c3..78c2740 100755
+--- a/git-submodule.sh
++++ b/git-submodule.sh
+@@ -22,6 +22,15 @@ require_work_tree
+ wt_prefix=$(git rev-parse --show-prefix)
+ cd_to_toplevel
+ 
++# Restrict ourselves to a vanilla subset of protocols; the URLs
++# we get are under control of a remote repository, and we do not
++# want them kicking off arbitrary git-remote-* programs.
++#
++# If the user has already specified a set of allowed protocols,
++# we assume they know what they're doing and use that instead.
++: ${GIT_ALLOW_PROTOCOL=file:git:http:https:ssh}
++export GIT_ALLOW_PROTOCOL
++
+ command=
+ branch=
+ force=
+diff --git a/t/t5815-submodule-protos.sh b/t/t5815-submodule-protos.sh
+new file mode 100755
+index 0000000..06f55a1
+--- /dev/null
++++ b/t/t5815-submodule-protos.sh
+@@ -0,0 +1,43 @@
++#!/bin/sh
++
++test_description='test protocol whitelisting with submodules'
++. ./test-lib.sh
++. "$TEST_DIRECTORY"/lib-proto-disable.sh
++
++setup_ext_wrapper
++setup_ssh_wrapper
++
++test_expect_success 'setup repository with submodules' '
++	mkdir remote &&
++	git init remote/repo.git &&
++	(cd remote/repo.git && test_commit one) &&
++	# submodule-add should probably trust what we feed it on the cmdline,
++	# but its implementation is overly conservative.
++	GIT_ALLOW_PROTOCOL=ssh git submodule add remote:repo.git ssh-module &&
++	GIT_ALLOW_PROTOCOL=ext git submodule add "ext::fake-remote %S repo.git" ext-module &&
++	git commit -m "add submodules"
++'
++
++test_expect_success 'clone with recurse-submodules fails' '
++	test_must_fail git clone --recurse-submodules . dst
++'
++
++test_expect_success 'setup individual updates' '
++	rm -rf dst &&
++	git clone . dst &&
++	git -C dst submodule init
++'
++
++test_expect_success 'update of ssh allowed' '
++	git -C dst submodule update ssh-module
++'
++
++test_expect_success 'update of ext not allowed' '
++	test_must_fail git -C dst submodule update ext-module
++'
++
++test_expect_success 'user can override whitelist' '
++	GIT_ALLOW_PROTOCOL=ext git -C dst submodule update ext-module
++'
++
++test_done
diff --git a/meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015-7545-3.patch b/meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015-7545-3.patch
new file mode 100644
index 0000000..b6edc9d
--- /dev/null
+++ b/meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015-7545-3.patch
@@ -0,0 +1,112 @@
+From 5088d3b38775f8ac12d7f77636775b16059b67ef Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Tue, 22 Sep 2015 18:03:49 -0400
+Subject: [PATCH] transport: refactor protocol whitelist code
+
+The current callers only want to die when their transport is
+prohibited. But future callers want to query the mechanism
+without dying.
+
+Let's break out a few query functions, and also save the
+results in a static list so we don't have to re-parse for
+each query.
+
+Based-on-a-patch-by: Blake Burkhart <bburky@bburky.com>
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport
+
+http://archive.ubuntu.com/ubuntu/pool/main/g/git/git_2.5.0-1ubuntu0.1.debian.tar.xz
+
+CVE: CVE-2015-7545 #3
+Singed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ transport.c | 38 ++++++++++++++++++++++++++++++--------
+ transport.h | 15 +++++++++++++--
+ 2 files changed, 43 insertions(+), 10 deletions(-)
+
+Index: git-2.5.0/transport.c
+===================================================================
+--- git-2.5.0.orig/transport.c	2015-12-11 12:47:09.547784038 -0500
++++ git-2.5.0/transport.c	2015-12-11 12:47:09.543784009 -0500
+@@ -912,18 +912,40 @@
+ 	return strchr(url, ':') - url;
+ }
+ 
+-void transport_check_allowed(const char *type)
++static const struct string_list *protocol_whitelist(void)
+ {
+-	struct string_list allowed = STRING_LIST_INIT_DUP;
+-	const char *v = getenv("GIT_ALLOW_PROTOCOL");
++	static int enabled = -1;
++	static struct string_list allowed = STRING_LIST_INIT_DUP;
++
++	if (enabled < 0) {
++		const char *v = getenv("GIT_ALLOW_PROTOCOL");
++		if (v) {
++			string_list_split(&allowed, v, ':', -1);
++			string_list_sort(&allowed);
++			enabled = 1;
++		} else {
++			enabled = 0;
++		}
++	}
++
++	return enabled ? &allowed : NULL;
++}
+ 
+-	if (!v)
+-		return;
++int is_transport_allowed(const char *type)
++{
++	const struct string_list *allowed = protocol_whitelist();
++	return !allowed || string_list_has_string(allowed, type);
++}
+ 
+-	string_list_split(&allowed, v, ':', -1);
+-	if (!unsorted_string_list_has_string(&allowed, type))
++void transport_check_allowed(const char *type)
++{
++	if (!is_transport_allowed(type))
+ 		die("transport '%s' not allowed", type);
+-	string_list_clear(&allowed, 0);
++}
++
++int transport_restrict_protocols(void)
++{
++	return !!protocol_whitelist();
+ }
+ 
+ struct transport *transport_get(struct remote *remote, const char *url)
+Index: git-2.5.0/transport.h
+===================================================================
+--- git-2.5.0.orig/transport.h	2015-12-11 12:47:09.547784038 -0500
++++ git-2.5.0/transport.h	2015-12-11 12:47:09.543784009 -0500
+@@ -134,12 +134,23 @@
+ struct transport *transport_get(struct remote *, const char *);
+ 
+ /*
++ * Check whether a transport is allowed by the environment. Type should
++ * generally be the URL scheme, as described in Documentation/git.txt
++ */
++int is_transport_allowed(const char *type);
++
++/*
+  * Check whether a transport is allowed by the environment,
+- * and die otherwise. type should generally be the URL scheme,
+- * as described in Documentation/git.txt
++ * and die otherwise.
+  */
+ void transport_check_allowed(const char *type);
+ 
++/*
++ * Returns true if the user has attempted to turn on protocol
++ * restrictions at all.
++ */
++int transport_restrict_protocols(void);
++
+ /* Transport options which apply to git:// and scp-style URLs */
+ 
+ /* The program to use on the remote side to send a pack */
diff --git a/meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015-7545-4.patch b/meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015-7545-4.patch
new file mode 100644
index 0000000..44dcd1e
--- /dev/null
+++ b/meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015-7545-4.patch
@@ -0,0 +1,150 @@
+Backport of:
+
+From f4113cac0c88b4f36ee6f3abf3218034440a68e3 Mon Sep 17 00:00:00 2001
+From: Blake Burkhart <bburky@bburky.com>
+Date: Tue, 22 Sep 2015 18:06:04 -0400
+Subject: [PATCH] http: limit redirection to protocol-whitelist
+
+Previously, libcurl would follow redirection to any protocol
+it was compiled for support with. This is desirable to allow
+redirection from HTTP to HTTPS. However, it would even
+successfully allow redirection from HTTP to SFTP, a protocol
+that git does not otherwise support at all. Furthermore
+git's new protocol-whitelisting could be bypassed by
+following a redirect within the remote helper, as it was
+only enforced at transport selection time.
+
+This patch limits redirects within libcurl to HTTP, HTTPS,
+FTP and FTPS. If there is a protocol-whitelist present, this
+list is limited to those also allowed by the whitelist. As
+redirection happens from within libcurl, it is impossible
+for an HTTP redirect to a protocol implemented within
+another remote helper.
+
+When the curl version git was compiled with is too old to
+support restrictions on protocol redirection, we warn the
+user if GIT_ALLOW_PROTOCOL restrictions were requested. This
+is a little inaccurate, as even without that variable in the
+environment, we would still restrict SFTP, etc, and we do
+not warn in that case. But anything else means we would
+literally warn every time git accesses an http remote.
+
+This commit includes a test, but it is not as robust as we
+would hope. It redirects an http request to ftp, and checks
+that curl complained about the protocol, which means that we
+are relying on curl's specific error message to know what
+happened. Ideally we would redirect to a working ftp server
+and confirm that we can clone without protocol restrictions,
+and not with them. But we do not have a portable way of
+providing an ftp server, nor any other protocol that curl
+supports (https is the closest, but we would have to deal
+with certificates).
+
+[jk: added test and version warning]
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport
+
+http://archive.ubuntu.com/ubuntu/pool/main/g/git/git_2.5.0-1ubuntu0.1.debian.tar.xz
+
+CVE: CVE-2015-7545 #4
+Singed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ Documentation/git.txt         |  5 -----
+ http.c                        | 17 +++++++++++++++++
+ t/lib-httpd/apache.conf       |  1 +
+ t/t5812-proto-disable-http.sh |  9 +++++++++
+ 4 files changed, 27 insertions(+), 5 deletions(-)
+
+Index: git-2.5.0/Documentation/git.txt
+===================================================================
+--- git-2.5.0.orig/Documentation/git.txt	2015-12-11 12:47:18.707849212 -0500
++++ git-2.5.0/Documentation/git.txt	2015-12-11 12:47:18.703849183 -0500
+@@ -1095,11 +1095,6 @@
+ 
+ 	  - any external helpers are named by their protocol (e.g., use
+ 	    `hg` to allow the `git-remote-hg` helper)
+-+
+-Note that this controls only git's internal protocol selection.
+-If libcurl is used (e.g., by the `http` transport), it may
+-redirect to other protocols. There is not currently any way to
+-restrict this.
+ 
+ 
+ Discussion[[Discussion]]
+Index: git-2.5.0/http.c
+===================================================================
+--- git-2.5.0.orig/http.c	2015-12-11 12:47:18.707849212 -0500
++++ git-2.5.0/http.c	2015-12-11 12:47:34.171959268 -0500
+@@ -8,6 +8,7 @@
+ #include "credential.h"
+ #include "version.h"
+ #include "pkt-line.h"
++#include "transport.h"
+ #include "gettext.h"
+ 
+ int active_requests;
+@@ -340,6 +341,7 @@
+ static CURL *get_curl_handle(void)
+ {
+ 	CURL *result = curl_easy_init();
++	long allowed_protocols = 0;
+ 
+ 	if (!result)
+ 		die("curl_easy_init failed");
+@@ -399,6 +401,21 @@
+ #elif LIBCURL_VERSION_NUM >= 0x071101
+ 	curl_easy_setopt(result, CURLOPT_POST301, 1);
+ #endif
++#if LIBCURL_VERSION_NUM >= 0x071304
++	if (is_transport_allowed("http"))
++		allowed_protocols |= CURLPROTO_HTTP;
++	if (is_transport_allowed("https"))
++		allowed_protocols |= CURLPROTO_HTTPS;
++	if (is_transport_allowed("ftp"))
++		allowed_protocols |= CURLPROTO_FTP;
++	if (is_transport_allowed("ftps"))
++		allowed_protocols |= CURLPROTO_FTPS;
++	curl_easy_setopt(result, CURLOPT_REDIR_PROTOCOLS, allowed_protocols);
++#else
++	if (transport_restrict_protocols())
++		warning("protocol restrictions not applied to curl redirects because\n"
++			"your curl version is too old (>= 7.19.4)");
++#endif
+ 
+ 	if (getenv("GIT_CURL_VERBOSE"))
+ 		curl_easy_setopt(result, CURLOPT_VERBOSE, 1);
+Index: git-2.5.0/t/lib-httpd/apache.conf
+===================================================================
+--- git-2.5.0.orig/t/lib-httpd/apache.conf	2015-12-11 12:47:18.707849212 -0500
++++ git-2.5.0/t/lib-httpd/apache.conf	2015-12-11 12:47:18.703849183 -0500
+@@ -119,6 +119,7 @@
+ RewriteRule ^/smart-redir-temp/(.*)$ /smart/$1 [R=302]
+ RewriteRule ^/smart-redir-auth/(.*)$ /auth/smart/$1 [R=301]
+ RewriteRule ^/smart-redir-limited/(.*)/info/refs$ /smart/$1/info/refs [R=301]
++RewriteRule ^/ftp-redir/(.*)$ ftp://localhost:1000/$1 [R=302]
+ 
+ <IfDefine SSL>
+ LoadModule ssl_module modules/mod_ssl.so
+Index: git-2.5.0/t/t5812-proto-disable-http.sh
+===================================================================
+--- git-2.5.0.orig/t/t5812-proto-disable-http.sh	2015-12-11 12:47:18.707849212 -0500
++++ git-2.5.0/t/t5812-proto-disable-http.sh	2015-12-11 12:47:18.703849183 -0500
+@@ -16,5 +16,14 @@
+ 
+ test_proto "smart http" http "$HTTPD_URL/smart/repo.git"
+ 
++test_expect_success 'curl redirects respect whitelist' '
++	test_must_fail env GIT_ALLOW_PROTOCOL=http:https \
++		git clone "$HTTPD_URL/ftp-redir/repo.git" 2>stderr &&
++	{
++		test_i18ngrep "ftp.*disabled" stderr ||
++		test_i18ngrep "your curl version is too old"
++	}
++'
++
+ stop_httpd
+ test_done
diff --git a/meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015-7545-5.patch b/meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015-7545-5.patch
new file mode 100644
index 0000000..76d66ba
--- /dev/null
+++ b/meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015-7545-5.patch
@@ -0,0 +1,69 @@
+From b258116462399b318c86165c61a5c7123043cfd4 Mon Sep 17 00:00:00 2001
+From: Blake Burkhart <bburky@bburky.com>
+Date: Tue, 22 Sep 2015 18:06:20 -0400
+Subject: [PATCH] http: limit redirection depth
+
+By default, libcurl will follow circular http redirects
+forever. Let's put a cap on this so that somebody who can
+trigger an automated fetch of an arbitrary repository (e.g.,
+for CI) cannot convince git to loop infinitely.
+
+The value chosen is 20, which is the same default that
+Firefox uses.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport
+
+http://archive.ubuntu.com/ubuntu/pool/main/g/git/git_2.5.0-1ubuntu0.1.debian.tar.xz
+
+CVE: CVE-2015-7545 #5
+Singed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ http.c                        | 1 +
+ t/lib-httpd/apache.conf       | 3 +++
+ t/t5812-proto-disable-http.sh | 4 ++++
+ 3 files changed, 8 insertions(+)
+
+Index: git-2.5.0/http.c
+===================================================================
+--- git-2.5.0.orig/http.c	2015-12-11 12:48:02.900163824 -0500
++++ git-2.5.0/http.c	2015-12-11 12:48:02.896163796 -0500
+@@ -396,6 +396,7 @@
+ 	}
+ 
+ 	curl_easy_setopt(result, CURLOPT_FOLLOWLOCATION, 1);
++	curl_easy_setopt(result, CURLOPT_MAXREDIRS, 20);
+ #if LIBCURL_VERSION_NUM >= 0x071301
+ 	curl_easy_setopt(result, CURLOPT_POSTREDIR, CURL_REDIR_POST_ALL);
+ #elif LIBCURL_VERSION_NUM >= 0x071101
+Index: git-2.5.0/t/lib-httpd/apache.conf
+===================================================================
+--- git-2.5.0.orig/t/lib-httpd/apache.conf	2015-12-11 12:48:02.900163824 -0500
++++ git-2.5.0/t/lib-httpd/apache.conf	2015-12-11 12:48:02.896163796 -0500
+@@ -121,6 +121,9 @@
+ RewriteRule ^/smart-redir-limited/(.*)/info/refs$ /smart/$1/info/refs [R=301]
+ RewriteRule ^/ftp-redir/(.*)$ ftp://localhost:1000/$1 [R=302]
+ 
++RewriteRule ^/loop-redir/x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-(.*) /$1 [R=302]
++RewriteRule ^/loop-redir/(.*)$ /loop-redir/x-$1 [R=302]
++
+ <IfDefine SSL>
+ LoadModule ssl_module modules/mod_ssl.so
+ 
+Index: git-2.5.0/t/t5812-proto-disable-http.sh
+===================================================================
+--- git-2.5.0.orig/t/t5812-proto-disable-http.sh	2015-12-11 12:48:02.900163824 -0500
++++ git-2.5.0/t/t5812-proto-disable-http.sh	2015-12-11 12:48:02.896163796 -0500
+@@ -25,5 +25,9 @@
+ 	}
+ '
+ 
++test_expect_success 'curl limits redirects' '
++	test_must_fail git clone "$HTTPD_URL/loop-redir/smart/repo.git"
++'
++
+ stop_httpd
+ test_done
diff --git a/meta/recipes-devtools/git/git_2.5.0.bb b/meta/recipes-devtools/git/git_2.5.0.bb
index de686c2..792f258 100644
--- a/meta/recipes-devtools/git/git_2.5.0.bb
+++ b/meta/recipes-devtools/git/git_2.5.0.bb
@@ -9,3 +9,11 @@ SRC_URI[tarball.md5sum] = "3bc9b0a803ae8ec6c5316cc64f0b7f78"
 SRC_URI[tarball.sha256sum] = "8fa13ba8434ff83d24f57f831d55dbb9046434c266641180a37744facfce72ac"
 SRC_URI[manpages.md5sum] = "134b049e51420a336049aac21c88a75a"
 SRC_URI[manpages.sha256sum] = "745e4e797fe5061e781c880d370b1beb480199127da5acaf4e376e0b09d4d685"
+
+SRC_URI += "\
+    file://0008-CVE-2015-7545-1.patch \
+    file://0009-CVE-2015-7545-2.patch \
+    file://0010-CVE-2015-7545-3.patch \
+    file://0011-CVE-2015-7545-4.patch \
+    file://0012-CVE-2015-7545-5.patch \
+    "
-- 
2.3.5


