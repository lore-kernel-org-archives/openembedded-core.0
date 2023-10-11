Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637C8CD6E7F
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 15:52:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.20199.1697039554863461358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 08:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLqkeHk4;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso6554824f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697039553; x=1697644353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1NC/GqHm0FukhyqvjEltUaec7InCuvIcvjdoTcVFss=;
        b=RLqkeHk4qEqD/MBuTqJFNTJ6U1E1I8I/RC3VJrpmrCE72HamiW5S7xHIZb3E0+5v4U
         NmCSbChO99gU02ZGvghjtpe9e3cFYm1NsTwaPAf1mwjszJQDJnyfHfatFR2WtJcAB3rd
         OgCUXPxntZVs80ven1Fsm8KKZj25h2ynzyzr5cv9JgW6MpwoAUQPpbZOVer+R6K7QdY0
         S8vD1WGqH/kyKQg4RydkKuKZW13xuBc75Vw44utW112gvuPVC2t7CXu/teq/2+DolMuM
         yLq0jnh+Rs4M9IHSta1A84V3S5vakneLP7FZFLwrpfElCzMcRuKVpmrmT/Nnh1GjEcpq
         mZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697039553; x=1697644353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1NC/GqHm0FukhyqvjEltUaec7InCuvIcvjdoTcVFss=;
        b=T+l0Y2lZ47/f2obtwvSL0+wAg8r0L+tkj1eIQ4kjKQQmNtje0vR8oBKh12BG2/4alR
         0UiXmiepEI/botGjZwbIop2vEiGWM49tr83g9Ivtd3uo/oaYriyQgcrqagPWbPZD63uh
         QBm1OMFtvhVV0SFUUyPTKQI0sHQIZs/tzQ6nEJlKPZQRVXZ72RJ8fwP8Qe4C5YeTKxf+
         hrDvm9n5PHPyE1ENKBdA7rWMy1wqbG+aYsTsD3qgX4eXe1In0LT90o7duDpj3S0QbnrZ
         7SiZW9CLHvUWp/+PfLiCfyutZbyhVZqxw97shQYdKIo/lTXPi4N5qqGvcvd57livy+uU
         rr7w==
X-Gm-Message-State: AOJu0YxKnHpWqDksfvLvUd22mfuUF+oSw25QHr0t2V4sgm6HVTE0qkVJ
	mIMBi1wYMoUgFGOj/LxWGjAqFOfzcKLB//u7
X-Google-Smtp-Source: AGHT+IFyaWbvLeE0g8P2tjJ6s+opZybjejK87bV6GkNnImoJrqxOftq+MtXbi3mLKd1sLMoazJEiig==
X-Received: by 2002:a5d:574f:0:b0:324:884a:5cd0 with SMTP id q15-20020a5d574f000000b00324884a5cd0mr17529939wrw.47.1697039552784;
        Wed, 11 Oct 2023 08:52:32 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d4052000000b00317e77106dbsm15808262wrp.48.2023.10.11.08.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 08:52:32 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] curl: 8.3.0 -> 8.4.0
Date: Wed, 11 Oct 2023 15:52:10 +0000
Message-Id: <20231011155210.3781972-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 15:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188964

curl and libcurl 8.4.0

 Public curl releases:         252
 Command line options:         258
 curl_easy_setopt() options:   303
 Public functions in libcurl:  93
 Contributors:                 2995

This release includes the following changes:

 o curl: add support for the IPFS protocols via HTTP gateway [46]
 o curl_multi_get_handles: get easy handles from a multi handle [20]
 o mingw: delete support for legacy mingw.org toolchain [45]

