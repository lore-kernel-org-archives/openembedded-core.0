Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86505D6ACDE
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 14:16:20 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.72730.1732716978379303042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 06:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ad6VrIky;
 spf=pass (domain: mvista.com, ip: 209.85.208.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so1524286a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 06:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1732716976; x=1733321776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lyrG0jkHeiMDBsuCkdvS+6TOOS/uVF8JajB5pXD3lW0=;
        b=Ad6VrIkykguEixqOrtujNnm84cenAHlu5AkxBy1ILUE6cmKxwlICIbftHYn+Sy2qYi
         j285GI0F6cyZo7Qi0j27tJIjB3NujEcapEXYF84vmRqLsrsHWeSlnGR39tLBnzNt/Qs3
         PG/x7zYgHmPqzLa6xYhwNwZwVGxOPpY2ZOWFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732716976; x=1733321776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyrG0jkHeiMDBsuCkdvS+6TOOS/uVF8JajB5pXD3lW0=;
        b=Ee7+7gWtH9/RAJ8xyl+iP9a47/mDaI7gzS2SPiqs/soFs51zUqCkLdMopIDBT+U4HS
         tPe2ZOAlhrcfTP1Lvr2vuZKIZxuTVa/GvC8I4fEJzVFJTh5TNySN8hQEiUzdSkXoMAkg
         SZD5KVmeToXIs5WZ3j0iNel+M06qN/l8m5zh3hJ5x6bOhYtwfyWGz5SGP5zPvwEGVVkj
         ofnr5AEyyfgt6/Yi6SEi6n3XEZ9H2F44YULvJuvkEzosQSqzcEjrmWq/MgvPObTPC45p
         Iqw9wCfav1ptRQ1kcSA9YS781fWEAYR2hoVB+vY86Un9OjkNaU19keODdNRqmPty1OOU
         B/3A==
X-Gm-Message-State: AOJu0YzJQcQM45A0bmyZSshhS0vWLC5zIaLjZ2Skk1oL2LfNAWc4KbFT
	0gF9/mVTWqmW58usKwrUjaA9iM499s6Rg3CXD3M5q73F5VAYSENBCD6YU/sEACiwICL7MhZanSA
	Tavu5IlVVDFnf5v6QuUwpeCoeb8DZjFGnrVs9hl/gZBgygY06Nh/y9Q==
X-Gm-Gg: ASbGncuAyyK09I2zDas/j/REyEoqqZrIShUvaILdmBh0Hc8hfE4RwqqiUP6AOTa1z7w
	V3wApkYS35hCmLyXTTg8DmtbikLTu4s6DzLbiobYz5+sIXLIclVE3YVLnbp0lIky9Eg==
X-Google-Smtp-Source: AGHT+IGZQKKMQvDdt9AF3+Ufq4CTk0kfBlEFJK9covzA7YtLXTmJgr0WcF+/inWOODnep0c4b6qWkcXQ6olhlcanD3E=
X-Received: by 2002:a17:907:775a:b0:aa5:2a63:e93 with SMTP id
 a640c23a62f3a-aa57fac4512mr356792366b.12.1732716976069; Wed, 27 Nov 2024
 06:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20241127091158.1928488-1-changqing.li@windriver.com>
In-Reply-To: <20241127091158.1928488-1-changqing.li@windriver.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 27 Nov 2024 19:46:04 +0530
Message-ID: <CANQUz19Q57qGrzCSYc31vs0ng1P2gnRqGvJQBvW=U-tLpZ6m6g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libsoup: fix CVE-2024-52530/CVE-2024-52531/CVE-2024-52532
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000db01420627e59b31"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 14:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207932

--000000000000db01420627e59b31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Changqing Li,

Fixes for CVE-2024-52530 and CVE-2024-52532 already submitted and landed in
kirkstone-nut.

https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D5c96ff64b5c29e589d776d23dbbed64ad526a997

Could you please send a v2 patch for CVE-2024-52531.

Thanks & Regards,
Vijay

On Wed, Nov 27, 2024 at 2:42=E2=80=AFPM Changqing Li via lists.openembedded=
.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> CVE-2024-52532:
> GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption.
> during the reading of certain patterns of WebSocket data from clients.
>
> Refer:
> https://nvd.nist.gov/vuln/detail/CVE-2024-52532
>
> CVE-2024-52531:
> GNOME libsoup before 3.6.1 allows a buffer overflow in applications that
> perform conversion to UTF-8 in soup_header_parse_param_list_strict.
> Input received over the network cannot trigger this.
>
> Refer:
> https://nvd.nist.gov/vuln/detail/CVE-2024-52531
>
> CVE-2024-52530:
> GNOME libsoup before 3.6.0 allows HTTP request smuggling in some
> configurations because '\0' characters at the end of header names are
> ignored, i.e., a "Transfer-Encoding\0: chunked" header is treated the
> same as a "Transfer-Encoding: chunked" header.
>
> Refer:
> https://nvd.nist.gov/vuln/detail/CVE-2024-52530
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libsoup-3.0.7/CVE-2024-52530.patch        | 150 ++++++++++++++++++
>  .../libsoup-3.0.7/CVE-2024-52531-1.patch      | 116 ++++++++++++++
>  .../libsoup-3.0.7/CVE-2024-52531-2.patch      |  40 +++++
>  .../libsoup-3.0.7/CVE-2024-52531-3.patch      | 136 ++++++++++++++++
>  .../libsoup-3.0.7/CVE-2024-52532-1.patch      |  75 +++++++++
>  .../libsoup-3.0.7/CVE-2024-52532-2.patch      |  46 ++++++
>  meta/recipes-support/libsoup/libsoup_3.0.7.bb |   8 +-
>  7 files changed, 570 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
>
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
> b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
> new file mode 100644
> index 0000000000..fb6d5c3c6f
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
> @@ -0,0 +1,150 @@
> +From 04df03bc092ac20607f3e150936624d4f536e68b Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Mon, 8 Jul 2024 12:33:15 -0500
> +Subject: [PATCH] headers: Strictly don't allow NUL bytes
> +
> +In the past (2015) this was allowed for some problematic sites. However
> Chromium also does not allow NUL bytes in either header names or values
> these days. So this should no longer be a problem.
> +
> +CVE: CVE-2024-52530
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e1509=
36624d4f536e68b
> ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-headers.c      | 15 +++------
> + tests/header-parsing-test.c | 62 +++++++++++++++++--------------------
> + 2 files changed, 32 insertions(+), 45 deletions(-)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index a0cf351ac..f30ee467a 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -51,13 +51,14 @@ soup_headers_parse (const char *str, int len,
> SoupMessageHeaders *dest)
> +        * ignorable trailing whitespace.
> +        */
> +
> ++      /* No '\0's are allowed */
> ++      if (memchr (str, '\0', len))
> ++              return FALSE;
> ++
> +       /* Skip over the Request-Line / Status-Line */
> +       headers_start =3D memchr (str, '\n', len);
> +       if (!headers_start)
> +               return FALSE;
> +-      /* No '\0's in the Request-Line / Status-Line */
> +-      if (memchr (str, '\0', headers_start - str))
> +-              return FALSE;
> +
> +       /* We work on a copy of the headers, which we can write '\0's
> +        * into, so that we don't have to individually g_strndup and
> +@@ -69,14 +70,6 @@ soup_headers_parse (const char *str, int len,
> SoupMessageHeaders *dest)
> +       headers_copy[copy_len] =3D '\0';
> +       value_end =3D headers_copy;
> +
> +-      /* There shouldn't be any '\0's in the headers already, but
> +-       * this is the web we're talking about.
> +-       */
> +-      while ((p =3D memchr (headers_copy, '\0', copy_len))) {
> +-              memmove (p, p + 1, copy_len - (p - headers_copy));
> +-              copy_len--;
> +-      }
> +-
> +       while (*(value_end + 1)) {
> +               name =3D value_end + 1;
> +               name_end =3D strchr (name, ':');
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index edf8eebb3..715c2c6f2 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -358,24 +358,6 @@ static struct RequestTest {
> +         }
> +       },
> +
> +-      { "NUL in header name", "760832",
> +-        "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
> +-        SOUP_STATUS_OK,
> +-        "GET", "/", SOUP_HTTP_1_1,
> +-        { { "Host", "example.com" },
> +-          { NULL }
> +-        }
> +-      },
> +-
> +-      { "NUL in header value", "760832",
> +-        "GET / HTTP/1.1\r\nHost: example\x00" "com\r\n", 35,
> +-        SOUP_STATUS_OK,
> +-        "GET", "/", SOUP_HTTP_1_1,
> +-        { { "Host", "examplecom" },
> +-          { NULL }
> +-        }
> +-      },
> +-
> +       /************************/
> +       /*** INVALID REQUESTS ***/
> +       /************************/
> +@@ -448,6 +430,21 @@ static struct RequestTest {
> +         SOUP_STATUS_EXPECTATION_FAILED,
> +         NULL, NULL, -1,
> +         { { NULL } }
> ++      },
> ++
> ++      // https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
> ++      { "NUL in header name", NULL,
> ++        "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
> ++        SOUP_STATUS_BAD_REQUEST,
> ++        NULL, NULL, -1,
> ++        { { NULL } }
> ++      },
> ++
> ++      { "NUL in header value", NULL,
> ++        "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> ++        SOUP_STATUS_BAD_REQUEST,
> ++           NULL, NULL, -1,
> ++        { { NULL } }
> +       }
> + };
> + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
> +@@ -620,22 +617,6 @@ static struct ResponseTest {
> +           { NULL } }
> +       },
> +
> +-      { "NUL in header name", "760832",
> +-        "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
> +-        SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
> +-        { { "Foo", "bar" },
> +-          { NULL }
> +-        }
> +-      },
> +-
> +-      { "NUL in header value", "760832",
> +-        "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> +-        SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
> +-        { { "Foo", "bar" },
> +-          { NULL }
> +-        }
> +-      },
> +-
> +       /********************************/
> +       /*** VALID CONTINUE RESPONSES ***/
> +       /********************************/
> +@@ -768,6 +749,19 @@ static struct ResponseTest {
> +         { { NULL }
> +         }
> +       },
> ++
> ++      // https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
> ++      { "NUL in header name", NULL,
> ++        "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
> ++        -1, 0, NULL,
> ++        { { NULL } }
> ++      },
> ++
> ++      { "NUL in header value", "760832",
> ++        "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> ++        -1, 0, NULL,
> ++        { { NULL } }
> ++      },
> + };
> + static const int num_resptests =3D G_N_ELEMENTS (resptests);
> +
> +--
> +GitLab
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
> b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
> new file mode 100644
> index 0000000000..c8e855c128
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
> @@ -0,0 +1,116 @@
> +From 4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Tue, 27 Aug 2024 12:18:58 -0500
> +Subject: [PATCH] fuzzing: Cover soup_header_parse_param_list
> +
> +CVE: CVE-2024-52531
> +Upstream-Status: Backport
> +[
> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_=
id=3D4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede
> ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +---
> + fuzzing/fuzz.h                   |  9 +++++++--
> + fuzzing/fuzz_header_parsing.c    | 19 +++++++++++++++++++
> + fuzzing/fuzz_header_parsing.dict |  8 ++++++++
> + fuzzing/meson.build              |  2 ++
> + 4 files changed, 36 insertions(+), 2 deletions(-)
> + create mode 100644 fuzzing/fuzz_header_parsing.c
> + create mode 100644 fuzzing/fuzz_header_parsing.dict
> +
> +diff --git a/fuzzing/fuzz.h b/fuzzing/fuzz.h
> +index 0d380285..f3bd28ee 100644
> +--- a/fuzzing/fuzz.h
> ++++ b/fuzzing/fuzz.h
> +@@ -1,13 +1,14 @@
> + #include "libsoup/soup.h"
> +
> + int LLVMFuzzerTestOneInput (const unsigned char *data, size_t size);
> ++static int set_logger =3D 0;
> +
> + #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
> + static GLogWriterOutput
> + empty_logging_func (GLogLevelFlags log_level, const GLogField *fields,
> +                     gsize n_fields, gpointer user_data)
> + {
> +-  return G_LOG_WRITER_HANDLED;
> ++        return G_LOG_WRITER_HANDLED;
> + }
> + #endif
> +
> +@@ -16,6 +17,10 @@ static void
> + fuzz_set_logging_func (void)
> + {
> + #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
> +-  g_log_set_writer_func (empty_logging_func, NULL, NULL);
> ++        if (!set_logger)
> ++        {
> ++                set_logger =3D 1;
> ++                g_log_set_writer_func (empty_logging_func, NULL, NULL);
> ++        }
> + #endif
> + }
> +diff --git a/fuzzing/fuzz_header_parsing.c b/fuzzing/fuzz_header_parsing=
.c
> +new file mode 100644
> +index 00000000..a8e5c1f9
> +--- /dev/null
> ++++ b/fuzzing/fuzz_header_parsing.c
> +@@ -0,0 +1,19 @@
> ++#include "fuzz.h"
> ++
> ++int
> ++LLVMFuzzerTestOneInput (const unsigned char *data, size_t size)
> ++{
> ++        GHashTable *elements;
> ++
> ++        // We only accept NUL terminated strings
> ++        if (!size || data[size - 1] !=3D '\0')
> ++                return 0;
> ++
> ++        fuzz_set_logging_func ();
> ++
> ++        elements =3D soup_header_parse_param_list((char*)data);
> ++
> ++        g_hash_table_unref(elements);
> ++
> ++        return 0;
> ++}
> +\ No newline at end of file
> +diff --git a/fuzzing/fuzz_header_parsing.dict
> b/fuzzing/fuzz_header_parsing.dict
> +new file mode 100644
> +index 00000000..1562ca3a
> +--- /dev/null
> ++++ b/fuzzing/fuzz_header_parsing.dict
> +@@ -0,0 +1,8 @@
> ++"*=3DUTF-8''"
> ++"*=3Diso-8859-1''"
> ++"'"
> ++"''"
> ++"=3D"
> ++"*=3D"
> ++"""
> ++";"
> +\ No newline at end of file
> +diff --git a/fuzzing/meson.build b/fuzzing/meson.build
> +index b14cbb50..5dd0f417 100644
> +--- a/fuzzing/meson.build
> ++++ b/fuzzing/meson.build
> +@@ -5,6 +5,7 @@ fuzz_targets =3D [
> +   'fuzz_cookie_parse',
> +   'fuzz_content_sniffer',
> +   'fuzz_date_time',
> ++  'fuzz_header_parsing',
> + ]
> +
> + fuzzing_args =3D '-fsanitize=3Dfuzzer,address,undefined'
> +@@ -34,6 +35,7 @@ if have_fuzzing and (fuzzing_feature.enabled() or
> fuzzing_feature.auto())
> +         '-runs=3D200000',
> +         '-artifact_prefix=3Dmeson-logs/' + target + '-',
> +         '-print_final_stats=3D1',
> ++        '-max_len=3D4096',
> +       ] + extra_args,
> +       env: [
> +         'ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0',
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
> b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
> new file mode 100644
> index 0000000000..7e0d81ba4c
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
> @@ -0,0 +1,40 @@
> +From 825fda3425546847b42ad5270544e9388ff349fe Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Tue, 27 Aug 2024 13:52:08 -0500
> +Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
> + soup_header_parse_semi_param_list()
> +
> +CVE: CVE-2024-52531
> +Upstream-Status: Backport
> +[
> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_=
id=3D825fda3425546847b42ad5270544e9388ff349fe
> ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/header-parsing-test.c | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index 715c2c6f..5e423d2b 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -825,6 +825,17 @@ static struct ParamListTest {
> +           { "filename", "t\xC3\xA9st.txt" },
> +         },
> +       },
> ++
> ++        /* This tests invalid UTF-8 data which *should* never be passed
> here but it was designed to be robust against it. */
> ++        { TRUE,
> ++
> "invalid*=3D\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\=
x62\x63\x64\x65\x0a;
> filename*=3Diso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\=
x61\x61\x61\x62\x63\x64\x65\x0a;
> foo",
> ++              {
> ++                    { "filename",
> "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
> ++                    { "invalid",
> "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
> ++                    { "foo", NULL },
> ++
> ++                },
> ++        }
> + };
> + static const int num_paramlisttests =3D G_N_ELEMENTS (paramlisttests);
> +
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
> b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
> new file mode 100644
> index 0000000000..a47c8747c5
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
> @@ -0,0 +1,136 @@
> +From a35222dd0bfab2ac97c10e86b95f762456628283 Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Tue, 27 Aug 2024 13:53:26 -0500
> +Subject: [PATCH] headers: Be more robust against invalid input when
> parsing
> + params
> +
> +If you pass invalid input to a function such as
> soup_header_parse_param_list_strict()
> +it can cause an overflow if it decodes the input to UTF-8.
> +
> +This should never happen with valid UTF-8 input which libsoup's client A=
PI
> +ensures, however it's server API does not currently.
> +
> +CVE: CVE-2024-52531
> +Upstream-Status: Backport
> +[
> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_=
id=3Da35222dd0bfab2ac97c10e86b95f762456628283
> ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +---
> + libsoup/soup-headers.c | 46 ++++++++++++++++++++++--------------------
> + 1 file changed, 24 insertions(+), 22 deletions(-)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index f30ee467..613e1905 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -646,8 +646,9 @@ soup_header_contains (const char *header, const char
> *token)
> + }
> +
> + static void
> +-decode_quoted_string (char *quoted_string)
> ++decode_quoted_string_inplace (GString *quoted_gstring)
> + {
> ++      char *quoted_string =3D quoted_gstring->str;
> +       char *src, *dst;
> +
> +       src =3D quoted_string + 1;
> +@@ -661,10 +662,11 @@ decode_quoted_string (char *quoted_string)
> + }
> +
> + static gboolean
> +-decode_rfc5987 (char *encoded_string)
> ++decode_rfc5987_inplace (GString *encoded_gstring)
> + {
> +       char *q, *decoded;
> +       gboolean iso_8859_1 =3D FALSE;
> ++      const char *encoded_string =3D encoded_gstring->str;
> +
> +       q =3D strchr (encoded_string, '\'');
> +       if (!q)
> +@@ -696,14 +698,7 @@ decode_rfc5987 (char *encoded_string)
> +               decoded =3D utf8;
> +       }
> +
> +-      /* If encoded_string was UTF-8, then each 3-character %-escape
> +-       * will be converted to a single byte, and so decoded is
> +-       * shorter than encoded_string. If encoded_string was
> +-       * iso-8859-1, then each 3-character %-escape will be
> +-       * converted into at most 2 bytes in UTF-8, and so it's still
> +-       * shorter.
> +-       */
> +-      strcpy (encoded_string, decoded);
> ++      g_string_assign (encoded_gstring, decoded);
> +       g_free (decoded);
> +       return TRUE;
> + }
> +@@ -713,15 +708,17 @@ parse_param_list (const char *header, char delim,
> gboolean strict)
> + {
> +       GHashTable *params;
> +       GSList *list, *iter;
> +-      char *item, *eq, *name_end, *value;
> +-      gboolean override, duplicated;
> +
> +       params =3D g_hash_table_new_full (soup_str_case_hash,
> +                                       soup_str_case_equal,
> +-                                      g_free, NULL);
> ++                                      g_free, g_free);
> +
> +       list =3D parse_list (header, delim);
> +       for (iter =3D list; iter; iter =3D iter->next) {
> ++              char *item, *eq, *name_end;
> ++              gboolean override, duplicated;
> ++              GString *parsed_value =3D NULL;
> ++
> +               item =3D iter->data;
> +               override =3D FALSE;
> +
> +@@ -736,19 +733,19 @@ parse_param_list (const char *header, char delim,
> gboolean strict)
> +
> +                       *name_end =3D '\0';
> +
> +-                      value =3D (char *)skip_lws (eq + 1);
> ++                      parsed_value =3D g_string_new ((char *)skip_lws (=
eq
> + 1));
> +
> +                       if (name_end[-1] =3D=3D '*' && name_end > item + =
1) {
> +                               name_end[-1] =3D '\0';
> +-                              if (!decode_rfc5987 (value)) {
> ++                              if (!decode_rfc5987_inplace
> (parsed_value)) {
> ++                                      g_string_free (parsed_value, TRUE=
);
> +                                       g_free (item);
> +                                       continue;
> +                               }
> +                               override =3D TRUE;
> +-                      } else if (*value =3D=3D '"')
> +-                              decode_quoted_string (value);
> +-              } else
> +-                      value =3D NULL;
> ++                      } else if (parsed_value->str[0] =3D=3D '"')
> ++                              decode_quoted_string_inplace
> (parsed_value);
> ++              }
> +
> +               duplicated =3D g_hash_table_lookup_extended (params, item=
,
> NULL, NULL);
> +
> +@@ -756,11 +753,16 @@ parse_param_list (const char *header, char delim,
> gboolean strict)
> +                       soup_header_free_param_list (params);
> +                       params =3D NULL;
> +                       g_slist_foreach (iter, (GFunc)g_free, NULL);
> ++                      if (parsed_value)
> ++                              g_string_free (parsed_value, TRUE);
> +                       break;
> +-              } else if (override || !duplicated)
> +-                      g_hash_table_replace (params, item, value);
> +-              else
> ++              } else if (override || !duplicated) {
> ++                      g_hash_table_replace (params, item, parsed_value =
?
> g_string_free (parsed_value, FALSE) : NULL);
> ++              } else {
> ++                      if (parsed_value)
> ++                              g_string_free (parsed_value, TRUE);
> +                       g_free (item);
> ++              }
> +       }
> +
> +       g_slist_free (list);
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
> b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
> new file mode 100644
> index 0000000000..9afa1bb6bb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
> @@ -0,0 +1,75 @@
> +From 6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Wed, 11 Sep 2024 11:52:11 +0200
> +Subject: [PATCH 1/2] websocket: process the frame as soon as we read dat=
a
> +
> +Otherwise we can enter in a read loop because we were not
> +validating the data until the all the data was read.
> +
> +Fixes #391
> +
> +CVE: CVE-2024-52532
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/410/diffs?commit_=
id=3D6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be
> ]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/websocket/soup-websocket-connection.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libsoup/websocket/soup-websocket-connection.c
> b/libsoup/websocket/soup-websocket-connection.c
> +index a1a730473..a14481340 100644
> +--- a/libsoup/websocket/soup-websocket-connection.c
> ++++ b/libsoup/websocket/soup-websocket-connection.c
> +@@ -1199,9 +1199,9 @@ soup_websocket_connection_read
> (SoupWebsocketConnection *self)
> +               }
> +
> +               priv->incoming->len =3D len + count;
> +-      } while (count > 0);
> +
> +-      process_incoming (self);
> ++              process_incoming (self);
> ++      } while (count > 0 && !priv->close_sent && !priv->io_closing);
> +
> +       if (end) {
> +               if (!priv->close_sent || !priv->close_received) {
> +--
> +GitLab
> +
> +
> +From 29b96fab2512666d7241e46c98cc45b60b795c0c Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Wed, 2 Oct 2024 11:17:19 +0200
> +Subject: [PATCH 2/2] websocket-test: disconnect error copy after the tes=
t
> ends
> +
> +Otherwise the server will have already sent a few more wrong
> +bytes and the client will continue getting errors to copy
> +but the error is already !=3D NULL and it will assert
> +---
> + tests/websocket-test.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index 06c443bb5..6a48c1f9b 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -1539,8 +1539,9 @@ test_receive_invalid_encode_length_64 (Test *test,
> +       GError *error =3D NULL;
> +       InvalidEncodeLengthTest context =3D { test, NULL };
> +       guint i;
> ++      guint error_id;
> +
> +-      g_signal_connect (test->client, "error", G_CALLBACK
> (on_error_copy), &error);
> ++      error_id =3D g_signal_connect (test->client, "error", G_CALLBACK
> (on_error_copy), &error);
> +       g_signal_connect (test->client, "message", G_CALLBACK
> (on_binary_message), &received);
> +
> +       /* We use 127(\x7f) as payload length with 65535 extended length =
*/
> +@@ -1553,6 +1554,7 @@ test_receive_invalid_encode_length_64 (Test *test,
> +       WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
> +       g_assert_error (error, SOUP_WEBSOCKET_ERROR,
> SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
> +       g_clear_error (&error);
> ++        g_signal_handler_disconnect (test->client, error_id);
> +       g_assert_null (received);
> +
> +         g_thread_join (thread);
> +--
> +GitLab
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
> b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
> new file mode 100644
> index 0000000000..6ae7845814
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
> @@ -0,0 +1,46 @@
> +From 4c9e75c6676a37b6485620c332e568e1a3f530ff Mon Sep 17 00:00:00 2001
> +From: Simon McVittie <smcv@debian.org>
> +Date: Wed, 13 Nov 2024 14:14:23 +0000
> +Subject: [PATCH] websocket-test: Disconnect error signal in another plac=
e
> +
> +This is the same change as commit 29b96fab "websocket-test: disconnect
> +error copy after the test ends", and is done for the same reason, but
> +replicating it into a different function.
> +
> +Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
> +Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
> +Signed-off-by: Simon McVittie <smcv@debian.org>
> +
> +CVE: CVE-2024-52532
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/410/diffs?commit_=
id=3D29b96fab2512666d7241e46c98cc45b60b795c0c
> ]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/websocket-test.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index 6a48c1f9..723f2857 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -1508,8 +1508,9 @@ test_receive_invalid_encode_length_16 (Test *test,
> +       GError *error =3D NULL;
> +       InvalidEncodeLengthTest context =3D { test, NULL };
> +       guint i;
> ++      guint error_id;
> +
> +-      g_signal_connect (test->client, "error", G_CALLBACK
> (on_error_copy), &error);
> ++      error_id =3D g_signal_connect (test->client, "error", G_CALLBACK
> (on_error_copy), &error);
> +       g_signal_connect (test->client, "message", G_CALLBACK
> (on_binary_message), &received);
> +
> +       /* We use 126(~) as payload length with 125 extended length */
> +@@ -1522,6 +1523,7 @@ test_receive_invalid_encode_length_16 (Test *test,
> +       WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
> +       g_assert_error (error, SOUP_WEBSOCKET_ERROR,
> SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
> +       g_clear_error (&error);
> ++        g_signal_handler_disconnect (test->client, error_id);
> +       g_assert_null (received);
> +
> +       g_thread_join (thread);
> +--
> +GitLab
> +
> diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
> b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
> index 59cc4a1d0a..20578978d7 100644
> --- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
> +++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
> @@ -11,7 +11,13 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3
> libpsl nghttp2"
>
>  SHRT_VER =3D
> "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
> -SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
> +SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
> +           file://CVE-2024-52530.patch \
> +           file://CVE-2024-52531-1.patch \
> +           file://CVE-2024-52531-2.patch \
> +           file://CVE-2024-52531-3.patch \
> +           file://CVE-2024-52532-1.patch \
> +           file://CVE-2024-52532-2.patch"
>  SRC_URI[sha256sum] =3D
> "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
>
>  PROVIDES =3D "libsoup-3.0"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207917):
> https://lists.openembedded.org/g/openembedded-core/message/207917
> Mute This Topic: https://lists.openembedded.org/mt/109803977/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000db01420627e59b31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Changqing Li,<br><br></div>Fixes for CVE=
-2024-52530 and CVE-2024-52532 already submitted and landed in kirkstone-nu=
t.<br><br><a href=3D"https://git.openembedded.org/openembedded-core-contrib=
/commit/?h=3Dstable/kirkstone-nut&amp;id=3D5c96ff64b5c29e589d776d23dbbed64a=
d526a997">https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dstable/kirkstone-nut&amp;id=3D5c96ff64b5c29e589d776d23dbbed64ad526a997</=
a><br><br></div>Could you please send a v2 patch for CVE-2024-52531.<br><br=
></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 27, =
2024 at 2:42=E2=80=AFPM Changqing Li via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;<a href=3D"http://changqing.li">chan=
gqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">wind=
river.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:c=
hangqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>=
&gt;<br>
<br>
CVE-2024-52532:<br>
GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption.<br=
>
during the reading of certain patterns of WebSocket data from clients.<br>
<br>
Refer:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-52532" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024-52532</a><b=
r>
<br>
CVE-2024-52531:<br>
GNOME libsoup before 3.6.1 allows a buffer overflow in applications that<br=
>
perform conversion to UTF-8 in soup_header_parse_param_list_strict.<br>
Input received over the network cannot trigger this.<br>
<br>
Refer:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-52531" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024-52531</a><b=
r>
<br>
CVE-2024-52530:<br>
GNOME libsoup before 3.6.0 allows HTTP request smuggling in some<br>
configurations because &#39;\0&#39; characters at the end of header names a=
re<br>
ignored, i.e., a &quot;Transfer-Encoding\0: chunked&quot; header is treated=
 the<br>
same as a &quot;Transfer-Encoding: chunked&quot; header.<br>
<br>
Refer:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-52530" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024-52530</a><b=
r>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libsoup-3.0.7/CVE-2024-52530.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
50 ++++++++++++++++++<br>
=C2=A0.../libsoup-3.0.7/CVE-2024-52531-1.patch=C2=A0 =C2=A0 =C2=A0 | 116 ++=
++++++++++++<br>
=C2=A0.../libsoup-3.0.7/CVE-2024-52531-2.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
40 +++++<br>
=C2=A0.../libsoup-3.0.7/CVE-2024-52531-3.patch=C2=A0 =C2=A0 =C2=A0 | 136 ++=
++++++++++++++<br>
=C2=A0.../libsoup-3.0.7/CVE-2024-52532-1.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
75 +++++++++<br>
=C2=A0.../libsoup-3.0.7/CVE-2024-52532-2.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
46 ++++++<br>
=C2=A0meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.0.7.bb" rel=
=3D"noreferrer" target=3D"_blank">libsoup_3.0.7.bb</a> |=C2=A0 =C2=A08 +-<b=
r>
=C2=A07 files changed, 570 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-202=
4-52530.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-202=
4-52531-1.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-202=
4-52531-2.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-202=
4-52531-3.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-202=
4-52532-1.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-202=
4-52532-2.patch<br>
<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patc=
h b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch<br>
new file mode 100644<br>
index 0000000000..fb6d5c3c6f<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch<br>
@@ -0,0 +1,150 @@<br>
+From 04df03bc092ac20607f3e150936624d4f536e68b Mon Sep 17 00:00:00 2001<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Mon, 8 Jul 2024 12:33:15 -0500<br>
+Subject: [PATCH] headers: Strictly don&#39;t allow NUL bytes<br>
+<br>
+In the past (2015) this was allowed for some problematic sites. However Ch=
romium also does not allow NUL bytes in either header names or values these=
 days. So this should no longer be a problem.<br>
+<br>
+CVE: CVE-2024-52530<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/libso=
up/-/commit/04df03bc092ac20607f3e150936624d4f536e68b" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092=
ac20607f3e150936624d4f536e68b</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ libsoup/soup-headers.c=C2=A0 =C2=A0 =C2=A0 | 15 +++------<br>
+ tests/header-parsing-test.c | 62 +++++++++++++++++--------------------<br=
>
+ 2 files changed, 32 insertions(+), 45 deletions(-)<br>
+<br>
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c<br>
+index a0cf351ac..f30ee467a 100644<br>
+--- a/libsoup/soup-headers.c<br>
++++ b/libsoup/soup-headers.c<br>
+@@ -51,13 +51,14 @@ soup_headers_parse (const char *str, int len, SoupMess=
ageHeaders *dest)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ignorable trailing whitespace.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 /* No &#39;\0&#39;s are allowed */<br>
++=C2=A0 =C2=A0 =C2=A0 if (memchr (str, &#39;\0&#39;, len))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Skip over the Request-Line / Status-Line */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0headers_start =3D memchr (str, &#39;\n&#39;, le=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!headers_start)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
+-=C2=A0 =C2=A0 =C2=A0 /* No &#39;\0&#39;s in the Request-Line / Status-Lin=
e */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (memchr (str, &#39;\0&#39;, headers_start - str))=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We work on a copy of the headers, which we c=
an write &#39;\0&#39;s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * into, so that we don&#39;t have to individua=
lly g_strndup and<br>
+@@ -69,14 +70,6 @@ soup_headers_parse (const char *str, int len, SoupMessa=
geHeaders *dest)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0headers_copy[copy_len] =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0value_end =3D headers_copy;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 /* There shouldn&#39;t be any &#39;\0&#39;s in the h=
eaders already, but<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* this is the web we&#39;re talking about.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 =C2=A0 while ((p =3D memchr (headers_copy, &#39;\0&#39;, co=
py_len))) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove (p, p + 1, copy_=
len - (p - headers_copy));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_len--;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (*(value_end + 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D value_end =
+ 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_end =3D strchr=
 (name, &#39;:&#39;);<br>
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c<br>
+index edf8eebb3..715c2c6f2 100644<br>
+--- a/tests/header-parsing-test.c<br>
++++ b/tests/header-parsing-test.c<br>
+@@ -358,24 +358,6 @@ static struct RequestTest {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header name&quot;, &quot;760832&quot;=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET / HTTP/1.1\r\nHost\x00: <a href=3D"=
http://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\r\=
n&quot;, 36,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_OK,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET&quot;, &quot;/&quot;, SOUP_HTTP_1_1=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { &quot;Host&quot;, &quot;<a href=3D"http:/=
/example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>&quot; },=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 },<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header value&quot;, &quot;760832&quot=
;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET / HTTP/1.1\r\nHost: example\x00&quo=
t; &quot;com\r\n&quot;, 35,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_OK,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET&quot;, &quot;/&quot;, SOUP_HTTP_1_1=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { &quot;Host&quot;, &quot;examplecom&quot; =
},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 },<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/************************/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*** INVALID REQUESTS ***/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/************************/<br>
+@@ -448,6 +430,21 @@ static struct RequestTest {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOUP_STATUS_EXPECTATION_FAILED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, -1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ { NULL } }<br>
++=C2=A0 =C2=A0 =C2=A0 },<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // <a href=3D"https://gitlab.gnome.org/GNOME/libsoup=
/-/issues/377" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.or=
g/GNOME/libsoup/-/issues/377</a><br>
++=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header name&quot;, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET / HTTP/1.1\r\nHost\x00: <a href=3D"=
http://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\r\=
n&quot;, 36,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_BAD_REQUEST,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, -1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }<br>
++=C2=A0 =C2=A0 =C2=A0 },<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header value&quot;, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTP/1.1 200 OK\r\nFoo: b\x00&quot; &qu=
ot;ar\r\n&quot;, 28,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_BAD_REQUEST,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, -1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ };<br>
+ static const int num_reqtests =3D G_N_ELEMENTS (reqtests);<br>
+@@ -620,22 +617,6 @@ static struct ResponseTest {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ NULL } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header name&quot;, &quot;760832&quot;=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n&quo=
t;, 28,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_HTTP_1_1, SOUP_STATUS_OK, &quot;OK&quot;=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { &quot;Foo&quot;, &quot;bar&quot; },<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 },<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header value&quot;, &quot;760832&quot=
;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTP/1.1 200 OK\r\nFoo: b\x00&quot; &qu=
ot;ar\r\n&quot;, 28,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_HTTP_1_1, SOUP_STATUS_OK, &quot;OK&quot;=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { &quot;Foo&quot;, &quot;bar&quot; },<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 },<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/********************************/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*** VALID CONTINUE RESPONSES ***/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/********************************/<br>
+@@ -768,6 +749,19 @@ static struct ResponseTest {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ { NULL }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // <a href=3D"https://gitlab.gnome.org/GNOME/libsoup=
/-/issues/377" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.or=
g/GNOME/libsoup/-/issues/377</a><br>
++=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header name&quot;, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n&quo=
t;, 28,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1, 0, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }<br>
++=C2=A0 =C2=A0 =C2=A0 },<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 { &quot;NUL in header value&quot;, &quot;760832&quot=
;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTP/1.1 200 OK\r\nFoo: b\x00&quot; &qu=
ot;ar\r\n&quot;, 28,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1, 0, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }<br>
++=C2=A0 =C2=A0 =C2=A0 },<br>
+ };<br>
+ static const int num_resptests =3D G_N_ELEMENTS (resptests);<br>
+ <br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch<br>
new file mode 100644<br>
index 0000000000..c8e855c128<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch<br>
@@ -0,0 +1,116 @@<br>
+From 4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede Mon Sep 17 00:00:00 2001<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Tue, 27 Aug 2024 12:18:58 -0500<br>
+Subject: [PATCH] fuzzing: Cover soup_header_parse_param_list<br>
+<br>
+CVE: CVE-2024-52531<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/di=
ffs?commit_id=3D4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests=
/407/diffs?commit_id=3D4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+<br>
+---<br>
+ fuzzing/fuzz.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 9 +++++++--<br>
+ fuzzing/fuzz_header_parsing.c=C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
+ fuzzing/fuzz_header_parsing.dict |=C2=A0 8 ++++++++<br>
+ fuzzing/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 ++<br>
+ 4 files changed, 36 insertions(+), 2 deletions(-)<br>
+ create mode 100644 fuzzing/fuzz_header_parsing.c<br>
+ create mode 100644 fuzzing/fuzz_header_parsing.dict<br>
+<br>
+diff --git a/fuzzing/fuzz.h b/fuzzing/fuzz.h<br>
+index 0d380285..f3bd28ee 100644<br>
+--- a/fuzzing/fuzz.h<br>
++++ b/fuzzing/fuzz.h<br>
+@@ -1,13 +1,14 @@<br>
+ #include &quot;libsoup/soup.h&quot;<br>
+ <br>
+ int LLVMFuzzerTestOneInput (const unsigned char *data, size_t size);<br>
++static int set_logger =3D 0;<br>
+ <br>
+ #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION<br>
+ static GLogWriterOutput<br>
+ empty_logging_func (GLogLevelFlags log_level, const GLogField *fields,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gsize n_fields, gpointer user_data)<br>
+ {<br>
+-=C2=A0 return G_LOG_WRITER_HANDLED;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_LOG_WRITER_HANDLED;<br>
+ }<br>
+ #endif<br>
+ <br>
+@@ -16,6 +17,10 @@ static void<br>
+ fuzz_set_logging_func (void)<br>
+ {<br>
+ #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION<br>
+-=C2=A0 g_log_set_writer_func (empty_logging_func, NULL, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!set_logger)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_logger =3D 1;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_log_set_writer_=
func (empty_logging_func, NULL, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ #endif<br>
+ }<br>
+diff --git a/fuzzing/fuzz_header_parsing.c b/fuzzing/fuzz_header_parsing.c=
<br>
+new file mode 100644<br>
+index 00000000..a8e5c1f9<br>
+--- /dev/null<br>
++++ b/fuzzing/fuzz_header_parsing.c<br>
+@@ -0,0 +1,19 @@<br>
++#include &quot;fuzz.h&quot;<br>
++<br>
++int<br>
++LLVMFuzzerTestOneInput (const unsigned char *data, size_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 GHashTable *elements;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // We only accept NUL terminated strings<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!size || data[size - 1] !=3D &#39;\0&#39;=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fuzz_set_logging_func ();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elements =3D soup_header_parse_param_list((ch=
ar*)data);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_unref(elements);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
+\ No newline at end of file<br>
+diff --git a/fuzzing/fuzz_header_parsing.dict b/fuzzing/fuzz_header_parsin=
g.dict<br>
+new file mode 100644<br>
+index 00000000..1562ca3a<br>
+--- /dev/null<br>
++++ b/fuzzing/fuzz_header_parsing.dict<br>
+@@ -0,0 +1,8 @@<br>
++&quot;*=3DUTF-8&#39;&#39;&quot;<br>
++&quot;*=3Diso-8859-1&#39;&#39;&quot;<br>
++&quot;&#39;&quot;<br>
++&quot;&#39;&#39;&quot;<br>
++&quot;=3D&quot;<br>
++&quot;*=3D&quot;<br>
++&quot;&quot;&quot;<br>
++&quot;;&quot;<br>
+\ No newline at end of file<br>
+diff --git a/fuzzing/meson.build b/fuzzing/meson.build<br>
+index b14cbb50..5dd0f417 100644<br>
+--- a/fuzzing/meson.build<br>
++++ b/fuzzing/meson.build<br>
+@@ -5,6 +5,7 @@ fuzz_targets =3D [<br>
+=C2=A0 =C2=A0&#39;fuzz_cookie_parse&#39;,<br>
+=C2=A0 =C2=A0&#39;fuzz_content_sniffer&#39;,<br>
+=C2=A0 =C2=A0&#39;fuzz_date_time&#39;,<br>
++=C2=A0 &#39;fuzz_header_parsing&#39;,<br>
+ ]<br>
+ <br>
+ fuzzing_args =3D &#39;-fsanitize=3Dfuzzer,address,undefined&#39;<br>
+@@ -34,6 +35,7 @@ if have_fuzzing and (fuzzing_feature.enabled() or fuzzin=
g_feature.auto())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-runs=3D200000&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-artifact_prefix=3Dmeson-logs/&#39;=
 + target + &#39;-&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-print_final_stats=3D1&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-max_len=3D4096&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0] + extra_args,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0env: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ASAN_OPTIONS=3Dfast_unwind_on_mallo=
c=3D0&#39;,<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch<br>
new file mode 100644<br>
index 0000000000..7e0d81ba4c<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch<br>
@@ -0,0 +1,40 @@<br>
+From 825fda3425546847b42ad5270544e9388ff349fe Mon Sep 17 00:00:00 2001<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Tue, 27 Aug 2024 13:52:08 -0500<br>
+Subject: [PATCH] tests: Add test for passing invalid UTF-8 to<br>
+ soup_header_parse_semi_param_list()<br>
+<br>
+CVE: CVE-2024-52531<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/di=
ffs?commit_id=3D825fda3425546847b42ad5270544e9388ff349fe" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests=
/407/diffs?commit_id=3D825fda3425546847b42ad5270544e9388ff349fe</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ tests/header-parsing-test.c | 11 +++++++++++<br>
+ 1 file changed, 11 insertions(+)<br>
+<br>
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c<br>
+index 715c2c6f..5e423d2b 100644<br>
+--- a/tests/header-parsing-test.c<br>
++++ b/tests/header-parsing-test.c<br>
+@@ -825,6 +825,17 @@ static struct ParamListTest {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;filename&quot;, &quot;t\x=
C3\xA9st.txt&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This tests invalid UTF-8 data which *shoul=
d* never be passed here but it was designed to be robust against it. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TRUE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;invalid*=3D\x69\x2=
7\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; =
filename*=3Diso-8859-1&#39;&#39;\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x6=
1\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &=
quot;filename&quot;, &quot;i&#39;&#39;\302\223\302\223\302\223\302\223\303\=
277aaaaaaabcde&quot; },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &=
quot;invalid&quot;, &quot;\302\223\302\223\302\223\302\223\303\277aaaaaaabc=
de&quot; },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &=
quot;foo&quot;, NULL },<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ };<br>
+ static const int num_paramlisttests =3D G_N_ELEMENTS (paramlisttests);<br=
>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch<br>
new file mode 100644<br>
index 0000000000..a47c8747c5<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch<br>
@@ -0,0 +1,136 @@<br>
+From a35222dd0bfab2ac97c10e86b95f762456628283 Mon Sep 17 00:00:00 2001<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Tue, 27 Aug 2024 13:53:26 -0500<br>
+Subject: [PATCH] headers: Be more robust against invalid input when parsin=
g<br>
+ params<br>
+<br>
+If you pass invalid input to a function such as soup_header_parse_param_li=
st_strict()<br>
+it can cause an overflow if it decodes the input to UTF-8.<br>
+<br>
+This should never happen with valid UTF-8 input which libsoup&#39;s client=
 API<br>
+ensures, however it&#39;s server API does not currently.<br>
+<br>
+CVE: CVE-2024-52531<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/di=
ffs?commit_id=3Da35222dd0bfab2ac97c10e86b95f762456628283" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests=
/407/diffs?commit_id=3Da35222dd0bfab2ac97c10e86b95f762456628283</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+<br>
+---<br>
+ libsoup/soup-headers.c | 46 ++++++++++++++++++++++--------------------<br=
>
+ 1 file changed, 24 insertions(+), 22 deletions(-)<br>
+<br>
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c<br>
+index f30ee467..613e1905 100644<br>
+--- a/libsoup/soup-headers.c<br>
++++ b/libsoup/soup-headers.c<br>
+@@ -646,8 +646,9 @@ soup_header_contains (const char *header, const char *=
token)<br>
+ }<br>
+ <br>
+ static void<br>
+-decode_quoted_string (char *quoted_string)<br>
++decode_quoted_string_inplace (GString *quoted_gstring)<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 char *quoted_string =3D quoted_gstring-&gt;str;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *src, *dst;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D quoted_string + 1;<br>
+@@ -661,10 +662,11 @@ decode_quoted_string (char *quoted_string)<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-decode_rfc5987 (char *encoded_string)<br>
++decode_rfc5987_inplace (GString *encoded_gstring)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *q, *decoded;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gboolean iso_8859_1 =3D FALSE;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *encoded_string =3D encoded_gstring-&gt;s=
tr;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0q =3D strchr (encoded_string, &#39;\&#39;&#39;)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!q)<br>
+@@ -696,14 +698,7 @@ decode_rfc5987 (char *encoded_string)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decoded =3D utf8;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 /* If encoded_string was UTF-8, then each 3-characte=
r %-escape<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* will be converted to a single byte, and so d=
ecoded is<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* shorter than encoded_string. If encoded_stri=
ng was<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* iso-8859-1, then each 3-character %-escape w=
ill be<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* converted into at most 2 bytes in UTF-8, and=
 so it&#39;s still<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* shorter.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 =C2=A0 strcpy (encoded_string, decoded);<br>
++=C2=A0 =C2=A0 =C2=A0 g_string_assign (encoded_gstring, decoded);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (decoded);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
+ }<br>
+@@ -713,15 +708,17 @@ parse_param_list (const char *header, char delim, gb=
oolean strict)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GHashTable *params;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GSList *list, *iter;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *item, *eq, *name_end, *value;<br>
+-=C2=A0 =C2=A0 =C2=A0 gboolean override, duplicated;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0params =3D g_hash_table_new_full (soup_str_case=
_hash, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soup_str_=
case_equal,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free, NULL);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free, g_free)=
;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list =3D parse_list (header, delim);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (iter =3D list; iter; iter =3D iter-&gt;nex=
t) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *item, *eq, *name_e=
nd;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean override, dupli=
cated;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GString *parsed_value =
=3D NULL;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0item =3D iter-&gt;d=
ata;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0override =3D FALSE;=
<br>
+ <br>
+@@ -736,19 +733,19 @@ parse_param_list (const char *header, char delim, gb=
oolean strict)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*name_end =3D &#39;\0&#39;;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 value =3D (char *)skip_lws (eq + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 parsed_value =3D g_string_new ((char *)skip_lws (eq + 1));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (name_end[-1] =3D=3D &#39;*&#39; &amp;&amp; name_end &gt; item=
 + 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_end[-1] =3D &#39;\0&#39;;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!decode_rfc5987 (value)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!decode_rfc5987_inplace (parsed_value))=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free (=
parsed_value, TRUE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (i=
tem);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0override =3D TRUE;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if (*value =3D=3D &#39;&quot;&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_quoted_string (value);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 value =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if (parsed_value-&gt;str[0] =3D=3D &#39;&quot;&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_quoted_string_inplace (parsed_value)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0duplicated =3D g_ha=
sh_table_lookup_extended (params, item, NULL, NULL);<br>
+ <br>
+@@ -756,11 +753,16 @@ parse_param_list (const char *header, char delim, gb=
oolean strict)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0soup_header_free_param_list (params);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0params =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_slist_foreach (iter, (GFunc)g_free, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (parsed_value)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free (parsed_value, TRUE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (override || !=
duplicated)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 g_hash_table_replace (params, item, value);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (override || !=
duplicated) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 g_hash_table_replace (params, item, parsed_value ? g_string_free (parse=
d_value, FALSE) : NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (parsed_value)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free (parsed_value, TRUE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_free (item);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_slist_free (list);<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch<br>
new file mode 100644<br>
index 0000000000..9afa1bb6bb<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch<br>
@@ -0,0 +1,75 @@<br>
+From 6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be Mon Sep 17 00:00:00 2001<br>
+From: Ignacio Casal Quinteiro &lt;<a href=3D"mailto:qignacio@amazon.com" t=
arget=3D"_blank">qignacio@amazon.com</a>&gt;<br>
+Date: Wed, 11 Sep 2024 11:52:11 +0200<br>
+Subject: [PATCH 1/2] websocket: process the frame as soon as we read data<=
br>
+<br>
+Otherwise we can enter in a read loop because we were not<br>
+validating the data until the all the data was read.<br>
+<br>
+Fixes #391<br>
+<br>
+CVE: CVE-2024-52532<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/libso=
up/-/merge_requests/410/diffs?commit_id=3D6adc0e3eb74c257ed4e2a23eb4b2774fd=
b0d67be" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOM=
E/libsoup/-/merge_requests/410/diffs?commit_id=3D6adc0e3eb74c257ed4e2a23eb4=
b2774fdb0d67be</a>]<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ libsoup/websocket/soup-websocket-connection.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/webso=
cket/soup-websocket-connection.c<br>
+index a1a730473..a14481340 100644<br>
+--- a/libsoup/websocket/soup-websocket-connection.c<br>
++++ b/libsoup/websocket/soup-websocket-connection.c<br>
+@@ -1199,9 +1199,9 @@ soup_websocket_connection_read (SoupWebsocketConnect=
ion *self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;incoming-&=
gt;len =3D len + count;<br>
+-=C2=A0 =C2=A0 =C2=A0 } while (count &gt; 0);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 process_incoming (self);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_incoming (self);=
<br>
++=C2=A0 =C2=A0 =C2=A0 } while (count &gt; 0 &amp;&amp; !priv-&gt;close_sen=
t &amp;&amp; !priv-&gt;io_closing);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (end) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv-&gt;close=
_sent || !priv-&gt;close_received) {<br>
+-- <br>
+GitLab<br>
+<br>
+<br>
+From 29b96fab2512666d7241e46c98cc45b60b795c0c Mon Sep 17 00:00:00 2001<br>
+From: Ignacio Casal Quinteiro &lt;<a href=3D"mailto:qignacio@amazon.com" t=
arget=3D"_blank">qignacio@amazon.com</a>&gt;<br>
+Date: Wed, 2 Oct 2024 11:17:19 +0200<br>
+Subject: [PATCH 2/2] websocket-test: disconnect error copy after the test =
ends<br>
+<br>
+Otherwise the server will have already sent a few more wrong<br>
+bytes and the client will continue getting errors to copy<br>
+but the error is already !=3D NULL and it will assert<br>
+---<br>
+ tests/websocket-test.c | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c<br>
+index 06c443bb5..6a48c1f9b 100644<br>
+--- a/tests/websocket-test.c<br>
++++ b/tests/websocket-test.c<br>
+@@ -1539,8 +1539,9 @@ test_receive_invalid_encode_length_64 (Test *test,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GError *error =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0InvalidEncodeLengthTest context =3D { test, NUL=
L };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0guint i;<br>
++=C2=A0 =C2=A0 =C2=A0 guint error_id;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 g_signal_connect (test-&gt;client, &quot;error&quot;=
, G_CALLBACK (on_error_copy), &amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 error_id =3D g_signal_connect (test-&gt;client, &quo=
t;error&quot;, G_CALLBACK (on_error_copy), &amp;error);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_signal_connect (test-&gt;client, &quot;messag=
e&quot;, G_CALLBACK (on_binary_message), &amp;received);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We use 127(\x7f) as payload length with 6553=
5 extended length */<br>
+@@ -1553,6 +1554,7 @@ test_receive_invalid_encode_length_64 (Test *test,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WAIT_UNTIL (error !=3D NULL || received !=3D NU=
LL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_error (error, SOUP_WEBSOCKET_ERROR, SO=
UP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_signal_handler_disconnect (test-&gt;client,=
 error_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_null (received);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_thread_join (thread);<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch<br>
new file mode 100644<br>
index 0000000000..6ae7845814<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch<br>
@@ -0,0 +1,46 @@<br>
+From 4c9e75c6676a37b6485620c332e568e1a3f530ff Mon Sep 17 00:00:00 2001<br>
+From: Simon McVittie &lt;<a href=3D"mailto:smcv@debian.org" target=3D"_bla=
nk">smcv@debian.org</a>&gt;<br>
+Date: Wed, 13 Nov 2024 14:14:23 +0000<br>
+Subject: [PATCH] websocket-test: Disconnect error signal in another place<=
br>
+<br>
+This is the same change as commit 29b96fab &quot;websocket-test: disconnec=
t<br>
+error copy after the test ends&quot;, and is done for the same reason, but=
<br>
+replicating it into a different function.<br>
+<br>
+Fixes: 6adc0e3e &quot;websocket: process the frame as soon as we read data=
&quot;<br>
+Resolves: <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/399" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup=
/-/issues/399</a><br>
+Signed-off-by: Simon McVittie &lt;<a href=3D"mailto:smcv@debian.org" targe=
t=3D"_blank">smcv@debian.org</a>&gt;<br>
+<br>
+CVE: CVE-2024-52532<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/libso=
up/-/merge_requests/410/diffs?commit_id=3D29b96fab2512666d7241e46c98cc45b60=
b795c0c" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOM=
E/libsoup/-/merge_requests/410/diffs?commit_id=3D29b96fab2512666d7241e46c98=
cc45b60b795c0c</a>]<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ tests/websocket-test.c | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c<br>
+index 6a48c1f9..723f2857 100644<br>
+--- a/tests/websocket-test.c<br>
++++ b/tests/websocket-test.c<br>
+@@ -1508,8 +1508,9 @@ test_receive_invalid_encode_length_16 (Test *test,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GError *error =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0InvalidEncodeLengthTest context =3D { test, NUL=
L };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0guint i;<br>
++=C2=A0 =C2=A0 =C2=A0 guint error_id;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 g_signal_connect (test-&gt;client, &quot;error&quot;=
, G_CALLBACK (on_error_copy), &amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 error_id =3D g_signal_connect (test-&gt;client, &quo=
t;error&quot;, G_CALLBACK (on_error_copy), &amp;error);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_signal_connect (test-&gt;client, &quot;messag=
e&quot;, G_CALLBACK (on_binary_message), &amp;received);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We use 126(~) as payload length with 125 ext=
ended length */<br>
+@@ -1522,6 +1523,7 @@ test_receive_invalid_encode_length_16 (Test *test,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WAIT_UNTIL (error !=3D NULL || received !=3D NU=
LL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_error (error, SOUP_WEBSOCKET_ERROR, SO=
UP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_signal_handler_disconnect (test-&gt;client,=
 error_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_null (received);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_thread_join (thread);<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.0.7.b=
b" rel=3D"noreferrer" target=3D"_blank">libsoup_3.0.7.bb</a> b/meta/recipes=
-support/libsoup/<a href=3D"http://libsoup_3.0.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libsoup_3.0.7.bb</a><br>
index 59cc4a1d0a..20578978d7 100644<br>
--- a/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.0.7.bb" rel=
=3D"noreferrer" target=3D"_blank">libsoup_3.0.7.bb</a><br>
+++ b/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.0.7.bb" rel=
=3D"noreferrer" target=3D"_blank">libsoup_3.0.7.bb</a><br>
@@ -11,7 +11,13 @@ DEPENDS =3D &quot;glib-2.0 glib-2.0-native libxml2 sqlit=
e3 libpsl nghttp2&quot;<br>
<br>
=C2=A0SHRT_VER =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[0]}.$=
{@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[1]}&quot;<br>
<br>
-SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz=
&quot;<br>
+SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52530.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52531-1.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52531-2.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52531-3.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52532-1.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52532-2.patch&quo=
t;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56=
eb829b93962972683e1bf7c8&quot;<br>
<br>
=C2=A0PROVIDES =3D &quot;libsoup-3.0&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207917): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207917" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207917</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109803977/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109803977/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000db01420627e59b31--

