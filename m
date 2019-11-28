Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
	[209.85.221.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3EE7F628
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 11:27:06 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id l5so6327002vkb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 03:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yqD+8iRCzoYeVBAlJoEcmxnu579c8B2gFrzounq14MU=;
	b=glLKlNaHREzZbXnQ3+2DnMD/1hJXA6qHl+56zVsgdFkuUQA296CKkwNTiSdZGbCQaa
	AWZuTt7lY7+Y9H2jb+nL9nM3KdWRzefgQV3PwMgKDgzzZVw29JgJ5ao3mGiE3hcsrp6M
	ZbEkkqvj/UC8AZBQYvNO/yxRNxy2hSRdmx8rJQyY/v2jX4suofTytkqcJDaG0FsxR8wc
	8WTa6pBxa9lcl9ailvdcEzkNbHt7b8zE0Aky4qml8rcpFQQxOOrPaQwSand5RcGWumkr
	7ZmsimCTGd6X3vgqLbR38pJpwSK1vcHH0g33H3Bn8WR9A/10HsLMn1AIkLGqFK4roCRx
	gwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yqD+8iRCzoYeVBAlJoEcmxnu579c8B2gFrzounq14MU=;
	b=UOSeUJpPXA4dxpca+SkXzFHZnEyR70UBreGMUQ64Uda4ggGmTVJBSZHBhEH07VpPjX
	bzBxC8xGZpuKctGraHrByPjY8AhQTBGRcbvFUgkgC+RRzVGsSW3Tko0d6DmxxtWic/FL
	0OrfUDAE91f6Y4n6yhi8QjxsPo1sjq8mxqNWaSMXbYBBVGWkNSvXswFXQfbwf55Ahuup
	0jDcCJS6FJdip6oO1cjupWWjnvb3lyAPYeZDXf660oqQrZIZ5li/aDZJzk/ELuCJhDWD
	7EVIbo+ld+MyQ2b+PnqchRg9nEklgqbL2tFakM0qSliNcVDFo64cdAyqwzLcbgXMRnz6
	sclA==
X-Gm-Message-State: APjAAAV9gFZuW7huA4f30jsPT05gkA+0ZJZM0V29ScoQ0lpIWB+bBP/1
	KMXVCPO//A2Ug3RljFUGDKSfg7QlA27gUZNcvyA=
X-Google-Smtp-Source: APXvYqyQYBjzoFGMDE8ufyoowshfjW277Rp2MN86n1VgPZ/dI/aXd9X+x3PkPzIB5pBJoFE2X/cxuc38rrZYYyOJ9iE=
X-Received: by 2002:a1f:4942:: with SMTP id w63mr5833810vka.49.1574940426039; 
	Thu, 28 Nov 2019 03:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-12-alex.kanavin@gmail.com>
	<9c4ea9ce-515b-b54f-74ca-6ba36279792f@gmail.com>
In-Reply-To: <9c4ea9ce-515b-b54f-74ca-6ba36279792f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Nov 2019 12:26:54 +0100
Message-ID: <CANNYZj9TG+ffQ_jKh18+Dtc=3jQ64+tHqDpph3aVRojZWC5+4Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] bind: update 9.11.5-P4 -> 9.11.13
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
X-List-Received-Date: Thu, 28 Nov 2019 11:27:06 -0000
Content-Type: multipart/alternative; boundary="000000000000a2f74805986664f3"

--000000000000a2f74805986664f3
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2019 at 21:25, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 11/27/19 8:40 AM, Alexander Kanavin wrote:
> > Drop backports.
> >
> > Drop 0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch and
> > 0001-lib-dns-gen.c-fix-too-long-error.patch as problem is fixed
>
> Bug fix only?
>

I don't think so, there are some new features as well:
https://downloads.isc.org/isc/bind9/9.11.13/RELEASE-NOTES-bind-9.11.13.html

Alex




