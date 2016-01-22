Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E25D1760AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 19:02:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so19148288wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 11:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZNO5VtcW86UJlF0uxfIsLGH+IdButW6JGMc0X4k3DZM=;
	b=bSoo4wzwzn8J4T9Eze6tmqek31szrvnmfR/IWU7Ox2Sd5FftGdzuBpmWmLTItaDepC
	NhSwCpCZjHmOC83Trchza9Afu/UjDGv3S7PfpPppYWEm4JsJmqvAmQZvPBobDEs0Fw2K
	Hne9iAqJB7vYiALs+t9EbS6is52nrI/AkMXLSez3xJ5L7ZHTsP3c17EE7xmUWDr24KQr
	54E8Tae8jYkB6kQ6140GDcmTVdFIuPPmMund5nGy2V4aM8jzcEqxbfocYKU67wyGbVEI
	g88x4q9sXO0vB2gGMQrY/rNOjghR9qxnBH57QWIGz+FY1fvVdp9l1Ajy+iUUgmBKpHyY
	MAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ZNO5VtcW86UJlF0uxfIsLGH+IdButW6JGMc0X4k3DZM=;
	b=k/dr85LURxcoGPyuu0J6k6sjBWiEdGRvsJWAnNzUn33TtP4HbU0b898Eazgf0ILqZZ
	OkgUqZx/4c7C2ONd3N1YnxZBaEtrP5EIR3qrMnA7peKfMAK6UDpkEHma9tcfB+1D3h4B
	ulbYrZsExAh/CU8IrdGrE4Nrivk6HEHIfVf+QLDbthMwrv9WLuHZAxh0Q3i62oHvkIKs
	mohfWs4BXstbrrPk2SfMTw7UserTkEHumRmsHjH2M0kr/1wXS4p1FHPqPgD2zLD/28N+
	TLmhHTn54Rep2DF1/SRiAnTsY6JHYklGdFZoROFw3EafV6vu7Qwub8P0M7gm+uAwzijc
	tNlw==
X-Gm-Message-State: AG10YORkzWjKRJK9L6pmdsI7VAffeyg6VSi77fxtMwFb2aA+7sd+CSVztJUeWEp1GSrYg8oJ9RUzIVHtaKqIZw==
MIME-Version: 1.0
X-Received: by 10.28.182.133 with SMTP id g127mr5003494wmf.61.1453489379186;
	Fri, 22 Jan 2016 11:02:59 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 22 Jan 2016 11:02:59 -0800 (PST)
In-Reply-To: <CAJ86T=Uc5XTZu5UGPZfck9Vt6V-c=dBTD9mXdq+ZaT_0qsz7mw@mail.gmail.com>
References: <1452681963-25495-1-git-send-email-maxin.john@intel.com>
	<CAJ86T=Uc5XTZu5UGPZfck9Vt6V-c=dBTD9mXdq+ZaT_0qsz7mw@mail.gmail.com>
