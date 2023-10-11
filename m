Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88112E95A9F
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:15:12 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.20817.1697040906167403006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 09:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T3NXR/1f;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7a7e11a53c3so728402241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 09:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697040905; x=1697645705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPi7UBmLh0CGHFiNJBDCKn8JKjcKXBTgUiElmElbqmo=;
        b=T3NXR/1fle1DWzDjMzdbR0fivbq3walhLJlHtsE6BDoIW7HzUhQ2PVLOAGAk3fAzWc
         I5tYjTh/ENhiqT56r9t7gOU9CqulRT+toXrDjJNAlvJf8mLklare4+d/j60qOX6whF6w
         GSSyifd1rdtBW3xTQdvCLGlQn3KWdNFUokuRSrMZlKGDKB3+/yCdASI4PmtxfzHbocrG
         yD2vSQWY8hYp5FFIEm/fBSSyV/RU2plxEPabNyi0GwY3k6Z65y2zRJtqbe26BhRYuqPn
         UvqsKDXG0HCco9+mFOhdMBUVnUk/U6fM18bLd19N6tgPn6OYbRYbj0xgHxaaG0JaynnQ
         cK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697040905; x=1697645705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPi7UBmLh0CGHFiNJBDCKn8JKjcKXBTgUiElmElbqmo=;
        b=pr0CIn1Hhg3R/k6d5/SJlAX7W0Zc2ygz/oDtEVAyk4GzPgLgHK5nSBfBToX2nixKhS
         FuSZ95J3tR+iVq1L3v+aeP+xTnHapAH75zr/1azn6A/m7owLuuKrTeuFNGRFvN1+OZRm
         SlrEbjS+C6hgA11bsW+56Nevm+YSvtBy7BwIF8CzwbATtF7H0anvE3RAsWUauWlRLl1Z
         MJ0ezSYMvlrYYHbI0Td4C533Su+poZeQk/1tqAYZ8qC+tO5UBLK5bSiEqBNVTaoFU4td
         TJKRVBYyKjLt6YTBOSgiGDEUsZu2QBD0pKrqcsA07QyKGzkqCgg6Cgt9DAZRa1Y/EKXL
         UYzg==
X-Gm-Message-State: AOJu0Yz9w8s9TQj81FNWhsoHgTHoNSAw1Gsv2EVaxyAaU2i6qH7lhKaA
	A1AW7nX5VTm2hR5+383juajxPhaUTeiBi5z7P/Y=
X-Google-Smtp-Source: AGHT+IH3glDtftDCIMPE3+0NAAccagyg/VfImZsGTiamIss5egMZJOKELlxnroU6kKjzf7WhqLD3sfWeB8Xl77gPPFo=
X-Received: by 2002:a05:6102:38d4:b0:455:dd1c:9653 with SMTP id
 k20-20020a05610238d400b00455dd1c9653mr11453034vst.1.1697040903563; Wed, 11
 Oct 2023 09:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231011155319.3782038-1-jose.quaresma@foundries.io> <CANNYZj-vk9LB64Sp_R2appE4XxSVF_FNpq4G+7zLMroOh4Knbg@mail.gmail.com>
In-Reply-To: <CANNYZj-vk9LB64Sp_R2appE4XxSVF_FNpq4G+7zLMroOh4Knbg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 11 Oct 2023 17:14:52 +0100
Message-ID: <CANPvuRnfZKJ8p5BdxReDFAqV1-JWNZpkqUKyb8boTi4kmyyEPg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] curl: 8.3.0 -> 8.4.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jose Quaresma <jose.quaresma@foundries.io>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000039f4d206077320a7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 16:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188967

--00000000000039f4d206077320a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quarta,
11/10/2023 =C3=A0(s) 17:05:

> I do recommend using =E2=80=98devtool upgrade=E2=80=99 as it will take ca=
re of updating
> the checksums in the recipe, and will rebase the patches. Did you run at
> least one build with v2, given that v1 was clearly not tested?
>

The build I had run was with the v2 SRC_URI hash but I forgot to update my
local commit and only saw that after sending it to the mailing list.

Jose