> -armin
> > upstream.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../bind/0001-bind-fix-CVE-2019-6471.patch    |  64 --
> >  ....in-remove-useless-L-use_openssl-lib.patch |  18 +-
> >  ...01-fix-enforcement-of-tcp-clients-v1.patch |  60 --
> >  ...c-extend-DIRNAMESIZE-from-256-to-512.patch |  22 -
> >  ...001-lib-dns-gen.c-fix-too-long-error.patch |  31 -
> >  ...p-clients-could-still-be-exceeded-v2.patch | 670 -------------
> >  ...rence-counter-for-pipeline-groups-v3.patch | 278 ------
> >  ...accounting-and-client-mortality-chec.patch | 512 ----------
> >  ...a-and-pipeline-refs-allow-special-ca.patch | 911 ------------------
> >  ...allowance-for-tcp-clients-interfaces.patch |  80 --
> >  ...perations-in-bin-named-client.c-with.patch | 140 ---
> >  ...ching-for-json-headers-searches-sysr.patch |  15 +-
> >  .../{bind_9.11.5-P4.bb => bind_9.11.13.bb}    |  18 +-
> >  13 files changed, 20 insertions(+), 2799 deletions(-)
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
> >  delete mode 100644
> meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
> >  rename meta/recipes-connectivity/bind/{bind_9.11.5-P4.bb =>
> bind_9.11.13.bb} (86%)
> >
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
> b/meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
> > deleted file mode 100644
> > index 2fed99e1bba..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -Backport patch to fix CVE-2019-6471.
> > -
> > -Ref:
> > -https://security-tracker.debian.org/tracker/CVE-2019-6471
> > -
> > -CVE: CVE-2019-6471
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/3a9c7bb]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From 3a9c7bb80d4a609b86427406d9dd783199920b5b Mon Sep 17 00:00:00 2001
> > -From: Mark Andrews <marka@isc.org>
> > -Date: Tue, 19 Mar 2019 14:14:21 +1100
> > -Subject: [PATCH] move item_out test inside lock in
> dns_dispatch_getnext()
> > -
> > -(cherry picked from commit 60c42f849d520564ed42e5ed0ba46b4b69c07712)
> > ----
> > - lib/dns/dispatch.c | 12 ++++++++----
> > - 1 file changed, 8 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/lib/dns/dispatch.c b/lib/dns/dispatch.c
> > -index 408beda367..3278db4a07 100644
> > ---- a/lib/dns/dispatch.c
> > -+++ b/lib/dns/dispatch.c
> > -@@ -134,7 +134,7 @@ struct dns_dispentry {
> > -     isc_task_t                     *task;
> > -     isc_taskaction_t                action;
> > -     void                           *arg;
> > --    bool                    item_out;
> > -+    bool                            item_out;
> > -     dispsocket_t                    *dispsocket;
> > -     ISC_LIST(dns_dispatchevent_t)   items;
> > -     ISC_LINK(dns_dispentry_t)       link;
> > -@@ -3422,13 +3422,14 @@ dns_dispatch_getnext(dns_dispentry_t *resp,
> dns_dispatchevent_t **sockevent) {
> > -     disp = resp->disp;
> > -     REQUIRE(VALID_DISPATCH(disp));
> > -
> > --    REQUIRE(resp->item_out == true);
> > --    resp->item_out = false;
> > --
> > -     ev = *sockevent;
> > -     *sockevent = NULL;
> > -
> > -     LOCK(&disp->lock);
> > -+
> > -+    REQUIRE(resp->item_out == true);
> > -+    resp->item_out = false;
> > -+
> > -     if (ev->buffer.base != NULL)
> > -             free_buffer(disp, ev->buffer.base, ev->buffer.length);
> > -     free_devent(disp, ev);
> > -@@ -3573,6 +3574,9 @@ dns_dispatch_removeresponse(dns_dispentry_t
> **resp,
> > -             isc_task_send(disp->task[0], &disp->ctlevent);
> > - }
> > -
> > -+/*
> > -+ * disp must be locked.
> > -+ */
> > - static void
> > - do_cancel(dns_dispatch_t *disp) {
> > -     dns_dispatchevent_t *ev;
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
> b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
> > index 871bb2a5f6c..9d31b980807 100644
> > ---
> a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
> > +++
> b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
> > @@ -1,4 +1,4 @@
> > -From 950867d9fd3f690e271c8c807b6eed144b2935b2 Mon Sep 17 00:00:00 2001
> > +From 2325a92f1896a2a7f586611686801b41fbc91b50 Mon Sep 17 00:00:00 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Mon, 27 Aug 2018 15:00:51 +0800
> >  Subject: [PATCH] configure.in: remove useless `-L$use_openssl/lib'
> > @@ -10,15 +10,16 @@ and helpful for clean up host build path in
> isc-config.sh
> >  Upstream-Status: Inappropriate [oe-core specific]
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> >  ---
> > - configure.in | 2 +-
> > + configure.ac | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/configure.in b/configure.in
> > -index 54efc55..76ac0eb 100644
> > ---- a/configure.in
> > -+++ b/configure.in
> > -@@ -1691,7 +1691,7 @@ If you don't want OpenSSL, use --without-openssl])
> > +diff --git a/configure.ac b/configure.ac
> > +index e85a5c6..2bbfc58 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -1631,7 +1631,7 @@ If you don't want OpenSSL, use --without-openssl])
> >                               fi
> >                               ;;
> >                       *)
> > @@ -27,6 +28,3 @@ index 54efc55..76ac0eb 100644
> >                               ;;
> >                       esac
> >               fi
> > ---
> > -2.7.4
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
> b/meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
> > deleted file mode 100644
> > index 48ae125f845..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -Backport patch to fix CVE-2018-5743.
> > -
> > -Ref:
> > -https://security-tracker.debian.org/tracker/CVE-2018-5743
> > -
> > -CVE: CVE-2018-5743
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/ec2d50d]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From ec2d50da8d81814640e28593d912f4b96c7efece Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?Witold=20Kr=C4=99cicki?= <wpk@isc.org>
> > -Date: Thu, 3 Jan 2019 14:17:43 +0100
> > -Subject: [PATCH 1/6] fix enforcement of tcp-clients (v1)
> > -
> > -tcp-clients settings could be exceeded in some cases by
> > -creating more and more active TCP clients that are over
> > -the set quota limit, which in the end could lead to a
> > -DoS attack by e.g. exhaustion of file descriptors.
> > -
> > -If TCP client we're closing went over the quota (so it's
> > -not attached to a quota) mark it as mortal - so that it
> > -will be destroyed and not set up to listen for new
> > -connections - unless it's the last client for a specific
> > -interface.
> > -
> > -(cherry picked from commit f97131d21b97381cef72b971b157345c1f9b4115)
> > -(cherry picked from commit 9689ffc485df8f971f0ad81ab8ab1f5389493776)
> > ----
> > - bin/named/client.c | 13 ++++++++++++-
> > - 1 file changed, 12 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/bin/named/client.c b/bin/named/client.c
> > -index d482da7121..0739dd48af 100644
> > ---- a/bin/named/client.c
> > -+++ b/bin/named/client.c
> > -@@ -421,8 +421,19 @@ exit_check(ns_client_t *client) {
> > -                     isc_socket_detach(&client->tcpsocket);
> > -             }
> > -
> > --            if (client->tcpquota != NULL)
> > -+            if (client->tcpquota != NULL) {
> > -                     isc_quota_detach(&client->tcpquota);
> > -+            } else {
> > -+                    /*
> > -+                     * We went over quota with this client, we don't
> > -+                     * want to restart listening unless this is the
> > -+                     * last client on this interface, which is
> > -+                     * checked later.
> > -+                     */
> > -+                    if (TCP_CLIENT(client)) {
> > -+                            client->mortal = true;
> > -+                    }
> > -+            }
> > -
> > -             if (client->timerset) {
> > -                     (void)isc_timer_reset(client->timer,
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
> b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
> > deleted file mode 100644
> > index a8d601dcaa7..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -Upstream-Status: Pending
> > -
> > -Subject: gen.c: extend DIRNAMESIZE from 256 to 512
> > -
> > -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ----
> > - lib/dns/gen.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -Index: bind-9.11.3/lib/dns/gen.c
> > -===================================================================
> > ---- bind-9.11.3.orig/lib/dns/gen.c
> > -+++ bind-9.11.3/lib/dns/gen.c
> > -@@ -130,7 +130,7 @@ static const char copyright[] =
> > - #define TYPECLASSBUF (TYPECLASSLEN + 1)
> > - #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
> > - #define ATTRIBUTESIZE 256
> > --#define DIRNAMESIZE 256
> > -+#define DIRNAMESIZE 512
> > -
> > - static struct cc {
> > -     struct cc *next;
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
> b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
> > deleted file mode 100644
> > index 01874a44076..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From 5bc3167a8b714ec0c4a3f1c7f3b9411296ec0a23 Mon Sep 17 00:00:00 2001
> > -From: Robert Yang <liezhi.yang@windriver.com>
> > -Date: Wed, 16 Sep 2015 20:23:47 -0700
> > -Subject: [PATCH] lib/dns/gen.c: fix too long error
> > -
> > -The 512 is a little short when build in deep dir, and cause "too long"
> > -error, use PATH_MAX if defined.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ----
> > - lib/dns/gen.c |    4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -Index: bind-9.11.3/lib/dns/gen.c
> > -===================================================================
> > ---- bind-9.11.3.orig/lib/dns/gen.c
> > -+++ bind-9.11.3/lib/dns/gen.c
> > -@@ -130,7 +130,11 @@ static const char copyright[] =
> > - #define TYPECLASSBUF (TYPECLASSLEN + 1)
> > - #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
> > - #define ATTRIBUTESIZE 256
> > -+#ifdef PATH_MAX
> > -+#define DIRNAMESIZE PATH_MAX
> > -+#else
> > - #define DIRNAMESIZE 512
> > -+#endif
> > -
> > - static struct cc {
> > -     struct cc *next;
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
> b/meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
> > deleted file mode 100644
> > index ca4e8b1a662..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
> > +++ /dev/null
> > @@ -1,670 +0,0 @@
> > -Backport patch to fix CVE-2018-5743.
> > -
> > -Ref:
> > -https://security-tracker.debian.org/tracker/CVE-2018-5743
> > -
> > -CVE: CVE-2018-5743
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/719f604]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From 719f604e3fad5b7479bd14e2fa0ef4413f0a8fdc Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?Witold=20Kr=C4=99cicki?= <wpk@isc.org>
> > -Date: Fri, 4 Jan 2019 12:50:51 +0100
> > -Subject: [PATCH 2/6] tcp-clients could still be exceeded (v2)
> > -
> > -the TCP client quota could still be ineffective under some
> > -circumstances.  this change:
> > -
> > -- improves quota accounting to ensure that TCP clients are
> > -  properly limited, while still guaranteeing that at least one client
> > -  is always available to serve TCP connections on each interface.
> > -- uses more descriptive names and removes one (ntcptarget) that
> > -  was no longer needed
> > -- adds comments
> > -
> > -(cherry picked from commit 924651f1d5e605cd186d03f4f7340bcc54d77cc2)
> > -(cherry picked from commit 55a7a458e30e47874d34bdf1079eb863a0512396)
> > ----
> > - bin/named/client.c                     | 311 ++++++++++++++++++++-----
> > - bin/named/include/named/client.h       |  14 +-
> > - bin/named/include/named/interfacemgr.h |  11 +-
> > - bin/named/interfacemgr.c               |   8 +-
> > - 4 files changed, 267 insertions(+), 77 deletions(-)
> > -
> > -diff --git a/bin/named/client.c b/bin/named/client.c
> > -index 0739dd48af..a7b49a0f71 100644
> > ---- a/bin/named/client.c
> > -+++ b/bin/named/client.c
> > -@@ -246,10 +246,11 @@ static void ns_client_dumpmessage(ns_client_t
> *client, const char *reason);
> > - static isc_result_t get_client(ns_clientmgr_t *manager, ns_interface_t
> *ifp,
> > -                            dns_dispatch_t *disp, bool tcp);
> > - static isc_result_t get_worker(ns_clientmgr_t *manager, ns_interface_t
> *ifp,
> > --                           isc_socket_t *sock);
> > -+                           isc_socket_t *sock, ns_client_t *oldclient);
> > - static inline bool
> > --allowed(isc_netaddr_t *addr, dns_name_t *signer, isc_netaddr_t
> *ecs_addr,
> > --    uint8_t ecs_addrlen, uint8_t *ecs_scope, dns_acl_t *acl);
> > -+allowed(isc_netaddr_t *addr, dns_name_t *signer,
> > -+    isc_netaddr_t *ecs_addr, uint8_t ecs_addrlen,
> > -+    uint8_t *ecs_scope, dns_acl_t *acl)
> > - static void compute_cookie(ns_client_t *client, uint32_t when,
> > -                        uint32_t nonce, const unsigned char *secret,
> > -                        isc_buffer_t *buf);
> > -@@ -405,8 +406,11 @@ exit_check(ns_client_t *client) {
> > -              */
> > -             INSIST(client->recursionquota == NULL);
> > -             INSIST(client->newstate <= NS_CLIENTSTATE_READY);
> > --            if (client->nreads > 0)
> > -+
> > -+            if (client->nreads > 0) {
> > -                     dns_tcpmsg_cancelread(&client->tcpmsg);
> > -+            }
> > -+
> > -             if (client->nreads != 0) {
> > -                     /* Still waiting for read cancel completion. */
> > -                     return (true);
> > -@@ -416,25 +420,58 @@ exit_check(ns_client_t *client) {
> > -                     dns_tcpmsg_invalidate(&client->tcpmsg);
> > -                     client->tcpmsg_valid = false;
> > -             }
> > -+
> > -             if (client->tcpsocket != NULL) {
> > -                     CTRACE("closetcp");
> > -                     isc_socket_detach(&client->tcpsocket);
> > -+
> > -+                    if (client->tcpactive) {
> > -+                            LOCK(&client->interface->lock);
> > -+                            INSIST(client->interface->ntcpactive > 0);
> > -+                            client->interface->ntcpactive--;
> > -+                            UNLOCK(&client->interface->lock);
> > -+                            client->tcpactive = false;
> > -+                    }
> > -             }
> > -
> > -             if (client->tcpquota != NULL) {
> > --                    isc_quota_detach(&client->tcpquota);
> > --            } else {
> > -                     /*
> > --                     * We went over quota with this client, we don't
> > --                     * want to restart listening unless this is the
> > --                     * last client on this interface, which is
> > --                     * checked later.
> > -+                     * If we are not in a pipeline group, or
> > -+                     * we are the last client in the group, detach from
> > -+                     * tcpquota; otherwise, transfer the quota to
> > -+                     * another client in the same group.
> > -                      */
> > --                    if (TCP_CLIENT(client)) {
> > --                            client->mortal = true;
> > -+                    if (!ISC_LINK_LINKED(client, glink) ||
> > -+                        (client->glink.next == NULL &&
> > -+                         client->glink.prev == NULL))
> > -+                    {
> > -+                            isc_quota_detach(&client->tcpquota);
> > -+                    } else if (client->glink.next != NULL) {
> > -+                            INSIST(client->glink.next->tcpquota ==
> NULL);
> > -+                            client->glink.next->tcpquota =
> client->tcpquota;
> > -+                            client->tcpquota = NULL;
> > -+                    } else {
> > -+                            INSIST(client->glink.prev->tcpquota ==
> NULL);
> > -+                            client->glink.prev->tcpquota =
> client->tcpquota;
> > -+                            client->tcpquota = NULL;
> > -                     }
> > -             }
> > -
> > -+            /*
> > -+             * Unlink from pipeline group.
> > -+             */
> > -+            if (ISC_LINK_LINKED(client, glink)) {
> > -+                    if (client->glink.next != NULL) {
> > -+                            client->glink.next->glink.prev =
> > -+                                    client->glink.prev;
> > -+                    }
> > -+                    if (client->glink.prev != NULL) {
> > -+                            client->glink.prev->glink.next =
> > -+                                    client->glink.next;
> > -+                    }
> > -+                    ISC_LINK_INIT(client, glink);
> > -+            }
> > -+
> > -             if (client->timerset) {
> > -                     (void)isc_timer_reset(client->timer,
> > -                                           isc_timertype_inactive,
> > -@@ -455,15 +492,16 @@ exit_check(ns_client_t *client) {
> > -              * that already.  Check whether this client needs to remain
> > -              * active and force it to go inactive if not.
> > -              *
> > --             * UDP clients go inactive at this point, but TCP clients
> > --             * may remain active if we have fewer active TCP client
> > --             * objects than desired due to an earlier quota exhaustion.
> > -+             * UDP clients go inactive at this point, but a TCP client
> > -+             * will needs to remain active if no other clients are
> > -+             * listening for TCP requests on this interface, to
> > -+             * prevent this interface from going nonresponsive.
> > -              */
> > -             if (client->mortal && TCP_CLIENT(client) &&
> !ns_g_clienttest) {
> > -                     LOCK(&client->interface->lock);
> > --                    if (client->interface->ntcpcurrent <
> > --                                client->interface->ntcptarget)
> > -+                    if (client->interface->ntcpaccepting == 0) {
> > -                             client->mortal = false;
> > -+                    }
> > -                     UNLOCK(&client->interface->lock);
> > -             }
> > -
> > -@@ -472,15 +510,17 @@ exit_check(ns_client_t *client) {
> > -              * queue for recycling.
> > -              */
> > -             if (client->mortal) {
> > --                    if (client->newstate > NS_CLIENTSTATE_INACTIVE)
> > -+                    if (client->newstate > NS_CLIENTSTATE_INACTIVE) {
> > -                             client->newstate = NS_CLIENTSTATE_INACTIVE;
> > -+                    }
> > -             }
> > -
> > -             if (NS_CLIENTSTATE_READY == client->newstate) {
> > -                     if (TCP_CLIENT(client)) {
> > -                             client_accept(client);
> > --                    } else
> > -+                    } else {
> > -                             client_udprecv(client);
> > -+                    }
> > -                     client->newstate = NS_CLIENTSTATE_MAX;
> > -                     return (true);
> > -             }
> > -@@ -492,41 +532,57 @@ exit_check(ns_client_t *client) {
> > -             /*
> > -              * We are trying to enter the inactive state.
> > -              */
> > --            if (client->naccepts > 0)
> > -+            if (client->naccepts > 0) {
> > -                     isc_socket_cancel(client->tcplistener,
> client->task,
> > -                                       ISC_SOCKCANCEL_ACCEPT);
> > -+            }
> > -
> > -             /* Still waiting for accept cancel completion. */
> > --            if (! (client->naccepts == 0))
> > -+            if (! (client->naccepts == 0)) {
> > -                     return (true);
> > -+            }
> > -
> > -             /* Accept cancel is complete. */
> > --            if (client->nrecvs > 0)
> > -+            if (client->nrecvs > 0) {
> > -                     isc_socket_cancel(client->udpsocket, client->task,
> > -                                       ISC_SOCKCANCEL_RECV);
> > -+            }
> > -
> > -             /* Still waiting for recv cancel completion. */
> > --            if (! (client->nrecvs == 0))
> > -+            if (! (client->nrecvs == 0)) {
> > -                     return (true);
> > -+            }
> > -
> > -             /* Still waiting for control event to be delivered */
> > --            if (client->nctls > 0)
> > -+            if (client->nctls > 0) {
> > -                     return (true);
> > --
> > --            /* Deactivate the client. */
> > --            if (client->interface)
> > --                    ns_interface_detach(&client->interface);
> > -+            }
> > -
> > -             INSIST(client->naccepts == 0);
> > -             INSIST(client->recursionquota == NULL);
> > --            if (client->tcplistener != NULL)
> > -+            if (client->tcplistener != NULL) {
> > -                     isc_socket_detach(&client->tcplistener);
> > -
> > --            if (client->udpsocket != NULL)
> > -+                    if (client->tcpactive) {
> > -+                            LOCK(&client->interface->lock);
> > -+                            INSIST(client->interface->ntcpactive > 0);
> > -+                            client->interface->ntcpactive--;
> > -+                            UNLOCK(&client->interface->lock);
> > -+                            client->tcpactive = false;
> > -+                    }
> > -+            }
> > -+            if (client->udpsocket != NULL) {
> > -                     isc_socket_detach(&client->udpsocket);
> > -+            }
> > -
> > --            if (client->dispatch != NULL)
> > -+            /* Deactivate the client. */
> > -+            if (client->interface != NULL) {
> > -+                    ns_interface_detach(&client->interface);
> > -+            }
> > -+
> > -+            if (client->dispatch != NULL) {
> > -                     dns_dispatch_detach(&client->dispatch);
> > -+            }
> > -
> > -             client->attributes = 0;
> > -             client->mortal = false;
> > -@@ -551,10 +607,13 @@ exit_check(ns_client_t *client) {
> > -                     client->newstate = NS_CLIENTSTATE_MAX;
> > -                     if (!ns_g_clienttest && manager != NULL &&
> > -                         !manager->exiting)
> > -+                    {
> > -                             ISC_QUEUE_PUSH(manager->inactive, client,
> > -                                            ilink);
> > --                    if (client->needshutdown)
> > -+                    }
> > -+                    if (client->needshutdown) {
> > -                             isc_task_shutdown(client->task);
> > -+                    }
> > -                     return (true);
> > -             }
> > -     }
> > -@@ -675,7 +734,6 @@ client_start(isc_task_t *task, isc_event_t *event) {
> > -     }
> > - }
> > -
> > --
> > - /*%
> > -  * The client's task has received a shutdown event.
> > -  */
> > -@@ -2507,17 +2565,12 @@ client_request(isc_task_t *task, isc_event_t
> *event) {
> > -     /*
> > -      * Pipeline TCP query processing.
> > -      */
> > --    if (client->message->opcode != dns_opcode_query)
> > -+    if (client->message->opcode != dns_opcode_query) {
> > -             client->pipelined = false;
> > -+    }
> > -     if (TCP_CLIENT(client) && client->pipelined) {
> > --            result = isc_quota_reserve(&ns_g_server->tcpquota);
> > --            if (result == ISC_R_SUCCESS)
> > --                    result = ns_client_replace(client);
> > -+            result = ns_client_replace(client);
> > -             if (result != ISC_R_SUCCESS) {
> > --                    ns_client_log(client, NS_LOGCATEGORY_CLIENT,
> > --                                  NS_LOGMODULE_CLIENT, ISC_LOG_WARNING,
> > --                                  "no more TCP clients(read): %s",
> > --                                  isc_result_totext(result));
> > -                     client->pipelined = false;
> > -             }
> > -     }
> > -@@ -3087,6 +3140,7 @@ client_create(ns_clientmgr_t *manager,
> ns_client_t **clientp) {
> > -     client->filter_aaaa = dns_aaaa_ok;
> > - #endif
> > -     client->needshutdown = ns_g_clienttest;
> > -+    client->tcpactive = false;
> > -
> > -     ISC_EVENT_INIT(&client->ctlevent, sizeof(client->ctlevent), 0,
> NULL,
> > -                    NS_EVENT_CLIENTCONTROL, client_start, client,
> client,
> > -@@ -3100,6 +3154,7 @@ client_create(ns_clientmgr_t *manager,
> ns_client_t **clientp) {
> > -     client->formerrcache.id = 0;
> > -     ISC_LINK_INIT(client, link);
> > -     ISC_LINK_INIT(client, rlink);
> > -+    ISC_LINK_INIT(client, glink);
> > -     ISC_QLINK_INIT(client, ilink);
> > -     client->keytag = NULL;
> > -     client->keytag_len = 0;
> > -@@ -3193,12 +3248,19 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -
> > -     INSIST(client->state == NS_CLIENTSTATE_READY);
> > -
> > -+    /*
> > -+     * The accept() was successful and we're now establishing a new
> > -+     * connection. We need to make note of it in the client and
> > -+     * interface objects so client objects can do the right thing
> > -+     * when going inactive in exit_check() (see comments in
> > -+     * client_accept() for details).
> > -+     */
> > -     INSIST(client->naccepts == 1);
> > -     client->naccepts--;
> > -
> > -     LOCK(&client->interface->lock);
> > --    INSIST(client->interface->ntcpcurrent > 0);
> > --    client->interface->ntcpcurrent--;
> > -+    INSIST(client->interface->ntcpaccepting > 0);
> > -+    client->interface->ntcpaccepting--;
> > -     UNLOCK(&client->interface->lock);
> > -
> > -     /*
> > -@@ -3232,6 +3294,9 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -                           NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(3),
> > -                           "accept failed: %s",
> > -                           isc_result_totext(nevent->result));
> > -+            if (client->tcpquota != NULL) {
> > -+                    isc_quota_detach(&client->tcpquota);
> > -+            }
> > -     }
> > -
> > -     if (exit_check(client))
> > -@@ -3270,18 +3335,12 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -              * deny service to legitimate TCP clients.
> > -              */
> > -             client->pipelined = false;
> > --            result = isc_quota_attach(&ns_g_server->tcpquota,
> > --                                      &client->tcpquota);
> > --            if (result == ISC_R_SUCCESS)
> > --                    result = ns_client_replace(client);
> > --            if (result != ISC_R_SUCCESS) {
> > --                    ns_client_log(client, NS_LOGCATEGORY_CLIENT,
> > --                                  NS_LOGMODULE_CLIENT, ISC_LOG_WARNING,
> > --                                  "no more TCP clients(accept): %s",
> > --                                  isc_result_totext(result));
> > --            } else if (ns_g_server->keepresporder == NULL ||
> > --                       !allowed(&netaddr, NULL, NULL, 0, NULL,
> > --                                ns_g_server->keepresporder)) {
> > -+            result = ns_client_replace(client);
> > -+            if (result == ISC_R_SUCCESS &&
> > -+                (client->sctx->keepresporder == NULL ||
> > -+                 !allowed(&netaddr, NULL, NULL, 0, NULL,
> > -+                          ns_g_server->keepresporder)))
> > -+            {
> > -                     client->pipelined = true;
> > -             }
> > -
> > -@@ -3298,12 +3357,80 @@ client_accept(ns_client_t *client) {
> > -
> > -     CTRACE("accept");
> > -
> > -+    /*
> > -+     * The tcpquota object can only be simultaneously referenced a
> > -+     * pre-defined number of times; this is configured by 'tcp-clients'
> > -+     * in named.conf. If we can't attach to it here, that means the TCP
> > -+     * client quota has been exceeded.
> > -+     */
> > -+    result = isc_quota_attach(&client->sctx->tcpquota,
> > -+                              &client->tcpquota);
> > -+    if (result != ISC_R_SUCCESS) {
> > -+                    bool exit;
> > -+
> > -+                    ns_client_log(client, NS_LOGCATEGORY_CLIENT,
> > -+                                  NS_LOGMODULE_CLIENT,
> ISC_LOG_DEBUG(1),
> > -+                                  "no more TCP clients: %s",
> > -+                                  isc_result_totext(result));
> > -+
> > -+                    /*
> > -+                     * We have exceeded the system-wide TCP client
> > -+                     * quota.  But, we can't just block this accept
> > -+                     * in all cases, because if we did, a heavy TCP
> > -+                     * load on other interfaces might cause this
> > -+                     * interface to be starved, with no clients able
> > -+                     * to accept new connections.
> > -+                     *
> > -+                     * So, we check here to see if any other client
> > -+                     * is already servicing TCP queries on this
> > -+                     * interface (whether accepting, reading, or
> > -+                     * processing).
> > -+                     *
> > -+                     * If so, then it's okay *not* to call
> > -+                     * accept - we can let this client to go inactive
> > -+                     * and the other one handle the next connection
> > -+                     * when it's ready.
> > -+                     *
> > -+                     * But if not, then we need to be a little bit
> > -+                     * flexible about the quota. We allow *one* extra
> > -+                     * TCP client through, to ensure we're listening on
> > -+                     * every interface.
> > -+                     *
> > -+                     * (Note: In practice this means that the *real*
> > -+                     * TCP client quota is tcp-clients plus the number
> > -+                     * of interfaces.)
> > -+                     */
> > -+                    LOCK(&client->interface->lock);
> > -+                    exit = (client->interface->ntcpactive > 0);
> > -+                    UNLOCK(&client->interface->lock);
> > -+
> > -+                    if (exit) {
> > -+                            client->newstate = NS_CLIENTSTATE_INACTIVE;
> > -+                            (void)exit_check(client);
> > -+                            return;
> > -+                    }
> > -+    }
> > -+
> > -+    /*
> > -+     * By incrementing the interface's ntcpactive counter we signal
> > -+     * that there is at least one client servicing TCP queries for the
> > -+     * interface.
> > -+     *
> > -+     * We also make note of the fact in the client itself with the
> > -+     * tcpactive flag. This ensures proper accounting by preventing
> > -+     * us from accidentally incrementing or decrementing ntcpactive
> > -+     * more than once per client object.
> > -+     */
> > -+    if (!client->tcpactive) {
> > -+            LOCK(&client->interface->lock);
> > -+            client->interface->ntcpactive++;
> > -+            UNLOCK(&client->interface->lock);
> > -+            client->tcpactive = true;
> > -+    }
> > -+
> > -     result = isc_socket_accept(client->tcplistener, client->task,
> > -                                client_newconn, client);
> > -     if (result != ISC_R_SUCCESS) {
> > --            UNEXPECTED_ERROR(__FILE__, __LINE__,
> > --                             "isc_socket_accept() failed: %s",
> > --                             isc_result_totext(result));
> > -             /*
> > -              * XXXRTH  What should we do?  We're trying to accept but
> > -              *         it didn't work.  If we just give up, then TCP
> > -@@ -3311,12 +3438,39 @@ client_accept(ns_client_t *client) {
> > -              *
> > -              *         For now, we just go idle.
> > -              */
> > -+            UNEXPECTED_ERROR(__FILE__, __LINE__,
> > -+                             "isc_socket_accept() failed: %s",
> > -+                             isc_result_totext(result));
> > -+            if (client->tcpquota != NULL) {
> > -+                    isc_quota_detach(&client->tcpquota);
> > -+            }
> > -             return;
> > -     }
> > -+
> > -+    /*
> > -+     * The client's 'naccepts' counter indicates that this client has
> > -+     * called accept() and is waiting for a new connection. It should
> > -+     * never exceed 1.
> > -+     */
> > -     INSIST(client->naccepts == 0);
> > -     client->naccepts++;
> > -+
> > -+    /*
> > -+     * The interface's 'ntcpaccepting' counter is incremented when
> > -+     * any client calls accept(), and decremented in client_newconn()
> > -+     * once the connection is established.
> > -+     *
> > -+     * When the client object is shutting down after handling a TCP
> > -+     * request (see exit_check()), it looks to see whether this value
> is
> > -+     * non-zero. If so, that means another client has already called
> > -+     * accept() and is waiting to establish the next connection, which
> > -+     * means the first client is free to go inactive. Otherwise,
> > -+     * the first client must come back and call accept() again; this
> > -+     * guarantees there will always be at least one client listening
> > -+     * for new TCP connections on each interface.
> > -+     */
> > -     LOCK(&client->interface->lock);
> > --    client->interface->ntcpcurrent++;
> > -+    client->interface->ntcpaccepting++;
> > -     UNLOCK(&client->interface->lock);
> > - }
> > -
> > -@@ -3390,13 +3544,14 @@ ns_client_replace(ns_client_t *client) {
> > -     tcp = TCP_CLIENT(client);
> > -     if (tcp && client->pipelined) {
> > -             result = get_worker(client->manager, client->interface,
> > --                                client->tcpsocket);
> > -+                                client->tcpsocket, client);
> > -     } else {
> > -             result = get_client(client->manager, client->interface,
> > -                                 client->dispatch, tcp);
> > -     }
> > --    if (result != ISC_R_SUCCESS)
> > -+    if (result != ISC_R_SUCCESS) {
> > -             return (result);
> > -+    }
> > -
> > -     /*
> > -      * The responsibility for listening for new requests is hereby
> > -@@ -3585,6 +3740,7 @@ get_client(ns_clientmgr_t *manager,
> ns_interface_t *ifp,
> > -             client->attributes |= NS_CLIENTATTR_TCP;
> > -             isc_socket_attach(ifp->tcpsocket,
> > -                               &client->tcplistener);
> > -+
> > -     } else {
> > -             isc_socket_t *sock;
> > -
> > -@@ -3602,7 +3758,8 @@ get_client(ns_clientmgr_t *manager,
> ns_interface_t *ifp,
> > - }
> > -
> > - static isc_result_t
> > --get_worker(ns_clientmgr_t *manager, ns_interface_t *ifp, isc_socket_t
> *sock)
> > -+get_worker(ns_clientmgr_t *manager, ns_interface_t *ifp, isc_socket_t
> *sock,
> > -+       ns_client_t *oldclient)
> > - {
> > -     isc_result_t result = ISC_R_SUCCESS;
> > -     isc_event_t *ev;
> > -@@ -3610,6 +3767,7 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock)
> > -     MTRACE("get worker");
> > -
> > -     REQUIRE(manager != NULL);
> > -+    REQUIRE(oldclient != NULL);
> > -
> > -     if (manager->exiting)
> > -             return (ISC_R_SHUTTINGDOWN);
> > -@@ -3642,7 +3800,28 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock)
> > -     ns_interface_attach(ifp, &client->interface);
> > -     client->newstate = client->state = NS_CLIENTSTATE_WORKING;
> > -     INSIST(client->recursionquota == NULL);
> > --    client->tcpquota = &ns_g_server->tcpquota;
> > -+
> > -+    /*
> > -+     * Transfer TCP quota to the new client.
> > -+     */
> > -+    INSIST(client->tcpquota == NULL);
> > -+    INSIST(oldclient->tcpquota != NULL);
> > -+    client->tcpquota = oldclient->tcpquota;
> > -+    oldclient->tcpquota = NULL;
> > -+
> > -+    /*
> > -+     * Link to a pipeline group, creating it if needed.
> > -+     */
> > -+    if (!ISC_LINK_LINKED(oldclient, glink)) {
> > -+            oldclient->glink.next = NULL;
> > -+            oldclient->glink.prev = NULL;
> > -+    }
> > -+    client->glink.next = oldclient->glink.next;
> > -+    client->glink.prev = oldclient;
> > -+    if (oldclient->glink.next != NULL) {
> > -+            oldclient->glink.next->glink.prev = client;
> > -+    }
> > -+    oldclient->glink.next = client;
> > -
> > -     client->dscp = ifp->dscp;
> > -
> > -@@ -3656,6 +3835,12 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock)
> > -     (void)isc_socket_getpeername(client->tcpsocket, &client->peeraddr);
> > -     client->peeraddr_valid = true;
> > -
> > -+    LOCK(&client->interface->lock);
> > -+    client->interface->ntcpactive++;
> > -+    UNLOCK(&client->interface->lock);
> > -+
> > -+    client->tcpactive = true;
> > -+
> > -     INSIST(client->tcpmsg_valid == false);
> > -     dns_tcpmsg_init(client->mctx, client->tcpsocket, &client->tcpmsg);
> > -     client->tcpmsg_valid = true;
> > -diff --git a/bin/named/include/named/client.h
> b/bin/named/include/named/client.h
> > -index b23a7b191d..1f7973f9c5 100644
> > ---- a/bin/named/include/named/client.h
> > -+++ b/bin/named/include/named/client.h
> > -@@ -94,7 +94,8 @@ struct ns_client {
> > -     int                     nupdates;
> > -     int                     nctls;
> > -     int                     references;
> > --    bool            needshutdown;   /*
> > -+    bool                    tcpactive;
> > -+    bool                    needshutdown;   /*
> > -                                              * Used by clienttest to
> get
> > -                                              * the client to go from
> > -                                              * inactive to free state
> > -@@ -130,9 +131,9 @@ struct ns_client {
> > -     isc_stdtime_t           now;
> > -     isc_time_t              tnow;
> > -     dns_name_t              signername;   /*%< [T]SIG key name */
> > --    dns_name_t *            signer;       /*%< NULL if not valid sig */
> > --    bool            mortal;       /*%< Die after handling request */
> > --    bool            pipelined;   /*%< TCP queries not in sequence */
> > -+    dns_name_t              *signer;      /*%< NULL if not valid sig */
> > -+    bool                    mortal;       /*%< Die after handling
> request */
> > -+    bool                    pipelined;   /*%< TCP queries not in
> sequence */
> > -     isc_quota_t             *tcpquota;
> > -     isc_quota_t             *recursionquota;
> > -     ns_interface_t          *interface;
> > -@@ -143,8 +144,8 @@ struct ns_client {
> > -     isc_sockaddr_t          destsockaddr;
> > -
> > -     isc_netaddr_t           ecs_addr;       /*%< EDNS client subnet */
> > --    uint8_t         ecs_addrlen;
> > --    uint8_t         ecs_scope;
> > -+    uint8_t                 ecs_addrlen;
> > -+    uint8_t                 ecs_scope;
> > -
> > -     struct in6_pktinfo      pktinfo;
> > -     isc_dscp_t              dscp;
> > -@@ -166,6 +167,7 @@ struct ns_client {
> > -
> > -     ISC_LINK(ns_client_t)   link;
> > -     ISC_LINK(ns_client_t)   rlink;
> > -+    ISC_LINK(ns_client_t)   glink;
> > -     ISC_QLINK(ns_client_t)  ilink;
> > -     unsigned char           cookie[8];
> > -     uint32_t                expire;
> > -diff --git a/bin/named/include/named/interfacemgr.h
> b/bin/named/include/named/interfacemgr.h
> > -index 7d1883e1e8..61b08826a6 100644
> > ---- a/bin/named/include/named/interfacemgr.h
> > -+++ b/bin/named/include/named/interfacemgr.h
> > -@@ -77,9 +77,14 @@ struct ns_interface {
> > -                                             /*%< UDP dispatchers. */
> > -     isc_socket_t *          tcpsocket;      /*%< TCP socket. */
> > -     isc_dscp_t              dscp;           /*%< "listen-on" DSCP
> value */
> > --    int                     ntcptarget;     /*%< Desired number of
> concurrent
> > --                                                 TCP accepts */
> > --    int                     ntcpcurrent;    /*%< Current ditto, locked
> */
> > -+    int                     ntcpaccepting;  /*%< Number of clients
> > -+                                                 ready to accept new
> > -+                                                 TCP connections on
> this
> > -+                                                 interface */
> > -+    int                     ntcpactive;     /*%< Number of clients
> > -+                                                 servicing TCP queries
> > -+                                                 (whether accepting or
> > -+                                                 connected) */
> > -     int                     nudpdispatch;   /*%< Number of UDP
> dispatches */
> > -     ns_clientmgr_t *        clientmgr;      /*%< Client manager. */
> > -     ISC_LINK(ns_interface_t) link;
> > -diff --git a/bin/named/interfacemgr.c b/bin/named/interfacemgr.c
> > -index 419927bf54..955096ef47 100644
> > ---- a/bin/named/interfacemgr.c
> > -+++ b/bin/named/interfacemgr.c
> > -@@ -386,8 +386,8 @@ ns_interface_create(ns_interfacemgr_t *mgr,
> isc_sockaddr_t *addr,
> > -      * connections will be handled in parallel even though there is
> > -      * only one client initially.
> > -      */
> > --    ifp->ntcptarget = 1;
> > --    ifp->ntcpcurrent = 0;
> > -+    ifp->ntcpaccepting = 0;
> > -+    ifp->ntcpactive = 0;
> > -     ifp->nudpdispatch = 0;
> > -
> > -     ifp->dscp = -1;
> > -@@ -522,9 +522,7 @@ ns_interface_accepttcp(ns_interface_t *ifp) {
> > -      */
> > -     (void)isc_socket_filter(ifp->tcpsocket, "dataready");
> > -
> > --    result = ns_clientmgr_createclients(ifp->clientmgr,
> > --                                        ifp->ntcptarget, ifp,
> > --                                        true);
> > -+    result = ns_clientmgr_createclients(ifp->clientmgr, 1, ifp, true);
> > -     if (result != ISC_R_SUCCESS) {
> > -             UNEXPECTED_ERROR(__FILE__, __LINE__,
> > -                              "TCP ns_clientmgr_createclients(): %s",
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
> b/meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
> > deleted file mode 100644
> > index 032cfb8c442..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
> > +++ /dev/null
> > @@ -1,278 +0,0 @@
> > -Backport patch to fix CVE-2018-5743.
> > -
> > -Ref:
> > -https://security-tracker.debian.org/tracker/CVE-2018-5743
> > -
> > -CVE: CVE-2018-5743
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/366b4e1]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From 366b4e1ede8aed690e981e07137cb1cb77879c36 Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <michal@isc.org>
> > -Date: Thu, 17 Jan 2019 15:53:38 +0100
> > -Subject: [PATCH 3/6] use reference counter for pipeline groups (v3)
> > -
> > -Track pipeline groups using a shared reference counter
> > -instead of a linked list.
> > -
> > -(cherry picked from commit 513afd33eb17d5dc41a3f0d2d38204ef8c5f6f91)
> > -(cherry picked from commit 9446629b730c59c4215f08d37fbaf810282fbccb)
> > ----
> > - bin/named/client.c               | 171 ++++++++++++++++++++-----------
> > - bin/named/include/named/client.h |   2 +-
> > - 2 files changed, 110 insertions(+), 63 deletions(-)
> > -
> > -diff --git a/bin/named/client.c b/bin/named/client.c
> > -index a7b49a0f71..277656cef0 100644
> > ---- a/bin/named/client.c
> > -+++ b/bin/named/client.c
> > -@@ -299,6 +299,75 @@ ns_client_settimeout(ns_client_t *client, unsigned
> int seconds) {
> > -     }
> > - }
> > -
> > -+/*%
> > -+ * Allocate a reference counter that will track the number of client
> structures
> > -+ * using the TCP connection that 'client' called accept() for.  This
> counter
> > -+ * will be shared between all client structures associated with this
> TCP
> > -+ * connection.
> > -+ */
> > -+static void
> > -+pipeline_init(ns_client_t *client) {
> > -+    isc_refcount_t *refs;
> > -+
> > -+    REQUIRE(client->pipeline_refs == NULL);
> > -+
> > -+    /*
> > -+     * A global memory context is used for the allocation as different
> > -+     * client structures may have different memory contexts assigned
> and a
> > -+     * reference counter allocated here might need to be freed by a
> > -+     * different client.  The performance impact caused by memory
> context
> > -+     * contention here is expected to be negligible, given that this
> code
> > -+     * is only executed for TCP connections.
> > -+     */
> > -+    refs = isc_mem_allocate(client->sctx->mctx, sizeof(*refs));
> > -+    isc_refcount_init(refs, 1);
> > -+    client->pipeline_refs = refs;
> > -+}
> > -+
> > -+/*%
> > -+ * Increase the count of client structures using the TCP connection
> that
> > -+ * 'source' is associated with and put a pointer to that count in
> 'target',
> > -+ * thus associating it with the same TCP connection.
> > -+ */
> > -+static void
> > -+pipeline_attach(ns_client_t *source, ns_client_t *target) {
> > -+    int old_refs;
> > -+
> > -+    REQUIRE(source->pipeline_refs != NULL);
> > -+    REQUIRE(target->pipeline_refs == NULL);
> > -+
> > -+    old_refs = isc_refcount_increment(source->pipeline_refs);
> > -+    INSIST(old_refs > 0);
> > -+    target->pipeline_refs = source->pipeline_refs;
> > -+}
> > -+
> > -+/*%
> > -+ * Decrease the count of client structures using the TCP connection
> that
> > -+ * 'client' is associated with.  If this is the last client using this
> TCP
> > -+ * connection, free the reference counter and return true; otherwise,
> return
> > -+ * false.
> > -+ */
> > -+static bool
> > -+pipeline_detach(ns_client_t *client) {
> > -+    isc_refcount_t *refs;
> > -+    int old_refs;
> > -+
> > -+    REQUIRE(client->pipeline_refs != NULL);
> > -+
> > -+    refs = client->pipeline_refs;
> > -+    client->pipeline_refs = NULL;
> > -+
> > -+    old_refs = isc_refcount_decrement(refs);
> > -+    INSIST(old_refs > 0);
> > -+
> > -+    if (old_refs == 1) {
> > -+            isc_mem_free(client->sctx->mctx, refs);
> > -+            return (true);
> > -+    }
> > -+
> > -+    return (false);
> > -+}
> > -+
> > - /*%
> > -  * Check for a deactivation or shutdown request and take appropriate
> > -  * action.  Returns true if either is in progress; in this case
> > -@@ -421,6 +490,40 @@ exit_check(ns_client_t *client) {
> > -                     client->tcpmsg_valid = false;
> > -             }
> > -
> > -+            if (client->tcpquota != NULL) {
> > -+                    if (client->pipeline_refs == NULL ||
> > -+                        pipeline_detach(client))
> > -+                    {
> > -+                            /*
> > -+                             * Only detach from the TCP client quota if
> > -+                             * there are no more client structures
> using
> > -+                             * this TCP connection.
> > -+                             *
> > -+                             * Note that we check 'pipeline_refs' and
> not
> > -+                             * 'pipelined' because in some cases (e.g.
> > -+                             * after receiving a request with an opcode
> > -+                             * different than QUERY) 'pipelined' is
> set to
> > -+                             * false after the reference counter gets
> > -+                             * allocated in pipeline_init() and we must
> > -+                             * still drop our reference as failing to
> do so
> > -+                             * would prevent the reference counter
> itself
> > -+                             * from being freed.
> > -+                             */
> > -+                            isc_quota_detach(&client->tcpquota);
> > -+                    } else {
> > -+                            /*
> > -+                             * There are other client structures using
> this
> > -+                             * TCP connection, so we cannot detach
> from the
> > -+                             * TCP client quota to prevent excess TCP
> > -+                             * connections from being accepted.
> However,
> > -+                             * this client structure might later be
> reused
> > -+                             * for accepting new connections and thus
> must
> > -+                             * have its 'tcpquota' field set to NULL.
> > -+                             */
> > -+                            client->tcpquota = NULL;
> > -+                    }
> > -+            }
> > -+
> > -             if (client->tcpsocket != NULL) {
> > -                     CTRACE("closetcp");
> > -                     isc_socket_detach(&client->tcpsocket);
> > -@@ -434,44 +537,6 @@ exit_check(ns_client_t *client) {
> > -                     }
> > -             }
> > -
> > --            if (client->tcpquota != NULL) {
> > --                    /*
> > --                     * If we are not in a pipeline group, or
> > --                     * we are the last client in the group, detach from
> > --                     * tcpquota; otherwise, transfer the quota to
> > --                     * another client in the same group.
> > --                     */
> > --                    if (!ISC_LINK_LINKED(client, glink) ||
> > --                        (client->glink.next == NULL &&
> > --                         client->glink.prev == NULL))
> > --                    {
> > --                            isc_quota_detach(&client->tcpquota);
> > --                    } else if (client->glink.next != NULL) {
> > --                            INSIST(client->glink.next->tcpquota ==
> NULL);
> > --                            client->glink.next->tcpquota =
> client->tcpquota;
> > --                            client->tcpquota = NULL;
> > --                    } else {
> > --                            INSIST(client->glink.prev->tcpquota ==
> NULL);
> > --                            client->glink.prev->tcpquota =
> client->tcpquota;
> > --                            client->tcpquota = NULL;
> > --                    }
> > --            }
> > --
> > --            /*
> > --             * Unlink from pipeline group.
> > --             */
> > --            if (ISC_LINK_LINKED(client, glink)) {
> > --                    if (client->glink.next != NULL) {
> > --                            client->glink.next->glink.prev =
> > --                                    client->glink.prev;
> > --                    }
> > --                    if (client->glink.prev != NULL) {
> > --                            client->glink.prev->glink.next =
> > --                                    client->glink.next;
> > --                    }
> > --                    ISC_LINK_INIT(client, glink);
> > --            }
> > --
> > -             if (client->timerset) {
> > -                     (void)isc_timer_reset(client->timer,
> > -                                           isc_timertype_inactive,
> > -@@ -3130,6 +3195,7 @@ client_create(ns_clientmgr_t *manager,
> ns_client_t **clientp) {
> > -     dns_name_init(&client->signername, NULL);
> > -     client->mortal = false;
> > -     client->pipelined = false;
> > -+    client->pipeline_refs = NULL;
> > -     client->tcpquota = NULL;
> > -     client->recursionquota = NULL;
> > -     client->interface = NULL;
> > -@@ -3154,7 +3220,6 @@ client_create(ns_clientmgr_t *manager,
> ns_client_t **clientp) {
> > -     client->formerrcache.id = 0;
> > -     ISC_LINK_INIT(client, link);
> > -     ISC_LINK_INIT(client, rlink);
> > --    ISC_LINK_INIT(client, glink);
> > -     ISC_QLINK_INIT(client, ilink);
> > -     client->keytag = NULL;
> > -     client->keytag_len = 0;
> > -@@ -3341,6 +3406,7 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -                  !allowed(&netaddr, NULL, NULL, 0, NULL,
> > -                           ns_g_server->keepresporder)))
> > -             {
> > -+                    pipeline_init(client);
> > -                     client->pipelined = true;
> > -             }
> > -
> > -@@ -3800,35 +3866,16 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock,
> > -     ns_interface_attach(ifp, &client->interface);
> > -     client->newstate = client->state = NS_CLIENTSTATE_WORKING;
> > -     INSIST(client->recursionquota == NULL);
> > --
> > --    /*
> > --     * Transfer TCP quota to the new client.
> > --     */
> > --    INSIST(client->tcpquota == NULL);
> > --    INSIST(oldclient->tcpquota != NULL);
> > --    client->tcpquota = oldclient->tcpquota;
> > --    oldclient->tcpquota = NULL;
> > --
> > --    /*
> > --     * Link to a pipeline group, creating it if needed.
> > --     */
> > --    if (!ISC_LINK_LINKED(oldclient, glink)) {
> > --            oldclient->glink.next = NULL;
> > --            oldclient->glink.prev = NULL;
> > --    }
> > --    client->glink.next = oldclient->glink.next;
> > --    client->glink.prev = oldclient;
> > --    if (oldclient->glink.next != NULL) {
> > --            oldclient->glink.next->glink.prev = client;
> > --    }
> > --    oldclient->glink.next = client;
> > -+    client->tcpquota = &client->sctx->tcpquota;
> > -
> > -     client->dscp = ifp->dscp;
> > -
> > -     client->attributes |= NS_CLIENTATTR_TCP;
> > --    client->pipelined = true;
> > -     client->mortal = true;
> > -
> > -+    pipeline_attach(oldclient, client);
> > -+    client->pipelined = true;
> > -+
> > -     isc_socket_attach(ifp->tcpsocket, &client->tcplistener);
> > -     isc_socket_attach(sock, &client->tcpsocket);
> > -     isc_socket_setname(client->tcpsocket, "worker-tcp", NULL);
> > -diff --git a/bin/named/include/named/client.h
> b/bin/named/include/named/client.h
> > -index 1f7973f9c5..aeed9ccdda 100644
> > ---- a/bin/named/include/named/client.h
> > -+++ b/bin/named/include/named/client.h
> > -@@ -134,6 +134,7 @@ struct ns_client {
> > -     dns_name_t              *signer;      /*%< NULL if not valid sig */
> > -     bool                    mortal;       /*%< Die after handling
> request */
> > -     bool                    pipelined;   /*%< TCP queries not in
> sequence */
> > -+    isc_refcount_t          *pipeline_refs;
> > -     isc_quota_t             *tcpquota;
> > -     isc_quota_t             *recursionquota;
> > -     ns_interface_t          *interface;
> > -@@ -167,7 +168,6 @@ struct ns_client {
> > -
> > -     ISC_LINK(ns_client_t)   link;
> > -     ISC_LINK(ns_client_t)   rlink;
> > --    ISC_LINK(ns_client_t)   glink;
> > -     ISC_QLINK(ns_client_t)  ilink;
> > -     unsigned char           cookie[8];
> > -     uint32_t                expire;
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
> b/meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
> > deleted file mode 100644
> > index 034ab13303b..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
> > +++ /dev/null
> > @@ -1,512 +0,0 @@
> > -Backport patch to fix CVE-2018-5743.
> > -
> > -Ref:
> > -https://security-tracker.debian.org/tracker/CVE-2018-5743
> > -
> > -CVE: CVE-2018-5743
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/2ab8a08]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From 2ab8a085b3c666f28f1f9229bd6ecb59915b26c3 Mon Sep 17 00:00:00 2001
> > -From: Evan Hunt <each@isc.org>
> > -Date: Fri, 5 Apr 2019 16:12:18 -0700
> > -Subject: [PATCH 4/6] better tcpquota accounting and client mortality
> checks
> > -
> > -- ensure that tcpactive is cleaned up correctly when accept() fails.
> > -- set 'client->tcpattached' when the client is attached to the tcpquota.
> > -  carry this value on to new clients sharing the same pipeline group.
> > -  don't call isc_quota_detach() on the tcpquota unless tcpattached is
> > -  set.  this way clients that were allowed to accept TCP connections
> > -  despite being over quota (and therefore, were never attached to the
> > -  quota) will not inadvertently detach from it and mess up the
> > -  accounting.
> > -- simplify the code for tcpquota disconnection by using a new function
> > -  tcpquota_disconnect().
> > -- before deciding whether to reject a new connection due to quota
> > -  exhaustion, check to see whether there are at least two active
> > -  clients. previously, this was "at least one", but that could be
> > -  insufficient if there was one other client in READING state (waiting
> > -  for messages on an open connection) but none in READY (listening
> > -  for new connections).
> > -- before deciding whether a TCP client object can to go inactive, we
> > -  must ensure there are enough other clients to maintain service
> > -  afterward -- both accepting new connections and reading/processing new
> > -  queries.  A TCP client can't shut down unless at least one
> > -  client is accepting new connections and (in the case of pipelined
> > -  clients) at least one additional client is waiting to read.
> > -
> > -(cherry picked from commit c7394738b2445c16f728a88394864dd61baad900)
> > -(cherry picked from commit e965d5f11d3d0f6d59704e614fceca2093cb1856)
> > -(cherry picked from commit 87d431161450777ea093821212abfb52d51b36e3)
> > ----
> > - bin/named/client.c               | 244 +++++++++++++++++++------------
> > - bin/named/include/named/client.h |   3 +-
> > - 2 files changed, 152 insertions(+), 95 deletions(-)
> > -
> > -diff --git a/bin/named/client.c b/bin/named/client.c
> > -index 277656cef0..61e96dd28c 100644
> > ---- a/bin/named/client.c
> > -+++ b/bin/named/client.c
> > -@@ -244,13 +244,14 @@ static void client_start(isc_task_t *task,
> isc_event_t *event);
> > - static void client_request(isc_task_t *task, isc_event_t *event);
> > - static void ns_client_dumpmessage(ns_client_t *client, const char
> *reason);
> > - static isc_result_t get_client(ns_clientmgr_t *manager, ns_interface_t
> *ifp,
> > --                           dns_dispatch_t *disp, bool tcp);
> > -+                           dns_dispatch_t *disp, ns_client_t
> *oldclient,
> > -+                           bool tcp);
> > - static isc_result_t get_worker(ns_clientmgr_t *manager, ns_interface_t
> *ifp,
> > -                            isc_socket_t *sock, ns_client_t *oldclient);
> > - static inline bool
> > - allowed(isc_netaddr_t *addr, dns_name_t *signer,
> > -     isc_netaddr_t *ecs_addr, uint8_t ecs_addrlen,
> > --    uint8_t *ecs_scope, dns_acl_t *acl)
> > -+    uint8_t *ecs_scope, dns_acl_t *acl);
> > - static void compute_cookie(ns_client_t *client, uint32_t when,
> > -                        uint32_t nonce, const unsigned char *secret,
> > -                        isc_buffer_t *buf);
> > -@@ -319,7 +320,7 @@ pipeline_init(ns_client_t *client) {
> > -      * contention here is expected to be negligible, given that this
> code
> > -      * is only executed for TCP connections.
> > -      */
> > --    refs = isc_mem_allocate(client->sctx->mctx, sizeof(*refs));
> > -+    refs = isc_mem_allocate(ns_g_mctx, sizeof(*refs));
> > -     isc_refcount_init(refs, 1);
> > -     client->pipeline_refs = refs;
> > - }
> > -@@ -331,13 +332,13 @@ pipeline_init(ns_client_t *client) {
> > -  */
> > - static void
> > - pipeline_attach(ns_client_t *source, ns_client_t *target) {
> > --    int old_refs;
> > -+    int refs;
> > -
> > -     REQUIRE(source->pipeline_refs != NULL);
> > -     REQUIRE(target->pipeline_refs == NULL);
> > -
> > --    old_refs = isc_refcount_increment(source->pipeline_refs);
> > --    INSIST(old_refs > 0);
> > -+    isc_refcount_increment(source->pipeline_refs, &refs);
> > -+    INSIST(refs > 1);
> > -     target->pipeline_refs = source->pipeline_refs;
> > - }
> > -
> > -@@ -349,25 +350,51 @@ pipeline_attach(ns_client_t *source, ns_client_t
> *target) {
> > -  */
> > - static bool
> > - pipeline_detach(ns_client_t *client) {
> > --    isc_refcount_t *refs;
> > --    int old_refs;
> > -+    isc_refcount_t *refcount;
> > -+    int refs;
> > -
> > -     REQUIRE(client->pipeline_refs != NULL);
> > -
> > --    refs = client->pipeline_refs;
> > -+    refcount = client->pipeline_refs;
> > -     client->pipeline_refs = NULL;
> > -
> > --    old_refs = isc_refcount_decrement(refs);
> > --    INSIST(old_refs > 0);
> > -+    isc_refcount_decrement(refcount, refs);
> > -
> > --    if (old_refs == 1) {
> > --            isc_mem_free(client->sctx->mctx, refs);
> > -+    if (refs == 0) {
> > -+            isc_mem_free(ns_g_mctx, refs);
> > -             return (true);
> > -     }
> > -
> > -     return (false);
> > - }
> > -
> > -+/*
> > -+ * Detach a client from the TCP client quota if appropriate, and set
> > -+ * the quota pointer to NULL.
> > -+ *
> > -+ * Sometimes when the TCP client quota is exhausted but there are no
> other
> > -+ * clients servicing the interface, a client will be allowed to
> continue
> > -+ * running despite not having been attached to the quota. In this
> event,
> > -+ * the TCP quota was never attached to the client, so when the client
> (or
> > -+ * associated pipeline group) shuts down, the quota must NOT be
> detached.
> > -+ *
> > -+ * Otherwise, if the quota pointer is set, it should be detached. If
> not
> > -+ * set at all, we just return without doing anything.
> > -+ */
> > -+static void
> > -+tcpquota_disconnect(ns_client_t *client) {
> > -+    if (client->tcpquota == NULL) {
> > -+            return;
> > -+    }
> > -+
> > -+    if (client->tcpattached) {
> > -+            isc_quota_detach(&client->tcpquota);
> > -+            client->tcpattached = false;
> > -+    } else {
> > -+            client->tcpquota = NULL;
> > -+    }
> > -+}
> > -+
> > - /*%
> > -  * Check for a deactivation or shutdown request and take appropriate
> > -  * action.  Returns true if either is in progress; in this case
> > -@@ -490,38 +517,31 @@ exit_check(ns_client_t *client) {
> > -                     client->tcpmsg_valid = false;
> > -             }
> > -
> > --            if (client->tcpquota != NULL) {
> > --                    if (client->pipeline_refs == NULL ||
> > --                        pipeline_detach(client))
> > --                    {
> > --                            /*
> > --                             * Only detach from the TCP client quota if
> > --                             * there are no more client structures
> using
> > --                             * this TCP connection.
> > --                             *
> > --                             * Note that we check 'pipeline_refs' and
> not
> > --                             * 'pipelined' because in some cases (e.g.
> > --                             * after receiving a request with an opcode
> > --                             * different than QUERY) 'pipelined' is
> set to
> > --                             * false after the reference counter gets
> > --                             * allocated in pipeline_init() and we must
> > --                             * still drop our reference as failing to
> do so
> > --                             * would prevent the reference counter
> itself
> > --                             * from being freed.
> > --                             */
> > --                            isc_quota_detach(&client->tcpquota);
> > --                    } else {
> > --                            /*
> > --                             * There are other client structures using
> this
> > --                             * TCP connection, so we cannot detach
> from the
> > --                             * TCP client quota to prevent excess TCP
> > --                             * connections from being accepted.
> However,
> > --                             * this client structure might later be
> reused
> > --                             * for accepting new connections and thus
> must
> > --                             * have its 'tcpquota' field set to NULL.
> > --                             */
> > --                            client->tcpquota = NULL;
> > --                    }
> > -+            /*
> > -+             * Detach from pipeline group and from TCP client quota,
> > -+             * if appropriate.
> > -+             *
> > -+             * - If no pipeline group is active, attempt to
> > -+             *   detach from the TCP client quota.
> > -+             *
> > -+             * - If a pipeline group is active, detach from it;
> > -+             *   if the return code indicates that there no more
> > -+             *   clients left if this pipeline group, we also detach
> > -+             *   from the TCP client quota.
> > -+             *
> > -+             * - Otherwise we don't try to detach, we just set the
> > -+             *   TCP quota pointer to NULL if it wasn't NULL already.
> > -+             *
> > -+             * tcpquota_disconnect() will set tcpquota to NULL, either
> > -+             * by detaching it or by assignment, depending on the
> > -+             * needs of the client. See the comments on that function
> > -+             * for further information.
> > -+             */
> > -+            if (client->pipeline_refs == NULL ||
> pipeline_detach(client)) {
> > -+                    tcpquota_disconnect(client);
> > -+            } else {
> > -+                    client->tcpquota = NULL;
> > -+                    client->tcpattached = false;
> > -             }
> > -
> > -             if (client->tcpsocket != NULL) {
> > -@@ -544,8 +564,6 @@ exit_check(ns_client_t *client) {
> > -                     client->timerset = false;
> > -             }
> > -
> > --            client->pipelined = false;
> > --
> > -             client->peeraddr_valid = false;
> > -
> > -             client->state = NS_CLIENTSTATE_READY;
> > -@@ -558,18 +576,27 @@ exit_check(ns_client_t *client) {
> > -              * active and force it to go inactive if not.
> > -              *
> > -              * UDP clients go inactive at this point, but a TCP client
> > --             * will needs to remain active if no other clients are
> > --             * listening for TCP requests on this interface, to
> > --             * prevent this interface from going nonresponsive.
> > -+             * may need to remain active and go into ready state if
> > -+             * no other clients are available to listen for TCP
> > -+             * requests on this interface or (in the case of pipelined
> > -+             * clients) to read for additional messages on the current
> > -+             * connection.
> > -              */
> > -             if (client->mortal && TCP_CLIENT(client) &&
> !ns_g_clienttest) {
> > -                     LOCK(&client->interface->lock);
> > --                    if (client->interface->ntcpaccepting == 0) {
> > -+                    if ((client->interface->ntcpaccepting == 0 ||
> > -+                        (client->pipelined &&
> > -+                         client->interface->ntcpactive < 2)) &&
> > -+                        client->newstate != NS_CLIENTSTATE_FREED)
> > -+                    {
> > -                             client->mortal = false;
> > -+                            client->newstate = NS_CLIENTSTATE_READY;
> > -                     }
> > -                     UNLOCK(&client->interface->lock);
> > -             }
> > -
> > -+            client->pipelined = false;
> > -+
> > -             /*
> > -              * We don't need the client; send it to the inactive
> > -              * queue for recycling.
> > -@@ -2634,6 +2661,18 @@ client_request(isc_task_t *task, isc_event_t
> *event) {
> > -             client->pipelined = false;
> > -     }
> > -     if (TCP_CLIENT(client) && client->pipelined) {
> > -+            /*
> > -+             * We're pipelining. Replace the client; the
> > -+             * the replacement can read the TCP socket looking
> > -+             * for new messages and this client can process the
> > -+             * current message asynchronously.
> > -+             *
> > -+             * There are now at least three clients using this
> > -+             * TCP socket - one accepting new connections,
> > -+             * one reading an existing connection to get new
> > -+             * messages, and one answering the message already
> > -+             * received.
> > -+             */
> > -             result = ns_client_replace(client);
> > -             if (result != ISC_R_SUCCESS) {
> > -                     client->pipelined = false;
> > -@@ -3197,6 +3236,7 @@ client_create(ns_clientmgr_t *manager,
> ns_client_t **clientp) {
> > -     client->pipelined = false;
> > -     client->pipeline_refs = NULL;
> > -     client->tcpquota = NULL;
> > -+    client->tcpattached = false;
> > -     client->recursionquota = NULL;
> > -     client->interface = NULL;
> > -     client->peeraddr_valid = false;
> > -@@ -3359,9 +3399,7 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -                           NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(3),
> > -                           "accept failed: %s",
> > -                           isc_result_totext(nevent->result));
> > --            if (client->tcpquota != NULL) {
> > --                    isc_quota_detach(&client->tcpquota);
> > --            }
> > -+            tcpquota_disconnect(client);
> > -     }
> > -
> > -     if (exit_check(client))
> > -@@ -3402,7 +3440,7 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -             client->pipelined = false;
> > -             result = ns_client_replace(client);
> > -             if (result == ISC_R_SUCCESS &&
> > --                (client->sctx->keepresporder == NULL ||
> > -+                (ns_g_server->keepresporder == NULL ||
> > -                  !allowed(&netaddr, NULL, NULL, 0, NULL,
> > -                           ns_g_server->keepresporder)))
> > -             {
> > -@@ -3429,7 +3467,7 @@ client_accept(ns_client_t *client) {
> > -      * in named.conf. If we can't attach to it here, that means the TCP
> > -      * client quota has been exceeded.
> > -      */
> > --    result = isc_quota_attach(&client->sctx->tcpquota,
> > -+    result = isc_quota_attach(&ns_g_server->tcpquota,
> > -                               &client->tcpquota);
> > -     if (result != ISC_R_SUCCESS) {
> > -                     bool exit;
> > -@@ -3447,27 +3485,27 @@ client_accept(ns_client_t *client) {
> > -                      * interface to be starved, with no clients able
> > -                      * to accept new connections.
> > -                      *
> > --                     * So, we check here to see if any other client
> > --                     * is already servicing TCP queries on this
> > -+                     * So, we check here to see if any other clients
> > -+                     * are already servicing TCP queries on this
> > -                      * interface (whether accepting, reading, or
> > --                     * processing).
> > --                     *
> > --                     * If so, then it's okay *not* to call
> > --                     * accept - we can let this client to go inactive
> > --                     * and the other one handle the next connection
> > --                     * when it's ready.
> > -+                     * processing). If there are at least two
> > -+                     * (one reading and one processing a request)
> > -+                     * then it's okay *not* to call accept - we
> > -+                     * can let this client go inactive and another
> > -+                     * one will resume accepting when it's done.
> > -                      *
> > --                     * But if not, then we need to be a little bit
> > --                     * flexible about the quota. We allow *one* extra
> > --                     * TCP client through, to ensure we're listening on
> > --                     * every interface.
> > -+                     * If there aren't enough active clients on the
> > -+                     * interface, then we can be a little bit
> > -+                     * flexible about the quota. We'll allow *one*
> > -+                     * extra client through to ensure we're listening
> > -+                     * on every interface.
> > -                      *
> > --                     * (Note: In practice this means that the *real*
> > --                     * TCP client quota is tcp-clients plus the number
> > --                     * of interfaces.)
> > -+                     * (Note: In practice this means that the real
> > -+                     * TCP client quota is tcp-clients plus the
> > -+                     * number of listening interfaces plus 2.)
> > -                      */
> > -                     LOCK(&client->interface->lock);
> > --                    exit = (client->interface->ntcpactive > 0);
> > -+                    exit = (client->interface->ntcpactive > 1);
> > -                     UNLOCK(&client->interface->lock);
> > -
> > -                     if (exit) {
> > -@@ -3475,6 +3513,9 @@ client_accept(ns_client_t *client) {
> > -                             (void)exit_check(client);
> > -                             return;
> > -                     }
> > -+
> > -+    } else {
> > -+            client->tcpattached = true;
> > -     }
> > -
> > -     /*
> > -@@ -3507,9 +3548,16 @@ client_accept(ns_client_t *client) {
> > -             UNEXPECTED_ERROR(__FILE__, __LINE__,
> > -                              "isc_socket_accept() failed: %s",
> > -                              isc_result_totext(result));
> > --            if (client->tcpquota != NULL) {
> > --                    isc_quota_detach(&client->tcpquota);
> > -+
> > -+            tcpquota_disconnect(client);
> > -+
> > -+            if (client->tcpactive) {
> > -+                    LOCK(&client->interface->lock);
> > -+                    client->interface->ntcpactive--;
> > -+                    UNLOCK(&client->interface->lock);
> > -+                    client->tcpactive = false;
> > -             }
> > -+
> > -             return;
> > -     }
> > -
> > -@@ -3527,13 +3575,12 @@ client_accept(ns_client_t *client) {
> > -      * once the connection is established.
> > -      *
> > -      * When the client object is shutting down after handling a TCP
> > --     * request (see exit_check()), it looks to see whether this value
> is
> > --     * non-zero. If so, that means another client has already called
> > --     * accept() and is waiting to establish the next connection, which
> > --     * means the first client is free to go inactive. Otherwise,
> > --     * the first client must come back and call accept() again; this
> > --     * guarantees there will always be at least one client listening
> > --     * for new TCP connections on each interface.
> > -+     * request (see exit_check()), if this value is at least one, that
> > -+     * means another client has called accept() and is waiting to
> > -+     * establish the next connection. That means the client may be
> > -+     * be free to become inactive; otherwise it may need to start
> > -+     * listening for connections itself to prevent the interface
> > -+     * going dead.
> > -      */
> > -     LOCK(&client->interface->lock);
> > -     client->interface->ntcpaccepting++;
> > -@@ -3613,19 +3660,19 @@ ns_client_replace(ns_client_t *client) {
> > -                                 client->tcpsocket, client);
> > -     } else {
> > -             result = get_client(client->manager, client->interface,
> > --                                client->dispatch, tcp);
> > -+                                client->dispatch, client, tcp);
> > -+
> > -+            /*
> > -+             * The responsibility for listening for new requests is
> hereby
> > -+             * transferred to the new client.  Therefore, the old
> client
> > -+             * should refrain from listening for any more requests.
> > -+             */
> > -+            client->mortal = true;
> > -     }
> > -     if (result != ISC_R_SUCCESS) {
> > -             return (result);
> > -     }
> > -
> > --    /*
> > --     * The responsibility for listening for new requests is hereby
> > --     * transferred to the new client.  Therefore, the old client
> > --     * should refrain from listening for any more requests.
> > --     */
> > --    client->mortal = true;
> > --
> > -     return (ISC_R_SUCCESS);
> > - }
> > -
> > -@@ -3759,7 +3806,7 @@ ns_clientmgr_destroy(ns_clientmgr_t **managerp) {
> > -
> > - static isc_result_t
> > - get_client(ns_clientmgr_t *manager, ns_interface_t *ifp,
> > --       dns_dispatch_t *disp, bool tcp)
> > -+       dns_dispatch_t *disp, ns_client_t *oldclient, bool tcp)
> > - {
> > -     isc_result_t result = ISC_R_SUCCESS;
> > -     isc_event_t *ev;
> > -@@ -3803,6 +3850,16 @@ get_client(ns_clientmgr_t *manager,
> ns_interface_t *ifp,
> > -     client->dscp = ifp->dscp;
> > -
> > -     if (tcp) {
> > -+            client->tcpattached = false;
> > -+            if (oldclient != NULL) {
> > -+                    client->tcpattached = oldclient->tcpattached;
> > -+            }
> > -+
> > -+            LOCK(&client->interface->lock);
> > -+            client->interface->ntcpactive++;
> > -+            UNLOCK(&client->interface->lock);
> > -+            client->tcpactive = true;
> > -+
> > -             client->attributes |= NS_CLIENTATTR_TCP;
> > -             isc_socket_attach(ifp->tcpsocket,
> > -                               &client->tcplistener);
> > -@@ -3866,7 +3923,8 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock,
> > -     ns_interface_attach(ifp, &client->interface);
> > -     client->newstate = client->state = NS_CLIENTSTATE_WORKING;
> > -     INSIST(client->recursionquota == NULL);
> > --    client->tcpquota = &client->sctx->tcpquota;
> > -+    client->tcpquota = &ns_g_server->tcpquota;
> > -+    client->tcpattached = oldclient->tcpattached;
> > -
> > -     client->dscp = ifp->dscp;
> > -
> > -@@ -3885,7 +3943,6 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock,
> > -     LOCK(&client->interface->lock);
> > -     client->interface->ntcpactive++;
> > -     UNLOCK(&client->interface->lock);
> > --
> > -     client->tcpactive = true;
> > -
> > -     INSIST(client->tcpmsg_valid == false);
> > -@@ -3913,7 +3970,8 @@ ns_clientmgr_createclients(ns_clientmgr_t
> *manager, unsigned int n,
> > -     MTRACE("createclients");
> > -
> > -     for (disp = 0; disp < n; disp++) {
> > --            result = get_client(manager, ifp, ifp->udpdispatch[disp],
> tcp);
> > -+            result = get_client(manager, ifp, ifp->udpdispatch[disp],
> > -+                                NULL, tcp);
> > -             if (result != ISC_R_SUCCESS)
> > -                     break;
> > -     }
> > -diff --git a/bin/named/include/named/client.h
> b/bin/named/include/named/client.h
> > -index aeed9ccdda..e2c40acd28 100644
> > ---- a/bin/named/include/named/client.h
> > -+++ b/bin/named/include/named/client.h
> > -@@ -9,8 +9,6 @@
> > -  * information regarding copyright ownership.
> > -  */
> > -
> > --/* $Id: client.h,v 1.96 2012/01/31 23:47:31 tbox Exp $ */
> > --
> > - #ifndef NAMED_CLIENT_H
> > - #define NAMED_CLIENT_H 1
> > -
> > -@@ -136,6 +134,7 @@ struct ns_client {
> > -     bool                    pipelined;   /*%< TCP queries not in
> sequence */
> > -     isc_refcount_t          *pipeline_refs;
> > -     isc_quota_t             *tcpquota;
> > -+    bool                    tcpattached;
> > -     isc_quota_t             *recursionquota;
> > -     ns_interface_t          *interface;
> > -
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
> b/meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
> > deleted file mode 100644
> > index 987e75bc0ee..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
> > +++ /dev/null
> > @@ -1,911 +0,0 @@
> > -Backport patch to fix CVE-2018-5743.
> > -
> > -Ref:
> > -https://security-tracker.debian.org/tracker/CVE-2018-5743
> > -
> > -CVE: CVE-2018-5743
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/c47ccf6]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From c47ccf630f147378568b33e8fdb7b754f228c346 Mon Sep 17 00:00:00 2001
> > -From: Evan Hunt <each@isc.org>
> > -Date: Fri, 5 Apr 2019 16:26:05 -0700
> > -Subject: [PATCH 5/6] refactor tcpquota and pipeline refs; allow
> special-case
> > - overrun in isc_quota
> > -
> > -- if the TCP quota has been exceeded but there are no clients listening
> > -  for new connections on the interface, we can now force attachment to
> the
> > -  quota using isc_quota_force(), instead of carrying on with the quota
> not
> > -  attached.
> > -- the TCP client quota is now referenced via a reference-counted
> > -  'ns_tcpconn' object, one of which is created whenever a client begins
> > -  listening for new connections, and attached to by members of that
> > -  client's pipeline group. when the last reference to the tcpconn
> > -  object is detached, it is freed and the TCP quota slot is released.
> > -- reduce code duplication by adding mark_tcp_active() function.
> > -- convert counters to atomic.
> > -
> > -(cherry picked from commit 7e8222378ca24f1302a0c1c638565050ab04681b)
> > -(cherry picked from commit 4939451275722bfda490ea86ca13e84f6bc71e46)
> > -(cherry picked from commit 13f7c918b8720d890408f678bd73c20e634539d9)
> > ----
> > - bin/named/client.c                     | 444 +++++++++++--------------
> > - bin/named/include/named/client.h       |  12 +-
> > - bin/named/include/named/interfacemgr.h |   6 +-
> > - bin/named/interfacemgr.c               |   1 +
> > - lib/isc/include/isc/quota.h            |   7 +
> > - lib/isc/quota.c                        |  33 +-
> > - lib/isc/win32/libisc.def.in            |   1 +
> > - 7 files changed, 236 insertions(+), 268 deletions(-)
> > -
> > -diff --git a/bin/named/client.c b/bin/named/client.c
> > -index 61e96dd28c..d826ab32bf 100644
> > ---- a/bin/named/client.c
> > -+++ b/bin/named/client.c
> > -@@ -244,8 +244,7 @@ static void client_start(isc_task_t *task,
> isc_event_t *event);
> > - static void client_request(isc_task_t *task, isc_event_t *event);
> > - static void ns_client_dumpmessage(ns_client_t *client, const char
> *reason);
> > - static isc_result_t get_client(ns_clientmgr_t *manager, ns_interface_t
> *ifp,
> > --                           dns_dispatch_t *disp, ns_client_t
> *oldclient,
> > --                           bool tcp);
> > -+                           dns_dispatch_t *disp, bool tcp);
> > - static isc_result_t get_worker(ns_clientmgr_t *manager, ns_interface_t
> *ifp,
> > -                            isc_socket_t *sock, ns_client_t *oldclient);
> > - static inline bool
> > -@@ -301,16 +300,32 @@ ns_client_settimeout(ns_client_t *client,
> unsigned int seconds) {
> > - }
> > -
> > - /*%
> > -- * Allocate a reference counter that will track the number of client
> structures
> > -- * using the TCP connection that 'client' called accept() for.  This
> counter
> > -- * will be shared between all client structures associated with this
> TCP
> > -- * connection.
> > -+ * Allocate a reference-counted object that will maintain a single
> pointer to
> > -+ * the (also reference-counted) TCP client quota, shared between all
> the
> > -+ * clients processing queries on a single TCP connection, so that all
> > -+ * clients sharing the one socket will together consume only one slot
> in
> > -+ * the 'tcp-clients' quota.
> > -  */
> > --static void
> > --pipeline_init(ns_client_t *client) {
> > --    isc_refcount_t *refs;
> > -+static isc_result_t
> > -+tcpconn_init(ns_client_t *client, bool force) {
> > -+    isc_result_t result;
> > -+    isc_quota_t *quota = NULL;
> > -+    ns_tcpconn_t *tconn = NULL;
> > -
> > --    REQUIRE(client->pipeline_refs == NULL);
> > -+    REQUIRE(client->tcpconn == NULL);
> > -+
> > -+    /*
> > -+     * Try to attach to the quota first, so we won't pointlessly
> > -+     * allocate memory for a tcpconn object if we can't get one.
> > -+     */
> > -+    if (force) {
> > -+            result = isc_quota_force(&ns_g_server->tcpquota, &quota);
> > -+    } else {
> > -+            result = isc_quota_attach(&ns_g_server->tcpquota, &quota);
> > -+    }
> > -+    if (result != ISC_R_SUCCESS) {
> > -+            return (result);
> > -+    }
> > -
> > -     /*
> > -      * A global memory context is used for the allocation as different
> > -@@ -320,78 +335,80 @@ pipeline_init(ns_client_t *client) {
> > -      * contention here is expected to be negligible, given that this
> code
> > -      * is only executed for TCP connections.
> > -      */
> > --    refs = isc_mem_allocate(ns_g_mctx, sizeof(*refs));
> > --    isc_refcount_init(refs, 1);
> > --    client->pipeline_refs = refs;
> > -+    tconn = isc_mem_allocate(ns_g_mctx, sizeof(*tconn));
> > -+
> > -+    isc_refcount_init(&tconn->refs, 1);
> > -+    tconn->tcpquota = quota;
> > -+    quota = NULL;
> > -+    tconn->pipelined = false;
> > -+
> > -+    client->tcpconn = tconn;
> > -+
> > -+    return (ISC_R_SUCCESS);
> > - }
> > -
> > - /*%
> > -- * Increase the count of client structures using the TCP connection
> that
> > -- * 'source' is associated with and put a pointer to that count in
> 'target',
> > -- * thus associating it with the same TCP connection.
> > -+ * Increase the count of client structures sharing the TCP connection
> > -+ * that 'source' is associated with; add a pointer to the same tcpconn
> > -+ * to 'target', thus associating it with the same TCP connection.
> > -  */
> > - static void
> > --pipeline_attach(ns_client_t *source, ns_client_t *target) {
> > -+tcpconn_attach(ns_client_t *source, ns_client_t *target) {
> > -     int refs;
> > -
> > --    REQUIRE(source->pipeline_refs != NULL);
> > --    REQUIRE(target->pipeline_refs == NULL);
> > -+    REQUIRE(source->tcpconn != NULL);
> > -+    REQUIRE(target->tcpconn == NULL);
> > -+    REQUIRE(source->tcpconn->pipelined);
> > -
> > --    isc_refcount_increment(source->pipeline_refs, &refs);
> > -+    isc_refcount_increment(&source->tcpconn->refs, &refs);
> > -     INSIST(refs > 1);
> > --    target->pipeline_refs = source->pipeline_refs;
> > -+    target->tcpconn = source->tcpconn;
> > - }
> > -
> > - /*%
> > -- * Decrease the count of client structures using the TCP connection
> that
> > -+ * Decrease the count of client structures sharing the TCP connection
> that
> > -  * 'client' is associated with.  If this is the last client using this
> TCP
> > -- * connection, free the reference counter and return true; otherwise,
> return
> > -- * false.
> > -+ * connection, we detach from the TCP quota and free the tcpconn
> > -+ * object. Either way, client->tcpconn is set to NULL.
> > -  */
> > --static bool
> > --pipeline_detach(ns_client_t *client) {
> > --    isc_refcount_t *refcount;
> > -+static void
> > -+tcpconn_detach(ns_client_t *client) {
> > -+    ns_tcpconn_t *tconn = NULL;
> > -     int refs;
> > -
> > --    REQUIRE(client->pipeline_refs != NULL);
> > --
> > --    refcount = client->pipeline_refs;
> > --    client->pipeline_refs = NULL;
> > -+    REQUIRE(client->tcpconn != NULL);
> > -
> > --    isc_refcount_decrement(refcount, refs);
> > -+    tconn = client->tcpconn;
> > -+    client->tcpconn = NULL;
> > -
> > -+    isc_refcount_decrement(&tconn->refs, &refs);
> > -     if (refs == 0) {
> > --            isc_mem_free(ns_g_mctx, refs);
> > --            return (true);
> > -+            isc_quota_detach(&tconn->tcpquota);
> > -+            isc_mem_free(ns_g_mctx, tconn);
> > -     }
> > --
> > --    return (false);
> > - }
> > -
> > --/*
> > -- * Detach a client from the TCP client quota if appropriate, and set
> > -- * the quota pointer to NULL.
> > -- *
> > -- * Sometimes when the TCP client quota is exhausted but there are no
> other
> > -- * clients servicing the interface, a client will be allowed to
> continue
> > -- * running despite not having been attached to the quota. In this
> event,
> > -- * the TCP quota was never attached to the client, so when the client
> (or
> > -- * associated pipeline group) shuts down, the quota must NOT be
> detached.
> > -+/*%
> > -+ * Mark a client as active and increment the interface's 'ntcpactive'
> > -+ * counter, as a signal that there is at least one client servicing
> > -+ * TCP queries for the interface. If we reach the TCP client quota at
> > -+ * some point, this will be used to determine whether a quota overrun
> > -+ * should be permitted.
> > -  *
> > -- * Otherwise, if the quota pointer is set, it should be detached. If
> not
> > -- * set at all, we just return without doing anything.
> > -+ * Marking the client active with the 'tcpactive' flag ensures proper
> > -+ * accounting, by preventing us from incrementing or decrementing
> > -+ * 'ntcpactive' more than once per client.
> > -  */
> > - static void
> > --tcpquota_disconnect(ns_client_t *client) {
> > --    if (client->tcpquota == NULL) {
> > --            return;
> > --    }
> > --
> > --    if (client->tcpattached) {
> > --            isc_quota_detach(&client->tcpquota);
> > --            client->tcpattached = false;
> > --    } else {
> > --            client->tcpquota = NULL;
> > -+mark_tcp_active(ns_client_t *client, bool active) {
> > -+    if (active && !client->tcpactive) {
> > -+            isc_atomic_xadd(&client->interface->ntcpactive, 1);
> > -+            client->tcpactive = active;
> > -+    } else if (!active && client->tcpactive) {
> > -+            uint32_t old =
> > -+                    isc_atomic_xadd(&client->interface->ntcpactive,
> -1);
> > -+            INSIST(old > 0);
> > -+            client->tcpactive = active;
> > -     }
> > - }
> > -
> > -@@ -484,7 +501,8 @@ exit_check(ns_client_t *client) {
> > -             INSIST(client->recursionquota == NULL);
> > -
> > -             if (NS_CLIENTSTATE_READING == client->newstate) {
> > --                    if (!client->pipelined) {
> > -+                    INSIST(client->tcpconn != NULL);
> > -+                    if (!client->tcpconn->pipelined) {
> > -                             client_read(client);
> > -                             client->newstate = NS_CLIENTSTATE_MAX;
> > -                             return (true); /* We're done. */
> > -@@ -507,8 +525,8 @@ exit_check(ns_client_t *client) {
> > -                     dns_tcpmsg_cancelread(&client->tcpmsg);
> > -             }
> > -
> > --            if (client->nreads != 0) {
> > --                    /* Still waiting for read cancel completion. */
> > -+            /* Still waiting for read cancel completion. */
> > -+            if (client->nreads > 0) {
> > -                     return (true);
> > -             }
> > -
> > -@@ -518,43 +536,45 @@ exit_check(ns_client_t *client) {
> > -             }
> > -
> > -             /*
> > --             * Detach from pipeline group and from TCP client quota,
> > --             * if appropriate.
> > -+             * Soon the client will be ready to accept a new TCP
> > -+             * connection or UDP request, but we may have enough
> > -+             * clients doing that already.  Check whether this client
> > -+             * needs to remain active and allow it go inactive if
> > -+             * not.
> > -              *
> > --             * - If no pipeline group is active, attempt to
> > --             *   detach from the TCP client quota.
> > -+             * UDP clients always go inactive at this point, but a TCP
> > -+             * client may need to stay active and return to READY
> > -+             * state if no other clients are available to listen
> > -+             * for TCP requests on this interface.
> > -              *
> > --             * - If a pipeline group is active, detach from it;
> > --             *   if the return code indicates that there no more
> > --             *   clients left if this pipeline group, we also detach
> > --             *   from the TCP client quota.
> > --             *
> > --             * - Otherwise we don't try to detach, we just set the
> > --             *   TCP quota pointer to NULL if it wasn't NULL already.
> > --             *
> > --             * tcpquota_disconnect() will set tcpquota to NULL, either
> > --             * by detaching it or by assignment, depending on the
> > --             * needs of the client. See the comments on that function
> > --             * for further information.
> > -+             * Regardless, if we're going to FREED state, that means
> > -+             * the system is shutting down and we don't need to
> > -+             * retain clients.
> > -              */
> > --            if (client->pipeline_refs == NULL ||
> pipeline_detach(client)) {
> > --                    tcpquota_disconnect(client);
> > --            } else {
> > --                    client->tcpquota = NULL;
> > --                    client->tcpattached = false;
> > -+            if (client->mortal && TCP_CLIENT(client) &&
> > -+                client->newstate != NS_CLIENTSTATE_FREED &&
> > -+                !ns_g_clienttest &&
> > -+                isc_atomic_xadd(&client->interface->ntcpaccepting, 0)
> == 0)
> > -+            {
> > -+                    /* Nobody else is accepting */
> > -+                    client->mortal = false;
> > -+                    client->newstate = NS_CLIENTSTATE_READY;
> > -+            }
> > -+
> > -+            /*
> > -+             * Detach from TCP connection and TCP client quota,
> > -+             * if appropriate. If this is the last reference to
> > -+             * the TCP connection in our pipeline group, the
> > -+             * TCP quota slot will be released.
> > -+             */
> > -+            if (client->tcpconn) {
> > -+                    tcpconn_detach(client);
> > -             }
> > -
> > -             if (client->tcpsocket != NULL) {
> > -                     CTRACE("closetcp");
> > -                     isc_socket_detach(&client->tcpsocket);
> > --
> > --                    if (client->tcpactive) {
> > --                            LOCK(&client->interface->lock);
> > --                            INSIST(client->interface->ntcpactive > 0);
> > --                            client->interface->ntcpactive--;
> > --                            UNLOCK(&client->interface->lock);
> > --                            client->tcpactive = false;
> > --                    }
> > -+                    mark_tcp_active(client, false);
> > -             }
> > -
> > -             if (client->timerset) {
> > -@@ -567,35 +587,6 @@ exit_check(ns_client_t *client) {
> > -             client->peeraddr_valid = false;
> > -
> > -             client->state = NS_CLIENTSTATE_READY;
> > --            INSIST(client->recursionquota == NULL);
> > --
> > --            /*
> > --             * Now the client is ready to accept a new TCP connection
> > --             * or UDP request, but we may have enough clients doing
> > --             * that already.  Check whether this client needs to remain
> > --             * active and force it to go inactive if not.
> > --             *
> > --             * UDP clients go inactive at this point, but a TCP client
> > --             * may need to remain active and go into ready state if
> > --             * no other clients are available to listen for TCP
> > --             * requests on this interface or (in the case of pipelined
> > --             * clients) to read for additional messages on the current
> > --             * connection.
> > --             */
> > --            if (client->mortal && TCP_CLIENT(client) &&
> !ns_g_clienttest) {
> > --                    LOCK(&client->interface->lock);
> > --                    if ((client->interface->ntcpaccepting == 0 ||
> > --                        (client->pipelined &&
> > --                         client->interface->ntcpactive < 2)) &&
> > --                        client->newstate != NS_CLIENTSTATE_FREED)
> > --                    {
> > --                            client->mortal = false;
> > --                            client->newstate = NS_CLIENTSTATE_READY;
> > --                    }
> > --                    UNLOCK(&client->interface->lock);
> > --            }
> > --
> > --            client->pipelined = false;
> > -
> > -             /*
> > -              * We don't need the client; send it to the inactive
> > -@@ -630,7 +621,7 @@ exit_check(ns_client_t *client) {
> > -             }
> > -
> > -             /* Still waiting for accept cancel completion. */
> > --            if (! (client->naccepts == 0)) {
> > -+            if (client->naccepts > 0) {
> > -                     return (true);
> > -             }
> > -
> > -@@ -641,7 +632,7 @@ exit_check(ns_client_t *client) {
> > -             }
> > -
> > -             /* Still waiting for recv cancel completion. */
> > --            if (! (client->nrecvs == 0)) {
> > -+            if (client->nrecvs > 0) {
> > -                     return (true);
> > -             }
> > -
> > -@@ -654,14 +645,7 @@ exit_check(ns_client_t *client) {
> > -             INSIST(client->recursionquota == NULL);
> > -             if (client->tcplistener != NULL) {
> > -                     isc_socket_detach(&client->tcplistener);
> > --
> > --                    if (client->tcpactive) {
> > --                            LOCK(&client->interface->lock);
> > --                            INSIST(client->interface->ntcpactive > 0);
> > --                            client->interface->ntcpactive--;
> > --                            UNLOCK(&client->interface->lock);
> > --                            client->tcpactive = false;
> > --                    }
> > -+                    mark_tcp_active(client, false);
> > -             }
> > -             if (client->udpsocket != NULL) {
> > -                     isc_socket_detach(&client->udpsocket);
> > -@@ -816,7 +800,7 @@ client_start(isc_task_t *task, isc_event_t *event) {
> > -             return;
> > -
> > -     if (TCP_CLIENT(client)) {
> > --            if (client->pipelined) {
> > -+            if (client->tcpconn != NULL) {
> > -                     client_read(client);
> > -             } else {
> > -                     client_accept(client);
> > -@@ -2470,6 +2454,7 @@ client_request(isc_task_t *task, isc_event_t
> *event) {
> > -             client->nrecvs--;
> > -     } else {
> > -             INSIST(TCP_CLIENT(client));
> > -+            INSIST(client->tcpconn != NULL);
> > -             REQUIRE(event->ev_type == DNS_EVENT_TCPMSG);
> > -             REQUIRE(event->ev_sender == &client->tcpmsg);
> > -             buffer = &client->tcpmsg.buffer;
> > -@@ -2657,17 +2642,19 @@ client_request(isc_task_t *task, isc_event_t
> *event) {
> > -     /*
> > -      * Pipeline TCP query processing.
> > -      */
> > --    if (client->message->opcode != dns_opcode_query) {
> > --            client->pipelined = false;
> > -+    if (TCP_CLIENT(client) &&
> > -+        client->message->opcode != dns_opcode_query)
> > -+    {
> > -+            client->tcpconn->pipelined = false;
> > -     }
> > --    if (TCP_CLIENT(client) && client->pipelined) {
> > -+    if (TCP_CLIENT(client) && client->tcpconn->pipelined) {
> > -             /*
> > -              * We're pipelining. Replace the client; the
> > --             * the replacement can read the TCP socket looking
> > --             * for new messages and this client can process the
> > -+             * replacement can read the TCP socket looking
> > -+             * for new messages and this one can process the
> > -              * current message asynchronously.
> > -              *
> > --             * There are now at least three clients using this
> > -+             * There will now be at least three clients using this
> > -              * TCP socket - one accepting new connections,
> > -              * one reading an existing connection to get new
> > -              * messages, and one answering the message already
> > -@@ -2675,7 +2662,7 @@ client_request(isc_task_t *task, isc_event_t
> *event) {
> > -              */
> > -             result = ns_client_replace(client);
> > -             if (result != ISC_R_SUCCESS) {
> > --                    client->pipelined = false;
> > -+                    client->tcpconn->pipelined = false;
> > -             }
> > -     }
> > -
> > -@@ -3233,10 +3220,7 @@ client_create(ns_clientmgr_t *manager,
> ns_client_t **clientp) {
> > -     client->signer = NULL;
> > -     dns_name_init(&client->signername, NULL);
> > -     client->mortal = false;
> > --    client->pipelined = false;
> > --    client->pipeline_refs = NULL;
> > --    client->tcpquota = NULL;
> > --    client->tcpattached = false;
> > -+    client->tcpconn = NULL;
> > -     client->recursionquota = NULL;
> > -     client->interface = NULL;
> > -     client->peeraddr_valid = false;
> > -@@ -3341,9 +3325,10 @@ client_read(ns_client_t *client) {
> > -
> > - static void
> > - client_newconn(isc_task_t *task, isc_event_t *event) {
> > -+    isc_result_t result;
> > -     ns_client_t *client = event->ev_arg;
> > -     isc_socket_newconnev_t *nevent = (isc_socket_newconnev_t *)event;
> > --    isc_result_t result;
> > -+    uint32_t old;
> > -
> > -     REQUIRE(event->ev_type == ISC_SOCKEVENT_NEWCONN);
> > -     REQUIRE(NS_CLIENT_VALID(client));
> > -@@ -3363,10 +3348,8 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -     INSIST(client->naccepts == 1);
> > -     client->naccepts--;
> > -
> > --    LOCK(&client->interface->lock);
> > --    INSIST(client->interface->ntcpaccepting > 0);
> > --    client->interface->ntcpaccepting--;
> > --    UNLOCK(&client->interface->lock);
> > -+    old = isc_atomic_xadd(&client->interface->ntcpaccepting, -1);
> > -+    INSIST(old > 0);
> > -
> > -     /*
> > -      * We must take ownership of the new socket before the exit
> > -@@ -3399,7 +3382,7 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -                           NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(3),
> > -                           "accept failed: %s",
> > -                           isc_result_totext(nevent->result));
> > --            tcpquota_disconnect(client);
> > -+            tcpconn_detach(client);
> > -     }
> > -
> > -     if (exit_check(client))
> > -@@ -3437,15 +3420,13 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -              * telnetting to port 53 (once per CPU) will
> > -              * deny service to legitimate TCP clients.
> > -              */
> > --            client->pipelined = false;
> > -             result = ns_client_replace(client);
> > -             if (result == ISC_R_SUCCESS &&
> > -                 (ns_g_server->keepresporder == NULL ||
> > -                  !allowed(&netaddr, NULL, NULL, 0, NULL,
> > -                           ns_g_server->keepresporder)))
> > -             {
> > --                    pipeline_init(client);
> > --                    client->pipelined = true;
> > -+                    client->tcpconn->pipelined = true;
> > -             }
> > -
> > -             client_read(client);
> > -@@ -3462,78 +3443,59 @@ client_accept(ns_client_t *client) {
> > -     CTRACE("accept");
> > -
> > -     /*
> > --     * The tcpquota object can only be simultaneously referenced a
> > --     * pre-defined number of times; this is configured by 'tcp-clients'
> > --     * in named.conf. If we can't attach to it here, that means the TCP
> > --     * client quota has been exceeded.
> > -+     * Set up a new TCP connection. This means try to attach to the
> > -+     * TCP client quota (tcp-clients), but fail if we're over quota.
> > -      */
> > --    result = isc_quota_attach(&ns_g_server->tcpquota,
> > --                              &client->tcpquota);
> > -+    result = tcpconn_init(client, false);
> > -     if (result != ISC_R_SUCCESS) {
> > --                    bool exit;
> > -+            bool exit;
> > -
> > --                    ns_client_log(client, NS_LOGCATEGORY_CLIENT,
> > --                                  NS_LOGMODULE_CLIENT,
> ISC_LOG_DEBUG(1),
> > --                                  "no more TCP clients: %s",
> > --                                  isc_result_totext(result));
> > --
> > --                    /*
> > --                     * We have exceeded the system-wide TCP client
> > --                     * quota.  But, we can't just block this accept
> > --                     * in all cases, because if we did, a heavy TCP
> > --                     * load on other interfaces might cause this
> > --                     * interface to be starved, with no clients able
> > --                     * to accept new connections.
> > --                     *
> > --                     * So, we check here to see if any other clients
> > --                     * are already servicing TCP queries on this
> > --                     * interface (whether accepting, reading, or
> > --                     * processing). If there are at least two
> > --                     * (one reading and one processing a request)
> > --                     * then it's okay *not* to call accept - we
> > --                     * can let this client go inactive and another
> > --                     * one will resume accepting when it's done.
> > --                     *
> > --                     * If there aren't enough active clients on the
> > --                     * interface, then we can be a little bit
> > --                     * flexible about the quota. We'll allow *one*
> > --                     * extra client through to ensure we're listening
> > --                     * on every interface.
> > --                     *
> > --                     * (Note: In practice this means that the real
> > --                     * TCP client quota is tcp-clients plus the
> > --                     * number of listening interfaces plus 2.)
> > --                     */
> > --                    LOCK(&client->interface->lock);
> > --                    exit = (client->interface->ntcpactive > 1);
> > --                    UNLOCK(&client->interface->lock);
> > -+            ns_client_log(client, NS_LOGCATEGORY_CLIENT,
> > -+                          NS_LOGMODULE_CLIENT, ISC_LOG_WARNING,
> > -+                          "TCP client quota reached: %s",
> > -+                          isc_result_totext(result));
> > -
> > --                    if (exit) {
> > --                            client->newstate = NS_CLIENTSTATE_INACTIVE;
> > --                            (void)exit_check(client);
> > --                            return;
> > --                    }
> > -+            /*
> > -+             * We have exceeded the system-wide TCP client quota.  But,
> > -+             * we can't just block this accept in all cases, because if
> > -+             * we did, a heavy TCP load on other interfaces might cause
> > -+             * this interface to be starved, with no clients able to
> > -+             * accept new connections.
> > -+             *
> > -+             * So, we check here to see if any other clients are
> > -+             * already servicing TCP queries on this interface (whether
> > -+             * accepting, reading, or processing). If we find at least
> > -+             * one, then it's okay *not* to call accept - we can let
> this
> > -+             * client go inactive and another will take over when it's
> > -+             * done.
> > -+             *
> > -+             * If there aren't enough active clients on the interface,
> > -+             * then we can be a little bit flexible about the quota.
> > -+             * We'll allow *one* extra client through to ensure we're
> > -+             * listening on every interface; we do this by setting the
> > -+             * 'force' option to tcpconn_init().
> > -+             *
> > -+             * (Note: In practice this means that the real TCP client
> > -+             * quota is tcp-clients plus the number of listening
> > -+             * interfaces plus 1.)
> > -+             */
> > -+            exit = (isc_atomic_xadd(&client->interface->ntcpactive, 0)
> > 0);
> > -+            if (exit) {
> > -+                    client->newstate = NS_CLIENTSTATE_INACTIVE;
> > -+                    (void)exit_check(client);
> > -+                    return;
> > -+            }
> > -
> > --    } else {
> > --            client->tcpattached = true;
> > -+            result = tcpconn_init(client, true);
> > -+            RUNTIME_CHECK(result == ISC_R_SUCCESS);
> > -     }
> > -
> > -     /*
> > --     * By incrementing the interface's ntcpactive counter we signal
> > --     * that there is at least one client servicing TCP queries for the
> > --     * interface.
> > --     *
> > --     * We also make note of the fact in the client itself with the
> > --     * tcpactive flag. This ensures proper accounting by preventing
> > --     * us from accidentally incrementing or decrementing ntcpactive
> > --     * more than once per client object.
> > -+     * If this client was set up using get_client() or get_worker(),
> > -+     * then TCP is already marked active. However, if it was restarted
> > -+     * from exit_check(), it might not be, so we take care of it now.
> > -      */
> > --    if (!client->tcpactive) {
> > --            LOCK(&client->interface->lock);
> > --            client->interface->ntcpactive++;
> > --            UNLOCK(&client->interface->lock);
> > --            client->tcpactive = true;
> > --    }
> > -+    mark_tcp_active(client, true);
> > -
> > -     result = isc_socket_accept(client->tcplistener, client->task,
> > -                                client_newconn, client);
> > -@@ -3549,15 +3511,8 @@ client_accept(ns_client_t *client) {
> > -                              "isc_socket_accept() failed: %s",
> > -                              isc_result_totext(result));
> > -
> > --            tcpquota_disconnect(client);
> > --
> > --            if (client->tcpactive) {
> > --                    LOCK(&client->interface->lock);
> > --                    client->interface->ntcpactive--;
> > --                    UNLOCK(&client->interface->lock);
> > --                    client->tcpactive = false;
> > --            }
> > --
> > -+            tcpconn_detach(client);
> > -+            mark_tcp_active(client, false);
> > -             return;
> > -     }
> > -
> > -@@ -3582,9 +3537,7 @@ client_accept(ns_client_t *client) {
> > -      * listening for connections itself to prevent the interface
> > -      * going dead.
> > -      */
> > --    LOCK(&client->interface->lock);
> > --    client->interface->ntcpaccepting++;
> > --    UNLOCK(&client->interface->lock);
> > -+    isc_atomic_xadd(&client->interface->ntcpaccepting, 1);
> > - }
> > -
> > - static void
> > -@@ -3655,24 +3608,25 @@ ns_client_replace(ns_client_t *client) {
> > -     REQUIRE(client->manager != NULL);
> > -
> > -     tcp = TCP_CLIENT(client);
> > --    if (tcp && client->pipelined) {
> > -+    if (tcp && client->tcpconn != NULL && client->tcpconn->pipelined) {
> > -             result = get_worker(client->manager, client->interface,
> > -                                 client->tcpsocket, client);
> > -     } else {
> > -             result = get_client(client->manager, client->interface,
> > --                                client->dispatch, client, tcp);
> > -+                                client->dispatch, tcp);
> > -
> > --            /*
> > --             * The responsibility for listening for new requests is
> hereby
> > --             * transferred to the new client.  Therefore, the old
> client
> > --             * should refrain from listening for any more requests.
> > --             */
> > --            client->mortal = true;
> > -     }
> > -     if (result != ISC_R_SUCCESS) {
> > -             return (result);
> > -     }
> > -
> > -+    /*
> > -+     * The responsibility for listening for new requests is hereby
> > -+     * transferred to the new client.  Therefore, the old client
> > -+     * should refrain from listening for any more requests.
> > -+     */
> > -+    client->mortal = true;
> > -+
> > -     return (ISC_R_SUCCESS);
> > - }
> > -
> > -@@ -3806,7 +3760,7 @@ ns_clientmgr_destroy(ns_clientmgr_t **managerp) {
> > -
> > - static isc_result_t
> > - get_client(ns_clientmgr_t *manager, ns_interface_t *ifp,
> > --       dns_dispatch_t *disp, ns_client_t *oldclient, bool tcp)
> > -+       dns_dispatch_t *disp, bool tcp)
> > - {
> > -     isc_result_t result = ISC_R_SUCCESS;
> > -     isc_event_t *ev;
> > -@@ -3850,15 +3804,7 @@ get_client(ns_clientmgr_t *manager,
> ns_interface_t *ifp,
> > -     client->dscp = ifp->dscp;
> > -
> > -     if (tcp) {
> > --            client->tcpattached = false;
> > --            if (oldclient != NULL) {
> > --                    client->tcpattached = oldclient->tcpattached;
> > --            }
> > --
> > --            LOCK(&client->interface->lock);
> > --            client->interface->ntcpactive++;
> > --            UNLOCK(&client->interface->lock);
> > --            client->tcpactive = true;
> > -+            mark_tcp_active(client, true);
> > -
> > -             client->attributes |= NS_CLIENTATTR_TCP;
> > -             isc_socket_attach(ifp->tcpsocket,
> > -@@ -3923,16 +3869,14 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock,
> > -     ns_interface_attach(ifp, &client->interface);
> > -     client->newstate = client->state = NS_CLIENTSTATE_WORKING;
> > -     INSIST(client->recursionquota == NULL);
> > --    client->tcpquota = &ns_g_server->tcpquota;
> > --    client->tcpattached = oldclient->tcpattached;
> > -
> > -     client->dscp = ifp->dscp;
> > -
> > -     client->attributes |= NS_CLIENTATTR_TCP;
> > -     client->mortal = true;
> > -
> > --    pipeline_attach(oldclient, client);
> > --    client->pipelined = true;
> > -+    tcpconn_attach(oldclient, client);
> > -+    mark_tcp_active(client, true);
> > -
> > -     isc_socket_attach(ifp->tcpsocket, &client->tcplistener);
> > -     isc_socket_attach(sock, &client->tcpsocket);
> > -@@ -3940,11 +3884,6 @@ get_worker(ns_clientmgr_t *manager,
> ns_interface_t *ifp, isc_socket_t *sock,
> > -     (void)isc_socket_getpeername(client->tcpsocket, &client->peeraddr);
> > -     client->peeraddr_valid = true;
> > -
> > --    LOCK(&client->interface->lock);
> > --    client->interface->ntcpactive++;
> > --    UNLOCK(&client->interface->lock);
> > --    client->tcpactive = true;
> > --
> > -     INSIST(client->tcpmsg_valid == false);
> > -     dns_tcpmsg_init(client->mctx, client->tcpsocket, &client->tcpmsg);
> > -     client->tcpmsg_valid = true;
> > -@@ -3970,8 +3909,7 @@ ns_clientmgr_createclients(ns_clientmgr_t
> *manager, unsigned int n,
> > -     MTRACE("createclients");
> > -
> > -     for (disp = 0; disp < n; disp++) {
> > --            result = get_client(manager, ifp, ifp->udpdispatch[disp],
> > --                                NULL, tcp);
> > -+            result = get_client(manager, ifp, ifp->udpdispatch[disp],
> tcp);
> > -             if (result != ISC_R_SUCCESS)
> > -                     break;
> > -     }
> > -diff --git a/bin/named/include/named/client.h
> b/bin/named/include/named/client.h
> > -index e2c40acd28..969ee4c08f 100644
> > ---- a/bin/named/include/named/client.h
> > -+++ b/bin/named/include/named/client.h
> > -@@ -78,6 +78,13 @@
> > -  *** Types
> > -  ***/
> > -
> > -+/*% reference-counted TCP connection object */
> > -+typedef struct ns_tcpconn {
> > -+    isc_refcount_t          refs;
> > -+    isc_quota_t             *tcpquota;
> > -+    bool                    pipelined;
> > -+} ns_tcpconn_t;
> > -+
> > - /*% nameserver client structure */
> > - struct ns_client {
> > -     unsigned int            magic;
> > -@@ -131,10 +138,7 @@ struct ns_client {
> > -     dns_name_t              signername;   /*%< [T]SIG key name */
> > -     dns_name_t              *signer;      /*%< NULL if not valid sig */
> > -     bool                    mortal;       /*%< Die after handling
> request */
> > --    bool                    pipelined;   /*%< TCP queries not in
> sequence */
> > --    isc_refcount_t          *pipeline_refs;
> > --    isc_quota_t             *tcpquota;
> > --    bool                    tcpattached;
> > -+    ns_tcpconn_t            *tcpconn;
> > -     isc_quota_t             *recursionquota;
> > -     ns_interface_t          *interface;
> > -
> > -diff --git a/bin/named/include/named/interfacemgr.h
> b/bin/named/include/named/interfacemgr.h
> > -index 61b08826a6..3535ef22a8 100644
> > ---- a/bin/named/include/named/interfacemgr.h
> > -+++ b/bin/named/include/named/interfacemgr.h
> > -@@ -9,8 +9,6 @@
> > -  * information regarding copyright ownership.
> > -  */
> > -
> > --/* $Id: interfacemgr.h,v 1.35 2011/07/28 23:47:58 tbox Exp $ */
> > --
> > - #ifndef NAMED_INTERFACEMGR_H
> > - #define NAMED_INTERFACEMGR_H 1
> > -
> > -@@ -77,11 +75,11 @@ struct ns_interface {
> > -                                             /*%< UDP dispatchers. */
> > -     isc_socket_t *          tcpsocket;      /*%< TCP socket. */
> > -     isc_dscp_t              dscp;           /*%< "listen-on" DSCP
> value */
> > --    int                     ntcpaccepting;  /*%< Number of clients
> > -+    int32_t                 ntcpaccepting;  /*%< Number of clients
> > -                                                  ready to accept new
> > -                                                  TCP connections on
> this
> > -                                                  interface */
> > --    int                     ntcpactive;     /*%< Number of clients
> > -+    int32_t                 ntcpactive;     /*%< Number of clients
> > -                                                  servicing TCP queries
> > -                                                  (whether accepting or
> > -                                                  connected) */
> > -diff --git a/bin/named/interfacemgr.c b/bin/named/interfacemgr.c
> > -index 955096ef47..d9f6df5802 100644
> > ---- a/bin/named/interfacemgr.c
> > -+++ b/bin/named/interfacemgr.c
> > -@@ -388,6 +388,7 @@ ns_interface_create(ns_interfacemgr_t *mgr,
> isc_sockaddr_t *addr,
> > -      */
> > -     ifp->ntcpaccepting = 0;
> > -     ifp->ntcpactive = 0;
> > -+
> > -     ifp->nudpdispatch = 0;
> > -
> > -     ifp->dscp = -1;
> > -diff --git a/lib/isc/include/isc/quota.h b/lib/isc/include/isc/quota.h
> > -index b9bf59877a..36c5830242 100644
> > ---- a/lib/isc/include/isc/quota.h
> > -+++ b/lib/isc/include/isc/quota.h
> > -@@ -100,6 +100,13 @@ isc_quota_attach(isc_quota_t *quota, isc_quota_t
> **p);
> > -  * quota if successful (ISC_R_SUCCESS or ISC_R_SOFTQUOTA).
> > -  */
> > -
> > -+isc_result_t
> > -+isc_quota_force(isc_quota_t *quota, isc_quota_t **p);
> > -+/*%<
> > -+ * Like isc_quota_attach, but will attach '*p' to the quota
> > -+ * even if the hard quota has been exceeded.
> > -+ */
> > -+
> > - void
> > - isc_quota_detach(isc_quota_t **p);
> > - /*%<
> > -diff --git a/lib/isc/quota.c b/lib/isc/quota.c
> > -index 3ddff0d875..556a61f21d 100644
> > ---- a/lib/isc/quota.c
> > -+++ b/lib/isc/quota.c
> > -@@ -74,20 +74,39 @@ isc_quota_release(isc_quota_t *quota) {
> > -     UNLOCK(&quota->lock);
> > - }
> > -
> > --isc_result_t
> > --isc_quota_attach(isc_quota_t *quota, isc_quota_t **p)
> > --{
> > -+static isc_result_t
> > -+doattach(isc_quota_t *quota, isc_quota_t **p, bool force) {
> > -     isc_result_t result;
> > --    INSIST(p != NULL && *p == NULL);
> > -+    REQUIRE(p != NULL && *p == NULL);
> > -+
> > -     result = isc_quota_reserve(quota);
> > --    if (result == ISC_R_SUCCESS || result == ISC_R_SOFTQUOTA)
> > -+    if (result == ISC_R_SUCCESS || result == ISC_R_SOFTQUOTA) {
> > -+            *p = quota;
> > -+    } else if (result == ISC_R_QUOTA && force) {
> > -+            /* attach anyway */
> > -+            LOCK(&quota->lock);
> > -+            quota->used++;
> > -+            UNLOCK(&quota->lock);
> > -+
> > -             *p = quota;
> > -+            result = ISC_R_SUCCESS;
> > -+    }
> > -+
> > -     return (result);
> > - }
> > -
> > -+isc_result_t
> > -+isc_quota_attach(isc_quota_t *quota, isc_quota_t **p) {
> > -+    return (doattach(quota, p, false));
> > -+}
> > -+
> > -+isc_result_t
> > -+isc_quota_force(isc_quota_t *quota, isc_quota_t **p) {
> > -+    return (doattach(quota, p, true));
> > -+}
> > -+
> > - void
> > --isc_quota_detach(isc_quota_t **p)
> > --{
> > -+isc_quota_detach(isc_quota_t **p) {
> > -     INSIST(p != NULL && *p != NULL);
> > -     isc_quota_release(*p);
> > -     *p = NULL;
> > -diff --git a/lib/isc/win32/libisc.def.in b/lib/isc/win32/libisc.def.in
> > -index a82facec0f..7b9f23d776 100644
> > ---- a/lib/isc/win32/libisc.def.in
> > -+++ b/lib/isc/win32/libisc.def.in
> > -@@ -519,6 +519,7 @@ isc_portset_removerange
> > - isc_quota_attach
> > - isc_quota_destroy
> > - isc_quota_detach
> > -+isc_quota_force
> > - isc_quota_init
> > - isc_quota_max
> > - isc_quota_release
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
> b/meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
> > deleted file mode 100644
> > index 3821d185012..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
> > +++ /dev/null
> > @@ -1,80 +0,0 @@
> > -Backport patch to fix CVE-2018-5743.
> > -
> > -Ref:
> > -https://security-tracker.debian.org/tracker/CVE-2018-5743
> > -
> > -CVE: CVE-2018-5743
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/59434b9]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From 59434b987e8eb436b08c24e559ee094c4e939daa Mon Sep 17 00:00:00 2001
> > -From: Evan Hunt <each@isc.org>
> > -Date: Fri, 5 Apr 2019 16:26:19 -0700
> > -Subject: [PATCH 6/6] restore allowance for tcp-clients < interfaces
> > -
> > -in the "refactor tcpquota and pipeline refs" commit, the counting
> > -of active interfaces was tightened in such a way that named could
> > -fail to listen on an interface if there were more interfaces than
> > -tcp-clients. when checking the quota to start accepting on an
> > -interface, if the number of active clients was above zero, then
> > -it was presumed that some other client was able to handle accepting
> > -new connections. this, however, ignored the fact that the current client
> > -could be included in that count, so if the quota was already exceeded
> > -before all the interfaces were listening, some interfaces would never
> > -listen.
> > -
> > -we now check whether the current client has been marked active; if so,
> > -then the number of active clients on the interface must be greater
> > -than 1, not 0.
> > -
> > -(cherry picked from commit 0b4e2cd4c3192ba88569dd344f542a8cc43742b5)
> > -(cherry picked from commit d01023aaac35543daffbdf48464e320150235d41)
> > ----
> > - bin/named/client.c      | 8 +++++---
> > - doc/arm/Bv9ARM-book.xml | 3 ++-
> > - 2 files changed, 7 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/bin/named/client.c b/bin/named/client.c
> > -index d826ab32bf..845326abc0 100644
> > ---- a/bin/named/client.c
> > -+++ b/bin/named/client.c
> > -@@ -3464,8 +3464,9 @@ client_accept(ns_client_t *client) {
> > -              *
> > -              * So, we check here to see if any other clients are
> > -              * already servicing TCP queries on this interface (whether
> > --             * accepting, reading, or processing). If we find at least
> > --             * one, then it's okay *not* to call accept - we can let
> this
> > -+             * accepting, reading, or processing). If we find that at
> > -+             * least one client other than this one is active, then
> > -+             * it's okay *not* to call accept - we can let this
> > -              * client go inactive and another will take over when it's
> > -              * done.
> > -              *
> > -@@ -3479,7 +3480,8 @@ client_accept(ns_client_t *client) {
> > -              * quota is tcp-clients plus the number of listening
> > -              * interfaces plus 1.)
> > -              */
> > --            exit = (isc_atomic_xadd(&client->interface->ntcpactive, 0)
> > 0);
> > -+            exit = (isc_atomic_xadd(&client->interface->ntcpactive, 0)
> >
> > -+                    (client->tcpactive ? 1 : 0));
> > -             if (exit) {
> > -                     client->newstate = NS_CLIENTSTATE_INACTIVE;
> > -                     (void)exit_check(client);
> > -diff --git a/doc/arm/Bv9ARM-book.xml b/doc/arm/Bv9ARM-book.xml
> > -index 381768d540..9c76d3cd6f 100644
> > ---- a/doc/arm/Bv9ARM-book.xml
> > -+++ b/doc/arm/Bv9ARM-book.xml
> > -@@ -8493,7 +8493,8 @@ avoid-v6-udp-ports { 40000; range 50000 60000; };
> > -             <para>
> > -               The number of file descriptors reserved for TCP, stdio,
> > -               etc.  This needs to be big enough to cover the number of
> > --              interfaces <command>named</command> listens on,
> <command>tcp-clients</command> as well as
> > -+              interfaces <command>named</command> listens on plus
> > -+              <command>tcp-clients</command>, as well as
> > -               to provide room for outgoing TCP queries and incoming
> zone
> > -               transfers.  The default is <literal>512</literal>.
> > -               The minimum value is <literal>128</literal> and the
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
> b/meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
> > deleted file mode 100644
> > index 1a84eca58a7..00000000000
> > ---
> a/meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
> > +++ /dev/null
> > @@ -1,140 +0,0 @@
> > -Backport commit to fix compile error on arm caused by commits which are
> > -to fix CVE-2018-5743.
> > -
> > -CVE: CVE-2018-5743
> > -Upstream-Status: Backport [
> https://gitlab.isc.org/isc-projects/bind9/commit/ef49780]
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From ef49780d30d3ddc5735cfc32561b678a634fa72f Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@sury.org>
> > -Date: Wed, 17 Apr 2019 15:22:27 +0200
> > -Subject: [PATCH] Replace atomic operations in bin/named/client.c with
> > - isc_refcount reference counting
> > -
> > ----
> > - bin/named/client.c                     | 18 +++++++-----------
> > - bin/named/include/named/interfacemgr.h |  5 +++--
> > - bin/named/interfacemgr.c               |  7 +++++--
> > - 3 files changed, 15 insertions(+), 15 deletions(-)
> > -
> > -diff --git a/bin/named/client.c b/bin/named/client.c
> > -index 845326abc0..29fecadca8 100644
> > ---- a/bin/named/client.c
> > -+++ b/bin/named/client.c
> > -@@ -402,12 +402,10 @@ tcpconn_detach(ns_client_t *client) {
> > - static void
> > - mark_tcp_active(ns_client_t *client, bool active) {
> > -     if (active && !client->tcpactive) {
> > --            isc_atomic_xadd(&client->interface->ntcpactive, 1);
> > -+            isc_refcount_increment0(&client->interface->ntcpactive,
> NULL);
> > -             client->tcpactive = active;
> > -     } else if (!active && client->tcpactive) {
> > --            uint32_t old =
> > --                    isc_atomic_xadd(&client->interface->ntcpactive,
> -1);
> > --            INSIST(old > 0);
> > -+            isc_refcount_decrement(&client->interface->ntcpactive,
> NULL);
> > -             client->tcpactive = active;
> > -     }
> > - }
> > -@@ -554,7 +552,7 @@ exit_check(ns_client_t *client) {
> > -             if (client->mortal && TCP_CLIENT(client) &&
> > -                 client->newstate != NS_CLIENTSTATE_FREED &&
> > -                 !ns_g_clienttest &&
> > --                isc_atomic_xadd(&client->interface->ntcpaccepting, 0)
> == 0)
> > -+
> isc_refcount_current(&client->interface->ntcpaccepting) == 0)
> > -             {
> > -                     /* Nobody else is accepting */
> > -                     client->mortal = false;
> > -@@ -3328,7 +3326,6 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -     isc_result_t result;
> > -     ns_client_t *client = event->ev_arg;
> > -     isc_socket_newconnev_t *nevent = (isc_socket_newconnev_t *)event;
> > --    uint32_t old;
> > -
> > -     REQUIRE(event->ev_type == ISC_SOCKEVENT_NEWCONN);
> > -     REQUIRE(NS_CLIENT_VALID(client));
> > -@@ -3348,8 +3345,7 @@ client_newconn(isc_task_t *task, isc_event_t
> *event) {
> > -     INSIST(client->naccepts == 1);
> > -     client->naccepts--;
> > -
> > --    old = isc_atomic_xadd(&client->interface->ntcpaccepting, -1);
> > --    INSIST(old > 0);
> > -+    isc_refcount_decrement(&client->interface->ntcpaccepting, NULL);
> > -
> > -     /*
> > -      * We must take ownership of the new socket before the exit
> > -@@ -3480,8 +3476,8 @@ client_accept(ns_client_t *client) {
> > -              * quota is tcp-clients plus the number of listening
> > -              * interfaces plus 1.)
> > -              */
> > --            exit = (isc_atomic_xadd(&client->interface->ntcpactive, 0)
> >
> > --                    (client->tcpactive ? 1 : 0));
> > -+            exit =
> (isc_refcount_current(&client->interface->ntcpactive) >
> > -+                    (client->tcpactive ? 1U : 0U));
> > -             if (exit) {
> > -                     client->newstate = NS_CLIENTSTATE_INACTIVE;
> > -                     (void)exit_check(client);
> > -@@ -3539,7 +3535,7 @@ client_accept(ns_client_t *client) {
> > -      * listening for connections itself to prevent the interface
> > -      * going dead.
> > -      */
> > --    isc_atomic_xadd(&client->interface->ntcpaccepting, 1);
> > -+    isc_refcount_increment0(&client->interface->ntcpaccepting, NULL);
> > - }
> > -
> > - static void
> > -diff --git a/bin/named/include/named/interfacemgr.h
> b/bin/named/include/named/interfacemgr.h
> > -index 3535ef22a8..6e10f210fd 100644
> > ---- a/bin/named/include/named/interfacemgr.h
> > -+++ b/bin/named/include/named/interfacemgr.h
> > -@@ -45,6 +45,7 @@
> > - #include <isc/magic.h>
> > - #include <isc/mem.h>
> > - #include <isc/socket.h>
> > -+#include <isc/refcount.h>
> > -
> > - #include <dns/result.h>
> > -
> > -@@ -75,11 +76,11 @@ struct ns_interface {
> > -                                             /*%< UDP dispatchers. */
> > -     isc_socket_t *          tcpsocket;      /*%< TCP socket. */
> > -     isc_dscp_t              dscp;           /*%< "listen-on" DSCP
> value */
> > --    int32_t                 ntcpaccepting;  /*%< Number of clients
> > -+    isc_refcount_t          ntcpaccepting;  /*%< Number of clients
> > -                                                  ready to accept new
> > -                                                  TCP connections on
> this
> > -                                                  interface */
> > --    int32_t                 ntcpactive;     /*%< Number of clients
> > -+    isc_refcount_t          ntcpactive;     /*%< Number of clients
> > -                                                  servicing TCP queries
> > -                                                  (whether accepting or
> > -                                                  connected) */
> > -diff --git a/bin/named/interfacemgr.c b/bin/named/interfacemgr.c
> > -index d9f6df5802..135533be6b 100644
> > ---- a/bin/named/interfacemgr.c
> > -+++ b/bin/named/interfacemgr.c
> > -@@ -386,8 +386,8 @@ ns_interface_create(ns_interfacemgr_t *mgr,
> isc_sockaddr_t *addr,
> > -      * connections will be handled in parallel even though there is
> > -      * only one client initially.
> > -      */
> > --    ifp->ntcpaccepting = 0;
> > --    ifp->ntcpactive = 0;
> > -+    isc_refcount_init(&ifp->ntcpaccepting, 0);
> > -+    isc_refcount_init(&ifp->ntcpactive, 0);
> > -
> > -     ifp->nudpdispatch = 0;
> > -
> > -@@ -618,6 +618,9 @@ ns_interface_destroy(ns_interface_t *ifp) {
> > -
> > -     ns_interfacemgr_detach(&ifp->mgr);
> > -
> > -+    isc_refcount_destroy(&ifp->ntcpactive);
> > -+    isc_refcount_destroy(&ifp->ntcpaccepting);
> > -+
> > -     ifp->magic = 0;
> > -     isc_mem_put(mctx, ifp, sizeof(*ifp));
> > - }
> > ---
> > -2.20.1
> > -
> > diff --git
> a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> > index 37e210e6da9..84559e5f378 100644
> > ---
> a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> > +++
> b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> > @@ -1,4 +1,4 @@
> > -From 9473d29843579802e96b0293a3e953fed93de82c Mon Sep 17 00:00:00 2001
> > +From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 2001
> >  From: Paul Gortmaker <paul.gortmaker@windriver.com>
> >  Date: Tue, 9 Jun 2015 11:22:00 -0400
> >  Subject: [PATCH] bind: ensure searching for json headers searches
> sysroot
> > @@ -27,15 +27,16 @@ to make use of the combination some day.
> >
> >  Upstream-Status: Inappropriate [OE Specific]
> >  Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > +
> >  ---
> > - configure.in | 2 +-
> > + configure.ac | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -Index: bind-9.11.3/configure.in
> > -===================================================================
> > ---- bind-9.11.3.orig/configure.in
> > -+++ bind-9.11.3/configure.in
> > -@@ -2574,7 +2574,7 @@ case "$use_libjson" in
> > +diff --git a/configure.ac b/configure.ac
> > +index 17392fd..e85a5c6 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -2449,7 +2449,7 @@ case "$use_libjson" in
> >               libjson_libs=""
> >               ;;
> >       auto|yes)
> > diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> b/meta/recipes-connectivity/bind/bind_9.11.13.bb
> > similarity index 86%
> > rename from meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> > rename to meta/recipes-connectivity/bind/bind_9.11.13.bb
> > index 0897706346b..338d6c717a6 100644
> > --- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> > +++ b/meta/recipes-connectivity/bind/bind_9.11.13.bb
> > @@ -15,23 +15,13 @@ SRC_URI = "
> https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
> >             file://make-etc-initd-bind-stop-work.patch \
> >             file://init.d-add-support-for-read-only-rootfs.patch \
> >
>  file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
> > -           file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
> > -           file://0001-lib-dns-gen.c-fix-too-long-error.patch \
> >
>  file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
> >
>  file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
> >             file://0001-avoid-start-failure-with-bind-user.patch \
> > -           file://0001-bind-fix-CVE-2019-6471.patch \
> > -           file://0001-fix-enforcement-of-tcp-clients-v1.patch \
> > -           file://0002-tcp-clients-could-still-be-exceeded-v2.patch \
> > -
>  file://0003-use-reference-counter-for-pipeline-groups-v3.patch \
> > -
>  file://0004-better-tcpquota-accounting-and-client-mortality-chec.patch \
> > -
>  file://0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch \
> > -
>  file://0006-restore-allowance-for-tcp-clients-interfaces.patch \
> > -
>  file://0007-Replace-atomic-operations-in-bin-named-client.c-with.patch \
> > -"
> > -
> > -SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
> > -SRC_URI[sha256sum] =
> "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
> > +           "
> > +
> > +SRC_URI[md5sum] = "17de0d024ab1eac377f1c2854dc25057"
> > +SRC_URI[sha256sum] =
> "fd3f3cc9fcfcdaa752db35eb24598afa1fdcc2509d3227fc90a8631b7b400f7d"
> >
> >  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
> >  # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible
> by 4
>
>

--000000000000a2f74805986664f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 27 Nov 2019 at 21:25, akuster808 =
&lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
<br>
On 11/27/19 8:40 AM, Alexander Kanavin wrote:<br>
&gt; Drop backports.<br>
&gt;<br>
&gt; Drop 0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch and<br>
&gt; 0001-lib-dns-gen.c-fix-too-long-error.patch as problem is fixed<br>
<br>
Bug fix only?<br></blockquote><div><br></div><div>I don&#39;t think so, the=
re are some new features as well:</div><div><a href=3D"https://downloads.is=
c.org/isc/bind9/9.11.13/RELEASE-NOTES-bind-9.11.13.html">https://downloads.=
isc.org/isc/bind9/9.11.13/RELEASE-NOTES-bind-9.11.13.html</a></div><div><br=
></div><div>Alex<br></div><div><br></div><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
-armin<br>
&gt; upstream.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bind/0001-bind-fix-CVE-2019-6471.patch=C2=A0 =C2=A0 |=C2=A0 =
64 --<br>
&gt;=C2=A0 ....in-remove-useless-L-use_openssl-lib.patch |=C2=A0 18 +-<br>
&gt;=C2=A0 ...01-fix-enforcement-of-tcp-clients-v1.patch |=C2=A0 60 --<br>
&gt;=C2=A0 ...c-extend-DIRNAMESIZE-from-256-to-512.patch |=C2=A0 22 -<br>
&gt;=C2=A0 ...001-lib-dns-gen.c-fix-too-long-error.patch |=C2=A0 31 -<br>
&gt;=C2=A0 ...p-clients-could-still-be-exceeded-v2.patch | 670 ------------=
-<br>
&gt;=C2=A0 ...rence-counter-for-pipeline-groups-v3.patch | 278 ------<br>
&gt;=C2=A0 ...accounting-and-client-mortality-chec.patch | 512 ----------<b=
r>
&gt;=C2=A0 ...a-and-pipeline-refs-allow-special-ca.patch | 911 ------------=
------<br>
&gt;=C2=A0 ...allowance-for-tcp-clients-interfaces.patch |=C2=A0 80 --<br>
&gt;=C2=A0 ...perations-in-bin-named-client.c-with.patch | 140 ---<br>
&gt;=C2=A0 ...ching-for-json-headers-searches-sysr.patch |=C2=A0 15 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://bind_9.11.5-P4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">bind_9.11.5-P4.bb</a> =3D&gt; <a href=3D"http://bind_9.11.13=
.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.13.bb</a>}=C2=A0 =C2=A0=
 |=C2=A0 18 +-<br>
&gt;=C2=A0 13 files changed, 20 insertions(+), 2799 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-bind=
-fix-CVE-2019-6471.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-fix-=
enforcement-of-tcp-clients-v1.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-gen.=
c-extend-DIRNAMESIZE-from-256-to-512.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-lib-=
dns-gen.c-fix-too-long-error.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0002-tcp-=
clients-could-still-be-exceeded-v2.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0003-use-=
reference-counter-for-pipeline-groups-v3.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0004-bett=
er-tcpquota-accounting-and-client-mortality-chec.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0005-refa=
ctor-tcpquota-and-pipeline-refs-allow-special-ca.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0006-rest=
ore-allowance-for-tcp-clients-interfaces.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/bind/bind/0007-Repl=
ace-atomic-operations-in-bin-named-client.c-with.patch<br>
&gt;=C2=A0 rename meta/recipes-connectivity/bind/{<a href=3D"http://bind_9.=
11.5-P4.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.5-P4.bb</a> =3D&=
gt; <a href=3D"http://bind_9.11.13.bb" rel=3D"noreferrer" target=3D"_blank"=
>bind_9.11.13.bb</a>} (86%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-201=
9-6471.patch b/meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6=
471.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 2fed99e1bba..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.=
patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,64 +0,0 @@<br>
&gt; -Backport patch to fix CVE-2019-6471.<br>
&gt; -<br>
&gt; -Ref:<br>
&gt; -<a href=3D"https://security-tracker.debian.org/tracker/CVE-2019-6471"=
 rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/t=
racker/CVE-2019-6471</a><br>
&gt; -<br>
&gt; -CVE: CVE-2019-6471<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/3a9c7bb" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/3a9c7bb</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From 3a9c7bb80d4a609b86427406d9dd783199920b5b Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Mark Andrews &lt;<a href=3D"mailto:marka@isc.org" target=3D"_bl=
ank">marka@isc.org</a>&gt;<br>
&gt; -Date: Tue, 19 Mar 2019 14:14:21 +1100<br>
&gt; -Subject: [PATCH] move item_out test inside lock in dns_dispatch_getne=
xt()<br>
&gt; -<br>
&gt; -(cherry picked from commit 60c42f849d520564ed42e5ed0ba46b4b69c07712)<=
br>
&gt; ----<br>
&gt; - lib/dns/dispatch.c | 12 ++++++++----<br>
&gt; - 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/lib/dns/dispatch.c b/lib/dns/dispatch.c<br>
&gt; -index 408beda367..3278db4a07 100644<br>
&gt; ---- a/lib/dns/dispatch.c<br>
&gt; -+++ b/lib/dns/dispatch.c<br>
&gt; -@@ -134,7 +134,7 @@ struct dns_dispentry {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_task_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*task;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_taskaction_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 action;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*arg;<br>
&gt; --=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 item_out;<br>
&gt; -+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 item_out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dispsocket_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *dispsocket;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LIST(dns_dispatchevent_t)=C2=A0 =C2=A0items;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK(dns_dispentry_t)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0link;<br>
&gt; -@@ -3422,13 +3422,14 @@ dns_dispatch_getnext(dns_dispentry_t *resp, d=
ns_dispatchevent_t **sockevent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0disp =3D resp-&gt;disp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(VALID_DISPATCH(disp));<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 REQUIRE(resp-&gt;item_out =3D=3D true);<br>
&gt; --=C2=A0 =C2=A0 resp-&gt;item_out =3D false;<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ev =3D *sockevent;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*sockevent =3D NULL;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0LOCK(&amp;disp-&gt;lock);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(resp-&gt;item_out =3D=3D true);<br>
&gt; -+=C2=A0 =C2=A0 resp-&gt;item_out =3D false;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (ev-&gt;buffer.base !=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_buffer(disp, ev-=
&gt;buffer.base, ev-&gt;buffer.length);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0free_devent(disp, ev);<br>
&gt; -@@ -3573,6 +3574,9 @@ dns_dispatch_removeresponse(dns_dispentry_t **r=
esp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_task_send(disp-&g=
t;task[0], &amp;disp-&gt;ctlevent);<br>
&gt; - }<br>
&gt; - <br>
&gt; -+/*<br>
&gt; -+ * disp must be locked.<br>
&gt; -+ */<br>
&gt; - static void<br>
&gt; - do_cancel(dns_dispatch_t *disp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_dispatchevent_t *ev;<br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-rem=
ove-useless-L-use_openssl-lib.patch b/meta/recipes-connectivity/bind/bind/0=
001-configure.in-remove-useless-L-use_openssl-lib.patch<br>
&gt; index 871bb2a5f6c..9d31b980807 100644<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-use=
less-L-use_openssl-lib.patch<br>
&gt; +++ b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-use=
less-L-use_openssl-lib.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 950867d9fd3f690e271c8c807b6eed144b2935b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 2325a92f1896a2a7f586611686801b41fbc91b50 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 27 Aug 2018 15:00:51 +0800<br>
&gt;=C2=A0 Subject: [PATCH] <a href=3D"http://configure.in" rel=3D"noreferr=
er" target=3D"_blank">configure.in</a>: remove useless `-L$use_openssl/lib&=
#39;<br>
&gt; @@ -10,15 +10,16 @@ and helpful for clean up host build path in isc-co=
nfig.sh<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windr=
iver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt; - <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a> | 2 +-<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt; -diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
&gt; -index 54efc55..76ac0eb 100644<br>
&gt; ---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
&gt; -+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
&gt; -@@ -1691,7 +1691,7 @@ If you don&#39;t want OpenSSL, use --without-op=
enssl])<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index e85a5c6..2bbfc58 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -1631,7 +1631,7 @@ If you don&#39;t want OpenSSL, use --without-op=
enssl])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*)<br>
&gt; @@ -27,6 +28,3 @@ index 54efc55..76ac0eb 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; --- <br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0001-fix-enforcement-=
of-tcp-clients-v1.patch b/meta/recipes-connectivity/bind/bind/0001-fix-enfo=
rcement-of-tcp-clients-v1.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 48ae125f845..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-=
clients-v1.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,60 +0,0 @@<br>
&gt; -Backport patch to fix CVE-2018-5743.<br>
&gt; -<br>
&gt; -Ref:<br>
&gt; -<a href=3D"https://security-tracker.debian.org/tracker/CVE-2018-5743"=
 rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/t=