Date: Fri, 22 Jan 2016 11:02:59 -0800
Message-ID: <CAJ86T=Vk8ztbp-Sos0U1X7JtgJ+TqUV6mMs9c7B6rUPDW-gkfg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sqlite3: upgrade to version 3.10.0
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
X-List-Received-Date: Fri, 22 Jan 2016 19:02:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 21, 2016 at 11:08 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jan 13, 2016 at 2:46 AM, Maxin B. John <maxin.john@intel.com> wrote:
>> 3.9.2 -> 3.10.0
>>
>> 1. Fixed a parallel build problem
>> 2. Added a PACKAGECONFIG for readline
>>
>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> ---
>>  meta/recipes-support/sqlite/sqlite3.inc            |  2 ++
>>  meta/recipes-support/sqlite/sqlite3/parallel.patch | 24 ++++++++++++++++++++++
>>  .../sqlite/{sqlite3_3.9.2.bb => sqlite3_3.10.0.bb} |  8 +++++---
>>  3 files changed, 31 insertions(+), 3 deletions(-)
>>  create mode 100644 meta/recipes-support/sqlite/sqlite3/parallel.patch
>>  rename meta/recipes-support/sqlite/{sqlite3_3.9.2.bb => sqlite3_3.10.0.bb} (71%)
>>
>> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
>> index 2e3791b..5eb5de3 100644
>> --- a/meta/recipes-support/sqlite/sqlite3.inc
>> +++ b/meta/recipes-support/sqlite/sqlite3.inc
>> @@ -9,6 +9,8 @@ inherit autotools pkgconfig
>>
>>  EXTRA_OECONF = "--enable-shared --enable-threadsafe"
>>  EXTRA_OECONF_class-native = "--enable-shared --enable-threadsafe --disable-readline"
>> +PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
>
> Adding this without also adding PACKAGECONFIG ?= "readline" or similar
> means target sqlite3 will now build with readline support disabled.
>
> Was that the intention?
>
>>  export config_BUILD_CC = "${BUILD_CC}"
>>  export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
>>  export config_BUILD_LIBS = "${BUILD_LDFLAGS}"
>> diff --git a/meta/recipes-support/sqlite/sqlite3/parallel.patch b/meta/recipes-support/sqlite/sqlite3/parallel.patch
>> new file mode 100644
>> index 0000000..87471f0
>> --- /dev/null
>> +++ b/meta/recipes-support/sqlite/sqlite3/parallel.patch
>> @@ -0,0 +1,24 @@
>> +build: Fix parallel build problems
>> +
>> +Avoid parallel build errors related to sqlite3.o target.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> +---
>> +diff -Naur sqlite-autoconf-3100000-orig/Makefile.am sqlite-autoconf-3100000/Makefile.am
>> +--- sqlite-autoconf-3100000-orig/Makefile.am  2016-01-06 14:03:00.000000000 +0200
>> ++++ sqlite-autoconf-3100000/Makefile.am       2016-01-12 13:14:03.620117514 +0200
>> +@@ -6,10 +6,8 @@
>> + libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
>> +
>> + bin_PROGRAMS = sqlite3
>> +-sqlite3_SOURCES = shell.c sqlite3.h
>> +-EXTRA_sqlite3_SOURCES = sqlite3.c
>> +-sqlite3_LDADD = @EXTRA_SHELL_OBJ@ @READLINE_LIBS@
>> +-sqlite3_DEPENDENCIES = @EXTRA_SHELL_OBJ@
>> ++sqlite3_SOURCES = shell.c sqlite3.c sqlite3.h
>> ++sqlite3_LDADD = @READLINE_LIBS@
>> + sqlite3_CFLAGS = $(AM_CFLAGS)

This change is wrong. If you unconditionally add sqlite3.c to
sqlite3_SOURCES you break the option of dynamically linking sqlite3
with libsqlite3.so (ie the configure option --disable-static-shell).

(For building in OE we should probably be configuring with
--disable-static-shell by default).

What was the original parallel build issue you were seeing?

>> + include_HEADERS = sqlite3.h sqlite3ext.h
>> diff --git a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
>> similarity index 71%
>> rename from meta/recipes-support/sqlite/sqlite3_3.9.2.bb
>> rename to meta/recipes-support/sqlite/sqlite3_3.10.0.bb
>> index 18b1a2b..092f782 100644
>> --- a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb
>> +++ b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
>> @@ -10,10 +10,12 @@ def sqlite_download_version(d):
>>
>>  PE = "3"
>>  SQLITE_PV = "${@sqlite_download_version(d)}"
>> -SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz"
>> +SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
>> +           file://parallel.patch \
>> +          "
>>
>> -SRC_URI[md5sum] = "bc4eb5b3fc5cfcb6e059794306cac1ca"
>> -SRC_URI[sha256sum] = "064c0abe9c9177534d4c770bca7a5902f9924b629ac886b4c08956be6dfbc36b"
>> +SRC_URI[md5sum] = "274364e6ca5c1104d42912f11e61ed26"
>> +SRC_URI[sha256sum] = "43cc292d70711fa7580250c8a1cd7c64813a4a0a479dbd502cce5f10b5d91042"
>>
>>  UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
>>  UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
>> --
>> 2.4.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

