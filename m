Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12161.1793368688415446256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZBPemOde;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1da913so556150f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793368686; x=1793973486; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzhWYKakW1QILcM1PxtfQEpuvP0c8HwHVfr6I0BU3Cs=;
        b=ZBPemOdersDzfPw+27qF+ged2i339o8i9I0YYCJ4jXOJ/ihdbLR6ZhC/RrTZtYf/AC
         4LisELWiAhrx+LlT0UMuvwayT0gKbkJe6SJBgFJ+lIUshYSw4MSw32++xguqcVMj1gH6
         voWDlY49IkD2+YP8gzs8TfGQCbCPUFRW3GBps/5h9C4fltxsqFfGsu320WgGbyxCJm5l
         cR/MyTCxOvWmOlVVQRhFzjpWq8wCHOqI1c1H/5JOxsVa3xKElGcMnKnUHbtJGQ+6TYFT
         FumK2V4XEH1NYIq/TIxy3jln1Ns94neK9GfZTB1Ktp9C/UDXWw41yzjTm8ooJdsTAjDt
         KmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368686; x=1793973486;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzhWYKakW1QILcM1PxtfQEpuvP0c8HwHVfr6I0BU3Cs=;
        b=KT1r5W3Voo6dvFzHG+m+LOjP0kEMUWsCv739y+EDzU6kfB7fbCdK1BGtdfEAzdWB+r
         WcNePngYd9VStjjsZumfiu9W97Uwaz1FyMlboN+8xRLa9Nz0RF/Ae5+xECQ3E0i5hex6
         EyDtsEAoQuSlKcLJGoMys+QKadQYiWxD3V7FyPjRXGIaPCsjsVtK9Rgx0RGBHEydvDvK
         EZJt7iilnFAh7K7216a2EwCaD0hCvPZXB8dllyaxROG+xjt15uRpp3vwOcU4x2hbcjjB
         rBSriYkw1ywnN+eimEcZrlk7Z7hdgTqz8DuxyjJUAw2FSmOIu5n7vr+626KKaVNQf167
         yY8A==
X-Forwarded-Encrypted: i=1; AKwUvBwoxn624cYmjwCOqj0QGj+VgfpTZFU2IrbWQoYYcKYOqeNRw19RmTYHHS28zvL0FwgG6bfpx3Y6c8fWbbUP6xgSSw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLtX4FU9OVzEZLV5O1dzHwy2pfLYscCVsqHX+wGeHJERtFsKNOr
	g33v07WcWUXGZmSB8SrUBBqNTzfFNku+hczVqtvZOgWSGUU/U3cNhgPwOLeYkBgjnuM=
X-Gm-Gg: AYBFou287rXM9wmqsMHxUDg+01s4zFE8DTubUr6evT9A5qKkxGcf50T+CSwjoFS7+i0
	OK0Q9XcLF4kUHNDNhqR9mLEnpwyP+CstynHlOgu6uVgubpeN2G/jVzTAMxnE7Lvxw4Bi5pG9/BQ
	rV7He5wdp7JBE9o0m33yHCjwypyH+b7hnKlAr8hmBrWq5kq+AF8f2qO1RSJx1fjZkxjtbbpKw3t
	6aC+lvkOiSTiyPEibo9Y7DB+DU7aMuLmpFWPepE+q0DoGDZOGo5OFcqb+9e/Lc9heIz/nj9XJM6
	FH88UFi2QoJMfXbVtrBQ55RdRGHnEYxV6M6xeWuoj0bpchWlN9+Sl1FlWuugv6juBcp66cUn+51
	PS13N4RrCGnLk1Mc5Mm3Bhsj6PBRCuaVaw1CwJhjcQ8Fdi7jrux7lVyq/56SOEUebE051EB37m8
	INfkhO7bByM1DJ0+T0Ia1+sKz/1Q7zQyLWJx09+5dk1FRzvktT6Bo0SeYuIVxlVm4xZvfjkvuhk
	kA8NS+T6KbHR6rW0mUknW/F6yN06pDGWzmnhyzROAjtsyUT0z5DmumMGQqLYBtUSlShlmqOOP66
	8D4K5wlDgYvkvoCVwVGiArJdyURjzVTAqdZvt93eY/+Qb5QMFQWNoAPux+pu1IIxJTLqn4LaGO3
	e10iXjtHQ2tn0f3az
X-Received: by 2002:a5d:498b:0:b0:48d:f1b3:7e67 with SMTP id ffacd0b85a97d-48e64cb316emr11151515f8f.18.1793368686386;
        Fri, 30 Oct 2026 06:58:06 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm3205011f8f.25.2026.10.30.06.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:58:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 14:58:05 +0100
Message-Id: <DMI854LM1BUP.I6CD1Z6N56QW@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2 1/5] libsoup-2.4: fix
 CVE-2026-1539
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
In-Reply-To: <20261014161209.2227316-1-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249042

Hello,