racker/CVE-2018-5743</a><br>
&gt; -<br>
&gt; -CVE: CVE-2018-5743<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/ec2d50d" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/ec2d50d</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From ec2d50da8d81814640e28593d912f4b96c7efece Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Witold=3D20Kr=3DC4=3D99cicki?=3D &lt;<a href=3D"mai=
lto:wpk@isc.org" target=3D"_blank">wpk@isc.org</a>&gt;<br>
&gt; -Date: Thu, 3 Jan 2019 14:17:43 +0100<br>
&gt; -Subject: [PATCH 1/6] fix enforcement of tcp-clients (v1)<br>
&gt; -<br>
&gt; -tcp-clients settings could be exceeded in some cases by<br>
&gt; -creating more and more active TCP clients that are over<br>
&gt; -the set quota limit, which in the end could lead to a<br>
&gt; -DoS attack by e.g. exhaustion of file descriptors.<br>
&gt; -<br>
&gt; -If TCP client we&#39;re closing went over the quota (so it&#39;s<br>
&gt; -not attached to a quota) mark it as mortal - so that it<br>
&gt; -will be destroyed and not set up to listen for new<br>
&gt; -connections - unless it&#39;s the last client for a specific<br>
&gt; -interface.<br>
&gt; -<br>
&gt; -(cherry picked from commit f97131d21b97381cef72b971b157345c1f9b4115)<=
br>
&gt; -(cherry picked from commit 9689ffc485df8f971f0ad81ab8ab1f5389493776)<=
br>
&gt; ----<br>
&gt; - bin/named/client.c | 13 ++++++++++++-<br>
&gt; - 1 file changed, 12 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/bin/named/client.c b/bin/named/client.c<br>
&gt; -index d482da7121..0739dd48af 100644<br>
&gt; ---- a/bin/named/client.c<br>
&gt; -+++ b/bin/named/client.c<br>
&gt; -@@ -421,8 +421,19 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;tcpsocket);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_quota_detach(&amp;client-&gt;tcpquota);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* We went over quota with this client, we don&#39;t<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* want to restart listening unless this is the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* last client on this interface, which is<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* checked later.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (TCP_CLIENT(client)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;mortal =3D true;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;timers=
et) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(void)isc_timer_reset(client-&gt;timer,<br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIR=
NAMESIZE-from-256-to-512.patch b/meta/recipes-connectivity/bind/bind/0001-g=
en.c-extend-DIRNAMESIZE-from-256-to-512.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a8d601dcaa7..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZ=
E-from-256-to-512.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,22 +0,0 @@<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Subject: gen.c: extend DIRNAMESIZE from 256 to 512<br>
&gt; -<br>
&gt; -Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - lib/dns/gen.c | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -Index: bind-9.11.3/lib/dns/gen.c<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- bind-9.11.3.orig/lib/dns/gen.c<br>
&gt; -+++ bind-9.11.3/lib/dns/gen.c<br>
&gt; -@@ -130,7 +130,7 @@ static const char copyright[] =3D<br>
&gt; - #define TYPECLASSBUF (TYPECLASSLEN + 1)<br>
&gt; - #define TYPECLASSFMT &quot;%&quot; STR(TYPECLASSLEN) &quot;[-0-9a-z]=
_%d&quot;<br>
&gt; - #define ATTRIBUTESIZE 256<br>
&gt; --#define DIRNAMESIZE 256<br>
&gt; -+#define DIRNAMESIZE 512<br>
&gt; - <br>
&gt; - static struct cc {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct cc *next;<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fi=
x-too-long-error.patch b/meta/recipes-connectivity/bind/bind/0001-lib-dns-g=
en.c-fix-too-long-error.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 01874a44076..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-l=
ong-error.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,31 +0,0 @@<br>
&gt; -From 5bc3167a8b714ec0c4a3f1c7f3b9411296ec0a23 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" ta=
rget=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; -Date: Wed, 16 Sep 2015 20:23:47 -0700<br>
&gt; -Subject: [PATCH] lib/dns/gen.c: fix too long error<br>
&gt; -<br>
&gt; -The 512 is a little short when build in deep dir, and cause &quot;too=
 long&quot;<br>
&gt; -error, use PATH_MAX if defined.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - lib/dns/gen.c |=C2=A0 =C2=A0 4 ++++<br>
&gt; - 1 file changed, 4 insertions(+)<br>
&gt; -<br>
&gt; -Index: bind-9.11.3/lib/dns/gen.c<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- bind-9.11.3.orig/lib/dns/gen.c<br>
&gt; -+++ bind-9.11.3/lib/dns/gen.c<br>
&gt; -@@ -130,7 +130,11 @@ static const char copyright[] =3D<br>
&gt; - #define TYPECLASSBUF (TYPECLASSLEN + 1)<br>
&gt; - #define TYPECLASSFMT &quot;%&quot; STR(TYPECLASSLEN) &quot;[-0-9a-z]=
_%d&quot;<br>
&gt; - #define ATTRIBUTESIZE 256<br>
&gt; -+#ifdef PATH_MAX<br>
&gt; -+#define DIRNAMESIZE PATH_MAX<br>
&gt; -+#else<br>
&gt; - #define DIRNAMESIZE 512<br>
&gt; -+#endif<br>
&gt; - <br>
&gt; - static struct cc {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct cc *next;<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0002-tcp-clients-coul=
d-still-be-exceeded-v2.patch b/meta/recipes-connectivity/bind/bind/0002-tcp=
-clients-could-still-be-exceeded-v2.patch<br>
&gt; deleted file mode 100644<br>
&gt; index ca4e8b1a662..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still=
-be-exceeded-v2.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,670 +0,0 @@<br>
&gt; -Backport patch to fix CVE-2018-5743.<br>
&gt; -<br>
&gt; -Ref:<br>
&gt; -<a href=3D"https://security-tracker.debian.org/tracker/CVE-2018-5743"=
 rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/t=
racker/CVE-2018-5743</a><br>
&gt; -<br>
&gt; -CVE: CVE-2018-5743<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/719f604" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/719f604</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From 719f604e3fad5b7479bd14e2fa0ef4413f0a8fdc Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Witold=3D20Kr=3DC4=3D99cicki?=3D &lt;<a href=3D"mai=
lto:wpk@isc.org" target=3D"_blank">wpk@isc.org</a>&gt;<br>
&gt; -Date: Fri, 4 Jan 2019 12:50:51 +0100<br>
&gt; -Subject: [PATCH 2/6] tcp-clients could still be exceeded (v2)<br>
&gt; -<br>
&gt; -the TCP client quota could still be ineffective under some<br>
&gt; -circumstances.=C2=A0 this change:<br>
&gt; -<br>
&gt; -- improves quota accounting to ensure that TCP clients are<br>
&gt; -=C2=A0 properly limited, while still guaranteeing that at least one c=
lient<br>
&gt; -=C2=A0 is always available to serve TCP connections on each interface=
.<br>
&gt; -- uses more descriptive names and removes one (ntcptarget) that<br>
&gt; -=C2=A0 was no longer needed<br>
&gt; -- adds comments<br>
&gt; -<br>
&gt; -(cherry picked from commit 924651f1d5e605cd186d03f4f7340bcc54d77cc2)<=
br>
&gt; -(cherry picked from commit 55a7a458e30e47874d34bdf1079eb863a0512396)<=
br>
&gt; ----<br>
&gt; - bin/named/client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 311 ++++++++++++++++++++-----<br>
&gt; - bin/named/include/named/client.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
4 +-<br>
&gt; - bin/named/include/named/interfacemgr.h |=C2=A0 11 +-<br>
&gt; - bin/named/interfacemgr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; - 4 files changed, 267 insertions(+), 77 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/bin/named/client.c b/bin/named/client.c<br>
&gt; -index 0739dd48af..a7b49a0f71 100644<br>
&gt; ---- a/bin/named/client.c<br>
&gt; -+++ b/bin/named/client.c<br>
&gt; -@@ -246,10 +246,11 @@ static void ns_client_dumpmessage(ns_client_t *=
client, const char *reason);<br>
&gt; - static isc_result_t get_client(ns_clientmgr_t *manager, ns_interface=
_t *ifp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dns_dispatch_t *disp, bool tcp);<br>
&gt; - static isc_result_t get_worker(ns_clientmgr_t *manager, ns_interface=
_t *ifp,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_socket_t *sock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_socket_t *sock, ns_client_t *oldclient);=
<br>
&gt; - static inline bool<br>
&gt; --allowed(isc_netaddr_t *addr, dns_name_t *signer, isc_netaddr_t *ecs_=
addr,<br>
&gt; --=C2=A0 =C2=A0 uint8_t ecs_addrlen, uint8_t *ecs_scope, dns_acl_t *ac=
l);<br>
&gt; -+allowed(isc_netaddr_t *addr, dns_name_t *signer,<br>
&gt; -+=C2=A0 =C2=A0 isc_netaddr_t *ecs_addr, uint8_t ecs_addrlen,<br>
&gt; -+=C2=A0 =C2=A0 uint8_t *ecs_scope, dns_acl_t *acl)<br>
&gt; - static void compute_cookie(ns_client_t *client, uint32_t when,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 uint32_t nonce, const unsigned char *secret,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 isc_buffer_t *buf);<br>
&gt; -@@ -405,8 +406,11 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;rec=
ursionquota =3D=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;new=
state &lt;=3D NS_CLIENTSTATE_READY);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nreads &gt;=
 0)<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nreads &gt;=
 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dns_tcpmsg_cancelread(&amp;client-&gt;tcpmsg);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;nreads=
 !=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* Still waiting for read cancel completion. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -@@ -416,25 +420,58 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dns_tcpmsg_invalidate(&amp;client-&gt;tcpmsg);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;tcpmsg_valid =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;tcpsoc=
ket !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0CTRACE(&quot;closetcp&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;tcpsocket);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;tcpactive) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;interface-&gt;ntcpactive =
&gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpactive--;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;tcpquo=
ta !=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 isc_quota_detach(&amp;client-&gt;tcpquota);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* We went over quota with this client, we don&#39;t<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* want to restart listening unless this is the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* last client on this interface, which is<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* checked later.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* If we are not in a pipeline group, or<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* we are the last client in the group, detach from<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* tcpquota; otherwise, transfer the quota to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* another client in the same group.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (TCP_CLIENT(client)) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;mortal =3D true;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!ISC_LINK_LINKED(client, glink) ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (client-&gt;glink.next =3D=3D NULL &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;glink.prev =3D=3D NULL))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_quota_detach(&amp;client-&gt;tcpquota);=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if (client-&gt;glink.next !=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;glink.next-&gt;tcpquota =
=3D=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.next-&gt;tcpquota =3D clie=
nt-&gt;tcpquota;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;glink.prev-&gt;tcpquota =
=3D=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.prev-&gt;tcpquota =3D clie=
nt-&gt;tcpquota;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Unlink from pipeli=
ne group.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ISC_LINK_LINKED(client=
, glink)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;glink.next !=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.next-&gt;glink.prev =3D<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glin=
k.prev;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;glink.prev !=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.prev-&gt;glink.next =3D<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glin=
k.next;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ISC_LINK_INIT(client, glink);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;timers=
et) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(void)isc_timer_reset(client-&gt;timer,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0isc_timertype_inactive,<br>
&gt; -@@ -455,15 +492,16 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * that already.=C2=
=A0 Check whether this client needs to remain<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * active and force i=
t to go inactive if not.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* UDP clients go ina=
ctive at this point, but TCP clients<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may remain active =
if we have fewer active TCP client<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* objects than desir=
ed due to an earlier quota exhaustion.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* UDP clients go ina=
ctive at this point, but a TCP client<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will needs to rema=
in active if no other clients are<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* listening for TCP =
requests on this interface, to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* prevent this inter=
face from going nonresponsive.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;mortal=
 &amp;&amp; TCP_CLIENT(client) &amp;&amp; !ns_g_clienttest) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;interface-&gt;ntcpcurrent &lt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;ntcp=
