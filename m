Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Subject: Re: [OE-core] [dunfell][PATCH] glib-2.0: Several Security fixes
References: <20210910145953.2650438-1-akuster808@gmail.com>
 <CAOSpxdbT0ZLoxN8cv2B3V14eOMCiXpZPdy+=VFgqhP4KunSy4Q@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <7852931d-ad23-a2ee-11e4-b729b6dfee91@gmail.com>
Date: Sat, 25 Sep 2021 09:52:24 -0700
MIME-Version: 1.0
In-Reply-To: <CAOSpxdbT0ZLoxN8cv2B3V14eOMCiXpZPdy+=VFgqhP4KunSy4Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Armin Kuster <akuster@mvista.com>



On 9/23/21 8:45 AM, Steve Sakoman wrote:
> On Fri, Sep 10, 2021 at 5:00 AM Armin Kuster <akuster808@gmail.com> wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> Source: https://gitlab.gnome.org/GNOME/glib
>> MR: 108788, 108795, 109707
>> Type: Security Fix https://gitlab.gnome.org/GNOME/glib branch glic-2-66
>> Disposition: Backport from
>> ChangeID: 96b965a23bcdb0881b0de534d6eb5878f6d99d9a
>> Description:
>>
>> https://gitlab.gnome.org/GNOME/glib/-/commit/e8fe1d51fe07f506211680c76145eea737f4bf30
>> https://gitlab.gnome.org/GNOME/glib/-/commit/8670c78dabefe5621e8a073fff3eb4235afb6254
>> https://gitlab.gnome.org/GNOME/glib/-/commit/01c5468e10707cbf78e6e83bbcf1ce9c866f2885
>>
>> Fixes:
>> CVE-2021-27219
>> CVE-2021-27218
>> CVE-2021-28153
> I'm getting consistent ptest failures on the autobuilder with this patch:
>
> AssertionError: Failed ptests:
> {'glib-2.0': ['glib/file.test',
>               'glib/readwrite.test',
>               'glib/live-g-file.test',
>               'glib/async-splice-output-stream.test',
>               'glib/testfilemonitor.test']}
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2285
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2577

Hmm,, I take a look.