On Wed Oct 14, 2026 at 6:12 PM CEST, Jason Stasiak via lists.openembedded.o=
rg wrote:
> Backport fix for CVE-2026-1539 from meta-oe to OE-core.
> Update CVE patch to restore the auth-redirect proxy validation
> unit test from the upstream libsoup3 patch.
>
> (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
> Changes since v1:
>    - Resolved malformed patch lines
>
>  .../libsoup/libsoup-2.4/CVE-2026-1539.patch   | 104 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-153=
9.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
> new file mode 100644
> index 0000000000..2682c35a42
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
> @@ -0,0 +1,104 @@
> +From 285faea567e1e2a95226201175dbf745a64a2439 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
         ^
I just saw that this is in the meta-oe commit but this patch is not
authored by Changqing Li but by Carlos Garcia Campos.

> +Date: Fri, 20 Mar 2026 15:04:22 +0800
> +Subject: [PATCH 4/4] Also remove Proxy-Authorization header on cross ori=
gin
> + redirect
> +
> +Closes #489
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/98c1285d9d78662c38bf14b4a128af01ccfdb446]
> +CVE: CVE-2026-1539
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +Backport the auth-redirect proxy validation unit tests from the upstream
> +libsoup3 patch
> +
> +Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> +---
> + libsoup/soup-session.c |  1 +
> + tests/httpd.conf.in    |  1 +
> + tests/proxy-test.c     | 36 ++++++++++++++++++++++++++++++++++++
> + 3 files changed, 38 insertions(+)
> +
> +diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
> +index fadd5cd2..4cad0946 100644
> +--- a/libsoup/soup-session.c
> ++++ b/libsoup/soup-session.c
> +@@ -1192,6 +1192,7 @@ soup_session_redirect_message (SoupSession *sessio=
n, SoupMessage *msg)
> + 	/* Strip all credentials on cross-origin redirect. */
> + 	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
> + 		soup_message_headers_remove (msg->request_headers, "Authorization");
> ++		soup_message_headers_remove (msg->request_headers, "Proxy-Authorizati=
on");
> + 		soup_message_set_auth (msg, NULL);
> + 	}
> +=20
> +diff --git a/tests/httpd.conf.in b/tests/httpd.conf.in
> +index 93fb7ff4..e190b6f7 100644
> +--- a/tests/httpd.conf.in
> ++++ b/tests/httpd.conf.in
> +@@ -37,6 +37,7 @@ DirectoryIndex index.txt
> + TypesConfig /dev/null
> + AddType application/x-httpd-php .php
> + Redirect permanent /redirected /index.txt
> ++Redirect permanent /Basic/realm1/redirected https://127.0.0.1:47525/ind=
ex.txt
> +=20
> + # Proxy #1: unauthenticated
> + Listen 127.0.0.1:47526
> +diff --git a/tests/proxy-test.c b/tests/proxy-test.c
> +index 1d68aa05..105a02a6 100644
> +--- a/tests/proxy-test.c
> ++++ b/tests/proxy-test.c
> +@@ -322,6 +322,41 @@ do_proxy_redirect_test (void)
> + 	soup_test_session_abort_unref (session);
> + }
> +=20
> ++static void proxy_auth_redirect_message_restarted (SoupMessage *msg)
> ++{
> ++	if (msg->status_code !=3D SOUP_STATUS_MOVED_PERMANENTLY)
> ++		return;
> ++
> ++	g_assert_null (soup_message_headers_get_one (msg->request_headers, "Pr=
oxy-Authorization"));
> ++}
> ++
> ++static void
> ++do_proxy_auth_redirect_test (void)
> ++{
> ++	SoupSession *session;
> ++	SoupMessage *msg;
> ++	char *url;
> ++
> ++	SOUP_TEST_SKIP_IF_NO_APACHE;
> ++	SOUP_TEST_SKIP_IF_NO_TLS;
> ++
> ++	session =3D soup_test_session_new (SOUP_TYPE_SESSION_ASYNC,
> ++		SOUP_SESSION_PROXY_RESOLVER, proxy_resolvers[AUTH_PROXY],
> ++		NULL);
> ++
> ++	url =3D g_strconcat (HTTP_SERVER, "/Basic/realm1/redirected", NULL);
> ++	msg =3D soup_message_new (SOUP_METHOD_GET, url);
> ++	g_signal_connect (session, "authenticate", G_CALLBACK (authenticate), =
NULL);
> ++	g_signal_connect (msg, "restarted", G_CALLBACK (proxy_auth_redirect_me=
ssage_restarted), NULL);
> ++
> ++	soup_session_send_message (session, msg);
> ++	soup_test_assert_message_status (msg, SOUP_STATUS_OK);
> ++
> ++	g_free (url);
> ++	g_object_unref (msg);
> ++	soup_test_session_abort_unref (session);
> ++}

This function body has changes from upstream patch:
* soup_test_session_new call arguments
* g_signal_connect (session, "authenticate, ... instead of msg
* soup_test_session_send_message -> soup_session_send_message call
* indentation changed which tends to hide the above changes.

Since the recipe does not inherit ptest, do we actually exercise this
test code? If we don't, please consider just removing it.

If you want to keep it, please explain/document the above changes (or in
case of the indentation change: revert it)
The current explanation is not detailed enough for that.

Thanks!
--=20
Yoann Congal
Smile ECS