This release includes the following bugfixes:

 o acinclude.m4: Document proper system truststore on FreeBSD [83]
 o appveyor: fix yamlint issues, indent [67]
 o appveyor: rewrite batch in PowerShell + CI improvements [109]
 o autotools: adjust `CURL_CA_PATH` value to CMake [53]
 o autotools: restore `HAVE_IOCTL_*` detections [111]
 o base64: also build for curl [78]
 o bufq: remove Curl_bufq_skip_and_shift (unused) [47]
 o build: delete checks for C89 standard headers [65]
 o build: do not publish `HAVE_BORINGSSL`, `HAVE_AWSLC` macros [114]
 o cf-socket: simulate slow/blocked receives in debug [120]
 o cmake, configure: also link with CoreServices [32]
 o cmake: add check for suseconds_t [91]
 o cmake: add feature checks for `memrchr` and `getifaddrs` [57]
 o cmake: add missing checks [86]
 o cmake: delete old `HAVE_LDAP_URL_PARSE` logic [105]
 o cmake: detect `HAVE_CLOCK_GETTIME_MONOTONIC_RAW` [75]
 o cmake: detect `HAVE_GETADDRINFO_THREADSAFE` [76]
 o cmake: detect `sys/wait.h` and `netinet/udp.h` [61]
 o cmake: detect TLS-SRP in OpenSSL/wolfSSL/GnuTLS [93]
 o cmake: disable unity mode with Windows Unicode + TrackMemory [108]
 o cmake: fix `HAVE_LDAP_SSL`, `HAVE_LDAP_URL_PARSE` on non-Windows [110]
 o cmake: fix `HAVE_WRITABLE_ARGV` detection [77]
 o cmake: fix duplicate symbols when linking tests [73]
 o cmake: fix missing `zlib.h` when compiling `libcurltool` [72]
 o cmake: fix stderr initialization in unity builds [71]
 o cmake: fix the help text to the static build option in CMakeLists.txt [10]
 o cmake: fix unity builds for more build combinations [96]
 o cmake: fix unity symbol collisions in h2 builds [48]
 o cmake: fix unity with Windows Unicode + TrackMemory [107]
 o cmake: improve OpenLDAP builds [92]
 o cmake: lib `CURL_STATICLIB` fixes (Windows) [74]
 o cmake: move global headers to specific checks [58]
 o cmake: pre-cache `HAVE_BASENAME` for mingw-w64 and MSVC [85]
 o cmake: pre-cache `HAVE_POLL_FINE` on Windows [36]
 o cmake: tidy-up `NOT_NEED_LBER_H` detection
 o cmake: validate `CURL_DEFAULT_SSL_BACKEND` config value [50]
 o configure: check for the capath by default [63]
 o configure: remove unused checks [87]
 o configure: replace adhoc domain with `localhost` in tests [79]
 o configure: sort AC_CHECK_FUNCS
 o connect: expire the timeout when trying next [54]
 o connect: only start the happy eyeballs timer when needed [95]
 o cookie: do not store the expire or max-age strings [16]
 o cookie: remove unnecessary struct fields [17]
 o cookie: set ->running in cookie_init even if data is NULL [5]
 o create-dirs.d: clarify it also uses --output-dirs [66]
 o curl.h: mark CURLSSLBACKEND_NSS as deprecated since 8.3.0 [18]
 o curl_easy_pause.3: mention h2/h3 buffering [113]
 o curl_easy_pause.3: mention it works within callbacks [112]
 o curl_easy_pause: set "in callback" true on exit if true [100]
 o CURLOPT_DEBUGFUNCTION.3: warn about internal handles [122]
 o docs/libcurl/opts/Makefile.inc: add missing manpage files
 o docs: adapt SEE ALSO sections to new requirements [52]
 o docs: explain how PINNEDPUBLICKEY is independent of VERIFYPEER [68]
 o docs: replace made up domains with example.com [82]
 o docs: update curl man page references [89]
 o docs: use CURLSSLBACKEND_NONE [19]
 o doh: inherit DEBUGFUNCTION/DATA [12]
 o escape: replace Curl_isunreserved with ISUNRESERVED [2]
 o FAQ: How do I upgrade curl.exe in Windows? [84]
 o GHA/linux: run singleuse to detect single-use global functions [35]
 o GHA: add workflow to compare configure vs cmake outputs [102]
 o h2-proxy: remove left-over mistake in drain_tunnel() [7]
 o h2: testcase and fix for pausing h2 streams [49]
 o h3: add support for ngtcp2 with AWS-LC builds [103]
 o http2: refused stream handling for retry [121]
 o http: fix CURL_DISABLE_BEARER_AUTH breakage [28]
 o http: h1/h2 proxy unification [21]
 o http: remove wrong comment for http_should_fail [55]
 o http: use per-request counter to check too large headers [6]
 o http_aws_sigv4: fix sorting with empty parts [13]
 o idn: fix WinIDN null ptr deref on bad host [90]
 o idn: if idn2_check_version returns NULL, return error [27]
 o inet_ntop: add typecast to silence Coverity [51]
 o lib: disambiguate Curl_client_write flag semantics [24]
 o lib: enable hmac for digest as well [26]
 o lib: failf/infof compiler warnings [8]
 o lib: let the max filesize option stop too big transfers too [44]
 o lib: move handling of `data->req.writer_stack` into Curl_client_write() [97]
 o lib: provide and use Curl_hexencode [62]
 o lib: remove TIME_WITH_SYS_TIME [88]
 o lib: use wrapper for curl_mime_data fseek callback [30]
 o libssh2: fix error message on failed pubkey-from-file [22]
 o libssh: cap SFTP packet size sent [14]
 o Makefile.mk: always set `CURL_STATICLIB` for lib (Windows) [42]
 o MANUAL.md: change domain to example.com [11]
 o misc: better random strings [15]
 o MQTT: improve receive of ACKs [125]
 o multi: do CURLM_CALL_MULTI_PERFORM at two more places [99]
 o multi: fix small timeouts [70]
 o multi: remove Curl_multi_dump [37]
 o multi: round the timeout up to prevent early wakeups [98]
 o multi: set CURLM_CALL_MULTI_PERFORM after switch to DOING_MORE [115]
 o openssl: improve ssl shutdown handling [69]
 o openssl: use X509_ALGOR_get0 instead of reaching into X509_ALGOR [104]
 o pytest: exclude test_03_goaway in CI runs due to timing dependency [23]
 o quic: set ciphers/curves the same way regular TLS does [43]
 o quiche: fix build error with --with-ca-fallback [1]
 o RELEASE-PROCEDURE.md: updated coming release dates
 o runtests: display the test status if tests appear hung [81]
 o runtests: eliminate a warning on old perl versions
 o socks: return error if hostname too long for remote resolve [118]
 o src/mkhelp: make generated code pass `checksrc` [59]
 o test1056: disable on Windows
 o test1474: disable test on NetBSD, OpenBSD and Solaris 10 [31]
 o test1592: greatly increase the maximum test timeout
 o test1903: actually verify the cookies after the test [116]
 o test1906: set a lower timeout since it's hit on Windows [117]
 o test2600: remove special case handling for USE_ALARM_TIMEOUT [3]
 o test650: fix an end tag typo
 o test661: return from test early in case of curl error
 o test: add missing <feature>s
 o tests: close the shell used to start sshd [41]
 o tests: fix a race condition in ftp server disconnect [101]
 o tests: fix compiler warnings [38]
 o tests: Fix zombie processes left behind by FTP tests. [80]
 o tests: improve SLOWDOWN test reliability by reducing sent data
 o tests: increase lib571 timeout from 3s to 30s [106]
 o tests: log the test result code after each libtest
 o tests: propagate errors in libtests
 o tests: set --expect100-timeout to improve test reliability
 o tests: show which curl tool `runtests.pl` is using [60]
 o tests: stop overriding the lock timeout
 o tftpd: always use curl's own tftp.h [25]
 o tool: use our own stderr variable [94]
 o tool_cb_wrt: fix debug assertion [4]
 o tool_getparam: accept variable expansion on file names too [123]
 o tool_setopt: remove unused function tool_setopt_flags [56]
 o upload-file.d: describe the file name slash/backslash handling [9]
 o url: fall back to http/https proxy env-variable if ws/wss not set [119]
 o url: fix netrc info message [39]
 o warnless: remove unused functions [33]
 o wolfssh: do cleanup in Curl_ssh_cleanup [40]
 o wolfssl: allow capath with CURLOPT_CAINFO_BLOB [29]
 o wolfssl: if CURLOPT_CAINFO_BLOB is set, ignore the CA files [34]
 o wolfssl: ignore errors in CA path [64]

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-support/curl/{curl_8.3.0.bb => curl_8.4.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/curl/{curl_8.3.0.bb => curl_8.4.0.bb} (100%)

diff --git a/meta/recipes-support/curl/curl_8.3.0.bb b/meta/recipes-support/curl/curl_8.4.0.bb
similarity index 100%
rename from meta/recipes-support/curl/curl_8.3.0.bb
rename to meta/recipes-support/curl/curl_8.4.0.bb
-- 
2.34.1