-armin
>
> Steve
>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  .../glib-2.0/glib-2.0/CVE-2021-27218.patch    | 132 +++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_1.patch  | 175 ++++++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_10.patch |  60 ++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_2.patch  | 264 ++++++++++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_3.patch  | 138 ++++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_4.patch  | 322 ++++++++++++++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_5.patch  |  49 +++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_6.patch  |  99 ++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_7.patch  |  99 ++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_8.patch  | 101 ++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-27219_9.patch  |  57 ++++
>>  .../glib-2.0/glib-2.0/CVE-2021-28153.patch    |  28 ++
>>  .../glib-2.0/glib-2.0/CVE-2021-28153_2.patch  |  43 +++
>>  .../glib-2.0/glib-2.0/CVE-2021-28153_3.patch  |  56 +++
>>  .../glib-2.0/glib-2.0/CVE-2021-28153_4.patch  | 261 ++++++++++++++
>>  .../glib-2.0/glib-2.0/CVE-2021-28153_5.patch  |  56 +++
>>  meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |  15 +
>>  17 files changed, 1955 insertions(+)
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27218.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_1.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_10.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_2.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_3.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_4.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_5.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_6.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_7.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_8.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_9.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_2.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_3.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_4.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_5.patch
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27218.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27218.patch
>> new file mode 100644
>> index 0000000000..85d79d07f1
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27218.patch
>> @@ -0,0 +1,132 @@
>> +From 0f384c88a241bbbd884487b1c40b7b75f1e638d3 Mon Sep 17 00:00:00 2001
>> +From: Krzesimir Nowak <qdlacz@gmail.com>
>> +Date: Wed, 10 Feb 2021 23:51:07 +0100
>> +Subject: [PATCH] gbytearray: Do not accept too large byte arrays
>> +
>> +GByteArray uses guint for storing the length of the byte array, but it
>> +also has a constructor (g_byte_array_new_take) that takes length as a
>> +gsize. gsize may be larger than guint (64 bits for gsize vs 32 bits
>> +for guint). It is possible to call the function with a value greater
>> +than G_MAXUINT, which will result in silent length truncation. This
>> +may happen as a result of unreffing GBytes into GByteArray, so rather
>> +be loud about it.
>> +
>> +(Test case tweaked by Philip Withnall.)
>> +
>> +(Backport 2.66: Add #include gstrfuncsprivate.h in the test case for
>> +`g_memdup2()`.)
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27218
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + glib/garray.c      |  6 ++++++
>> + glib/gbytes.c      |  4 ++++
>> + glib/tests/bytes.c | 35 ++++++++++++++++++++++++++++++++++-
>> + 3 files changed, 44 insertions(+), 1 deletion(-)
>> +
>> +Index: glib-2.62.6/glib/garray.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/garray.c
>> ++++ glib-2.62.6/glib/garray.c
>> +@@ -2013,6 +2013,10 @@ g_byte_array_new (void)
>> +  * Create byte array containing the data. The data will be owned by the array
>> +  * and will be freed with g_free(), i.e. it could be allocated using g_strdup().
>> +  *
>> ++ * Do not use it if @len is greater than %G_MAXUINT. #GByteArray
>> ++ * stores the length of its data in #guint, which may be shorter than
>> ++ * #gsize.
>> ++ *
>> +  * Since: 2.32
>> +  *
>> +  * Returns: (transfer full): a new #GByteArray
>> +@@ -2024,6 +2028,8 @@ g_byte_array_new_take (guint8 *data,
>> +   GByteArray *array;
>> +   GRealArray *real;
>> +
>> ++  g_return_val_if_fail (len <= G_MAXUINT, NULL);
>> ++
>> +   array = g_byte_array_new ();
>> +   real = (GRealArray *)array;
>> +   g_assert (real->data == NULL);
>> +Index: glib-2.62.6/glib/gbytes.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/gbytes.c
>> ++++ glib-2.62.6/glib/gbytes.c
>> +@@ -521,6 +521,10 @@ g_bytes_unref_to_data (GBytes *bytes,
>> +  * g_bytes_new(), g_bytes_new_take() or g_byte_array_free_to_bytes(). In all
>> +  * other cases the data is copied.
>> +  *
>> ++ * Do not use it if @bytes contains more than %G_MAXUINT
>> ++ * bytes. #GByteArray stores the length of its data in #guint, which
>> ++ * may be shorter than #gsize, that @bytes is using.
>> ++ *
>> +  * Returns: (transfer full): a new mutable #GByteArray containing the same byte data
>> +  *
>> +  * Since: 2.32
>> +Index: glib-2.62.6/glib/tests/bytes.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/tests/bytes.c
>> ++++ glib-2.62.6/glib/tests/bytes.c
>> +@@ -10,12 +10,12 @@
>> +  */
>> +
>> + #undef G_DISABLE_ASSERT
>> +-#undef G_LOG_DOMAIN
>> +
>> + #include <stdio.h>
>> + #include <stdlib.h>
>> + #include <string.h>
>> + #include "glib.h"
>> ++#include "glib/gstrfuncsprivate.h"
>> +
>> + /* Keep in sync with glib/gbytes.c */
>> + struct _GBytes
>> +@@ -334,6 +334,38 @@ test_to_array_transferred (void)
>> + }
>> +
>> + static void
>> ++test_to_array_transferred_oversize (void)
>> ++{
>> ++  g_test_message ("g_bytes_unref_to_array() can only take GBytes up to "
>> ++                  "G_MAXUINT in length; test that longer ones are rejected");
>> ++
>> ++  if (sizeof (guint) >= sizeof (gsize))
>> ++    {
>> ++      g_test_skip ("Skipping test as guint is not smaller than gsize");
>> ++    }
>> ++  else if (g_test_undefined ())
>> ++    {
>> ++      GByteArray *array = NULL;
>> ++      GBytes *bytes = NULL;
>> ++      gpointer data = g_memdup2 (NYAN, N_NYAN);
>> ++      gsize len = ((gsize) G_MAXUINT) + 1;
>> ++
>> ++      bytes = g_bytes_new_take (data, len);
>> ++      g_test_expect_message (G_LOG_DOMAIN, G_LOG_LEVEL_CRITICAL,
>> ++                             "g_byte_array_new_take: assertion 'len <= G_MAXUINT' failed");
>> ++      array = g_bytes_unref_to_array (g_steal_pointer (&bytes));
>> ++      g_test_assert_expected_messages ();
>> ++      g_assert_null (array);
>> ++
>> ++      g_free (data);
>> ++    }
>> ++  else
>> ++    {
>> ++      g_test_skip ("Skipping test as testing undefined behaviour is disabled");
>> ++    }
>> ++}
>> ++
>> ++static void
>> + test_to_array_two_refs (void)
>> + {
>> +   gconstpointer memory;
>> +@@ -408,6 +440,7 @@ main (int argc, char *argv[])
>> +   g_test_add_func ("/bytes/to-data/two-refs", test_to_data_two_refs);
>> +   g_test_add_func ("/bytes/to-data/non-malloc", test_to_data_non_malloc);
>> +   g_test_add_func ("/bytes/to-array/transfered", test_to_array_transferred);
>> ++  g_test_add_func ("/bytes/to-array/transferred/oversize", test_to_array_transferred_oversize);
>> +   g_test_add_func ("/bytes/to-array/two-refs", test_to_array_two_refs);
>> +   g_test_add_func ("/bytes/to-array/non-malloc", test_to_array_non_malloc);
>> +   g_test_add_func ("/bytes/null", test_null);
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_1.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_1.patch
>> new file mode 100644
>> index 0000000000..15b90075ac
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_1.patch
>> @@ -0,0 +1,175 @@
>> +From 5e5f75a77e399c638be66d74e5daa8caeb433e00 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 13:30:52 +0000
>> +Subject: [PATCH 01/11] gstrfuncs: Add internal g_memdup2() function
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +This will replace the existing `g_memdup()` function for use within
>> +GLib. It has an unavoidable security flaw of taking its `byte_size`
>> +argument as a `guint` rather than as a `gsize`. Most callers will
>> +expect it to be a `gsize`, and may pass in large values which could
>> +silently be truncated, resulting in an undersize allocation compared
>> +to what the caller expects.
>> +
>> +This could lead to a classic buffer overflow vulnerability for many
>> +callers of `g_memdup()`.
>> +
>> +`g_memdup2()`, in comparison, takes its `byte_size` as a `gsize`.
>> +
>> +Spotted by Kevin Backhouse of GHSL.
>> +
>> +In GLib 2.68, `g_memdup2()` will be a new public API. In this version
>> +for backport to older stable releases, it’s a new `static inline` API
>> +in a private header, so that use of `g_memdup()` within GLib can be
>> +fixed without adding a new API in a stable release series.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: GHSL-2021-045
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #1
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + docs/reference/glib/meson.build |  1 +
>> + glib/gstrfuncsprivate.h         | 55 +++++++++++++++++++++++++++++++++
>> + glib/meson.build                |  1 +
>> + glib/tests/strfuncs.c           | 23 ++++++++++++++
>> + 4 files changed, 80 insertions(+)
>> + create mode 100644 glib/gstrfuncsprivate.h
>> +
>> +Index: glib-2.62.6/glib/gstrfuncsprivate.h
>> +===================================================================
>> +--- /dev/null
>> ++++ glib-2.62.6/glib/gstrfuncsprivate.h
>> +@@ -0,0 +1,55 @@
>> ++/* GLIB - Library of useful routines for C programming
>> ++ * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
>> ++ *
>> ++ * This library is free software; you can redistribute it and/or
>> ++ * modify it under the terms of the GNU Lesser General Public
>> ++ * License as published by the Free Software Foundation; either
>> ++ * version 2.1 of the License, or (at your option) any later version.
>> ++ *
>> ++ * This library is distributed in the hope that it will be useful,
>> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> ++ * Lesser General Public License for more details.
>> ++ *
>> ++ * You should have received a copy of the GNU Lesser General Public
>> ++ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>> ++ */
>> ++
>> ++#include <glib.h>
>> ++#include <string.h>
>> ++
>> ++/*
>> ++ * g_memdup2:
>> ++ * @mem: (nullable): the memory to copy.
>> ++ * @byte_size: the number of bytes to copy.
>> ++ *
>> ++ * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
>> ++ * from @mem. If @mem is %NULL it returns %NULL.
>> ++ *
>> ++ * This replaces g_memdup(), which was prone to integer overflows when
>> ++ * converting the argument from a #gsize to a #guint.
>> ++ *
>> ++ * This static inline version is a backport of the new public API from
>> ++ * GLib 2.68, kept internal to GLib for backport to older stable releases.
>> ++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
>> ++ *
>> ++ * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
>> ++ *    or %NULL if @mem is %NULL.
>> ++ * Since: 2.68
>> ++ */
>> ++static inline gpointer
>> ++g_memdup2 (gconstpointer mem,
>> ++           gsize         byte_size)
>> ++{
>> ++  gpointer new_mem;
>> ++
>> ++  if (mem && byte_size != 0)
>> ++    {
>> ++      new_mem = g_malloc (byte_size);
>> ++      memcpy (new_mem, mem, byte_size);
>> ++    }
>> ++  else
>> ++    new_mem = NULL;
>> ++
>> ++  return new_mem;
>> ++}
>> +Index: glib-2.62.6/glib/meson.build
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/meson.build
>> ++++ glib-2.62.6/glib/meson.build
>> +@@ -268,6 +268,7 @@ glib_sources = files(
>> +   'gslist.c',
>> +   'gstdio.c',
>> +   'gstrfuncs.c',
>> ++  'gstrfuncsprivate.h',
>> +   'gstring.c',
>> +   'gstringchunk.c',
>> +   'gtestutils.c',
>> +Index: glib-2.62.6/glib/tests/strfuncs.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/tests/strfuncs.c
>> ++++ glib-2.62.6/glib/tests/strfuncs.c
>> +@@ -32,6 +32,8 @@
>> + #include <string.h>
>> + #include "glib.h"
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + #if defined (_MSC_VER) && (_MSC_VER <= 1800)
>> + #define isnan(x) _isnan(x)
>> +
>> +@@ -219,6 +221,26 @@ test_memdup (void)
>> +   g_free (str_dup);
>> + }
>> +
>> ++/* Testing g_memdup2() function with various positive and negative cases */
>> ++static void
>> ++test_memdup2 (void)
>> ++{
>> ++  gchar *str_dup = NULL;
>> ++  const gchar *str = "The quick brown fox jumps over the lazy dog";
>> ++
>> ++  /* Testing negative cases */
>> ++  g_assert_null (g_memdup2 (NULL, 1024));
>> ++  g_assert_null (g_memdup2 (str, 0));
>> ++  g_assert_null (g_memdup2 (NULL, 0));
>> ++
>> ++  /* Testing normal usage cases */
>> ++  str_dup = g_memdup2 (str, strlen (str) + 1);
>> ++  g_assert_nonnull (str_dup);
>> ++  g_assert_cmpstr (str, ==, str_dup);
>> ++
>> ++  g_free (str_dup);
>> ++}
>> ++
>> + /* Testing g_strpcpy() function with various positive and negative cases */
>> + static void
>> + test_stpcpy (void)
>> +@@ -2523,6 +2545,7 @@ main (int   argc,
>> +   g_test_add_func ("/strfuncs/has-prefix", test_has_prefix);
>> +   g_test_add_func ("/strfuncs/has-suffix", test_has_suffix);
>> +   g_test_add_func ("/strfuncs/memdup", test_memdup);
>> ++  g_test_add_func ("/strfuncs/memdup2", test_memdup2);
>> +   g_test_add_func ("/strfuncs/stpcpy", test_stpcpy);
>> +   g_test_add_func ("/strfuncs/str_match_string", test_str_match_string);
>> +   g_test_add_func ("/strfuncs/str_tokenize_and_fold", test_str_tokenize_and_fold);
>> +Index: glib-2.62.6/docs/reference/glib/meson.build
>> +===================================================================
>> +--- glib-2.62.6.orig/docs/reference/glib/meson.build
>> ++++ glib-2.62.6/docs/reference/glib/meson.build
>> +@@ -22,6 +22,7 @@ if get_option('gtk_doc')
>> +     'gprintfint.h',
>> +     'gmirroringtable.h',
>> +     'gscripttable.h',
>> ++    'gstrfuncsprivate.h',
>> +     'glib-mirroring-tab',
>> +     'gnulib',
>> +     'pcre',
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_10.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_10.patch
>> new file mode 100644
>> index 0000000000..16e99874ca
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_10.patch
>> @@ -0,0 +1,60 @@
>> +From ecdf91400e9a538695a0895b95ad7e8abcdf1749 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 14:09:40 +0000
>> +Subject: [PATCH 11/11] giochannel: Forbid very long line terminator strings
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The public API `GIOChannel.line_term_len` is only a `guint`. Ensure that
>> +nul-terminated strings passed to `g_io_channel_set_line_term()` can’t
>> +exceed that length. Use `g_memdup2()` to avoid a warning (`g_memdup()`
>> +is due to be deprecated), but not to avoid a bug, since it’s also
>> +limited to `G_MAXUINT`.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #10
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + glib/giochannel.c | 17 +++++++++++++----
>> + 1 file changed, 13 insertions(+), 4 deletions(-)
>> +
>> +Index: glib-2.62.6/glib/giochannel.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/giochannel.c
>> ++++ glib-2.62.6/glib/giochannel.c
>> +@@ -884,16 +884,26 @@ g_io_channel_set_line_term (GIOChannel   *
>> +                             const gchar       *line_term,
>> +                           gint         length)
>> + {
>> ++  guint length_unsigned;
>> ++
>> +   g_return_if_fail (channel != NULL);
>> +   g_return_if_fail (line_term == NULL || length != 0); /* Disallow "" */
>> +
>> +   if (line_term == NULL)
>> +-    length = 0;
>> +-  else if (length < 0)
>> +-    length = strlen (line_term);
>> ++    length_unsigned = 0;
>> ++  else if (length >= 0)
>> ++    length_unsigned = (guint) length;
>> ++  else
>> ++    {
>> ++       /* FIXME: We’re constrained by line_term_len being a guint here */
>> ++       gsize length_size = strlen (line_term);
>> ++       g_return_if_fail (length_size > G_MAXUINT);
>> ++       length_unsigned = (guint) length_size;
>> ++  }
>> ++
>> +
>> +   g_free (channel->line_term);
>> +-  channel->line_term = line_term ? g_memdup2 (line_term, length) : NULL;
>> ++  channel->line_term = line_term ? g_memdup2 (line_term, length_unsigned) : NULL;
>> +   channel->line_term_len = length;
>> + }
>> +
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_2.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_2.patch
>> new file mode 100644
>> index 0000000000..40968435a1
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_2.patch
>> @@ -0,0 +1,264 @@
>> +From be8834340a2d928ece82025463ae23dee2c333d0 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 13:37:56 +0000
>> +Subject: [PATCH 02/11] gio: Use g_memdup2() instead of g_memdup() in obvious
>> + places
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Convert all the call sites which use `g_memdup()`’s length argument
>> +trivially (for example, by passing a `sizeof()`), so that they use
>> +`g_memdup2()` instead.
>> +
>> +In almost all of these cases the use of `g_memdup()` would not have
>> +caused problems, but it will soon be deprecated, so best port away from
>> +it.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #2
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/gdbusconnection.c                 | 5 +++--
>> + gio/gdbusinterfaceskeleton.c          | 3 ++-
>> + gio/gfile.c                           | 7 ++++---
>> + gio/gsettingsschema.c                 | 5 +++--
>> + gio/gwin32registrykey.c               | 8 +++++---
>> + gio/tests/async-close-output-stream.c | 6 ++++--
>> + gio/tests/gdbus-export.c              | 5 +++--
>> + gio/win32/gwinhttpfile.c              | 9 +++++----
>> + 8 files changed, 29 insertions(+), 19 deletions(-)
>> +
>> +Index: glib-2.62.6/gio/gdbusconnection.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/gdbusconnection.c
>> ++++ glib-2.62.6/gio/gdbusconnection.c
>> +@@ -110,6 +110,7 @@
>> + #include "gasyncinitable.h"
>> + #include "giostream.h"
>> + #include "gasyncresult.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtask.h"
>> + #include "gmarshal-internal.h"
>> +
>> +@@ -3997,7 +3998,7 @@ _g_dbus_interface_vtable_copy (const GDB
>> +   /* Don't waste memory by copying padding - remember to update this
>> +    * when changing struct _GDBusInterfaceVTable in gdbusconnection.h
>> +    */
>> +-  return g_memdup ((gconstpointer) vtable, 3 * sizeof (gpointer));
>> ++  return g_memdup2 ((gconstpointer) vtable, 3 * sizeof (gpointer));
>> + }
>> +
>> + static void
>> +@@ -4014,7 +4015,7 @@ _g_dbus_subtree_vtable_copy (const GDBus
>> +   /* Don't waste memory by copying padding - remember to update this
>> +    * when changing struct _GDBusSubtreeVTable in gdbusconnection.h
>> +    */
>> +-  return g_memdup ((gconstpointer) vtable, 3 * sizeof (gpointer));
>> ++  return g_memdup2 ((gconstpointer) vtable, 3 * sizeof (gpointer));
>> + }
>> +
>> + static void
>> +Index: glib-2.62.6/gio/gdbusinterfaceskeleton.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/gdbusinterfaceskeleton.c
>> ++++ glib-2.62.6/gio/gdbusinterfaceskeleton.c
>> +@@ -28,6 +28,7 @@
>> + #include "gdbusmethodinvocation.h"
>> + #include "gdbusconnection.h"
>> + #include "gmarshal-internal.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtask.h"
>> + #include "gioerror.h"
>> +
>> +@@ -701,7 +702,7 @@ add_connection_locked (GDBusInterfaceSke
>> +        * properly before building the hooked_vtable, so we create it
>> +        * once at the last minute.
>> +        */
>> +-      interface_->priv->hooked_vtable = g_memdup (g_dbus_interface_skeleton_get_vtable (interface_), sizeof (GDBusInterfaceVTable));
>> ++      interface_->priv->hooked_vtable = g_memdup2 (g_dbus_interface_skeleton_get_vtable (interface_), sizeof (GDBusInterfaceVTable));
>> +       interface_->priv->hooked_vtable->method_call = skeleton_intercept_handle_method_call;
>> +     }
>> +
>> +Index: glib-2.62.6/gio/gfile.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/gfile.c
>> ++++ glib-2.62.6/gio/gfile.c
>> +@@ -60,6 +60,7 @@
>> + #include "gasyncresult.h"
>> + #include "gioerror.h"
>> + #include "glibintl.h"
>> ++#include "gstrfuncsprivate.h"
>> +
>> +
>> + /**
>> +@@ -7884,7 +7885,7 @@ measure_disk_usage_progress (gboolean re
>> +   g_main_context_invoke_full (g_task_get_context (task),
>> +                               g_task_get_priority (task),
>> +                               measure_disk_usage_invoke_progress,
>> +-                              g_memdup (&progress, sizeof progress),
>> ++                              g_memdup2 (&progress, sizeof progress),
>> +                               g_free);
>> + }
>> +
>> +@@ -7902,7 +7903,7 @@ measure_disk_usage_thread (GTask
>> +                                  data->progress_callback ? measure_disk_usage_progress : NULL, task,
>> +                                  &result.disk_usage, &result.num_dirs, &result.num_files,
>> +                                  &error))
>> +-    g_task_return_pointer (task, g_memdup (&result, sizeof result), g_free);
>> ++    g_task_return_pointer (task, g_memdup2 (&result, sizeof result), g_free);
>> +   else
>> +     g_task_return_error (task, error);
>> + }
>> +@@ -7926,7 +7927,7 @@ g_file_real_measure_disk_usage_async (GF
>> +
>> +   task = g_task_new (file, cancellable, callback, user_data);
>> +   g_task_set_source_tag (task, g_file_real_measure_disk_usage_async);
>> +-  g_task_set_task_data (task, g_memdup (&data, sizeof data), g_free);
>> ++  g_task_set_task_data (task, g_memdup2 (&data, sizeof data), g_free);
>> +   g_task_set_priority (task, io_priority);
>> +
>> +   g_task_run_in_thread (task, measure_disk_usage_thread);
>> +Index: glib-2.62.6/gio/gsettingsschema.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/gsettingsschema.c
>> ++++ glib-2.62.6/gio/gsettingsschema.c
>> +@@ -20,6 +20,7 @@
>> +
>> + #include "gsettingsschema-internal.h"
>> + #include "gsettings.h"
>> ++#include "gstrfuncsprivate.h"
>> +
>> + #include "gvdb/gvdb-reader.h"
>> + #include "strinfo.c"
>> +@@ -1058,9 +1059,9 @@ g_settings_schema_list_children (GSettin
>> +
>> +       if (g_str_has_suffix (key, "/"))
>> +         {
>> +-          gint length = strlen (key);
>> ++          gsize length = strlen (key);
>> +
>> +-          strv[j] = g_memdup (key, length);
>> ++          strv[j] = g_memdup2 (key, length);
>> +           strv[j][length - 1] = '\0';
>> +           j++;
>> +         }
>> +Index: glib-2.62.6/gio/gwin32registrykey.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/gwin32registrykey.c
>> ++++ glib-2.62.6/gio/gwin32registrykey.c
>> +@@ -28,6 +28,8 @@
>> + #include <ntstatus.h>
>> + #include <winternl.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + #ifndef _WDMDDK_
>> + typedef enum _KEY_INFORMATION_CLASS {
>> +   KeyBasicInformation,
>> +@@ -247,7 +249,7 @@ g_win32_registry_value_iter_copy (const
>> +   new_iter->value_name_size = iter->value_name_size;
>> +
>> +   if (iter->value_data != NULL)
>> +-    new_iter->value_data = g_memdup (iter->value_data, iter->value_data_size);
>> ++    new_iter->value_data = g_memdup2 (iter->value_data, iter->value_data_size);
>> +
>> +   new_iter->value_data_size = iter->value_data_size;
>> +
>> +@@ -268,8 +270,8 @@ g_win32_registry_value_iter_copy (const
>> +   new_iter->value_data_expanded_charsize = iter->value_data_expanded_charsize;
>> +
>> +   if (iter->value_data_expanded_u8 != NULL)
>> +-    new_iter->value_data_expanded_u8 = g_memdup (iter->value_data_expanded_u8,
>> +-                                                 iter->value_data_expanded_charsize);
>> ++    new_iter->value_data_expanded_u8 = g_memdup2 (iter->value_data_expanded_u8,
>> ++                                                  iter->value_data_expanded_charsize);
>> +
>> +   new_iter->value_data_expanded_u8_size = iter->value_data_expanded_charsize;
>> +
>> +Index: glib-2.62.6/gio/tests/async-close-output-stream.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/tests/async-close-output-stream.c
>> ++++ glib-2.62.6/gio/tests/async-close-output-stream.c
>> +@@ -24,6 +24,8 @@
>> + #include <stdlib.h>
>> + #include <string.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + #define DATA_TO_WRITE "Hello world\n"
>> +
>> + typedef struct
>> +@@ -147,9 +149,9 @@ prepare_data (SetupData *data,
>> +
>> +   data->expected_size = g_memory_output_stream_get_data_size (G_MEMORY_OUTPUT_STREAM (data->data_stream));
>> +
>> +-  g_assert_cmpint (data->expected_size, >, 0);
>> ++  g_assert_cmpuint (data->expected_size, >, 0);
>> +
>> +-  data->expected_output = g_memdup (written, (guint)data->expected_size);
>> ++  data->expected_output = g_memdup2 (written, data->expected_size);
>> +
>> +   /* then recreate the streams and prepare them for the asynchronous close */
>> +   destroy_streams (data);
>> +Index: glib-2.62.6/gio/tests/gdbus-export.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/tests/gdbus-export.c
>> ++++ glib-2.62.6/gio/tests/gdbus-export.c
>> +@@ -23,6 +23,7 @@
>> + #include <string.h>
>> +
>> + #include "gdbus-tests.h"
>> ++#include "gstrfuncsprivate.h"
>> +
>> + /* all tests rely on a shared mainloop */
>> + static GMainLoop *loop = NULL;
>> +@@ -671,7 +672,7 @@ subtree_introspect (GDBusConnection
>> +       g_assert_not_reached ();
>> +     }
>> +
>> +-  return g_memdup (interfaces, 2 * sizeof (void *));
>> ++  return g_memdup2 (interfaces, 2 * sizeof (void *));
>> + }
>> +
>> + static const GDBusInterfaceVTable *
>> +@@ -727,7 +728,7 @@ dynamic_subtree_introspect (GDBusConnect
>> + {
>> +   const GDBusInterfaceInfo *interfaces[2] = { &dyna_interface_info, NULL };
>> +
>> +-  return g_memdup (interfaces, 2 * sizeof (void *));
>> ++  return g_memdup2 (interfaces, 2 * sizeof (void *));
>> + }
>> +
>> + static const GDBusInterfaceVTable *
>> +Index: glib-2.62.6/gio/win32/gwinhttpfile.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/win32/gwinhttpfile.c
>> ++++ glib-2.62.6/gio/win32/gwinhttpfile.c
>> +@@ -29,6 +29,7 @@
>> + #include "gio/gfile.h"
>> + #include "gio/gfileattribute.h"
>> + #include "gio/gfileinfo.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gwinhttpfile.h"
>> + #include "gwinhttpfileinputstream.h"
>> + #include "gwinhttpfileoutputstream.h"
>> +@@ -393,10 +394,10 @@ g_winhttp_file_resolve_relative_path (GF
>> +   child = g_object_new (G_TYPE_WINHTTP_FILE, NULL);
>> +   child->vfs = winhttp_file->vfs;
>> +   child->url = winhttp_file->url;
>> +-  child->url.lpszScheme = g_memdup (winhttp_file->url.lpszScheme, (winhttp_file->url.dwSchemeLength+1)*2);
>> +-  child->url.lpszHostName = g_memdup (winhttp_file->url.lpszHostName, (winhttp_file->url.dwHostNameLength+1)*2);
>> +-  child->url.lpszUserName = g_memdup (winhttp_file->url.lpszUserName, (winhttp_file->url.dwUserNameLength+1)*2);
>> +-  child->url.lpszPassword = g_memdup (winhttp_file->url.lpszPassword, (winhttp_file->url.dwPasswordLength+1)*2);
>> ++  child->url.lpszScheme = g_memdup2 (winhttp_file->url.lpszScheme, (winhttp_file->url.dwSchemeLength+1)*2);
>> ++  child->url.lpszHostName = g_memdup2 (winhttp_file->url.lpszHostName, (winhttp_file->url.dwHostNameLength+1)*2);
>> ++  child->url.lpszUserName = g_memdup2 (winhttp_file->url.lpszUserName, (winhttp_file->url.dwUserNameLength+1)*2);
>> ++  child->url.lpszPassword = g_memdup2 (winhttp_file->url.lpszPassword, (winhttp_file->url.dwPasswordLength+1)*2);
>> +   child->url.lpszUrlPath = wnew_path;
>> +   child->url.dwUrlPathLength = wcslen (wnew_path);
>> +   child->url.lpszExtraInfo = NULL;
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_3.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_3.patch
>> new file mode 100644
>> index 0000000000..fbc7559246
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_3.patch
>> @@ -0,0 +1,138 @@
>> +From 6110caea45b235420b98cd41d845cc92238f6781 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 13:39:25 +0000
>> +Subject: [PATCH 03/11] gobject: Use g_memdup2() instead of g_memdup() in
>> + obvious places
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Convert all the call sites which use `g_memdup()`’s length argument
>> +trivially (for example, by passing a `sizeof()`), so that they use
>> +`g_memdup2()` instead.
>> +
>> +In almost all of these cases the use of `g_memdup()` would not have
>> +caused problems, but it will soon be deprecated, so best port away from
>> +it.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #3
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gobject/gsignal.c     | 3 ++-
>> + gobject/gtype.c       | 9 +++++----
>> + gobject/gtypemodule.c | 3 ++-
>> + gobject/tests/param.c | 4 +++-
>> + 4 files changed, 12 insertions(+), 7 deletions(-)
>> +
>> +Index: glib-2.62.6/gobject/gsignal.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gobject/gsignal.c
>> ++++ glib-2.62.6/gobject/gsignal.c
>> +@@ -28,6 +28,7 @@
>> + #include <signal.h>
>> +
>> + #include "gsignal.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtype-private.h"
>> + #include "gbsearcharray.h"
>> + #include "gvaluecollector.h"
>> +@@ -1730,7 +1731,7 @@ g_signal_newv (const gchar       *signal
>> +   node->single_va_closure_is_valid = FALSE;
>> +   node->flags = signal_flags & G_SIGNAL_FLAGS_MASK;
>> +   node->n_params = n_params;
>> +-  node->param_types = g_memdup (param_types, sizeof (GType) * n_params);
>> ++  node->param_types = g_memdup2 (param_types, sizeof (GType) * n_params);
>> +   node->return_type = return_type;
>> +   node->class_closure_bsa = NULL;
>> +   if (accumulator)
>> +Index: glib-2.62.6/gobject/gtype.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gobject/gtype.c
>> ++++ glib-2.62.6/gobject/gtype.c
>> +@@ -33,6 +33,7 @@
>> +
>> + #include "glib-private.h"
>> + #include "gconstructor.h"
>> ++#include "gstrfuncsprivate.h"
>> +
>> + #ifdef G_OS_WIN32
>> + #include <windows.h>
>> +@@ -1470,7 +1471,7 @@ type_add_interface_Wm (TypeNode
>> +   iholder->next = iface_node_get_holders_L (iface);
>> +   iface_node_set_holders_W (iface, iholder);
>> +   iholder->instance_type = NODE_TYPE (node);
>> +-  iholder->info = info ? g_memdup (info, sizeof (*info)) : NULL;
>> ++  iholder->info = info ? g_memdup2 (info, sizeof (*info)) : NULL;
>> +   iholder->plugin = plugin;
>> +
>> +   /* create an iface entry for this type */
>> +@@ -1731,7 +1732,7 @@ type_iface_retrieve_holder_info_Wm (Type
>> +         INVALID_RECURSION ("g_type_plugin_*", iholder->plugin, NODE_NAME (iface));
>> +
>> +       check_interface_info_I (iface, instance_type, &tmp_info);
>> +-      iholder->info = g_memdup (&tmp_info, sizeof (tmp_info));
>> ++      iholder->info = g_memdup2 (&tmp_info, sizeof (tmp_info));
>> +     }
>> +
>> +   return iholder;     /* we don't modify write lock upon returning NULL */
>> +@@ -2016,10 +2017,10 @@ type_iface_vtable_base_init_Wm (TypeNode
>> +       IFaceEntry *pentry = type_lookup_iface_entry_L (pnode, iface);
>> +
>> +       if (pentry)
>> +-      vtable = g_memdup (pentry->vtable, iface->data->iface.vtable_size);
>> ++      vtable = g_memdup2 (pentry->vtable, iface->data->iface.vtable_size);
>> +     }
>> +   if (!vtable)
>> +-    vtable = g_memdup (iface->data->iface.dflt_vtable, iface->data->iface.vtable_size);
>> ++    vtable = g_memdup2 (iface->data->iface.dflt_vtable, iface->data->iface.vtable_size);
>> +   entry->vtable = vtable;
>> +   vtable->g_type = NODE_TYPE (iface);
>> +   vtable->g_instance_type = NODE_TYPE (node);
>> +Index: glib-2.62.6/gobject/gtypemodule.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gobject/gtypemodule.c
>> ++++ glib-2.62.6/gobject/gtypemodule.c
>> +@@ -19,6 +19,7 @@
>> +
>> + #include <stdlib.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtypeplugin.h"
>> + #include "gtypemodule.h"
>> +
>> +@@ -436,7 +437,7 @@ g_type_module_register_type (GTypeModule
>> +   module_type_info->loaded = TRUE;
>> +   module_type_info->info = *type_info;
>> +   if (type_info->value_table)
>> +-    module_type_info->info.value_table = g_memdup (type_info->value_table,
>> ++    module_type_info->info.value_table = g_memdup2 (type_info->value_table,
>> +                                                  sizeof (GTypeValueTable));
>> +
>> +   return module_type_info->type;
>> +Index: glib-2.62.6/gobject/tests/param.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gobject/tests/param.c
>> ++++ glib-2.62.6/gobject/tests/param.c
>> +@@ -2,6 +2,8 @@
>> + #include <glib-object.h>
>> + #include <stdlib.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + static void
>> + test_param_value (void)
>> + {
>> +@@ -851,7 +853,7 @@ main (int argc, char *argv[])
>> +             test_path = g_strdup_printf ("/param/implement/subprocess/%d-%d-%d-%d",
>> +                                          data.change_this_flag, data.change_this_type,
>> +                                          data.use_this_flag, data.use_this_type);
>> +-            test_data = g_memdup (&data, sizeof (TestParamImplementData));
>> ++            test_data = g_memdup2 (&data, sizeof (TestParamImplementData));
>> +             g_test_add_data_func_full (test_path, test_data, test_param_implement_child, g_free);
>> +             g_free (test_path);
>> +           }
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_4.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_4.patch
>> new file mode 100644
>> index 0000000000..455de08bb5
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_4.patch
>> @@ -0,0 +1,322 @@
>> +From 0736b7c1e7cf4232c5d7eb2b0fbfe9be81bd3baa Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 13:41:21 +0000
>> +Subject: [PATCH 04/11] glib: Use g_memdup2() instead of g_memdup() in obvious
>> + places
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Convert all the call sites which use `g_memdup()`’s length argument
>> +trivially (for example, by passing a `sizeof()` or an existing `gsize`
>> +variable), so that they use `g_memdup2()` instead.
>> +
>> +In almost all of these cases the use of `g_memdup()` would not have
>> +caused problems, but it will soon be deprecated, so best port away from
>> +it
>> +
>> +In particular, this fixes an overflow within `g_bytes_new()`, identified
>> +as GHSL-2021-045 by GHSL team member Kevin Backhouse.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Fixes: GHSL-2021-045
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #4
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + glib/gbytes.c               | 6 ++++--
>> + glib/gdir.c                 | 3 ++-
>> + glib/ghash.c                | 7 ++++---
>> + glib/giochannel.c           | 5 +++--
>> + glib/gslice.c               | 3 ++-
>> + glib/gtestutils.c           | 3 ++-
>> + glib/gvariant.c             | 7 ++++---
>> + glib/gvarianttype.c         | 3 ++-
>> + glib/tests/array-test.c     | 4 +++-
>> + glib/tests/option-context.c | 6 ++++--
>> + glib/tests/uri.c            | 8 +++++---
>> + 11 files changed, 35 insertions(+), 20 deletions(-)
>> +
>> +Index: glib-2.62.6/glib/gbytes.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/gbytes.c
>> ++++ glib-2.62.6/glib/gbytes.c
>> +@@ -34,6 +34,8 @@
>> +
>> + #include <string.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + /**
>> +  * GBytes:
>> +  *
>> +@@ -95,7 +97,7 @@ g_bytes_new (gconstpointer data,
>> + {
>> +   g_return_val_if_fail (data != NULL || size == 0, NULL);
>> +
>> +-  return g_bytes_new_take (g_memdup (data, size), size);
>> ++  return g_bytes_new_take (g_memdup2 (data, size), size);
>> + }
>> +
>> + /**
>> +@@ -499,7 +501,7 @@ g_bytes_unref_to_data (GBytes *bytes,
>> +        * Copy: Non g_malloc (or compatible) allocator, or static memory,
>> +        * so we have to copy, and then unref.
>> +        */
>> +-      result = g_memdup (bytes->data, bytes->size);
>> ++      result = g_memdup2 (bytes->data, bytes->size);
>> +       *size = bytes->size;
>> +       g_bytes_unref (bytes);
>> +     }
>> +Index: glib-2.62.6/glib/gdir.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/gdir.c
>> ++++ glib-2.62.6/glib/gdir.c
>> +@@ -37,6 +37,7 @@
>> + #include "gconvert.h"
>> + #include "gfileutils.h"
>> + #include "gstrfuncs.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtestutils.h"
>> + #include "glibintl.h"
>> +
>> +@@ -112,7 +113,7 @@ g_dir_open_with_errno (const gchar *path
>> +     return NULL;
>> + #endif
>> +
>> +-  return g_memdup (&dir, sizeof dir);
>> ++  return g_memdup2 (&dir, sizeof dir);
>> + }
>> +
>> + /**
>> +Index: glib-2.62.6/glib/ghash.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/ghash.c
>> ++++ glib-2.62.6/glib/ghash.c
>> +@@ -34,6 +34,7 @@
>> + #include "gmacros.h"
>> + #include "glib-private.h"
>> + #include "gstrfuncs.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gatomic.h"
>> + #include "gtestutils.h"
>> + #include "gslice.h"
>> +@@ -964,7 +965,7 @@ g_hash_table_ensure_keyval_fits (GHashTa
>> +       if (hash_table->have_big_keys)
>> +         {
>> +           if (key != value)
>> +-            hash_table->values = g_memdup (hash_table->keys, sizeof (gpointer) * hash_table->size);
>> ++            hash_table->values = g_memdup2 (hash_table->keys, sizeof (gpointer) * hash_table->size);
>> +           /* Keys and values are both big now, so no need for further checks */
>> +           return;
>> +         }
>> +@@ -972,7 +973,7 @@ g_hash_table_ensure_keyval_fits (GHashTa
>> +         {
>> +           if (key != value)
>> +             {
>> +-              hash_table->values = g_memdup (hash_table->keys, sizeof (guint) * hash_table->size);
>> ++              hash_table->values = g_memdup2 (hash_table->keys, sizeof (guint) * hash_table->size);
>> +               is_a_set = FALSE;
>> +             }
>> +         }
>> +@@ -1000,7 +1001,7 @@ g_hash_table_ensure_keyval_fits (GHashTa
>> +
>> +   /* Just split if necessary */
>> +   if (is_a_set && key != value)
>> +-    hash_table->values = g_memdup (hash_table->keys, sizeof (gpointer) * hash_table->size);
>> ++    hash_table->values = g_memdup2 (hash_table->keys, sizeof (gpointer) * hash_table->size);
>> +
>> + #endif
>> + }
>> +Index: glib-2.62.6/glib/giochannel.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/giochannel.c
>> ++++ glib-2.62.6/glib/giochannel.c
>> +@@ -37,6 +37,7 @@
>> + #include "giochannel.h"
>> +
>> + #include "gstrfuncs.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtestutils.h"
>> + #include "glibintl.h"
>> +
>> +@@ -892,7 +893,7 @@ g_io_channel_set_line_term (GIOChannel     *
>> +     length = strlen (line_term);
>> +
>> +   g_free (channel->line_term);
>> +-  channel->line_term = line_term ? g_memdup (line_term, length) : NULL;
>> ++  channel->line_term = line_term ? g_memdup2 (line_term, length) : NULL;
>> +   channel->line_term_len = length;
>> + }
>> +
>> +Index: glib-2.62.6/glib/gslice.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/gslice.c
>> ++++ glib-2.62.6/glib/gslice.c
>> +@@ -41,6 +41,7 @@
>> + #include "gmain.h"
>> + #include "gmem.h"               /* gslice.h */
>> + #include "gstrfuncs.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gutils.h"
>> + #include "gtrashstack.h"
>> + #include "gtestutils.h"
>> +@@ -350,7 +351,7 @@ g_slice_get_config_state (GSliceConfig c
>> +       array[i++] = allocator->contention_counters[address];
>> +       array[i++] = allocator_get_magazine_threshold (allocator, address);
>> +       *n_values = i;
>> +-      return g_memdup (array, sizeof (array[0]) * *n_values);
>> ++      return g_memdup2 (array, sizeof (array[0]) * *n_values);
>> +     default:
>> +       return NULL;
>> +     }
>> +Index: glib-2.62.6/glib/gtestutils.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/gtestutils.c
>> ++++ glib-2.62.6/glib/gtestutils.c
>> +@@ -49,6 +49,7 @@
>> + #include "gpattern.h"
>> + #include "grand.h"
>> + #include "gstrfuncs.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtimer.h"
>> + #include "gslice.h"
>> + #include "gspawn.h"
>> +@@ -3798,7 +3799,7 @@ g_test_log_extract (GTestLogBuffer *tbuf
>> +       if (p <= tbuffer->data->str + mlength)
>> +         {
>> +           g_string_erase (tbuffer->data, 0, mlength);
>> +-          tbuffer->msgs = g_slist_prepend (tbuffer->msgs, g_memdup (&msg, sizeof (msg)));
>> ++          tbuffer->msgs = g_slist_prepend (tbuffer->msgs, g_memdup2 (&msg, sizeof (msg)));
>> +           return TRUE;
>> +         }
>> +
>> +Index: glib-2.62.6/glib/gvariant.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/gvariant.c
>> ++++ glib-2.62.6/glib/gvariant.c
>> +@@ -33,6 +33,7 @@
>> +
>> + #include <string.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> +
>> + /**
>> +  * SECTION:gvariant
>> +@@ -725,7 +726,7 @@ g_variant_new_variant (GVariant *value)
>> +   g_variant_ref_sink (value);
>> +
>> +   return g_variant_new_from_children (G_VARIANT_TYPE_VARIANT,
>> +-                                      g_memdup (&value, sizeof value),
>> ++                                      g_memdup2 (&value, sizeof value),
>> +                                       1, g_variant_is_trusted (value));
>> + }
>> +
>> +@@ -1229,7 +1230,7 @@ g_variant_new_fixed_array (const GVarian
>> +       return NULL;
>> +     }
>> +
>> +-  data = g_memdup (elements, n_elements * element_size);
>> ++  data = g_memdup2 (elements, n_elements * element_size);
>> +   value = g_variant_new_from_data (array_type, data,
>> +                                    n_elements * element_size,
>> +                                    FALSE, g_free, data);
>> +@@ -1908,7 +1909,7 @@ g_variant_dup_bytestring (GVariant *valu
>> +   if (length)
>> +     *length = size;
>> +
>> +-  return g_memdup (original, size + 1);
>> ++  return g_memdup2 (original, size + 1);
>> + }
>> +
>> + /**
>> +Index: glib-2.62.6/glib/gvarianttype.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/gvarianttype.c
>> ++++ glib-2.62.6/glib/gvarianttype.c
>> +@@ -28,6 +28,7 @@
>> +
>> + #include <string.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> +
>> + /**
>> +  * SECTION:gvarianttype
>> +@@ -1181,7 +1182,7 @@ g_variant_type_new_tuple (const GVariant
>> +   g_assert (offset < sizeof buffer);
>> +   buffer[offset++] = ')';
>> +
>> +-  return (GVariantType *) g_memdup (buffer, offset);
>> ++  return (GVariantType *) g_memdup2 (buffer, offset);
>> + }
>> +
>> + /**
>> +Index: glib-2.62.6/glib/tests/array-test.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/tests/array-test.c
>> ++++ glib-2.62.6/glib/tests/array-test.c
>> +@@ -29,6 +29,8 @@
>> + #include <string.h>
>> + #include "glib.h"
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + /* Test data to be passed to any function which calls g_array_new(), providing
>> +  * the parameters for that call. Most #GArray tests should be repeated for all
>> +  * possible values of #ArrayTestData. */
>> +@@ -1642,7 +1644,7 @@ byte_array_new_take (void)
>> +   GByteArray *gbarray;
>> +   guint8 *data;
>> +
>> +-  data = g_memdup ("woooweeewow", 11);
>> ++  data = g_memdup2 ("woooweeewow", 11);
>> +   gbarray = g_byte_array_new_take (data, 11);
>> +   g_assert (gbarray->data == data);
>> +   g_assert_cmpuint (gbarray->len, ==, 11);
>> +Index: glib-2.62.6/glib/tests/option-context.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/tests/option-context.c
>> ++++ glib-2.62.6/glib/tests/option-context.c
>> +@@ -27,6 +27,8 @@
>> + #include <string.h>
>> + #include <locale.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + static GOptionEntry main_entries[] = {
>> +   { "main-switch", 0, 0,
>> +     G_OPTION_ARG_NONE, NULL,
>> +@@ -256,7 +258,7 @@ join_stringv (int argc, char **argv)
>> + static char **
>> + copy_stringv (char **argv, int argc)
>> + {
>> +-  return g_memdup (argv, sizeof (char *) * (argc + 1));
>> ++  return g_memdup2 (argv, sizeof (char *) * (argc + 1));
>> + }
>> +
>> + static void
>> +@@ -2323,7 +2325,7 @@ test_group_parse (void)
>> +   g_option_context_add_group (context, group);
>> +
>> +   argv = split_string ("program --test arg1 -f arg2 --group-test arg3 --frob arg4 -z arg5", &argc);
>> +-  orig_argv = g_memdup (argv, (argc + 1) * sizeof (char *));
>> ++  orig_argv = g_memdup2 (argv, (argc + 1) * sizeof (char *));
>> +
>> +   retval = g_option_context_parse (context, &argc, &argv, &error);
>> +
>> +Index: glib-2.62.6/glib/tests/uri.c
>> +===================================================================
>> +--- glib-2.62.6.orig/glib/tests/uri.c
>> ++++ glib-2.62.6/glib/tests/uri.c
>> +@@ -27,6 +27,8 @@
>> + #include <string.h>
>> + #include <stdlib.h>
>> +
>> ++#include "gstrfuncsprivate.h"
>> ++
>> + typedef struct
>> + {
>> +   char *filename;
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_5.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_5.patch
>> new file mode 100644
>> index 0000000000..c4b0ca8437
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_5.patch
>> @@ -0,0 +1,49 @@
>> +From 0cbad673215ec8a049b7fe2ff44b0beed31b376e Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 16:12:24 +0000
>> +Subject: [PATCH 05/11] gwinhttpfile: Avoid arithmetic overflow when
>> + calculating a size
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The members of `URL_COMPONENTS` (`winhttp_file->url`) are `DWORD`s, i.e.
>> +32-bit unsigned integers. Adding to and multiplying them may cause them
>> +to overflow the unsigned integer bounds, even if the result is passed to
>> +`g_memdup2()` which accepts a `gsize`.
>> +
>> +Cast the `URL_COMPONENTS` members to `gsize` first to ensure that the
>> +arithmetic is done in terms of `gsize`s rather than unsigned integers.
>> +
>> +Spotted by Sebastian Dröge.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #5
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/win32/gwinhttpfile.c | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +Index: glib-2.62.6/gio/win32/gwinhttpfile.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/win32/gwinhttpfile.c
>> ++++ glib-2.62.6/gio/win32/gwinhttpfile.c
>> +@@ -394,10 +394,10 @@ g_winhttp_file_resolve_relative_path (GF
>> +   child = g_object_new (G_TYPE_WINHTTP_FILE, NULL);
>> +   child->vfs = winhttp_file->vfs;
>> +   child->url = winhttp_file->url;
>> +-  child->url.lpszScheme = g_memdup2 (winhttp_file->url.lpszScheme, (winhttp_file->url.dwSchemeLength+1)*2);
>> +-  child->url.lpszHostName = g_memdup2 (winhttp_file->url.lpszHostName, (winhttp_file->url.dwHostNameLength+1)*2);
>> +-  child->url.lpszUserName = g_memdup2 (winhttp_file->url.lpszUserName, (winhttp_file->url.dwUserNameLength+1)*2);
>> +-  child->url.lpszPassword = g_memdup2 (winhttp_file->url.lpszPassword, (winhttp_file->url.dwPasswordLength+1)*2);
>> ++  child->url.lpszScheme = g_memdup2 (winhttp_file->url.lpszScheme, ((gsize) winhttp_file->url.dwSchemeLength + 1) * 2);
>> ++  child->url.lpszHostName = g_memdup2 (winhttp_file->url.lpszHostName, ((gsize) winhttp_file->url.dwHostNameLength + 1) * 2);
>> ++  child->url.lpszUserName = g_memdup2 (winhttp_file->url.lpszUserName, ((gsize) winhttp_file->url.dwUserNameLength + 1) * 2);
>> ++  child->url.lpszPassword = g_memdup2 (winhttp_file->url.lpszPassword, ((gsize) winhttp_file->url.dwPasswordLength + 1) * 2);
>> +   child->url.lpszUrlPath = wnew_path;
>> +   child->url.dwUrlPathLength = wcslen (wnew_path);
>> +   child->url.lpszExtraInfo = NULL;
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_6.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_6.patch
>> new file mode 100644
>> index 0000000000..9634e848c6
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_6.patch
>> @@ -0,0 +1,99 @@
>> +From f9ee2275cbc312c0b4cdbc338a4fbb76eb36fb9a Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 13:49:00 +0000
>> +Subject: [PATCH 06/11] gdatainputstream: Handle stop_chars_len internally as
>> + gsize
>> +
>> +Previously it was handled as a `gssize`, which meant that if the
>> +`stop_chars` string was longer than `G_MAXSSIZE` there would be an
>> +overflow.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #6
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/gdatainputstream.c | 25 +++++++++++++++++--------
>> + 1 file changed, 17 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/gio/gdatainputstream.c b/gio/gdatainputstream.c
>> +index 2e7750cb5..2cdcbda19 100644
>> +--- a/gio/gdatainputstream.c
>> ++++ b/gio/gdatainputstream.c
>> +@@ -27,6 +27,7 @@
>> + #include "gioenumtypes.h"
>> + #include "gioerror.h"
>> + #include "glibintl.h"
>> ++#include "gstrfuncsprivate.h"
>> +
>> + #include <string.h>
>> +
>> +@@ -856,7 +857,7 @@ static gssize
>> + scan_for_chars (GDataInputStream *stream,
>> +               gsize            *checked_out,
>> +               const char       *stop_chars,
>> +-                gssize            stop_chars_len)
>> ++                gsize             stop_chars_len)
>> + {
>> +   GBufferedInputStream *bstream;
>> +   const char *buffer;
>> +@@ -952,7 +953,7 @@ typedef struct
>> +   gsize checked;
>> +
>> +   gchar *stop_chars;
>> +-  gssize stop_chars_len;
>> ++  gsize stop_chars_len;
>> +   gsize length;
>> + } GDataInputStreamReadData;
>> +
>> +@@ -1078,12 +1079,17 @@ g_data_input_stream_read_async (GDataInputStream    *stream,
>> + {
>> +   GDataInputStreamReadData *data;
>> +   GTask *task;
>> ++  gsize stop_chars_len_unsigned;
>> +
>> +   data = g_slice_new0 (GDataInputStreamReadData);
>> +-  if (stop_chars_len == -1)
>> +-    stop_chars_len = strlen (stop_chars);
>> +-  data->stop_chars = g_memdup (stop_chars, stop_chars_len);
>> +-  data->stop_chars_len = stop_chars_len;
>> ++
>> ++  if (stop_chars_len < 0)
>> ++    stop_chars_len_unsigned = strlen (stop_chars);
>> ++  else
>> ++    stop_chars_len_unsigned = (gsize) stop_chars_len;
>> ++
>> ++  data->stop_chars = g_memdup2 (stop_chars, stop_chars_len_unsigned);
>> ++  data->stop_chars_len = stop_chars_len_unsigned;
>> +   data->last_saw_cr = FALSE;
>> +
>> +   task = g_task_new (stream, cancellable, callback, user_data);
>> +@@ -1338,17 +1344,20 @@ g_data_input_stream_read_upto (GDataInputStream  *stream,
>> +   gssize found_pos;
>> +   gssize res;
>> +   char *data_until;
>> ++  gsize stop_chars_len_unsigned;
>> +
>> +   g_return_val_if_fail (G_IS_DATA_INPUT_STREAM (stream), NULL);
>> +
>> +   if (stop_chars_len < 0)
>> +-    stop_chars_len = strlen (stop_chars);
>> ++    stop_chars_len_unsigned = strlen (stop_chars);
>> ++  else
>> ++    stop_chars_len_unsigned = (gsize) stop_chars_len;
>> +
>> +   bstream = G_BUFFERED_INPUT_STREAM (stream);
>> +
>> +   checked = 0;
>> +
>> +-  while ((found_pos = scan_for_chars (stream, &checked, stop_chars, stop_chars_len)) == -1)
>> ++  while ((found_pos = scan_for_chars (stream, &checked, stop_chars, stop_chars_len_unsigned)) == -1)
>> +     {
>> +       if (g_buffered_input_stream_get_available (bstream) ==
>> +           g_buffered_input_stream_get_buffer_size (bstream))
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_7.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_7.patch
>> new file mode 100644
>> index 0000000000..db1ec86ae8
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_7.patch
>> @@ -0,0 +1,99 @@
>> +From ba8ca443051f93a74c0d03d62e70402036f967a5 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 13:58:32 +0000
>> +Subject: [PATCH 08/11] gkeyfilesettingsbackend: Handle long keys when
>> + converting paths
>> +
>> +Previously, the code in `convert_path()` could not handle keys longer
>> +than `G_MAXINT`, and would overflow if that was exceeded.
>> +
>> +Convert the code to use `gsize` and `g_memdup2()` throughout, and
>> +change from identifying the position of the final slash in the string
>> +using a signed offset `i`, to using a pointer to the character (and
>> +`strrchr()`). This allows the slash to be at any position in a
>> +`G_MAXSIZE`-long string, without sacrificing a bit of the offset for
>> +indicating whether a slash was found.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #7
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/gkeyfilesettingsbackend.c | 21 ++++++++++-----------
>> + 1 file changed, 10 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/gio/gkeyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend.c
>> +index cd5765afd..25b057672 100644
>> +--- a/gio/gkeyfilesettingsbackend.c
>> ++++ b/gio/gkeyfilesettingsbackend.c
>> +@@ -33,6 +33,7 @@
>> + #include "gfilemonitor.h"
>> + #include "gsimplepermission.h"
>> + #include "gsettingsbackendinternal.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "giomodule-priv.h"
>> + #include "gportalsupport.h"
>> +
>> +@@ -145,8 +146,8 @@ convert_path (GKeyfileSettingsBackend  *kfsb,
>> +               gchar                   **group,
>> +               gchar                   **basename)
>> + {
>> +-  gint key_len = strlen (key);
>> +-  gint i;
>> ++  gsize key_len = strlen (key);
>> ++  const gchar *last_slash;
>> +
>> +   if (key_len < kfsb->prefix_len ||
>> +       memcmp (key, kfsb->prefix, kfsb->prefix_len) != 0)
>> +@@ -155,38 +156,36 @@ convert_path (GKeyfileSettingsBackend  *kfsb,
>> +   key_len -= kfsb->prefix_len;
>> +   key += kfsb->prefix_len;
>> +
>> +-  for (i = key_len; i >= 0; i--)
>> +-    if (key[i] == '/')
>> +-      break;
>> ++  last_slash = strrchr (key, '/');
>> +
>> +   if (kfsb->root_group)
>> +     {
>> +       /* if a root_group was specified, make sure the user hasn't given
>> +        * a path that ghosts that group name
>> +        */
>> +-      if (i == kfsb->root_group_len && memcmp (key, kfsb->root_group, i) == 0)
>> ++      if (last_slash != NULL && (last_slash - key) == kfsb->root_group_len && memcmp (key, kfsb->root_group, last_slash - key) == 0)
>> +         return FALSE;
>> +     }
>> +   else
>> +     {
>> +       /* if no root_group was given, ensure that the user gave a path */
>> +-      if (i == -1)
>> ++      if (last_slash == NULL)
>> +         return FALSE;
>> +     }
>> +
>> +   if (group)
>> +     {
>> +-      if (i >= 0)
>> ++      if (last_slash != NULL)
>> +         {
>> +-          *group = g_memdup (key, i + 1);
>> +-          (*group)[i] = '\0';
>> ++          *group = g_memdup2 (key, (last_slash - key) + 1);
>> ++          (*group)[(last_slash - key)] = '\0';
>> +         }
>> +       else
>> +         *group = g_strdup (kfsb->root_group);
>> +     }
>> +
>> +   if (basename)
>> +-    *basename = g_memdup (key + i + 1, key_len - i);
>> ++    *basename = g_memdup2 (last_slash + 1, key_len - (last_slash - key));
>> +
>> +   return TRUE;
>> + }
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_8.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_8.patch
>> new file mode 100644
>> index 0000000000..b6a9785d68
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_8.patch
>> @@ -0,0 +1,101 @@
>> +From 65ec7f4d6e8832c481f6e00e2eb007b9a60024ce Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 14:00:53 +0000
>> +Subject: [PATCH 09/11] =?UTF-8?q?gsocket:=20Use=20gsize=20to=20track=20nat?=
>> + =?UTF-8?q?ive=20sockaddr=E2=80=99s=20size?=
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Don’t use an `int`, that’s potentially too small. In practical terms,
>> +this is not a problem, since no socket address is going to be that big.
>> +
>> +By making these changes we can use `g_memdup2()` without warnings,
>> +though. Fewer warnings is good.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #8
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/gsocket.c | 16 ++++++++++------
>> + 1 file changed, 10 insertions(+), 6 deletions(-)
>> +
>> +Index: glib-2.62.6/gio/gsocket.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/gsocket.c
>> ++++ glib-2.62.6/gio/gsocket.c
>> +@@ -75,6 +75,7 @@
>> + #include "gcredentialsprivate.h"
>> + #include "glibintl.h"
>> + #include "gioprivate.h"
>> ++#include "gstrfuncsprivate.h"
>> +
>> + #ifdef G_OS_WIN32
>> + /* For Windows XP runtime compatibility, but use the system's if_nametoindex() if available */
>> +@@ -174,7 +175,7 @@ static gboolean     g_socket_datagram_ba
>> +                                                                   GError          **error);
>> +
>> + static GSocketAddress *
>> +-cache_recv_address (GSocket *socket, struct sockaddr *native, int native_len);
>> ++cache_recv_address (GSocket *socket, struct sockaddr *native, size_t native_len);
>> +
>> + static gssize
>> + g_socket_receive_message_with_timeout  (GSocket                 *socket,
>> +@@ -260,7 +261,7 @@ struct _GSocketPrivate
>> +   struct {
>> +     GSocketAddress *addr;
>> +     struct sockaddr *native;
>> +-    gint native_len;
>> ++    gsize native_len;
>> +     guint64 last_used;
>> +   } recv_addr_cache[RECV_ADDR_CACHE_SIZE];
>> + };
>> +@@ -5211,14 +5212,14 @@ g_socket_send_messages_with_timeout (GSo
>> + }
>> +
>> + static GSocketAddress *
>> +-cache_recv_address (GSocket *socket, struct sockaddr *native, int native_len)
>> ++cache_recv_address (GSocket *socket, struct sockaddr *native, size_t native_len)
>> + {
>> +   GSocketAddress *saddr;
>> +   gint i;
>> +   guint64 oldest_time = G_MAXUINT64;
>> +   gint oldest_index = 0;
>> +
>> +-  if (native_len <= 0)
>> ++  if (native_len == 0)
>> +     return NULL;
>> +
>> +   saddr = NULL;
>> +@@ -5226,7 +5227,7 @@ cache_recv_address (GSocket *socket, str
>> +     {
>> +       GSocketAddress *tmp = socket->priv->recv_addr_cache[i].addr;
>> +       gpointer tmp_native = socket->priv->recv_addr_cache[i].native;
>> +-      gint tmp_native_len = socket->priv->recv_addr_cache[i].native_len;
>> ++      gsize tmp_native_len = socket->priv->recv_addr_cache[i].native_len;
>> +
>> +       if (!tmp)
>> +         continue;
>> +@@ -5256,7 +5257,7 @@ cache_recv_address (GSocket *socket, str
>> +       g_free (socket->priv->recv_addr_cache[oldest_index].native);
>> +     }
>> +
>> +-  socket->priv->recv_addr_cache[oldest_index].native = g_memdup (native, native_len);
>> ++  socket->priv->recv_addr_cache[oldest_index].native = g_memdup2 (native, native_len);
>> +   socket->priv->recv_addr_cache[oldest_index].native_len = native_len;
>> +   socket->priv->recv_addr_cache[oldest_index].addr = g_object_ref (saddr);
>> +   socket->priv->recv_addr_cache[oldest_index].last_used = g_get_monotonic_time ();
>> +@@ -5404,6 +5405,9 @@ g_socket_receive_message_with_timeout (G
>> +     /* do it */
>> +     while (1)
>> +       {
>> ++        /* addrlen has to be of type int because that’s how WSARecvFrom() is defined */
>> ++        G_STATIC_ASSERT (sizeof addr <= G_MAXINT);
>> ++
>> +       addrlen = sizeof addr;
>> +       if (address)
>> +         result = WSARecvFrom (socket->priv->fd,
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_9.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_9.patch
>> new file mode 100644
>> index 0000000000..3177a7bcbd
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219_9.patch
>> @@ -0,0 +1,57 @@
>> +From 777b95a88f006d39d9fe6d3321db17e7b0d4b9a4 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Thu, 4 Feb 2021 14:07:39 +0000
>> +Subject: [PATCH 10/11] gtlspassword: Forbid very long TLS passwords
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The public API `g_tls_password_set_value_full()` (and the vfunc it
>> +invokes) can only accept a `gssize` length. Ensure that nul-terminated
>> +strings passed to `g_tls_password_set_value()` can’t exceed that length.
>> +Use `g_memdup2()` to avoid an overflow if they’re longer than
>> +`G_MAXUINT` similarly.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +Helps: #2319
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-27219 #9
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/gtlspassword.c | 10 ++++++++--
>> + 1 file changed, 8 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/gio/gtlspassword.c b/gio/gtlspassword.c
>> +index 1e437a7b6..dbcec41a8 100644
>> +--- a/gio/gtlspassword.c
>> ++++ b/gio/gtlspassword.c
>> +@@ -23,6 +23,7 @@
>> + #include "glibintl.h"
>> +
>> + #include "gioenumtypes.h"
>> ++#include "gstrfuncsprivate.h"
>> + #include "gtlspassword.h"
>> +
>> + #include <string.h>
>> +@@ -287,9 +288,14 @@ g_tls_password_set_value (GTlsPassword  *password,
>> +   g_return_if_fail (G_IS_TLS_PASSWORD (password));
>> +
>> +   if (length < 0)
>> +-    length = strlen ((gchar *)value);
>> ++    {
>> ++      /* FIXME: g_tls_password_set_value_full() doesn’t support unsigned gsize */
>> ++      gsize length_unsigned = strlen ((gchar *) value);
>> ++      g_return_if_fail (length_unsigned > G_MAXSSIZE);
>> ++      length = (gssize) length_unsigned;
>> ++    }
>> +
>> +-  g_tls_password_set_value_full (password, g_memdup (value, length), length, g_free);
>> ++  g_tls_password_set_value_full (password, g_memdup2 (value, (gsize) length), length, g_free);
>> + }
>> +
>> + /**
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153.patch
>> new file mode 100644
>> index 0000000000..29edf4a5a1
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153.patch
>> @@ -0,0 +1,28 @@
>> +From 78420a75aeb70569a8cd79fa0fea7b786b6f785f Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Wed, 24 Feb 2021 17:33:38 +0000
>> +Subject: [PATCH 1/5] glocalfileoutputstream: Fix a typo in a comment
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-28153 #1
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/glocalfileoutputstream.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +Index: glib-2.62.6/gio/glocalfileoutputstream.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/glocalfileoutputstream.c
>> ++++ glib-2.62.6/gio/glocalfileoutputstream.c
>> +@@ -851,7 +851,7 @@ handle_overwrite_open (const char    *fi
>> +   mode = mode_from_flags_or_info (flags, reference_info);
>> +
>> +   /* We only need read access to the original file if we are creating a backup.
>> +-   * We also add O_CREATE to avoid a race if the file was just removed */
>> ++   * We also add O_CREAT to avoid a race if the file was just removed */
>> +   if (create_backup || readable)
>> +     open_flags = O_RDWR | O_CREAT | O_BINARY;
>> +   else
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_2.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_2.patch
>> new file mode 100644
>> index 0000000000..53f304863f
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_2.patch
>> @@ -0,0 +1,43 @@
>> +From 32d3d02a50e7dcec5f4cf7908e7ac88d575d8fc5 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Wed, 24 Feb 2021 17:34:32 +0000
>> +Subject: [PATCH 2/5] tests: Stop using g_test_bug_base() in file tests
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Since a following commit is going to add a new test which references
>> +Gitlab, so it’s best to move the URI bases inside the test cases.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-28153 #2
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/tests/file.c | 4 +---
>> + 1 file changed, 1 insertion(+), 3 deletions(-)
>> +
>> +Index: glib-2.62.6/gio/tests/file.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/tests/file.c
>> ++++ glib-2.62.6/gio/tests/file.c
>> +@@ -685,7 +685,7 @@ test_replace_cancel (void)
>> +   guint count;
>> +   GError *error = NULL;
>> +
>> +-  g_test_bug ("629301");
>> ++  g_test_bug ("https://bugzilla.gnome.org/629301");
>> +
>> +   path = g_dir_make_tmp ("g_file_replace_cancel_XXXXXX", &error);
>> +   g_assert_no_error (error);
>> +@@ -1739,8 +1739,6 @@ main (int argc, char *argv[])
>> + {
>> +   g_test_init (&argc, &argv, NULL);
>> +
>> +-  g_test_bug_base ("http://bugzilla.gnome.org/");
>> +-
>> +   g_test_add_func ("/file/basic", test_basic);
>> +   g_test_add_func ("/file/build-filename", test_build_filename);
>> +   g_test_add_func ("/file/parent", test_parent);
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_3.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_3.patch
>> new file mode 100644
>> index 0000000000..a32eb190b5
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_3.patch
>> @@ -0,0 +1,56 @@
>> +From ce0eb088a68171eed3ac217cb92a72e36eb57d1b Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Wed, 10 Mar 2021 16:05:55 +0000
>> +Subject: [PATCH 3/5] glocalfileoutputstream: Factor out a flag check
>> +
>> +This clarifies the code a little. It introduces no functional changes.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-28153 #3
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/glocalfileoutputstream.c | 7 ++++---
>> + 1 file changed, 4 insertions(+), 3 deletions(-)
>> +
>> +Index: glib-2.62.6/gio/glocalfileoutputstream.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/glocalfileoutputstream.c
>> ++++ glib-2.62.6/gio/glocalfileoutputstream.c
>> +@@ -847,6 +847,7 @@ handle_overwrite_open (const char    *fi
>> +   int res;
>> +   int mode;
>> +   int errsv;
>> ++  gboolean replace_destination_set = (flags & G_FILE_CREATE_REPLACE_DESTINATION);
>> +
>> +   mode = mode_from_flags_or_info (flags, reference_info);
>> +
>> +@@ -954,7 +955,7 @@ handle_overwrite_open (const char    *fi
>> +    * to a backup file and rewrite the contents of the file.
>> +    */
>> +
>> +-  if ((flags & G_FILE_CREATE_REPLACE_DESTINATION) ||
>> ++  if (replace_destination_set ||
>> +       (!(original_stat.st_nlink > 1) && !is_symlink))
>> +     {
>> +       char *dirname, *tmp_filename;
>> +@@ -973,7 +974,7 @@ handle_overwrite_open (const char    *fi
>> +
>> +       /* try to keep permissions (unless replacing) */
>> +
>> +-      if ( ! (flags & G_FILE_CREATE_REPLACE_DESTINATION) &&
>> ++      if (!replace_destination_set &&
>> +          (
>> + #ifdef HAVE_FCHOWN
>> +           fchown (tmpfd, original_stat.st_uid, original_stat.st_gid) == -1 ||
>> +@@ -1112,7 +1113,7 @@ handle_overwrite_open (const char    *fi
>> +       }
>> +     }
>> +
>> +-  if (flags & G_FILE_CREATE_REPLACE_DESTINATION)
>> ++  if (replace_destination_set)
>> +     {
>> +       g_close (fd, NULL);
>> +
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_4.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_4.patch
>> new file mode 100644
>> index 0000000000..c8a702929e
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_4.patch
>> @@ -0,0 +1,261 @@
>> +From 317b3b587058a05dca95d56dac26568c5b098d33 Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Wed, 24 Feb 2021 17:36:07 +0000
>> +Subject: [PATCH 4/5] glocalfileoutputstream: Fix CREATE_REPLACE_DESTINATION
>> + with symlinks
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The `G_FILE_CREATE_REPLACE_DESTINATION` flag is equivalent to unlinking
>> +the destination file and re-creating it from scratch. That did
>> +previously work, but in the process the code would call `open(O_CREAT)`
>> +on the file. If the file was a dangling symlink, this would create the
>> +destination file (empty). That’s not an intended side-effect, and has
>> +security implications if the symlink is controlled by a lower-privileged
>> +process.
>> +
>> +Fix that by not opening the destination file if it’s a symlink, and
>> +adjusting the rest of the code to cope with
>> + - the fact that `fd == -1` is not an error iff `is_symlink` is true,
>> + - and that `original_stat` will contain the `lstat()` results for the
>> +   symlink now, rather than the `stat()` results for its target (again,
>> +   iff `is_symlink` is true).
>> +
>> +This means that the target of the dangling symlink is no longer created,
>> +which was the bug. The symlink itself continues to be replaced (as
>> +before) with the new file — this is the intended behaviour of
>> +`g_file_replace()`.
>> +
>> +The behaviour for non-symlink cases, or cases where the symlink was not
>> +dangling, should be unchanged.
>> +
>> +Includes a unit test.
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +
>> +Fixes: #2325
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-28153 #4
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/glocalfileoutputstream.c |  77 ++++++++++++++++++-------
>> + gio/tests/file.c             | 108 +++++++++++++++++++++++++++++++++++
>> + 2 files changed, 163 insertions(+), 22 deletions(-)
>> +
>> +Index: glib-2.62.6/gio/glocalfileoutputstream.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/glocalfileoutputstream.c
>> ++++ glib-2.62.6/gio/glocalfileoutputstream.c
>> +@@ -861,9 +861,6 @@ handle_overwrite_open (const char    *fi
>> +   /* Some systems have O_NOFOLLOW, which lets us avoid some races
>> +    * when finding out if the file we opened was a symlink */
>> + #ifdef O_NOFOLLOW
>> +-  is_symlink = FALSE;
>> +-  fd = g_open (filename, open_flags | O_NOFOLLOW, mode);
>> +-  errsv = errno;
>> + #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
>> +   if (fd == -1 && errsv == EMLINK)
>> + #elif defined(__NetBSD__)
>> +@@ -875,16 +872,22 @@ handle_overwrite_open (const char    *fi
>> +       /* Could be a symlink, or it could be a regular ELOOP error,
>> +        * but then the next open will fail too. */
>> +       is_symlink = TRUE;
>> +-      fd = g_open (filename, open_flags, mode);
>> ++      if (!replace_destination_set)
>> ++        fd = g_open (filename, open_flags, mode);
>> +     }
>> +-#else
>> +-  fd = g_open (filename, open_flags, mode);
>> +-  errsv = errno;
>> ++#else  /* if !O_NOFOLLOW */
>> +   /* This is racy, but we do it as soon as possible to minimize the race */
>> +   is_symlink = g_file_test (filename, G_FILE_TEST_IS_SYMLINK);
>> ++
>> ++  if (!is_symlink || !replace_destination_set)
>> ++    {
>> ++      fd = g_open (filename, open_flags, mode);
>> ++      errsv = errno;
>> ++    }
>> + #endif
>> +
>> +-  if (fd == -1)
>> ++  if (fd == -1 &&
>> ++      (!is_symlink || !replace_destination_set))
>> +     {
>> +       char *display_name = g_filename_display_name (filename);
>> +       g_set_error (error, G_IO_ERROR,
>> +@@ -917,16 +920,28 @@ handle_overwrite_open (const char    *fi
>> +   if (!S_ISREG (original_stat.st_mode))
>> +     {
>> +       if (S_ISDIR (original_stat.st_mode))
>> +-      g_set_error_literal (error,
>> +-                             G_IO_ERROR,
>> +-                             G_IO_ERROR_IS_DIRECTORY,
>> +-                             _("Target file is a directory"));
>> +-      else
>> +-      g_set_error_literal (error,
>> ++           {
>> ++           g_set_error_literal (error,
>> ++                                G_IO_ERROR,
>> ++                                G_IO_ERROR_IS_DIRECTORY,
>> ++                                _("Target file is a directory"));
>> ++           goto err_out;
>> ++         }
>> ++     else if (!is_symlink ||
>> ++#ifdef S_ISLNK
>> ++               !S_ISLNK (original_stat.st_mode)
>> ++#else
>> ++               FALSE
>> ++#endif
>> ++               )
>> ++     {
>> ++     g_set_error_literal (error,
>> ++
>> +                              G_IO_ERROR,
>> +                              G_IO_ERROR_NOT_REGULAR_FILE,
>> +                              _("Target file is not a regular file"));
>> +-      goto err_out;
>> ++         goto err_out;
>> ++      }
>> +     }
>> +
>> +   if (etag != NULL)
>> +@@ -1007,7 +1022,8 @@ handle_overwrite_open (const char    *fi
>> +           }
>> +       }
>> +
>> +-      g_close (fd, NULL);
>> ++      if (fd >= 0)
>> ++        g_close (fd, NULL);
>> +       *temp_filename = tmp_filename;
>> +       return tmpfd;
>> +     }
>> +Index: glib-2.62.6/gio/tests/file.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/tests/file.c
>> ++++ glib-2.62.6/gio/tests/file.c
>> +@@ -805,6 +805,113 @@ test_replace_cancel (void)
>> + }
>> +
>> + static void
>> ++test_replace_symlink (void)
>> ++{
>> ++#ifdef G_OS_UNIX
>> ++  gchar *tmpdir_path = NULL;
>> ++  GFile *tmpdir = NULL, *source_file = NULL, *target_file = NULL;
>> ++  GFileOutputStream *stream = NULL;
>> ++  const gchar *new_contents = "this is a test message which should be written to source and not target";
>> ++  gsize n_written;
>> ++  GFileEnumerator *enumerator = NULL;
>> ++  GFileInfo *info = NULL;
>> ++  gchar *contents = NULL;
>> ++  gsize length = 0;
>> ++  GError *local_error = NULL;
>> ++
>> ++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/2325");
>> ++  g_test_summary ("Test that G_FILE_CREATE_REPLACE_DESTINATION doesn’t follow symlinks");
>> ++
>> ++  /* Create a fresh, empty working directory. */
>> ++  tmpdir_path = g_dir_make_tmp ("g_file_replace_symlink_XXXXXX", &local_error);
>> ++  g_assert_no_error (local_error);
>> ++  tmpdir = g_file_new_for_path (tmpdir_path);
>> ++
>> ++  g_test_message ("Using temporary directory %s", tmpdir_path);
>> ++  g_free (tmpdir_path);
>> ++
>> ++  /* Create symlink `source` which points to `target`. */
>> ++  source_file = g_file_get_child (tmpdir, "source");
>> ++  target_file = g_file_get_child (tmpdir, "target");
>> ++  g_file_make_symbolic_link (source_file, "target", NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++
>> ++  /* Ensure that `target` doesn’t exist */
>> ++  g_assert_false (g_file_query_exists (target_file, NULL));
>> ++
>> ++  /* Replace the `source` symlink with a regular file using
>> ++   * %G_FILE_CREATE_REPLACE_DESTINATION, which should replace it *without*
>> ++   * following the symlink */
>> ++  stream = g_file_replace (source_file, NULL, FALSE  /* no backup */,
>> ++                           G_FILE_CREATE_REPLACE_DESTINATION, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++
>> ++  g_output_stream_write_all (G_OUTPUT_STREAM (stream), new_contents, strlen (new_contents),
>> ++                             &n_written, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++  g_assert_cmpint (n_written, ==, strlen (new_contents));
>> ++
>> ++  g_output_stream_close (G_OUTPUT_STREAM (stream), NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++
>> ++  g_clear_object (&stream);
>> ++
>> ++  /* At this point, there should still only be one file: `source`. It should
>> ++   * now be a regular file. `target` should not exist. */
>> ++  enumerator = g_file_enumerate_children (tmpdir,
>> ++                                          G_FILE_ATTRIBUTE_STANDARD_NAME ","
>> ++                                          G_FILE_ATTRIBUTE_STANDARD_TYPE,
>> ++                                          G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++
>> ++  info = g_file_enumerator_next_file (enumerator, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++  g_assert_nonnull (info);
>> ++
>> ++  g_assert_cmpstr (g_file_info_get_name (info), ==, "source");
>> ++  g_assert_cmpint (g_file_info_get_file_type (info), ==, G_FILE_TYPE_REGULAR);
>> ++
>> ++  g_clear_object (&info);
>> ++
>> ++  info = g_file_enumerator_next_file (enumerator, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++  g_assert_null (info);
>> ++
>> ++  g_file_enumerator_close (enumerator, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++  g_clear_object (&enumerator);
>> ++
>> ++  /* Double-check that `target` doesn’t exist */
>> ++  g_assert_false (g_file_query_exists (target_file, NULL));
>> ++
>> ++  /* Check the content of `source`. */
>> ++  g_file_load_contents (source_file,
>> ++                        NULL,
>> ++                        &contents,
>> ++                        &length,
>> ++                        NULL,
>> ++                        &local_error);
>> ++  g_assert_no_error (local_error);
>> ++  g_assert_cmpstr (contents, ==, new_contents);
>> ++  g_assert_cmpuint (length, ==, strlen (new_contents));
>> ++  g_free (contents);
>> ++
>> ++  /* Tidy up. */
>> ++  g_file_delete (source_file, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++
>> ++  g_file_delete (tmpdir, NULL, &local_error);
>> ++  g_assert_no_error (local_error);
>> ++
>> ++  g_clear_object (&target_file);
>> ++  g_clear_object (&source_file);
>> ++  g_clear_object (&tmpdir);
>> ++#else  /* if !G_OS_UNIX */
>> ++  g_test_skip ("Symlink replacement tests can only be run on Unix")
>> ++#endif
>> ++}
>> ++
>> ++static void
>> + on_file_deleted (GObject      *object,
>> +                GAsyncResult *result,
>> +                gpointer      user_data)
>> +@@ -1752,6 +1859,7 @@ main (int argc, char *argv[])
>> +   g_test_add_data_func ("/file/async-create-delete/4096", GINT_TO_POINTER (4096), test_create_delete);
>> +   g_test_add_func ("/file/replace-load", test_replace_load);
>> +   g_test_add_func ("/file/replace-cancel", test_replace_cancel);
>> ++  g_test_add_func ("/file/replace-symlink", test_replace_symlink);
>> +   g_test_add_func ("/file/async-delete", test_async_delete);
>> + #ifdef G_OS_UNIX
>> +   g_test_add_func ("/file/copy-preserve-mode", test_copy_preserve_mode);
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_5.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_5.patch
>> new file mode 100644
>> index 0000000000..b66f21589c
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153_5.patch
>> @@ -0,0 +1,56 @@
>> +From 6c6439261bc7a8a0627519848a7222b3e1bd4ffe Mon Sep 17 00:00:00 2001
>> +From: Philip Withnall <pwithnall@endlessos.org>
>> +Date: Wed, 24 Feb 2021 17:42:24 +0000
>> +Subject: [PATCH 5/5] glocalfileoutputstream: Add a missing O_CLOEXEC flag to
>> + replace()
>> +
>> +Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-28153 #5
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + gio/glocalfileoutputstream.c | 15 ++++++++++++---
>> + 1 file changed, 12 insertions(+), 3 deletions(-)
>> +
>> +Index: glib-2.62.6/gio/glocalfileoutputstream.c
>> +===================================================================
>> +--- glib-2.62.6.orig/gio/glocalfileoutputstream.c
>> ++++ glib-2.62.6/gio/glocalfileoutputstream.c
>> +@@ -58,6 +58,12 @@
>> + #define O_BINARY 0
>> + #endif
>> +
>> ++#ifndef O_CLOEXEC
>> ++#define O_CLOEXEC 0
>> ++#else
>> ++#define HAVE_O_CLOEXEC 1
>> ++#endif
>> ++
>> + struct _GLocalFileOutputStreamPrivate {
>> +   char *tmp_filename;
>> +   char *original_filename;
>> +@@ -1214,7 +1220,7 @@ _g_local_file_output_stream_replace (con
>> +   sync_on_close = FALSE;
>> +
>> +   /* If the file doesn't exist, create it */
>> +-  open_flags = O_CREAT | O_EXCL | O_BINARY;
>> ++  open_flags = O_CREAT | O_EXCL | O_BINARY | O_CLOEXEC;
>> +   if (readable)
>> +     open_flags |= O_RDWR;
>> +   else
>> +@@ -1244,8 +1250,11 @@ _g_local_file_output_stream_replace (con
>> +       set_error_from_open_errno (filename, error);
>> +       return NULL;
>> +     }
>> +-
>> +-
>> ++#if !defined(HAVE_O_CLOEXEC) && defined(F_SETFD)
>> ++  else
>> ++    fcntl (fd, F_SETFD, FD_CLOEXEC);
>> ++#endif
>> ++
>> +   stream = g_object_new (G_TYPE_LOCAL_FILE_OUTPUT_STREAM, NULL);
>> +   stream->priv->fd = fd;
>> +   stream->priv->sync_on_close = sync_on_close;
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
>> index 1a006b9f38..51e7beb876 100644
>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
>> @@ -18,6 +18,21 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>>             file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
>>             file://tzdata-update.patch \
>>             file://CVE-2020-35457.patch \
>> +           file://CVE-2021-27219_1.patch \
>> +           file://CVE-2021-27219_2.patch \
>> +           file://CVE-2021-27219_3.patch \
>> +           file://CVE-2021-27219_4.patch \
>> +           file://CVE-2021-27219_5.patch \
>> +           file://CVE-2021-27219_6.patch \
>> +           file://CVE-2021-27219_7.patch \
>> +           file://CVE-2021-27219_8.patch \
>> +           file://CVE-2021-27219_9.patch \
>> +           file://CVE-2021-27219_10.patch \
>> +           file://CVE-2021-28153.patch \
>> +           file://CVE-2021-28153_2.patch \
>> +           file://CVE-2021-28153_3.patch \
>> +           file://CVE-2021-28153_4.patch \
>> +           file://CVE-2021-28153_5.patch \
>>             "
>>
>>  SRC_URI_append_class-native = " file://relocate-modules.patch"
>> --
>> 2.25.1
>>
>>
>> 
>>

