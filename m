Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 06A53782AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 15:28:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id s2so9229756pge.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=yoj6Tc0/4esaGsb/w63aNYWHbrpy9evFEKUmSDfX3sI=;
	b=kol4+qNonzrw9sq7JCx+mQtbdL7Ms3gh+7luAvNvgPpfGFuNlStmFalta/TRwm4YuR
	l4KEhMYSOsRtDdFWRmvJN6r+ZT5JGEkHosCUTAARlewPM2AtYpbkAfDH68BV+tPzDbBi
	HZdjTo9pCYucva1Hrj+keUMKjqKe92f5sJCdmliTkQhSPpn9g7yFmwwx6V1yBvc41IXj
	jqjp5scAfaOcSnKvyoiqgZxmNS4yQfe8o9OVrv6ZIfo3VRW5Ig8R8izqVwC6tdzpz73g
	NLk/QI08DR/tzwGeI69RPtkVmGGONx9xe0EozZR5Lbq5USskwmv2IkRNW8FNFqltzjhf
	tAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=yoj6Tc0/4esaGsb/w63aNYWHbrpy9evFEKUmSDfX3sI=;
	b=kBgwy2/YEvRr1Ztmnv7C102uqwEYMc/JVOwU6MpXrzfMfFddv3ISGG1PuJtZYg8q20
	HnS5iCAjvYE6PRnB9yrqB6nHYegizl+uI1vQjdzJuShRrPYYxmJizvEW64mQxRq07bu1
	AjwU74vszBxUg4jV9QuyI0Id8cjaSLdUNxeXRVxQIZAlr9gCVStI8I/yBrYVfFuerpGw
	tK6kV/2iYQNIqTwCS/g02Zt3jg5iA1Ih7t6zLLXH8HB4ODW0g8yAP12BQaQQa7am2a3E
	HACOBQ9H1hXb6xorE7/4GvmjJFsAikvyCTtbMqc+Bh/rdccTWnIxSOUTF+JwRssH5yZD
	GxBA==
X-Gm-Message-State: AMCzsaX5tNcyfzxXppknMYLdWu9M8tcPPSOXDN+g+K4NwGrVveE5VJTX
	lFl5HWiMSkVGSTo2NyWX1ME=
X-Google-Smtp-Source: ABhQp+S63tPWjeca5s4L1f1UAECucmT3v2eXeXcGHX5gmxyJMhwjcuC9w9FuhZhrW76EoKYj3tnb2Q==
X-Received: by 10.101.78.201 with SMTP id w9mr5312946pgq.402.1509290914014;
	Sun, 29 Oct 2017 08:28:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:99d3:4afd:3860:fbf5?
	([2601:202:4001:9ea0:99d3:4afd:3860:fbf5])
	by smtp.gmail.com with ESMTPSA id
	o10sm19950541pgq.69.2017.10.29.08.28.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Oct 2017 08:28:33 -0700 (PDT)
To: Philip Balister <philip@balister.org>, Fan Xin <fan.xin@jp.fujitsu.com>,
	openembedded-core@lists.openembedded.org,
	Michael Halstead <michael@yoctoproject.org>
References: <1509069613-5005-1-git-send-email-fan.xin@jp.fujitsu.com>
	<59d43cd3-d34e-ac77-5016-34d1dd3f35f5@balister.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c4abcba1-5cee-7437-bae3-daf0500e7e1e@gmail.com>
Date: Sun, 29 Oct 2017 08:28:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <59d43cd3-d34e-ac77-5016-34d1dd3f35f5@balister.org>
Subject: Re: [PATCH] curl: update to 7.56.1
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
X-List-Received-Date: Sun, 29 Oct 2017 15:28:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 10/27/2017 03:16 AM, Philip Balister wrote:
> On 10/27/2017 04:00 AM, Fan Xin wrote:
>> 1. Update the md5sum and sha256sum for curl 7.56.1
>> 2. Delete the following patchs which have been applied in curl 7.56.1
>> 	CVE-2017-1000099.patch
>> 	CVE-2017-1000100.patch
>> 	CVE-2017-1000101.patch
>> 3. Delete the do_install_append() due to the curl/curlbuild.h have bee=
n removed.
> Can you also update the commit message to show the CVE entries in a
> standard format? We are trying to collect commits that resolve CVE's on=