target)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;interface-&gt;ntcpaccepting =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;mortal =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -472,15 +510,17 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * queue for recyclin=
g.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;mortal=
) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;newstate &gt; NS_CLIENTSTATE_INACTIVE)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;newstate &gt; NS_CLIENTSTATE_INACTIVE) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;newstate =3D NS_CLIENTSTATE_I=
NACTIVE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (NS_CLIENTSTATE_RE=
ADY =3D=3D client-&gt;newstate) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (TCP_CLIENT(client)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_accept(client);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_udprecv(client);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;newstate =3D NS_CLIENTSTATE_MAX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -492,41 +532,57 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We are trying to e=
nter the inactive state.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;naccepts &g=
t; 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;naccepts &g=
t; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_cancel(client-&gt;tcplistener, client-&gt;task,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ISC_S=
OCKCANCEL_ACCEPT);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Still waiting for =
accept cancel completion. */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (! (client-&gt;naccepts=
 =3D=3D 0))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (! (client-&gt;naccepts=
 =3D=3D 0)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Accept cancel is c=
omplete. */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nrecvs &gt;=
 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nrecvs &gt;=
 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_cancel(client-&gt;udpsocket, client-&gt;task,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ISC_S=
OCKCANCEL_RECV);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Still waiting for =
recv cancel completion. */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (! (client-&gt;nrecvs =
=3D=3D 0))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (! (client-&gt;nrecvs =
=3D=3D 0)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Still waiting for =
control event to be delivered */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nctls &gt; =
0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nctls &gt; =
0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Deactivate the client. =
*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;interface)<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ns_interface_detach(&amp;client-&gt;interface);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;nac=
cepts =3D=3D 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;rec=
ursionquota =3D=3D NULL);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcplistener=
 !=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcplistener=
 !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;tcplistener);<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;udpsocket !=