>
> Alex
>
> On Wed 11. Oct 2023 at 17.54, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
>> curl and libcurl 8.4.0
>>
>>  Public curl releases:         252
>>  Command line options:         258
>>  curl_easy_setopt() options:   303
>>  Public functions in libcurl:  93
>>  Contributors:                 2995
>>
>> This release includes the following changes:
>>
>>  o curl: add support for the IPFS protocols via HTTP gateway [46]
>>  o curl_multi_get_handles: get easy handles from a multi handle [20]
>>  o mingw: delete support for legacy mingw.org toolchain [45]
>>
>> This release includes the following bugfixes:
>>
>>  o acinclude.m4: Document proper system truststore on FreeBSD [83]
>>  o appveyor: fix yamlint issues, indent [67]
>>  o appveyor: rewrite batch in PowerShell + CI improvements [109]
>>  o autotools: adjust `CURL_CA_PATH` value to CMake [53]
>>  o autotools: restore `HAVE_IOCTL_*` detections [111]
>>  o base64: also build for curl [78]
>>  o bufq: remove Curl_bufq_skip_and_shift (unused) [47]
>>  o build: delete checks for C89 standard headers [65]
>>  o build: do not publish `HAVE_BORINGSSL`, `HAVE_AWSLC` macros [114]
>>  o cf-socket: simulate slow/blocked receives in debug [120]
>>  o cmake, configure: also link with CoreServices [32]
>>  o cmake: add check for suseconds_t [91]
>>  o cmake: add feature checks for `memrchr` and `getifaddrs` [57]
>>  o cmake: add missing checks [86]
>>  o cmake: delete old `HAVE_LDAP_URL_PARSE` logic [105]
>>  o cmake: detect `HAVE_CLOCK_GETTIME_MONOTONIC_RAW` [75]
>>  o cmake: detect `HAVE_GETADDRINFO_THREADSAFE` [76]
>>  o cmake: detect `sys/wait.h` and `netinet/udp.h` [61]
>>  o cmake: detect TLS-SRP in OpenSSL/wolfSSL/GnuTLS [93]
>>  o cmake: disable unity mode with Windows Unicode + TrackMemory [108]
>>  o cmake: fix `HAVE_LDAP_SSL`, `HAVE_LDAP_URL_PARSE` on non-Windows [110=
]
>>  o cmake: fix `HAVE_WRITABLE_ARGV` detection [77]
>>  o cmake: fix duplicate symbols when linking tests [73]
>>  o cmake: fix missing `zlib.h` when compiling `libcurltool` [72]
>>  o cmake: fix stderr initialization in unity builds [71]
>>  o cmake: fix the help text to the static build option in CMakeLists.txt
>> [10]
>>  o cmake: fix unity builds for more build combinations [96]
>>  o cmake: fix unity symbol collisions in h2 builds [48]
>>  o cmake: fix unity with Windows Unicode + TrackMemory [107]
>>  o cmake: improve OpenLDAP builds [92]
>>  o cmake: lib `CURL_STATICLIB` fixes (Windows) [74]
>>  o cmake: move global headers to specific checks [58]
>>  o cmake: pre-cache `HAVE_BASENAME` for mingw-w64 and MSVC [85]
>>  o cmake: pre-cache `HAVE_POLL_FINE` on Windows [36]
>>  o cmake: tidy-up `NOT_NEED_LBER_H` detection
>>  o cmake: validate `CURL_DEFAULT_SSL_BACKEND` config value [50]
>>  o configure: check for the capath by default [63]
>>  o configure: remove unused checks [87]
>>  o configure: replace adhoc domain with `localhost` in tests [79]
>>  o configure: sort AC_CHECK_FUNCS
>>  o connect: expire the timeout when trying next [54]
>>  o connect: only start the happy eyeballs timer when needed [95]
>>  o cookie: do not store the expire or max-age strings [16]
>>  o cookie: remove unnecessary struct fields [17]
>>  o cookie: set ->running in cookie_init even if data is NULL [5]
>>  o create-dirs.d: clarify it also uses --output-dirs [66]
>>  o curl.h: mark CURLSSLBACKEND_NSS as deprecated since 8.3.0 [18]
>>  o curl_easy_pause.3: mention h2/h3 buffering [113]
>>  o curl_easy_pause.3: mention it works within callbacks [112]
>>  o curl_easy_pause: set "in callback" true on exit if true [100]
>>  o CURLOPT_DEBUGFUNCTION.3: warn about internal handles [122]
>>  o docs/libcurl/opts/Makefile.inc: add missing manpage files
>>  o docs: adapt SEE ALSO sections to new requirements [52]
>>  o docs: explain how PINNEDPUBLICKEY is independent of VERIFYPEER [68]
>>  o docs: replace made up domains with example.com [82]
>>  o docs: update curl man page references [89]
>>  o docs: use CURLSSLBACKEND_NONE [19]
>>  o doh: inherit DEBUGFUNCTION/DATA [12]
>>  o escape: replace Curl_isunreserved with ISUNRESERVED [2]
>>  o FAQ: How do I upgrade curl.exe in Windows? [84]
>>  o GHA/linux: run singleuse to detect single-use global functions [35]
>>  o GHA: add workflow to compare configure vs cmake outputs [102]
>>  o h2-proxy: remove left-over mistake in drain_tunnel() [7]
>>  o h2: testcase and fix for pausing h2 streams [49]
>>  o h3: add support for ngtcp2 with AWS-LC builds [103]
>>  o http2: refused stream handling for retry [121]
>>  o http: fix CURL_DISABLE_BEARER_AUTH breakage [28]
>>  o http: h1/h2 proxy unification [21]
>>  o http: remove wrong comment for http_should_fail [55]
>>  o http: use per-request counter to check too large headers [6]
>>  o http_aws_sigv4: fix sorting with empty parts [13]
>>  o idn: fix WinIDN null ptr deref on bad host [90]
>>  o idn: if idn2_check_version returns NULL, return error [27]
>>  o inet_ntop: add typecast to silence Coverity [51]
>>  o lib: disambiguate Curl_client_write flag semantics [24]
>>  o lib: enable hmac for digest as well [26]
>>  o lib: failf/infof compiler warnings [8]
>>  o lib: let the max filesize option stop too big transfers too [44]
>>  o lib: move handling of `data->req.writer_stack` into
>> Curl_client_write() [97]
>>  o lib: provide and use Curl_hexencode [62]
>>  o lib: remove TIME_WITH_SYS_TIME [88]
>>  o lib: use wrapper for curl_mime_data fseek callback [30]
>>  o libssh2: fix error message on failed pubkey-from-file [22]
>>  o libssh: cap SFTP packet size sent [14]
>>  o Makefile.mk: always set `CURL_STATICLIB` for lib (Windows) [42]
>>  o MANUAL.md: change domain to example.com [11]
>>  o misc: better random strings [15]
>>  o MQTT: improve receive of ACKs [125]
>>  o multi: do CURLM_CALL_MULTI_PERFORM at two more places [99]
>>  o multi: fix small timeouts [70]
>>  o multi: remove Curl_multi_dump [37]
>>  o multi: round the timeout up to prevent early wakeups [98]
>>  o multi: set CURLM_CALL_MULTI_PERFORM after switch to DOING_MORE [115]
>>  o openssl: improve ssl shutdown handling [69]
>>  o openssl: use X509_ALGOR_get0 instead of reaching into X509_ALGOR [104=
]
>>  o pytest: exclude test_03_goaway in CI runs due to timing dependency [2=
3]
>>  o quic: set ciphers/curves the same way regular TLS does [43]
>>  o quiche: fix build error with --with-ca-fallback [1]
>>  o RELEASE-PROCEDURE.md: updated coming release dates
>>  o runtests: display the test status if tests appear hung [81]
>>  o runtests: eliminate a warning on old perl versions
>>  o socks: return error if hostname too long for remote resolve [118]
>>  o src/mkhelp: make generated code pass `checksrc` [59]
>>  o test1056: disable on Windows
>>  o test1474: disable test on NetBSD, OpenBSD and Solaris 10 [31]
>>  o test1592: greatly increase the maximum test timeout
>>  o test1903: actually verify the cookies after the test [116]
>>  o test1906: set a lower timeout since it's hit on Windows [117]
>>  o test2600: remove special case handling for USE_ALARM_TIMEOUT [3]
>>  o test650: fix an end tag typo
>>  o test661: return from test early in case of curl error
>>  o test: add missing <feature>s
>>  o tests: close the shell used to start sshd [41]
>>  o tests: fix a race condition in ftp server disconnect [101]
>>  o tests: fix compiler warnings [38]
>>  o tests: Fix zombie processes left behind by FTP tests. [80]
>>  o tests: improve SLOWDOWN test reliability by reducing sent data
>>  o tests: increase lib571 timeout from 3s to 30s [106]
>>  o tests: log the test result code after each libtest
>>  o tests: propagate errors in libtests
>>  o tests: set --expect100-timeout to improve test reliability
>>  o tests: show which curl tool `runtests.pl` is using [60]
>>  o tests: stop overriding the lock timeout
>>  o tftpd: always use curl's own tftp.h [25]
>>  o tool: use our own stderr variable [94]
>>  o tool_cb_wrt: fix debug assertion [4]
>>  o tool_getparam: accept variable expansion on file names too [123]
>>  o tool_setopt: remove unused function tool_setopt_flags [56]
>>  o upload-file.d: describe the file name slash/backslash handling [9]
>>  o url: fall back to http/https proxy env-variable if ws/wss not set [11=
9]
>>  o url: fix netrc info message [39]
>>  o warnless: remove unused functions [33]
>>  o wolfssh: do cleanup in Curl_ssh_cleanup [40]
>>  o wolfssl: allow capath with CURLOPT_CAINFO_BLOB [29]
>>  o wolfssl: if CURLOPT_CAINFO_BLOB is set, ignore the CA files [34]
>>  o wolfssl: ignore errors in CA path [64]
>>
>> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> ---
>>
>> v2: update the SRC_URI
>>
>>  meta/recipes-support/curl/{curl_8.3.0.bb =3D> curl_8.4.0.bb} | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-support/curl/{curl_8.3.0.bb =3D> curl_8.4.0.bb} (98=
%)
>>
>> diff --git a/meta/recipes-support/curl/curl_8.3.0.bb
>> b/meta/recipes-support/curl/curl_8.4.0.bb
>> similarity index 98%
>> rename from meta/recipes-support/curl/curl_8.3.0.bb
>> rename to meta/recipes-support/curl/curl_8.4.0.bb
>> index 646ac01914..5f97730bf4 100644
>> --- a/meta/recipes-support/curl/curl_8.3.0.bb
>> +++ b/meta/recipes-support/curl/curl_8.4.0.bb
>> @@ -14,7 +14,7 @@ SRC_URI =3D " \
>>      file://run-ptest \
>>      file://disable-tests \
>>  "
>> -SRC_URI[sha256sum] =3D
>> "376d627767d6c4f05105ab6d497b0d9aba7111770dd9d995225478209c37ea63"
>> +SRC_URI[sha256sum] =3D
>> "16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d"
>>
>>  # Curl has used many names over the years...
>>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl
>> libcurl:libcurl daniel_stenberg:curl"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188965):
>> https://lists.openembedded.org/g/openembedded-core/message/188965
>> Mute This Topic: https://lists.openembedded.org/mt/101899556/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000039f4d206077320a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia q=
uarta, 11/10/2023 =C3=A0(s) 17:05:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"auto">I do recommend using =E2=80=98devtool =
upgrade=E2=80=99 as it will take care of updating the checksums in the reci=
pe, and will rebase the patches. Did you run at least one build with v2, gi=
ven that v1 was clearly not tested?</div></blockquote><div><br></div><div>T=
he build I had run was with the v2 SRC_URI hash but I forgot to update my l=
ocal commit and only saw that after sending it to the mailing list.</div><d=
iv><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed 11. Oct 2023 at 17.54, Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">curl and libcurl 8=
.4.0<br>
<br>
=C2=A0Public curl releases:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0252<br>
=C2=A0Command line options:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0258<br>
=C2=A0curl_easy_setopt() options:=C2=A0 =C2=A0303<br>
=C2=A0Public functions in libcurl:=C2=A0 93<br>
=C2=A0Contributors:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02995<br>
<br>
This release includes the following changes:<br>
<br>
=C2=A0o curl: add support for the IPFS protocols via HTTP gateway [46]<br>
=C2=A0o curl_multi_get_handles: get easy handles from a multi handle [20]<b=
r>
=C2=A0o mingw: delete support for legacy <a href=3D"http://mingw.org" rel=
=3D"noreferrer" target=3D"_blank">mingw.org</a> toolchain [45]<br>
<br>
This release includes the following bugfixes:<br>
<br>
=C2=A0o acinclude.m4: Document proper system truststore on FreeBSD [83]<br>
=C2=A0o appveyor: fix yamlint issues, indent [67]<br>
=C2=A0o appveyor: rewrite batch in PowerShell + CI improvements [109]<br>
=C2=A0o autotools: adjust `CURL_CA_PATH` value to CMake [53]<br>
=C2=A0o autotools: restore `HAVE_IOCTL_*` detections [111]<br>
=C2=A0o base64: also build for curl [78]<br>
=C2=A0o bufq: remove Curl_bufq_skip_and_shift (unused) [47]<br>
=C2=A0o build: delete checks for C89 standard headers [65]<br>
=C2=A0o build: do not publish `HAVE_BORINGSSL`, `HAVE_AWSLC` macros [114]<b=
r>
=C2=A0o cf-socket: simulate slow/blocked receives in debug [120]<br>
=C2=A0o cmake, configure: also link with CoreServices [32]<br>
=C2=A0o cmake: add check for suseconds_t [91]<br>
=C2=A0o cmake: add feature checks for `memrchr` and `getifaddrs` [57]<br>
=C2=A0o cmake: add missing checks [86]<br>
=C2=A0o cmake: delete old `HAVE_LDAP_URL_PARSE` logic [105]<br>
=C2=A0o cmake: detect `HAVE_CLOCK_GETTIME_MONOTONIC_RAW` [75]<br>
=C2=A0o cmake: detect `HAVE_GETADDRINFO_THREADSAFE` [76]<br>
=C2=A0o cmake: detect `sys/wait.h` and `netinet/udp.h` [61]<br>
=C2=A0o cmake: detect TLS-SRP in OpenSSL/wolfSSL/GnuTLS [93]<br>
=C2=A0o cmake: disable unity mode with Windows Unicode + TrackMemory [108]<=
br>
=C2=A0o cmake: fix `HAVE_LDAP_SSL`, `HAVE_LDAP_URL_PARSE` on non-Windows [1=
10]<br>
=C2=A0o cmake: fix `HAVE_WRITABLE_ARGV` detection [77]<br>
=C2=A0o cmake: fix duplicate symbols when linking tests [73]<br>
=C2=A0o cmake: fix missing `zlib.h` when compiling `libcurltool` [72]<br>
=C2=A0o cmake: fix stderr initialization in unity builds [71]<br>
=C2=A0o cmake: fix the help text to the static build option in CMakeLists.t=
xt [10]<br>
=C2=A0o cmake: fix unity builds for more build combinations [96]<br>
=C2=A0o cmake: fix unity symbol collisions in h2 builds [48]<br>
=C2=A0o cmake: fix unity with Windows Unicode + TrackMemory [107]<br>
=C2=A0o cmake: improve OpenLDAP builds [92]<br>
=C2=A0o cmake: lib `CURL_STATICLIB` fixes (Windows) [74]<br>
=C2=A0o cmake: move global headers to specific checks [58]<br>
=C2=A0o cmake: pre-cache `HAVE_BASENAME` for mingw-w64 and MSVC [85]<br>
=C2=A0o cmake: pre-cache `HAVE_POLL_FINE` on Windows [36]<br>
=C2=A0o cmake: tidy-up `NOT_NEED_LBER_H` detection<br>
=C2=A0o cmake: validate `CURL_DEFAULT_SSL_BACKEND` config value [50]<br>
=C2=A0o configure: check for the capath by default [63]<br>
=C2=A0o configure: remove unused checks [87]<br>
=C2=A0o configure: replace adhoc domain with `localhost` in tests [79]<br>
=C2=A0o configure: sort AC_CHECK_FUNCS<br>
=C2=A0o connect: expire the timeout when trying next [54]<br>
=C2=A0o connect: only start the happy eyeballs timer when needed [95]<br>
=C2=A0o cookie: do not store the expire or max-age strings [16]<br>
=C2=A0o cookie: remove unnecessary struct fields [17]<br>
=C2=A0o cookie: set -&gt;running in cookie_init even if data is NULL [5]<br=
>
=C2=A0o create-dirs.d: clarify it also uses --output-dirs [66]<br>
=C2=A0o curl.h: mark CURLSSLBACKEND_NSS as deprecated since 8.3.0 [18]<br>
=C2=A0o curl_easy_pause.3: mention h2/h3 buffering [113]<br>
=C2=A0o curl_easy_pause.3: mention it works within callbacks [112]<br>
=C2=A0o curl_easy_pause: set &quot;in callback&quot; true on exit if true [=
100]<br>
=C2=A0o CURLOPT_DEBUGFUNCTION.3: warn about internal handles [122]<br>
=C2=A0o docs/libcurl/opts/Makefile.inc: add missing manpage files<br>
=C2=A0o docs: adapt SEE ALSO sections to new requirements [52]<br>
=C2=A0o docs: explain how PINNEDPUBLICKEY is independent of VERIFYPEER [68]=
<br>
=C2=A0o docs: replace made up domains with <a href=3D"http://example.com" r=
el=3D"noreferrer" target=3D"_blank">example.com</a> [82]<br>
=C2=A0o docs: update curl man page references [89]<br>
=C2=A0o docs: use CURLSSLBACKEND_NONE [19]<br>
=C2=A0o doh: inherit DEBUGFUNCTION/DATA [12]<br>
=C2=A0o escape: replace Curl_isunreserved with ISUNRESERVED [2]<br>
=C2=A0o FAQ: How do I upgrade curl.exe in Windows? [84]<br>
=C2=A0o GHA/linux: run singleuse to detect single-use global functions [35]=
<br>
=C2=A0o GHA: add workflow to compare configure vs cmake outputs [102]<br>
=C2=A0o h2-proxy: remove left-over mistake in drain_tunnel() [7]<br>
=C2=A0o h2: testcase and fix for pausing h2 streams [49]<br>
=C2=A0o h3: add support for ngtcp2 with AWS-LC builds [103]<br>
=C2=A0o http2: refused stream handling for retry [121]<br>
=C2=A0o http: fix CURL_DISABLE_BEARER_AUTH breakage [28]<br>
=C2=A0o http: h1/h2 proxy unification [21]<br>
=C2=A0o http: remove wrong comment for http_should_fail [55]<br>
=C2=A0o http: use per-request counter to check too large headers [6]<br>
=C2=A0o http_aws_sigv4: fix sorting with empty parts [13]<br>
=C2=A0o idn: fix WinIDN null ptr deref on bad host [90]<br>
=C2=A0o idn: if idn2_check_version returns NULL, return error [27]<br>
=C2=A0o inet_ntop: add typecast to silence Coverity [51]<br>
=C2=A0o lib: disambiguate Curl_client_write flag semantics [24]<br>
=C2=A0o lib: enable hmac for digest as well [26]<br>
=C2=A0o lib: failf/infof compiler warnings [8]<br>
=C2=A0o lib: let the max filesize option stop too big transfers too [44]<br=
>
=C2=A0o lib: move handling of `data-&gt;req.writer_stack` into Curl_client_=
write() [97]<br>
=C2=A0o lib: provide and use Curl_hexencode [62]<br>
=C2=A0o lib: remove TIME_WITH_SYS_TIME [88]<br>
=C2=A0o lib: use wrapper for curl_mime_data fseek callback [30]<br>
=C2=A0o libssh2: fix error message on failed pubkey-from-file [22]<br>
=C2=A0o libssh: cap SFTP packet size sent [14]<br>
=C2=A0o Makefile.mk: always set `CURL_STATICLIB` for lib (Windows) [42]<br>
=C2=A0o MANUAL.md: change domain to <a href=3D"http://example.com" rel=3D"n=
oreferrer" target=3D"_blank">example.com</a> [11]<br>
=C2=A0o misc: better random strings [15]<br>
=C2=A0o MQTT: improve receive of ACKs [125]<br>
=C2=A0o multi: do CURLM_CALL_MULTI_PERFORM at two more places [99]<br>
=C2=A0o multi: fix small timeouts [70]<br>
=C2=A0o multi: remove Curl_multi_dump [37]<br>
=C2=A0o multi: round the timeout up to prevent early wakeups [98]<br>
=C2=A0o multi: set CURLM_CALL_MULTI_PERFORM after switch to DOING_MORE [115=
]<br>
=C2=A0o openssl: improve ssl shutdown handling [69]<br>
=C2=A0o openssl: use X509_ALGOR_get0 instead of reaching into X509_ALGOR [1=
04]<br>
=C2=A0o pytest: exclude test_03_goaway in CI runs due to timing dependency =
[23]<br>
=C2=A0o quic: set ciphers/curves the same way regular TLS does [43]<br>
=C2=A0o quiche: fix build error with --with-ca-fallback [1]<br>
=C2=A0o RELEASE-PROCEDURE.md: updated coming release dates<br>
=C2=A0o runtests: display the test status if tests appear hung [81]<br>
=C2=A0o runtests: eliminate a warning on old perl versions<br>
=C2=A0o socks: return error if hostname too long for remote resolve [118]<b=
r>
=C2=A0o src/mkhelp: make generated code pass `checksrc` [59]<br>
=C2=A0o test1056: disable on Windows<br>
=C2=A0o test1474: disable test on NetBSD, OpenBSD and Solaris 10 [31]<br>
=C2=A0o test1592: greatly increase the maximum test timeout<br>
=C2=A0o test1903: actually verify the cookies after the test [116]<br>
=C2=A0o test1906: set a lower timeout since it&#39;s hit on Windows [117]<b=
r>
=C2=A0o test2600: remove special case handling for USE_ALARM_TIMEOUT [3]<br=
>
=C2=A0o test650: fix an end tag typo<br>
=C2=A0o test661: return from test early in case of curl error<br>
=C2=A0o test: add missing &lt;feature&gt;s<br>
=C2=A0o tests: close the shell used to start sshd [41]<br>
=C2=A0o tests: fix a race condition in ftp server disconnect [101]<br>
=C2=A0o tests: fix compiler warnings [38]<br>
=C2=A0o tests: Fix zombie processes left behind by FTP tests. [80]<br>
=C2=A0o tests: improve SLOWDOWN test reliability by reducing sent data<br>
=C2=A0o tests: increase lib571 timeout from 3s to 30s [106]<br>
=C2=A0o tests: log the test result code after each libtest<br>
=C2=A0o tests: propagate errors in libtests<br>
=C2=A0o tests: set --expect100-timeout to improve test reliability<br>
=C2=A0o tests: show which curl tool `<a href=3D"http://runtests.pl" rel=3D"=
noreferrer" target=3D"_blank">runtests.pl</a>` is using [60]<br>
=C2=A0o tests: stop overriding the lock timeout<br>
=C2=A0o tftpd: always use curl&#39;s own tftp.h [25]<br>
=C2=A0o tool: use our own stderr variable [94]<br>
=C2=A0o tool_cb_wrt: fix debug assertion [4]<br>
=C2=A0o tool_getparam: accept variable expansion on file names too [123]<br=
>
=C2=A0o tool_setopt: remove unused function tool_setopt_flags [56]<br>
=C2=A0o upload-file.d: describe the file name slash/backslash handling [9]<=
br>
=C2=A0o url: fall back to http/https proxy env-variable if ws/wss not set [=
119]<br>
=C2=A0o url: fix netrc info message [39]<br>
=C2=A0o warnless: remove unused functions [33]<br>
=C2=A0o wolfssh: do cleanup in Curl_ssh_cleanup [40]<br>
=C2=A0o wolfssl: allow capath with CURLOPT_CAINFO_BLOB [29]<br>
=C2=A0o wolfssl: if CURLOPT_CAINFO_BLOB is set, ignore the CA files [34]<br=
>
=C2=A0o wolfssl: ignore errors in CA path [64]<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
<br>
v2: update the SRC_URI<br>
<br>
=C2=A0meta/recipes-support/curl/{<a href=3D"http://curl_8.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_8.3.0.bb</a> =3D&gt; <a href=3D"http://cur=
l_8.4.0.bb" rel=3D"noreferrer" target=3D"_blank">curl_8.4.0.bb</a>} | 2 +-<=
br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-support/curl/{<a href=3D"http://curl_8.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">curl_8.3.0.bb</a> =3D&gt; <a href=3D"htt=
p://curl_8.4.0.bb" rel=3D"noreferrer" target=3D"_blank">curl_8.4.0.bb</a>} =
(98%)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_8.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_8.3.0.bb</a> b/meta/recipes-support/=
curl/<a href=3D"http://curl_8.4.0.bb" rel=3D"noreferrer" target=3D"_blank">=
curl_8.4.0.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-support/curl/<a href=3D"http://curl_8.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_8.3.0.bb</a><br>
rename to meta/recipes-support/curl/<a href=3D"http://curl_8.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">curl_8.4.0.bb</a><br>
index 646ac01914..5f97730bf4 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_8.3.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.3.0.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_8.4.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.4.0.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0file://disable-tests \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;376d627767d6c4f05105ab6d497b0d9aba7111770dd9d=
995225478209c37ea63&quot;<br>
+SRC_URI[sha256sum] =3D &quot;16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d7=
0dec63e2e6336f2a82d&quot;<br>
<br>
=C2=A0# Curl has used many names over the years...<br>
=C2=A0CVE_PRODUCT =3D &quot;haxx:curl haxx:libcurl curl:curl curl:libcurl l=
ibcurl:libcurl daniel_stenberg:curl&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188965): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188965" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188965</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101899556/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101899556/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000039f4d206077320a7--