> the yocto-security list.
>
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Examp=
le:_CVE_patch_header
How does that work on patches that go removed?=C2=A0

> For this mentioning the CVE without the .patch might help. cc'ing
> Michael in case he his suggesting to help the hook.
What is the point of indicating CVE's being removed?

- Armin

>
> Philip
>
>> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
>> ---
>>  .../curl/curl/CVE-2017-1000099.patch               | 41 ---------
>>  .../curl/curl/CVE-2017-1000100.patch               | 51 -----------
>>  .../curl/curl/CVE-2017-1000101.patch               | 99 -------------=
---------
>>  .../curl/{curl_7.54.1.bb =3D> curl_7.56.1.bb}        | 11 +--
>>  4 files changed, 2 insertions(+), 200 deletions(-)
>>  delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000099.pa=
tch
>>  delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000100.pa=
tch
>>  delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000101.pa=
tch
>>  rename meta/recipes-support/curl/{curl_7.54.1.bb =3D> curl_7.56.1.bb}=
 (89%)
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000099.patch b/m=
eta/recipes-support/curl/curl/CVE-2017-1000099.patch
>> deleted file mode 100644
>> index 96ff1b0..0000000
>> --- a/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From c9332fa5e84f24da300b42b1a931ade929d3e27d Mon Sep 17 00:00:00 200=
1
>> -From: Even Rouault <even.rouault@spatialys.com>
>> -Date: Tue, 1 Aug 2017 17:17:06 +0200
>> -Subject: [PATCH] file: output the correct buffer to the user
>> -
>> -Regression brought by 7c312f84ea930d8 (April 2017)
>> -
>> -CVE: CVE-2017-1000099
>> -
>> -Bug: https://curl.haxx.se/docs/adv_20170809C.html
>> -
>> -Credit to OSS-Fuzz for the discovery
>> -
>> -Upstream-Status: Backport
>> -https://github.com/curl/curl/commit/c9332fa5e84f24da300b42b1a931ade92=
9d3e27d
>> -
>> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ----
>> - lib/file.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/lib/file.c b/lib/file.c
>> -index bd426eac2..666cbe75b 100644
>> ---- a/lib/file.c
>> -+++ b/lib/file.c
>> -@@ -499,11 +499,11 @@ static CURLcode file_do(struct connectdata *con=
n, bool *done)
>> -              Curl_month[tm->tm_mon],
>> -              tm->tm_year + 1900,
>> -              tm->tm_hour,
>> -              tm->tm_min,
>> -              tm->tm_sec);
>> --    result =3D Curl_client_write(conn, CLIENTWRITE_BOTH, buf, 0);
>> -+    result =3D Curl_client_write(conn, CLIENTWRITE_BOTH, header, 0);=