=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;tcpactive) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;interface-&gt;ntcpactive =
&gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpactive--;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;udpsocket !=
=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;udpsocket);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;dispatch !=
=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Deactivate the client. =
*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;interface !=
=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ns_interface_detach(&amp;client-&gt;interface);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;dispatch !=
=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dns_dispatch_detach(&amp;client-&gt;dispatch);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;attributes=
 =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;mortal =3D=
 false;<br>
&gt; -@@ -551,10 +607,13 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;newstate =3D NS_CLIENTSTATE_MAX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!ns_g_clienttest &amp;&amp; manager !=3D NULL &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0!manager-&gt;exiting)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ISC_QUEUE_PUSH(manager-&gt;inactive, cli=
ent,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ilink);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;needshutdown)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;needshutdown) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_task_shutdown(client-&gt;task);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -675,7 +734,6 @@ client_start(isc_task_t *task, isc_event_t *event=
) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - }<br>
&gt; - <br>
&gt; --<br>
&gt; - /*%<br>
&gt; -=C2=A0 * The client&#39;s task has received a shutdown event.<br>
&gt; -=C2=A0 */<br>
&gt; -@@ -2507,17 +2565,12 @@ client_request(isc_task_t *task, isc_event_t =
*event) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Pipeline TCP query processing.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 if (client-&gt;message-&gt;opcode !=3D dns_opcode_quer=
y)<br>
&gt; -+=C2=A0 =C2=A0 if (client-&gt;message-&gt;opcode !=3D dns_opcode_quer=
y) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;pipelined =
=3D false;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (TCP_CLIENT(client) &amp;&amp; client-&gt;pipe=
lined) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D isc_quota_reser=
ve(&amp;ns_g_server-&gt;tcpquota);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result =3D=3D ISC_R_SU=
CCESS)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 result =3D ns_client_replace(client);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D ns_client_repla=
ce(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R=
_SUCCESS) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ns_client_log(client, NS_LOGCATEGORY_CLIENT,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NS_LOGMODULE_CLIENT, I=
SC_LOG_WARNING,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;no more TCP clie=
nts(read): %s&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_result_totext(resu=
lt));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;pipelined =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -3087,6 +3140,7 @@ client_create(ns_clientmgr_t *manager, ns_clien=
t_t **clientp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;filter_aaaa =3D dns_aaaa_ok;<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;needshutdown =3D ns_g_clienttest;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpactive =3D false;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_EVENT_INIT(&amp;client-&gt;ctlevent, sizeof(c=
lient-&gt;ctlevent), 0, NULL,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 NS_EVENT_CLIENTCONTROL, client_start, client, client,<br>
&gt; -@@ -3100,6 +3154,7 @@ client_create(ns_clientmgr_t *manager, ns_clien=
t_t **clientp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;<a href=3D"http://formerrcache.id" rel=
=3D"noreferrer" target=3D"_blank">formerrcache.id</a> =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK_INIT(client, link);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK_INIT(client, rlink);<br>
&gt; -+=C2=A0 =C2=A0 ISC_LINK_INIT(client, glink);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_QLINK_INIT(client, ilink);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;keytag =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;keytag_len =3D 0;<br>
&gt; -@@ -3193,12 +3248,19 @@ client_newconn(isc_task_t *task, isc_event_t =
*event) {<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;state =3D=3D NS_CLIENTSTATE_REA=
DY);<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* The accept() was successful and we&#39;re now =
establishing a new<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* connection. We need to make note of it in the =
client and<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* interface objects so client objects can do the=
 right thing<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* when going inactive in exit_check() (see comme=
nts in<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* client_accept() for details).<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;naccepts =3D=3D 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;naccepts--;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 INSIST(client-&gt;interface-&gt;ntcpcurrent &gt; 0);<b=
r>
&gt; --=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpcurrent--;<br>
&gt; -+=C2=A0 =C2=A0 INSIST(client-&gt;interface-&gt;ntcpaccepting &gt; 0);=
<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpaccepting--;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -@@ -3232,6 +3294,9 @@ client_newconn(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(3),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;accept failed: %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_result_totext(nevent-&gt;result));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 isc_quota_detach(&amp;client-&gt;tcpquota);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (exit_check(client))<br>
&gt; -@@ -3270,18 +3335,12 @@ client_newconn(isc_task_t *task, isc_event_t =
*event) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * deny service to le=
gitimate TCP clients.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;pipelined =
=3D false;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D isc_quota_attac=
h(&amp;ns_g_server-&gt;tcpquota,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;cli=
ent-&gt;tcpquota);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result =3D=3D ISC_R_SU=
CCESS)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 result =3D ns_client_replace(client);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result !=3D ISC_R_SUCC=
ESS) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ns_client_log(client, NS_LOGCATEGORY_CLIENT,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NS_LOGMODULE_CLIENT, I=
SC_LOG_WARNING,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;no more TCP clie=
nts(accept): %s&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_result_totext(resu=
lt));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ns_g_server-&gt=
;keepresporder =3D=3D NULL ||<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0!allowed(&amp;netaddr, NULL, NULL, 0, NULL,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ns_g_server-&gt;keepresporder=
)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D ns_client_repla=
ce(client);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result =3D=3D ISC_R_SU=
CCESS &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (client-&gt;=
sctx-&gt;keepresporder =3D=3D NULL ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!allow=
ed(&amp;netaddr, NULL, NULL, 0, NULL,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ns_g_server-&gt;keepresporder)))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;pipelined =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -3298,12 +3357,80 @@ client_accept(ns_client_t *client) {<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0CTRACE(&quot;accept&quot;);<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* The tcpquota object can only be simultaneously=
 referenced a<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* pre-defined number of times; this is configure=
d by &#39;tcp-clients&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* in named.conf. If we can&#39;t attach to it he=
re, that means the TCP<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* client quota has been exceeded.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 result =3D isc_quota_attach(&amp;client-&gt;sctx-&gt;t=
cpquota,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;client-&gt;tcpquota);<br>
&gt; -+=C2=A0 =C2=A0 if (result !=3D ISC_R_SUCCESS) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool exit;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ns_client_log(client, NS_LOGCATEGORY_CLIENT,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NS_LOGMODULE_CLIENT, I=
SC_LOG_DEBUG(1),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;no more TCP clie=
nts: %s&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_result_totext(resu=
lt));<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* We have exceeded the system-wide TCP client<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* quota.=C2=A0 But, we can&#39;t just block this accept<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* in all cases, because if we did, a heavy TCP<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* load on other interfaces might cause this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* interface to be starved, with no clients able<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* to accept new connections.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* So, we check here to see if any other client<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* is already servicing TCP queries on this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* interface (whether accepting, reading, or<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* processing).<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* If so, then it&#39;s okay *not* to call<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* accept - we can let this client to go inactive<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* and the other one handle the next connection<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* when it&#39;s ready.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* But if not, then we need to be a little bit<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* flexible about the quota. We allow *one* extra<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* TCP client through, to ensure we&#39;re listening on<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* every interface.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* (Note: In practice this means that the *real*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* TCP client quota is tcp-clients plus the number<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* of interfaces.)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit =3D (client-&gt;interface-&gt;ntcpactive &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (exit) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;newstate =3D NS_CLIENTSTATE_INAC=
TIVE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)exit_check(client);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* By incrementing the interface&#39;s ntcpactive=
 counter we signal<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* that there is at least one client servicing TC=
P queries for the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* interface.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* We also make note of the fact in the client it=
self with the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* tcpactive flag. This ensures proper accounting=
 by preventing<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* us from accidentally incrementing or decrement=
ing ntcpactive<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* more than once per client object.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 if (!client-&gt;tcpactive) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;inter=
face-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;n=
tcpactive++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;int=
erface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D t=
rue;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0result =3D isc_socket_accept(client-&gt;tcplisten=
er, client-&gt;task,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_newconn, client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R_SUCCESS) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNEXPECTED_ERROR(__FILE__,=
 __LINE__,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;isc_socket_accept() failed: %s&=
quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_result_totext(result));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * XXXRTH=C2=A0 What =
should we do?=C2=A0 We&#39;re trying to accept but<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0it didn&#39;t work.=C2=A0 If we just give up, then TCP<br>
&gt; -@@ -3311,12 +3438,39 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0For now, we just go idle.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNEXPECTED_ERROR(__FILE__,=
 __LINE__,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;isc_socket_accept() failed: %s&=
quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_result_totext(result));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 isc_quota_detach(&amp;client-&gt;tcpquota);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* The client&#39;s &#39;naccepts&#39; counter in=
dicates that this client has<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* called accept() and is waiting for a new conne=
ction. It should<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* never exceed 1.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;naccepts =3D=3D 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;naccepts++;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* The interface&#39;s &#39;ntcpaccepting&#39; co=
unter is incremented when<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* any client calls accept(), and decremented in =
client_newconn()<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* once the connection is established.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* When the client object is shutting down after =
handling a TCP<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* request (see exit_check()), it looks to see wh=
ether this value is<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* non-zero. If so, that means another client has=
 already called<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* accept() and is waiting to establish the next =
connection, which<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* means the first client is free to go inactive.=
 Otherwise,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* the first client must come back and call accep=