>> -     if(!result)
>> -       /* set the file size to make it available post transfer */
>> -       Curl_pgrsSetDownloadSize(data, expected_size);
>> -     return result;
>> -   }
>> ---=20
>> -2.13.3
>> -
>> diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000100.patch b/m=
eta/recipes-support/curl/curl/CVE-2017-1000100.patch
>> deleted file mode 100644
>> index f74f1dd..0000000
>> --- a/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -From 358b2b131ad6c095696f20dcfa62b8305263f898 Mon Sep 17 00:00:00 200=
1
>> -From: Daniel Stenberg <daniel@haxx.se>
>> -Date: Tue, 1 Aug 2017 17:16:46 +0200
>> -Subject: [PATCH] tftp: reject file name lengths that don't fit
>> -
>> -... and thereby avoid telling send() to send off more bytes than the
>> -size of the buffer!
>> -
>> -CVE: CVE-2017-1000100
>> -
>> -Bug: https://curl.haxx.se/docs/adv_20170809B.html
>> -Reported-by: Even Rouault
>> -
>> -Credit to OSS-Fuzz for the discovery
>> -
>> -Upstream-Status: Backport
>> -https://github.com/curl/curl/commit/358b2b131ad6c095696f20dcfa62b8305=
263f898
>> -
>> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ----
>> - lib/tftp.c |    7 ++++++-
>> - 1 file changed, 6 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/lib/tftp.c b/lib/tftp.c
>> -index 02bd842..f6f4bce 100644
>> ---- a/lib/tftp.c
>> -+++ b/lib/tftp.c
>> -@@ -5,7 +5,7 @@
>> -  *                            | (__| |_| |  _ <| |___
>> -  *                             \___|\___/|_| \_\_____|
>> -  *
>> -- * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et =
al.
>> -+ * Copyright (C) 1998 - 2017, Daniel Stenberg, <daniel@haxx.se>, et =
al.
>> -  *
>> -  * This software is licensed as described in the file COPYING, which=

>> -  * you should have received as part of this distribution. The terms
>> -@@ -491,6 +491,11 @@ static CURLcode tftp_send_first(tftp_state_data_=
t *state, tftp_event_t event)
>> -     if(result)
>> -       return result;
>> -=20
>> -+    if(strlen(filename) > (state->blksize - strlen(mode) - 4)) {
>> -+      failf(data, "TFTP file name too long\n");
>> -+      return CURLE_TFTP_ILLEGAL; /* too long file name field */
>> -+    }
>> -+
>> -     snprintf((char *)state->spacket.data+2,
>> -              state->blksize,
>> -              "%s%c%s%c", filename, '\0',  mode, '\0');
>> ---=20
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000101.patch b/m=
eta/recipes-support/curl/curl/CVE-2017-1000101.patch
>> deleted file mode 100644
>> index c300fff..0000000
>> --- a/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
>> +++ /dev/null
>> @@ -1,99 +0,0 @@
>> -From 453e7a7a03a2cec749abd3878a48e728c515cca7 Mon Sep 17 00:00:00 200=
1
>> -From: Daniel Stenberg <daniel@haxx.se>
>> -Date: Tue, 1 Aug 2017 17:16:07 +0200
>> -Subject: [PATCH] glob: do not continue parsing after a strtoul() over=
flow
>> - range
>> -
>> -Added test 1289 to verify.
>> -
>> -CVE: CVE-2017-1000101
>> -
>> -Bug: https://curl.haxx.se/docs/adv_20170809A.html
>> -Reported-by: Brian Carpenter
>> -
>> -Upstream-Status: Backport
>> -https://github.com/curl/curl/commit/453e7a7a03a2cec749abd3878a48e728c=
515cca7
>> -
>> -Rebase the tests/data/Makefile.inc changes for curl 7.54.1.
>> -
>> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ----
>> - src/tool_urlglob.c      |  5 ++++-
>> - tests/data/Makefile.inc |  2 +-
>> - tests/data/test1289     | 35 +++++++++++++++++++++++++++++++++++
>> - 3 files changed, 40 insertions(+), 2 deletions(-)
>> - create mode 100644 tests/data/test1289
>> -
>> -diff --git a/src/tool_urlglob.c b/src/tool_urlglob.c
>> -index 6b1ece0..d56dcd9 100644
>> ---- a/src/tool_urlglob.c
>> -+++ b/src/tool_urlglob.c
>> -@@ -273,7 +273,10 @@ static CURLcode glob_range(URLGlob *glob, char *=
*patternp,
>> -         }
>> -         errno =3D 0;
>> -         max_n =3D strtoul(pattern, &endp, 10);
>> --        if(errno || (*endp =3D=3D ':')) {
>> -+        if(errno)
>> -+          /* overflow */
>> -+          endp =3D NULL;
>> -+        else if(*endp =3D=3D ':') {
>> -           pattern =3D endp+1;
>> -           errno =3D 0;
>> -           step_n =3D strtoul(pattern, &endp, 10);
>> -diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
>> -index 155320a..7adbee6 100644
>> ---- a/tests/data/Makefile.inc
>> -+++ b/tests/data/Makefile.inc
>> -@@ -132,7 +132,7 @@ test1252 test1253 test1254 test1255 test1256 test=
1257 test1258 test1259 \
>> - test1260 test1261 test1262 \
>> - \
>> - test1280 test1281 test1282 test1283 test1284 test1285 test1286 test1=
287 \
>> --test1288 \
>> -+test1288 test1289 \
>> - \
>> - test1300 test1301 test1302 test1303 test1304 test1305 test1306 test1=
307 \
>> - test1308 test1309 test1310 test1311 test1312 test1313 test1314 test1=
315 \
>> -diff --git a/tests/data/test1289 b/tests/data/test1289
>> -new file mode 100644
>> -index 0000000..d679cc0
>> ---- /dev/null
>> -+++ b/tests/data/test1289
>> -@@ -0,0 +1,35 @@
>> -+<testcase>
>> -+<info>
>> -+<keywords>
>> -+HTTP
>> -+HTTP GET
>> -+globbing
>> -+</keywords>
>> -+</info>
>> -+
>> -+#
>> -+# Server-side
>> -+<reply>
>> -+</reply>
>> -+
>> -+# Client-side
>> -+<client>
>> -+<server>
>> -+http
>> -+</server>
>> -+<name>
>> -+globbing with overflow and bad syntxx
>> -+</name>
>> -+<command>
>> -+http://ur%20[0-60000000000000000000
>> -+</command>
>> -+</client>
>> -+
>> -+# Verify data after the test has been "shot"
>> -+<verify>
>> -+# curl: (3) [globbing] bad range in column=20
>> -+<errorcode>
>> -+3
>> -+</errorcode>
>> -+</verify>
>> -+</testcase>
>> ---=20
>> -2.11.0
>> -
>> diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-s=
upport/curl/curl_7.56.1.bb
>> similarity index 89%
>> rename from meta/recipes-support/curl/curl_7.54.1.bb
>> rename to meta/recipes-support/curl/curl_7.56.1.bb
>> index 04aeee7..b949cc3 100644
>> --- a/meta/recipes-support/curl/curl_7.54.1.bb
>> +++ b/meta/recipes-support/curl/curl_7.56.1.bb
>> @@ -7,9 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D8;md5=
=3D3a34942f4ae3fbf1a303160714e66
>> =20
>>  SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>             file://0001-replace-krb5-config-with-pkg-config.patch \
>> -           file://CVE-2017-1000099.patch \
>> -           file://CVE-2017-1000100.patch \
>> -           file://CVE-2017-1000101.patch \
>>  "
>> =20
>>  # curl likes to set -g0 in CFLAGS, so we stop it
>> @@ -17,8 +14,8 @@ SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}=
=2Etar.bz2 \
>>  #
>>  SRC_URI +=3D " file://configure_ac.patch"
>> =20
>> -SRC_URI[md5sum] =3D "6b6eb722f512e7a24855ff084f54fe55"
>> -SRC_URI[sha256sum] =3D "fdfc4df2d001ee0c44ec071186e770046249263c491fc=
ae48df0e1a3ca8f25a0"
>> +SRC_URI[md5sum] =3D "428de25834ef8c04076906d6d5c0498e"
>> +SRC_URI[sha256sum] =3D "2594670367875e7d87b0f129b5e4690150780884d9024=
4ba0fe3e74a778b5f90"
>> =20
>>  CVE_PRODUCT =3D "libcurl"
>>  inherit autotools pkgconfig binconfig multilib_header
>> @@ -57,10 +54,6 @@ EXTRA_OECONF =3D " \
>>      --without-libpsl \
>>  "
>> =20
>> -do_install_append() {
>> -	oe_multilib_header curl/curlbuild.h
>> -}
>> -
>>  do_install_append_class-target() {
>>  	# cleanup buildpaths from curl-config
>>  	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
>>