t() again; this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* guarantees there will always be at least one c=
lient listening<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* for new TCP connections on each interface.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpcurrent++;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpaccepting++;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; - }<br>
&gt; - <br>
&gt; -@@ -3390,13 +3544,14 @@ ns_client_replace(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tcp =3D TCP_CLIENT(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (tcp &amp;&amp; client-&gt;pipelined) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D get_worker=
(client-&gt;manager, client-&gt;interface,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpsocket);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpsocket, client)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D get_client=
(client-&gt;manager, client-&gt;interface,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;dispatch, tcp);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 if (result !=3D ISC_R_SUCCESS)<br>
&gt; -+=C2=A0 =C2=A0 if (result !=3D ISC_R_SUCCESS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (result);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * The responsibility for listening for new reque=
sts is hereby<br>
&gt; -@@ -3585,6 +3740,7 @@ get_client(ns_clientmgr_t *manager, ns_interfac=
e_t *ifp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;attributes=
 |=3D NS_CLIENTATTR_TCP;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_socket_attach(ifp=
-&gt;tcpsocket,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;client-&gt;tcplistener);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_socket_t *sock;<b=
r>
&gt; - <br>
&gt; -@@ -3602,7 +3758,8 @@ get_client(ns_clientmgr_t *manager, ns_interfac=
e_t *ifp,<br>
&gt; - }<br>
&gt; - <br>
&gt; - static isc_result_t<br>
&gt; --get_worker(ns_clientmgr_t *manager, ns_interface_t *ifp, isc_socket_=
t *sock)<br>
&gt; -+get_worker(ns_clientmgr_t *manager, ns_interface_t *ifp, isc_socket_=
t *sock,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0ns_client_t *oldclient)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_result_t result =3D ISC_R_SUCCESS;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_event_t *ev;<br>
&gt; -@@ -3610,6 +3767,7 @@ get_worker(ns_clientmgr_t *manager, ns_interfac=
e_t *ifp, isc_socket_t *sock)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0MTRACE(&quot;get worker&quot;);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(manager !=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(oldclient !=3D NULL);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (manager-&gt;exiting)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (ISC_R_SHUTTIN=
GDOWN);<br>
&gt; -@@ -3642,7 +3800,28 @@ get_worker(ns_clientmgr_t *manager, ns_interfa=
ce_t *ifp, isc_socket_t *sock)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_attach(ifp, &amp;client-&gt;interfac=
e);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;newstate =3D client-&gt;state =3D NS_C=
LIENTSTATE_WORKING;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;recursionquota =3D=3D NULL);<br=
>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpquota =3D &amp;ns_g_server-&gt;tcpquota;=
<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* Transfer TCP quota to the new client.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 INSIST(client-&gt;tcpquota =3D=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 INSIST(oldclient-&gt;tcpquota !=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpquota =3D oldclient-&gt;tcpquota;<br>
&gt; -+=C2=A0 =C2=A0 oldclient-&gt;tcpquota =3D NULL;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* Link to a pipeline group, creating it if neede=
d.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 if (!ISC_LINK_LINKED(oldclient, glink)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldclient-&gt;glink.next =
=3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldclient-&gt;glink.prev =
=3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;glink.next =3D oldclient-&gt;glink.next;<br=
>
&gt; -+=C2=A0 =C2=A0 client-&gt;glink.prev =3D oldclient;<br>
&gt; -+=C2=A0 =C2=A0 if (oldclient-&gt;glink.next !=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldclient-&gt;glink.next-&=
gt;glink.prev =3D client;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 oldclient-&gt;glink.next =3D client;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;dscp =3D ifp-&gt;dscp;<br>
&gt; - <br>
&gt; -@@ -3656,6 +3835,12 @@ get_worker(ns_clientmgr_t *manager, ns_interfa=
ce_t *ifp, isc_socket_t *sock)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0(void)isc_socket_getpeername(client-&gt;tcpsocket=
, &amp;client-&gt;peeraddr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;peeraddr_valid =3D true;<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpactive++;<br>
&gt; -+=C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpactive =3D true;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;tcpmsg_valid =3D=3D false);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_tcpmsg_init(client-&gt;mctx, client-&gt;tcpso=
cket, &amp;client-&gt;tcpmsg);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;tcpmsg_valid =3D true;<br>
&gt; -diff --git a/bin/named/include/named/client.h b/bin/named/include/nam=
ed/client.h<br>
&gt; -index b23a7b191d..1f7973f9c5 100644<br>
&gt; ---- a/bin/named/include/named/client.h<br>
&gt; -+++ b/bin/named/include/named/client.h<br>
&gt; -@@ -94,7 +94,8 @@ struct ns_client {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nupdates;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nctls;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0references;<br>
&gt; --=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 needshut=
down;=C2=A0 =C2=A0/*<br>
&gt; -+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tcpactive;<br>
&gt; -+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 needshutdown;=C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * Used by clienttest to get<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * the client to go from<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * inactive to free state<br>
&gt; -@@ -130,9 +131,9 @@ struct ns_client {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_stdtime_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0now;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_time_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tnow;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_name_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 signername;=C2=A0 =C2=A0/*%&lt; [T]SIG key name */<br>
&gt; --=C2=A0 =C2=A0 dns_name_t *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
signer;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; NULL if not valid sig */<br>
&gt; --=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mortal;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; Die after handling request */<br>
&gt; --=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipeline=
d;=C2=A0 =C2=A0/*%&lt; TCP queries not in sequence */<br>
&gt; -+=C2=A0 =C2=A0 dns_name_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *signer;=C2=A0 =C2=A0 =C2=A0 /*%&lt; NULL if not valid sig */<br>
&gt; -+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mortal;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; Die after ha=
ndling request */<br>
&gt; -+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pipelined;=C2=A0 =C2=A0/*%&lt; TCP queries not in sequ=
ence */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*tcpquota;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*recursionquota;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*interface;<br>
&gt; -@@ -143,8 +144,8 @@ struct ns_client {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_sockaddr_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
destsockaddr;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_netaddr_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ecs_addr;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; EDNS client subnet */<br>
&gt; --=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ecs_addrlen;<=
br>
&gt; --=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ecs_scope;<br=
>
&gt; -+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ecs_addrlen;<br>
&gt; -+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ecs_scope;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct in6_pktinfo=C2=A0 =C2=A0 =C2=A0 pktinfo;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_dscp_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dscp;<br>
&gt; -@@ -166,6 +167,7 @@ struct ns_client {<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK(ns_client_t)=C2=A0 =C2=A0link;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK(ns_client_t)=C2=A0 =C2=A0rlink;<br>
&gt; -+=C2=A0 =C2=A0 ISC_LINK(ns_client_t)=C2=A0 =C2=A0glink;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_QLINK(ns_client_t)=C2=A0 ilink;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cookie[8];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 expire;<br>
&gt; -diff --git a/bin/named/include/named/interfacemgr.h b/bin/named/inclu=
de/named/interfacemgr.h<br>
&gt; -index 7d1883e1e8..61b08826a6 100644<br>
&gt; ---- a/bin/named/include/named/interfacemgr.h<br>
&gt; -+++ b/bin/named/include/named/interfacemgr.h<br>
&gt; -@@ -77,9 +77,14 @@ struct ns_interface {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/*%&lt; UDP dispatchers. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_t *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tcpsocket;=C2=A0 =C2=A0 =C2=A0 /*%&lt; TCP socket. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_dscp_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dscp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; &quot;list=
en-on&quot; DSCP value */<br>
&gt; --=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ntcptarget;=C2=A0 =C2=A0 =C2=A0/*%&lt; Desired n=
umber of concurrent<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TCP accepts */<br>
&gt; --=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ntcpcurrent;=C2=A0 =C2=A0 /*%&lt; Current ditto,=
 locked */<br>
&gt; -+=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ntcpaccepting;=C2=A0 /*%&lt; Number of clients<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ready to accept new<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TCP connections on this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface */<br>
&gt; -+=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ntcpactive;=C2=A0 =C2=A0 =C2=A0/*%&lt; Number of=
 clients<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0servicing TCP queries<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(whether accepting or<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connected) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nudpdispatch;=C2=A0 =C2=A0/*%&lt; Number of =
UDP dispatches */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_clientmgr_t *=C2=A0 =C2=A0 =C2=A0 =C2=A0 clien=
tmgr;=C2=A0 =C2=A0 =C2=A0 /*%&lt; Client manager. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK(ns_interface_t) link;<br>
&gt; -diff --git a/bin/named/interfacemgr.c b/bin/named/interfacemgr.c<br>
&gt; -index 419927bf54..955096ef47 100644<br>
&gt; ---- a/bin/named/interfacemgr.c<br>
&gt; -+++ b/bin/named/interfacemgr.c<br>
&gt; -@@ -386,8 +386,8 @@ ns_interface_create(ns_interfacemgr_t *mgr, isc_s=
ockaddr_t *addr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * connections will be handled in parallel even t=
hough there is<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * only one client initially.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 ifp-&gt;ntcptarget =3D 1;<br>
&gt; --=C2=A0 =C2=A0 ifp-&gt;ntcpcurrent =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 ifp-&gt;ntcpaccepting =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 ifp-&gt;ntcpactive =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;nudpdispatch =3D 0;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;dscp =3D -1;<br>
&gt; -@@ -522,9 +522,7 @@ ns_interface_accepttcp(ns_interface_t *ifp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0(void)isc_socket_filter(ifp-&gt;tcpsocket, &quot;=
dataready&quot;);<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 result =3D ns_clientmgr_createclients(ifp-&gt;clientmg=
r,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
fp-&gt;ntcptarget, ifp,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue);<br>
&gt; -+=C2=A0 =C2=A0 result =3D ns_clientmgr_createclients(ifp-&gt;clientmg=
r, 1, ifp, true);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R_SUCCESS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNEXPECTED_ERROR(__FI=
LE__, __LINE__,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;TCP ns_clientmgr_createclients():=
 %s&quot;,<br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0003-use-reference-co=
unter-for-pipeline-groups-v3.patch b/meta/recipes-connectivity/bind/bind/00=
03-use-reference-counter-for-pipeline-groups-v3.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 032cfb8c442..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0003-use-reference-counter-f=
or-pipeline-groups-v3.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,278 +0,0 @@<br>
&gt; -Backport patch to fix CVE-2018-5743.<br>
&gt; -<br>
&gt; -Ref:<br>
&gt; -<a href=3D"https://security-tracker.debian.org/tracker/CVE-2018-5743"=
 rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/t=
racker/CVE-2018-5743</a><br>
&gt; -<br>
&gt; -CVE: CVE-2018-5743<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/366b4e1" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/366b4e1</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From 366b4e1ede8aed690e981e07137cb1cb77879c36 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Micha=3DC5=3D82=3D20K=3DC4=3D99pie=3DC5=3D84?=3D &l=
t;<a href=3D"mailto:michal@isc.org" target=3D"_blank">michal@isc.org</a>&gt=
;<br>
&gt; -Date: Thu, 17 Jan 2019 15:53:38 +0100<br>
&gt; -Subject: [PATCH 3/6] use reference counter for pipeline groups (v3)<b=
r>
&gt; -<br>
&gt; -Track pipeline groups using a shared reference counter<br>
&gt; -instead of a linked list.<br>
&gt; -<br>
&gt; -(cherry picked from commit 513afd33eb17d5dc41a3f0d2d38204ef8c5f6f91)<=
br>
&gt; -(cherry picked from commit 9446629b730c59c4215f08d37fbaf810282fbccb)<=
br>
&gt; ----<br>
&gt; - bin/named/client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 171 ++++++++++++++++++++-----------<br>
&gt; - bin/named/include/named/client.h |=C2=A0 =C2=A02 +-<br>
&gt; - 2 files changed, 110 insertions(+), 63 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/bin/named/client.c b/bin/named/client.c<br>
&gt; -index a7b49a0f71..277656cef0 100644<br>
&gt; ---- a/bin/named/client.c<br>
&gt; -+++ b/bin/named/client.c<br>
&gt; -@@ -299,6 +299,75 @@ ns_client_settimeout(ns_client_t *client, unsign=
ed int seconds) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - }<br>
&gt; - <br>
&gt; -+/*%<br>
&gt; -+ * Allocate a reference counter that will track the number of client=
 structures<br>
&gt; -+ * using the TCP connection that &#39;client&#39; called accept() fo=
r.=C2=A0 This counter<br>
&gt; -+ * will be shared between all client structures associated with this=
 TCP<br>
&gt; -+ * connection.<br>
&gt; -+ */<br>
&gt; -+static void<br>
&gt; -+pipeline_init(ns_client_t *client) {<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_t *refs;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(client-&gt;pipeline_refs =3D=3D NULL);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* A global memory context is used for the alloca=
tion as different<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* client structures may have different memory co=
ntexts assigned and a<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* reference counter allocated here might need to=
 be freed by a<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* different client.=C2=A0 The performance impact=
 caused by memory context<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* contention here is expected to be negligible, =
given that this code<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* is only executed for TCP connections.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 refs =3D isc_mem_allocate(client-&gt;sctx-&gt;mctx, si=
zeof(*refs));<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_init(refs, 1);<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;pipeline_refs =3D refs;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+/*%<br>
&gt; -+ * Increase the count of client structures using the TCP connection =
that<br>
&gt; -+ * &#39;source&#39; is associated with and put a pointer to that cou=
nt in &#39;target&#39;,<br>
&gt; -+ * thus associating it with the same TCP connection.<br>
&gt; -+ */<br>
&gt; -+static void<br>
&gt; -+pipeline_attach(ns_client_t *source, ns_client_t *target) {<br>
&gt; -+=C2=A0 =C2=A0 int old_refs;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(source-&gt;pipeline_refs !=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(target-&gt;pipeline_refs =3D=3D NULL);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 old_refs =3D isc_refcount_increment(source-&gt;pipelin=
e_refs);<br>
&gt; -+=C2=A0 =C2=A0 INSIST(old_refs &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 target-&gt;pipeline_refs =3D source-&gt;pipeline_refs;=
<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+/*%<br>
&gt; -+ * Decrease the count of client structures using the TCP connection =
that<br>
&gt; -+ * &#39;client&#39; is associated with.=C2=A0 If this is the last cl=
ient using this TCP<br>
&gt; -+ * connection, free the reference counter and return true; otherwise=
, return<br>
&gt; -+ * false.<br>
&gt; -+ */<br>
&gt; -+static bool<br>
&gt; -+pipeline_detach(ns_client_t *client) {<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_t *refs;<br>
&gt; -+=C2=A0 =C2=A0 int old_refs;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(client-&gt;pipeline_refs !=3D NULL);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 refs =3D client-&gt;pipeline_refs;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;pipeline_refs =3D NULL;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 old_refs =3D isc_refcount_decrement(refs);<br>
&gt; -+=C2=A0 =C2=A0 INSIST(old_refs &gt; 0);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (old_refs =3D=3D 1) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_mem_free(client-&gt;sc=
tx-&gt;mctx, refs);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (true);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 return (false);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; - /*%<br>
&gt; -=C2=A0 * Check for a deactivation or shutdown request and take approp=
riate<br>
&gt; -=C2=A0 * action.=C2=A0 Returns true if either is in progress; in this=
 case<br>
&gt; -@@ -421,6 +490,40 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;tcpmsg_valid =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;pipeline_refs =3D=3D NULL ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pipeline_detach(client))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Only detach from the TCP client quo=
ta if<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* there are no more client structures=
 using<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this TCP connection.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that we check &#39;pipeline_re=
fs&#39; and not<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &#39;pipelined&#39; because in some=
 cases (e.g.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after receiving a request with an o=
pcode<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* different than QUERY) &#39;pipeline=
d&#39; is set to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* false after the reference counter g=
ets<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* allocated in pipeline_init() and we=
 must<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* still drop our reference as failing=
 to do so<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* would prevent the reference counter=
 itself<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* from being freed.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_quota_detach(&amp;client-&gt;tcpquota);=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There are other client structures u=
sing this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TCP connection, so we cannot detach=
 from the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TCP client quota to prevent excess =
TCP<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* connections from being accepted.=C2=
=A0 However,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this client structure might later b=
e reused<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for accepting new connections and t=
hus must<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* have its &#39;tcpquota&#39; field s=
et to NULL.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;tcpsoc=
ket !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0CTRACE(&quot;closetcp&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;tcpsocket);<br>
&gt; -@@ -434,44 +537,6 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* If we are not in a pipeline group, or<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* we are the last client in the group, detach from<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* tcpquota; otherwise, transfer the quota to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* another client in the same group.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!ISC_LINK_LINKED(client, glink) ||<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (client-&gt;glink.next =3D=3D NULL &amp;&amp;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;glink.prev =3D=3D NULL))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_quota_detach(&amp;client-&gt;tcpquota);=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if (client-&gt;glink.next !=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;glink.next-&gt;tcpquota =
=3D=3D NULL);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.next-&gt;tcpquota =3D clie=
nt-&gt;tcpquota;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;glink.prev-&gt;tcpquota =
=3D=3D NULL);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.prev-&gt;tcpquota =3D clie=
nt-&gt;tcpquota;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Unlink from pipeli=
ne group.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ISC_LINK_LINKED(client=
, glink)) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;glink.next !=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.next-&gt;glink.prev =3D<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glin=
k.prev;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;glink.prev !=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glink.prev-&gt;glink.next =3D<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;glin=
k.next;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ISC_LINK_INIT(client, glink);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;timers=
et) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(void)isc_timer_reset(client-&gt;timer,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0isc_timertype_inactive,<br>
&gt; -@@ -3130,6 +3195,7 @@ client_create(ns_clientmgr_t *manager, ns_clien=
t_t **clientp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_name_init(&amp;client-&gt;signername, NULL);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;mortal =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;pipelined =3D false;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;pipeline_refs =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;tcpquota =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;recursionquota =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;interface =3D NULL;<br>
&gt; -@@ -3154,7 +3220,6 @@ client_create(ns_clientmgr_t *manager, ns_clien=
t_t **clientp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;<a href=3D"http://formerrcache.id" rel=
=3D"noreferrer" target=3D"_blank">formerrcache.id</a> =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK_INIT(client, link);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK_INIT(client, rlink);<br>
&gt; --=C2=A0 =C2=A0 ISC_LINK_INIT(client, glink);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_QLINK_INIT(client, ilink);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;keytag =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;keytag_len =3D 0;<br>
&gt; -@@ -3341,6 +3406,7 @@ client_newconn(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !allow=
ed(&amp;netaddr, NULL, NULL, 0, NULL,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_server-&gt;keepresporder)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pipeline_init(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;pipelined =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -3800,35 +3866,16 @@ get_worker(ns_clientmgr_t *manager, ns_interf=
ace_t *ifp, isc_socket_t *sock,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_attach(ifp, &amp;client-&gt;interfac=
e);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;newstate =3D client-&gt;state =3D NS_C=
LIENTSTATE_WORKING;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;recursionquota =3D=3D NULL);<br=
>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* Transfer TCP quota to the new client.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 INSIST(client-&gt;tcpquota =3D=3D NULL);<br>
&gt; --=C2=A0 =C2=A0 INSIST(oldclient-&gt;tcpquota !=3D NULL);<br>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpquota =3D oldclient-&gt;tcpquota;<br>
&gt; --=C2=A0 =C2=A0 oldclient-&gt;tcpquota =3D NULL;<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* Link to a pipeline group, creating it if neede=
d.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 if (!ISC_LINK_LINKED(oldclient, glink)) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldclient-&gt;glink.next =
=3D NULL;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldclient-&gt;glink.prev =
=3D NULL;<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 client-&gt;glink.next =3D oldclient-&gt;glink.next;<br=
>
&gt; --=C2=A0 =C2=A0 client-&gt;glink.prev =3D oldclient;<br>
&gt; --=C2=A0 =C2=A0 if (oldclient-&gt;glink.next !=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldclient-&gt;glink.next-&=
gt;glink.prev =3D client;<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 oldclient-&gt;glink.next =3D client;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpquota =3D &amp;client-&gt;sctx-&gt;tcpqu=
ota;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;dscp =3D ifp-&gt;dscp;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;attributes |=3D NS_CLIENTATTR_TCP;<br>
&gt; --=C2=A0 =C2=A0 client-&gt;pipelined =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;mortal =3D true;<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 pipeline_attach(oldclient, client);<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;pipelined =3D true;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_attach(ifp-&gt;tcpsocket, &amp;client-=
&gt;tcplistener);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_attach(sock, &amp;client-&gt;tcpsocket=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_setname(client-&gt;tcpsocket, &quot;wo=
rker-tcp&quot;, NULL);<br>
&gt; -diff --git a/bin/named/include/named/client.h b/bin/named/include/nam=
ed/client.h<br>
&gt; -index 1f7973f9c5..aeed9ccdda 100644<br>
&gt; ---- a/bin/named/include/named/client.h<br>
&gt; -+++ b/bin/named/include/named/client.h<br>
&gt; -@@ -134,6 +134,7 @@ struct ns_client {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_name_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *signer;=C2=A0 =C2=A0 =C2=A0 /*%&lt; NULL if not valid sig */<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mortal;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; Die afte=
r handling request */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pipelined;=C2=A0 =C2=A0/*%&lt; TCP queries not in =
sequence */<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pipe=
line_refs;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*tcpquota;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*recursionquota;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*interface;<br>
&gt; -@@ -167,7 +168,6 @@ struct ns_client {<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK(ns_client_t)=C2=A0 =C2=A0link;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_LINK(ns_client_t)=C2=A0 =C2=A0rlink;<br>
&gt; --=C2=A0 =C2=A0 ISC_LINK(ns_client_t)=C2=A0 =C2=A0glink;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ISC_QLINK(ns_client_t)=C2=A0 ilink;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cookie[8];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 expire;<br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0004-better-tcpquota-=
accounting-and-client-mortality-chec.patch b/meta/recipes-connectivity/bind=
/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 034ab13303b..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0004-better-tcpquota-account=
ing-and-client-mortality-chec.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,512 +0,0 @@<br>
&gt; -Backport patch to fix CVE-2018-5743.<br>
&gt; -<br>
&gt; -Ref:<br>
&gt; -<a href=3D"https://security-tracker.debian.org/tracker/CVE-2018-5743"=
 rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/t=
racker/CVE-2018-5743</a><br>
&gt; -<br>
&gt; -CVE: CVE-2018-5743<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/2ab8a08" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/2ab8a08</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From 2ab8a085b3c666f28f1f9229bd6ecb59915b26c3 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Evan Hunt &lt;<a href=3D"mailto:each@isc.org" target=3D"_blank"=
>each@isc.org</a>&gt;<br>
&gt; -Date: Fri, 5 Apr 2019 16:12:18 -0700<br>
&gt; -Subject: [PATCH 4/6] better tcpquota accounting and client mortality =
checks<br>
&gt; -<br>
&gt; -- ensure that tcpactive is cleaned up correctly when accept() fails.<=
br>
&gt; -- set &#39;client-&gt;tcpattached&#39; when the client is attached to=
 the tcpquota.<br>
&gt; -=C2=A0 carry this value on to new clients sharing the same pipeline g=
roup.<br>
&gt; -=C2=A0 don&#39;t call isc_quota_detach() on the tcpquota unless tcpat=
tached is<br>
&gt; -=C2=A0 set.=C2=A0 this way clients that were allowed to accept TCP co=
nnections<br>
&gt; -=C2=A0 despite being over quota (and therefore, were never attached t=
o the<br>
&gt; -=C2=A0 quota) will not inadvertently detach from it and mess up the<b=
r>
&gt; -=C2=A0 accounting.<br>
&gt; -- simplify the code for tcpquota disconnection by using a new functio=
n<br>
&gt; -=C2=A0 tcpquota_disconnect().<br>
&gt; -- before deciding whether to reject a new connection due to quota<br>
&gt; -=C2=A0 exhaustion, check to see whether there are at least two active=
<br>
&gt; -=C2=A0 clients. previously, this was &quot;at least one&quot;, but th=
at could be<br>
&gt; -=C2=A0 insufficient if there was one other client in READING state (w=
aiting<br>
&gt; -=C2=A0 for messages on an open connection) but none in READY (listeni=
ng<br>
&gt; -=C2=A0 for new connections).<br>
&gt; -- before deciding whether a TCP client object can to go inactive, we<=
br>
&gt; -=C2=A0 must ensure there are enough other clients to maintain service=
<br>
&gt; -=C2=A0 afterward -- both accepting new connections and reading/proces=
sing new<br>
&gt; -=C2=A0 queries.=C2=A0 A TCP client can&#39;t shut down unless at leas=
t one<br>
&gt; -=C2=A0 client is accepting new connections and (in the case of pipeli=
ned<br>
&gt; -=C2=A0 clients) at least one additional client is waiting to read.<br=
>
&gt; -<br>
&gt; -(cherry picked from commit c7394738b2445c16f728a88394864dd61baad900)<=
br>
&gt; -(cherry picked from commit e965d5f11d3d0f6d59704e614fceca2093cb1856)<=
br>
&gt; -(cherry picked from commit 87d431161450777ea093821212abfb52d51b36e3)<=
br>
&gt; ----<br>
&gt; - bin/named/client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 244 +++++++++++++++++++------------<br>
&gt; - bin/named/include/named/client.h |=C2=A0 =C2=A03 +-<br>
&gt; - 2 files changed, 152 insertions(+), 95 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/bin/named/client.c b/bin/named/client.c<br>
&gt; -index 277656cef0..61e96dd28c 100644<br>
&gt; ---- a/bin/named/client.c<br>
&gt; -+++ b/bin/named/client.c<br>
&gt; -@@ -244,13 +244,14 @@ static void client_start(isc_task_t *task, isc_=
event_t *event);<br>
&gt; - static void client_request(isc_task_t *task, isc_event_t *event);<br=
>
&gt; - static void ns_client_dumpmessage(ns_client_t *client, const char *r=
eason);<br>
&gt; - static isc_result_t get_client(ns_clientmgr_t *manager, ns_interface=
_t *ifp,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, bool tcp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, ns_client_t *oldclient=
,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool tcp);<br>
&gt; - static isc_result_t get_worker(ns_clientmgr_t *manager, ns_interface=
_t *ifp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_socket_t *sock, ns_client_t *oldclient);<b=
r>
&gt; - static inline bool<br>
&gt; - allowed(isc_netaddr_t *addr, dns_name_t *signer,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_netaddr_t *ecs_addr, uint8_t ecs_addrlen,<br>
&gt; --=C2=A0 =C2=A0 uint8_t *ecs_scope, dns_acl_t *acl)<br>
&gt; -+=C2=A0 =C2=A0 uint8_t *ecs_scope, dns_acl_t *acl);<br>
&gt; - static void compute_cookie(ns_client_t *client, uint32_t when,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 uint32_t nonce, const unsigned char *secret,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 isc_buffer_t *buf);<br>
&gt; -@@ -319,7 +320,7 @@ pipeline_init(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * contention here is expected to be negligible, =
given that this code<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * is only executed for TCP connections.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 refs =3D isc_mem_allocate(client-&gt;sctx-&gt;mctx, si=
zeof(*refs));<br>
&gt; -+=C2=A0 =C2=A0 refs =3D isc_mem_allocate(ns_g_mctx, sizeof(*refs));<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_refcount_init(refs, 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;pipeline_refs =3D refs;<br>
&gt; - }<br>
&gt; -@@ -331,13 +332,13 @@ pipeline_init(ns_client_t *client) {<br>
&gt; -=C2=A0 */<br>
&gt; - static void<br>
&gt; - pipeline_attach(ns_client_t *source, ns_client_t *target) {<br>
&gt; --=C2=A0 =C2=A0 int old_refs;<br>
&gt; -+=C2=A0 =C2=A0 int refs;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(source-&gt;pipeline_refs !=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(target-&gt;pipeline_refs =3D=3D NULL);<br=
>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 old_refs =3D isc_refcount_increment(source-&gt;pipelin=
e_refs);<br>
&gt; --=C2=A0 =C2=A0 INSIST(old_refs &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_increment(source-&gt;pipeline_refs, &amp;=
refs);<br>
&gt; -+=C2=A0 =C2=A0 INSIST(refs &gt; 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0target-&gt;pipeline_refs =3D source-&gt;pipeline_=
refs;<br>
&gt; - }<br>
&gt; - <br>
&gt; -@@ -349,25 +350,51 @@ pipeline_attach(ns_client_t *source, ns_client_=
t *target) {<br>
&gt; -=C2=A0 */<br>
&gt; - static bool<br>
&gt; - pipeline_detach(ns_client_t *client) {<br>
&gt; --=C2=A0 =C2=A0 isc_refcount_t *refs;<br>
&gt; --=C2=A0 =C2=A0 int old_refs;<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_t *refcount;<br>
&gt; -+=C2=A0 =C2=A0 int refs;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(client-&gt;pipeline_refs !=3D NULL);<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 refs =3D client-&gt;pipeline_refs;<br>
&gt; -+=C2=A0 =C2=A0 refcount =3D client-&gt;pipeline_refs;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;pipeline_refs =3D NULL;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 old_refs =3D isc_refcount_decrement(refs);<br>
&gt; --=C2=A0 =C2=A0 INSIST(old_refs &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_decrement(refcount, refs);<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 if (old_refs =3D=3D 1) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_mem_free(client-&gt;sc=
tx-&gt;mctx, refs);<br>
&gt; -+=C2=A0 =C2=A0 if (refs =3D=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_mem_free(ns_g_mctx, re=
fs);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (true);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0return (false);<br>
&gt; - }<br>
&gt; - <br>
&gt; -+/*<br>
&gt; -+ * Detach a client from the TCP client quota if appropriate, and set=
<br>
&gt; -+ * the quota pointer to NULL.<br>
&gt; -+ *<br>
&gt; -+ * Sometimes when the TCP client quota is exhausted but there are no=
 other<br>
&gt; -+ * clients servicing the interface, a client will be allowed to cont=
inue<br>
&gt; -+ * running despite not having been attached to the quota. In this ev=
ent,<br>
&gt; -+ * the TCP quota was never attached to the client, so when the clien=
t (or<br>
&gt; -+ * associated pipeline group) shuts down, the quota must NOT be deta=
ched.<br>
&gt; -+ *<br>
&gt; -+ * Otherwise, if the quota pointer is set, it should be detached. If=
 not<br>
&gt; -+ * set at all, we just return without doing anything.<br>
&gt; -+ */<br>
&gt; -+static void<br>
&gt; -+tcpquota_disconnect(ns_client_t *client) {<br>
&gt; -+=C2=A0 =C2=A0 if (client-&gt;tcpquota =3D=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (client-&gt;tcpattached) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_quota_detach(&amp;clie=
nt-&gt;tcpquota);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpattached =3D=
 false;<br>
&gt; -+=C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NU=
LL;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+}<br>
&gt; -+<br>
&gt; - /*%<br>
&gt; -=C2=A0 * Check for a deactivation or shutdown request and take approp=
riate<br>
&gt; -=C2=A0 * action.=C2=A0 Returns true if either is in progress; in this=
 case<br>
&gt; -@@ -490,38 +517,31 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;tcpmsg_valid =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;pipeline_refs =3D=3D NULL ||<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pipeline_detach(client))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Only detach from the TCP client quo=
ta if<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* there are no more client structures=
 using<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this TCP connection.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that we check &#39;pipeline_re=
fs&#39; and not<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &#39;pipelined&#39; because in some=
 cases (e.g.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after receiving a request with an o=
pcode<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* different than QUERY) &#39;pipeline=
d&#39; is set to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* false after the reference counter g=
ets<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* allocated in pipeline_init() and we=
 must<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* still drop our reference as failing=
 to do so<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* would prevent the reference counter=
 itself<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* from being freed.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_quota_detach(&amp;client-&gt;tcpquota);=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There are other client structures u=
sing this<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TCP connection, so we cannot detach=
 from the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TCP client quota to prevent excess =
TCP<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* connections from being accepted.=C2=
=A0 However,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this client structure might later b=
e reused<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for accepting new connections and t=
hus must<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* have its &#39;tcpquota&#39; field s=
et to NULL.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Detach from pipeli=
ne group and from TCP client quota,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if appropriate.<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* - If no pipeline g=
roup is active, attempt to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0detach=
 from the TCP client quota.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* - If a pipeline gr=
oup is active, detach from it;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0if the=
 return code indicates that there no more<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0client=
s left if this pipeline group, we also detach<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0from t=
he TCP client quota.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* - Otherwise we don=
&#39;t try to detach, we just set the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0TCP qu=
ota pointer to NULL if it wasn&#39;t NULL already.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tcpquota_disconnec=
t() will set tcpquota to NULL, either<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* by detaching it or=
 by assignment, depending on the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* needs of the clien=
t. See the comments on that function<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for further inform=
ation.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;pipeline_re=
fs =3D=3D NULL || pipeline_detach(client)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tcpquota_disconnect(client);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpattached =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;tcpsoc=
ket !=3D NULL) {<br>
&gt; -@@ -544,8 +564,6 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;timerset =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;pipelined =3D f=
alse;<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;peeraddr_v=
alid =3D false;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;state =3D =
NS_CLIENTSTATE_READY;<br>
&gt; -@@ -558,18 +576,27 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * active and force i=
t to go inactive if not.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * UDP clients go ina=
ctive at this point, but a TCP client<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will needs to rema=
in active if no other clients are<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* listening for TCP =
requests on this interface, to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* prevent this inter=
face from going nonresponsive.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may need to remain=
 active and go into ready state if<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* no other clients a=
re available to listen for TCP<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* requests on this i=
nterface or (in the case of pipelined<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clients) to read f=
or additional messages on the current<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* connection.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;mortal=
 &amp;&amp; TCP_CLIENT(client) &amp;&amp; !ns_g_clienttest) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;interface-&gt;ntcpaccepting =3D=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((client-&gt;interface-&gt;ntcpaccepting =3D=3D 0 ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (client-&gt;pipelined &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;interface-&gt;ntcpactive &lt; 2)) &amp;&=
amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 client-&gt;newstate !=3D NS_CLIENTSTATE_FREED)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;mortal =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;newstate =3D NS_CLIENTSTATE_READ=
Y;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;pipelined =3D f=
alse;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We don&#39;t need =
the client; send it to the inactive<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * queue for recyclin=
g.<br>
&gt; -@@ -2634,6 +2661,18 @@ client_request(isc_task_t *task, isc_event_t *=
event) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;pipelined =
=3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (TCP_CLIENT(client) &amp;&amp; client-&gt;pipe=
lined) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We&#39;re pipelini=
ng. Replace the client; the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the replacement ca=
n read the TCP socket looking<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for new messages a=
nd this client can process the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* current message as=
ynchronously.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There are now at l=
east three clients using this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TCP socket - one a=
ccepting new connections,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* one reading an exi=
sting connection to get new<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* messages, and one =
answering the message already<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* received.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ns_client_=
replace(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R=
_SUCCESS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;pipelined =3D false;<br>
&gt; -@@ -3197,6 +3236,7 @@ client_create(ns_clientmgr_t *manager, ns_clien=
t_t **clientp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;pipelined =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;pipeline_refs =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;tcpquota =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpattached =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;recursionquota =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;interface =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;peeraddr_valid =3D false;<br>
&gt; -@@ -3359,9 +3399,7 @@ client_newconn(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(3),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;accept failed: %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_result_totext(nevent-&gt;result));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 isc_quota_detach(&amp;client-&gt;tcpquota);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcpquota_disconnect(client=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (exit_check(client))<br>
&gt; -@@ -3402,7 +3440,7 @@ client_newconn(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;pipelined =
=3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ns_client_=
replace(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result =3D=3D ISC=
_R_SUCCESS &amp;&amp;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (client-&gt;=
sctx-&gt;keepresporder =3D=3D NULL ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ns_g_server=
-&gt;keepresporder =3D=3D NULL ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !allow=
ed(&amp;netaddr, NULL, NULL, 0, NULL,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_server-&gt;keepresporder)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -@@ -3429,7 +3467,7 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * in named.conf. If we can&#39;t attach to it he=
re, that means the TCP<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * client quota has been exceeded.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 result =3D isc_quota_attach(&amp;client-&gt;sctx-&gt;t=
cpquota,<br>
&gt; -+=C2=A0 =C2=A0 result =3D isc_quota_attach(&amp;ns_g_server-&gt;tcpqu=
ota,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;client-&gt;tcpquota);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R_SUCCESS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bool exit;<br>
&gt; -@@ -3447,27 +3485,27 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * interface to be starved, with no clients able<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * to accept new connections.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* So, we check here to see if any other client<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* is already servicing TCP queries on this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* So, we check here to see if any other clients<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* are already servicing TCP queries on this<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * interface (whether accepting, reading, or<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* processing).<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* If so, then it&#39;s okay *not* to call<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* accept - we can let this client to go inactive<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* and the other one handle the next connection<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* when it&#39;s ready.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* processing). If there are at least two<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* (one reading and one processing a request)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* then it&#39;s okay *not* to call accept - we<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* can let this client go inactive and another<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* one will resume accepting when it&#39;s done.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* But if not, then we need to be a little bit<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* flexible about the quota. We allow *one* extra<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* TCP client through, to ensure we&#39;re listening on<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* every interface.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* If there aren&#39;t enough active clients on the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* interface, then we can be a little bit<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* flexible about the quota. We&#39;ll allow *one*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* extra client through to ensure we&#39;re listening<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* on every interface.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* (Note: In practice this means that the *real*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* TCP client quota is tcp-clients plus the number<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* of interfaces.)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* (Note: In practice this means that the real<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* TCP client quota is tcp-clients plus the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* number of listening interfaces plus 2.)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit =3D (client-&gt;interface-&gt;ntcpactive &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit =3D (client-&gt;interface-&gt;ntcpactive &gt; 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (exit) {<br>
&gt; -@@ -3475,6 +3513,9 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)exit_check(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpattached =3D=
 true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -@@ -3507,9 +3548,16 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNEXPECTED_ERROR(__FI=
LE__, __LINE__,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isc_socket_accept() failed: %s&qu=
ot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_result_totext(result));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpquota !=
=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 isc_quota_detach(&amp;client-&gt;tcpquota);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcpquota_disconnect(client=
);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpactive) =
{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;interface-&gt;ntcpactive--;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpactive =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -3527,13 +3575,12 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * once the connection is established.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * When the client object is shutting down after =
handling a TCP<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* request (see exit_check()), it looks to see wh=
ether this value is<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* non-zero. If so, that means another client has=
 already called<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* accept() and is waiting to establish the next =
connection, which<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* means the first client is free to go inactive.=
 Otherwise,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* the first client must come back and call accep=
t() again; this<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* guarantees there will always be at least one c=
lient listening<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* for new TCP connections on each interface.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* request (see exit_check()), if this value is a=
t least one, that<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* means another client has called accept() and i=
s waiting to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* establish the next connection. That means the =
client may be<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* be free to become inactive; otherwise it may n=
eed to start<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* listening for connections itself to prevent th=
e interface<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* going dead.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;interface-&gt;ntcpaccepting++;<br>
&gt; -@@ -3613,19 +3660,19 @@ ns_client_replace(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;tcpsocket, clie=
nt);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D get_client=
(client-&gt;manager, client-&gt;interface,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;dispatch, tcp);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;dispatch, client, =
tcp);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The responsibility=
 for listening for new requests is hereby<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* transferred to the=
 new client.=C2=A0 Therefore, the old client<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* should refrain fro=
m listening for any more requests.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;mortal =3D true=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R_SUCCESS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (result);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* The responsibility for listening for new reque=
sts is hereby<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* transferred to the new client.=C2=A0 Therefore=
, the old client<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* should refrain from listening for any more req=
uests.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 client-&gt;mortal =3D true;<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return (ISC_R_SUCCESS);<br>
&gt; - }<br>
&gt; - <br>
&gt; -@@ -3759,7 +3806,7 @@ ns_clientmgr_destroy(ns_clientmgr_t **managerp)=
 {<br>
&gt; - <br>
&gt; - static isc_result_t<br>
&gt; - get_client(ns_clientmgr_t *manager, ns_interface_t *ifp,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, bool tcp)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, ns_client_t *oldcli=
ent, bool tcp)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_result_t result =3D ISC_R_SUCCESS;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_event_t *ev;<br>
&gt; -@@ -3803,6 +3850,16 @@ get_client(ns_clientmgr_t *manager, ns_interfa=
ce_t *ifp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;dscp =3D ifp-&gt;dscp;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (tcp) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpattached =3D=
 false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldclient !=3D NULL) {=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpattached =3D oldclient-&gt;tcpattached;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;inter=
face-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;n=
tcpactive++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;int=
erface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D t=
rue;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;attributes=
 |=3D NS_CLIENTATTR_TCP;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_socket_attach(ifp=
-&gt;tcpsocket,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;client-&gt;tcplistener);<br>
&gt; -@@ -3866,7 +3923,8 @@ get_worker(ns_clientmgr_t *manager, ns_interfac=
e_t *ifp, isc_socket_t *sock,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_attach(ifp, &amp;client-&gt;interfac=
e);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;newstate =3D client-&gt;state =3D NS_C=
LIENTSTATE_WORKING;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;recursionquota =3D=3D NULL);<br=
>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpquota =3D &amp;client-&gt;sctx-&gt;tcpqu=
ota;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpquota =3D &amp;ns_g_server-&gt;tcpquota;=
<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpattached =3D oldclient-&gt;tcpattached;<=
br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;dscp =3D ifp-&gt;dscp;<br>
&gt; - <br>
&gt; -@@ -3885,7 +3943,6 @@ get_worker(ns_clientmgr_t *manager, ns_interfac=
e_t *ifp, isc_socket_t *sock,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;interface-&gt;ntcpactive++;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;tcpactive =3D true;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;tcpmsg_valid =3D=3D false);<br>
&gt; -@@ -3913,7 +3970,8 @@ ns_clientmgr_createclients(ns_clientmgr_t *mana=
ger, unsigned int n,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0MTRACE(&quot;createclients&quot;);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (disp =3D 0; disp &lt; n; disp++) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D get_client(mana=
ger, ifp, ifp-&gt;udpdispatch[disp], tcp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D get_client(mana=
ger, ifp, ifp-&gt;udpdispatch[disp],<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, tcp);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R=
_SUCCESS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -diff --git a/bin/named/include/named/client.h b/bin/named/include/nam=
ed/client.h<br>
&gt; -index aeed9ccdda..e2c40acd28 100644<br>
&gt; ---- a/bin/named/include/named/client.h<br>
&gt; -+++ b/bin/named/include/named/client.h<br>
&gt; -@@ -9,8 +9,6 @@<br>
&gt; -=C2=A0 * information regarding copyright ownership.<br>
&gt; -=C2=A0 */<br>
&gt; - <br>
&gt; --/* $Id: client.h,v 1.96 2012/01/31 23:47:31 tbox Exp $ */<br>
&gt; --<br>
&gt; - #ifndef NAMED_CLIENT_H<br>
&gt; - #define NAMED_CLIENT_H 1<br>
&gt; - <br>
&gt; -@@ -136,6 +134,7 @@ struct ns_client {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pipelined;=C2=A0 =C2=A0/*%&lt; TCP queries not in =
sequence */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_refcount_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*pipeline_refs;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*tcpquota;<br>
&gt; -+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tcpattached;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*recursionquota;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*interface;<br>
&gt; - <br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0005-refactor-tcpquot=
a-and-pipeline-refs-allow-special-ca.patch b/meta/recipes-connectivity/bind=
/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 987e75bc0ee..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-p=
ipeline-refs-allow-special-ca.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,911 +0,0 @@<br>
&gt; -Backport patch to fix CVE-2018-5743.<br>
&gt; -<br>
&gt; -Ref:<br>
&gt; -<a href=3D"https://security-tracker.debian.org/tracker/CVE-2018-5743"=
 rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/t=
racker/CVE-2018-5743</a><br>
&gt; -<br>
&gt; -CVE: CVE-2018-5743<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/c47ccf6" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/c47ccf6</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From c47ccf630f147378568b33e8fdb7b754f228c346 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Evan Hunt &lt;<a href=3D"mailto:each@isc.org" target=3D"_blank"=
>each@isc.org</a>&gt;<br>
&gt; -Date: Fri, 5 Apr 2019 16:26:05 -0700<br>
&gt; -Subject: [PATCH 5/6] refactor tcpquota and pipeline refs; allow speci=
al-case<br>
&gt; - overrun in isc_quota<br>
&gt; -<br>
&gt; -- if the TCP quota has been exceeded but there are no clients listeni=
ng<br>
&gt; -=C2=A0 for new connections on the interface, we can now force attachm=
ent to the<br>
&gt; -=C2=A0 quota using isc_quota_force(), instead of carrying on with the=
 quota not<br>
&gt; -=C2=A0 attached.<br>
&gt; -- the TCP client quota is now referenced via a reference-counted<br>
&gt; -=C2=A0 &#39;ns_tcpconn&#39; object, one of which is created whenever =
a client begins<br>
&gt; -=C2=A0 listening for new connections, and attached to by members of t=
hat<br>
&gt; -=C2=A0 client&#39;s pipeline group. when the last reference to the tc=
pconn<br>
&gt; -=C2=A0 object is detached, it is freed and the TCP quota slot is rele=
ased.<br>
&gt; -- reduce code duplication by adding mark_tcp_active() function.<br>
&gt; -- convert counters to atomic.<br>
&gt; -<br>
&gt; -(cherry picked from commit 7e8222378ca24f1302a0c1c638565050ab04681b)<=
br>
&gt; -(cherry picked from commit 4939451275722bfda490ea86ca13e84f6bc71e46)<=
br>
&gt; -(cherry picked from commit 13f7c918b8720d890408f678bd73c20e634539d9)<=
br>
&gt; ----<br>
&gt; - bin/named/client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 444 +++++++++++--------------<br>
&gt; - bin/named/include/named/client.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
2 +-<br>
&gt; - bin/named/include/named/interfacemgr.h |=C2=A0 =C2=A06 +-<br>
&gt; - bin/named/interfacemgr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; - lib/isc/include/isc/quota.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A07 +<br>
&gt; - lib/isc/quota.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 +-<br>
&gt; - lib/isc/win32/<a href=3D"http://libisc.def.in" rel=3D"noreferrer" ta=
rget=3D"_blank">libisc.def.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
&gt; - 7 files changed, 236 insertions(+), 268 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/bin/named/client.c b/bin/named/client.c<br>
&gt; -index 61e96dd28c..d826ab32bf 100644<br>
&gt; ---- a/bin/named/client.c<br>
&gt; -+++ b/bin/named/client.c<br>
&gt; -@@ -244,8 +244,7 @@ static void client_start(isc_task_t *task, isc_ev=
ent_t *event);<br>
&gt; - static void client_request(isc_task_t *task, isc_event_t *event);<br=
>
&gt; - static void ns_client_dumpmessage(ns_client_t *client, const char *r=
eason);<br>
&gt; - static isc_result_t get_client(ns_clientmgr_t *manager, ns_interface=
_t *ifp,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, ns_client_t *oldclient=
,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool tcp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, bool tcp);<br>
&gt; - static isc_result_t get_worker(ns_clientmgr_t *manager, ns_interface=
_t *ifp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_socket_t *sock, ns_client_t *oldclient);<b=
r>
&gt; - static inline bool<br>
&gt; -@@ -301,16 +300,32 @@ ns_client_settimeout(ns_client_t *client, unsig=
ned int seconds) {<br>
&gt; - }<br>
&gt; - <br>
&gt; - /*%<br>
&gt; -- * Allocate a reference counter that will track the number of client=
 structures<br>
&gt; -- * using the TCP connection that &#39;client&#39; called accept() fo=
r.=C2=A0 This counter<br>
&gt; -- * will be shared between all client structures associated with this=
 TCP<br>
&gt; -- * connection.<br>
&gt; -+ * Allocate a reference-counted object that will maintain a single p=
ointer to<br>
&gt; -+ * the (also reference-counted) TCP client quota, shared between all=
 the<br>
&gt; -+ * clients processing queries on a single TCP connection, so that al=
l<br>
&gt; -+ * clients sharing the one socket will together consume only one slo=
t in<br>
&gt; -+ * the &#39;tcp-clients&#39; quota.<br>
&gt; -=C2=A0 */<br>
&gt; --static void<br>
&gt; --pipeline_init(ns_client_t *client) {<br>
&gt; --=C2=A0 =C2=A0 isc_refcount_t *refs;<br>
&gt; -+static isc_result_t<br>
&gt; -+tcpconn_init(ns_client_t *client, bool force) {<br>
&gt; -+=C2=A0 =C2=A0 isc_result_t result;<br>
&gt; -+=C2=A0 =C2=A0 isc_quota_t *quota =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 ns_tcpconn_t *tconn =3D NULL;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 REQUIRE(client-&gt;pipeline_refs =3D=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(client-&gt;tcpconn =3D=3D NULL);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* Try to attach to the quota first, so we won&#3=
9;t pointlessly<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* allocate memory for a tcpconn object if we can=
&#39;t get one.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 if (force) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D isc_quota_force=
(&amp;ns_g_server-&gt;tcpquota, &amp;quota);<br>
&gt; -+=C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D isc_quota_attac=
h(&amp;ns_g_server-&gt;tcpquota, &amp;quota);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 if (result !=3D ISC_R_SUCCESS) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (result);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * A global memory context is used for the alloca=
tion as different<br>
&gt; -@@ -320,78 +335,80 @@ pipeline_init(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * contention here is expected to be negligible, =
given that this code<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * is only executed for TCP connections.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 refs =3D isc_mem_allocate(ns_g_mctx, sizeof(*refs));<b=
r>
&gt; --=C2=A0 =C2=A0 isc_refcount_init(refs, 1);<br>
&gt; --=C2=A0 =C2=A0 client-&gt;pipeline_refs =3D refs;<br>
&gt; -+=C2=A0 =C2=A0 tconn =3D isc_mem_allocate(ns_g_mctx, sizeof(*tconn));=
<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_init(&amp;tconn-&gt;refs, 1);<br>
&gt; -+=C2=A0 =C2=A0 tconn-&gt;tcpquota =3D quota;<br>
&gt; -+=C2=A0 =C2=A0 quota =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 tconn-&gt;pipelined =3D false;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpconn =3D tconn;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 return (ISC_R_SUCCESS);<br>
&gt; - }<br>
&gt; - <br>
&gt; - /*%<br>
&gt; -- * Increase the count of client structures using the TCP connection =
that<br>
&gt; -- * &#39;source&#39; is associated with and put a pointer to that cou=
nt in &#39;target&#39;,<br>
&gt; -- * thus associating it with the same TCP connection.<br>
&gt; -+ * Increase the count of client structures sharing the TCP connectio=
n<br>
&gt; -+ * that &#39;source&#39; is associated with; add a pointer to the sa=
me tcpconn<br>
&gt; -+ * to &#39;target&#39;, thus associating it with the same TCP connec=
tion.<br>
&gt; -=C2=A0 */<br>
&gt; - static void<br>
&gt; --pipeline_attach(ns_client_t *source, ns_client_t *target) {<br>
&gt; -+tcpconn_attach(ns_client_t *source, ns_client_t *target) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int refs;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 REQUIRE(source-&gt;pipeline_refs !=3D NULL);<br>
&gt; --=C2=A0 =C2=A0 REQUIRE(target-&gt;pipeline_refs =3D=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(source-&gt;tcpconn !=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(target-&gt;tcpconn =3D=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(source-&gt;tcpconn-&gt;pipelined);<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 isc_refcount_increment(source-&gt;pipeline_refs, &amp;=
refs);<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_increment(&amp;source-&gt;tcpconn-&gt;ref=
s, &amp;refs);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(refs &gt; 1);<br>
&gt; --=C2=A0 =C2=A0 target-&gt;pipeline_refs =3D source-&gt;pipeline_refs;=
<br>
&gt; -+=C2=A0 =C2=A0 target-&gt;tcpconn =3D source-&gt;tcpconn;<br>
&gt; - }<br>
&gt; - <br>
&gt; - /*%<br>
&gt; -- * Decrease the count of client structures using the TCP connection =
that<br>
&gt; -+ * Decrease the count of client structures sharing the TCP connectio=
n that<br>
&gt; -=C2=A0 * &#39;client&#39; is associated with.=C2=A0 If this is the la=
st client using this TCP<br>
&gt; -- * connection, free the reference counter and return true; otherwise=
, return<br>
&gt; -- * false.<br>
&gt; -+ * connection, we detach from the TCP quota and free the tcpconn<br>
&gt; -+ * object. Either way, client-&gt;tcpconn is set to NULL.<br>
&gt; -=C2=A0 */<br>
&gt; --static bool<br>
&gt; --pipeline_detach(ns_client_t *client) {<br>
&gt; --=C2=A0 =C2=A0 isc_refcount_t *refcount;<br>
&gt; -+static void<br>
&gt; -+tcpconn_detach(ns_client_t *client) {<br>
&gt; -+=C2=A0 =C2=A0 ns_tcpconn_t *tconn =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int refs;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 REQUIRE(client-&gt;pipeline_refs !=3D NULL);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 refcount =3D client-&gt;pipeline_refs;<br>
&gt; --=C2=A0 =C2=A0 client-&gt;pipeline_refs =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(client-&gt;tcpconn !=3D NULL);<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 isc_refcount_decrement(refcount, refs);<br>
&gt; -+=C2=A0 =C2=A0 tconn =3D client-&gt;tcpconn;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpconn =3D NULL;<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_decrement(&amp;tconn-&gt;refs, &amp;refs)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (refs =3D=3D 0) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_mem_free(ns_g_mctx, re=
fs);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (true);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_quota_detach(&amp;tcon=
n-&gt;tcpquota);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_mem_free(ns_g_mctx, tc=
onn);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 return (false);<br>
&gt; - }<br>
&gt; - <br>
&gt; --/*<br>
&gt; -- * Detach a client from the TCP client quota if appropriate, and set=
<br>
&gt; -- * the quota pointer to NULL.<br>
&gt; -- *<br>
&gt; -- * Sometimes when the TCP client quota is exhausted but there are no=
 other<br>
&gt; -- * clients servicing the interface, a client will be allowed to cont=
inue<br>
&gt; -- * running despite not having been attached to the quota. In this ev=
ent,<br>
&gt; -- * the TCP quota was never attached to the client, so when the clien=
t (or<br>
&gt; -- * associated pipeline group) shuts down, the quota must NOT be deta=
ched.<br>
&gt; -+/*%<br>
&gt; -+ * Mark a client as active and increment the interface&#39;s &#39;nt=
cpactive&#39;<br>
&gt; -+ * counter, as a signal that there is at least one client servicing<=
br>
&gt; -+ * TCP queries for the interface. If we reach the TCP client quota a=
t<br>
&gt; -+ * some point, this will be used to determine whether a quota overru=
n<br>
&gt; -+ * should be permitted.<br>
&gt; -=C2=A0 *<br>
&gt; -- * Otherwise, if the quota pointer is set, it should be detached. If=
 not<br>
&gt; -- * set at all, we just return without doing anything.<br>
&gt; -+ * Marking the client active with the &#39;tcpactive&#39; flag ensur=
es proper<br>
&gt; -+ * accounting, by preventing us from incrementing or decrementing<br=
>
&gt; -+ * &#39;ntcpactive&#39; more than once per client.<br>
&gt; -=C2=A0 */<br>
&gt; - static void<br>
&gt; --tcpquota_disconnect(ns_client_t *client) {<br>
&gt; --=C2=A0 =C2=A0 if (client-&gt;tcpquota =3D=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 if (client-&gt;tcpattached) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_quota_detach(&amp;clie=
nt-&gt;tcpquota);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpattached =3D=
 false;<br>
&gt; --=C2=A0 =C2=A0 } else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpquota =3D NU=
LL;<br>
&gt; -+mark_tcp_active(ns_client_t *client, bool active) {<br>
&gt; -+=C2=A0 =C2=A0 if (active &amp;&amp; !client-&gt;tcpactive) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_atomic_xadd(&amp;clien=
t-&gt;interface-&gt;ntcpactive, 1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D a=
ctive;<br>
&gt; -+=C2=A0 =C2=A0 } else if (!active &amp;&amp; client-&gt;tcpactive) {<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t old =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 isc_atomic_xadd(&amp;client-&gt;interface-&gt;ntcpactive, -1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(old &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D a=
ctive;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - }<br>
&gt; - <br>
&gt; -@@ -484,7 +501,8 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;rec=
ursionquota =3D=3D NULL);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (NS_CLIENTSTATE_RE=
ADING =3D=3D client-&gt;newstate) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!client-&gt;pipelined) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 INSIST(client-&gt;tcpconn !=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!client-&gt;tcpconn-&gt;pipelined) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_read(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;newstate =3D NS_CLIENTSTATE_M=
AX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (true); /* We&#39;re done. */<br>
&gt; -@@ -507,8 +525,8 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dns_tcpmsg_cancelread(&amp;client-&gt;tcpmsg);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nreads !=3D=
 0) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Still waiting for read cancel completion. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Still waiting for read =
cancel completion. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nreads &gt;=
 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -518,43 +536,45 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Detach from pipeli=
ne group and from TCP client quota,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if appropriate.<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Soon the client wi=
ll be ready to accept a new TCP<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* connection or UDP =
request, but we may have enough<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clients doing that=
 already.=C2=A0 Check whether this client<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* needs to remain ac=
tive and allow it go inactive if<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* not.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* - If no pipeline g=
roup is active, attempt to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0detach=
 from the TCP client quota.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* UDP clients always=
 go inactive at this point, but a TCP<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* client may need to=
 stay active and return to READY<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* state if no other =
clients are available to listen<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for TCP requests o=
n this interface.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* - If a pipeline gr=
oup is active, detach from it;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0if the=
 return code indicates that there no more<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0client=
s left if this pipeline group, we also detach<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0from t=
he TCP client quota.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* - Otherwise we don=
&#39;t try to detach, we just set the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0TCP qu=
ota pointer to NULL if it wasn&#39;t NULL already.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tcpquota_disconnec=
t() will set tcpquota to NULL, either<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* by detaching it or=
 by assignment, depending on the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* needs of the clien=
t. See the comments on that function<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for further inform=
ation.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Regardless, if we&=
#39;re going to FREED state, that means<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the system is shut=
ting down and we don&#39;t need to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* retain clients.<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;pipeline_re=
fs =3D=3D NULL || pipeline_detach(client)) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tcpquota_disconnect(client);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpattached =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;mortal &amp=
;&amp; TCP_CLIENT(client) &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;n=
ewstate !=3D NS_CLIENTSTATE_FREED &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !ns_g_client=
test &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_atomic_x=
add(&amp;client-&gt;interface-&gt;ntcpaccepting, 0) =3D=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Nobody else is accepting */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;mortal =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;newstate =3D NS_CLIENTSTATE_READY;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Detach from TCP co=
nnection and TCP client quota,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if appropriate. If=
 this is the last reference to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the TCP connection=
 in our pipeline group, the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TCP quota slot wil=
l be released.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpconn) {<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tcpconn_detach(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;tcpsoc=
ket !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0CTRACE(&quot;closetcp&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;tcpsocket);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;tcpactive) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;interface-&gt;ntcpactive =
&gt; 0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpactive--;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D false;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 mark_tcp_active(client, false);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;timers=
et) {<br>
&gt; -@@ -567,35 +587,6 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;peeraddr_v=
alid =3D false;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;state =3D =
NS_CLIENTSTATE_READY;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;recursio=
nquota =3D=3D NULL);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Now the client is =
ready to accept a new TCP connection<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* or UDP request, bu=
t we may have enough clients doing<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* that already.=C2=
=A0 Check whether this client needs to remain<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* active and force i=
t to go inactive if not.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* UDP clients go ina=
ctive at this point, but a TCP client<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may need to remain=
 active and go into ready state if<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* no other clients a=
re available to listen for TCP<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* requests on this i=
nterface or (in the case of pipelined<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clients) to read f=
or additional messages on the current<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* connection.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;mortal &amp=
;&amp; TCP_CLIENT(client) &amp;&amp; !ns_g_clienttest) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((client-&gt;interface-&gt;ntcpaccepting =3D=3D 0 ||<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (client-&gt;pipelined &amp;&amp;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;interface-&gt;ntcpactive &lt; 2)) &amp;&=
amp;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 client-&gt;newstate !=3D NS_CLIENTSTATE_FREED)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;mortal =3D false;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;newstate =3D NS_CLIENTSTATE_READ=
Y;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;pipelined =3D f=
alse;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We don&#39;t need =
the client; send it to the inactive<br>
&gt; -@@ -630,7 +621,7 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Still waiting for =
accept cancel completion. */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (! (client-&gt;naccepts=
 =3D=3D 0)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;naccepts &g=
t; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -641,7 +632,7 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Still waiting for =
recv cancel completion. */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (! (client-&gt;nrecvs =
=3D=3D 0)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;nrecvs &gt;=
 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (true);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -654,14 +645,7 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;rec=
ursionquota =3D=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;tcplis=
tener !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;tcplistener);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (client-&gt;tcpactive) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;interface-&gt;ntcpactive =
&gt; 0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpactive--;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D false;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 mark_tcp_active(client, false);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;udpsoc=
ket !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0isc_socket_detach(&amp;client-&gt;udpsocket);<br>
&gt; -@@ -816,7 +800,7 @@ client_start(isc_task_t *task, isc_event_t *event=
) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (TCP_CLIENT(client)) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;pipelined) =
{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpconn !=
=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client_read(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client_accept(client);<br>
&gt; -@@ -2470,6 +2454,7 @@ client_request(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;nrecvs--;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSIST(TCP_CLIENT(cli=
ent));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(client-&gt;tcpconn =
!=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REQUIRE(event-&gt;ev_=
type =3D=3D DNS_EVENT_TCPMSG);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REQUIRE(event-&gt;ev_=
sender =3D=3D &amp;client-&gt;tcpmsg);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffer =3D &amp;clien=
t-&gt;tcpmsg.buffer;<br>
&gt; -@@ -2657,17 +2642,19 @@ client_request(isc_task_t *task, isc_event_t =
*event) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Pipeline TCP query processing.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 if (client-&gt;message-&gt;opcode !=3D dns_opcode_quer=
y) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;pipelined =3D f=
alse;<br>
&gt; -+=C2=A0 =C2=A0 if (TCP_CLIENT(client) &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;message-&gt;opcode !=3D dns_o=
pcode_query)<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpconn-&gt;pip=
elined =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 if (TCP_CLIENT(client) &amp;&amp; client-&gt;pipelined=
) {<br>
&gt; -+=C2=A0 =C2=A0 if (TCP_CLIENT(client) &amp;&amp; client-&gt;tcpconn-&=
gt;pipelined) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We&#39;re pipelini=
ng. Replace the client; the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the replacement ca=
n read the TCP socket looking<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for new messages a=
nd this client can process the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* replacement can re=
ad the TCP socket looking<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for new messages a=
nd this one can process the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * current message as=
ynchronously.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There are now at l=
east three clients using this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There will now be =
at least three clients using this<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * TCP socket - one a=
ccepting new connections,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * one reading an exi=
sting connection to get new<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * messages, and one =
answering the message already<br>
&gt; -@@ -2675,7 +2662,7 @@ client_request(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ns_client_=
replace(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R=
_SUCCESS) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;pipelined =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpconn-&gt;pipelined =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -3233,10 +3220,7 @@ client_create(ns_clientmgr_t *manager, ns_clie=
nt_t **clientp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;signer =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_name_init(&amp;client-&gt;signername, NULL);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;mortal =3D false;<br>
&gt; --=C2=A0 =C2=A0 client-&gt;pipelined =3D false;<br>
&gt; --=C2=A0 =C2=A0 client-&gt;pipeline_refs =3D NULL;<br>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpquota =3D NULL;<br>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpattached =3D false;<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;tcpconn =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;recursionquota =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;interface =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;peeraddr_valid =3D false;<br>
&gt; -@@ -3341,9 +3325,10 @@ client_read(ns_client_t *client) {<br>
&gt; - <br>
&gt; - static void<br>
&gt; - client_newconn(isc_task_t *task, isc_event_t *event) {<br>
&gt; -+=C2=A0 =C2=A0 isc_result_t result;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_client_t *client =3D event-&gt;ev_arg;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_newconnev_t *nevent =3D (isc_socket_ne=
wconnev_t *)event;<br>
&gt; --=C2=A0 =C2=A0 isc_result_t result;<br>
&gt; -+=C2=A0 =C2=A0 uint32_t old;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(event-&gt;ev_type =3D=3D ISC_SOCKEVENT_NE=
WCONN);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(NS_CLIENT_VALID(client));<br>
&gt; -@@ -3363,10 +3348,8 @@ client_newconn(isc_task_t *task, isc_event_t *=
event) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;naccepts =3D=3D 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;naccepts--;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 INSIST(client-&gt;interface-&gt;ntcpaccepting &gt; 0);=
<br>
&gt; --=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpaccepting--;<br>
&gt; --=C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 old =3D isc_atomic_xadd(&amp;client-&gt;interface-&gt;=
ntcpaccepting, -1);<br>
&gt; -+=C2=A0 =C2=A0 INSIST(old &gt; 0);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * We must take ownership of the new socket befor=
e the exit<br>
&gt; -@@ -3399,7 +3382,7 @@ client_newconn(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(3),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;accept failed: %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_result_totext(nevent-&gt;result));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcpquota_disconnect(client=
);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcpconn_detach(client);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (exit_check(client))<br>
&gt; -@@ -3437,15 +3420,13 @@ client_newconn(isc_task_t *task, isc_event_t =
*event) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * telnetting to port=
 53 (once per CPU) will<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * deny service to le=
gitimate TCP clients.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;pipelined =3D f=
alse;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ns_client_=
replace(client);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result =3D=3D ISC=
_R_SUCCESS &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ns_g_s=
erver-&gt;keepresporder =3D=3D NULL ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !allow=
ed(&amp;netaddr, NULL, NULL, 0, NULL,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_server-&gt;keepresporder)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pipeline_init(client);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;pipelined =3D true;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpconn-&gt;pipelined =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_read(client);<=
br>
&gt; -@@ -3462,78 +3443,59 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0CTRACE(&quot;accept&quot;);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* The tcpquota object can only be simultaneously=
 referenced a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* pre-defined number of times; this is configure=
d by &#39;tcp-clients&#39;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* in named.conf. If we can&#39;t attach to it he=
re, that means the TCP<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* client quota has been exceeded.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* Set up a new TCP connection. This means try to=
 attach to the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* TCP client quota (tcp-clients), but fail if we=
&#39;re over quota.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 result =3D isc_quota_attach(&amp;ns_g_server-&gt;tcpqu=
ota,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;client-&gt;tcpquota);<br>
&gt; -+=C2=A0 =C2=A0 result =3D tcpconn_init(client, false);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R_SUCCESS) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool exit;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool exit;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ns_client_log(client, NS_LOGCATEGORY_CLIENT,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NS_LOGMODULE_CLIENT, I=
SC_LOG_DEBUG(1),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;no more TCP clie=
nts: %s&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_result_totext(resu=
lt));<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* We have exceeded the system-wide TCP client<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* quota.=C2=A0 But, we can&#39;t just block this accept<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* in all cases, because if we did, a heavy TCP<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* load on other interfaces might cause this<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* interface to be starved, with no clients able<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* to accept new connections.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* So, we check here to see if any other clients<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* are already servicing TCP queries on this<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* interface (whether accepting, reading, or<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* processing). If there are at least two<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* (one reading and one processing a request)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* then it&#39;s okay *not* to call accept - we<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* can let this client go inactive and another<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* one will resume accepting when it&#39;s done.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* If there aren&#39;t enough active clients on the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* interface, then we can be a little bit<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* flexible about the quota. We&#39;ll allow *one*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* extra client through to ensure we&#39;re listening<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* on every interface.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* (Note: In practice this means that the real<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* TCP client quota is tcp-clients plus the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* number of listening interfaces plus 2.)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit =3D (client-&gt;interface-&gt;ntcpactive &gt; 1);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ns_client_log(client, NS_L=
OGCATEGORY_CLIENT,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NS_LOGMODULE_CLIENT, ISC_LOG_WARNING,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;TCP client quota reached: %s&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 isc_result_totext(result));<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (exit) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;newstate =3D NS_CLIENTSTATE_INAC=
TIVE;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)exit_check(client);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We have exceeded t=
he system-wide TCP client quota.=C2=A0 But,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we can&#39;t just =
block this accept in all cases, because if<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we did, a heavy TC=
P load on other interfaces might cause<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this interface to =
be starved, with no clients able to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* accept new connect=
ions.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* So, we check here =
to see if any other clients are<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* already servicing =
TCP queries on this interface (whether<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* accepting, reading=
, or processing). If we find at least<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* one, then it&#39;s=
 okay *not* to call accept - we can let this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* client go inactive=
 and another will take over when it&#39;s<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* done.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If there aren&#39;=
t enough active clients on the interface,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* then we can be a l=
ittle bit flexible about the quota.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We&#39;ll allow *o=
ne* extra client through to ensure we&#39;re<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* listening on every=
 interface; we do this by setting the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &#39;force&#39; op=
tion to tcpconn_init().<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (Note: In practice=
 this means that the real TCP client<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* quota is tcp-clien=
ts plus the number of listening<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* interfaces plus 1.=
)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit =3D (isc_atomic_xadd(=
&amp;client-&gt;interface-&gt;ntcpactive, 0) &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (exit) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;newstate =3D NS_CLIENTSTATE_INACTIVE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (void)exit_check(client);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 } else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpattached =3D=
 true;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D tcpconn_init(cl=
ient, true);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNTIME_CHECK(result =3D=
=3D ISC_R_SUCCESS);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* By incrementing the interface&#39;s ntcpactive=
 counter we signal<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* that there is at least one client servicing TC=
P queries for the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* interface.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* We also make note of the fact in the client it=
self with the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* tcpactive flag. This ensures proper accounting=
 by preventing<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* us from accidentally incrementing or decrement=
ing ntcpactive<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* more than once per client object.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* If this client was set up using get_client() o=
r get_worker(),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* then TCP is already marked active. However, if=
 it was restarted<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* from exit_check(), it might not be, so we take=
 care of it now.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 if (!client-&gt;tcpactive) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;inter=
face-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;n=
tcpactive++;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;int=
erface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D t=
rue;<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 mark_tcp_active(client, true);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0result =3D isc_socket_accept(client-&gt;tcplisten=
er, client-&gt;task,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_newconn, client);<br>
&gt; -@@ -3549,15 +3511,8 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isc_socket_accept() failed: %s&qu=
ot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_result_totext(result));<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcpquota_disconnect(client=
);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (client-&gt;tcpactive) =
{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;interface-&gt;ntcpactive--;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpactive =3D false;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcpconn_detach(client);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mark_tcp_active(client, fa=
lse);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -@@ -3582,9 +3537,7 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * listening for connections itself to prevent th=
e interface<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * going dead.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpaccepting++;<br>
&gt; --=C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; -+=C2=A0 =C2=A0 isc_atomic_xadd(&amp;client-&gt;interface-&gt;ntcpacce=
pting, 1);<br>
&gt; - }<br>
&gt; - <br>
&gt; - static void<br>
&gt; -@@ -3655,24 +3608,25 @@ ns_client_replace(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(client-&gt;manager !=3D NULL);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0tcp =3D TCP_CLIENT(client);<br>
&gt; --=C2=A0 =C2=A0 if (tcp &amp;&amp; client-&gt;pipelined) {<br>
&gt; -+=C2=A0 =C2=A0 if (tcp &amp;&amp; client-&gt;tcpconn !=3D NULL &amp;&=
amp; client-&gt;tcpconn-&gt;pipelined) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D get_worker=
(client-&gt;manager, client-&gt;interface,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;tcpsocket, clie=
nt);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D get_client=
(client-&gt;manager, client-&gt;interface,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;dispatch, client, =
tcp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;dispatch, tcp);<br=
>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The responsibility=
 for listening for new requests is hereby<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* transferred to the=
 new client.=C2=A0 Therefore, the old client<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* should refrain fro=
m listening for any more requests.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;mortal =3D true=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R_SUCCESS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (result);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* The responsibility for listening for new reque=
sts is hereby<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* transferred to the new client.=C2=A0 Therefore=
, the old client<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* should refrain from listening for any more req=
uests.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 client-&gt;mortal =3D true;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return (ISC_R_SUCCESS);<br>
&gt; - }<br>
&gt; - <br>
&gt; -@@ -3806,7 +3760,7 @@ ns_clientmgr_destroy(ns_clientmgr_t **managerp)=
 {<br>
&gt; - <br>
&gt; - static isc_result_t<br>
&gt; - get_client(ns_clientmgr_t *manager, ns_interface_t *ifp,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, ns_client_t *oldcli=
ent, bool tcp)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0dns_dispatch_t *disp, bool tcp)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_result_t result =3D ISC_R_SUCCESS;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_event_t *ev;<br>
&gt; -@@ -3850,15 +3804,7 @@ get_client(ns_clientmgr_t *manager, ns_interfa=
ce_t *ifp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;dscp =3D ifp-&gt;dscp;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (tcp) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpattached =3D=
 false;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldclient !=3D NULL) {=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;tcpattached =3D oldclient-&gt;tcpattached;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;client-&gt;inter=
face-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;interface-&gt;n=
tcpactive++;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;int=
erface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;tcpactive =3D t=
rue;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mark_tcp_active(client, tr=
ue);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;attributes=
 |=3D NS_CLIENTATTR_TCP;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isc_socket_attach(ifp=
-&gt;tcpsocket,<br>
&gt; -@@ -3923,16 +3869,14 @@ get_worker(ns_clientmgr_t *manager, ns_interf=
ace_t *ifp, isc_socket_t *sock,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_attach(ifp, &amp;client-&gt;interfac=
e);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;newstate =3D client-&gt;state =3D NS_C=
LIENTSTATE_WORKING;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;recursionquota =3D=3D NULL);<br=
>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpquota =3D &amp;ns_g_server-&gt;tcpquota;=
<br>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpattached =3D oldclient-&gt;tcpattached;<=
br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;dscp =3D ifp-&gt;dscp;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;attributes |=3D NS_CLIENTATTR_TCP;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;mortal =3D true;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 pipeline_attach(oldclient, client);<br>
&gt; --=C2=A0 =C2=A0 client-&gt;pipelined =3D true;<br>
&gt; -+=C2=A0 =C2=A0 tcpconn_attach(oldclient, client);<br>
&gt; -+=C2=A0 =C2=A0 mark_tcp_active(client, true);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_attach(ifp-&gt;tcpsocket, &amp;client-=
&gt;tcplistener);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_attach(sock, &amp;client-&gt;tcpsocket=
);<br>
&gt; -@@ -3940,11 +3884,6 @@ get_worker(ns_clientmgr_t *manager, ns_interfa=
ce_t *ifp, isc_socket_t *sock,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0(void)isc_socket_getpeername(client-&gt;tcpsocket=
, &amp;client-&gt;peeraddr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;peeraddr_valid =3D true;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 LOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 client-&gt;interface-&gt;ntcpactive++;<br>
&gt; --=C2=A0 =C2=A0 UNLOCK(&amp;client-&gt;interface-&gt;lock);<br>
&gt; --=C2=A0 =C2=A0 client-&gt;tcpactive =3D true;<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;tcpmsg_valid =3D=3D false);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_tcpmsg_init(client-&gt;mctx, client-&gt;tcpso=
cket, &amp;client-&gt;tcpmsg);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;tcpmsg_valid =3D true;<br>
&gt; -@@ -3970,8 +3909,7 @@ ns_clientmgr_createclients(ns_clientmgr_t *mana=
ger, unsigned int n,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0MTRACE(&quot;createclients&quot;);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (disp =3D 0; disp &lt; n; disp++) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D get_client(mana=
ger, ifp, ifp-&gt;udpdispatch[disp],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, tcp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D get_client(mana=
ger, ifp, ifp-&gt;udpdispatch[disp], tcp);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result !=3D ISC_R=
_SUCCESS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -diff --git a/bin/named/include/named/client.h b/bin/named/include/nam=
ed/client.h<br>
&gt; -index e2c40acd28..969ee4c08f 100644<br>
&gt; ---- a/bin/named/include/named/client.h<br>
&gt; -+++ b/bin/named/include/named/client.h<br>
&gt; -@@ -78,6 +78,13 @@<br>
&gt; -=C2=A0 *** Types<br>
&gt; -=C2=A0 ***/<br>
&gt; - <br>
&gt; -+/*% reference-counted TCP connection object */<br>
&gt; -+typedef struct ns_tcpconn {<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 refs;=
<br>
&gt; -+=C2=A0 =C2=A0 isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*tcpquota;<br>
&gt; -+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pipelined;<br>
&gt; -+} ns_tcpconn_t;<br>
&gt; -+<br>
&gt; - /*% nameserver client structure */<br>
&gt; - struct ns_client {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 magic;<br>
&gt; -@@ -131,10 +138,7 @@ struct ns_client {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_name_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 signername;=C2=A0 =C2=A0/*%&lt; [T]SIG key name */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dns_name_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *signer;=C2=A0 =C2=A0 =C2=A0 /*%&lt; NULL if not valid sig */<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mortal;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; Die afte=
r handling request */<br>
&gt; --=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pipelined;=C2=A0 =C2=A0/*%&lt; TCP queries not in sequ=
ence */<br>
&gt; --=C2=A0 =C2=A0 isc_refcount_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pipe=
line_refs;<br>
&gt; --=C2=A0 =C2=A0 isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*tcpquota;<br>
&gt; --=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tcpattached;<br>
&gt; -+=C2=A0 =C2=A0 ns_tcpconn_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*tcpconn;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*recursionquota;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interface_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*interface;<br>
&gt; - <br>
&gt; -diff --git a/bin/named/include/named/interfacemgr.h b/bin/named/inclu=
de/named/interfacemgr.h<br>
&gt; -index 61b08826a6..3535ef22a8 100644<br>
&gt; ---- a/bin/named/include/named/interfacemgr.h<br>
&gt; -+++ b/bin/named/include/named/interfacemgr.h<br>
&gt; -@@ -9,8 +9,6 @@<br>
&gt; -=C2=A0 * information regarding copyright ownership.<br>
&gt; -=C2=A0 */<br>
&gt; - <br>
&gt; --/* $Id: interfacemgr.h,v 1.35 2011/07/28 23:47:58 tbox Exp $ */<br>
&gt; --<br>
&gt; - #ifndef NAMED_INTERFACEMGR_H<br>
&gt; - #define NAMED_INTERFACEMGR_H 1<br>
&gt; - <br>
&gt; -@@ -77,11 +75,11 @@ struct ns_interface {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/*%&lt; UDP dispatchers. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_t *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tcpsocket;=C2=A0 =C2=A0 =C2=A0 /*%&lt; TCP socket. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_dscp_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dscp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; &quot;list=
en-on&quot; DSCP value */<br>
&gt; --=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ntcpaccepting;=C2=A0 /*%&lt; Number of clients<b=
r>
&gt; -+=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ntcpaccepting;=C2=A0 /*%&lt; Number of clients<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ready to accept new<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCP connections on this<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface */<br>
&gt; --=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ntcpactive;=C2=A0 =C2=A0 =C2=A0/*%&lt; Number of=
 clients<br>
&gt; -+=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ntcpactive;=C2=A0 =C2=A0 =C2=A0/*%&lt; Number of clients<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 servicing TCP queries<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (whether accepting or<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connected) */<br>
&gt; -diff --git a/bin/named/interfacemgr.c b/bin/named/interfacemgr.c<br>
&gt; -index 955096ef47..d9f6df5802 100644<br>
&gt; ---- a/bin/named/interfacemgr.c<br>
&gt; -+++ b/bin/named/interfacemgr.c<br>
&gt; -@@ -388,6 +388,7 @@ ns_interface_create(ns_interfacemgr_t *mgr, isc_s=
ockaddr_t *addr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;ntcpaccepting =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;ntcpactive =3D 0;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;nudpdispatch =3D 0;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;dscp =3D -1;<br>
&gt; -diff --git a/lib/isc/include/isc/quota.h b/lib/isc/include/isc/quota.=
h<br>
&gt; -index b9bf59877a..36c5830242 100644<br>
&gt; ---- a/lib/isc/include/isc/quota.h<br>
&gt; -+++ b/lib/isc/include/isc/quota.h<br>
&gt; -@@ -100,6 +100,13 @@ isc_quota_attach(isc_quota_t *quota, isc_quota_t=
 **p);<br>
&gt; -=C2=A0 * quota if successful (ISC_R_SUCCESS or ISC_R_SOFTQUOTA).<br>
&gt; -=C2=A0 */<br>
&gt; - <br>
&gt; -+isc_result_t<br>
&gt; -+isc_quota_force(isc_quota_t *quota, isc_quota_t **p);<br>
&gt; -+/*%&lt;<br>
&gt; -+ * Like isc_quota_attach, but will attach &#39;*p&#39; to the quota<=
br>
&gt; -+ * even if the hard quota has been exceeded.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; - void<br>
&gt; - isc_quota_detach(isc_quota_t **p);<br>
&gt; - /*%&lt;<br>
&gt; -diff --git a/lib/isc/quota.c b/lib/isc/quota.c<br>
&gt; -index 3ddff0d875..556a61f21d 100644<br>
&gt; ---- a/lib/isc/quota.c<br>
&gt; -+++ b/lib/isc/quota.c<br>
&gt; -@@ -74,20 +74,39 @@ isc_quota_release(isc_quota_t *quota) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0UNLOCK(&amp;quota-&gt;lock);<br>
&gt; - }<br>
&gt; - <br>
&gt; --isc_result_t<br>
&gt; --isc_quota_attach(isc_quota_t *quota, isc_quota_t **p)<br>
&gt; --{<br>
&gt; -+static isc_result_t<br>
&gt; -+doattach(isc_quota_t *quota, isc_quota_t **p, bool force) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_result_t result;<br>
&gt; --=C2=A0 =C2=A0 INSIST(p !=3D NULL &amp;&amp; *p =3D=3D NULL);<br>
&gt; -+=C2=A0 =C2=A0 REQUIRE(p !=3D NULL &amp;&amp; *p =3D=3D NULL);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0result =3D isc_quota_reserve(quota);<br>
&gt; --=C2=A0 =C2=A0 if (result =3D=3D ISC_R_SUCCESS || result =3D=3D ISC_R=
_SOFTQUOTA)<br>
&gt; -+=C2=A0 =C2=A0 if (result =3D=3D ISC_R_SUCCESS || result =3D=3D ISC_R=
_SOFTQUOTA) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p =3D quota;<br>
&gt; -+=C2=A0 =C2=A0 } else if (result =3D=3D ISC_R_QUOTA &amp;&amp; force)=
 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* attach anyway */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOCK(&amp;quota-&gt;lock);=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 quota-&gt;used++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK(&amp;quota-&gt;lock=
);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*p =3D quota;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D ISC_R_SUCCESS;<=
br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return (result);<br>
&gt; - }<br>
&gt; - <br>
&gt; -+isc_result_t<br>
&gt; -+isc_quota_attach(isc_quota_t *quota, isc_quota_t **p) {<br>
&gt; -+=C2=A0 =C2=A0 return (doattach(quota, p, false));<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+isc_result_t<br>
&gt; -+isc_quota_force(isc_quota_t *quota, isc_quota_t **p) {<br>
&gt; -+=C2=A0 =C2=A0 return (doattach(quota, p, true));<br>
&gt; -+}<br>
&gt; -+<br>
&gt; - void<br>
&gt; --isc_quota_detach(isc_quota_t **p)<br>
&gt; --{<br>
&gt; -+isc_quota_detach(isc_quota_t **p) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(p !=3D NULL &amp;&amp; *p !=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_quota_release(*p);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*p =3D NULL;<br>
&gt; -diff --git a/lib/isc/win32/<a href=3D"http://libisc.def.in" rel=3D"no=
referrer" target=3D"_blank">libisc.def.in</a> b/lib/isc/win32/<a href=3D"ht=
tp://libisc.def.in" rel=3D"noreferrer" target=3D"_blank">libisc.def.in</a><=
br>
&gt; -index a82facec0f..7b9f23d776 100644<br>
&gt; ---- a/lib/isc/win32/<a href=3D"http://libisc.def.in" rel=3D"noreferre=
r" target=3D"_blank">libisc.def.in</a><br>
&gt; -+++ b/lib/isc/win32/<a href=3D"http://libisc.def.in" rel=3D"noreferre=
r" target=3D"_blank">libisc.def.in</a><br>
&gt; -@@ -519,6 +519,7 @@ isc_portset_removerange<br>
&gt; - isc_quota_attach<br>
&gt; - isc_quota_destroy<br>
&gt; - isc_quota_detach<br>
&gt; -+isc_quota_force<br>
&gt; - isc_quota_init<br>
&gt; - isc_quota_max<br>
&gt; - isc_quota_release<br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0006-restore-allowanc=
e-for-tcp-clients-interfaces.patch b/meta/recipes-connectivity/bind/bind/00=
06-restore-allowance-for-tcp-clients-interfaces.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3821d185012..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-t=
cp-clients-interfaces.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,80 +0,0 @@<br>
&gt; -Backport patch to fix CVE-2018-5743.<br>
&gt; -<br>
&gt; -Ref:<br>
&gt; -<a href=3D"https://security-tracker.debian.org/tracker/CVE-2018-5743"=
 rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/t=
racker/CVE-2018-5743</a><br>
&gt; -<br>
&gt; -CVE: CVE-2018-5743<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/59434b9" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/59434b9</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From 59434b987e8eb436b08c24e559ee094c4e939daa Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Evan Hunt &lt;<a href=3D"mailto:each@isc.org" target=3D"_blank"=
>each@isc.org</a>&gt;<br>
&gt; -Date: Fri, 5 Apr 2019 16:26:19 -0700<br>
&gt; -Subject: [PATCH 6/6] restore allowance for tcp-clients &lt; interface=
s<br>
&gt; -<br>
&gt; -in the &quot;refactor tcpquota and pipeline refs&quot; commit, the co=
unting<br>
&gt; -of active interfaces was tightened in such a way that named could<br>
&gt; -fail to listen on an interface if there were more interfaces than<br>
&gt; -tcp-clients. when checking the quota to start accepting on an<br>
&gt; -interface, if the number of active clients was above zero, then<br>
&gt; -it was presumed that some other client was able to handle accepting<b=
r>
&gt; -new connections. this, however, ignored the fact that the current cli=
ent<br>
&gt; -could be included in that count, so if the quota was already exceeded=
<br>
&gt; -before all the interfaces were listening, some interfaces would never=
<br>
&gt; -listen.<br>
&gt; -<br>
&gt; -we now check whether the current client has been marked active; if so=
,<br>
&gt; -then the number of active clients on the interface must be greater<br=
>
&gt; -than 1, not 0.<br>
&gt; -<br>
&gt; -(cherry picked from commit 0b4e2cd4c3192ba88569dd344f542a8cc43742b5)<=
br>
&gt; -(cherry picked from commit d01023aaac35543daffbdf48464e320150235d41)<=
br>
&gt; ----<br>
&gt; - bin/named/client.c=C2=A0 =C2=A0 =C2=A0 | 8 +++++---<br>
&gt; - doc/arm/Bv9ARM-book.xml | 3 ++-<br>
&gt; - 2 files changed, 7 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/bin/named/client.c b/bin/named/client.c<br>
&gt; -index d826ab32bf..845326abc0 100644<br>
&gt; ---- a/bin/named/client.c<br>
&gt; -+++ b/bin/named/client.c<br>
&gt; -@@ -3464,8 +3464,9 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * So, we check here =
to see if any other clients are<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * already servicing =
TCP queries on this interface (whether<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* accepting, reading=
, or processing). If we find at least<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* one, then it&#39;s=
 okay *not* to call accept - we can let this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* accepting, reading=
, or processing). If we find that at<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* least one client o=
ther than this one is active, then<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* it&#39;s okay *not=
* to call accept - we can let this<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * client go inactive=
 and another will take over when it&#39;s<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * done.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -@@ -3479,7 +3480,8 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * quota is tcp-clien=
ts plus the number of listening<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * interfaces plus 1.=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit =3D (isc_atomic_xadd(=
&amp;client-&gt;interface-&gt;ntcpactive, 0) &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit =3D (isc_atomic_xadd(=
&amp;client-&gt;interface-&gt;ntcpactive, 0) &gt;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (client-&gt;tcpactive ? 1 : 0));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (exit) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;newstate =3D NS_CLIENTSTATE_INACTIVE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(void)exit_check(client);<br>
&gt; -diff --git a/doc/arm/Bv9ARM-book.xml b/doc/arm/Bv9ARM-book.xml<br>
&gt; -index 381768d540..9c76d3cd6f 100644<br>
&gt; ---- a/doc/arm/Bv9ARM-book.xml<br>
&gt; -+++ b/doc/arm/Bv9ARM-book.xml<br>
&gt; -@@ -8493,7 +8493,8 @@ avoid-v6-udp-ports { 40000; range 50000 60000; =
};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The number of =
file descriptors reserved for TCP, stdio,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0etc.=C2=A0 Thi=
s needs to be big enough to cover the number of<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interfaces &lt;comm=
and&gt;named&lt;/command&gt; listens on, &lt;command&gt;tcp-clients&lt;/com=
mand&gt; as well as<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interfaces &lt;comm=
and&gt;named&lt;/command&gt; listens on plus<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;command&gt;tcp-=
clients&lt;/command&gt;, as well as<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to provide roo=
m for outgoing TCP queries and incoming zone<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0transfers.=C2=
=A0 The default is &lt;literal&gt;512&lt;/literal&gt;.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The minimum va=
lue is &lt;literal&gt;128&lt;/literal&gt; and the<br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/0007-Replace-atomic-o=
perations-in-bin-named-client.c-with.patch b/meta/recipes-connectivity/bind=
/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 1a84eca58a7..00000000000<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operatio=
ns-in-bin-named-client.c-with.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,140 +0,0 @@<br>
&gt; -Backport commit to fix compile error on arm caused by commits which a=
re<br>
&gt; -to fix CVE-2018-5743.<br>
&gt; -<br>
&gt; -CVE: CVE-2018-5743<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.isc.org/isc-proj=
ects/bind9/commit/ef49780" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.isc.org/isc-projects/bind9/commit/ef49780</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From ef49780d30d3ddc5735cfc32561b678a634fa72f Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Ond=3DC5=3D99ej=3D20Sur=3DC3=3DBD?=3D &lt;<a href=
=3D"mailto:ondrej@sury.org" target=3D"_blank">ondrej@sury.org</a>&gt;<br>
&gt; -Date: Wed, 17 Apr 2019 15:22:27 +0200<br>
&gt; -Subject: [PATCH] Replace atomic operations in bin/named/client.c with=
<br>
&gt; - isc_refcount reference counting<br>
&gt; -<br>
&gt; ----<br>
&gt; - bin/named/client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++++-----------<br>
&gt; - bin/named/include/named/interfacemgr.h |=C2=A0 5 +++--<br>
&gt; - bin/named/interfacemgr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 +++++--<br>
&gt; - 3 files changed, 15 insertions(+), 15 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/bin/named/client.c b/bin/named/client.c<br>
&gt; -index 845326abc0..29fecadca8 100644<br>
&gt; ---- a/bin/named/client.c<br>
&gt; -+++ b/bin/named/client.c<br>
&gt; -@@ -402,12 +402,10 @@ tcpconn_detach(ns_client_t *client) {<br>
&gt; - static void<br>
&gt; - mark_tcp_active(ns_client_t *client, bool active) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (active &amp;&amp; !client-&gt;tcpactive) {<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_atomic_xadd(&amp;clien=
t-&gt;interface-&gt;ntcpactive, 1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_refcount_increment0(&a=
mp;client-&gt;interface-&gt;ntcpactive, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;tcpactive =
=3D active;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else if (!active &amp;&amp; client-&gt;tcpactiv=
e) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t old =3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 isc_atomic_xadd(&amp;client-&gt;interface-&gt;ntcpactive, -1);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSIST(old &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_refcount_decrement(&am=
p;client-&gt;interface-&gt;ntcpactive, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;tcpactive =
=3D active;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - }<br>
&gt; -@@ -554,7 +552,7 @@ exit_check(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;mortal=
 &amp;&amp; TCP_CLIENT(client) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-=
&gt;newstate !=3D NS_CLIENTSTATE_FREED &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!ns_g_c=
lienttest &amp;&amp;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_atomic_x=
add(&amp;client-&gt;interface-&gt;ntcpaccepting, 0) =3D=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isc_refcount=
_current(&amp;client-&gt;interface-&gt;ntcpaccepting) =3D=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* Nobody else is accepting */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;mortal =3D false;<br>
&gt; -@@ -3328,7 +3326,6 @@ client_newconn(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_result_t result;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_client_t *client =3D event-&gt;ev_arg;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_newconnev_t *nevent =3D (isc_socket_ne=
wconnev_t *)event;<br>
&gt; --=C2=A0 =C2=A0 uint32_t old;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(event-&gt;ev_type =3D=3D ISC_SOCKEVENT_NE=
WCONN);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0REQUIRE(NS_CLIENT_VALID(client));<br>
&gt; -@@ -3348,8 +3345,7 @@ client_newconn(isc_task_t *task, isc_event_t *e=
vent) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INSIST(client-&gt;naccepts =3D=3D 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0client-&gt;naccepts--;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 old =3D isc_atomic_xadd(&amp;client-&gt;interface-&gt;=
ntcpaccepting, -1);<br>
&gt; --=C2=A0 =C2=A0 INSIST(old &gt; 0);<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_decrement(&amp;client-&gt;interface-&gt;n=
tcpaccepting, NULL);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * We must take ownership of the new socket befor=
e the exit<br>
&gt; -@@ -3480,8 +3476,8 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * quota is tcp-clien=
ts plus the number of listening<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * interfaces plus 1.=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit =3D (isc_atomic_xadd(=
&amp;client-&gt;interface-&gt;ntcpactive, 0) &gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (client-&gt;tcpactive ? 1 : 0));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit =3D (isc_refcount_cur=
rent(&amp;client-&gt;interface-&gt;ntcpactive) &gt;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (client-&gt;tcpactive ? 1U : 0U));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (exit) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;newstate =3D NS_CLIENTSTATE_INACTIVE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(void)exit_check(client);<br>
&gt; -@@ -3539,7 +3535,7 @@ client_accept(ns_client_t *client) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * listening for connections itself to prevent th=
e interface<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * going dead.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 isc_atomic_xadd(&amp;client-&gt;interface-&gt;ntcpacce=
pting, 1);<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_increment0(&amp;client-&gt;interface-&gt;=
ntcpaccepting, NULL);<br>
&gt; - }<br>
&gt; - <br>
&gt; - static void<br>
&gt; -diff --git a/bin/named/include/named/interfacemgr.h b/bin/named/inclu=
de/named/interfacemgr.h<br>
&gt; -index 3535ef22a8..6e10f210fd 100644<br>
&gt; ---- a/bin/named/include/named/interfacemgr.h<br>
&gt; -+++ b/bin/named/include/named/interfacemgr.h<br>
&gt; -@@ -45,6 +45,7 @@<br>
&gt; - #include &lt;isc/magic.h&gt;<br>
&gt; - #include &lt;isc/mem.h&gt;<br>
&gt; - #include &lt;isc/socket.h&gt;<br>
&gt; -+#include &lt;isc/refcount.h&gt;<br>
&gt; - <br>
&gt; - #include &lt;dns/result.h&gt;<br>
&gt; - <br>
&gt; -@@ -75,11 +76,11 @@ struct ns_interface {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/*%&lt; UDP dispatchers. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_socket_t *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tcpsocket;=C2=A0 =C2=A0 =C2=A0 /*%&lt; TCP socket. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_dscp_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dscp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*%&lt; &quot;list=
en-on&quot; DSCP value */<br>
&gt; --=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ntcpaccepting;=C2=A0 /*%&lt; Number of clients<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ntcpa=
ccepting;=C2=A0 /*%&lt; Number of clients<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ready to accept new<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCP connections on this<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface */<br>
&gt; --=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ntcpactive;=C2=A0 =C2=A0 =C2=A0/*%&lt; Number of clients<b=
r>
&gt; -+=C2=A0 =C2=A0 isc_refcount_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ntcpa=
ctive;=C2=A0 =C2=A0 =C2=A0/*%&lt; Number of clients<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 servicing TCP queries<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (whether accepting or<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connected) */<br>
&gt; -diff --git a/bin/named/interfacemgr.c b/bin/named/interfacemgr.c<br>
&gt; -index d9f6df5802..135533be6b 100644<br>
&gt; ---- a/bin/named/interfacemgr.c<br>
&gt; -+++ b/bin/named/interfacemgr.c<br>
&gt; -@@ -386,8 +386,8 @@ ns_interface_create(ns_interfacemgr_t *mgr, isc_s=
ockaddr_t *addr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * connections will be handled in parallel even t=
hough there is<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * only one client initially.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 ifp-&gt;ntcpaccepting =3D 0;<br>
&gt; --=C2=A0 =C2=A0 ifp-&gt;ntcpactive =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_init(&amp;ifp-&gt;ntcpaccepting, 0);<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_init(&amp;ifp-&gt;ntcpactive, 0);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;nudpdispatch =3D 0;<br>
&gt; - <br>
&gt; -@@ -618,6 +618,9 @@ ns_interface_destroy(ns_interface_t *ifp) {<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ns_interfacemgr_detach(&amp;ifp-&gt;mgr);<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_destroy(&amp;ifp-&gt;ntcpactive);<br>
&gt; -+=C2=A0 =C2=A0 isc_refcount_destroy(&amp;ifp-&gt;ntcpaccepting);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ifp-&gt;magic =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0isc_mem_put(mctx, ifp, sizeof(*ifp));<br>
&gt; - }<br>
&gt; --- <br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching=
-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind=
/bind-ensure-searching-for-json-headers-searches-sysr.patch<br>
&gt; index 37e210e6da9..84559e5f378 100644<br>
&gt; --- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-js=
on-headers-searches-sysr.patch<br>
&gt; +++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-js=
on-headers-searches-sysr.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 9473d29843579802e96b0293a3e953fed93de82c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Paul Gortmaker &lt;<a href=3D"mailto:paul.gortmaker@windri=
ver.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 9 Jun 2015 11:22:00 -0400<br>
&gt;=C2=A0 Subject: [PATCH] bind: ensure searching for json headers searche=
s sysroot<br>
&gt; @@ -27,15 +27,16 @@ to make use of the combination some day.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE Specific]<br>
&gt;=C2=A0 Signed-off-by: Paul Gortmaker &lt;<a href=3D"mailto:paul.gortmak=
er@windriver.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;<br=
>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt; - <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a> | 2 +-<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt; -Index: bind-9.11.3/<a href=3D"http://configure.in" rel=3D"noreferrer"=
 target=3D"_blank">configure.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- bind-9.11.3.orig/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
&gt; -+++ bind-9.11.3/<a href=3D"http://configure.in" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.in</a><br>
&gt; -@@ -2574,7 +2574,7 @@ case &quot;$use_libjson&quot; in<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 17392fd..e85a5c6 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -2449,7 +2449,7 @@ case &quot;$use_libjson&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libjson_libs=3D&=
quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0auto|yes)<br>
&gt; diff --git a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.1=
1.5-P4.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.5-P4.bb</a> b/met=
a/recipes-connectivity/bind/<a href=3D"http://bind_9.11.13.bb" rel=3D"noref=
errer" target=3D"_blank">bind_9.11.13.bb</a><br>
&gt; similarity index 86%<br>
&gt; rename from meta/recipes-connectivity/bind/<a href=3D"http://bind_9.11=
.5-P4.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.5-P4.bb</a><br>
&gt; rename to meta/recipes-connectivity/bind/<a href=3D"http://bind_9.11.1=
3.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.13.bb</a><br>
&gt; index 0897706346b..338d6c717a6 100644<br>
&gt; --- a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.11.5-P4.=
bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.5-P4.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.11.13.bb=
" rel=3D"noreferrer" target=3D"_blank">bind_9.11.13.bb</a><br>
&gt; @@ -15,23 +15,13 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.isc.org/i=
sc/bind9/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz</a> \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://make-etc-initd-b=
ind-stop-work.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init.d-add-suppo=
rt-for-read-only-rootfs.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://bind-ensure-sear=
ching-for-json-headers-searches-sysr.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gen.c-extend-DIR=
NAMESIZE-from-256-to-512.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lib-dns-gen.c-fi=
x-too-long-error.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.i=
n-remove-useless-L-use_openssl-lib.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-named-lwres=
d-V-and-start-log-hide-build-options.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-avoid-start=
-failure-with-bind-user.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bind-fix-CVE-201=
9-6471.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-enforcement-=
of-tcp-clients-v1.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-tcp-clients-coul=
d-still-be-exceeded-v2.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-use-reference-co=
unter-for-pipeline-groups-v3.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-better-tcpquota-=
accounting-and-client-mortality-chec.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-refactor-tcpquot=
a-and-pipeline-refs-allow-special-ca.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-restore-allowanc=
e-for-tcp-clients-interfaces.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-Replace-atomic-o=
perations-in-bin-named-client.c-with.patch \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;8ddab4b61fa4516fe404679c74e37960&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;7e8c08192bcbaeb6e9f2391a70e67583b027b90e=
8c4bc1605da6eb126edde434&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;17de0d024ab1eac377f1c2854dc25057&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;fd3f3cc9fcfcdaa752db35eb24598afa1fdcc250=
9d3227fc90a8631b7b400f7d&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/=
bind9/" rel=3D"noreferrer" target=3D"_blank">https://ftp.isc.org/isc/bind9/=
</a>&quot;<br>
&gt;=C2=A0 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions div=
isible by 4<br>
<br>
</blockquote></div></div>

--000000000000a2f74805986664f3--
